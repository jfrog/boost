#!/usr/bin/env bash
set -euo pipefail

REPO="jfrog/boost"
INSTALL_DIR="${BOOST_INSTALL_DIR:-$HOME/.local/bin}"
GH_AUTH_TOKEN=""
GH_AUTH_SOURCE=""

main() {
  check_dependencies
  detect_platform
  detect_github_token
  fetch_latest_version
  download_and_install
  verify
  run_init
}

check_dependencies() {
  for cmd in curl tar; do
    if ! command -v "$cmd" &>/dev/null; then
      err "$cmd is required but not installed"
    fi
  done
}

detect_platform() {
  OS="$(uname -s | tr '[:upper:]' '[:lower:]')"
  ARCH="$(uname -m)"

  case "$OS" in
    linux)  ;;
    darwin) ;;
    mingw*|msys*|cygwin*) err "Windows: download from https://github.com/$REPO/releases" ;;
    *) err "Unsupported OS: $OS" ;;
  esac

  case "$ARCH" in
    x86_64|amd64)   ARCH="amd64" ;;
    aarch64|arm64)   ARCH="arm64" ;;
    *) err "Unsupported architecture: $ARCH" ;;
  esac

  ARCHIVE="boost-${OS}-${ARCH}.tar.gz"
}

# Find a GitHub token from common local sources to make authenticated API
# requests. This raises the rate limit from 60 to 5000 requests/hour and
# avoids "403 rate limit exceeded" errors when running this installer
# repeatedly (e.g. in CI or shared networks). Allow opt-out via
# BOOST_NO_GH_AUTH=1 in case a stale/invalid token would otherwise cause a
# 401.
detect_github_token() {
  if [ "${BOOST_NO_GH_AUTH:-}" = "1" ]; then
    return
  fi

  if [ -n "${GITHUB_TOKEN:-}" ]; then
    GH_AUTH_TOKEN="$GITHUB_TOKEN"
    GH_AUTH_SOURCE="GITHUB_TOKEN"
  elif [ -n "${GH_TOKEN:-}" ]; then
    GH_AUTH_TOKEN="$GH_TOKEN"
    GH_AUTH_SOURCE="GH_TOKEN"
  elif [ -n "${GH_ENTERPRISE_TOKEN:-}" ]; then
    GH_AUTH_TOKEN="$GH_ENTERPRISE_TOKEN"
    GH_AUTH_SOURCE="GH_ENTERPRISE_TOKEN"
  elif [ -n "${GITHUB_ENTERPRISE_TOKEN:-}" ]; then
    GH_AUTH_TOKEN="$GITHUB_ENTERPRISE_TOKEN"
    GH_AUTH_SOURCE="GITHUB_ENTERPRISE_TOKEN"
  elif command -v gh &>/dev/null; then
    if token="$(gh auth token 2>/dev/null)" && [ -n "$token" ]; then
      GH_AUTH_TOKEN="$token"
      GH_AUTH_SOURCE="gh CLI"
    fi
  fi

  if [ -z "$GH_AUTH_TOKEN" ] && [ -r "$HOME/.netrc" ]; then
    if token="$(awk '/machine[[:space:]]+(api\.)?github\.com/{f=1} f && /password/{print $2; exit}' "$HOME/.netrc" 2>/dev/null)" && [ -n "$token" ]; then
      GH_AUTH_TOKEN="$token"
      GH_AUTH_SOURCE="~/.netrc"
    fi
  fi

  if [ -n "$GH_AUTH_TOKEN" ]; then
    info "Using GitHub token from $GH_AUTH_SOURCE for authenticated requests"
  fi
}

# Wrap curl so we transparently add the Authorization header when we have a
# token. We only attach it for github.com / api.github.com hosts so the token
# is never leaked to the redirected asset CDN (objects.githubusercontent.com).
gh_curl() {
  local url="$1"
  shift

  if [ -n "$GH_AUTH_TOKEN" ] && is_github_host "$url"; then
    curl -H "Authorization: Bearer $GH_AUTH_TOKEN" \
         -H "X-GitHub-Api-Version: 2022-11-28" \
         "$@" "$url"
  else
    curl "$@" "$url"
  fi
}

is_github_host() {
  case "$1" in
    https://api.github.com/*|https://github.com/*) return 0 ;;
    *) return 1 ;;
  esac
}

fetch_latest_version() {
  local response http_code body
  response="$(gh_curl "https://api.github.com/repos/$REPO/releases/latest" \
    -sS -w '\n%{http_code}' || true)"
  http_code="$(printf '%s' "$response" | tail -n1)"
  body="$(printf '%s' "$response" | sed '$d')"

  if [ "$http_code" = "401" ] && [ -n "$GH_AUTH_TOKEN" ]; then
    warn "GitHub rejected the token from $GH_AUTH_SOURCE (401). Retrying without auth."
    GH_AUTH_TOKEN=""
    GH_AUTH_SOURCE=""
    body="$(curl -fsSL "https://api.github.com/repos/$REPO/releases/latest" || true)"
  elif [ "$http_code" = "403" ]; then
    if [ -n "$GH_AUTH_TOKEN" ]; then
      err "GitHub returned 403 even with auth ($GH_AUTH_SOURCE). The token may lack required scopes."
    else
      err "GitHub returned 403 (likely rate limited). Set GITHUB_TOKEN or run 'gh auth login' and retry."
    fi
  elif [ "$http_code" != "200" ]; then
    err "Failed to query GitHub releases API (HTTP $http_code). Check https://github.com/$REPO/releases"
  fi

  TAG=$(printf '%s' "$body" | grep '"tag_name"' | head -1 | cut -d'"' -f4)

  if [ -z "${TAG:-}" ]; then
    err "Could not determine latest release. Check https://github.com/$REPO/releases"
  fi

  info "Latest version: $TAG"
}

# Download a release asset. We use the API endpoint with
# Accept: application/octet-stream when authenticated so the token applies
# directly; curl's --location-trusted is intentionally avoided to keep the
# token from being forwarded to the CDN.
download_and_install() {
  TMPDIR="$(mktemp -d)"
  trap 'rm -rf "$TMPDIR"' EXIT

  info "Downloading $ARCHIVE..."

  if [ -n "$GH_AUTH_TOKEN" ]; then
    download_via_api "$TMPDIR/$ARCHIVE"
  else
    URL="https://github.com/$REPO/releases/download/$TAG/$ARCHIVE"
    if ! curl -fsSL "$URL" -o "$TMPDIR/$ARCHIVE"; then
      err "Failed to download $URL"
    fi
  fi

  tar xz -C "$TMPDIR" -f "$TMPDIR/$ARCHIVE"

  if [ ! -f "$TMPDIR/boost" ]; then
    err "Archive did not contain a 'boost' binary"
  fi

  mkdir -p "$INSTALL_DIR"
  mv "$TMPDIR/boost" "$INSTALL_DIR/boost"

  chmod +x "$INSTALL_DIR/boost"
}

download_via_api() {
  local out="$1"
  local asset_id
  asset_id="$(gh_curl "https://api.github.com/repos/$REPO/releases/tags/$TAG" -fsSL \
    | awk -v name="\"name\": \"$ARCHIVE\"" '
        /"id":/ { last_id = $2; sub(",", "", last_id) }
        $0 ~ name { print last_id; exit }
      ')"

  if [ -z "$asset_id" ]; then
    err "Could not find asset $ARCHIVE in release $TAG"
  fi

  curl -fsSL \
    -H "Authorization: Bearer $GH_AUTH_TOKEN" \
    -H "Accept: application/octet-stream" \
    -H "X-GitHub-Api-Version: 2022-11-28" \
    "https://api.github.com/repos/$REPO/releases/assets/$asset_id" \
    -o "$out"
}

verify() {
  # Resolve the binary the rest of the script will invoke. We prefer a
  # `boost` already on $PATH so a pre-existing user-installed copy keeps
  # winning, but fall back to the absolute path we just wrote — the
  # downstream `boost init` step needs to work even when $INSTALL_DIR is
  # not yet on $PATH (e.g. first-time install before the user re-sources
  # their shell rc).
  if command -v boost &>/dev/null; then
    BOOST_BIN="$(command -v boost)"
  else
    BOOST_BIN="$INSTALL_DIR/boost"
    warn "$INSTALL_DIR is not in your PATH. Add it:"
    warn "  export PATH=\"$INSTALL_DIR:\$PATH\""
  fi

  VERSION="$("$BOOST_BIN" version 2>/dev/null || true)"
  info "Installed: $VERSION"
}

# Kick off `boost init` immediately after the binary is in place. This is
# the entire point of the script: a one-liner that leaves the user with a
# working integration, not a working binary they then have to wire up.
#
# Edge cases:
#   - When the script is piped from curl (`curl … | bash`), $stdin is the
#     pipe, not a terminal — promptui would refuse and the wizard would
#     bail. We re-attach to /dev/tty so the user can still answer prompts.
#   - In CI / headless environments there is no /dev/tty; in that case we
#     skip the auto-init and print a clear pointer instead.
#   - BOOST_NO_INIT=1 lets power users opt out (useful when scripting an
#     install from a config-management tool that will run init separately).
run_init() {
  if [ "${BOOST_NO_INIT:-}" = "1" ]; then
    echo ""
    info "Skipping 'boost init' (BOOST_NO_INIT=1). Run it manually when ready."
    return
  fi

  echo ""
  info "Starting 'boost init' to wire up your editors and CI..."
  echo ""

  if [ -t 0 ] && [ -t 1 ]; then
    "$BOOST_BIN" init
  elif [ -e /dev/tty ]; then
    "$BOOST_BIN" init </dev/tty >/dev/tty 2>&1
  else
    warn "No terminal detected — skipping interactive 'boost init'."
    warn "Run it manually in your project directory:"
    warn "  boost init"
  fi
}

info() { echo "  → $*"; }
warn() { echo "  ⚠ $*" >&2; }
err()  { echo "  ✗ $*" >&2; exit 1; }

main

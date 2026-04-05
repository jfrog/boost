#!/usr/bin/env bash
set -euo pipefail

REPO="jfrog/boost"
INSTALL_DIR="${BOOST_INSTALL_DIR:-$HOME/.local/bin}"

main() {
  check_dependencies
  detect_platform
  fetch_latest_version
  download_and_install
  verify
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

fetch_latest_version() {
  TAG=$(curl -fsSL "https://api.github.com/repos/$REPO/releases/latest" \
    | grep '"tag_name"' | head -1 | cut -d'"' -f4)

  if [ -z "${TAG:-}" ]; then
    err "Could not determine latest release. Check https://github.com/$REPO/releases"
  fi

  info "Latest version: $TAG"
}

download_and_install() {
  URL="https://github.com/$REPO/releases/download/$TAG/$ARCHIVE"
  TMPDIR="$(mktemp -d)"
  trap 'rm -rf "$TMPDIR"' EXIT

  info "Downloading $ARCHIVE..."
  curl -fsSL "$URL" | tar xz -C "$TMPDIR"

  if [ ! -f "$TMPDIR/boost" ]; then
    err "Archive did not contain a 'boost' binary"
  fi

  mkdir -p "$INSTALL_DIR"
  mv "$TMPDIR/boost" "$INSTALL_DIR/boost"

  chmod +x "$INSTALL_DIR/boost"
}

verify() {
  if ! command -v boost &>/dev/null; then
    warn "$INSTALL_DIR is not in your PATH. Add it:"
    warn "  export PATH=\"$INSTALL_DIR:\$PATH\""
    return
  fi

  VERSION="$(boost version 2>/dev/null || true)"
  info "Installed: $VERSION"
  echo ""
  info "Next: run 'boost init --auto' to set up your editors and CI"
}

info() { echo "  → $*"; }
warn() { echo "  ⚠ $*" >&2; }
err()  { echo "  ✗ $*" >&2; exit 1; }

main

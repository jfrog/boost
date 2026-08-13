#!/usr/bin/env bash
set -euo pipefail

REPO="jfrog/boost"
# BOOST_INSTALL_FROM — where to get the platform binary (default: latest).
#   latest              — newest release (default)
#   v1.2.3              — a specific release tag
#   /path/to/archive    — local .tar.gz (CI or offline testing)
# Default to a user-owned directory so install AND `boost update` work without
# sudo. Set BOOST_INSTALL_DIR to override (e.g. /usr/local/bin for system-wide).
INSTALL_DIR="${BOOST_INSTALL_DIR:-$HOME/.local/bin}"

OS="$(uname -s | tr '[:upper:]' '[:lower:]')"
ARCH="$(uname -m)"

case "$ARCH" in x86_64|amd64) ARCH=amd64 ;; aarch64|arm64) ARCH=arm64 ;; *) echo "unsupported arch: $ARCH" >&2; exit 1 ;; esac
case "$OS"   in linux|darwin) ;; windows*) echo "unsupported OS: $OS — run in PowerShell: irm https://raw.githubusercontent.com/jfrog/boost/main/install.ps1 | iex" >&2; exit 1 ;; *) echo "unsupported OS: $OS — see https://github.com/$REPO/releases" >&2; exit 1 ;; esac

ARCHIVE="boost-${OS}-${ARCH}.tar.gz"
TMP="$(mktemp -d)"; trap 'rm -rf "$TMP"' EXIT
FROM="${BOOST_INSTALL_FROM:-latest}"

print_happy_boosting_banner() {
  local green="" pink="" reset=""
  if [ -t 1 ] && [ -z "${NO_COLOR:-}" ]; then
    green=$'\033[32m'
    # Bright magenta (palette index 13) — terminals theme this for contrast on
    # both light and dark backgrounds. Fixed pastels (#F28AB2 / 217) vanished on
    # white; a single darkened hex then looked muddy on dark. Keep in sync with
    # frogTongueStyle (ANSIColor 13) in internal/ui/frog.go.
    pink=$'\033[95m'
    reset=$'\033[0m'
  fi

  printf '\n'
  printf '        %s███  ███%s\n' "$green" "$reset"
  printf '        %s█ █  █ █%s\n' "$green" "$reset"
  printf '       %s██████████%s%s▬▬▬%s  Happy Boosting!\n' "$green" "$reset" "$pink" "$reset"
  printf '        %s██    ██%s\n' "$green" "$reset"
  printf '\n'
}

if [ -f "$FROM" ]; then
  # CI path: local .tar.gz artifact.
  echo "→ Installing from local archive: $FROM"
  cp "$FROM" "$TMP/$ARCHIVE"
  tar -xzf "$TMP/$ARCHIVE" -C "$TMP"
  [ -f "$TMP/boost" ] || { echo "archive missing 'boost' binary" >&2; exit 1; }
else
  if [ "$FROM" = "latest" ]; then
    TAG="$(curl -fsSLI -o /dev/null -w '%{url_effective}' "https://github.com/$REPO/releases/latest" | sed 's#.*/tag/##')"
    [ -n "$TAG" ] || { echo "could not resolve latest release tag" >&2; exit 1; }
  else
    TAG="$FROM"
  fi
  GITHUB_URL="https://github.com/$REPO/releases/download/$TAG/$ARCHIVE"
  echo "→ Downloading $ARCHIVE ($TAG)"
  curl -fsSL "$GITHUB_URL" -o "$TMP/$ARCHIVE"
  tar -xzf "$TMP/$ARCHIVE" -C "$TMP"
  [ -f "$TMP/boost" ] || { echo "archive missing 'boost' binary" >&2; exit 1; }
  chmod +x "$TMP/boost"
  echo "→ Downloaded successfully from GitHub releases ($GITHUB_URL)"
fi
[ -f "$TMP/boost" ] || { echo "download failed: binary not found" >&2; exit 1; }

# Use the "${arr[@]+"${arr[@]}"}" idiom so an empty SUDO array doesn't
# trip `set -u` on macOS's stock bash 3.2 (a known bash 3.2 bug fixed in
# bash 4.4). Before the ~/.local/bin default this path was rarely empty
# because /usr/local/bin almost always needed sudo; now that the default
# is user-writable, the empty case is the common one.
mkdir -p "$INSTALL_DIR"
install -m 0755 "$TMP/boost" "$INSTALL_DIR/boost"
echo "→ Installed: $("$INSTALL_DIR/boost" version 2>/dev/null || echo unknown)to $INSTALL_DIR/boost"


# patch_all_shell_rcs adds Boost's bin directory to PATH for all common shells
# found on this system, using an idempotency marker in each rc/config file.
#
# It is intentionally conservative: if a shell binary/config is not present,
# we skip that shell's rc file. We also never fail hard if we can't patch
# (we just warn so install still succeeds).
patch_all_shell_rcs() {
  local dir="$1"
  local marker="# added by boost installer ($dir)"
  local rc_file line
  line="export PATH=\"$dir:\$PATH\"  ${marker}"
  
  # zsh
  if command -v zsh >/dev/null 2>&1; then
    rc_file="${HOME}/.zshrc"
    if ! ([ -f "$rc_file" ] && grep -Fq "$marker" "$rc_file" 2>/dev/null;) then
      mkdir -p "$(dirname "$rc_file")"
      printf '\n%s\n' "$line" >> "$rc_file"
      echo "→ Added $dir to PATH in $rc_file"
    fi
  fi

  # bash
  if command -v bash >/dev/null 2>&1; then
    rc_file="$HOME/.bashrc"
    if ! ([ -f "$rc_file" ] && grep -Fq "$marker" "$rc_file" 2>/dev/null;) then
      mkdir -p "$(dirname "$rc_file")"
      printf '\n%s\n' "$line" >> "$rc_file"
      echo "→ Added $dir to PATH in $rc_file"
    fi
  fi

  # fish
  if command -v fish >/dev/null 2>&1; then
    rc_file="$HOME/.config/fish/config.fish"
    line="fish_add_path -gP $dir  ${marker}"
    if ! ([ -f "$rc_file" ] && grep -Fq "$marker" "$rc_file" 2>/dev/null;) then
      mkdir -p "$HOME/.config/fish"
      printf '\n%s\n' "$line" >> "$rc_file"
      echo "→ Added $dir to PATH in $rc_file"
    fi
  fi

  # We always attempt the POSIX fallback if `sh` exists, but keep the
  # decision whether we "patched anything" to show useful warnings.
  if command -v sh >/dev/null 2>&1; then
    rc_file="$HOME/.profile"
    line="export PATH=\"$dir:\$PATH\"  ${marker}"
    if ! ([ -f "$rc_file" ] && grep -Fq "$marker" "$rc_file" 2>/dev/null;) then
      mkdir -p "$(dirname "$rc_file")"
      printf '\n%s\n' "$line" >> "$rc_file"
      echo "→ Added $dir to PATH in $rc_file"
    fi
    
  fi
}

# Ensure the install dir is on PATH for current and future shells. When it's
# already on PATH (e.g. distro-default ~/.local/bin on Ubuntu/Debian, or a
# system path the user already set up), we skip the rc patch entirely.
INSTALL_DIR_ON_PATH=false
case ":${PATH:-}:" in *":$INSTALL_DIR:"*) INSTALL_DIR_ON_PATH=true ;; esac

PATCH_SHELL_RC_OK=false
BOOST_CMD="boost"

if ! $INSTALL_DIR_ON_PATH; then
  # Patch all common shell startup files so every available shell picks up
  # the installed binary.
  if patch_all_shell_rcs "$INSTALL_DIR"; then
    PATCH_SHELL_RC_OK=true
  else
    echo "⚠ Could not update shell rc. Add to PATH manually: export PATH=\"$INSTALL_DIR:\$PATH\"" >&2
  fi
  # This script runs in its own bash process (e.g. curl … | bash); exporting
  # PATH here does not update the user's interactive shell — see next steps.
  export PATH="$INSTALL_DIR:${PATH:-}"
  if ! $PATCH_SHELL_RC_OK; then
    BOOST_CMD="\"$INSTALL_DIR/boost\""
  fi
fi

echo
print_happy_boosting_banner
echo "→ Boost is installed!"
echo ""
# Only auto-run init when INSTALL_DIR was already on PATH (so `boost` resolves
# the same way the caller's shell would). Off-PATH installs still need the user
# to source their rc — keep today's message verbatim in that case. The temporary
# `export PATH` above must not count as "on PATH" for this decision.
#
# Reattach stdin to the controlling TTY when present: `curl … | bash` leaves
# stdin as the curl pipe (already drained), so without this redirect `boost init`
# would see EOF on the terms prompt. Go also opens /dev/tty as a fallback.
run_boost_init() {
  if [ -r /dev/tty ]; then
    boost init </dev/tty
  else
    boost init
  fi
}
if $INSTALL_DIR_ON_PATH && command -v boost >/dev/null 2>&1; then
  run_boost_init
else
  echo "To run boost in this terminal right now:"
  echo "  - zsh:   source ~/.zshrc"
  echo "  - bash:  source ~/.bashrc   (or source ~/.bash_profile / ~/.profile)"
  echo ""
  echo "Then run:"
  echo "   $ $BOOST_CMD init"
  echo
fi

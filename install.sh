#!/usr/bin/env bash
set -euo pipefail

REPO="jfrog/boost"
# Default to a user-owned directory so install AND `boost update` work without
# sudo. Set BOOST_INSTALL_DIR to override (e.g. /usr/local/bin for system-wide).
INSTALL_DIR="${BOOST_INSTALL_DIR:-$HOME/.local/bin}"
SUDO=()

OS="$(uname -s | tr '[:upper:]' '[:lower:]')"
ARCH="$(uname -m)"
case "$ARCH" in x86_64|amd64) ARCH=amd64 ;; aarch64|arm64) ARCH=arm64 ;; *) echo "unsupported arch: $ARCH" >&2; exit 1 ;; esac
case "$OS"   in linux|darwin) ;;                                                *) echo "unsupported OS: $OS — see https://github.com/$REPO/releases" >&2; exit 1 ;; esac

# Resolve latest tag via the redirect — no auth, no rate limits.
TAG="$(curl -fsSLI -o /dev/null -w '%{url_effective}' "https://github.com/$REPO/releases/latest" | sed 's#.*/tag/##')"
[ -n "$TAG" ] || { echo "could not resolve latest release tag" >&2; exit 1; }

ARCHIVE="boost-${OS}-${ARCH}.tar.gz"
TMP="$(mktemp -d)"; trap 'rm -rf "$TMP"' EXIT

can_write_install_dir() {
  if [ -d "$INSTALL_DIR" ]; then
    [ -w "$INSTALL_DIR" ]
    return
  fi

  parent="$INSTALL_DIR"
  while [ ! -e "$parent" ] && [ "$parent" != "/" ]; do
    parent="$(dirname "$parent")"
  done

  [ -d "$parent" ] && [ -w "$parent" ]
}

determine_sudo() {
  if [ "$(id -u)" -eq 0 ] || can_write_install_dir; then
    return
  fi

  if ! command -v sudo >/dev/null 2>&1; then
    echo "error: $INSTALL_DIR is not writable and sudo is not available." >&2
    echo "Set BOOST_INSTALL_DIR to a writable directory, for example:" >&2
    echo "  BOOST_INSTALL_DIR=\"\$HOME/.local/bin\" curl -fsSL https://raw.githubusercontent.com/$REPO/main/install.sh | bash" >&2
    exit 1
  fi

  echo "→ Installing to $INSTALL_DIR requires sudo"
  if ! sudo -v; then
    echo "error: sudo authentication failed." >&2
    echo "Set BOOST_INSTALL_DIR to a writable directory, for example:" >&2
    echo "  BOOST_INSTALL_DIR=\"\$HOME/.local/bin\" curl -fsSL https://raw.githubusercontent.com/$REPO/main/install.sh | bash" >&2
    exit 1
  fi
  SUDO=(sudo)
}

determine_sudo

echo "→ Downloading $ARCHIVE ($TAG)"
curl -fsSL "https://github.com/$REPO/releases/download/$TAG/$ARCHIVE" -o "$TMP/$ARCHIVE"
tar -xzf "$TMP/$ARCHIVE" -C "$TMP"
[ -f "$TMP/boost" ] || { echo "archive missing 'boost' binary" >&2; exit 1; }

# Use the "${arr[@]+"${arr[@]}"}" idiom so an empty SUDO array doesn't
# trip `set -u` on macOS's stock bash 3.2 (a known bash 3.2 bug fixed in
# bash 4.4). Before the ~/.local/bin default this path was rarely empty
# because /usr/local/bin almost always needed sudo; now that the default
# is user-writable, the empty case is the common one.
"${SUDO[@]+"${SUDO[@]}"}" mkdir -p "$INSTALL_DIR"
"${SUDO[@]+"${SUDO[@]}"}" install -m 0755 "$TMP/boost" "$INSTALL_DIR/boost"
echo "→ Installed: $("$INSTALL_DIR/boost" version 2>/dev/null || echo unknown) to $INSTALL_DIR/boost"

# patch_shell_rc appends a `PATH` export to the user's shell rc file so future
# terminals find the installed binary. Idempotent via a marker comment that
# includes the install directory; explicit BOOST_INSTALL_DIR overrides get
# their own entry. We pick the most appropriate rc file per shell:
#   - zsh:   ~/.zshrc
#   - bash:  first existing of ~/.bashrc / ~/.bash_profile / ~/.profile (else ~/.profile)
#   - fish:  ~/.config/fish/config.fish (uses fish_add_path)
#   - other: ~/.profile (POSIX sh fallback)
patch_shell_rc() {
  local dir="$1" shell_name rc_file line marker
  shell_name="$(basename "${SHELL:-}")"
  marker="# added by boost installer ($dir)"

  case "$shell_name" in
    fish)
      mkdir -p "$HOME/.config/fish"
      rc_file="$HOME/.config/fish/config.fish"
      line="fish_add_path -gP $dir  $marker"
      ;;
    zsh)
      rc_file="$HOME/.zshrc"
      line="export PATH=\"$dir:\$PATH\"  $marker"
      ;;
    bash)
      if [ -f "$HOME/.bashrc" ]; then
        rc_file="$HOME/.bashrc"
      elif [ -f "$HOME/.bash_profile" ]; then
        rc_file="$HOME/.bash_profile"
      else
        rc_file="$HOME/.profile"
      fi
      line="export PATH=\"$dir:\$PATH\"  $marker"
      ;;
    *)
      rc_file="$HOME/.profile"
      line="export PATH=\"$dir:\$PATH\"  $marker"
      ;;
  esac

  BOOST_SHELL_RC="$rc_file"
  BOOST_SHELL_KIND="$shell_name"

  if [ -f "$rc_file" ] && grep -Fq "$marker" "$rc_file" 2>/dev/null; then
    return 0
  fi

  printf '\n%s\n' "$line" >> "$rc_file"
  echo "→ Added $dir to PATH in $rc_file"
}

# Ensure the install dir is on PATH for current and future shells. When it's
# already on PATH (e.g. distro-default ~/.local/bin on Ubuntu/Debian, or a
# system path the user already set up), we skip the rc patch entirely.
INSTALL_DIR_ON_PATH=false
case ":${PATH:-}:" in *":$INSTALL_DIR:"*) INSTALL_DIR_ON_PATH=true ;; esac

BOOST_SHELL_RC=""
BOOST_SHELL_KIND=""
PATCH_SHELL_RC_OK=false
BOOST_CMD="boost"

if ! $INSTALL_DIR_ON_PATH; then
  if patch_shell_rc "$INSTALL_DIR"; then
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
echo "→ Boost is installed!"
if ! $INSTALL_DIR_ON_PATH && [ -n "${BOOST_SHELL_RC:-}" ]; then
  echo
  case "${BOOST_SHELL_KIND:-}" in
    fish)
      echo "Add Boost to PATH in this terminal (fish):"
      echo
      echo "   fish_add_path -gP \"$INSTALL_DIR\""
      ;;
    *)
      echo "Add Boost to PATH in this terminal:"
      echo
      echo "   source \"$BOOST_SHELL_RC\""
      ;;
  esac
  echo
fi
echo "Then run:"
echo
echo "   $ $BOOST_CMD init"


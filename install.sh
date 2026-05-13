#!/usr/bin/env bash
set -euo pipefail

REPO="jfrog/boost"
INSTALL_DIR="${BOOST_INSTALL_DIR:-/usr/local/bin}"
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

"${SUDO[@]}" mkdir -p "$INSTALL_DIR"
"${SUDO[@]}" install -m 0755 "$TMP/boost" "$INSTALL_DIR/boost"
echo "→ Installed: $("$INSTALL_DIR/boost" version 2>/dev/null || echo unknown) to $INSTALL_DIR/boost"

# Warn (don't fail) when the install dir is off PATH so the user knows to fix
# the current shell and future shell sessions.
BOOST_CMD="boost"
case ":${PATH:-}:" in
  *":$INSTALL_DIR:"*) ;;
  *)
    echo "⚠ $INSTALL_DIR is not on PATH. Run now and add to your shell rc: export PATH=\"$INSTALL_DIR:\$PATH\"" >&2
    BOOST_CMD="\"$INSTALL_DIR/boost\""
    ;;
esac

echo
echo "→ Boost is installed! Run this next:"
echo
echo "   $ $BOOST_CMD init"


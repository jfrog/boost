#!/usr/bin/env bash
set -euo pipefail

REPO="jfrog/boost"
INSTALL_DIR="${BOOST_INSTALL_DIR:-$HOME/.local/bin}"

OS="$(uname -s | tr '[:upper:]' '[:lower:]')"
ARCH="$(uname -m)"
case "$ARCH" in x86_64|amd64) ARCH=amd64 ;; aarch64|arm64) ARCH=arm64 ;; *) echo "unsupported arch: $ARCH" >&2; exit 1 ;; esac
case "$OS"   in linux|darwin) ;;                                                *) echo "unsupported OS: $OS — see https://github.com/$REPO/releases" >&2; exit 1 ;; esac

# Resolve latest tag via the redirect — no auth, no rate limits.
TAG="$(curl -fsSLI -o /dev/null -w '%{url_effective}' "https://github.com/$REPO/releases/latest" | sed 's#.*/tag/##')"
[ -n "$TAG" ] || { echo "could not resolve latest release tag" >&2; exit 1; }

ARCHIVE="boost-${OS}-${ARCH}.tar.gz"
TMP="$(mktemp -d)"; trap 'rm -rf "$TMP"' EXIT

echo "→ Downloading $ARCHIVE ($TAG)"
curl -fsSL "https://github.com/$REPO/releases/download/$TAG/$ARCHIVE" -o "$TMP/$ARCHIVE"
tar -xzf "$TMP/$ARCHIVE" -C "$TMP"
[ -f "$TMP/boost" ] || { echo "archive missing 'boost' binary" >&2; exit 1; }

mkdir -p "$INSTALL_DIR"
install -m 0755 "$TMP/boost" "$INSTALL_DIR/boost"
echo "→ Installed: $("$INSTALL_DIR/boost" version 2>/dev/null || echo unknown) to $INSTALL_DIR/boost"

# Warn (don't fail) when the install dir is off PATH so the user knows to fix their rc file.
case ":${PATH:-}:" in
  *":$INSTALL_DIR:"*) ;;
  *) echo "⚠ $INSTALL_DIR is not on PATH. Add to your shell rc: export PATH=\"$INSTALL_DIR:\$PATH\"" >&2 ;;
esac

[ "${BOOST_NO_INIT:-}" = "1" ] && exit 0

echo
if [ -t 0 ] && [ -t 1 ]; then
  "$INSTALL_DIR/boost" init
elif [ -e /dev/tty ]; then
  "$INSTALL_DIR/boost" init </dev/tty >/dev/tty 2>&1
else
  echo "→ Run '$INSTALL_DIR/boost init' to wire up your editors."
fi

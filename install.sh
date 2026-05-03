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
BOOST_CMD="boost"
case ":${PATH:-}:" in
  *":$INSTALL_DIR:"*) ;;
  *)
    echo "⚠ $INSTALL_DIR is not on PATH. Add to your shell rc: export PATH=\"$INSTALL_DIR:\$PATH\"" >&2
    BOOST_CMD="\"$INSTALL_DIR/boost\""
    ;;
esac

echo
echo "→ Boost is installed! Now all that is left to do is add Boost to your GitHub Actions using:"
echo
echo "    cd /path/to/your-repo"
echo "    $BOOST_CMD init --github-actions"
echo
echo "→ This will start monitoring every command in your CI."
echo
echo "→ When the first CI run with Boost installed is complete, run your first Boost operation:"
echo "    - Identify the bottlenecks in your CI"
echo "    - Identify the flaky tests that break your CI"
echo "    - Suggest optimizations to your build process"

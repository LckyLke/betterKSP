#!/bin/sh
# Install betterKSP: the mods, then the stock craft repair.
#
# Usage:
#   ./install.sh [lite|extras] [path-to-KSP]
#
# This is the full install. It runs CKAN to install the mods, then runs
# fix-craft.sh to repair the stock craft files that a modded install
# cannot load. See the "Known issues" section of README.md.

set -e

BASE="https://raw.githubusercontent.com/LckyLke/betterKSP/main"

case "${1:-}" in
  lite)   FILE=betterKSP-lite.ckan ;;
  extras) FILE=betterKSP-extras.ckan ;;
  *)      FILE=betterKSP.ckan ;;
esac

command -v ckan >/dev/null 2>&1 || {
  echo "ckan not found: https://github.com/KSP-CKAN/CKAN/releases" >&2
  exit 1
}

echo "Step 1 of 2: installing the mods..."
ckan update
ckan install -c "$BASE/$FILE" --headless

echo
echo "Step 2 of 2: repairing the stock craft files..."

# Use the local copy if this script came from a clone. Download it otherwise,
# so that a single-file install still repairs the craft.
DIR=$(dirname "$0")
FIX="$DIR/fix-craft.sh"

if [ ! -f "$FIX" ]; then
  FIX=$(mktemp)
  if command -v curl >/dev/null 2>&1; then
    curl -fsSL "$BASE/fix-craft.sh" -o "$FIX" || FIX=""
  elif command -v wget >/dev/null 2>&1; then
    wget -qO "$FIX" "$BASE/fix-craft.sh" || FIX=""
  else
    FIX=""
  fi
fi

if [ -n "$FIX" ] && [ -s "$FIX" ]; then
  sh "$FIX" ${2:+"$2"} || {
    echo "Craft repair failed. Run fix-craft.sh by hand." >&2
    exit 1
  }
else
  echo "Could not get fix-craft.sh." >&2
  echo "The mods are installed, but 23 stock craft will not load." >&2
  echo "Download and run it by hand: $BASE/fix-craft.sh" >&2
  exit 1
fi

echo
echo "Done. Read the \"After the install\" section of README.md for the graphics settings."

#!/bin/sh
# Install betterKSP with the CKAN command line client.
# Usage: ./install.sh [lite|extras] [path-to-KSP]
set -e
BASE="https://raw.githubusercontent.com/LckyLke/betterKSP/main"
case "${1:-}" in
  lite)   FILE=betterKSP-lite.ckan ;;
  extras) FILE=betterKSP-extras.ckan ;;
  *)      FILE=betterKSP.ckan ;;
esac
command -v ckan >/dev/null 2>&1 || { echo "ckan not found: https://github.com/KSP-CKAN/CKAN/releases" >&2; exit 1; }
ckan update
ckan install -c "$BASE/$FILE" --headless

# Repair the stock craft files that a modded install cannot load.
# See the "Known issues" section of README.md.
DIR=$(dirname "$0")
if [ -x "$DIR/fix-craft.sh" ]; then
  echo
  echo "Repairing stock craft files..."
  "$DIR/fix-craft.sh" ${2:+"$2"} || echo "Craft repair failed. Run ./fix-craft.sh by hand." >&2
else
  echo
  echo "Note: run ./fix-craft.sh to repair the stock craft files." >&2
fi

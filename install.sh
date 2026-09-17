#!/bin/sh
# Install betterKSP with the CKAN command line client.
# Usage: ./install.sh [lite|extras]
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

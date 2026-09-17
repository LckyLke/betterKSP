#!/bin/sh
# One-step install of the betterKSP mod pack with the CKAN command line client.
# Usage:  ./install.sh [phase1|full|extras]   (default: full)
set -e
BASE="https://raw.githubusercontent.com/LckyLke/betterKSP/main"
case "${1:-full}" in
  phase1) FILE=phase1-modpack.ckan ;;
  extras) FILE=extras-modpack.ckan ;;
  *)      FILE=sota-modpack.ckan ;;
esac
if ! command -v ckan >/dev/null 2>&1; then
  echo "ckan command not found. Install CKAN first: https://github.com/KSP-CKAN/CKAN/releases" >&2
  exit 1
fi
ckan update
ckan install -c "$BASE/$FILE" --headless

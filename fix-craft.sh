#!/bin/sh
# Repair stock craft files that will not load in a modded KSP 1.12.5 install.
#
# KSP runs an upgrade script named v180_ModuleControlSurface on every craft
# file saved before version 1.8.0. In a modded install that script throws a
# NullReferenceException, and the craft never loads. The game shows no error.
#
# This script sets the version field of every affected craft file to 1.12.5,
# so the upgrade pipeline skips the broken script.
#
# Usage:
#   ./fix-craft.sh [path-to-KSP] [--dry-run]
#
# Re-run it after a game update, or after "Verify integrity of game files".
# Both restore the original craft files.

set -eu

TARGET_VERSION="1.12.5"
DRY_RUN=0
KSP=""

for arg in "$@"; do
  case "$arg" in
    --dry-run) DRY_RUN=1 ;;
    -h|--help) sed -n '2,16p' "$0" | sed 's/^# \{0,1\}//'; exit 0 ;;
    *)         KSP="$arg" ;;
  esac
done

if [ -z "$KSP" ]; then
  for d in \
    "$HOME/.local/share/Steam/steamapps/common/Kerbal Space Program" \
    "$HOME/.steam/steam/steamapps/common/Kerbal Space Program" \
    "$HOME/Library/Application Support/Steam/steamapps/common/Kerbal Space Program" \
    "/c/Program Files (x86)/Steam/steamapps/common/Kerbal Space Program"
  do
    if [ -d "$d" ]; then KSP="$d"; break; fi
  done
fi

if [ -z "$KSP" ] || [ ! -d "$KSP" ]; then
  echo "KSP folder not found. Pass it as the first argument:" >&2
  echo "  ./fix-craft.sh \"/path/to/Kerbal Space Program\"" >&2
  exit 1
fi

if [ ! -d "$KSP/GameData" ]; then
  echo "Not a KSP folder (no GameData): $KSP" >&2
  exit 1
fi

echo "KSP folder: $KSP"

# Return success if the version string is older than 1.8.0.
older_than_180() {
  echo "$1" | awk -F. '{
    major = $1 + 0; minor = $2 + 0;
    if (major < 1) exit 0;
    if (major == 1 && minor < 8) exit 0;
    exit 1;
  }'
}

LIST=$(mktemp)
trap 'rm -f "$LIST"' EXIT
find "$KSP" -type d -name 'betterKSP-craft-backup-*' -prune -o \
     -type f -name '*.craft' -print > "$LIST"

BACKUP="$KSP/betterKSP-craft-backup-$(date +%Y%m%d-%H%M%S)"
COUNT=0

while IFS= read -r f; do
  [ -f "$f" ] || continue
  version=$(awk -F'=' '/^version[ \t]*=/ { gsub(/[ \t\r]/, "", $2); print $2; exit }' "$f")
  [ -n "$version" ] || continue
  older_than_180 "$version" || continue
  grep -q 'name = ModuleControlSurface' "$f" || continue

  rel=${f#"$KSP"/}
  if [ "$DRY_RUN" -eq 1 ]; then
    echo "  would fix  $version -> $TARGET_VERSION  $rel"
  else
    mkdir -p "$BACKUP/$(dirname "$rel")"
    cp -p "$f" "$BACKUP/$rel"
    tmp=$(mktemp)
    awk -v v="$TARGET_VERSION" '
      BEGIN { done = 0 }
      !done && /^version[ \t]*=/ { print "version = " v; done = 1; next }
      { print }
    ' "$f" > "$tmp"
    cat "$tmp" > "$f"
    rm -f "$tmp"
    echo "  fixed  $version -> $TARGET_VERSION  $rel"
  fi
  COUNT=$((COUNT + 1))
done < "$LIST"

echo
if [ "$COUNT" -eq 0 ]; then
  echo "Nothing to do. No craft file needs the fix."
elif [ "$DRY_RUN" -eq 1 ]; then
  echo "$COUNT craft files need the fix. Run without --dry-run to apply it."
else
  echo "$COUNT craft files fixed."
  echo "Backup: $BACKUP"
fi

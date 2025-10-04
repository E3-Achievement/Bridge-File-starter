#!/usr/bin/env bash
set -euo pipefail
ROOT="${1:-"$HOME/Notes/BridgeFiles"}"
TS="$(date +%Y%m%d-%H%M%S)"
DEST="$ROOT/Backups"
mkdir -p "$DEST"
ZIP="$DEST/BridgeFiles-$TS.zip"
(
  cd "$(dirname "$ROOT")"
  base="$(basename "$ROOT")"
  zip -qr "$ZIP" "$base"
)
echo "Backup created: $ZIP"

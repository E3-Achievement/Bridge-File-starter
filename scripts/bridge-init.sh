#!/usr/bin/env bash
set -euo pipefail
ROOT="${1:-"$HOME/Notes/BridgeFiles"}"

mkdir -p "$ROOT"/{Screenshots,Scrolls,SessionNotes,Backups}
# Drop README and template if not present
[ -f "$ROOT/README.md" ] || cp -f "$(dirname "$0")/../README-BridgeFileSystem.md" "$ROOT/README.md"
[ -f "$ROOT/.gitignore" ] || cp -f "$(dirname "$0")/../.gitignore" "$ROOT/.gitignore"
[ -f "$ROOT/.gitattributes" ] || cp -f "$(dirname "$0")/../.gitattributes" "$ROOT/.gitattributes"
[ -f "$ROOT/SessionNotes/$(date +%F)-Notes.md" ] || printf "# %s Notes\n\n" "$(date +%F)" > "$ROOT/SessionNotes/$(date +%F)-Notes.md"
[ -f "$ROOT/RecursiveRosettaStone-Session-$(date +%Y%m%d).md" ] || cp -f "$(dirname "$0")/../templates/Bridgefile-Session-Template.md" "$ROOT/RecursiveRosettaStone-Session-$(date +%Y%m%d).md"

# Optional Git + LFS
if command -v git >/dev/null 2>&1; then
  cd "$ROOT"
  if [ ! -d ".git" ]; then
    git init
    if command -v git-lfs >/dev/null 2>&1 || git lfs --version >/dev/null 2>&1; then
      git lfs install
    fi
    git add .
    git commit -m "BridgeFiles: initialized"
  fi
fi

echo "BridgeFiles initialized at: $ROOT"

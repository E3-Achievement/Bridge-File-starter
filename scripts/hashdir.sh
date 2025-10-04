#!/usr/bin/env bash
set -euo pipefail
ROOT="${1:-"$HOME/Notes/BridgeFiles"}"
python3 "$(dirname "$0")/hashdir.py" "$ROOT"

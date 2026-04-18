#!/usr/bin/env bash
# Thin wrapper around render_brand_html.py — activates venv.
set -euo pipefail
ROOT="${CLAUDE_PLUGIN_ROOT:-$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)}"
if [ ! -d "$ROOT/scripts/.venv" ]; then
  bash "$ROOT/scripts/setup-attachments.sh"
fi
# shellcheck disable=SC1091
source "$ROOT/scripts/.venv/bin/activate"
exec python "$ROOT/scripts/render_brand_html.py" "$@"

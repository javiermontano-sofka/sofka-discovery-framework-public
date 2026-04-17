#!/usr/bin/env bash
# Bootstrap venv for attachment extractors.
# Idempotent: safe to rerun.
set -euo pipefail

PLUGIN_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
VENV="$PLUGIN_ROOT/scripts/.venv"
REQ="$PLUGIN_ROOT/requirements.txt"

PY="${PYTHON:-python3}"
$PY -c 'import sys; sys.exit(0 if sys.version_info >= (3,10) else 1)' || {
  echo "ERROR: need Python >=3.10, got $($PY --version)" >&2
  exit 1
}

if [ ! -d "$VENV" ]; then
  echo "[setup] creating venv at $VENV"
  $PY -m venv "$VENV"
fi

# shellcheck disable=SC1091
source "$VENV/bin/activate"
pip install --quiet --upgrade pip
pip install --quiet -r "$REQ"

echo "[setup] OK — venv ready at $VENV"
echo "[setup] activate: source $VENV/bin/activate"
python - <<'PY'
import pandas, openpyxl, docx, pypdf, pdfplumber, pptx, bs4, lxml, jinja2
print("[setup] imports OK:", pandas.__version__, openpyxl.__version__)
PY

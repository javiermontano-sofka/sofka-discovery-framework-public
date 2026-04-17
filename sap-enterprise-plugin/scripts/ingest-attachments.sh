#!/usr/bin/env bash
# Dispatcher: for each attachment, pick the right extractor.
# Usage: ingest-attachments.sh <path1> [path2 ...]
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
VENV="$ROOT/scripts/.venv"
if [ ! -d "$VENV" ]; then
  echo "[ingest] venv missing — running setup..." >&2
  bash "$ROOT/scripts/setup-attachments.sh"
fi
# shellcheck disable=SC1091
source "$VENV/bin/activate"
export PYTHONPATH="$ROOT/scripts:${PYTHONPATH:-}"

mkdir -p .discovery

for f in "$@"; do
  if [ ! -f "$f" ]; then echo "[skip] not found: $f" >&2; continue; fi
  ext="${f##*.}"; ext="$(echo "$ext" | tr '[:upper:]' '[:lower:]')"
  case "$ext" in
    csv) python "$ROOT/scripts/extract-csv.py" "$f" ;;
    xlsx|xlsm|xls) python "$ROOT/scripts/extract-xlsx.py" "$f" ;;
    docx|doc) python "$ROOT/scripts/extract-docx.py" "$f" ;;
    pdf) python "$ROOT/scripts/extract-pdf.py" "$f" ;;
    pptx|ppt) python "$ROOT/scripts/extract-pptx.py" "$f" ;;
    html|htm) python "$ROOT/scripts/extract-html.py" "$f" ;;
    py|ts|tsx|js|sql|abap) python "$ROOT/scripts/extract-code.py" "$f" ;;
    json|yaml|yml|xml) python "$ROOT/scripts/extract-structured.py" "$f" ;;
    md|txt|log)
      stem="$(basename "$f" ".$ext")"
      out=".discovery/priming-rag-$stem.md"
      { echo "---"; echo "source_path: $f"; echo "extractor: passthrough-$ext"; echo "---"; echo; echo "# Adjunto: $(basename "$f")"; echo; echo "## Contenido"; echo; cat "$f"; echo; echo "## Evidencia"; echo "- \`[ADJUNTO:$(basename "$f"):raw]\`"; } > "$out"
      echo "$out"
      ;;
    *) bash "$ROOT/scripts/extract-generic.sh" "$f" ;;
  esac
done

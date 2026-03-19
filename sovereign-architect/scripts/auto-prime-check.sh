#!/usr/bin/env bash
# Sovereign Architect — Auto-Prime Check
# Detects if priming has been done, suggests /sa:prime if not
# © 2026 JM Labs · Javier Montaño
set -euo pipefail

SA_DIR="${1:-$(pwd)}/sa"
PRIMED=false

echo "## Priming Status"
echo ""

# Check for priming indicators
if [[ -d "$SA_DIR" ]]; then
  # Look for priming-rag files or calibration digest
  if ls "$SA_DIR"/priming-rag-*.md 1>/dev/null 2>&1; then
    PRIMED=true
    COUNT=$(ls "$SA_DIR"/priming-rag-*.md 2>/dev/null | wc -l | tr -d ' ')
    echo "- Priming detected: **$COUNT** RAG document(s) loaded."
  fi

  if [[ -f "$SA_DIR/calibration-digest.md" ]]; then
    PRIMED=true
    echo "- Calibration digest present."
  fi
fi

if [[ "$PRIMED" == false ]]; then
  # Create needs-priming marker
  mkdir -p "$SA_DIR"
  touch "$SA_DIR/needs-priming"
  echo "- **No priming detected.**"
  echo "- Run \`/sa:prime\` to load repository knowledge."
  echo ""
  echo "> Sovereign Architect operates best with full context priming."
fi

exit 0

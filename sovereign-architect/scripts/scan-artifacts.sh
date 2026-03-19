#!/usr/bin/env bash
# Sovereign Architect — Artifact Scanner
# Tracks generated artifacts in sa/ directory
# © 2026 JM Labs · Javier Montaño
set -euo pipefail

SA_DIR="${1:-$(pwd)}/sa"

echo "## Artifact Inventory"
echo ""

if [[ ! -d "$SA_DIR" ]]; then
  echo "- No sa/ directory found. Run \`/sa:init\` to initialize."
  exit 0
fi

TOTAL=0
WIP=0
APPROVED=0

for f in "$SA_DIR"/*.md "$SA_DIR"/**/*.md; do
  [[ -f "$f" ]] 2>/dev/null || continue
  BASENAME=$(basename "$f")
  LINES=$(wc -l < "$f")
  TOTAL=$((TOTAL + 1))

  if [[ "$BASENAME" == *"{WIP}"* ]]; then
    WIP=$((WIP + 1))
    STATUS="WIP"
  elif [[ "$BASENAME" == *"{Aprobado}"* ]]; then
    APPROVED=$((APPROVED + 1))
    STATUS="Approved"
  else
    STATUS="Draft"
  fi

  echo "- **$BASENAME** ($LINES lines) [$STATUS]"
done

echo ""
echo "> **Total**: $TOTAL artifacts | **WIP**: $WIP | **Approved**: $APPROVED"

exit 0

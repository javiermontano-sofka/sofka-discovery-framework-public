#!/usr/bin/env bash
# Sovereign Architect — Context Pruner
# Auto-compress sa/ files exceeding 150 lines
# © 2026 JM Labs · Javier Montaño
set -euo pipefail

SA_DIR="${1:-$(pwd)}/sa"
THRESHOLD=150
PRUNED=0

if [[ ! -d "$SA_DIR" ]]; then
  exit 0
fi

echo "## Context Prune Check"
echo ""

for f in "$SA_DIR"/*.md; do
  [[ -f "$f" ]] || continue
  LINES=$(wc -l < "$f")
  if (( LINES > THRESHOLD )); then
    BASENAME=$(basename "$f")
    BACKUP="${f}.bak"
    cp "$f" "$BACKUP"

    # Keep first 20 lines (header) + last 30 lines (recent) + separator
    {
      head -n 20 "$f"
      echo ""
      echo "<!-- pruned: $(date -u +%Y-%m-%dT%H:%M:%SZ) | original: $LINES lines -->"
      echo "<!-- ... $(( LINES - 50 )) lines archived to ${BASENAME}.bak ... -->"
      echo ""
      tail -n 30 "$f"
    } > "${f}.tmp"
    mv "${f}.tmp" "$f"

    echo "- Pruned **$BASENAME**: $LINES → ~50 lines (backup: ${BASENAME}.bak)"
    PRUNED=$((PRUNED + 1))
  fi
done

if (( PRUNED == 0 )); then
  echo "- All sa/ files within $THRESHOLD-line threshold."
else
  echo ""
  echo "> $PRUNED file(s) pruned. Backups saved as .bak"
fi

exit 0

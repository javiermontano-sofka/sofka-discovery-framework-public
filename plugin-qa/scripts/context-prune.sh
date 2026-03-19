#!/usr/bin/env bash
# Plugin QA — Context Pruner
# Auto-compress pqa/ files exceeding 150 lines
# Hook: PostToolUse (Write|Edit)
# (c) 2026 JM Labs - Javier Montano
set -euo pipefail

PQA_DIR="${1:-$(pwd)}/pqa"
THRESHOLD=150
PRUNED=0

if [[ ! -d "$PQA_DIR" ]]; then
  exit 0
fi

for f in "$PQA_DIR"/*.md; do
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

    PRUNED=$((PRUNED + 1))
  fi
done

if (( PRUNED > 0 )); then
  echo "- $PRUNED pqa/ file(s) pruned (backups saved as .bak)"
fi

exit 0

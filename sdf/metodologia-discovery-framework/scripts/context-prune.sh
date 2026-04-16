#!/usr/bin/env bash
# context-prune.sh — Semantic pruning of session-changelog.md
# MetodologIA MAO v1.2 — Open Discovery Framework
# MIT License
#
# When changelog exceeds THRESHOLD lines, compress old entries keeping:
# - Header and session summary (first 15 lines)
# - Compressed summary of old entries (gate decisions, phase transitions)
# - Last KEEP_RECENT lines verbatim

set -euo pipefail

TARGET_DIR="${1:-.}"
CHANGELOG="$TARGET_DIR/discovery/session-changelog.md"
THRESHOLD=150
KEEP_RECENT=50

[ -f "$CHANGELOG" ] || exit 0

LINE_COUNT=$(wc -l < "$CHANGELOG")
[ "$LINE_COUNT" -le "$THRESHOLD" ] && exit 0

echo "🔄 Context prune: changelog has $LINE_COUNT lines (threshold: $THRESHOLD). Compressing..."

# Extract header (first 15 lines)
HEADER=$(head -n 15 "$CHANGELOG")

# Extract all entries
TOTAL_ENTRIES=$(grep -c "^### " "$CHANGELOG" 2>/dev/null || echo 0)

# Count lines for the last KEEP_RECENT
TAIL_CONTENT=$(tail -n "$KEEP_RECENT" "$CHANGELOG")

# Extract critical decisions from old entries (everything between header and recent)
OLD_SECTION_END=$((LINE_COUNT - KEEP_RECENT))
OLD_SECTION=$(sed -n "16,${OLD_SECTION_END}p" "$CHANGELOG")

# Extract gate decisions, phase transitions, and critical items
CRITICAL_ITEMS=""
if [ -n "$OLD_SECTION" ]; then
  CRITICAL_ITEMS=$(echo "$OLD_SECTION" | grep -iE "(gate|G[0-3]|fase|phase|aprobad|rechazad|bloq|critical|decisión|decision|abort|escalar)" || true)
fi

# Count compressed entries
OLD_ENTRIES=$(echo "$OLD_SECTION" | grep -c "^### " 2>/dev/null || echo 0)
RECENT_ENTRIES=$((TOTAL_ENTRIES - OLD_ENTRIES))

# Rebuild changelog
cat > "$CHANGELOG" << PRUNED_EOF
$HEADER

---

## Resumen comprimido (entradas 1–${OLD_ENTRIES})

> 🔄 **${OLD_ENTRIES} entradas anteriores comprimidas** por context-prune.sh ($(date -u +%Y-%m-%dT%H:%M:%SZ))
> Líneas originales: $LINE_COUNT → comprimidas a ~$((60 + KEEP_RECENT))

### Decisiones críticas preservadas
$(if [ -n "$CRITICAL_ITEMS" ]; then
  echo "$CRITICAL_ITEMS" | head -30
else
  echo "_(ninguna decisión crítica detectada en entradas antiguas)_"
fi)

---

## Entradas recientes (${RECENT_ENTRIES} más recientes)

$TAIL_CONTENT
PRUNED_EOF

NEW_COUNT=$(wc -l < "$CHANGELOG")
echo "✅ Changelog comprimido: $LINE_COUNT → $NEW_COUNT líneas ($OLD_ENTRIES entradas resumidas, $RECENT_ENTRIES preservadas)"

exit 0

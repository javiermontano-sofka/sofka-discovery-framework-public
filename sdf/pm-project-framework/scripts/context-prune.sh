#!/usr/bin/env bash
# context-prune.sh — Semantic pruning of session-changelog.md
# PMO-APEX v1.0 — Agentic Project Management as Service
# © 2026 PMO-APEX. All Rights Reserved.
#
# When changelog exceeds THRESHOLD lines, compress old entries keeping:
# - Header and session summary (first 15 lines)
# - Compressed summary of old entries (gate decisions, phase transitions)
# - Last KEEP_RECENT lines verbatim

set -euo pipefail

TARGET_DIR="${1:-.}"
CHANGELOG="$TARGET_DIR/project/session-changelog.md"
THRESHOLD=150
KEEP_RECENT=50

[ -f "$CHANGELOG" ] || exit 0

LINE_COUNT=$(wc -l < "$CHANGELOG")
[ "$LINE_COUNT" -le "$THRESHOLD" ] && exit 0

echo "Context prune: changelog has $LINE_COUNT lines (threshold: $THRESHOLD). Compressing..."

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
  CRITICAL_ITEMS=$(echo "$OLD_SECTION" | grep -iE "(gate|G[0-3]|phase|milestone|approved|rejected|blocked|critical|decision|escalat|risk|change request)" || true)
fi

# Count compressed entries
OLD_ENTRIES=$(echo "$OLD_SECTION" | grep -c "^### " 2>/dev/null || echo 0)
RECENT_ENTRIES=$((TOTAL_ENTRIES - OLD_ENTRIES))

# Rebuild changelog
cat > "$CHANGELOG" << PRUNED_EOF
$HEADER

---

## Compressed Summary (entries 1-${OLD_ENTRIES})

> **${OLD_ENTRIES} previous entries compressed** by context-prune.sh ($(date -u +%Y-%m-%dT%H:%M:%SZ))
> Original lines: $LINE_COUNT -> compressed to ~$((60 + KEEP_RECENT))

### Critical Decisions Preserved
$(if [ -n "$CRITICAL_ITEMS" ]; then
  echo "$CRITICAL_ITEMS" | head -30
else
  echo "_(no critical decisions detected in old entries)_"
fi)

---

## Recent Entries (${RECENT_ENTRIES} most recent)

$TAIL_CONTENT
PRUNED_EOF

NEW_COUNT=$(wc -l < "$CHANGELOG")
echo "Changelog compressed: $LINE_COUNT -> $NEW_COUNT lines ($OLD_ENTRIES entries summarized, $RECENT_ENTRIES preserved)"

exit 0

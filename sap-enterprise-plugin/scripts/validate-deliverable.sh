#!/usr/bin/env bash
# validate-deliverable.sh
# General deliverable QA: evidence tags, template compliance, ghost menu, signature.
# Author: Diseñado por Javier Montaño
# Plugin: sap-enterprise-plugin v2.1

set -o pipefail

TARGET="${1:-.}"

# If target is a directory, scan all .md files
if [ -d "$TARGET" ]; then
  FILES=$(find "$TARGET" -name "*.md" -not -path "*/node_modules/*" -not -path "*/.git/*" 2>/dev/null)
else
  FILES="$TARGET"
fi

if [ -z "$FILES" ]; then
  echo "No .md files found in $TARGET"
  exit 0
fi

TOTAL_ERRORS=0

for FILE in $FILES; do
  [ -f "$FILE" ] || continue
  LINES=$(wc -l < "$FILE" | tr -d ' ')
  [ "$LINES" -lt 20 ] && continue  # Skip short files

  ERRORS=0
  WARNINGS=0

  # Check 1: Evidence tags present
  TAGS=$(grep -oE '\[(CÓDIGO|CODIGO|CONFIG|DOC|INFERENCIA|SUPUESTO|STAKEHOLDER)\]' "$FILE" | wc -l | tr -d ' ')
  TAG_DENSITY=$((TAGS * 100 / LINES))

  if [ "$TAGS" -lt 2 ]; then
    WARNINGS=$((WARNINGS + 1))
  fi

  # Check 2: Supuesto percentage (warn if >30%)
  SUPUESTOS=$(grep -oE '\[SUPUESTO\]' "$FILE" | wc -l | tr -d ' ')
  if [ "$TAGS" -gt 0 ]; then
    SUPUESTO_PCT=$((SUPUESTOS * 100 / TAGS))
    if [ "$SUPUESTO_PCT" -gt 30 ]; then
      WARNINGS=$((WARNINGS + 1))
    fi
  fi

  # Check 3: Author signature footer
  if ! grep -q "Javier Montaño\|Javier Montano" "$FILE"; then
    WARNINGS=$((WARNINGS + 1))
  fi

  # Check 4: Ghost menu presence (for deliverables)
  if echo "$FILE" | grep -qE "_{WIP}|_{Aprobado}"; then
    if ! grep -qiE "ghost menu|paleta|/sap:" "$FILE"; then
      WARNINGS=$((WARNINGS + 1))
    fi
  fi

  # Check 5: TL;DR presence
  if [ "$LINES" -gt 50 ]; then
    if ! grep -qE "^## TL;DR" "$FILE"; then
      WARNINGS=$((WARNINGS + 1))
    fi
  fi

  if [ "$ERRORS" -gt 0 ] || [ "$WARNINGS" -gt 0 ]; then
    echo "📄 $(basename "$FILE"): $ERRORS errors, $WARNINGS warnings"
    [ "$TAGS" -lt 2 ] && echo "   ⚠️  Low evidence tag count: $TAGS tags in $LINES lines"
    [ "$TAGS" -gt 0 ] && [ "$SUPUESTO_PCT" -gt 30 ] 2>/dev/null && echo "   ⚠️  High [SUPUESTO] ratio: ${SUPUESTO_PCT}%"
  fi

  TOTAL_ERRORS=$((TOTAL_ERRORS + ERRORS))
done

echo ""
if [ "$TOTAL_ERRORS" -eq 0 ]; then
  echo "✅ All deliverables pass QA (warnings may exist)"
  exit 0
else
  echo "❌ $TOTAL_ERRORS errors found across deliverables"
  exit 1
fi

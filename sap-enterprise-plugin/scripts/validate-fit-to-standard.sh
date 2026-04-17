#!/usr/bin/env bash
# validate-fit-to-standard.sh
# Validates F2S workshop output: scoring matrix consistency, dimension ranges.
# Author: Diseñado por Javier Montaño
# Plugin: sap-enterprise-plugin v2.1

set -o pipefail

FILE="${1:-}"

if [ -z "$FILE" ] || [ ! -f "$FILE" ]; then
  echo "Usage: $0 <path-to-fit-to-standard-output.md>"
  exit 1
fi

echo "=== Fit-to-Standard Validation ==="
echo "File: $FILE"
echo ""

ERRORS=0
WARNINGS=0

# Check 1: Header with workshop metadata
echo "[1/5] Workshop metadata check..."
if grep -q "Workshop Metadata" "$FILE" && grep -q "Module" "$FILE"; then
  echo "  ✅ PASS"
else
  echo "  ⚠️  WARNING: Missing workshop metadata header"
  WARNINGS=$((WARNINGS + 1))
fi

# Check 2: Scope Items referenced with [DOC] tag
echo "[2/5] Scope Items evidence..."
SCOPE_DOC=$(grep -cE "Scope Item.*\[DOC\]" "$FILE" || true)
if [ "$SCOPE_DOC" -lt 1 ]; then
  echo "  ❌ FAIL: Scope Items must be tagged [DOC] (validated by @sap-docs-steward)"
  ERRORS=$((ERRORS + 1))
else
  echo "  ✅ PASS ($SCOPE_DOC Scope Items with [DOC])"
fi

# Check 3: Gap scoring dimensions are 1-3 (hardened awk separator)
echo "[3/5] Scoring dimensions range (1-3)..."
INVALID_SCORES=$(grep -oE "Effort[[:space:]]*[:=][[:space:]]*[0-9]+" "$FILE" | awk -F'[ :=]+' '{v=$NF; if(v<1 || v>3) print $0}' || true)
if [ -n "$INVALID_SCORES" ]; then
  echo "  ❌ FAIL: Invalid Effort dimension values (must be 1-3)"
  echo "$INVALID_SCORES" | head -3
  ERRORS=$((ERRORS + 1))
else
  echo "  ✅ PASS"
fi
# Also check Risk, Upgrade Impact, Business Value
for DIM in "Risk" "Upgrade Impact" "Business Value"; do
  BAD=$(grep -oE "${DIM}[[:space:]]*[:=][[:space:]]*[0-9]+" "$FILE" | awk -F'[ :=]+' '{v=$NF; if(v<1 || v>3) print $0}' 2>/dev/null || true)
  if [ -n "$BAD" ]; then
    echo "  ⚠️  WARNING: ${DIM} values out of range (1-3): $(echo "$BAD" | head -1)"
    WARNINGS=$((WARNINGS + 1))
  fi
done

# Check 4: Business Value from stakeholder
echo "[4/5] Business Value stakeholder evidence..."
BV_STAKEHOLDER=$(grep -cE "Business Value.*\[STAKEHOLDER\]" "$FILE" || true)
if [ "$BV_STAKEHOLDER" -lt 1 ]; then
  echo "  ⚠️  WARNING: Business Value should be tagged [STAKEHOLDER] (from process owner, not consultant)"
  WARNINGS=$((WARNINGS + 1))
else
  echo "  ✅ PASS"
fi

# Check 5: Results overview with traffic light status
echo "[5/5] Traffic light status (🟢🟡🔴)..."
if grep -qE "🟢|Green|🟡|Yellow|🔴|Red" "$FILE"; then
  echo "  ✅ PASS"
else
  echo "  ⚠️  WARNING: No traffic light status emoji found"
  WARNINGS=$((WARNINGS + 1))
fi

echo ""
echo "=== Results ==="
echo "Errors: $ERRORS"
echo "Warnings: $WARNINGS"

if [ "$ERRORS" -eq 0 ]; then
  echo "✅ F2S OUTPUT VALID"
  exit 0
else
  echo "❌ F2S OUTPUT INVALID"
  exit 1
fi

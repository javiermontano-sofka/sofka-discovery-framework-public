#!/usr/bin/env bash
# validate-gap-registry.sh
# Validates GAP-{MODULE}-{NNN} format and required fields in gap registry.
# Author: Diseñado por Javier Montaño
# Plugin: sap-enterprise-plugin v2.1

set -o pipefail

FILE="${1:-}"

if [ -z "$FILE" ] || [ ! -f "$FILE" ]; then
  echo "Usage: $0 <path-to-gap-registry.md>"
  exit 1
fi

echo "=== Gap Registry Validation ==="
echo "File: $FILE"
echo ""

ERRORS=0
WARNINGS=0

# Check 1: GAP IDs follow pattern GAP-{MODULE}-{NNN}
echo "[1/5] GAP ID format check..."
INVALID_IDS=$(grep -oE "GAP-[A-Za-z0-9_]+-[^ |]+" "$FILE" | grep -vE "^GAP-(CO|SD|PS|FI|MM|HCM|XFN)-[0-9]{3}$" || true)
if [ -n "$INVALID_IDS" ]; then
  echo "  ❌ FAIL: Invalid GAP IDs found:"
  echo "$INVALID_IDS" | head -5
  ERRORS=$((ERRORS + 1))
else
  echo "  ✅ PASS"
fi

# Check 2: Required fields per gap
echo "[2/5] Required fields check..."
REQUIRED=("Module" "Score" "Classification" "Business Value" "Blocking")
for field in "${REQUIRED[@]}"; do
  count=$(grep -c "$field" "$FILE" || true)
  if [ "$count" -lt 1 ]; then
    echo "  ❌ FAIL: Missing field '$field'"
    ERRORS=$((ERRORS + 1))
  fi
done
if [ "$ERRORS" -eq 0 ]; then
  echo "  ✅ PASS (all required fields present)"
fi

# Check 3: Classification values are valid
echo "[3/5] Classification values check..."
VALID_CLASS="(Fit|Configure|Extend-KU|Extend-RAP|Extend-BTP|Custom|Workaround)"
INVALID_CLASS=$(grep -oE "Classification.*:[ ]*[A-Za-z-]+" "$FILE" | grep -vE ":.*(Fit|Configure|Extend-KU|Extend-RAP|Extend-BTP|Custom|Workaround)" || true)
if [ -n "$INVALID_CLASS" ]; then
  echo "  ⚠️  WARNING: Invalid classifications found"
  echo "$INVALID_CLASS" | head -3
  WARNINGS=$((WARNINGS + 1))
else
  echo "  ✅ PASS"
fi

# Check 4: Blocking gaps have ADRs
echo "[4/5] Blocking gaps require ADRs..."
# Simple heuristic: if line has "Blocking: Yes" without "ADR-" nearby
BLOCKING_WITHOUT_ADR=$(awk '/Blocking.*Yes/{print NR": "$0}' "$FILE" | head -5 || true)
ADR_COUNT=$(grep -cE "ADR-[0-9]+" "$FILE" || true)
BLOCKING_COUNT=$(grep -cE "Blocking.*Yes" "$FILE" || true)
if [ "$BLOCKING_COUNT" -gt 0 ] && [ "$ADR_COUNT" -eq 0 ]; then
  echo "  ❌ FAIL: $BLOCKING_COUNT blocking gaps but 0 ADRs referenced"
  ERRORS=$((ERRORS + 1))
else
  echo "  ✅ PASS (Blocking: $BLOCKING_COUNT, ADRs: $ADR_COUNT)"
fi

# Check 5: Custom classification must have justification
echo "[5/5] Custom (AVOID) classifications check..."
CUSTOM_COUNT=$(grep -c "Classification.*Custom" "$FILE" || true)
if [ "$CUSTOM_COUNT" -gt 0 ]; then
  echo "  ⚠️  WARNING: $CUSTOM_COUNT gaps classified as Custom — require ADR with justification"
  WARNINGS=$((WARNINGS + 1))
else
  echo "  ✅ PASS (no Custom classifications)"
fi

echo ""
echo "=== Results ==="
echo "Errors: $ERRORS"
echo "Warnings: $WARNINGS"

if [ "$ERRORS" -eq 0 ]; then
  echo "✅ REGISTRY VALID"
  exit 0
else
  echo "❌ REGISTRY INVALID — fix errors before proceeding"
  exit 1
fi

#!/usr/bin/env bash
# validate-clean-core.sh
# Checks Clean Core compliance (6 criteria) across SAP extension proposals.
# Author: Diseñado por Javier Montaño
# Plugin: sap-enterprise-plugin v2.1

set -o pipefail

TARGET="${1:-.}"
VIOLATIONS=0
CHECKS_PASSED=0
TOTAL_CHECKS=6

# Validate target exists
if [ ! -e "$TARGET" ]; then
  echo "ERROR: Target not found: $TARGET"
  echo "Usage: $0 <path-to-directory-or-file>"
  exit 1
fi

echo "=== Clean Core Compliance Check ==="
echo "Target: $TARGET"
echo ""

# Criterion 1: Released APIs only
# Flag direct SELECT from known SAP standard tables
echo "[1/6] Released APIs only check..."
if grep -rEn "SELECT[ ]+.*[ ]+FROM[ ]+(MARA|VBAK|VBAP|BKPF|BSEG|PA0001|KNA1|LFA1)" "$TARGET" 2>/dev/null | grep -v "^[[:space:]]*\"" >/tmp/cc-check-1 ; then
  if [ -s /tmp/cc-check-1 ]; then
    echo "  ❌ FAIL: Direct SELECT from standard tables found"
    cat /tmp/cc-check-1 | head -5
    VIOLATIONS=$((VIOLATIONS + 1))
  else
    echo "  ✅ PASS"
    CHECKS_PASSED=$((CHECKS_PASSED + 1))
  fi
else
  echo "  ✅ PASS (no code files or no violations)"
  CHECKS_PASSED=$((CHECKS_PASSED + 1))
fi

# Criterion 2: No standard code modification (CMOD, implicit enhancements)
echo "[2/6] No standard code modification..."
if grep -rEn "(CMOD|ENHANCEMENT-POINT|ENHANCEMENT-SECTION).*BEGIN" "$TARGET" 2>/dev/null | head -1 | grep -q . ; then
  echo "  ❌ FAIL: Classic enhancement/modification found"
  VIOLATIONS=$((VIOLATIONS + 1))
else
  echo "  ✅ PASS"
  CHECKS_PASSED=$((CHECKS_PASSED + 1))
fi

# Criterion 3: Upgrade-safe mechanism (no classic BADIs in SAP namespace)
# Tightened: match BADI definitions/implementations specifically, not prose
echo "[3/6] Upgrade-safe extension mechanism..."
if grep -rEn "(GET BADI|DEFINE-SECTION.*BADI|BADI[[:space:]]+IN[[:space:]]+/SAP/)" "$TARGET" 2>/dev/null | grep -v "^[[:space:]]*\"" | head -1 | grep -q . ; then
  echo "  ❌ FAIL: Classic BADI in SAP namespace"
  VIOLATIONS=$((VIOLATIONS + 1))
else
  echo "  ✅ PASS"
  CHECKS_PASSED=$((CHECKS_PASSED + 1))
fi

# Criterion 4: Custom fields (not Z-tables in SAP namespace)
echo "[4/6] No Z-tables in SAP namespace..."
if grep -rEn "TABLE[ ]+Z[A-Z_]+.*APPEND" "$TARGET" 2>/dev/null | head -1 | grep -q . ; then
  echo "  ⚠️ WARNING: Z-table append detected — verify custom fields app was used"
  CHECKS_PASSED=$((CHECKS_PASSED + 1))  # Soft pass with warning
else
  echo "  ✅ PASS"
  CHECKS_PASSED=$((CHECKS_PASSED + 1))
fi

# Criterion 5: Standard integration protocols
echo "[5/6] Standard integration protocols..."
if grep -rEn "CALL[ ]+FUNCTION.*DESTINATION[ ]+[A-Z_]+_RFC" "$TARGET" 2>/dev/null | head -1 | grep -q . ; then
  echo "  ❌ FAIL: Direct RFC call detected — use CPI mediation"
  VIOLATIONS=$((VIOLATIONS + 1))
else
  echo "  ✅ PASS"
  CHECKS_PASSED=$((CHECKS_PASSED + 1))
fi

# Criterion 6: Fiori UI patterns (no BSP/WebDynpro)
echo "[6/6] Fiori UI patterns..."
if grep -rEn "(BSP_APPLICATION|WEBDYNPRO)" "$TARGET" 2>/dev/null | head -1 | grep -q . ; then
  echo "  ❌ FAIL: BSP or WebDynpro detected — use Fiori Elements / UI5"
  VIOLATIONS=$((VIOLATIONS + 1))
else
  echo "  ✅ PASS"
  CHECKS_PASSED=$((CHECKS_PASSED + 1))
fi

echo ""
echo "=== Clean Core Score: ${CHECKS_PASSED}/${TOTAL_CHECKS} ==="

if [ "$CHECKS_PASSED" -ge 5 ]; then
  echo "✅ COMPLIANT (threshold >= 5/6)"
  exit 0
elif [ "$CHECKS_PASSED" -ge 4 ]; then
  echo "⚠️  REVIEW REQUIRED (4/6 — SDA approval needed)"
  exit 1
else
  echo "❌ NON-COMPLIANT (<4/6 — refactor mandatory)"
  exit 2
fi

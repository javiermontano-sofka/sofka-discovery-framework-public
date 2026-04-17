#!/usr/bin/env bash
# validate-sap-testing-validation.sh — skill-specific validator
# Rename this file to validate-<actual-skill-name>.sh and customize.
# Author: Diseñado por Javier Montaño

set -o pipefail

TARGET="${1:-}"
if [ -z "$TARGET" ] || [ ! -e "$TARGET" ]; then
  echo "Usage: $0 <path-to-deliverable>"
  exit 1
fi

ERRORS=0
WARNINGS=0

echo "=== Validating sap-testing-validation output: $TARGET ==="

# Check 1: TL;DR present
if ! grep -q "^## TL;DR" "$TARGET"; then
  echo "  ❌ Missing TL;DR section"
  ERRORS=$((ERRORS + 1))
fi

# Check 2: Evidence tags density
TAGS=$(grep -oE '\[(CÓDIGO|CONFIG|DOC|INFERENCIA|SUPUESTO|STAKEHOLDER|NOTEBOOKLM)\]' "$TARGET" | wc -l | tr -d ' ')
LINES=$(wc -l < "$TARGET" | tr -d ' ')
if [ "$LINES" -gt 0 ]; then
  DENSITY=$((TAGS * 100 / LINES))
  if [ "$TAGS" -lt 3 ]; then
    echo "  ⚠️  Low evidence tags: $TAGS in $LINES lines"
    WARNINGS=$((WARNINGS + 1))
  else
    echo "  ✓ Evidence tags: $TAGS ($DENSITY% density)"
  fi
fi

# Check 3: Metacognitive closing
if ! grep -qE "(Confianza global|METADATA DE RAZONAMIENTO)" "$TARGET"; then
  echo "  ⚠️  Missing metacognitive closing"
  WARNINGS=$((WARNINGS + 1))
fi

# Check 4: Author signature
if ! grep -q "Javier Monta" "$TARGET"; then
  echo "  ⚠️  Missing author signature"
  WARNINGS=$((WARNINGS + 1))
fi

# ==== ADD DOMAIN-SPECIFIC CHECKS HERE ====
# Example: check for specific Scope Items, module sections, etc.

echo ""
echo "=== Results ==="
echo "Errors: $ERRORS, Warnings: $WARNINGS"

if [ "$ERRORS" -eq 0 ]; then
  exit 0
else
  exit 1
fi

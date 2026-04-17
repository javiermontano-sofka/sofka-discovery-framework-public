#!/usr/bin/env bash
# validate-tot-output.sh
# Validates that a ToT-generated deliverable has all 4 phases + metadata closing.
# Author: Diseñado por Javier Montaño

set -o pipefail

FILE="${1:-}"

if [ -z "$FILE" ] || [ ! -f "$FILE" ]; then
  echo "Usage: $0 <path-to-tot-output.md>"
  exit 1
fi

echo "=== ToT Output Validation ==="
echo "File: $FILE"
echo ""

ERRORS=0
WARNINGS=0

# Check 1: FASE 0 present
if grep -qiE "FASE 0|fase 0|phase 0" "$FILE"; then
  echo "✅ FASE 0 (Definición) presente"
else
  echo "❌ FASE 0 ausente"
  ERRORS=$((ERRORS + 1))
fi

# Check 2: FASE 1 (Branching)
if grep -qiE "FASE 1|fase 1|branching|divergent|RAMA-" "$FILE"; then
  echo "✅ FASE 1 (Branching) presente"
else
  echo "❌ FASE 1 ausente"
  ERRORS=$((ERRORS + 1))
fi

# Check 3: FASE 2 (Evaluate)
if grep -qiE "FASE 2|fase 2|evaluate|confianza|evaluator" "$FILE"; then
  echo "✅ FASE 2 (Evaluate) presente"
else
  echo "❌ FASE 2 ausente"
  ERRORS=$((ERRORS + 1))
fi

# Check 4: FASE 3 (Prune & Synthesize)
if grep -qiE "FASE 3|fase 3|prune|synthesiz|poda|sintesis" "$FILE"; then
  echo "✅ FASE 3 (Prune & Synthesize) presente"
else
  echo "❌ FASE 3 ausente"
  ERRORS=$((ERRORS + 1))
fi

# Check 5: FASE 4 (Expand)
if grep -qiE "FASE 4|fase 4|expand|consenso|solución final|solucion final" "$FILE"; then
  echo "✅ FASE 4 (Expand) presente"
else
  echo "❌ FASE 4 ausente"
  ERRORS=$((ERRORS + 1))
fi

# Check 6: Metacognitive closing block
if grep -qE "METADATA DE RAZONAMIENTO" "$FILE"; then
  echo "✅ Metadata de Razonamiento presente"
  for field in "Confianza global" "Comité activo" "Fuentes consultadas" "Recomendación siguiente paso"; do
    if grep -q "$field" "$FILE"; then
      echo "   ✓ Campo: $field"
    else
      echo "   ⚠ Campo faltante: $field"
      WARNINGS=$((WARNINGS + 1))
    fi
  done
else
  echo "❌ Metadata de Razonamiento ausente"
  ERRORS=$((ERRORS + 1))
fi

# Check 7: Evidence tags density
TOTAL_TAGS=$(grep -oE '\[(CÓDIGO|CODIGO|CONFIG|DOC|INFERENCIA|SUPUESTO|STAKEHOLDER|AUTOCOMPLETADO|POR_CONFIRMAR|EXTRAIDO_HILO|MEMORIA|CONOCIMIENTO|WEB|ADJUNTO|VACIO_CRITICO)\]' "$FILE" | wc -l | tr -d ' ')
LINES=$(wc -l < "$FILE" | tr -d ' ')

if [ "$TOTAL_TAGS" -lt 5 ]; then
  echo "⚠ Pocos evidence tags ($TOTAL_TAGS en $LINES líneas)"
  WARNINGS=$((WARNINGS + 1))
else
  echo "✅ Evidence tags: $TOTAL_TAGS"
fi

# Check 8: Author signature
if grep -q "Javier Montaño\|Javier Montano" "$FILE"; then
  echo "✅ Firma Javier Montaño presente"
else
  echo "⚠ Firma Javier Montaño ausente"
  WARNINGS=$((WARNINGS + 1))
fi

echo ""
echo "=== Results ==="
echo "Errors: $ERRORS"
echo "Warnings: $WARNINGS"

if [ "$ERRORS" -eq 0 ]; then
  echo "✅ TOT OUTPUT VALID"
  exit 0
else
  echo "❌ TOT OUTPUT INVALID"
  exit 1
fi

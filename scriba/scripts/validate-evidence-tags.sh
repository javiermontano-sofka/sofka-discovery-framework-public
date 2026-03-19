#!/bin/bash
# validate-evidence-tags.sh
# Validates that editorial output files contain required evidence tags
# Part of Asistente Scriba plugin — SOAP pipeline G0 gate

FILE="$1"

if [ -z "$FILE" ]; then
  echo "Usage: validate-evidence-tags.sh <file>"
  exit 1
fi

if [ ! -f "$FILE" ]; then
  exit 0
fi

# Only validate markdown files in output directories
case "$FILE" in
  *.md) ;;
  *) exit 0 ;;
esac

# Count evidence tags
METODOLOGIA=$(grep -c '\[METODOLOGIA\]' "$FILE" 2>/dev/null || echo 0)
NEUROCIENCIA=$(grep -c '\[NEUROCIENCIA\]' "$FILE" 2>/dev/null || echo 0)
PEDAGOGIA=$(grep -c '\[PEDAGOGIA\]' "$FILE" 2>/dev/null || echo 0)
INFERENCIA=$(grep -c '\[INFERENCIA\]' "$FILE" 2>/dev/null || echo 0)
SUPUESTO=$(grep -c '\[SUPUESTO\]' "$FILE" 2>/dev/null || echo 0)

TOTAL=$((METODOLOGIA + NEUROCIENCIA + PEDAGOGIA + INFERENCIA + SUPUESTO))

# Skip files with less than 10 lines (likely not editorial content)
LINES=$(wc -l < "$FILE" 2>/dev/null || echo 0)
if [ "$LINES" -lt 10 ]; then
  exit 0
fi

# Warn if no evidence tags found in substantial content
if [ "$TOTAL" -eq 0 ]; then
  echo "SCRIBA-G0: No evidence tags found in $FILE. Editorial content requires [METODOLOGIA], [NEUROCIENCIA], [PEDAGOGIA], [INFERENCIA], or [SUPUESTO] tags."
fi

# Warn if >30% is SUPUESTO
if [ "$TOTAL" -gt 0 ]; then
  SUPUESTO_PCT=$((SUPUESTO * 100 / TOTAL))
  if [ "$SUPUESTO_PCT" -gt 30 ]; then
    echo "SCRIBA-G0: >30% of evidence tags in $FILE are [SUPUESTO]. Content requires validation with primary sources."
  fi
fi

exit 0

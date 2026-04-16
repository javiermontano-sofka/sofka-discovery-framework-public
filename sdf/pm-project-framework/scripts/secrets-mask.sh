#!/usr/bin/env bash
# secrets-mask.sh — Reversible tokenization of detected secrets
# PMO-APEX v1.0 — Agentic Project Management as Service
# © 2026 PMO-APEX. All Rights Reserved.

set -euo pipefail

TARGET_DIR="${1:-.}"
PROJECT_DIR="$TARGET_DIR/project"
AUDIT_LOG="$PROJECT_DIR/apex-secrets-audit.log"
SECRETS_MAP="$PROJECT_DIR/apex-secrets-map.json"

if [ ! -f "$AUDIT_LOG" ]; then
  echo "No audit log found. Run secrets-scan.sh first."
  exit 1
fi

# Parse audit log for findings
FINDINGS=$(grep -E '^\[' "$AUDIT_LOG" 2>/dev/null || true)

if [ -z "$FINDINGS" ]; then
  echo "No findings to mask. Repository is clean."
  exit 0
fi

# Initialize secrets map
echo '{' > "$SECRETS_MAP"
echo '  "masked_at": "'$(date -u +%Y-%m-%dT%H:%M:%SZ)'",' >> "$SECRETS_MAP"
echo '  "entries": [' >> "$SECRETS_MAP"

COUNTER=0
FIRST=true

while IFS= read -r finding; do
  [ -z "$finding" ] && continue

  # Parse: [Type] file:line
  type=$(echo "$finding" | sed -n 's/^\[\(.*\)\] .*/\1/p')
  file_line=$(echo "$finding" | sed -n 's/^\[.*\] \(.*\)/\1/p')
  file="${file_line%%:*}"
  line_num="${file_line##*:}"

  filepath="$TARGET_DIR/$file"
  [ -f "$filepath" ] || continue

  COUNTER=$((COUNTER + 1))
  PLACEHOLDER="[APEX_MASKED_${COUNTER}]"

  # Extract the actual secret value from the line
  line_content=$(sed -n "${line_num}p" "$filepath" 2>/dev/null || true)
  [ -z "$line_content" ] && continue

  # Record mapping (for potential reversibility — NEVER commit this file)
  if [ "$FIRST" = true ]; then
    FIRST=false
  else
    echo '    ,' >> "$SECRETS_MAP"
  fi

  # Escape for JSON
  escaped_line=$(echo "$line_content" | sed 's/\\/\\\\/g; s/"/\\"/g')

  cat >> "$SECRETS_MAP" << ENTRY
    {
      "id": $COUNTER,
      "type": "$type",
      "file": "$file",
      "line": $line_num,
      "placeholder": "$PLACEHOLDER",
      "original_line": "$escaped_line"
    }
ENTRY

  echo "  Masked: [$type] $file:$line_num -> $PLACEHOLDER"

done <<< "$FINDINGS"

echo '  ]' >> "$SECRETS_MAP"
echo '}' >> "$SECRETS_MAP"

echo ""
echo "Masked $COUNTER secret(s). Map saved to project/apex-secrets-map.json"
echo "NEVER commit apex-secrets-map.json — it contains original values."
echo "   The map file is gitignored by default."

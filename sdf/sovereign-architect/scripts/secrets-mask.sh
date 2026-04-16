#!/usr/bin/env bash
# Sovereign Architect — Secrets Masker
# Masks sensitive data in sa/ deliverables before sharing (non-destructive)
# © 2026 JM Labs · Javier Montaño
set -euo pipefail

TARGET_DIR="${1:-$(pwd)}/sa"
MASKED_DIR="$TARGET_DIR/.masked"
LOG_FILE="$MASKED_DIR/masking-log.md"

echo "## SA Secrets Masker"
echo ""

if [[ ! -d "$TARGET_DIR" ]]; then
  echo "- No sa/ directory found. Nothing to mask."
  exit 0
fi

mkdir -p "$MASKED_DIR"

# Initialize masking log
cat > "$LOG_FILE" <<EOF
# Masking Log — $(date -u '+%Y-%m-%dT%H:%M:%SZ')

| File | Pattern | Count |
|------|---------|-------|
EOF

TOTAL_MASKED=0
FILES_PROCESSED=0

# Patterns to mask
PATTERNS=(
  'AKIA[0-9A-Z]{16}'                        # AWS Access Key
  'AIza[0-9A-Za-z_-]{35}'                   # Google API Key
  'sk-[0-9a-zA-Z]{20,}'                     # OpenAI / Stripe secret key
  'ghp_[0-9a-zA-Z]{36}'                     # GitHub PAT
  'glpat-[0-9a-zA-Z_-]{20}'                 # GitLab PAT
  'xox[bpors]-[0-9a-zA-Z-]+'                # Slack tokens
  'password[[:space:]]*[:=][[:space:]]*\S+'  # password assignments
  'secret[[:space:]]*[:=][[:space:]]*\S+'    # secret assignments
  'token[[:space:]]*[:=][[:space:]]*\S+'     # token assignments
  'mongodb(\+srv)?://[^[:space:]]+'          # MongoDB connection strings
  'postgres(ql)?://[^[:space:]]+'            # PostgreSQL connection strings
  'mysql://[^[:space:]]+'                    # MySQL connection strings
  'redis://[^[:space:]]+'                    # Redis connection strings
)

PATTERN_NAMES=(
  "AWS Access Key" "Google API Key" "OpenAI/Stripe Key" "GitHub PAT"
  "GitLab PAT" "Slack Token" "Password" "Secret" "Token"
  "MongoDB URI" "PostgreSQL URI" "MySQL URI" "Redis URI"
)

# Process each file in sa/
for src_file in "$TARGET_DIR"/*.md "$TARGET_DIR"/*.json "$TARGET_DIR"/**/*.md; do
  [[ -f "$src_file" ]] 2>/dev/null || continue
  [[ "$src_file" == *".masked"* ]] && continue

  BASENAME=$(basename "$src_file")
  RELPATH="${src_file#$TARGET_DIR/}"
  MASKED_FILE="$MASKED_DIR/$BASENAME"

  # Copy file to masked directory
  cp "$src_file" "$MASKED_FILE"
  FILE_MASK_COUNT=0

  # Apply each pattern
  for i in "${!PATTERNS[@]}"; do
    PATTERN="${PATTERNS[$i]}"
    NAME="${PATTERN_NAMES[$i]}"

    MATCH_COUNT=$(grep -cE "$PATTERN" "$MASKED_FILE" 2>/dev/null || echo "0")
    if [[ "$MATCH_COUNT" -gt 0 ]]; then
      # Replace matches with [MASKED] using sed
      sed -i.bak -E "s/$PATTERN/[MASKED]/g" "$MASKED_FILE" 2>/dev/null || true
      rm -f "$MASKED_FILE.bak"
      FILE_MASK_COUNT=$((FILE_MASK_COUNT + MATCH_COUNT))
      echo "| $RELPATH | $NAME | $MATCH_COUNT |" >> "$LOG_FILE"
    fi
  done

  FILES_PROCESSED=$((FILES_PROCESSED + 1))
  TOTAL_MASKED=$((TOTAL_MASKED + FILE_MASK_COUNT))

  if [[ $FILE_MASK_COUNT -gt 0 ]]; then
    echo "- Masked $FILE_MASK_COUNT pattern(s) in $BASENAME"
  fi
done

echo "" >> "$LOG_FILE"
echo "> **Total masked**: $TOTAL_MASKED patterns across $FILES_PROCESSED files." >> "$LOG_FILE"

echo ""
if [[ $TOTAL_MASKED -eq 0 ]]; then
  echo "> **No secrets found** in $FILES_PROCESSED files. Copies created in $MASKED_DIR"
else
  echo "> **$TOTAL_MASKED patterns masked** across $FILES_PROCESSED files → $MASKED_DIR"
fi

exit 0

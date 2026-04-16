#!/usr/bin/env bash
# Sovereign Architect — Repository Indexer
# Generates a structured JSON inventory of the repository at sa/repo-index.json
# © 2026 JM Labs · Javier Montaño
set -euo pipefail

TARGET_DIR="${1:-$(pwd)}"
SA_DIR="$TARGET_DIR/sa"
OUTPUT="$SA_DIR/repo-index.json"

echo "## SA Repository Indexer"
echo ""

mkdir -p "$SA_DIR"

# Collect file list respecting .gitignore
if [[ -d "$TARGET_DIR/.git" ]]; then
  FILE_LIST=$(git -C "$TARGET_DIR" ls-files 2>/dev/null || find "$TARGET_DIR" -type f -not -path '*/.git/*' -not -path '*/node_modules/*')
else
  FILE_LIST=$(find "$TARGET_DIR" -type f -not -path '*/.git/*' -not -path '*/node_modules/*' -not -path '*/sa/*' 2>/dev/null)
fi

# Counters
SRC=0; TEST=0; CONFIG=0; DOC=0; SCRIPT=0; MIGRATION=0; SCHEMA=0; ASSET=0; OTHER=0
TOTAL=0

# Language LOC counters (associative array)
declare -A LANG_LOC

# Categorize files
while IFS= read -r filepath; do
  [[ -z "$filepath" ]] && continue
  TOTAL=$((TOTAL + 1))
  BASENAME=$(basename "$filepath")
  EXT="${BASENAME##*.}"

  # Categorize by path and extension
  case "$filepath" in
    *test*|*spec*|*__tests__*|*_test.*)    TEST=$((TEST + 1)) ;;
    *migration*|*migrate*)                  MIGRATION=$((MIGRATION + 1)) ;;
    *schema*|*.prisma|*.graphql)            SCHEMA=$((SCHEMA + 1)) ;;
    *.md|*.txt|*.rst|*.adoc)               DOC=$((DOC + 1)) ;;
    *.sh|*.bash|*.zsh)                      SCRIPT=$((SCRIPT + 1)) ;;
    *.png|*.jpg|*.svg|*.ico|*.woff*)       ASSET=$((ASSET + 1)) ;;
    *.json|*.yaml|*.yml|*.toml|*.ini|*.cfg) CONFIG=$((CONFIG + 1)) ;;
    *.js|*.ts|*.py|*.go|*.rs|*.java|*.rb|*.cs|*.cpp|*.c|*.swift|*.kt)
      SRC=$((SRC + 1))
      ;;
    *) OTHER=$((OTHER + 1)) ;;
  esac

  # Count LOC by language extension (source files only)
  case "$EXT" in
    js|ts|tsx|jsx|py|go|rs|java|rb|cs|cpp|c|swift|kt|sh)
      if [[ -f "$TARGET_DIR/$filepath" ]]; then
        LOC=$(wc -l < "$TARGET_DIR/$filepath" 2>/dev/null | tr -d ' ' || echo "0")
      elif [[ -f "$filepath" ]]; then
        LOC=$(wc -l < "$filepath" 2>/dev/null | tr -d ' ' || echo "0")
      else
        LOC=0
      fi
      LANG_LOC[$EXT]=$(( ${LANG_LOC[$EXT]:-0} + LOC ))
      ;;
  esac
done <<< "$FILE_LIST"

# Detect manifests
MANIFESTS="[]"
MANIFEST_ENTRIES=""
for manifest in package.json Cargo.toml go.mod pyproject.toml pom.xml build.gradle composer.json Gemfile; do
  if [[ -f "$TARGET_DIR/$manifest" ]]; then
    VERSION="unknown"
    case "$manifest" in
      package.json)
        VERSION=$(grep -o '"version":\s*"[^"]*"' "$TARGET_DIR/$manifest" 2>/dev/null | head -1 | sed 's/.*"version":[[:space:]]*"//;s/"//' || echo "unknown") ;;
    esac
    MANIFEST_ENTRIES="${MANIFEST_ENTRIES}    {\"file\": \"$manifest\", \"version\": \"$VERSION\"},"
  fi
done
# Trim trailing comma
MANIFEST_ENTRIES="${MANIFEST_ENTRIES%,}"

# Build LOC JSON
LOC_ENTRIES=""
for lang in "${!LANG_LOC[@]}"; do
  LOC_ENTRIES="${LOC_ENTRIES}    \"$lang\": ${LANG_LOC[$lang]},"
done
LOC_ENTRIES="${LOC_ENTRIES%,}"

# Write JSON output
cat > "$OUTPUT" <<EOF
{
  "generatedAt": "$(date -u '+%Y-%m-%dT%H:%M:%SZ')",
  "repository": "$TARGET_DIR",
  "totalFiles": $TOTAL,
  "categories": {
    "source": $SRC,
    "test": $TEST,
    "config": $CONFIG,
    "doc": $DOC,
    "script": $SCRIPT,
    "migration": $MIGRATION,
    "schema": $SCHEMA,
    "asset": $ASSET,
    "other": $OTHER
  },
  "locByLanguage": {
$LOC_ENTRIES
  },
  "manifests": [
$MANIFEST_ENTRIES
  ]
}
EOF

echo "- Total files indexed: $TOTAL"
echo "- Source: $SRC | Test: $TEST | Config: $CONFIG | Doc: $DOC"
echo "- Script: $SCRIPT | Migration: $MIGRATION | Schema: $SCHEMA | Asset: $ASSET"
echo ""
echo "> Inventory written to $OUTPUT"

exit 0

#!/usr/bin/env bash
# Sovereign Architect — Skill Converter (Cross-Platform)
# Converts SA MOAT skills to Cursor, Codex, Gemini, Aider, Windsurf formats
# © 2026 JM Labs · Javier Montaño
set -euo pipefail

SA_DIR="$(cd "$(dirname "$0")/.." && pwd)"
SKILLS_DIR="$SA_DIR/skills"
TARGET_FORMAT="${1:-}"
OUTPUT_BASE="${2:-$(pwd)/sa/converted}"

# Validate input
if [[ -z "$TARGET_FORMAT" ]]; then
  echo "## SA Skill Converter"
  echo ""
  echo "Usage: convert-skills.sh <format> [output-dir]"
  echo ""
  echo "Supported formats:"
  echo "  cursor    — .cursorrules files"
  echo "  codex     — Codex instruction blocks"
  echo "  gemini    — Gemini system instruction format"
  echo "  aider     — .aider.conf.yml conventions"
  echo "  windsurf  — Windsurf rule files"
  exit 1
fi

# Validate format
case "$TARGET_FORMAT" in
  cursor|codex|gemini|aider|windsurf) ;;
  *) echo "Error: Unknown format '$TARGET_FORMAT'. Use: cursor|codex|gemini|aider|windsurf"; exit 1 ;;
esac

OUTPUT_DIR="$OUTPUT_BASE/$TARGET_FORMAT"
mkdir -p "$OUTPUT_DIR"

echo "## SA Skill Converter → $TARGET_FORMAT"
echo ""

CONVERTED=0

# Find all SKILL.md files
for skill_file in "$SKILLS_DIR"/*/SKILL.md; do
  [[ -f "$skill_file" ]] || continue
  SKILL_NAME=$(basename "$(dirname "$skill_file")")

  # Extract frontmatter title (line after first ---)
  TITLE=$(sed -n '/^---$/,/^---$/{ /^title:/s/title:[[:space:]]*//p; }' "$skill_file" 2>/dev/null || echo "$SKILL_NAME")
  [[ -z "$TITLE" ]] && TITLE="$SKILL_NAME"

  # Extract body (everything after second ---)
  BODY=$(awk 'BEGIN{c=0} /^---$/{c++; next} c>=2{print}' "$skill_file" 2>/dev/null || echo "")

  case "$TARGET_FORMAT" in
    cursor)
      cat > "$OUTPUT_DIR/${SKILL_NAME}.cursorrules" <<EOF
# $TITLE
# Converted from Sovereign Architect SKILL.md
# Source: $SKILL_NAME/SKILL.md

$BODY
EOF
      ;;
    codex)
      cat > "$OUTPUT_DIR/${SKILL_NAME}.md" <<EOF
# Codex Instruction: $TITLE

## Context
Converted from Sovereign Architect skill: $SKILL_NAME

## Instructions
$BODY
EOF
      ;;
    gemini)
      cat > "$OUTPUT_DIR/${SKILL_NAME}.txt" <<EOF
[System Instruction — $TITLE]

$BODY

[End Instruction]
EOF
      ;;
    aider)
      cat > "$OUTPUT_DIR/${SKILL_NAME}.aider.md" <<EOF
# $TITLE
# Aider convention — converted from SA skill

$BODY
EOF
      ;;
    windsurf)
      cat > "$OUTPUT_DIR/${SKILL_NAME}.windrule" <<EOF
---
name: $TITLE
source: sovereign-architect/$SKILL_NAME
---

$BODY
EOF
      ;;
  esac

  CONVERTED=$((CONVERTED + 1))
  echo "- Converted: $SKILL_NAME → $TARGET_FORMAT"
done

echo ""
echo "> **$CONVERTED skills** converted to $TARGET_FORMAT format in $OUTPUT_DIR"

exit 0

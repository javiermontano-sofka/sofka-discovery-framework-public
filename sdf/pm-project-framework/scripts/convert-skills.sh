#!/usr/bin/env bash
# convert-skills.sh — Cross-platform skill converter for APEX MOAT skills
# PMO-APEX v1.0 — Agentic Project Management as Service
# © 2026 PMO-APEX. All Rights Reserved.
#
# Converts SKILL.md files to formats compatible with other AI coding tools.
#
# Usage: convert-skills.sh <TARGET> [SKILL_DIR] [OUTPUT_DIR]
#   TARGET: cursor | codex | gemini | aider | windsurf | all
#   SKILL_DIR: Directory containing SKILL.md files (default: ./skills/)
#   OUTPUT_DIR: Output directory (default: ./converted/)

set -euo pipefail

TARGET="${1:-all}"
SKILL_DIR="${2:-./skills}"
OUTPUT_DIR="${3:-./converted}"
TIMESTAMP="$(date -u +%Y-%m-%dT%H:%M:%SZ)"

if [ ! -d "$SKILL_DIR" ]; then
  echo "Skill directory not found: $SKILL_DIR"
  exit 1
fi

mkdir -p "$OUTPUT_DIR"

# ─── Helper: Extract frontmatter fields ───
extract_field() {
  local file="$1" field="$2"
  sed -n '/^---$/,/^---$/p' "$file" | grep "^${field}:" | head -1 | sed "s/^${field}:[[:space:]]*//" | sed 's/^"//;s/"$//'
}

# ─── Helper: Extract body (after frontmatter) ───
extract_body() {
  local file="$1"
  sed '1,/^---$/d' "$file" | sed '1,/^---$/d'
}

# ─── Helper: Strip Claude-specific tool references ───
strip_claude_tools() {
  sed \
    -e 's/allowed-tools:.*$//' \
    -e 's/\bAgent tool\b/subagent/g' \
    -e 's/\bBash tool\b/terminal/g' \
    -e 's/\bRead tool\b/file reader/g' \
    -e 's/\bWrite tool\b/file writer/g' \
    -e 's/\bEdit tool\b/file editor/g' \
    -e 's/\bGrep tool\b/search/g' \
    -e 's/\bGlob tool\b/file finder/g'
}

# ─── Convert: Cursor (.cursor/rules/*.mdc) ───
convert_cursor() {
  local out="$OUTPUT_DIR/cursor/.cursor/rules"
  mkdir -p "$out"

  find "$SKILL_DIR" -name "SKILL.md" -type f | while read -r skill_file; do
    local skill_name
    skill_name=$(extract_field "$skill_file" "name")
    [ -z "$skill_name" ] && skill_name=$(basename "$(dirname "$skill_file")")
    local description
    description=$(extract_field "$skill_file" "description")
    local body
    body=$(extract_body "$skill_file" | strip_claude_tools)

    cat > "$out/${skill_name}.mdc" <<CURSOREOF
---
description: $description
globs:
alwaysApply: false
---

# $skill_name

$body
CURSOREOF
  done

  echo "  cursor: $(find "$out" -name "*.mdc" | wc -l | tr -d ' ') rules -> $out/"
}

# ─── Convert: Codex CLI (AGENTS.md) ───
convert_codex() {
  local out="$OUTPUT_DIR/codex"
  mkdir -p "$out"
  local agents_file="$out/AGENTS.md"

  cat > "$agents_file" <<HEADER
# AGENTS.md — Converted from APEX MOAT Skills
# Generated: $TIMESTAMP
# Source: PMO-APEX Project Framework

HEADER

  find "$SKILL_DIR" -name "SKILL.md" -type f | sort | while read -r skill_file; do
    local skill_name
    skill_name=$(extract_field "$skill_file" "name")
    [ -z "$skill_name" ] && skill_name=$(basename "$(dirname "$skill_file")")
    local body
    body=$(extract_body "$skill_file" | strip_claude_tools | head -80)

    cat >> "$agents_file" <<CODEXEOF

---

## $skill_name

$body

CODEXEOF
  done

  echo "  codex: AGENTS.md -> $agents_file"
}

# ─── Convert: Gemini CLI (.gemini/style.md) ───
convert_gemini() {
  local out="$OUTPUT_DIR/gemini/.gemini"
  mkdir -p "$out"
  local style_file="$out/style.md"

  cat > "$style_file" <<HEADER
# Gemini Style Guide — Converted from APEX MOAT Skills
# Generated: $TIMESTAMP

HEADER

  find "$SKILL_DIR" -name "SKILL.md" -type f | sort | while read -r skill_file; do
    local skill_name
    skill_name=$(extract_field "$skill_file" "name")
    [ -z "$skill_name" ] && skill_name=$(basename "$(dirname "$skill_file")")
    local description
    description=$(extract_field "$skill_file" "description")
    local body
    body=$(extract_body "$skill_file" | strip_claude_tools | head -60)

    cat >> "$style_file" <<GEMEOF

## $skill_name

> $description

$body

GEMEOF
  done

  echo "  gemini: style.md -> $style_file"
}

# ─── Convert: Aider (.aider.conf.yml) ───
convert_aider() {
  local out="$OUTPUT_DIR/aider"
  mkdir -p "$out"
  local conventions_file="$out/CONVENTIONS.md"

  cat > "$conventions_file" <<HEADER
# CONVENTIONS.md — Converted from APEX MOAT Skills
# Generated: $TIMESTAMP
# Usage: Place in project root for Aider to read automatically

HEADER

  find "$SKILL_DIR" -name "SKILL.md" -type f | sort | while read -r skill_file; do
    local skill_name
    skill_name=$(extract_field "$skill_file" "name")
    [ -z "$skill_name" ] && skill_name=$(basename "$(dirname "$skill_file")")
    local body
    body=$(extract_body "$skill_file" | strip_claude_tools | head -50)

    cat >> "$conventions_file" <<AIDEREOF

## $skill_name

$body

AIDEREOF
  done

  echo "  aider: CONVENTIONS.md -> $conventions_file"
}

# ─── Convert: Windsurf (.windsurfrules) ───
convert_windsurf() {
  local out="$OUTPUT_DIR/windsurf"
  mkdir -p "$out"
  local rules_file="$out/.windsurfrules"

  cat > "$rules_file" <<HEADER
# .windsurfrules — Converted from APEX MOAT Skills
# Generated: $TIMESTAMP

HEADER

  find "$SKILL_DIR" -name "SKILL.md" -type f | sort | while read -r skill_file; do
    local skill_name
    skill_name=$(extract_field "$skill_file" "name")
    [ -z "$skill_name" ] && skill_name=$(basename "$(dirname "$skill_file")")
    local body
    body=$(extract_body "$skill_file" | strip_claude_tools | head -60)

    cat >> "$rules_file" <<WSEOF

## $skill_name

$body

WSEOF
  done

  echo "  windsurf: .windsurfrules -> $rules_file"
}

# ─── Execute Conversion ───
echo "APEX Cross-Platform Skill Converter"
echo "===================================="
echo "Source: $SKILL_DIR"
echo "Target: $TARGET"
echo "Output: $OUTPUT_DIR"
echo ""

SKILL_COUNT=$(find "$SKILL_DIR" -name "SKILL.md" -type f | wc -l | tr -d ' ')
echo "Found $SKILL_COUNT MOAT skills to convert."
echo ""

case "$TARGET" in
  cursor)   convert_cursor ;;
  codex)    convert_codex ;;
  gemini)   convert_gemini ;;
  aider)    convert_aider ;;
  windsurf) convert_windsurf ;;
  all)
    convert_cursor
    convert_codex
    convert_gemini
    convert_aider
    convert_windsurf
    ;;
  *)
    echo "Unknown target: $TARGET"
    echo "  Supported: cursor | codex | gemini | aider | windsurf | all"
    exit 1
    ;;
esac

echo ""
echo "Conversion complete. Output in $OUTPUT_DIR/"

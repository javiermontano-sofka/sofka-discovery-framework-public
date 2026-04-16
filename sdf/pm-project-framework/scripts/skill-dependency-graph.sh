#!/usr/bin/env bash
# skill-dependency-graph.sh — Generates skill dependency graph from SKILL.md metadata
# PMO-APEX v1.0 — Agentic Project Management as Service
# © 2026 PMO-APEX. All Rights Reserved.
#
# Usage: skill-dependency-graph.sh [SKILLS_DIR] [OUTPUT_FORMAT]
#   OUTPUT_FORMAT: mermaid (default) | json | text

set -euo pipefail

SKILLS_DIR="${1:-./skills}"
FORMAT="${2:-mermaid}"

if [ ! -d "$SKILLS_DIR" ]; then
  echo "Skills directory not found: $SKILLS_DIR"
  exit 1
fi

# ─── Extract dependencies from "Assigned Skills" tables ───
declare -A DEPS

find "$SKILLS_DIR" -name "SKILL.md" -type f | while read -r skill_file; do
  SKILL_NAME=$(basename "$(dirname "$skill_file")")

  # Extract skills referenced in "Assigned Skills" section
  ASSIGNED=$(sed -n '/## Assigned Skills/,/^## /p' "$skill_file" 2>/dev/null | \
    grep '|' | grep -v '^\|.*Skill.*Role' | grep -v '^|---' | \
    awk -F'|' '{gsub(/^[ \t`]+|[ \t`]+$/, "", $2); if ($2 != "" && $2 != "Skill") print $2}' | \
    grep -v "(self)" | \
    sed 's/ *(.*//' | \
    tr '\n' ',' | sed 's/,$//')

  if [ -n "$ASSIGNED" ]; then
    echo "$SKILL_NAME|$ASSIGNED"
  fi
done > /tmp/apex-deps.txt

case "$FORMAT" in
  mermaid)
    echo "graph TD"
    echo "  %% APEX Skill Dependency Graph"
    echo "  %% Generated: $(date -u +%Y-%m-%dT%H:%M:%SZ)"
    echo ""

    while IFS='|' read -r skill deps; do
      IFS=',' read -ra DEP_ARRAY <<< "$deps"
      for dep in "${DEP_ARRAY[@]}"; do
        dep=$(echo "$dep" | tr -d ' ')
        [ -n "$dep" ] && echo "  $skill --> $dep"
      done
    done < /tmp/apex-deps.txt

    echo ""
    echo "  %% Styling"
    echo "  classDef core fill:#2563EB,stroke:#1D4ED8,color:#fff"
    echo "  classDef phase fill:#F0F4FF,stroke:#2563EB"
    echo "  class project-orchestrator,pipeline-governance,input-analysis core"
    ;;

  json)
    echo "{"
    echo "  \"generated\": \"$(date -u +%Y-%m-%dT%H:%M:%SZ)\","
    echo "  \"dependencies\": {"
    FIRST=true
    while IFS='|' read -r skill deps; do
      [ "$FIRST" = true ] && FIRST=false || echo ","
      echo -n "    \"$skill\": [$(echo "$deps" | sed 's/\([^,]*\)/"\1"/g')]"
    done < /tmp/apex-deps.txt
    echo ""
    echo "  }"
    echo "}"
    ;;

  text)
    echo "APEX Skill Dependencies"
    echo "======================="
    while IFS='|' read -r skill deps; do
      echo "$skill -> $deps"
    done < /tmp/apex-deps.txt
    ;;
esac

rm -f /tmp/apex-deps.txt

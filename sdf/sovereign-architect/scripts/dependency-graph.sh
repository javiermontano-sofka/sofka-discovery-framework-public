#!/usr/bin/env bash
# Sovereign Architect — Skill Dependency Graph
# Generates a Mermaid dependency visualization from skill metadata
# © 2026 JM Labs · Javier Montaño
set -euo pipefail

SKILLS_DIR="${1:-$(dirname "$0")/../skills}"
OUTPUT="${2:-$(pwd)/sa/dependency-graph.mmd}"

if [[ ! -d "$SKILLS_DIR" ]]; then
  echo "ERROR: Skills directory not found: $SKILLS_DIR"
  exit 1
fi

mkdir -p "$(dirname "$OUTPUT")"

echo "## Skill Dependency Graph"
echo ""

# Build Mermaid graph
{
  echo "graph TD"
  echo "  classDef core fill:#4A90D9,stroke:#333,color:#fff"
  echo "  classDef support fill:#f0f0f0,stroke:#666,color:#333"
  echo ""

  for skill_dir in "$SKILLS_DIR"/*/; do
    [[ -d "$skill_dir" ]] || continue
    SKILL_NAME=$(basename "$skill_dir")
    SKILL_FILE="$skill_dir/SKILL.md"

    if [[ -f "$SKILL_FILE" ]]; then
      # Extract dependencies from frontmatter (depends-on field)
      DEPS=$(grep -E "^depends-on:" "$SKILL_FILE" 2>/dev/null | sed 's/depends-on:\s*//' | tr ',' '\n' | tr -d ' ')
      NODE_ID=$(echo "$SKILL_NAME" | tr '-' '_')

      echo "  $NODE_ID[\"$SKILL_NAME\"]"

      for dep in $DEPS; do
        [[ -n "$dep" ]] || continue
        DEP_ID=$(echo "$dep" | tr '-' '_')
        echo "  $DEP_ID --> $NODE_ID"
      done
    fi
  done
} > "$OUTPUT"

SKILL_COUNT=$(find "$SKILLS_DIR" -maxdepth 1 -type d | wc -l | tr -d ' ')
SKILL_COUNT=$((SKILL_COUNT - 1))

echo "- Scanned **$SKILL_COUNT** skills"
echo "- Graph written to: $OUTPUT"
echo ""
echo "> Render with: \`scripts/render-mermaid.sh $OUTPUT\`"

exit 0

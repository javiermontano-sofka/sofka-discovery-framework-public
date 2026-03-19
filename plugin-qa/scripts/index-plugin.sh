#!/usr/bin/env bash
# Plugin QA — Plugin Indexer
# Generates a structured JSON inventory of the target plugin
# (c) 2026 JM Labs - Javier Montano
set -euo pipefail

TARGET_DIR="${1:-$(pwd)}"
PQA_DIR="$TARGET_DIR/pqa"
OUTPUT="$PQA_DIR/plugin-index.json"

mkdir -p "$PQA_DIR"

# Detect plugin
PLUGIN_NAME="unknown"
PLUGIN_VERSION="unknown"
for manifest in "$TARGET_DIR/.claude-plugin/plugin.json" "$TARGET_DIR/plugin.json"; do
  if [[ -f "$manifest" ]]; then
    PLUGIN_NAME=$(grep -o '"name":\s*"[^"]*"' "$manifest" 2>/dev/null | head -1 | sed 's/"name":[[:space:]]*"//;s/"//' || echo "unknown")
    PLUGIN_VERSION=$(grep -o '"version":\s*"[^"]*"' "$manifest" 2>/dev/null | head -1 | sed 's/"version":[[:space:]]*"//;s/"//' || echo "unknown")
    break
  fi
done

# Count components
SKILLS=0; AGENTS=0; COMMANDS=0; REFS=0
SKILL_LIST=""
AGENT_LIST=""
COMMAND_LIST=""

if [[ -d "$TARGET_DIR/skills" ]]; then
  while IFS= read -r skill; do
    [[ -z "$skill" ]] && continue
    SKILL_NAME=$(basename "$(dirname "$skill")")
    SKILL_LIST="${SKILL_LIST}    \"$SKILL_NAME\","
    SKILLS=$((SKILLS + 1))
  done < <(find "$TARGET_DIR/skills" -name "SKILL.md" -type f 2>/dev/null | sort)
fi

if [[ -d "$TARGET_DIR/agents" ]]; then
  while IFS= read -r agent; do
    [[ -z "$agent" ]] && continue
    AGENT_NAME=$(basename "$agent" .md)
    AGENT_LIST="${AGENT_LIST}    \"$AGENT_NAME\","
    AGENTS=$((AGENTS + 1))
  done < <(find "$TARGET_DIR/agents" -name "*.md" -type f 2>/dev/null | sort)
fi

if [[ -d "$TARGET_DIR/commands" ]]; then
  while IFS= read -r cmd; do
    [[ -z "$cmd" ]] && continue
    CMD_NAME=$(basename "$cmd" .md)
    COMMAND_LIST="${COMMAND_LIST}    \"$CMD_NAME\","
    COMMANDS=$((COMMANDS + 1))
  done < <(find "$TARGET_DIR/commands" -name "*.md" -type f 2>/dev/null | sort)
fi

if [[ -d "$TARGET_DIR/references" ]]; then
  REFS=$(find "$TARGET_DIR/references" -name "*.md" -type f 2>/dev/null | wc -l | tr -d ' ')
fi

# Trim trailing commas
SKILL_LIST="${SKILL_LIST%,}"
AGENT_LIST="${AGENT_LIST%,}"
COMMAND_LIST="${COMMAND_LIST%,}"

HAS_HOOKS=$([[ -f "$TARGET_DIR/hooks/hooks.json" ]] && echo "true" || echo "false")
HAS_SCRIPTS=$([[ -d "$TARGET_DIR/scripts" ]] && echo "true" || echo "false")
HAS_CLAUDE_MD=$([[ -f "$TARGET_DIR/CLAUDE.md" ]] && echo "true" || echo "false")

cat > "$OUTPUT" <<EOF
{
  "generatedAt": "$(date -u '+%Y-%m-%dT%H:%M:%SZ')",
  "plugin": "$PLUGIN_NAME",
  "version": "$PLUGIN_VERSION",
  "path": "$TARGET_DIR",
  "counts": {
    "skills": $SKILLS,
    "agents": $AGENTS,
    "commands": $COMMANDS,
    "references": $REFS
  },
  "infrastructure": {
    "hooks": $HAS_HOOKS,
    "scripts": $HAS_SCRIPTS,
    "claudeMd": $HAS_CLAUDE_MD
  },
  "skills": [
$SKILL_LIST
  ],
  "agents": [
$AGENT_LIST
  ],
  "commands": [
$COMMAND_LIST
  ]
}
EOF

echo "- Plugin indexed: $PLUGIN_NAME v$PLUGIN_VERSION"
echo "- Skills: $SKILLS | Agents: $AGENTS | Commands: $COMMANDS | Refs: $REFS"
echo "> Inventory written to $OUTPUT"

exit 0

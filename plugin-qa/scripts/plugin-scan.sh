#!/usr/bin/env bash
# Plugin QA — Plugin Scanner
# Detects if the working directory contains a Claude Code plugin
# Hook: SessionStart
# (c) 2026 JM Labs - Javier Montano
set -euo pipefail

TARGET_DIR="${1:-$(pwd)}"

echo "## PQA Plugin Scan"
echo ""

FOUND=false
PLUGIN_NAME="unknown"
PLUGIN_VERSION="unknown"
SKILLS=0; AGENTS=0; COMMANDS=0; HOOKS=0

# Check for plugin.json in standard locations
for manifest in "$TARGET_DIR/.claude-plugin/plugin.json" "$TARGET_DIR/plugin.json"; do
  if [[ -f "$manifest" ]]; then
    FOUND=true
    PLUGIN_NAME=$(grep -o '"name":\s*"[^"]*"' "$manifest" 2>/dev/null | head -1 | sed 's/"name":[[:space:]]*"//;s/"//' || echo "unknown")
    PLUGIN_VERSION=$(grep -o '"version":\s*"[^"]*"' "$manifest" 2>/dev/null | head -1 | sed 's/"version":[[:space:]]*"//;s/"//' || echo "unknown")
    break
  fi
done

if [[ "$FOUND" == false ]]; then
  echo "- No Claude Code plugin detected in \`$TARGET_DIR\`."
  echo "- PQA is available but has no target plugin to operate on."
  echo ""
  echo "> Use \`/pqa:create\` to build a new plugin or navigate to a plugin directory."
  exit 0
fi

# Count components
if [[ -d "$TARGET_DIR/skills" ]]; then
  SKILLS=$(find "$TARGET_DIR/skills" -name "SKILL.md" -type f 2>/dev/null | wc -l | tr -d ' ')
fi
if [[ -d "$TARGET_DIR/agents" ]]; then
  AGENTS=$(find "$TARGET_DIR/agents" -name "*.md" -type f 2>/dev/null | wc -l | tr -d ' ')
fi
if [[ -d "$TARGET_DIR/commands" ]]; then
  COMMANDS=$(find "$TARGET_DIR/commands" -name "*.md" -type f 2>/dev/null | wc -l | tr -d ' ')
fi
if [[ -f "$TARGET_DIR/hooks/hooks.json" ]]; then
  HOOKS=1
fi

echo "- **Plugin detected**: \`$PLUGIN_NAME\` v$PLUGIN_VERSION"
echo "- **Path**: \`$TARGET_DIR\`"
echo "- **Skills**: $SKILLS | **Agents**: $AGENTS | **Commands**: $COMMANDS | **Hooks**: $([ "$HOOKS" -eq 1 ] && echo "yes" || echo "no")"
echo ""
echo "> Use \`/pqa:validate\` for quick check or \`/pqa:audit\` for full QA."

exit 0

#!/usr/bin/env bash
# Plugin QA — Auto-Prime Check
# Detects if a plugin target is set, suggests next step if not
# Hook: SessionStart
# (c) 2026 JM Labs - Javier Montano
set -euo pipefail

TARGET_DIR="${1:-$(pwd)}"
PQA_DIR="$TARGET_DIR/pqa"
PRIMED=false

# Check for PQA session artifacts
if [[ -d "$PQA_DIR" ]]; then
  if [[ -f "$PQA_DIR/session-state.json" ]]; then
    PRIMED=true
  fi
  if [[ -f "$PQA_DIR/calibration-digest.md" ]]; then
    PRIMED=true
  fi
fi

# Check if there's a plugin to operate on
PLUGIN_FOUND=false
for manifest in "$TARGET_DIR/.claude-plugin/plugin.json" "$TARGET_DIR/plugin.json"; do
  if [[ -f "$manifest" ]]; then
    PLUGIN_FOUND=true
    break
  fi
done

if [[ "$PLUGIN_FOUND" == false ]]; then
  echo "- No plugin detected in working directory."
  echo "- Use \`/pqa:create\` to build a new plugin."
elif [[ "$PRIMED" == false ]]; then
  echo "- Plugin detected but PQA session not initialized."
  echo "- Use \`/pqa:validate\` or \`/pqa:audit\` to begin."
fi

exit 0

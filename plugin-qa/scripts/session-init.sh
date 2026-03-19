#!/usr/bin/env bash
# Plugin QA — Session Initialization
# Creates pqa/session-state.json with pipeline state tracker
# Hook: SessionStart
# (c) 2026 JM Labs - Javier Montano
set -euo pipefail

TARGET_DIR="${1:-$(pwd)}"
PQA_DIR="$TARGET_DIR/pqa"
STATE_FILE="$PQA_DIR/session-state.json"

mkdir -p "$PQA_DIR"

# Skip if already initialized this session
if [[ -f "$STATE_FILE" ]]; then
  exit 0
fi

# Detect plugin
PLUGIN_NAME="none"
for manifest in "$TARGET_DIR/.claude-plugin/plugin.json" "$TARGET_DIR/plugin.json"; do
  if [[ -f "$manifest" ]]; then
    PLUGIN_NAME=$(grep -o '"name":\s*"[^"]*"' "$manifest" 2>/dev/null | head -1 | sed 's/"name":[[:space:]]*"//;s/"//' || echo "unknown")
    break
  fi
done

cat > "$STATE_FILE" <<EOF
{
  "version": "3.0",
  "plugin": "$PLUGIN_NAME",
  "targetDir": "$TARGET_DIR",
  "movement": "IDLE",
  "gatesPassed": [],
  "findings": { "critical": 0, "warning": 0, "info": 0 },
  "skillsExecuted": [],
  "createdAt": "$(date -u '+%Y-%m-%dT%H:%M:%SZ')"
}
EOF

echo "- Initialized session-state.json (movement: IDLE)"

exit 0

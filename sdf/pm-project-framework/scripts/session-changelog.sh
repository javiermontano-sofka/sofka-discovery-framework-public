#!/usr/bin/env bash
# session-changelog.sh — Session Changelog Generator
# PMO-APEX v1.0 — Agentic Project Management as Service
# © 2026 PMO-APEX. All Rights Reserved.
#
# Hook: PostToolUse (on file write/edit events)
# Maintains a session changelog for resumption on context crisis.
# Each entry records: timestamp, action, file, delta, context.

set -euo pipefail

TARGET_DIR="${1:-.}"
PROJECT_DIR="${TARGET_DIR}/project"
CHANGELOG="${PROJECT_DIR}/session-changelog.md"
STATE_FILE="${PROJECT_DIR}/session-state.json"

mkdir -p "${PROJECT_DIR}"

# Initialize changelog if it doesn't exist
if [[ ! -f "$CHANGELOG" ]]; then
  cat > "$CHANGELOG" << INITEOF
# Session Changelog — PMO-APEX
> Auto-generated for session continuity on context crisis.
> Each entry allows resuming the project from the last known point.
> Generated: $(date -u +%Y-%m-%dT%H:%M:%SZ)

---

## Session Summary
- **Start**: $(date -u +%Y-%m-%dT%H:%M:%SZ)
- **Plugin**: PMO-APEX v1.0
- **Directory**: ${TARGET_DIR}
- **Status**: In progress

---

## Changelog Entries

INITEOF
fi

# Initialize session state if it doesn't exist
if [[ ! -f "$STATE_FILE" ]]; then
  cat > "$STATE_FILE" << STATEEOF
{
  "session_start": "$(date -u +%Y-%m-%dT%H:%M:%SZ)",
  "plugin_version": "1.0.0",
  "working_directory": "${TARGET_DIR}",
  "active_skill": "project-orchestrator",
  "phase": "pre-initiation",
  "deliverables_count": 0,
  "last_action": null,
  "changelog_entries": 0
}
STATEEOF
fi

# Detect recent changes via git
RECENT_CHANGES=""
if [[ -d "${TARGET_DIR}/.git" ]]; then
  RECENT_CHANGES=$(cd "$TARGET_DIR" && git diff --name-only HEAD 2>/dev/null | head -20 || echo "")
  if [[ -z "$RECENT_CHANGES" ]]; then
    RECENT_CHANGES=$(cd "$TARGET_DIR" && git diff --name-only --cached 2>/dev/null | head -20 || echo "")
  fi
fi

# Also check for recently modified files in project/
RECENT_PROJECT=""
if [[ -d "$PROJECT_DIR" ]]; then
  RECENT_PROJECT=$(find "$PROJECT_DIR" -name "*.md" -newer "$CHANGELOG" -type f 2>/dev/null | head -10 || echo "")
fi

# Append changelog entry
TIMESTAMP=$(date -u +%Y-%m-%dT%H:%M:%SZ)
ENTRY_COUNT=$(grep -c "^### " "$CHANGELOG" 2>/dev/null || echo 0)
ENTRY_NUM=$((ENTRY_COUNT + 1))

cat >> "$CHANGELOG" << ENTRYEOF

### ${ENTRY_NUM}. $(date +"%H:%M:%S") — Automatic checkpoint
- **Timestamp**: ${TIMESTAMP}
$(if [[ -n "$RECENT_CHANGES" ]]; then
  echo "- **Modified files (git)**:"
  echo "$RECENT_CHANGES" | while read -r f; do echo "  - \`$f\`"; done
fi)
$(if [[ -n "$RECENT_PROJECT" ]]; then
  echo "- **Updated project files**:"
  echo "$RECENT_PROJECT" | while read -r f; do echo "  - \`$(basename "$f")\`"; done
fi)

ENTRYEOF

# Update session state
if command -v jq &>/dev/null && [[ -f "$STATE_FILE" ]]; then
  TMP=$(mktemp)
  jq --arg ts "$TIMESTAMP" --arg cnt "$ENTRY_NUM" \
    '.last_action = $ts | .changelog_entries = ($cnt | tonumber)' \
    "$STATE_FILE" > "$TMP" && mv "$TMP" "$STATE_FILE"
fi

echo "Changelog: entry #${ENTRY_NUM} recorded (${TIMESTAMP})"

exit 0

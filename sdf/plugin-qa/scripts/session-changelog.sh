#!/usr/bin/env bash
# Plugin QA — Session Changelog
# Logs Write/Edit actions with timestamp to pqa/session-changelog.md
# Hook: SessionStart (init) + PostToolUse (append)
# (c) 2026 JM Labs - Javier Montano
set -euo pipefail

PQA_DIR="${1:-$(pwd)}/pqa"
CHANGELOG="$PQA_DIR/session-changelog.md"
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
ACTION="${2:-init}"
FILE_PATH="${3:-}"

mkdir -p "$PQA_DIR"

# Initialize changelog if missing
if [[ ! -f "$CHANGELOG" ]]; then
  cat > "$CHANGELOG" << 'HEADER'
# PQA Session Changelog
> Plugin QA -- auto-generated action log

| Timestamp | Action | File |
|-----------|--------|------|
HEADER
fi

# Append entry if action provided
if [[ -n "$FILE_PATH" ]]; then
  echo "| $TIMESTAMP | $ACTION | \`$FILE_PATH\` |" >> "$CHANGELOG"
  echo "- Logged: [$ACTION] $FILE_PATH"
elif [[ "$ACTION" == "init" ]]; then
  echo "| $TIMESTAMP | session-start | — |" >> "$CHANGELOG"
fi

exit 0

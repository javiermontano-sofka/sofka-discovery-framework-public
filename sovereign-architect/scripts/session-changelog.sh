#!/usr/bin/env bash
# Sovereign Architect — Session Changelog
# Logs Write/Edit actions with timestamp to sa/session-changelog.md
# © 2026 JM Labs · Javier Montaño
set -euo pipefail

SA_DIR="${1:-$(pwd)}/sa"
CHANGELOG="$SA_DIR/session-changelog.md"
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
ACTION="${2:-Write}"
FILE_PATH="${3:-unknown}"

# Ensure sa/ exists
mkdir -p "$SA_DIR"

# Initialize changelog if missing
if [[ ! -f "$CHANGELOG" ]]; then
  cat > "$CHANGELOG" << 'HEADER'
# Session Changelog
> Sovereign Architect — auto-generated action log

| Timestamp | Action | File |
|-----------|--------|------|
HEADER
fi

# Append entry
echo "| $TIMESTAMP | $ACTION | \`$FILE_PATH\` |" >> "$CHANGELOG"

echo "- Logged: [$ACTION] $FILE_PATH at $TIMESTAMP"

exit 0

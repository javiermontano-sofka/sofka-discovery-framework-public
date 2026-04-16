#!/bin/bash
# MAO Framework — Post-Priming Calibration
# Hook: PostToolUse (Write|Edit)
# Detects when priming-rag files are created/updated and refreshes calibration.
# Also detects new attachments and flags them for priming.

set -euo pipefail

TARGET_DIR="${1:-.}"
DISCOVERY_DIR="${TARGET_DIR}/discovery"
RAG_DIR="${DISCOVERY_DIR}/rag-priming"
CALIBRATION_FILE="${DISCOVERY_DIR}/calibration-digest.md"
PRIME_MARKER="${DISCOVERY_DIR}/needs-priming"

# Quick check: was a priming-rag file recently modified?
# The PostToolUse hook fires after Write/Edit, so check if any priming file
# was modified in the last 60 seconds
RECENT_PRIME=false
for dir in "$RAG_DIR" "$TARGET_DIR" "${TARGET_DIR}/references"; do
  if [[ -d "$dir" ]]; then
    recent=$(find "$dir" -maxdepth 1 -name "priming-rag-*.md" -newer "$CALIBRATION_FILE" -type f 2>/dev/null | head -1)
    [[ -n "$recent" ]] && RECENT_PRIME=true && break
  fi
done 2>/dev/null

# Also check if calibration file doesn't exist yet
[[ ! -f "$CALIBRATION_FILE" ]] && RECENT_PRIME=true

if $RECENT_PRIME; then
  # Re-run the calibration by calling auto-prime-check
  SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  bash "${SCRIPT_DIR}/auto-prime-check.sh" "$TARGET_DIR"
fi

exit 0

#!/usr/bin/env bash
# post-prime-calibrate.sh — Post-Priming Calibration
# PMO-APEX v1.0 — Agentic Project Management as Service
# © 2026 PMO-APEX. All Rights Reserved.
#
# Hook: PostToolUse (Write|Edit)
# Detects when priming-rag files are created/updated and refreshes calibration.
# Also detects new attachments and flags them for priming.

set -euo pipefail

TARGET_DIR="${1:-.}"
PROJECT_DIR="${TARGET_DIR}/project"
RAG_DIR="${PROJECT_DIR}/rag-priming"
CALIBRATION_FILE="${PROJECT_DIR}/calibration-digest.md"
PRIME_MARKER="${PROJECT_DIR}/needs-priming"

# Quick check: was a priming-rag file recently modified?
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

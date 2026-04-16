#!/usr/bin/env bash
# auto-prime-check.sh — Auto-Priming Check
# PMO-APEX v1.0 — Agentic Project Management as Service
# © 2026 PMO-APEX. All Rights Reserved.
#
# Hook: SessionStart (runs after session-context-gen)
# Detects priming state and generates lightweight repo fingerprint.
# If no priming-rag files exist, creates a marker requesting full priming.
# If priming exists, generates a calibration digest for the orchestrator.

set -euo pipefail

TARGET_DIR="${1:-.}"
PROJECT_DIR="${TARGET_DIR}/project"
RAG_DIR="${PROJECT_DIR}/rag-priming"
CALIBRATION_FILE="${PROJECT_DIR}/calibration-digest.md"
PRIME_MARKER="${PROJECT_DIR}/needs-priming"

mkdir -p "${PROJECT_DIR}"

# Skip if target is the plugin itself
BASENAME=$(basename "$(cd "$TARGET_DIR" && pwd)")
if [[ "$BASENAME" == "pm-project-framework" ]]; then
  echo "Auto-prime: skipped (plugin directory)"
  exit 0
fi

# Count existing priming-rag files
RAG_COUNT=0
RAG_DOMAINS=""
if [[ -d "$RAG_DIR" ]]; then
  RAG_COUNT=$(find "$RAG_DIR" -name "priming-rag-*.md" -type f 2>/dev/null | wc -l | tr -d ' ')
  RAG_DOMAINS=$(find "$RAG_DIR" -name "priming-rag-*.md" -type f 2>/dev/null \
    | xargs -I{} basename {} .md \
    | sed 's/^priming-rag-//' \
    | sort \
    | tr '\n' ', ' \
    | sed 's/,$//')
fi

# Also check for priming files in project root and references/
ROOT_RAG=$(find "$TARGET_DIR" -maxdepth 1 -name "priming-rag-*.md" -type f 2>/dev/null | wc -l | tr -d ' ')
REFS_RAG=0
if [[ -d "${TARGET_DIR}/references" ]]; then
  REFS_RAG=$(find "${TARGET_DIR}/references" -maxdepth 1 -name "priming-rag-*.md" -type f 2>/dev/null | wc -l | tr -d ' ')
fi
TOTAL_RAG=$((RAG_COUNT + ROOT_RAG + REFS_RAG))

# Generate repo fingerprint (lightweight, no deep analysis)
HAS_GIT=false
[[ -d "${TARGET_DIR}/.git" ]] && HAS_GIT=true

FINGERPRINT=""
if $HAS_GIT; then
  COMMIT_COUNT=$(cd "$TARGET_DIR" && git rev-list --count HEAD 2>/dev/null || echo 0)
  LAST_COMMIT=$(cd "$TARGET_DIR" && git log -1 --format="%h %s" 2>/dev/null || echo "unknown")
  BRANCH=$(cd "$TARGET_DIR" && git branch --show-current 2>/dev/null || echo "unknown")
  FINGERPRINT="branch=${BRANCH}, commits=${COMMIT_COUNT}, last=${LAST_COMMIT}"
fi

# Detect key config files for PM domain hints
DOMAIN_HINTS=""
[[ -f "${TARGET_DIR}/.jira.yml" || -f "${TARGET_DIR}/jira.config" ]] && DOMAIN_HINTS="${DOMAIN_HINTS}jira,"
[[ -f "${TARGET_DIR}/azure-boards.yml" ]] && DOMAIN_HINTS="${DOMAIN_HINTS}azure-devops,"
[[ -f "${TARGET_DIR}/.monday.yml" ]] && DOMAIN_HINTS="${DOMAIN_HINTS}monday,"
[[ -f "${TARGET_DIR}/sprint-backlog.md" || -f "${TARGET_DIR}/product-backlog.md" ]] && DOMAIN_HINTS="${DOMAIN_HINTS}agile,"
[[ -f "${TARGET_DIR}/kanban-board.md" ]] && DOMAIN_HINTS="${DOMAIN_HINTS}kanban,"
[[ -f "${TARGET_DIR}/package.json" ]] && DOMAIN_HINTS="${DOMAIN_HINTS}node,"
[[ -f "${TARGET_DIR}/pom.xml" || -f "${TARGET_DIR}/build.gradle" || -f "${TARGET_DIR}/build.gradle.kts" ]] && DOMAIN_HINTS="${DOMAIN_HINTS}jvm,"
[[ -f "${TARGET_DIR}/docker-compose.yml" || -f "${TARGET_DIR}/docker-compose.yaml" ]] && DOMAIN_HINTS="${DOMAIN_HINTS}docker,"
DOMAIN_HINTS=$(echo "$DOMAIN_HINTS" | sed 's/,$//')

# Count attachments in project/attachments/
ATTACHMENT_COUNT=0
UNPRIMED_ATTACHMENTS=""
if [[ -d "${PROJECT_DIR}/attachments" ]]; then
  ATTACHMENT_COUNT=$(find "${PROJECT_DIR}/attachments" -type f 2>/dev/null | wc -l | tr -d ' ')
  while IFS= read -r att; do
    att_name=$(basename "$att" | sed 's/\.[^.]*$//')
    if ! find "$RAG_DIR" -name "priming-rag-*${att_name}*" -type f 2>/dev/null | grep -q .; then
      UNPRIMED_ATTACHMENTS="${UNPRIMED_ATTACHMENTS}\n  - $(basename "$att")"
    fi
  done < <(find "${PROJECT_DIR}/attachments" -type f 2>/dev/null)
fi

if [[ $TOTAL_RAG -eq 0 ]]; then
  # No priming exists — create marker
  touch "$PRIME_MARKER"
  cat > "$CALIBRATION_FILE" << CALEOF
# Calibration Digest — PMO-APEX
> Auto-generated: $(date -u +%Y-%m-%dT%H:%M:%SZ)
> Status: **NOT PRIMED** — requires /pm:prime-repo

## Priming Status
- **RAG files**: 0
- **Calibration**: Not available
- **Action required**: Run \`/pm:prime-repo\` before starting project pipeline

## Repo Fingerprint
- **Git**: ${FINGERPRINT:-not detected}
- **Domain hints**: ${DOMAIN_HINTS:-none detected}
$(if [[ $ATTACHMENT_COUNT -gt 0 ]]; then
  echo ""
  echo "## Unprimed Attachments (${ATTACHMENT_COUNT})"
  echo -e "${UNPRIMED_ATTACHMENTS}"
fi)

---
*Calibration pending. Project pipeline without priming has lower depth and confidence.*
CALEOF

  echo "Auto-prime: repo NOT primed (0 RAG files)"
  echo "  -> Run /pm:prime-repo for maximum depth"
  [[ -n "$DOMAIN_HINTS" ]] && echo "  Domain hints: ${DOMAIN_HINTS}"

else
  # Priming exists — generate calibration digest
  rm -f "$PRIME_MARKER" 2>/dev/null

  # Extract key stats from priming files
  TOTAL_LINES=0
  KEYWORDS=""
  for f in $(find "$RAG_DIR" "${TARGET_DIR}" "${TARGET_DIR}/references" -maxdepth 1 -name "priming-rag-*.md" -type f 2>/dev/null); do
    lines=$(wc -l < "$f" | tr -d ' ')
    TOTAL_LINES=$((TOTAL_LINES + lines))
    kw=$(grep -oP '`#\K[^`]+' "$f" 2>/dev/null | head -5 | tr '\n' ', ' | sed 's/,$//')
    [[ -n "$kw" ]] && KEYWORDS="${KEYWORDS}${kw}, "
  done
  KEYWORDS=$(echo "$KEYWORDS" | sed 's/, $//')

  cat > "$CALIBRATION_FILE" << CALEOF
# Calibration Digest — PMO-APEX
> Auto-generated: $(date -u +%Y-%m-%dT%H:%M:%SZ)
> Status: **PRIMED**

## Priming Status
- **RAG files**: ${TOTAL_RAG}
- **Domains covered**: ${RAG_DOMAINS:-unclassified}
- **Context lines**: ~${TOTAL_LINES}
- **Keywords**: ${KEYWORDS:-not extracted}

## Repo Fingerprint
- **Git**: ${FINGERPRINT:-not detected}
- **Domain hints**: ${DOMAIN_HINTS:-none detected}

## Coverage
$(if [[ $TOTAL_RAG -lt 3 ]]; then
  echo "- Low coverage (${TOTAL_RAG} files). Consider running \`/pm:prime-repo\` to expand."
elif [[ $TOTAL_RAG -lt 6 ]]; then
  echo "- Medium coverage (${TOTAL_RAG} files). Acceptable depth for express pipeline."
else
  echo "- High coverage (${TOTAL_RAG} files). Optimal depth for full project pipeline."
fi)
$(if [[ -n "$UNPRIMED_ATTACHMENTS" ]]; then
  echo ""
  echo "## Unprimed Attachments"
  echo -e "${UNPRIMED_ATTACHMENTS}"
  echo ""
  echo "-> Process with \`/pm:prime-repo\` phase 3 (attachment processing)"
fi)

## Instructions for the Orchestrator
1. Read priming-rag-*.md files at the start of each relevant phase
2. Use priming data as [PLAN] or [METRIC] evidence in deliverables
3. Cross-reference priming findings with direct analysis
4. If a domain lacks priming, tag findings as [DECISION] with lower confidence

---
*Calibration complete. Project pipeline can operate at maximum depth.*
CALEOF

  echo "Auto-prime: ${TOTAL_RAG} RAG files, ~${TOTAL_LINES} context lines"
  [[ -n "$RAG_DOMAINS" ]] && echo "  Domains: ${RAG_DOMAINS}"
  [[ -n "$UNPRIMED_ATTACHMENTS" ]] && echo "  Unprimed attachments detected"
fi

exit 0

#!/usr/bin/env bash
# ghost-menu-inject.sh — Contextual Navigation Injector
# PMO-APEX v1.0 — Agentic Project Management as Service
# © 2026 PMO-APEX. All Rights Reserved.
#
# Hook: PostToolUse / SessionStart
# Injects navigation context into every thread interaction.
# Ghost menu pattern: secondary navigation that calibrates
# subsequent interactions with operational context.

set -euo pipefail

TARGET_DIR="${1:-.}"
PROJECT_DIR="${TARGET_DIR}/project"
GHOST_FILE="${PROJECT_DIR}/ghost-menu.md"

mkdir -p "${PROJECT_DIR}"

# Detect current state
DELIVERABLE_COUNT=0
PHASE="pre-initiation"
ACTIVE_SKILL=""
HAS_INDEX=false
HAS_CHANGELOG=false

# Count deliverables
for dir in "${TARGET_DIR}" "${PROJECT_DIR}/deliverables" "${TARGET_DIR}/output" "${TARGET_DIR}/outputs"; do
  if [[ -d "$dir" ]]; then
    count=$(find "$dir" -maxdepth 2 -name "*_*.md" -type f 2>/dev/null | grep -cE '^.*[0-9]{2}[b]?_' || echo 0)
    DELIVERABLE_COUNT=$((DELIVERABLE_COUNT + count))
  fi
done

# Detect phase from deliverables
if [[ $DELIVERABLE_COUNT -eq 0 ]]; then
  PHASE="00-initiation"
elif [[ $DELIVERABLE_COUNT -le 3 ]]; then
  PHASE="01-03-planning"
elif [[ $DELIVERABLE_COUNT -le 6 ]]; then
  PHASE="04-06-baseline"
elif [[ $DELIVERABLE_COUNT -le 9 ]]; then
  PHASE="07-09-execution"
elif [[ $DELIVERABLE_COUNT -le 12 ]]; then
  PHASE="10-12-monitoring"
else
  PHASE="13-14-closure"
fi

# Check for repo index
[[ -f "${PROJECT_DIR}/repo-index.json" ]] && HAS_INDEX=true

# Check for changelog
[[ -f "${PROJECT_DIR}/session-changelog.md" ]] && HAS_CHANGELOG=true

# Detect active skill from session state
if [[ -f "${PROJECT_DIR}/session-state.json" ]]; then
  ACTIVE_SKILL=$(jq -r '.active_skill // "project-orchestrator"' "${PROJECT_DIR}/session-state.json" 2>/dev/null || echo "project-orchestrator")
fi

# Generate ghost menu
cat > "$GHOST_FILE" << GHOSTEOF
<!-- PMO-APEX Ghost Menu — Auto-generated $(date -u +%Y-%m-%dT%H:%M:%SZ) -->
## APEX Ghost Menu

| Status | Value |
|--------|-------|
| Active phase | \`${PHASE}\` |
| Deliverables | ${DELIVERABLE_COUNT}/15 |
| Active skill | \`${ACTIVE_SKILL:-project-orchestrator}\` |
| Repo indexed | $(${HAS_INDEX} && echo "Done" || echo "-> run /pm:index") |
| Changelog | $(${HAS_CHANGELOG} && echo "Done" || echo "no history") |

### Quick Navigation
| Action | Command |
|--------|---------|
| Full pipeline | \`/pm:run-auto\` |
| Express Go/No-Go | \`/pm:run-express\` |
| Audit quality | \`/pm:audit-quality\` |
| Rescue project | \`/pm:rescue-stalled\` |
| View deliverables | \`/pm:scan\` |
| Index repo | \`/pm:index\` |

### Session Context
$(${HAS_CHANGELOG} && echo "- [Changelog](${PROJECT_DIR}/session-changelog.md)" || echo "- No active changelog")
$(${HAS_INDEX} && echo "- [Repo Index](${PROJECT_DIR}/repo-index.json)" || echo "- Repo not indexed")

---
*APEX Ghost Menu v1.0 — secondary navigation, review and control.*
GHOSTEOF

# Output for hook injection
echo "APEX | Phase: ${PHASE} | ${DELIVERABLE_COUNT}/15 deliverables | Skill: ${ACTIVE_SKILL:-orchestrator}"
if ! ${HAS_INDEX}; then
  echo "  Repo not indexed — consider running index-repo.sh first"
fi
if ! ${HAS_CHANGELOG}; then
  echo "  No session changelog — will be created automatically"
fi

exit 0

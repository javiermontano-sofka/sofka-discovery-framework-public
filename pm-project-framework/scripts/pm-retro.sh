#!/usr/bin/env bash
# pm-retro.sh — Quantitative retrospective for PM engagements
# PMO-APEX v1.0 — Agentic Project Management as Service
# © 2026 PMO-APEX. All Rights Reserved.
#
# Usage: pm-retro.sh [PROJECT_DIR]
# Output: JSON metrics + markdown report in project/retro/

set -euo pipefail

PROJECT_DIR="${1:-.}"
PM_DIR="$PROJECT_DIR/project"
RETRO_DIR="$PM_DIR/retro"
TIMESTAMP="$(date -u +%Y-%m-%dT%H:%M:%SZ)"
DATE_SLUG="$(date -u +%Y%m%d-%H%M)"

if [ ! -d "$PM_DIR" ]; then
  echo "No project/ directory found in $PROJECT_DIR"
  echo "  Run /pm:init first to initialize the project."
  exit 1
fi

mkdir -p "$RETRO_DIR"

# ─── 1. Session Changelog Analysis ───
CHANGELOG="$PM_DIR/session-changelog.md"
TOTAL_ENTRIES=0
GATE_EVENTS=0
CRITICAL_DECISIONS=0

if [ -f "$CHANGELOG" ]; then
  TOTAL_ENTRIES=$(grep -c '^\*\*\[' "$CHANGELOG" 2>/dev/null || echo 0)
  GATE_EVENTS=$(grep -ci 'gate\|G[0-3]\|milestone' "$CHANGELOG" 2>/dev/null || echo 0)
  CRITICAL_DECISIONS=$(grep -ci 'decision\|approved\|rejected\|blocked\|escalat\|change request' "$CHANGELOG" 2>/dev/null || echo 0)
fi

# ─── 2. Deliverable Inventory ───
DELIVERABLE_COUNT=0
WIP_COUNT=0
APPROVED_COUNT=0
MD_FILES=0
HTML_FILES=0
PDF_FILES=0

if [ -d "$PM_DIR" ]; then
  MD_FILES=$(find "$PM_DIR" -name "*.md" -not -name "session-changelog.md" -not -name "SESSION-*" -not -name "ghost-menu.md" | wc -l | tr -d ' ')
  HTML_FILES=$(find "$PM_DIR" -name "*.html" 2>/dev/null | wc -l | tr -d ' ')
  PDF_FILES=$(find "$PM_DIR" -name "*.pdf" 2>/dev/null | wc -l | tr -d ' ')
  DELIVERABLE_COUNT=$((MD_FILES + HTML_FILES + PDF_FILES))
  WIP_COUNT=$(find "$PM_DIR" -name "*WIP*" 2>/dev/null | wc -l | tr -d ' ')
  APPROVED_COUNT=$(find "$PM_DIR" -name "*Aprobado*" -o -name "*Approved*" 2>/dev/null | wc -l | tr -d ' ')
fi

# ─── 3. Evidence Density (PM-specific tags) ───
EVIDENCE_PLAN=0
EVIDENCE_SCHEDULE=0
EVIDENCE_METRIC=0
EVIDENCE_DECISION=0
EVIDENCE_RISK=0
EVIDENCE_STAKEHOLDER=0
EVIDENCE_BASELINE=0
EVIDENCE_ASSUMPTION=0
EVIDENCE_TOTAL=0

for tag in "PLAN" "SCHEDULE" "METRIC" "DECISION" "RISK" "STAKEHOLDER" "BASELINE" "ASSUMPTION"; do
  COUNT=$(grep -rci "\[$tag\]" "$PM_DIR"/*.md 2>/dev/null | awk -F: '{s+=$2} END {print s+0}')
  case "$tag" in
    "PLAN") EVIDENCE_PLAN=$COUNT ;;
    "SCHEDULE") EVIDENCE_SCHEDULE=$COUNT ;;
    "METRIC") EVIDENCE_METRIC=$COUNT ;;
    "DECISION") EVIDENCE_DECISION=$COUNT ;;
    "RISK") EVIDENCE_RISK=$COUNT ;;
    "STAKEHOLDER") EVIDENCE_STAKEHOLDER=$COUNT ;;
    "BASELINE") EVIDENCE_BASELINE=$COUNT ;;
    "ASSUMPTION") EVIDENCE_ASSUMPTION=$COUNT ;;
  esac
  EVIDENCE_TOTAL=$((EVIDENCE_TOTAL + COUNT))
done

# Evidence quality ratio: hard evidence / total
HARD_EVIDENCE=$((EVIDENCE_PLAN + EVIDENCE_SCHEDULE + EVIDENCE_METRIC + EVIDENCE_BASELINE + EVIDENCE_STAKEHOLDER))
if [ "$EVIDENCE_TOTAL" -gt 0 ]; then
  EVIDENCE_RATIO=$(awk "BEGIN {printf \"%.1f\", ($HARD_EVIDENCE / $EVIDENCE_TOTAL) * 100}")
else
  EVIDENCE_RATIO="0.0"
fi

# ─── 4. Mermaid Diagram Count ───
DIAGRAM_COUNT=$(grep -rc '```mermaid' "$PM_DIR"/*.md 2>/dev/null | awk -F: '{s+=$2} END {print s+0}')

# ─── 5. Git Activity (if git repo) ───
GIT_COMMITS=0
GIT_AUTHORS=""
GIT_FIRST_COMMIT=""
GIT_LAST_COMMIT=""
GIT_DAYS_ACTIVE=0

if git -C "$PROJECT_DIR" rev-parse --is-inside-work-tree &>/dev/null; then
  GIT_COMMITS=$(git -C "$PROJECT_DIR" log --oneline 2>/dev/null | wc -l | tr -d ' ')
  GIT_AUTHORS=$(git -C "$PROJECT_DIR" log --format='%aN' 2>/dev/null | sort -u | tr '\n' ', ' | sed 's/, $//')
  GIT_FIRST_COMMIT=$(git -C "$PROJECT_DIR" log --reverse --format='%ai' 2>/dev/null | head -1 | cut -d' ' -f1)
  GIT_LAST_COMMIT=$(git -C "$PROJECT_DIR" log -1 --format='%ai' 2>/dev/null | cut -d' ' -f1)
  if [ -n "$GIT_FIRST_COMMIT" ] && [ -n "$GIT_LAST_COMMIT" ]; then
    FIRST_EPOCH=$(date -j -f "%Y-%m-%d" "$GIT_FIRST_COMMIT" "+%s" 2>/dev/null || date -d "$GIT_FIRST_COMMIT" "+%s" 2>/dev/null || echo 0)
    LAST_EPOCH=$(date -j -f "%Y-%m-%d" "$GIT_LAST_COMMIT" "+%s" 2>/dev/null || date -d "$GIT_LAST_COMMIT" "+%s" 2>/dev/null || echo 0)
    if [ "$FIRST_EPOCH" -gt 0 ] && [ "$LAST_EPOCH" -gt 0 ]; then
      GIT_DAYS_ACTIVE=$(( (LAST_EPOCH - FIRST_EPOCH) / 86400 + 1 ))
    fi
  fi
fi

# ─── 6. Session State ───
CURRENT_PHASE="unknown"
TIPO_PROYECTO="unknown"
PROJECT_NAME="unknown"

STATE_FILE="$PM_DIR/session-state.json"
if [ -f "$STATE_FILE" ]; then
  CURRENT_PHASE=$(grep -o '"phase"[[:space:]]*:[[:space:]]*"[^"]*"' "$STATE_FILE" 2>/dev/null | head -1 | sed 's/.*: *"//;s/"//' || echo "unknown")
  TIPO_PROYECTO=$(grep -o '"tipo_proyecto"[[:space:]]*:[[:space:]]*"[^"]*"' "$STATE_FILE" 2>/dev/null | head -1 | sed 's/.*: *"//;s/"//' || echo "unknown")
  PROJECT_NAME=$(grep -o '"project_name"[[:space:]]*:[[:space:]]*"[^"]*"' "$STATE_FILE" 2>/dev/null | head -1 | sed 's/.*: *"//;s/"//' || echo "unknown")
fi

# ─── 7. Security Audit Status ───
G0_STATUS="not_run"
SECRETS_FOUND=0
if [ -f "$PM_DIR/apex-secrets-audit.log" ]; then
  if grep -q "CLEAN" "$PM_DIR/apex-secrets-audit.log" 2>/dev/null; then
    G0_STATUS="clean"
  else
    G0_STATUS="findings"
    SECRETS_FOUND=$(grep -c "FINDING" "$PM_DIR/apex-secrets-audit.log" 2>/dev/null || echo 0)
  fi
fi

# ─── Write JSON Snapshot ───
RETRO_JSON="$RETRO_DIR/retro-$DATE_SLUG.json"
cat > "$RETRO_JSON" <<JSONEOF
{
  "timestamp": "$TIMESTAMP",
  "engagement": {
    "project": "$PROJECT_NAME",
    "tipo_proyecto": "$TIPO_PROYECTO",
    "current_phase": "$CURRENT_PHASE"
  },
  "activity": {
    "changelog_entries": $TOTAL_ENTRIES,
    "gate_events": $GATE_EVENTS,
    "critical_decisions": $CRITICAL_DECISIONS,
    "git_commits": $GIT_COMMITS,
    "git_days_active": $GIT_DAYS_ACTIVE,
    "git_authors": "$GIT_AUTHORS"
  },
  "deliverables": {
    "total": $DELIVERABLE_COUNT,
    "markdown": $MD_FILES,
    "html": $HTML_FILES,
    "pdf": $PDF_FILES,
    "wip": $WIP_COUNT,
    "approved": $APPROVED_COUNT,
    "diagrams": $DIAGRAM_COUNT
  },
  "evidence": {
    "total_tags": $EVIDENCE_TOTAL,
    "plan": $EVIDENCE_PLAN,
    "schedule": $EVIDENCE_SCHEDULE,
    "metric": $EVIDENCE_METRIC,
    "decision": $EVIDENCE_DECISION,
    "risk": $EVIDENCE_RISK,
    "stakeholder": $EVIDENCE_STAKEHOLDER,
    "baseline": $EVIDENCE_BASELINE,
    "assumption": $EVIDENCE_ASSUMPTION,
    "hard_evidence_ratio_pct": $EVIDENCE_RATIO
  },
  "security": {
    "g0_status": "$G0_STATUS",
    "secrets_found": $SECRETS_FOUND
  }
}
JSONEOF

# ─── Write Markdown Report ───
RETRO_MD="$RETRO_DIR/retro-$DATE_SLUG.md"
cat > "$RETRO_MD" <<MDEOF
# Project Retrospective — $DATE_SLUG

> **Project**: $PROJECT_NAME | **Type**: $TIPO_PROYECTO | **Phase**: $CURRENT_PHASE
> **Generated**: $TIMESTAMP

---

## Activity Metrics

| Metric | Value |
|--------|-------|
| Changelog entries | $TOTAL_ENTRIES |
| Gate events | $GATE_EVENTS |
| Critical decisions | $CRITICAL_DECISIONS |
| Git commits | $GIT_COMMITS |
| Days active | $GIT_DAYS_ACTIVE |
| Contributors | $GIT_AUTHORS |

## Deliverable Inventory

| Type | Count |
|------|-------|
| **Total deliverables** | **$DELIVERABLE_COUNT** |
| Markdown | $MD_FILES |
| HTML | $HTML_FILES |
| PDF | $PDF_FILES |
| WIP | $WIP_COUNT |
| Approved | $APPROVED_COUNT |
| Diagrams (Mermaid) | $DIAGRAM_COUNT |

## Evidence Density

| Tag | Count |
|-----|-------|
| [PLAN] | $EVIDENCE_PLAN |
| [SCHEDULE] | $EVIDENCE_SCHEDULE |
| [METRIC] | $EVIDENCE_METRIC |
| [DECISION] | $EVIDENCE_DECISION |
| [RISK] | $EVIDENCE_RISK |
| [STAKEHOLDER] | $EVIDENCE_STAKEHOLDER |
| [BASELINE] | $EVIDENCE_BASELINE |
| [ASSUMPTION] | $EVIDENCE_ASSUMPTION |
| **Total** | **$EVIDENCE_TOTAL** |
| **Hard evidence ratio** | **${EVIDENCE_RATIO}%** |

> Hard evidence = [PLAN] + [SCHEDULE] + [METRIC] + [BASELINE] + [STAKEHOLDER]. Ratio >70% indicates well-grounded analysis.

## Security (G0)

| Check | Status |
|-------|--------|
| G0 scan | $G0_STATUS |
| Secrets found | $SECRETS_FOUND |

---

*Generated by \`pm-retro.sh\` — PMO-APEX v1.0*
MDEOF

echo "Retrospective generated:"
echo "  JSON: $RETRO_JSON"
echo "  Report: $RETRO_MD"
echo ""
echo "  Project: $PROJECT_NAME ($TIPO_PROYECTO) — Phase $CURRENT_PHASE"
echo "  Deliverables: $DELIVERABLE_COUNT total ($WIP_COUNT WIP, $APPROVED_COUNT approved)"
echo "  Evidence: $EVIDENCE_TOTAL tags (${EVIDENCE_RATIO}% hard evidence)"
echo "  Activity: $TOTAL_ENTRIES changelog entries, $GIT_COMMITS commits"

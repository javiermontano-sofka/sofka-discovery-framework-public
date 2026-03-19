#!/usr/bin/env bash
# discovery-retro.sh — Quantitative retrospective for discovery engagements
# MAO Framework v1.3 — Open Discovery Framework
# © 2026 Comunidad MetodologIA. GPL-3.0 Copyleft.
#
# Usage: discovery-retro.sh [PROJECT_DIR]
# Output: JSON metrics + markdown report in discovery/retro/

set -euo pipefail

PROJECT_DIR="${1:-.}"
DISCOVERY_DIR="$PROJECT_DIR/discovery"
RETRO_DIR="$DISCOVERY_DIR/retro"
TIMESTAMP="$(date -u +%Y-%m-%dT%H:%M:%SZ)"
DATE_SLUG="$(date -u +%Y%m%d-%H%M)"

if [ ! -d "$DISCOVERY_DIR" ]; then
  echo "⚠ No discovery/ directory found in $PROJECT_DIR"
  echo "  Run /mao:init first to initialize the engagement."
  exit 1
fi

mkdir -p "$RETRO_DIR"

# ─── 1. Session Changelog Analysis ───
CHANGELOG="$DISCOVERY_DIR/session-changelog.md"
TOTAL_ENTRIES=0
PHASE_ENTRIES=""
GATE_EVENTS=0
CRITICAL_DECISIONS=0

if [ -f "$CHANGELOG" ]; then
  TOTAL_ENTRIES=$(grep -c '^\*\*\[' "$CHANGELOG" 2>/dev/null || echo 0)
  GATE_EVENTS=$(grep -ci 'gate\|G[0-3]' "$CHANGELOG" 2>/dev/null || echo 0)
  CRITICAL_DECISIONS=$(grep -ci 'decisión\|decision\|aprobado\|approved\|blocked\|bloqueado' "$CHANGELOG" 2>/dev/null || echo 0)

  # Count entries per phase
  for p in 0 1 2 3 4 5 6; do
    COUNT=$(grep -ci "fase $p\|phase $p\|fase$p" "$CHANGELOG" 2>/dev/null || echo 0)
    PHASE_ENTRIES="$PHASE_ENTRIES\"phase_$p\": $COUNT, "
  done
fi

# ─── 2. Deliverable Inventory ───
DELIVERABLE_COUNT=0
WIP_COUNT=0
APPROVED_COUNT=0
MD_FILES=0
HTML_FILES=0
PDF_FILES=0

if [ -d "$DISCOVERY_DIR" ]; then
  MD_FILES=$(find "$DISCOVERY_DIR" -name "*.md" -not -name "session-changelog.md" -not -name "SESSION-*" -not -name "ghost-menu.md" | wc -l | tr -d ' ')
  HTML_FILES=$(find "$DISCOVERY_DIR" -name "*.html" 2>/dev/null | wc -l | tr -d ' ')
  PDF_FILES=$(find "$DISCOVERY_DIR" -name "*.pdf" 2>/dev/null | wc -l | tr -d ' ')
  DELIVERABLE_COUNT=$((MD_FILES + HTML_FILES + PDF_FILES))
  WIP_COUNT=$(find "$DISCOVERY_DIR" -name "*WIP*" 2>/dev/null | wc -l | tr -d ' ')
  APPROVED_COUNT=$(find "$DISCOVERY_DIR" -name "*Aprobado*" 2>/dev/null | wc -l | tr -d ' ')
fi

# ─── 3. Evidence Density ───
EVIDENCE_CODIGO=0
EVIDENCE_CONFIG=0
EVIDENCE_DOC=0
EVIDENCE_INFERENCIA=0
EVIDENCE_SUPUESTO=0
EVIDENCE_STAKEHOLDER=0
EVIDENCE_TOTAL=0

for tag in "CODIGO\|CÓDIGO" "CONFIG" "DOC" "INFERENCIA" "SUPUESTO" "STAKEHOLDER"; do
  COUNT=$(grep -rci "\[$tag\]" "$DISCOVERY_DIR"/*.md 2>/dev/null | awk -F: '{s+=$2} END {print s+0}')
  case "$tag" in
    "CODIGO\|CÓDIGO") EVIDENCE_CODIGO=$COUNT ;;
    "CONFIG") EVIDENCE_CONFIG=$COUNT ;;
    "DOC") EVIDENCE_DOC=$COUNT ;;
    "INFERENCIA") EVIDENCE_INFERENCIA=$COUNT ;;
    "SUPUESTO") EVIDENCE_SUPUESTO=$COUNT ;;
    "STAKEHOLDER") EVIDENCE_STAKEHOLDER=$COUNT ;;
  esac
  EVIDENCE_TOTAL=$((EVIDENCE_TOTAL + COUNT))
done

# Evidence quality ratio: hard evidence / total (higher = better grounded)
HARD_EVIDENCE=$((EVIDENCE_CODIGO + EVIDENCE_CONFIG + EVIDENCE_DOC + EVIDENCE_STAKEHOLDER))
if [ "$EVIDENCE_TOTAL" -gt 0 ]; then
  EVIDENCE_RATIO=$(awk "BEGIN {printf \"%.1f\", ($HARD_EVIDENCE / $EVIDENCE_TOTAL) * 100}")
else
  EVIDENCE_RATIO="0.0"
fi

# ─── 4. Mermaid Diagram Count ───
DIAGRAM_COUNT=$(grep -rc '```mermaid' "$DISCOVERY_DIR"/*.md 2>/dev/null | awk -F: '{s+=$2} END {print s+0}')

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
TIPO_SERVICIO="unknown"
CLIENT_NAME="unknown"

STATE_FILE="$DISCOVERY_DIR/session-state.json"
if [ -f "$STATE_FILE" ]; then
  CURRENT_PHASE=$(grep -o '"current_phase"[[:space:]]*:[[:space:]]*"[^"]*"' "$STATE_FILE" 2>/dev/null | head -1 | sed 's/.*: *"//;s/"//' || echo "unknown")
  TIPO_SERVICIO=$(grep -o '"tipo_servicio"[[:space:]]*:[[:space:]]*"[^"]*"' "$STATE_FILE" 2>/dev/null | head -1 | sed 's/.*: *"//;s/"//' || echo "unknown")
  CLIENT_NAME=$(grep -o '"client_name"[[:space:]]*:[[:space:]]*"[^"]*"' "$STATE_FILE" 2>/dev/null | head -1 | sed 's/.*: *"//;s/"//' || echo "unknown")
fi

# ─── 7. Security Audit Status ───
G0_STATUS="not_run"
SECRETS_FOUND=0
if [ -f "$DISCOVERY_DIR/mao-secrets-audit.log" ]; then
  if grep -q "CLEAN" "$DISCOVERY_DIR/mao-secrets-audit.log" 2>/dev/null; then
    G0_STATUS="clean"
  else
    G0_STATUS="findings"
    SECRETS_FOUND=$(grep -c "FINDING" "$DISCOVERY_DIR/mao-secrets-audit.log" 2>/dev/null || echo 0)
  fi
fi

# ─── Write JSON Snapshot ───
RETRO_JSON="$RETRO_DIR/retro-$DATE_SLUG.json"
cat > "$RETRO_JSON" <<JSONEOF
{
  "timestamp": "$TIMESTAMP",
  "engagement": {
    "client": "$CLIENT_NAME",
    "tipo_servicio": "$TIPO_SERVICIO",
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
    "codigo": $EVIDENCE_CODIGO,
    "config": $EVIDENCE_CONFIG,
    "doc": $EVIDENCE_DOC,
    "inferencia": $EVIDENCE_INFERENCIA,
    "supuesto": $EVIDENCE_SUPUESTO,
    "stakeholder": $EVIDENCE_STAKEHOLDER,
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
# Discovery Retrospective — $DATE_SLUG

> **Client**: $CLIENT_NAME | **Tipo**: $TIPO_SERVICIO | **Phase**: $CURRENT_PHASE
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
| [CÓDIGO] | $EVIDENCE_CODIGO |
| [CONFIG] | $EVIDENCE_CONFIG |
| [DOC] | $EVIDENCE_DOC |
| [INFERENCIA] | $EVIDENCE_INFERENCIA |
| [SUPUESTO] | $EVIDENCE_SUPUESTO |
| [STAKEHOLDER] | $EVIDENCE_STAKEHOLDER |
| **Total** | **$EVIDENCE_TOTAL** |
| **Hard evidence ratio** | **${EVIDENCE_RATIO}%** |

> Hard evidence = [CÓDIGO] + [CONFIG] + [DOC] + [STAKEHOLDER]. Ratio >70% indicates well-grounded analysis.

## Security (G0)

| Check | Status |
|-------|--------|
| G0 scan | $G0_STATUS |
| Secrets found | $SECRETS_FOUND |

---

*Generated by \`discovery-retro.sh\` — MAO Framework v1.3*
MDEOF

echo "✓ Retrospective generated:"
echo "  JSON: $RETRO_JSON"
echo "  Report: $RETRO_MD"
echo ""
echo "  Engagement: $CLIENT_NAME ($TIPO_SERVICIO) — Phase $CURRENT_PHASE"
echo "  Deliverables: $DELIVERABLE_COUNT total ($WIP_COUNT WIP, $APPROVED_COUNT approved)"
echo "  Evidence: $EVIDENCE_TOTAL tags (${EVIDENCE_RATIO}% hard evidence)"
echo "  Activity: $TOTAL_ENTRIES changelog entries, $GIT_COMMITS commits"

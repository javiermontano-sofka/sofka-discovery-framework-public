#!/usr/bin/env bash
# Sovereign Architect — Analysis Retrospective
# Generates retrospective metrics for the current analysis session
# © 2026 JM Labs · Javier Montaño
set -euo pipefail

TARGET_DIR="${1:-$(pwd)}/sa"
OUTPUT="$TARGET_DIR/retrospective_{WIP}.md"

echo "## SA Analysis Retrospective"
echo ""

if [[ ! -d "$TARGET_DIR" ]]; then
  echo "- No sa/ directory found. Nothing to retrospect."
  exit 0
fi

# 1. Count deliverables
TOTAL_ARTIFACTS=0
WIP_COUNT=0
APPROVED_COUNT=0
DRAFT_COUNT=0

for f in "$TARGET_DIR"/*.md "$TARGET_DIR"/**/*.md; do
  [[ -f "$f" ]] 2>/dev/null || continue
  [[ "$(basename "$f")" == "retrospective_"* ]] && continue
  TOTAL_ARTIFACTS=$((TOTAL_ARTIFACTS + 1))
  BASENAME=$(basename "$f")
  case "$BASENAME" in
    *"{WIP}"*)      WIP_COUNT=$((WIP_COUNT + 1)) ;;
    *"{Aprobado}"*) APPROVED_COUNT=$((APPROVED_COUNT + 1)) ;;
    *)              DRAFT_COUNT=$((DRAFT_COUNT + 1)) ;;
  esac
done

echo "- Deliverables: $TOTAL_ARTIFACTS (WIP: $WIP_COUNT | Approved: $APPROVED_COUNT | Draft: $DRAFT_COUNT)"

# 2. Evidence quality — ratio of [HECHO]/[CÓDIGO]/[CONFIG]/[DOC] vs [SUPUESTO]
EVIDENCE_TAGS=0
SUPUESTO_TAGS=0

for f in "$TARGET_DIR"/*.md; do
  [[ -f "$f" ]] 2>/dev/null || continue
  EVIDENCE_TAGS=$((EVIDENCE_TAGS + $(grep -co '\[HECHO\]\|\[CÓDIGO\]\|\[CONFIG\]\|\[DOC\]\|\[STAKEHOLDER\]' "$f" 2>/dev/null || echo "0")))
  SUPUESTO_TAGS=$((SUPUESTO_TAGS + $(grep -co '\[SUPUESTO\]' "$f" 2>/dev/null || echo "0")))
done

TOTAL_TAGS=$((EVIDENCE_TAGS + SUPUESTO_TAGS))
if [[ $TOTAL_TAGS -gt 0 ]]; then
  EVIDENCE_RATIO=$((EVIDENCE_TAGS * 100 / TOTAL_TAGS))
  SUPUESTO_RATIO=$((SUPUESTO_TAGS * 100 / TOTAL_TAGS))
else
  EVIDENCE_RATIO=0
  SUPUESTO_RATIO=0
fi

echo "- Evidence quality: ${EVIDENCE_RATIO}% verified / ${SUPUESTO_RATIO}% assumption"

# 3. Gates status from session-state.json
GATES_PASSED="none"
CURRENT_PHASE="unknown"
if [[ -f "$TARGET_DIR/session-state.json" ]]; then
  GATES_PASSED=$(grep -o '"gatesPassed":\s*\[[^]]*\]' "$TARGET_DIR/session-state.json" 2>/dev/null | sed 's/"gatesPassed":[[:space:]]*//' || echo "[]")
  CURRENT_PHASE=$(grep -o '"phase":\s*"[^"]*"' "$TARGET_DIR/session-state.json" 2>/dev/null | sed 's/"phase":[[:space:]]*"//;s/"//' || echo "unknown")
fi

echo "- Current phase: $CURRENT_PHASE"
echo "- Gates passed: $GATES_PASSED"

# 4. Phase coverage (count artifacts per phase prefix)
P1=0; P2=0; P3=0; P4=0; P5=0
for f in "$TARGET_DIR"/*.md; do
  [[ -f "$f" ]] 2>/dev/null || continue
  BASENAME=$(basename "$f")
  case "$BASENAME" in
    01_*|1_*) P1=$((P1 + 1)) ;;
    02_*|2_*) P2=$((P2 + 1)) ;;
    03_*|3_*) P3=$((P3 + 1)) ;;
    04_*|4_*) P4=$((P4 + 1)) ;;
    05_*|5_*) P5=$((P5 + 1)) ;;
  esac
done

echo "- Phase coverage: P1=$P1 | P2=$P2 | P3=$P3 | P4=$P4 | P5=$P5"

# 5. Generate retrospective markdown
cat > "$OUTPUT" <<EOF
# Analysis Retrospective

> Generated: $(date -u '+%Y-%m-%dT%H:%M:%SZ')
> Sovereign Architect v2.0

---

## Deliverables Summary

| Metric | Count |
|--------|-------|
| Total artifacts | $TOTAL_ARTIFACTS |
| WIP | $WIP_COUNT |
| Approved | $APPROVED_COUNT |
| Draft | $DRAFT_COUNT |

## Evidence Quality

| Metric | Value |
|--------|-------|
| Verified evidence tags | $EVIDENCE_TAGS (${EVIDENCE_RATIO}%) |
| Assumption tags | $SUPUESTO_TAGS (${SUPUESTO_RATIO}%) |
| Total tags | $TOTAL_TAGS |
| **Quality rating** | $([ $EVIDENCE_RATIO -ge 70 ] && echo "STRONG" || ([ $EVIDENCE_RATIO -ge 50 ] && echo "MODERATE" || echo "WEAK")) |

$([ $SUPUESTO_RATIO -gt 30 ] && echo "> **WARNING**: Assumption ratio exceeds 30%. Validation recommended." || echo "> Evidence quality within acceptable range.")

## Gate Status

- **Current phase**: $CURRENT_PHASE
- **Gates passed**: $GATES_PASSED

## Phase Coverage

| Phase | Artifacts |
|-------|-----------|
| P1 — Context & Discovery | $P1 |
| P2 — Diagnosis | $P2 |
| P3 — Design | $P3 |
| P4 — Plan | $P4 |
| P5 — Validation | $P5 |

---

*SA v2.0 — Evidence over enthusiasm.*
EOF

echo ""
echo "> Retrospective written to $OUTPUT"

exit 0

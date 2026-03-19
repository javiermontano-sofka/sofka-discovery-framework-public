#!/usr/bin/env bash
# inject-metacognition.sh — Injects meta-cognition protocols into agent definitions
# PMO-APEX v1.0 — Agentic Project Management as Service
# © 2026 PMO-APEX. All Rights Reserved.
#
# Usage: inject-metacognition.sh [AGENTS_DIR] [--dry-run] [--force]
#   AGENTS_DIR: Path to agents/ directory (default: ./agents)
#   --dry-run:  Preview changes without modifying files
#   --force:    Re-inject even if section already exists (replaces existing)
#
# Tiers:
#   FULL  (~28 lines) -> Permanent triad: project-conductor, delivery-lead, risk-manager
#   LIGHT (~12 lines) -> All other agents

set -euo pipefail

AGENTS_DIR="${1:-./agents}"
DRY_RUN=false
FORCE=false

# Parse flags
for arg in "$@"; do
  case "$arg" in
    --dry-run) DRY_RUN=true ;;
    --force)   FORCE=true ;;
  esac
done

if [ ! -d "$AGENTS_DIR" ]; then
  echo "Agents directory not found: $AGENTS_DIR"
  exit 1
fi

# ─── Triad agent filenames (receive FULL protocol) ───
TRIAD_AGENTS=("project-conductor" "delivery-lead" "risk-manager")

# ─── Counters ───
FULL_COUNT=0
LIGHT_COUNT=0
SKIPPED_COUNT=0
ERROR_COUNT=0

# ─── FULL Meta-Cognition Protocol (triad agents) ───
read -r -d '' FULL_TEMPLATE << 'METACOG_FULL' || true
## Meta-Cognition Protocol

As a permanent triad member, apply structured reasoning to every decision and coordination action.

### Reasoning Patterns

| Pattern | When to Use |
|---------|------------|
| **Structured Reasoning** (DECOMPOSE->SOLVE->VERIFY->SYNTHESIZE->REFLECT) | Complex multi-phase decisions, gate evaluations, committee disputes |
| **Skeleton-of-Thought** | Planning outputs: build bullet skeleton first, validate structure, then expand |
| **Chain-of-Code** | Process logic: express as pseudocode (IF/THEN, FOR EACH, WHILE) before prose |

### Selection Rule
1. Default to **Structured Reasoning** for any decision affecting pipeline flow
2. Use **Skeleton-of-Thought** when producing deliverables, status reports, or plans
3. Use **Chain-of-Code** when reasoning about sequences, conditionals, or iteration over data

### Confidence Scoring
- Tag every conclusion with confidence: `[CONFIDENCE: 0.0-1.0]`
- **>= 0.8** -> proceed autonomously
- **0.5-0.7** -> flag uncertainty, present options to committee
- **< 0.5** -> escalate to user, do NOT proceed on assumption

### Bias Scan
Before finalizing any recommendation or vote, check for:
- **Anchoring** — Am I over-weighting the first data point or the stakeholder's framing?
- **Confirmation** — Am I seeking evidence that supports my initial position?
- **Availability** — Am I over-indexing on recent or vivid examples over base rates?
- **Planning Fallacy** — Am I underestimating effort, cost, or timeline?

If bias detected, explicitly state it and re-evaluate from opposing perspective.

METACOG_FULL

# ─── LIGHT Reasoning Discipline (all other agents) ───
read -r -d '' LIGHT_TEMPLATE << 'METACOG_LIGHT' || true
## Reasoning Discipline

Apply structured thinking to every analysis and recommendation.

1. **Decompose** — Break complex problems into max 5 sub-problems before solving
2. **Evidence-check** — Tag every claim with confidence `[CONFIDENCE: high|medium|low]` and evidence source
3. **Bias scan** — Before finalizing, check for anchoring, confirmation, availability, and planning fallacy bias
4. **Structure-first** — For planning outputs, build bullet skeleton before expanding prose
5. **Escalate** — When confidence is low, flag uncertainty and present alternatives rather than guessing

METACOG_LIGHT

# ─── Injection function ───
inject_section() {
  local file="$1"
  local template="$2"
  local tier="$3"
  local basename
  basename=$(basename "$file" .md)

  # Check if already injected
  if grep -q "^## Meta-Cognition Protocol" "$file" 2>/dev/null || \
     grep -q "^## Reasoning Discipline" "$file" 2>/dev/null; then
    if [ "$FORCE" = false ]; then
      echo "  SKIP  $basename (already has meta-cognition section)"
      SKIPPED_COUNT=$((SKIPPED_COUNT + 1))
      return 0
    else
      # Remove existing section before re-injecting
      local section_header
      if grep -q "^## Meta-Cognition Protocol" "$file"; then
        section_header="Meta-Cognition Protocol"
      else
        section_header="Reasoning Discipline"
      fi
      local tmp_file
      tmp_file=$(mktemp)
      awk -v hdr="## $section_header" '
        BEGIN { skip=0 }
        $0 == hdr { skip=1; next }
        skip && /^## / { skip=0 }
        !skip { print }
      ' "$file" > "$tmp_file"
      mv "$tmp_file" "$file"
    fi
  fi

  # Find injection point: before "## Escalation" (Triggers or Protocol)
  local inject_line
  inject_line=$(grep -n "^## Escalation" "$file" | head -1 | cut -d: -f1)

  if [ -z "$inject_line" ]; then
    # Fallback: before "## Output Configuration"
    inject_line=$(grep -n "^## Output Configuration" "$file" | head -1 | cut -d: -f1)
  fi

  if [ -z "$inject_line" ]; then
    # Last resort: append before last line
    inject_line=$(wc -l < "$file" | tr -d ' ')
  fi

  if [ "$DRY_RUN" = true ]; then
    echo "  ${tier}  $basename -> inject before line $inject_line"
    return 0
  fi

  # Create temp file with injection
  local tmp_file
  tmp_file=$(mktemp)

  head -n $((inject_line - 1)) "$file" > "$tmp_file"
  echo "$template" >> "$tmp_file"
  echo "" >> "$tmp_file"
  tail -n +"$inject_line" "$file" >> "$tmp_file"

  mv "$tmp_file" "$file"
}

# ─── Main loop ───
echo "================================================================"
echo "  Meta-Cognition Injection — $(basename "$AGENTS_DIR")"
echo "  Mode: $([ "$DRY_RUN" = true ] && echo "DRY RUN" || echo "LIVE")  Force: $([ "$FORCE" = true ] && echo "YES" || echo "NO")"
echo "================================================================"
echo ""

is_triad() {
  local name="$1"
  for triad in "${TRIAD_AGENTS[@]}"; do
    if [ "$name" = "$triad" ]; then
      return 0
    fi
  done
  return 1
}

for agent_file in "$AGENTS_DIR"/*.md; do
  [ -f "$agent_file" ] || continue
  agent_name=$(basename "$agent_file" .md)

  if is_triad "$agent_name"; then
    inject_section "$agent_file" "$FULL_TEMPLATE" "FULL "
    FULL_COUNT=$((FULL_COUNT + 1))
  else
    inject_section "$agent_file" "$LIGHT_TEMPLATE" "LIGHT"
    LIGHT_COUNT=$((LIGHT_COUNT + 1))
  fi
done

echo ""
echo "--- Summary ---"
echo "  FULL  injected: $FULL_COUNT (triad agents)"
echo "  LIGHT injected: $LIGHT_COUNT (specialist agents)"
echo "  Skipped:        $SKIPPED_COUNT"
echo "  Errors:         $ERROR_COUNT"
echo "  Total processed: $((FULL_COUNT + LIGHT_COUNT + SKIPPED_COUNT + ERROR_COUNT))"

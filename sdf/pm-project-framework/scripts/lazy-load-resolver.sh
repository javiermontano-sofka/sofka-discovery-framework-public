#!/usr/bin/env bash
# lazy-load-resolver.sh — Dynamic agent/skill resolver with progressive MOAT loading
# PMO-APEX v1.0 — Agentic Project Management as Service
# © 2026 PMO-APEX. All Rights Reserved.
#
# Usage: lazy-load-resolver.sh <PHASE_NUM> <TIPO_PROYECTO> [PLUGIN_DIR] [LOAD_LEVEL]
# Output: List of agent and skill file paths to load into context
#
# LOAD_LEVEL (progressive MOAT):
#   L1 = Metadata only (SKILL.md frontmatter + TL;DR) — minimal context cost
#   L2 = Core body (SKILL.md full content) — standard operation
#   L3 = Deep (SKILL.md + references/ + examples/) — full knowledge base

set -euo pipefail

PHASE="${1:-0}"
TIPO="${2:-Agile}"
PLUGIN_DIR="${3:-.}"
LOAD_LEVEL="${4:-L2}"

AGENTS_DIR="$PLUGIN_DIR/agents"
SKILLS_DIR="$PLUGIN_DIR/skills"

# ─── Core team (always loaded) ───
CORE_AGENTS=(
  "project-conductor.md"
  "delivery-lead.md"
  "risk-manager.md"
)

CORE_SKILLS=(
  "project-orchestrator"
  "pipeline-governance"
  "input-analysis"
)

# ─── Phase-specific agents ───
declare -A PHASE_AGENTS
PHASE_AGENTS[0]="delivery-lead.md methodology-architect.md scope-analyst.md"
PHASE_AGENTS[1]="scope-analyst.md schedule-planner.md budget-controller.md"
PHASE_AGENTS[2]="schedule-planner.md budget-controller.md resource-optimizer.md"
PHASE_AGENTS[3]="risk-analyst.md methodology-architect.md quality-auditor.md"
PHASE_AGENTS[4]="methodology-architect.md scrum-master.md agile-coach.md"
PHASE_AGENTS[5]="communication-strategist.md report-designer.md editorial-director.md"
PHASE_AGENTS[6]="delivery-lead.md change-controller.md knowledge-manager.md"

# ─── Phase-specific skills ───
declare -A PHASE_SKILLS
PHASE_SKILLS[0]="project-charter stakeholder-mapping methodology-selection"
PHASE_SKILLS[1]="wbs-decomposition schedule-planning budget-estimation"
PHASE_SKILLS[2]="resource-planning procurement-planning baseline-management"
PHASE_SKILLS[3]="risk-assessment quality-planning change-management"
PHASE_SKILLS[4]="agile-execution sprint-planning kanban-flow"
PHASE_SKILLS[5]="status-reporting communication-planning earned-value-analysis"
PHASE_SKILLS[6]="project-closure lessons-learned transition-planning"

# ─── Project type modifiers ───
declare -A TIPO_AGENTS
TIPO_AGENTS[Agile]="scrum-master.md agile-coach.md product-owner-proxy.md"
TIPO_AGENTS[Kanban]="kanban-coach.md"
TIPO_AGENTS[SAFe]="safe-consultant.md agile-coach.md"
TIPO_AGENTS[Waterfall]="pmbok-specialist.md prince2-practitioner.md"
TIPO_AGENTS[Hybrid]="agile-coach.md pmbok-specialist.md"
TIPO_AGENTS[PMO]="pmo-architect.md portfolio-analyst.md"
TIPO_AGENTS[Portfolio]="portfolio-analyst.md financial-modeler.md"
TIPO_AGENTS[Transformation]="agile-coach.md pmo-architect.md"
TIPO_AGENTS[Recovery]="risk-analyst.md contingency-planner.md"

declare -A TIPO_SKILLS
TIPO_SKILLS[Agile]="scrum-framework user-story-mapping sprint-retrospective"
TIPO_SKILLS[Kanban]="kanban-metrics wip-optimization flow-analysis"
TIPO_SKILLS[SAFe]="safe-portfolio-management pi-planning art-sync"
TIPO_SKILLS[Waterfall]="pmbok-process-groups critical-path-analysis gate-review"
TIPO_SKILLS[Hybrid]="hybrid-methodology adaptive-planning tailored-governance"
TIPO_SKILLS[PMO]="pmo-maturity-assessment governance-framework portfolio-dashboard"
TIPO_SKILLS[Portfolio]="portfolio-optimization benefit-realization investment-analysis"
TIPO_SKILLS[Transformation]="transformation-roadmap change-readiness organizational-design"
TIPO_SKILLS[Recovery]="project-recovery-assessment risk-mitigation-plan contingency-activation"

# ─── Helper: emit skill paths by load level ───
emit_skill() {
  local skill="$1"
  local skill_dir="$SKILLS_DIR/$skill"
  local skill_file="$skill_dir/SKILL.md"

  [ -f "$skill_file" ] || return 0

  case "$LOAD_LEVEL" in
    L1)
      # Metadata only: just the SKILL.md path (agent reads frontmatter + TL;DR)
      echo "$skill_file  # L1:metadata"
      ;;
    L2)
      # Core: full SKILL.md
      echo "$skill_file  # L2:core"
      ;;
    L3)
      # Deep: SKILL.md + references/ + examples/
      echo "$skill_file  # L3:deep"
      [ -d "$skill_dir/references" ] && find "$skill_dir/references" -name "*.md" -type f 2>/dev/null | while read -r ref; do
        echo "$ref  # L3:reference"
      done
      [ -d "$skill_dir/examples" ] && find "$skill_dir/examples" -name "*.md" -type f 2>/dev/null | while read -r ex; do
        echo "$ex  # L3:example"
      done
      ;;
  esac
}

# ─── Collect results ───
echo "# APEX Lazy Load — Phase $PHASE, Tipo $TIPO, Level $LOAD_LEVEL"
echo "# Generated: $(date -u +%Y-%m-%dT%H:%M:%SZ)"
echo "#"
echo "# Load Levels:"
echo "#   L1 = Metadata (frontmatter + TL;DR) — ~20 lines/skill"
echo "#   L2 = Core (full SKILL.md) — ~200 lines/skill"
echo "#   L3 = Deep (SKILL.md + references/ + examples/) — ~500+ lines/skill"
echo ""

# Agents (always full file — agents are small)
echo "## Agents"
for agent in "${CORE_AGENTS[@]}"; do
  [ -f "$AGENTS_DIR/$agent" ] && echo "$AGENTS_DIR/$agent"
done

PHASE_AGENT_LIST="${PHASE_AGENTS[$PHASE]:-}"
for agent in $PHASE_AGENT_LIST; do
  [ -f "$AGENTS_DIR/$agent" ] && echo "$AGENTS_DIR/$agent"
done

TIPO_AGENT_LIST="${TIPO_AGENTS[$TIPO]:-}"
for agent in $TIPO_AGENT_LIST; do
  [ -f "$AGENTS_DIR/$agent" ] && echo "$AGENTS_DIR/$agent"
done

echo ""
echo "## Skills ($LOAD_LEVEL)"

# Skills — progressive loading
for skill in "${CORE_SKILLS[@]}"; do
  emit_skill "$skill"
done

PHASE_SKILL_LIST="${PHASE_SKILLS[$PHASE]:-}"
for skill in $PHASE_SKILL_LIST; do
  emit_skill "$skill"
done

TIPO_SKILL_LIST="${TIPO_SKILLS[$TIPO]:-}"
for skill in $TIPO_SKILL_LIST; do
  emit_skill "$skill"
done

# Count
TOTAL_AGENTS=$(echo "${CORE_AGENTS[*]} $PHASE_AGENT_LIST $TIPO_AGENT_LIST" | tr ' ' '\n' | sort -u | grep -c '\.md$' || echo 0)
TOTAL_SKILLS=$(echo "${CORE_SKILLS[*]} $PHASE_SKILL_LIST $TIPO_SKILL_LIST" | tr ' ' '\n' | sort -u | grep -c '[a-z]' || echo 0)

echo ""
echo "# Summary: $TOTAL_AGENTS agents, $TOTAL_SKILLS skills at $LOAD_LEVEL"

#!/usr/bin/env bash
# lazy-load-resolver.sh — Dynamic agent/skill resolver with progressive MOAT loading
# MAO Framework v1.3 — Open Discovery Framework
# © 2026 Comunidad MetodologIA. GPL-3.0 Copyleft.
#
# Usage: lazy-load-resolver.sh <PHASE_NUM> <TIPO_SERVICIO> [PLUGIN_DIR] [LOAD_LEVEL]
# Output: List of agent and skill file paths to load into context
#
# LOAD_LEVEL (progressive MOAT):
#   L1 = Metadata only (SKILL.md frontmatter + TL;DR) — minimal context cost
#   L2 = Core body (SKILL.md full content) — standard operation
#   L3 = Deep (SKILL.md + references/ + examples/) — full knowledge base

set -euo pipefail

PHASE="${1:-0}"
TIPO="${2:-SDA}"
PLUGIN_DIR="${3:-.}"
LOAD_LEVEL="${4:-L2}"

AGENTS_DIR="$PLUGIN_DIR/agents"
SKILLS_DIR="$PLUGIN_DIR/skills"

# ─── Core team (always loaded) ───
CORE_AGENTS=(
  "discovery-conductor.md"
  "quality-guardian.md"
  "risk-controller.md"
)

CORE_SKILLS=(
  "discovery-orchestrator"
  "pipeline-governance"
  "input-analysis"
)

# ─── Phase-specific agents ───
declare -A PHASE_AGENTS
PHASE_AGENTS[0]="business-analyst.md change-catalyst.md delivery-manager.md"
PHASE_AGENTS[1]="business-analyst.md domain-analyst.md subject-matter-expert.md"
PHASE_AGENTS[2]="enterprise-architect.md technical-architect.md backend-developer.md domain-analyst.md"
PHASE_AGENTS[3]="technical-architect.md solutions-architect.md data-architect.md platform-engineer.md security-architect.md"
PHASE_AGENTS[4]="technical-architect.md solutions-architect.md enterprise-architect.md data-architect.md platform-engineer.md security-architect.md analytics-architect.md"
PHASE_AGENTS[5]="delivery-manager.md change-catalyst.md ux-strategist.md editorial-director.md content-strategist.md"
PHASE_AGENTS[6]="delivery-manager.md editorial-director.md content-strategist.md format-specialist.md"

# ─── Phase-specific skills ───
declare -A PHASE_SKILLS
PHASE_SKILLS[0]="stakeholder-mapping workshop-design executive-pitch"
PHASE_SKILLS[1]="asis-analysis dynamic-sme sector-intelligence"
PHASE_SKILLS[2]="flow-mapping data-engineering integration-architecture"
PHASE_SKILLS[3]="scenario-analysis software-architecture solutions-architecture technical-feasibility"
PHASE_SKILLS[4]="multidimensional-feasibility architecture-tobe roadmap-poc"
PHASE_SKILLS[5]="solution-roadmap cost-estimation commercial-model storytelling"
PHASE_SKILLS[6]="discovery-handover technical-writing copywriting"

# ─── Service type modifiers ───
declare -A TIPO_AGENTS
TIPO_AGENTS[SDA]=""
TIPO_AGENTS[QA]="quality-engineer.md"
TIPO_AGENTS[Management]=""
TIPO_AGENTS[RPA]=""
TIPO_AGENTS[Data-AI]="ai-architect.md analytics-architect.md data-engineer.md"
TIPO_AGENTS[Cloud]="cloud-architect.md platform-engineer.md"
TIPO_AGENTS[SAS]=""
TIPO_AGENTS[UX-Design]="ux-strategist.md ux-researcher.md"
TIPO_AGENTS[Digital-Transformation]="enterprise-architect.md change-catalyst.md"

declare -A TIPO_SKILLS
TIPO_SKILLS[SDA]="software-architecture api-architecture database-architecture"
TIPO_SKILLS[QA]="testing-strategy quality-engineering performance-engineering"
TIPO_SKILLS[Management]="project-program-management risk-controlling-dynamics"
TIPO_SKILLS[RPA]="rpa-discovery workflow-design"
TIPO_SKILLS[Data-AI]="data-engineering analytics-engineering data-governance data-science-architecture"
TIPO_SKILLS[Cloud]="cloud-migration cloud-native-architecture infrastructure-architecture"
TIPO_SKILLS[SAS]="staff-augmentation-discovery adoption-strategy"
TIPO_SKILLS[UX-Design]="ux-design-discovery mobile-assessment accessibility-audit"
TIPO_SKILLS[Digital-Transformation]="digital-transformation-discovery enterprise-architecture change-readiness-assessment"

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
echo "# MAO Progressive MOAT Load — Phase $PHASE, Tipo $TIPO, Level $LOAD_LEVEL"
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
echo "# Summary: $TOTAL_AGENTS agents, $TOTAL_SKILLS skills at $LOAD_LEVEL (of 101/108 total)"

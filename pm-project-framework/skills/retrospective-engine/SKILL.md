---
name: apex-retrospective-engine
description: >
  Use when the user asks to "run a retrospective", "facilitate a retro",
  "conduct Start-Stop-Continue", "run a 4Ls retro", "facilitate a Sailboat retro",
  "analyze sprint improvement data", or mentions retrospective engine, structured
  retrospective, sprint retro, team reflection, improvement commitment tracking.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Structured Retrospective Engine

**TL;DR**: Facilitates structured retrospectives using multiple formats (Start-Stop-Continue, 4Ls, Sailboat, Mad-Sad-Glad, Starfish, DAKI) combined with quantitative metrics analysis. Selects format based on team context and retrospective objective. Produces actionable improvement commitments backed by both data patterns and team sentiment, with follow-through tracking across retrospective cycles.

## Principio Rector
Una retrospectiva sin datos es terapia; una retrospectiva sin sentimientos es un dashboard review. La retrospectiva efectiva combina ambos: los datos revelan patrones que el equipo no ve, el equipo revela causas raíz que los datos no muestran. Y lo más importante: una retrospectiva sin acciones implementadas es peor que no hacer retrospectiva — enseña al equipo que las mejoras son teatro.

## Assumptions & Limits
- Assumes ≥1 completed sprint/period with performance data available [METRIC]
- Assumes previous retrospective action items are tracked for follow-through [SUPUESTO]
- Breaks when team is < 3 people — retro dynamics require minimum group size
- Does not facilitate in real-time; produces structured retro plan and report
- Assumes team psychological safety allows honest feedback [SUPUESTO]
- Limited to team-level retrospectives; for ART-level use SAFe Inspect & Adapt format

## Usage

```bash
# Sprint retrospective with format selection
/pm:retrospective-engine $ARGUMENTS="--sprint 8 --format 4Ls --metrics velocity,defects"

# Auto-select format based on team fatigue
/pm:retrospective-engine --type auto --team-retros-count 12

# Follow-through analysis of prior retro actions
/pm:retrospective-engine --type follow-through --baseline retro-sprint-7.md
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$ARGUMENTS` | Yes | Sprint/period identifier |
| `--format` | No | `4Ls`, `SSC`, `Sailboat`, `Starfish`, `DAKI`, `auto` (default) |
| `--type` | No | `full` (default), `follow-through`, `auto` |
| `--metrics` | No | Comma-separated metrics to analyze |
| `--team-retros-count` | No | Number of prior retros (for format rotation) |

## Service Type Routing
`{TIPO_PROYECTO}` variants:
- **Agile**: Sprint retrospective (every 2 weeks), format rotation to prevent fatigue, velocity-backed insights
- **Waterfall**: Phase-end lessons learned, milestone retrospective, formal documentation for organizational learning
- **SAFe**: Inspect & Adapt at PI boundary, ART-level retrospective, problem-solving workshop format
- **Kanban**: Periodic flow review retrospective, service delivery review, operations review cadence
- **Hybrid**: Combined retrospective covering both iterative and sequential project components
- **PMO**: Portfolio retrospective, cross-project lessons learned aggregation, PMO service improvement review
- **Recovery**: Post-mortem analysis, failure mode retrospective, recovery progress retrospective

## Before Reflecting
1. **Read** sprint/period performance metrics (velocity, throughput, defect rate) [METRIC]
2. **Read** previous retrospective report to check action item completion [PLAN]
3. **Glob** `**/retrospective*` to count prior retros and determine format rotation [PLAN]
4. **Grep** for incidents, blockers, or escalations during the period [INFERENCIA]

## Entrada (Input Requirements)
- Period performance metrics (velocity, throughput, cycle time, defect rate, rework %)
- Previous retrospective action items and completion status
- Team availability and retrospective time allocation
- Team retrospective fatigue level (to select appropriate format)
- Specific events or incidents to address (if any)

## Proceso (Protocol)
1. **Format selection** — Choose retrospective format based on team context, fatigue level, and objective
2. **Data preparation** — Compile quantitative metrics for the retrospective period
3. **Previous actions review** — Assess completion and impact of prior retrospective action items
4. **Metric presentation** — Present period metrics with trend analysis and anomaly highlights
5. **Structured gathering** — Facilitate format-specific input gathering (e.g., 4Ls: Liked, Learned, Lacked, Longed For)
6. **Pattern correlation** — Connect quantitative patterns to qualitative team feedback
7. **Root cause analysis** — Apply 5 Whys or fishbone diagram for high-impact items
8. **Improvement prioritization** — Rank improvements using effort-impact matrix
9. **Action commitment** — Team commits to 2-3 SMART improvement actions with owners and deadlines
10. **Follow-through design** — Define how action progress will be tracked and reported

## Edge Cases
1. **Previous retro actions not implemented for 2+ cycles** — Escalate the pattern itself as the top finding. Investigate why: overcommitment, no ownership, or actions too vague. Reduce next retro to 1 action maximum [METRIC].
2. **Team disengaged from retrospective process** — Switch to a novel format. Consider anonymous input gathering. If persistent, this is a team health issue requiring management attention [STAKEHOLDER].
3. **Metrics show improvement but team sentiment is negative** — Trust the team. Investigate hidden costs of metric improvement (overtime, shortcuts, deferred quality). Metrics can improve while sustainability degrades [INFERENCIA].
4. **Blame-oriented feedback** — Redirect to systemic causes. Use "What system allowed this to happen?" framing. If blame persists, pause and address team safety first [STAKEHOLDER].

## Example: Good vs Bad

**Good example — Data-backed retrospective:**

| Attribute | Value |
|-----------|-------|
| Format | 4Ls selected (3rd rotation, avoiding fatigue) |
| Metrics | Velocity, defect rate, cycle time — all with 5-sprint trend |
| Prior actions | 2/3 completed, 1 deferred with rationale |
| Insights | 4 insights correlating metrics to team feedback |
| Actions | 2 SMART actions with owners, deadlines, and success criteria |
| Follow-through | Actions added to sprint backlog for visibility |

**Bad example — Therapy session retro:**
90 minutes of venting with no data, no prior action review, no structured format, and 8 action items with no owners or deadlines. A retrospective that produces 8 actions will complete zero. Without data correlation, improvements target symptoms not causes.

## Salida (Deliverables)
- `06_retrospective_{periodo}_{proyecto}_{WIP}.md` — Retrospective report with metrics and insights
- Format-specific output board (visual artifact)
- Improvement action register with SMART criteria
- Previous action items completion scorecard
- Metric trend dashboard for the retrospective period

## Validation Gate
- [ ] Format selected with rationale (not the same format 3x consecutively) [PLAN]
- [ ] ≥3 quantitative metrics presented with trend analysis [METRIC]
- [ ] Previous retro actions reviewed with completion status [METRIC]
- [ ] Insights correlate quantitative data with qualitative feedback [INFERENCIA]
- [ ] ≤3 improvement actions committed (not more) [PLAN]
- [ ] Every action is SMART with owner and deadline [PLAN]
- [ ] Follow-through mechanism defined (how actions will be tracked) [PLAN]
- [ ] Evidence ratio: ≥70% [METRIC]/[PLAN], <30% [INFERENCIA]
- [ ] Root cause analysis applied to highest-impact finding [INFERENCIA]
- [ ] Action items added to visible tracking system (sprint backlog, task board) [PLAN]

## Escalation Triggers
- Previous retrospective actions not implemented for 2+ consecutive cycles
- Key metrics declining for 3+ consecutive retrospective periods
- Team disengaged from retrospective process (participation dropping)
- Systemic issues identified that require management intervention beyond team authority

## Additional Resources

| Resource | When to read | Location |
|----------|-------------|----------|
| Body of Knowledge | Before starting to understand standards and frameworks | `references/body-of-knowledge.md` |
| State of the Art | When benchmarking against industry trends | `references/state-of-the-art.md` |
| Knowledge Graph | To understand skill dependencies and data flow | `references/knowledge-graph.mmd` |
| Use Case Prompts | For specific scenarios and prompt templates | `prompts/use-case-prompts.md` |
| Metaprompts | To enhance output quality and reduce bias | `prompts/metaprompts.md` |
| Sample Output | Reference for deliverable format and structure | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark

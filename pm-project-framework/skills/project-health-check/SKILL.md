---
name: apex-project-health-check
description: >
  Use when the user asks to "check project health", "run health assessment",
  "evaluate project status", "generate RAG scorecard", "diagnose project problems",
  or mentions health check, project diagnostics, RAG status, project vital signs,
  project wellness, leading indicator assessment.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Project Health Check Scorecard

**TL;DR**: Conducts a comprehensive project health assessment across 10 vital dimensions: schedule, budget, scope, quality, risk, team, stakeholders, governance, methodology adherence, and strategic alignment. Produces a RAG (Red/Amber/Blue) scorecard with specific findings and remediation recommendations per dimension.

## Principio Rector
Un health check no es un status report — es un diagnóstico. El status report dice dónde estás; el health check dice cómo estás. Un proyecto puede ser "on time and budget" and still be unhealthy (team burnout, technical debt accumulating, stakeholder trust eroding). El health check reveals the leading indicators, not just the lagging ones.

## Assumptions & Limits
- Assumes project has been executing for ≥1 sprint or ≥1 month to have data for assessment [SUPUESTO]
- Assumes access to schedule, budget, and quality metrics from project management tools [PLAN]
- Breaks when no baseline exists — health cannot be measured without a reference point
- Does not prescribe solutions; it diagnoses. Use specific skills (risk-response-planning, resource-optimization) for remediation
- Assumes team is willing to provide honest feedback on health dimensions [SUPUESTO]
- RAG uses Blue (not Green) per APEX branding standards

## Usage

```bash
# Full 10-dimension health check
/pm:project-health-check $ARGUMENTS="--project proyecto-alfa --period sprint-8"

# Quick health pulse (top 5 dimensions only)
/pm:project-health-check --type pulse --project proyecto-alfa

# Comparative health check against previous assessment
/pm:project-health-check --type trend --baseline health-check-Q1.md
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$ARGUMENTS` | Yes | Project identifier or path to project data |
| `--type` | No | `full` (default), `pulse` (5 dimensions), `trend` (comparative) |
| `--period` | No | Assessment period (sprint number or date range) |
| `--baseline` | No | Previous health check for trend comparison |

## Service Type Routing
`{TIPO_PROYECTO}`: All project types use the same 10-dimension framework. Dimension weights vary: Agile weights team health higher; Waterfall weights baseline adherence; Portfolio weights strategic alignment.

## Before Diagnosing
1. **Read** the latest status report and EVM data to understand current performance [METRIC]
2. **Glob** `**/risk_register*` and `**/issue_log*` to assess risk and issue posture [PLAN]
3. **Read** previous health check results (if any) to establish trend baseline [METRIC]
4. **Grep** for team feedback, retrospective outputs, or morale indicators in project artifacts [INFERENCIA]

## Entrada (Input Requirements)
- Current project status data (EVM, velocity, quality metrics)
- Team feedback and morale indicators
- Stakeholder satisfaction data
- Risk register status
- Governance compliance status

## Proceso (Protocol)
1. **Data collection** — Gather quantitative and qualitative data for each dimension
2. **Dimension scoring** — Rate each dimension as Red (critical), Amber (at risk), or Blue (healthy)
3. **Evidence documentation** — Document specific evidence supporting each RAG rating
4. **Trend analysis** — Compare current health with previous assessments
5. **Root cause identification** — For Red/Amber dimensions, identify root causes
6. **Remediation recommendations** — Provide specific actions to improve unhealthy dimensions
7. **Priority ranking** — Rank remediation actions by urgency and impact
8. **Scorecard compilation** — Build visual scorecard with summary and details
9. **Benchmark comparison** — Compare health against organizational norms
10. **Action plan** — Create time-bound action plan for top remediation priorities

## Edge Cases
1. **First health check with no prior data** — Establish baseline ratings with [SUPUESTO] tags on dimensions lacking historical data. Schedule follow-up assessment in 2-4 weeks to validate initial ratings [METRIC].
2. **All dimensions rated Blue** — Verify this is genuine health, not assessment blindness. Challenge by asking: "What would it take to turn each dimension Red?" Document validation evidence [INFERENCIA].
3. **Team refuses to participate in health assessment** — This itself is a Red indicator on the Team dimension. Document the refusal and recommend management intervention [STAKEHOLDER].
4. **Project in crisis (≥5 Red dimensions)** — Shift from health check to triage mode. Prioritize the 2-3 dimensions that, if improved, would cascade improvements to others. Recommend Recovery project type [PLAN].

## Example: Good vs Bad

**Good example — Actionable health scorecard:**

| Attribute | Value |
|-----------|-------|
| Dimensions assessed | All 10 with evidence per dimension |
| RAG ratings | 6 Blue, 3 Amber, 1 Red — each with 2-3 evidence points |
| Trend | Compared against 2 prior assessments with trajectory arrows |
| Remediation | 5 specific actions ranked by urgency with owners and deadlines |
| Root causes | Red dimension has fishbone analysis identifying 3 contributing factors |
| Evidence tags | 90% [METRIC]/[PLAN], 10% [INFERENCIA] |

**Bad example — Superficial health check:**
All 10 dimensions rated "Blue" with no supporting evidence, no trend analysis, and no remediation actions. A health check without evidence is an opinion, not a diagnosis. Without trend data, point-in-time ratings miss deterioration patterns.

## Salida (Deliverables)
- Project health scorecard (RAG per dimension)
- Detailed findings per dimension
- Trend analysis (if prior health checks exist)
- Remediation action plan
- Executive health summary (one-page)

## Validation Gate
- [ ] All 10 dimensions assessed with ≥2 evidence points each [METRIC]
- [ ] Every RAG rating justified with specific data, not subjective impression [PLAN]
- [ ] Red/Amber dimensions have root cause analysis with ≥1 identified cause [INFERENCIA]
- [ ] Remediation actions are SMART (Specific, Measurable, Assigned, Realistic, Time-bound) [PLAN]
- [ ] No dimension rated without data source identified [METRIC]
- [ ] Trend analysis included if prior health check exists [METRIC]
- [ ] Executive summary fits on one page with RAG visual [PLAN]
- [ ] Evidence ratio: ≥80% [METRIC]/[PLAN], <20% [SUPUESTO]
- [ ] Priority ranking of remediation actions uses impact-urgency matrix [PLAN]
- [ ] Scorecard distinguishes leading indicators from lagging indicators [INFERENCIA]

## Escalation Triggers
- 3+ dimensions rated Red
- Health declining for 3+ consecutive periods
- Team health rated Red (attrition/burnout risk)
- Strategic alignment rated Red (project relevance questioned)

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

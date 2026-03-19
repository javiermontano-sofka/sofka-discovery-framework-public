---
name: apex-agile-assessment
description: >
  Use when the user asks to "assess agile maturity", "evaluate agile practices",
  "run agile readiness check", "benchmark Scrum adoption", or "audit agile capabilities".
  Activates when a stakeholder needs to measure agile adoption level, evaluate Scrum maturity,
  diagnose agile anti-patterns, compare agile readiness across teams, or baseline agile capability
  before a transformation initiative.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Agile Maturity Assessment

**TL;DR**: Assesses organizational agile maturity across six dimensions: mindset and culture, practices and processes, team structure, tooling, leadership support, and delivery outcomes. Produces a maturity radar with current vs. target state, a gap analysis per dimension, and an improvement roadmap grounded in agile principles rather than ceremony checklists.

## Principio Rector
La madurez ágil no se mide por cuántas ceremonias se hacen, sino por cuánto empirismo se practica. Un equipo que hace dailys pero nunca adapta su proceso no es ágil — es waterfall con reuniones diarias. La evaluación busca evidencia de transparencia, inspección y adaptación reales, no ceremonias rituales.

## Assumptions & Limits
- Assumes access to at least one sprint team with ≥3 sprints of historical data [SUPUESTO]
- Assumes interviewees provide honest assessment of practices, not aspirational descriptions [SUPUESTO]
- Breaks when the organization has never attempted agile — use `methodology-assessment` first
- Scope limited to team-level and leadership-level maturity; does not assess enterprise agility (use `safe-assessment`)
- Self-assessment surveys alone are insufficient; observation and artifact review required [PLAN]
- Does not produce a transformation roadmap — that is the output of `organizational-change`

## Usage

```bash
# Assess agile maturity for a single team
/pm:agile-assessment $PROJECT --type=team --team="Equipo Alpha"

# Assess agile maturity across the organization
/pm:agile-assessment $PROJECT --type=organization --scope="all-teams"

# Assess readiness before SAFe adoption
/pm:agile-assessment $PROJECT --type=readiness --target="SAFe"
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PROJECT` | Yes | Project or organization identifier |
| `--type` | Yes | `team`, `organization`, or `readiness` |
| `--team` | No | Specific team to assess (default: all) |
| `--target` | No | Target framework for readiness check |
| `--scope` | No | Assessment scope filter |

## Service Type Routing
`{TIPO_PROYECTO}` variants:
- **Agile**: Primary use — full agile maturity assessment across all dimensions
- **Waterfall**: Assess agile readiness as input for methodology transformation decision
- **SAFe**: Assess team-level agile maturity as prerequisite for SAFe scaling
- **Kanban**: Assess agile mindset maturity alongside Kanban flow practices
- **Hybrid**: Assess agile component maturity within hybrid methodology structure
- **PMO**: Assess organizational agile capability across project portfolio
- **Portfolio**: Assess agile delivery capability as input for portfolio governance design
- **Transformation**: Baseline agile maturity before organizational agile transformation

## Before Assessing

1. **Read** the stakeholder register to identify interviewees and their roles in the agile adoption journey
2. **Glob** `skills/agile-assessment/references/*.md` for maturity rubrics and industry benchmarks
3. **Read** any existing methodology assessment to understand the current declared methodology
4. **Grep** for prior retrospective outputs or lessons learned mentioning agile practices

## Entrada (Input Requirements)
- Current team processes and ceremonies
- Delivery metrics (velocity, cycle time, quality, predictability)
- Team and leadership interviews or survey data
- Organizational structure and culture indicators
- Historical agile adoption efforts and results

## Proceso (Protocol)
1. **Dimension definition** — Establish assessment dimensions (mindset, practices, structure, tooling, leadership, outcomes)
2. **Data collection** — Gather evidence through interviews, observation, metrics, and artifact review
3. **Current state scoring** — Rate maturity per dimension using 1-5 rubric with behavioral indicators
4. **Evidence documentation** — Document specific evidence supporting each score
5. **Target state definition** — Define desired maturity per dimension with stakeholder input
6. **Gap analysis** — Calculate and visualize gap between current and target per dimension
7. **Benchmark comparison** — Compare against industry agile maturity benchmarks
8. **Anti-pattern identification** — Flag agile anti-patterns observed (cargo cult, zombie Scrum)
9. **Improvement prioritization** — Rank improvements by impact on delivery outcomes and feasibility
10. **Roadmap creation** — Design phased improvement roadmap respecting organizational change capacity

## Edge Cases

1. **Team claims agile but has no metrics**: Score mindset dimension based on behavioral observation only; flag absence of metrics as a maturity gap. Require ≥1 sprint of metric collection before reassessment. [METRIC]
2. **Leadership mandated agile without team buy-in**: Assess leadership dimension separately; note top-down imposition as anti-pattern. Recommend bottom-up pilot strategy in roadmap. [STAKEHOLDER]
3. **Multiple teams at wildly different maturity levels**: Produce individual team scorecards AND an aggregate organizational view. Do not average scores — show distribution. [PLAN]
4. **Organization uses "agile" terminology but follows waterfall**: Flag as "Agile Theater" anti-pattern. Score based on actual behavior, not declared process. [INFERENCIA]
5. **No prior agile experience at all**: Redirect to `methodology-assessment` first. If agile is selected, this becomes a readiness baseline rather than maturity measurement. [SUPUESTO]

## Example: Good vs Bad

**Good Assessment:**

| Attribute | Value |
|-----------|-------|
| Dimensions assessed | 6/6 with behavioral evidence |
| Evidence per score | ≥2 data points (observation + metric) |
| Anti-patterns identified | 3, each with remediation |
| Gap visualization | Radar chart with current vs target |
| Roadmap | Phased, 3 horizons, respects change capacity |
| Evidence tags | 80% [METRIC]/[PLAN], 20% [INFERENCIA] |

**Bad Assessment:**
A maturity report that scores every dimension based solely on a self-assessment survey without observation or artifact review. Scores are inflated because teams rate aspirations, not reality. No anti-patterns identified. Roadmap says "adopt Scrum" without phasing or change capacity analysis. Fails because it produces fictional maturity scores that misinform investment decisions.

## Validation Gate
- [ ] ≥2 evidence sources per dimension score (observation, metrics, artifacts, interviews)
- [ ] Every score 1-5 has a behavioral anchor description — no unanchored ratings
- [ ] All 6 dimensions assessed — no dimension skipped or marked N/A without justification
- [ ] Anti-pattern catalog includes ≥3 identified patterns with remediation steps
- [ ] Improvement roadmap has ≥2 phases respecting organizational change capacity
- [ ] Gap analysis produces radar visualization with current AND target state
- [ ] No score based solely on self-assessment without corroborating evidence
- [ ] Agile adoption risks identified with probability and impact ratings
- [ ] Leadership sees concrete improvement path tied to delivery outcome metrics [STAKEHOLDER]
- [ ] Assessment grounded in Agile Manifesto principles, not framework orthodoxy [PLAN]

## Escalation Triggers
- Level 1 maturity across critical dimensions (mindset, practices)
- Leadership actively opposing agile practices or undermining team autonomy
- No improvement despite 6+ months of agile coaching or transformation effort
- Assessment reveals fundamental culture incompatibility with agile values

## Additional Resources

| Resource | When to read | Location |
|----------|-------------|----------|
| Body of Knowledge | Before first assessment to calibrate rubrics | `references/body-of-knowledge.md` |
| State of the Art | When benchmarking against industry trends | `references/state-of-the-art.md` |
| Knowledge Graph | To understand skill dependencies and data flow | `references/knowledge-graph.mmd` |
| Use Case Prompts | For specific assessment scenarios | `prompts/use-case-prompts.md` |
| Metaprompts | To enhance assessment quality and reduce bias | `prompts/metaprompts.md` |
| Sample Output | Reference for deliverable format and structure | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark

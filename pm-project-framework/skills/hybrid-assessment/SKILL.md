---
name: apex-hybrid-assessment
description: >
  Use when the user asks to "assess hybrid methodology readiness", "evaluate hybrid approach",
  "check hybrid methodology maturity", "measure integration capability", "diagnose water-scrum-fall",
  or mentions hybrid assessment, hybrid readiness, mixed methodology evaluation,
  iterative-sequential integration maturity. Triggers on: evaluates hybrid methodology maturity,
  detects hybrid anti-patterns, scores integration capability, assesses dual-governance readiness,
  produces hybrid adoption roadmap.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Hybrid Methodology Maturity Assessment

**TL;DR**: Evaluates organizational readiness and maturity for hybrid methodology adoption — the deliberate integration of iterative (Agile/Kanban) and sequential (Waterfall/phase-gate) practices. Assesses the organization's ability to manage dual governance, context-switching, and integrated reporting. Produces a maturity score, integration gap analysis, and a phased adoption roadmap.

## Principio Rector
Híbrido no significa "hacemos un poco de todo y nada bien". La madurez híbrida se mide por la capacidad de la organización para elegir conscientemente qué componentes del proyecto son iterativos y cuáles son secuenciales, y gobernarlos de forma integrada sin fricción ni duplicación.

## Assumptions & Limits
- Assumes the organization has at least basic experience with both iterative and sequential approaches [SUPUESTO]
- Assumes assessment respondents can differentiate between intentional hybrid and accidental hybrid [SUPUESTO]
- Breaks if the organization has zero iterative or zero sequential experience — use `methodology-assessment` instead [PLAN]
- Scope limited to methodology integration maturity; tool integration is assessed separately by `jira-configuration` [PLAN]
- Does not prescribe a specific hybrid model — assesses capability to execute any hybrid approach [PLAN]

## Usage
```bash
/pm:hybrid-assessment $PROJECT_NAME --dimensions=all
/pm:hybrid-assessment $PROJECT_NAME --dimensions=governance,reporting --benchmark=industry
/pm:hybrid-assessment $PROJECT_NAME --type=quick --teams=5
```
**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PROJECT_NAME` | Yes | Target project or organization identifier |
| `--dimensions` | No | `all` / comma-separated list (default: `all`) |
| `--benchmark` | No | `industry` / `internal` (default: `internal`) |
| `--teams` | No | Number of teams to assess |

## Service Type Routing
`{TIPO_PROYECTO}` variants:
- **Agile**: Assess readiness to integrate phase-gate governance into Agile delivery
- **Waterfall**: Assess readiness to introduce iterative elements within phase-gate structure
- **SAFe**: Assess ability to manage SAFe alongside traditional PMO governance
- **Kanban**: Assess ability to overlay Kanban flow with milestone-driven reporting
- **Hybrid**: Primary use — full maturity assessment across all hybrid dimensions
- **PMO**: Assess PMO capability to govern mixed-methodology portfolio
- **Transformation**: Assess readiness for transition from single to hybrid methodology

## Before Assessing Hybrid Maturity
1. Read `methodology-assessment` results — confirm both iterative and sequential baselines exist [PLAN]
2. Glob `*governance*` — verify governance structures are documented for comparison [PLAN]
3. Read team composition data — identify teams operating under different methodologies [STAKEHOLDER]
4. Review organizational change readiness — hybrid adoption is a change management challenge [PLAN]

## Entrada (Input Requirements)
- Current methodology practices (both iterative and sequential)
- Governance and reporting structures
- Team composition and methodology experience
- Tooling landscape and integration capabilities
- Organizational culture and change readiness

## Proceso (Protocol)
1. **Dimension definition** — Establish hybrid assessment dimensions (governance integration, reporting unification, team flexibility, tooling integration, culture adaptability)
2. **Data collection** — Gather evidence through interviews, process review, and artifact analysis
3. **Iterative capability scoring** — Rate maturity of Agile/iterative practices (1-5)
4. **Sequential capability scoring** — Rate maturity of Waterfall/sequential practices (1-5)
5. **Integration capability scoring** — Rate ability to combine both coherently (1-5)
6. **Gap analysis** — Identify where integration breaks down
7. **Anti-pattern detection** — Flag common hybrid anti-patterns (Water-Scrum-Fall, Agile-in-Name-Only)
8. **Benchmark comparison** — Compare against hybrid methodology maturity benchmarks
9. **Roadmap creation** — Design phased improvement plan toward effective hybrid operation
10. **Report generation** — Compile dual-radar assessment report

## Edge Cases
1. **Organization claims hybrid but operates pure waterfall with daily standups** — Flag as "cosmetic hybrid" anti-pattern; score integration capability at Level 1; recommend honest baseline before improvement.
2. **Different teams at vastly different maturity levels** — Produce per-team scorecards alongside aggregate; roadmap must address team-specific gaps, not just organizational average.
3. **No governance integration exists** — Dual governance creates double reporting burden; prioritize governance unification as first roadmap item.
4. **Regulatory constraints force sequential governance on agile teams** — Design compliance-compatible agile governance; map regulatory checkpoints to sprint boundaries.

## Example: Good vs Bad

**Good Hybrid Assessment:**
| Attribute | Value |
|-----------|-------|
| Iterative maturity | Level 3 across 4 teams, evidence-based scoring [METRIC] |
| Sequential maturity | Level 4 across PMO processes, calibrated against P3M3 [METRIC] |
| Integration score | Level 2 — governance unified but reporting still duplicated [METRIC] |
| Anti-patterns | Water-Scrum-Fall detected in 2 of 6 teams [METRIC] |
| Roadmap | 3 phases over 9 months with specific actions per team [SCHEDULE] |

**Bad Hybrid Assessment:**
"The organization is somewhat hybrid." — No dimension scoring, no anti-pattern analysis, no per-team breakdown, no evidence-based maturity levels. Assessment provides no actionable improvement path.

## Salida (Deliverables)
- `05_hybrid_assessment_{proyecto}_{WIP}.md` — Hybrid maturity report
- Dual maturity radar (iterative vs. sequential capabilities)
- Integration gap analysis matrix
- Anti-pattern detection report
- Hybrid adoption roadmap

## Validation Gate
- [ ] Every maturity score backed by specific observed evidence — no self-reported scores without verification
- [ ] Both iterative and sequential dimensions independently scored (1-5)
- [ ] Integration capability scored separately from component capabilities
- [ ] Anti-pattern detection covers at least Water-Scrum-Fall, Agile-in-Name-Only, and Governance Duplication
- [ ] Same scoring rubric applied across all teams and departments
- [ ] Roadmap addresses root causes, not symptoms — each action traces to a gap
- [ ] Assessment distinguishes intentional hybrid from accidental hybrid
- [ ] Risks of premature hybrid adoption explicitly identified
- [ ] Leadership sees clear path from current to target state with effort estimates
- [ ] Assessment respects that hybrid is intentional design, not methodology confusion

## Escalation Triggers
- Organization practicing "accidental hybrid" with no intentional integration
- Level 1 maturity in both iterative and sequential dimensions simultaneously
- Governance structure actively prevents methodology integration
- Teams forced into hybrid without training or tooling support

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

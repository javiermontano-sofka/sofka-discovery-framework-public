---
name: apex-steering-review
description: >
  Use when the user asks to "run a steering committee", "prepare steering review",
  "conduct Go/No-Go gate", "orchestrate advisory vote", "prepare gate review package",
  or mentions steering committee, steering review, Go/No-Go decision, advisory vote,
  project gate review, steering minutes, 7-advisor evaluation.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Steering Review (7-Advisor Committee)

**TL;DR**: Phase 3b deliverable that orchestrates a formal steering review where 7 specialized advisors evaluate project readiness and vote Go/No-Go. Each advisor assesses from their domain lens (Strategy, Architecture, Risk, Finance, Methodology, Delivery, Stakeholders). Produces structured steering minutes with individual votes, dissent reasoning, conditions for Go, and actionable next steps.

## Principio Rector
Un steering committee no es un ritual de aprobación — es un mecanismo de gobernanza que protege a la organización de comprometerse con proyectos que no están listos. Los 7 asesores no votan por consenso social; votan por evidencia. Un voto "No-Go" con buena justificación vale más que cinco "Go" por inercia.

## Assumptions & Limits
- Assumes all Phase 1-3a deliverables are complete and available for review [PLAN]
- Assumes 7 advisor perspectives can be meaningfully applied (sufficient project data) [PLAN]
- Breaks when deliverables are incomplete — steering cannot evaluate what does not exist
- Does not produce deliverables; evaluates them. Each advisor reviews existing artifacts
- Assumes decision authority is clear (≥5/7 Go required to proceed) [STAKEHOLDER]
- Limited to project-level steering; for portfolio steering use `strategic-alignment`

## Usage

```bash
# Full 7-advisor steering review
/pm:steering-review $ARGUMENTS="--deliverables phases-1-3/ --type Go-NoGo"

# Conditional Go resolution review
/pm:steering-review --type conditional-review --conditions conditions.md

# Advisory vote on specific decision
/pm:steering-review --type advisory --question "Should we extend scope to include Module B?"
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$ARGUMENTS` | Yes | Path to deliverables package |
| `--type` | No | `Go-NoGo` (default), `conditional-review`, `advisory` |
| `--conditions` | No | Previous conditional-go conditions for resolution |
| `--question` | No | Specific advisory question |

## Service Type Routing
`{TIPO_PROYECTO}` variants:
- **Agile**: Steering evaluates sprint-0 readiness, team formation, backlog quality, DoR compliance
- **Waterfall**: Steering evaluates phase completion, baseline quality, risk mitigation readiness
- **SAFe**: Steering evaluates ART readiness, PI planning preparation, architectural runway
- **Kanban**: Steering evaluates flow system design, WIP limits, service class definitions
- **Hybrid**: Steering evaluates methodology integration plan and dual-governance readiness
- **PMO**: Steering evaluates PMO setup, governance framework, and portfolio alignment
- **Portfolio**: Steering evaluates portfolio rebalancing decisions and strategic alignment
- **Recovery**: Steering evaluates recovery plan viability and resource commitment

## Before Reviewing
1. **Read** all Phase 1-3a deliverables to compile the review package [PLAN]
2. **Read** the project charter to ground advisor reviews in authorized scope [PLAN]
3. **Glob** `**/risk_register*` and `**/budget*` to prepare risk and financial review inputs [PLAN]
4. **Grep** for [SUPUESTO] tags across deliverables to assess assumption density [INFERENCIA]

## Entrada (Input Requirements)
- All Phase 1-3a deliverables (charter, schedule, risk register, stakeholder analysis)
- Project business case and strategic alignment evidence
- Architecture assessment and technical feasibility analysis
- Resource availability confirmation
- Risk assessment with response strategies

## Proceso (Protocol)
1. **Advisor activation** — Spawn 7 advisor personas (Strategy, Architecture, Risk, Finance, Methodology, Delivery, Stakeholders)
2. **Evidence package preparation** — Compile deliverables into structured review package
3. **Strategy advisor review** — Assess strategic alignment, business case strength, market timing
4. **Architecture advisor review** — Assess technical feasibility, architecture readiness, tech debt risk
5. **Risk advisor review** — Assess risk register completeness, response strategy quality, residual risk
6. **Finance advisor review** — Assess budget realism, ROI projections, funding commitment
7. **Methodology advisor review** — Assess methodology selection fit, team readiness, ceremony design
8. **Delivery advisor review** — Assess schedule realism, resource availability, dependency management
9. **Stakeholder advisor review** — Assess stakeholder alignment, communication plan, change readiness
10. **Vote compilation** — Collect individual votes (Go/Conditional-Go/No-Go) with reasoning and conditions

## Edge Cases
1. **Majority No-Go vote (4+ of 7)** — Document all advisor reasoning. Identify minimum remediation to convert No-Go votes. Schedule re-review with specific criteria [STAKEHOLDER].
2. **Split decision (3 Go, 3 No-Go, 1 Conditional)** — Escalate to sponsor for tiebreaker. Present both perspectives with equal weight. Do not average dissenting views [STAKEHOLDER].
3. **Finance advisor identifies unfunded commitments** — Hard stop on financial dimension. Budget must be resolved before any other dimension can proceed [PLAN].
4. **All advisors vote Go but with conditions** — Compile all conditions. Classify as blocking (must resolve before proceed) vs advisory (resolve during execution). Assign owners and deadlines [PLAN].

## Example: Good vs Bad

**Good example — Evidence-based steering:**

| Attribute | Value |
|-----------|-------|
| Advisors | All 7 perspectives represented with evidence |
| Votes | 5 Go, 1 Conditional-Go, 1 No-Go |
| Decision | CONDITIONAL GO — 2 conditions to resolve within 2 weeks |
| Dissent | No-Go vote documented with specific concerns and evidence |
| Conditions | 2 conditions with owners, deadlines, and verification criteria |
| Minutes | Formal minutes with all votes, reasoning, and next steps |

**Bad example — Rubber-stamp steering:**
"Everyone agrees. Let's proceed." No individual advisor reviews, no evidence assessment, no dissent captured, no conditions documented. A steering review without independent evaluation is governance theater that provides false confidence.

## Salida (Deliverables)
- `03b_steering_minutes_{proyecto}_{WIP}.md` — Formal steering minutes with votes
- Individual advisor assessment summaries (7 domain reviews)
- Consolidated conditions for Go (if Conditional-Go)
- Dissent register with reasoning and mitigation requirements
- Next steps action plan with owners and deadlines

## Validation Gate
- [ ] All 7 advisor perspectives represented with domain-specific assessment [PLAN]
- [ ] Every vote grounded in deliverable evidence, not opinion [PLAN]
- [ ] Dissent positions documented with equal weight to approvals [STAKEHOLDER]
- [ ] Decision clearly stated: GO / CONDITIONAL-GO / NO-GO [PLAN]
- [ ] Conditions (if any) are specific, measurable, and time-bound [PLAN]
- [ ] ≥5/7 Go votes for advancement past Gate 1.5 [METRIC]
- [ ] Minutes readable as standalone decision record [PLAN]
- [ ] Evidence ratio across advisor reviews: ≥80% [PLAN]/[METRIC], <20% [SUPUESTO]
- [ ] Next steps have assigned owners and deadlines [PLAN]
- [ ] Review criteria appropriate for declared {TIPO_PROYECTO} [PLAN]

## Escalation Triggers
- Majority No-Go vote (4+ of 7 advisors)
- Any advisor flags critical risk with no mitigation strategy
- Finance advisor identifies unfunded commitments
- Architecture advisor flags fundamental technical infeasibility

## Additional Resources

| Resource | When to Read | Location |
|----------|-------------|----------|
| Body of Knowledge | Governance and steering committee practices | `references/body-of-knowledge.md` |
| State of the Art | Modern governance models | `references/state-of-the-art.md` |
| Knowledge Graph | Steering in Phase 3b pipeline | `references/knowledge-graph.mmd` |
| Use Case Prompts | Steering review scenarios | `prompts/use-case-prompts.md` |
| Metaprompts | Custom advisor frameworks | `prompts/metaprompts.md` |
| Sample Output | Reference steering minutes | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark

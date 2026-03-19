---
name: apex-hypothesis-driven-delivery
description: >
  Use when the user asks to "test a hypothesis", "validate assumptions through delivery",
  "run experiment-driven project", "design build-measure-learn cycles", "validate project assumptions",
  or mentions hypothesis-driven delivery, HDD, validated learning, experiment design,
  build-measure-learn. Triggers on: converts assumptions into testable hypotheses, designs
  minimum viable experiments, facilitates pivot-or-persevere decisions, documents validated
  learning, ranks hypotheses by risk and impact.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Hypothesis-Driven Delivery (HDD)

**TL;DR**: Applies hypothesis-driven delivery to project decisions, transforming assumptions into testable hypotheses with clear success/failure criteria. Uses build-measure-learn cycles to validate project assumptions before committing full investment, reducing risk through validated learning.

## Principio Rector
Toda decisión de proyecto descansa sobre hipótesis. "Los usuarios adoptarán la nueva herramienta" es una hipótesis, no un hecho. HDD hace explícitas estas hipótesis, las ordena por riesgo, y las valida con el mínimo esfuerzo posible. Invertir millones sin validar hipótesis críticas es esperanza, no gestión.

## Assumptions & Limits
- Assumes stakeholders have tolerance for experimentation and potential failure [SUPUESTO]
- Assumes sufficient data collection capability exists to measure experiment outcomes [SUPUESTO]
- Breaks if organizational culture punishes failure — HDD requires psychological safety [STAKEHOLDER]
- Scope limited to project-level hypothesis validation; strategic pivots require executive authorization [PLAN]
- Does not replace formal requirements engineering — complements it with validated evidence [PLAN]
- Time-boxed experiments require dedicated budget; unfunded experimentation defaults to opinion-based decisions [PLAN]

## Usage
```bash
/pm:hypothesis-driven-delivery $PROJECT_NAME --extract-from=assumptions
/pm:hypothesis-driven-delivery $PROJECT_NAME --hypothesis="Users will adopt tool X" --experiment=pilot
/pm:hypothesis-driven-delivery $PROJECT_NAME --rank-by=risk-impact --top=5
```
**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PROJECT_NAME` | Yes | Target project identifier |
| `--extract-from` | No | Source for hypothesis extraction (`assumptions` / `risks` / `charter`) |
| `--hypothesis` | No | Specific hypothesis to test |
| `--experiment` | No | Experiment type (`pilot` / `ab-test` / `survey` / `prototype`) |
| `--rank-by` | No | Ranking criterion (`risk-impact` / `cost` / `urgency`) |

## Service Type Routing
`{TIPO_PROYECTO}` variants:
- **Agile**: Build-measure-learn cycles within sprints; hypothesis cards in backlog; experiment results drive pivot-or-persevere decisions
- **SAFe**: Innovation and Planning (IP) iteration for hypothesis validation; Lean startup thinking applied at epic level with MVP experiments
- **Kanban**: Hypotheses as work items with explicit validation criteria; experiment results tracked as flow metrics
- **Transformation**: Change adoption hypotheses validated through pilot groups; ADKAR-stage assumptions tested before enterprise rollout
- **Hybrid**: Structured experiments in iterative phases; validated hypotheses feed formal decisions at waterfall gates
- **Recovery**: Critical assumption re-testing for troubled projects; rapid experiments to validate turnaround strategy viability

## Before Testing Hypotheses
1. Read `assumption-log` — identify assumptions already documented that need validation [PLAN]
2. Glob `*risk-register*` — high-probability risks often contain untested hypotheses [PLAN]
3. Read stakeholder tolerance for experimentation — confirm organizational readiness for HDD [STAKEHOLDER]
4. Verify experiment budget exists — unfunded experiments produce unreliable results [METRIC]

## Entrada (Input Requirements)
- Project assumptions and hypothesis candidates
- Available experimentation budget and timeline
- Success/failure criteria definitions
- Data collection capabilities
- Stakeholder tolerance for experimentation

## Proceso (Protocol)
1. **Hypothesis extraction** — Convert key assumptions into testable hypotheses
2. **Hypothesis format** — Structure as: "We believe [hypothesis]. We will know we're right when [metric] achieves [target] within [timeframe]"
3. **Priority ranking** — Rank hypotheses by risk x impact (test riskiest first)
4. **Experiment design** — Design minimum viable experiments to test each hypothesis
5. **Success criteria** — Define quantitative pass/fail criteria before testing
6. **Execution** — Run experiments within time and budget constraints
7. **Data collection** — Gather measurement data per success criteria
8. **Analysis** — Evaluate results against pre-defined criteria
9. **Decision** — Pivot, persevere, or kill based on validated evidence
10. **Learning documentation** — Document validated/invalidated hypotheses and implications

## Edge Cases
1. **Experiment results are ambiguous** — Redesign experiment with tighter success criteria; if still ambiguous after second run, escalate with documented uncertainty and recommend conservative path.
2. **Stakeholders reject experiment results that contradict preferences** — Document bias formally; present data without editorial; escalate to governance if decision contradicts validated evidence.
3. **No budget for experimentation** — Use lightweight validation methods (surveys, desk research, analogous data); tag all conclusions as [INFERENCIA] rather than [METRIC].
4. **Critical hypothesis invalidated mid-project** — Trigger formal pivot-or-kill decision; document sunk cost vs. future investment analysis for governance review.
5. **Too many hypotheses to test within timeline** — Strict priority ranking by risk x impact; test only top 5; accept remaining as managed risks.

## Example: Good vs Bad

**Good Hypothesis-Driven Delivery:**
| Attribute | Value |
|-----------|-------|
| Hypothesis format | "We believe [X]. We will know when [metric] reaches [target] by [date]" |
| Ranking | 8 hypotheses ranked by risk x impact; top 3 tested first [METRIC] |
| Experiment design | 2-week pilot with 15 users, quantitative success criteria [SCHEDULE] |
| Success criteria | Defined before experiment: adoption rate above 60% in 2 weeks [METRIC] |
| Decision | Pivot decision based on 42% adoption result — redesign onboarding [PLAN] |

**Bad Hypothesis-Driven Delivery:**
"We tested the tool and people seemed to like it." — No structured hypothesis, no pre-defined success criteria, no quantitative measurement, no clear decision framework. Result: confirmation bias disguised as validated learning.

## Salida (Deliverables)
- Hypothesis register with test results
- Experiment design documents
- Validation results and decision log
- Pivot/persevere recommendations
- Validated learning summary

## Validation Gate
- [ ] Every hypothesis follows the structured format: believe/know/when [PLAN]
- [ ] Success criteria defined before experiment execution — no post-hoc criteria
- [ ] Hypotheses ranked by risk x impact with quantified scores
- [ ] Experiment results evaluated against pre-defined criteria only
- [ ] Pivot/persevere/kill decision documented with evidence trace
- [ ] All critical project assumptions have corresponding hypotheses
- [ ] Experiment methodology appropriate for hypothesis type
- [ ] Learning documentation captures both validated and invalidated hypotheses
- [ ] Stakeholder decisions traceable to experiment data
- [ ] HDD cadence integrated with project delivery rhythm

## Escalation Triggers
- Critical hypothesis invalidated
- Experiment results ambiguous
- Stakeholders unwilling to accept experiment results
- Budget insufficient for necessary experiments

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

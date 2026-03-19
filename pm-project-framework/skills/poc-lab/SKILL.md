---
name: apex-poc-lab
description: >
  Use when the user asks to "run a PoC", "prototype a solution",
  "test a tool", "evaluate methodology feasibility", "compare vendor options",
  or mentions proof of concept, PoC, prototype, tool evaluation, methodology pilot,
  controlled experiment. Triggers on: designs controlled PoC experiments, defines
  measurable success criteria, creates evaluation frameworks for tool comparison,
  facilitates evidence-based go/no-go decisions, documents scale-up risks.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# PoC Lab for PM Tool & Methodology Evaluation

**TL;DR**: Designs and executes Proofs of Concept for PM tool evaluation (Jira vs. Azure DevOps vs. Monday.com), methodology pilot testing (2-sprint Scrum pilot, Kanban board pilot), and process innovation experiments. Defines PoC scope, success criteria, evaluation framework, time-box, and decision protocol. Prevents full-scale commitment to unproven approaches by validating hypotheses at small scale with controlled variables.

## Principio Rector
Un PoC no es un proyecto pequeño — es un experimento controlado. Su objetivo no es entregar valor de negocio, sino producir la evidencia necesaria para tomar una decisión de inversión. Un PoC exitoso produce una decisión informada, incluso si la decisión es "no proceder". El peor resultado no es un PoC que falla — es un PoC que no se hace y la organización invierte a ciegas.

## Assumptions & Limits
- Assumes a clear hypothesis exists — PoC without a question to answer is exploration, not experimentation [SUPUESTO]
- Assumes time-box and budget are allocated specifically for the PoC [PLAN]
- Breaks if PoC scope expands beyond original hypothesis — scope creep turns PoC into mini-project [PLAN]
- Scope limited to 2-4 alternatives maximum — too many options dilute evaluation quality [PLAN]
- Does not replace full vendor procurement — PoC informs the decision, procurement executes it [PLAN]
- Scale-up risks explicitly documented — PoC success does not guarantee production success [PLAN]

## Usage
```bash
/pm:poc-lab $PROJECT_NAME --type=tool-eval --options="jira,azure-devops,monday"
/pm:poc-lab $PROJECT_NAME --type=methodology-pilot --methodology=scrum --sprints=2
/pm:poc-lab $PROJECT_NAME --type=process-innovation --hypothesis="Kanban reduces lead time by 30%"
```
**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PROJECT_NAME` | Yes | Target project identifier |
| `--type` | No | `tool-eval` / `methodology-pilot` / `process-innovation` |
| `--options` | No | Comma-separated alternatives to evaluate |
| `--methodology` | No | Methodology to pilot |
| `--sprints` | No | Number of sprints for pilot |
| `--hypothesis` | No | Specific hypothesis to test |

## Service Type Routing
`{TIPO_PROYECTO}` variants:
- **Agile**: PoC for Scrum/Kanban adoption (2-sprint pilot with control team), tool fit evaluation
- **Waterfall**: PoC for PM tool evaluation against phase-gate workflows, EVM tool testing
- **SAFe**: PoC for ART formation feasibility, PI planning dry-run, portfolio tool evaluation
- **Kanban**: PoC for Kanban board design, WIP limit calibration, flow metric tool evaluation
- **Hybrid**: PoC for methodology integration approach, dual-governance feasibility testing
- **PMO**: PoC for PMO service delivery models, governance tool evaluation
- **Portfolio**: PoC for portfolio prioritization models, resource optimization tools
- **Transformation**: PoC for change management approach, communication platform evaluation

## Before Designing PoC
1. Read hypothesis or question — clearly define what the PoC will answer [PLAN]
2. Glob `*vendor*` and `*tool*` — identify evaluation candidates [PLAN]
3. Read decision-maker expectations — understand what evidence they need to decide [STAKEHOLDER]
4. Confirm PoC budget and time-box — unfunded PoCs produce unreliable results [METRIC]

## Entrada (Input Requirements)
- PoC hypothesis — the specific question the PoC will answer
- Options to evaluate (2-4 alternatives maximum)
- Evaluation criteria with weights and measurement methods
- Available time-box, budget, and resources for the PoC
- Decision-maker expectations and acceptance thresholds

## Proceso (Protocol)
1. **Hypothesis definition** — Define the specific question the PoC will answer (falsifiable)
2. **Scope constraint** — Limit PoC scope to the minimum needed for a valid evaluation
3. **Success criteria definition** — Define measurable pass/fail criteria for each option being evaluated
4. **Environment setup** — Prepare PoC environment (sandbox instances, pilot team, test data)
5. **Variable control** — Identify and control variables that could bias evaluation
6. **Time-boxed execution** — Run PoC within defined time-box (typically 2-4 weeks)
7. **Data collection** — Gather evaluation data per defined criteria during execution
8. **Comparative analysis** — Compare options against success criteria with quantified results
9. **Scale-up risk assessment** — Document what changes at full-scale that the PoC cannot validate
10. **Decision facilitation** — Present findings and facilitate evidence-based go/no-go decision

## Edge Cases
1. **PoC results inconclusive** — Redesign evaluation criteria; if still inconclusive after second time-box, choose option with lowest switching cost and plan post-implementation evaluation.
2. **PoC scope creeping into mini-project** — Hard stop; re-scope to original hypothesis; deliver evaluation results from what was executed within original scope.
3. **Decision-makers ignoring PoC results** — Document formal decision divergence; note that the decision is preference-based, not evidence-based; track outcome for lessons learned.
4. **PoC budget exhausted before conclusive results** — Deliver partial results with explicit gaps; recommend additional PoC phase with specific scope or accept decision under uncertainty.
5. **All options fail success criteria** — Valid PoC outcome; recommend alternative approaches not yet evaluated or adjust success criteria based on market reality.

## Example: Good vs Bad

**Good PoC Lab:**
| Attribute | Value |
|-----------|-------|
| Hypothesis | "Jira better supports our Scrum workflow than Azure DevOps" — falsifiable [PLAN] |
| Success criteria | 8 criteria defined before testing with weighted scores [METRIC] |
| Time-box | 3 weeks with 5-person pilot team [SCHEDULE] |
| Variable control | Same team, same data, same 2-week period per tool [PLAN] |
| Result | Jira scored 4.2/5 vs. Azure DevOps 3.7/5; scale-up risks documented [METRIC] |

**Bad PoC Lab:**
"We tried Jira and it seemed okay." — No hypothesis, no success criteria, no controlled comparison, no scale-up risk assessment. Decision has no evidence basis.

## Salida (Deliverables)
- `06_poc_lab_{proyecto}_{WIP}.md` — PoC design document and results report
- Evaluation results matrix (options x criteria with scores)
- PoC execution log with observations and incidents
- Scale-up considerations and risk assessment
- Evidence-based recommendation with confidence level

## Validation Gate
- [ ] PoC results from controlled experiment, not unstructured exploration
- [ ] Evaluation criteria measured objectively with defined measurement methods
- [ ] All options evaluated under comparable conditions — same time, same team, same data
- [ ] Same criteria and time-box applied to all options being evaluated
- [ ] Recommendation directly supports investment/adoption decision
- [ ] Results understandable by decision-makers without technical deep-dive
- [ ] Recommendation traces directly to PoC measurement data
- [ ] Scale-up risks and PoC limitations explicitly documented
- [ ] Decision-makers get evidence-based confidence, not vendor promises
- [ ] PoC design appropriate for the methodology or tool being evaluated

## Escalation Triggers
- PoC results inconclusive (no clear winner and criteria were well-defined)
- PoC exceeding time-box or budget constraints
- PoC scope expanding beyond original hypothesis (scope creep into mini-project)
- Decision-makers ignoring PoC results in favor of pre-existing preferences

## Additional Resources
| Resource | When to Read | Location |
|----------|-------------|----------|
| Body of Knowledge | When designing controlled evaluation experiments | `references/body-of-knowledge.md` |
| State of the Art | When implementing modern PoC and pilot methodologies | `references/state-of-the-art.md` |
| Knowledge Graph | When mapping PoC to pipeline decision gates | `references/knowledge-graph.mmd` |
| Use Case Prompts | When designing PoCs for specific tool or methodology types | `prompts/use-case-prompts.md` |
| Metaprompts | When adapting PoC design for non-standard evaluation contexts | `prompts/metaprompts.md` |
| Sample Output | When reviewing expected PoC report quality | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark

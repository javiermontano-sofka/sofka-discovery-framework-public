---
name: apex-budget-baseline
description: >
  Use when the user asks to "create a budget", "estimate costs", "define contingency reserves",
  "build cost breakdown structure", or "establish a cost baseline for EVM".
  Activates when a stakeholder needs to produce a cost baseline, aggregate bottom-up estimates,
  calculate contingency and management reserves, generate a time-phased budget with S-curve,
  or define cost accounts for earned value tracking.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Budget Baseline & Cost Breakdown

**TL;DR**: Produces a cost baseline including bottom-up cost estimation from WBS work packages, cost breakdown structure (CBS), contingency reserves (known risks), management reserves (unknown risks), and time-phased budget with S-curve. Serves as the cost baseline for Earned Value Management.

## Principio Rector
El presupuesto es un modelo financiero del plan de ejecución. Cada línea presupuestaria debe rastrearse hasta un paquete de trabajo. Las reservas no son "colchón" — son cobertura cuantificada de riesgos identificados (contingencia) y eventos desconocidos (gestión). NUNCA incluir precios unitarios — solo magnitudes y drivers.

## Assumptions & Limits
- Assumes an approved WBS exists with defined work packages [SUPUESTO]
- Assumes resource rates are available in FTE-months, never unit prices [PLAN]
- Breaks when WBS is incomplete — budget without full WBS violates the 100% rule
- Contingency calculations require a risk register; without one, reserves are arbitrary [SUPUESTO]
- Does not include vendor pricing — only effort magnitudes and cost drivers
- S-curve accuracy depends on schedule baseline quality; poor schedules produce misleading curves

## Usage

```bash
# Create budget baseline from WBS and resource plan
/pm:budget-baseline $PROJECT --type=create --source="wbs"

# Calculate contingency reserves from risk register
/pm:budget-baseline $PROJECT --type=contingency --risk-source="risk-register"

# Generate time-phased budget with S-curve
/pm:budget-baseline $PROJECT --type=s-curve --periods="monthly"
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PROJECT` | Yes | Project identifier |
| `--type` | Yes | `create`, `contingency`, `s-curve`, `variance-thresholds` |
| `--source` | No | WBS or estimation source document |
| `--risk-source` | No | Risk register for contingency calculation |
| `--periods` | No | Time-phasing periods (weekly, monthly, quarterly) |

## Service Type Routing
`{TIPO_PROYECTO}` variants:
- **Agile**: Budget by sprint/iteration, velocity-based forecasting
- **Waterfall**: Phase-gate budgeting, formal CBS hierarchy
- **SAFe**: PI-level budget allocation, Lean budgeting guardrails
- **PMO/Portfolio**: Portfolio-level funding allocation, project scoring

## Before Budgeting

1. **Read** the approved WBS to ensure all work packages are defined for bottom-up aggregation
2. **Glob** `skills/budget-baseline/references/*.md` for estimation technique guidelines
3. **Read** the resource plan to extract role assignments and FTE-month allocations
4. **Read** the risk register to calculate contingency reserves based on EMV of identified risks

## Entrada (Input Requirements)
- Approved WBS with work package definitions
- Resource plan with role assignments and rates (FTE-months, not prices)
- Risk register for contingency calculation
- Organizational budget templates and policies
- Historical cost data (if available)

## Proceso (Protocol)
1. **Estimate work packages** — Apply estimation technique per package (analogous, parametric, or 3-point)
2. **Aggregate costs** — Roll up from work package to control account to project level
3. **Build CBS** — Structure Cost Breakdown aligned with WBS hierarchy
4. **Calculate contingency** — Sum EMV of identified risks (typically 5-15% of direct costs)
5. **Establish management reserve** — Apply organizational policy (typically 5-10% above contingency)
6. **Time-phase budget** — Distribute costs across schedule timeline
7. **Generate S-curve** — Plot cumulative planned expenditure over time
8. **Define cost accounts** — Map CBS to organizational cost centers
9. **Set thresholds** — Define variance thresholds triggering corrective action
10. **Baseline approval** — Document budget baseline for EVM (BAC = Budget at Completion)

## Edge Cases

1. **WBS incomplete at budgeting time**: Estimate known packages bottom-up; use parametric estimation for undefined packages. Tag undefined estimates as [SUPUESTO] and schedule re-estimation. [PLAN]
2. **No risk register available for contingency**: Apply organizational default contingency percentage (typically 10%). Document that contingency is not risk-based and flag for update when risk register is complete. [SUPUESTO]
3. **Sponsor budget is fixed and lower than estimate**: Present bottom-up estimate transparently. Identify scope reduction options with impact analysis. Never hide cost gaps. [STAKEHOLDER]
4. **Multi-currency project**: Establish exchange rate assumptions with date. Include currency risk in contingency. Document rate lock mechanism if available. [METRIC]

## Example: Good vs Bad

**Good Budget Baseline:**

| Attribute | Value |
|-----------|-------|
| WBS coverage | 100% of work packages costed |
| Estimation techniques | Tagged per package (analogous, parametric, 3-point) |
| Contingency | Calculated from risk register EMV (8.5% of direct) |
| Management reserve | 5% per organizational policy |
| S-curve | Time-phased monthly with cumulative plot |
| Variance thresholds | Defined per cost category (+/- 10% trigger) |

**Bad Budget Baseline:**
A single number ("the project costs 500 FTE-months") without CBS, without estimation technique documentation, without contingency calculation, without S-curve. Fails because it provides no traceability from budget to work, no early warning mechanism for overruns, and no basis for earned value management.

## Validation Gate
- [ ] 100% of WBS work packages have cost estimates with technique documented
- [ ] CBS hierarchy aligns with WBS structure — every cost traces to a WBS code
- [ ] Contingency reserve calculated from risk register EMV, not arbitrary percentage
- [ ] Management reserve follows organizational policy with documented basis
- [ ] Time-phased budget produces S-curve with monthly or period-level granularity
- [ ] Variance thresholds defined per cost category with escalation procedures
- [ ] No unit prices included — only FTE-months, effort magnitudes, and cost drivers
- [ ] Aggregation verified (100% rule: sum of parts = total for every CBS branch)
- [ ] Sponsor sees clear cost justification with reserves separated [STAKEHOLDER]
- [ ] Estimation approach appropriate for project phase and data availability [PLAN]

## Escalation Triggers
- Total estimate exceeds sponsor budget by > 10%
- Contingency reserve exceeds 20% of direct costs
- More than 30% of estimates are [SUPUESTO]
- No historical data available for analogous estimation

## Salida (Deliverables)

- Primary deliverable: budget baseline with time-phased cost plan
- All outputs tagged with evidence markers
- Mermaid diagrams where applicable
- Executive summary for stakeholder consumption

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

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

---

---

## Sub-Agents

### Bottom Up Estimator


## Bottom-Up Estimator Agent

### Core Responsibility

Build the project budget from the ground up by aggregating detailed cost estimates at the work package level, applying labor rates to resource assignments, calculating non-labor costs (materials, licenses, services), adding overhead and indirect cost allocations, and producing a complete budget that ties every dollar to a specific scope element in the WBS.

### Process

1. **Collect Work Package Estimates.** For each WBS work package, gather the effort estimate (hours/days), resource assignments (roles and quantities), and non-labor cost items. Validate that estimates are complete and sourced from subject matter experts or analogous data.
2. **Apply Labor Rates.** Multiply effort hours by the applicable fully-loaded labor rate for each role. Distinguish between internal FTE rates (salary + benefits + overhead) and external contractor/vendor rates. Document blended rates where teams are mixed.
3. **Calculate Non-Labor Costs.** Itemize and price all non-labor costs per work package: software licenses, hardware procurement, cloud infrastructure, travel, training, materials, and third-party services. Apply quantity and duration multipliers.
4. **Allocate Indirect Costs.** Apply the organization's overhead rate or indirect cost allocation method. Document whether overhead is a flat percentage, activity-based, or allocated by cost pool. Separate G&A from project-specific overhead.
5. **Aggregate Bottom-Up.** Roll up work package budgets to control accounts, then to WBS summary levels, then to the project total. Verify that the sum of all work packages equals the project total (no gaps, no double-counting).
6. **Reconcile Against Top-Down.** Compare the bottom-up total against any top-down budget envelope or funding ceiling. Document variances and flag work packages where estimates exceed benchmarks by >20%.
7. **Produce Budget Spreadsheet.** Generate the detailed budget with drill-down capability from project total to individual work package line items, including unit costs, quantities, and extended totals.

### Output Format

- **Detailed Budget Table** — Table: WBS Code, Work Package, Labor Hours, Labor Cost, Non-Labor Cost, Overhead, Total Cost, Funding Source.
- **Budget Summary by Category** — Pie/bar chart showing cost distribution across labor, infrastructure, licenses, travel, contingency.
- **Top-Down vs Bottom-Up Reconciliation** — Variance analysis between bottom-up estimate and any budget ceiling or analogous benchmark.
- **Assumptions and Exclusions Log** — Documented assumptions (rates, durations, scope) and items explicitly excluded from the budget.

### Cash Flow Projector


## Cash Flow Projector Agent

### Core Responsibility

Translate the time-phased budget into a cash flow projection that shows when funds will be needed, producing monthly and quarterly expenditure forecasts, cumulative S-curve visualizations, and funding requirement schedules that enable treasury planning, milestone-based billing, and earned value baseline establishment.

### Process

1. **Time-Phase the Budget.** Distribute each work package budget across its scheduled duration using the appropriate spreading method: linear (equal distribution), front-loaded (design/procurement heavy), back-loaded (implementation heavy), or resource-driven (follows staffing ramp).
2. **Build Monthly Cash Flow.** Aggregate all work package time-phased costs into a monthly project cash flow table. Separate labor spend from non-labor spend, as they often follow different payment cycles (payroll monthly, vendor invoices net-30/60).
3. **Generate Quarterly Rollups.** Summarize monthly data into quarterly totals for executive reporting and fiscal planning. Align quarters with the organization's fiscal calendar (not necessarily calendar quarters).
4. **Produce S-Curve.** Plot the cumulative planned expenditure over time as the classic S-curve. Include the monthly spend rate (bar chart) overlaid with the cumulative line. Mark major milestones and phase boundaries on the curve.
5. **Determine Funding Requirements.** Calculate the funding requirement schedule: the step function showing when incremental funding tranches must be available. Add a funding buffer (typically 10-15% above planned monthly spend) to accommodate timing variations.
6. **Model Payment Scenarios.** Account for payment timing differences: vendor payment terms (net-30, net-60, milestone-based), labor accruals vs. cash disbursements, and capital expenditure vs. operating expenditure classification.
7. **Deliver Cash Flow Package.** Produce the complete cash flow projection with monthly detail, quarterly summary, S-curve visualization, and funding requirements — ready for CFO/PMO approval and EVM baseline establishment.

### Output Format

- **Monthly Cash Flow Table** — Table: Month, Labor Cost, Non-Labor Cost, Total Monthly Spend, Cumulative Spend, % of Budget Consumed.
- **S-Curve Visualization** — Mermaid or chart showing cumulative planned value over time with milestone markers and phase gates.
- **Funding Requirements Schedule** — Step-function table: Period, Incremental Funding Needed, Cumulative Funding Required, Funding Source.
- **Cash Flow Risk Assessment** — Analysis of cash flow concentration risks, peak spend periods, and sensitivity to schedule delays.

### Contingency Calculator


## Contingency Calculator Agent

### Core Responsibility

Determine the appropriate levels of contingency reserve (for identified risks) and management reserve (for unknown unknowns) using quantitative risk-based methods — expected monetary value (EMV) analysis, percentage-of-total benchmarks, and Monte Carlo simulation confidence intervals — so the budget baseline includes defensible reserves that protect the project without over-allocating funds.

### Process

1. **Inventory Identified Risks.** Import the risk register and extract all risks with cost impact assessments. For each risk, confirm the probability of occurrence (%) and the estimated cost impact (min, most likely, max) in monetary terms.
2. **Calculate Expected Monetary Value.** For each identified risk, compute EMV = Probability x Impact. Sum all positive EMVs (threats) and negative EMVs (opportunities) to derive the net contingency reserve from the EMV method.
3. **Apply Percentage-Based Benchmark.** Calculate contingency as a percentage of the base estimate using industry benchmarks (typically 5-15% for well-defined scope, 15-30% for early-stage or high-uncertainty projects). Document the rationale for the selected percentage.
4. **Incorporate Monte Carlo Results.** If Monte Carlo simulation data is available, extract the P50 (median), P75, and P85 cost estimates. Contingency = P-target minus deterministic estimate. Recommend the confidence level based on organizational risk appetite.
5. **Determine Management Reserve.** Calculate management reserve for unknown unknowns, typically 5-10% of total budget. Justify the percentage based on project complexity, novelty, and organizational maturity. Management reserve sits outside the cost baseline but within the project budget.
6. **Reconcile Reserve Methods.** Compare the three contingency calculations (EMV, percentage, Monte Carlo). Recommend a final contingency figure with justification. If methods diverge by >30%, flag for stakeholder review.
7. **Produce Reserve Allocation Plan.** Map contingency reserve to specific risk categories or WBS elements where feasible. Define the drawdown authorization process (who approves contingency release and under what conditions).

### Output Format

- **EMV Analysis Table** — Table: Risk ID, Risk Description, Probability, Impact (Min/ML/Max), EMV, Risk Owner.
- **Reserve Comparison Matrix** — Table: Method (EMV, Percentage, Monte Carlo), Calculated Reserve, Confidence Level, Recommended Amount.
- **Management Reserve Justification** — One-page rationale documenting complexity factors, historical data, and recommended MR percentage.
- **Reserve Drawdown Policy** — Authorization thresholds, approval chain, and reporting requirements for contingency and management reserve usage.

### Cost Structure Designer


## Cost Structure Designer Agent

### Core Responsibility

Define the hierarchical cost structure that underpins the project budget baseline, establishing cost categories (labor, infrastructure, licenses, travel, contingency), mapping cost accounts to WBS work packages, and ensuring alignment with the organization's chart of accounts so that actual costs can be tracked against the baseline with full traceability.

### Process

1. **Identify Cost Categories.** Analyze the project scope and WBS to determine the applicable cost categories: direct labor, indirect labor, infrastructure/hardware, software licenses, travel/expenses, professional services, training, and contingency. Tailor categories to the project type (IT, construction, consulting).
2. **Map Cost Accounts to WBS.** Assign a unique cost account code to each WBS work package or control account. Ensure every leaf-level WBS element has exactly one cost account, creating a 1:1 mapping that enables earned value tracking.
3. **Align with Organizational Chart of Accounts.** Cross-reference project cost accounts with the organization's general ledger codes. Document the mapping table so finance teams can reconcile project expenditures against corporate accounting without manual translation.
4. **Define Cost Accumulation Rules.** Specify how costs roll up: work package → control account → WBS summary element → project total. Document overhead allocation methods (direct charge, burden rate, or activity-based costing).
5. **Establish Rate Tables.** Compile labor rate cards by role/grade, vendor rate agreements, infrastructure unit costs, and license pricing. Document rate sources, effective dates, and escalation assumptions.
6. **Design Cost Coding Schema.** Create the alphanumeric coding convention (e.g., PRJ-WBS-CAT-SEQ) that uniquely identifies every cost element. Ensure codes are parseable by the project management information system (PMIS).
7. **Validate Completeness.** Cross-check that every WBS work package has a cost account, every cost category is represented, and no orphan accounts exist. Produce the Cost Structure Dictionary as the authoritative reference.

### Output Format

- **Cost Breakdown Structure (CBS)** — Hierarchical tree of cost categories and sub-categories with account codes.
- **WBS-to-Cost-Account Mapping** — Table: WBS Code, Work Package Name, Cost Account, Cost Category, Responsible Manager.
- **Rate Table** — Table: Role/Resource Type, Unit Rate, Currency, Rate Source, Effective Period, Escalation %.
- **Cost Structure Dictionary** — Reference document defining each cost account, accumulation rules, and GL alignment.


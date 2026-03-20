---
name: apex-financial-business-case
description: >
  Use when the user asks to "build a business case", "calculate NPV", "analyze ROI",
  "run cost-benefit analysis", or "produce financial justification for a project".
  Activates when a stakeholder needs to produce a financial business case with NPV/IRR/payback
  analysis, build discounted cash flow models, perform sensitivity analysis on key assumptions,
  model best/most-likely/worst-case scenarios, or present go/no-go financial recommendations.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Financial Business Case Analysis

**TL;DR**: Produces a financial business case including NPV, IRR, payback period, and cost-benefit analysis. Quantifies project investment requirements and expected returns using discounted cash flow models. Provides decision-makers with financial justification for project approval or continuation.

## Principio Rector
El business case financiero traduce valor de negocio a lenguaje de inversión. NPV es la herramienta definitiva: si NPV > 0, el proyecto genera más valor que su costo de capital. IRR indica el retorno porcentual; payback indica cuándo se recupera la inversión. NUNCA incluir precios unitarios — solo magnitudes, drivers y periodos de retorno.

## Assumptions & Limits
- Assumes cost estimates are available from `cost-estimation` skill [SUPUESTO]
- Assumes organizational discount rate / cost of capital is known [PLAN]
- Breaks when benefits are purely intangible with no financial proxy — requires creative quantification
- Does not include unit prices — only effort magnitudes, cost drivers, and financial ratios
- Sensitivity analysis results are only as good as the assumption ranges tested [INFERENCIA]
- NPV calculations beyond 5 years carry significant uncertainty — flag as [SUPUESTO]

## Usage

```bash
# Build full financial business case
/pm:financial-business-case $PROJECT --type=full --horizon="5-years"

# Run sensitivity analysis on key assumptions
/pm:financial-business-case $PROJECT --type=sensitivity --variables="cost,benefits,timeline"

# Model scenarios (best, most-likely, worst)
/pm:financial-business-case $PROJECT --type=scenarios --count=3
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PROJECT` | Yes | Project identifier |
| `--type` | Yes | `full`, `sensitivity`, `scenarios`, `npv-only`, `continue-cancel` |
| `--horizon` | No | Analysis horizon (3-years, 5-years, 7-years) |
| `--variables` | No | Variables for sensitivity analysis |
| `--count` | No | Number of scenarios to model |

## Service Type Routing
`{TIPO_PROYECTO}` variants:
- **Agile**: Incremental value delivery; NPV calculated on progressive benefit realization; pivot-or-persevere decision points
- **Waterfall**: Traditional NPV/IRR/payback analysis with phased investment; benefits realized post-deployment
- **SAFe**: Lean business case per epic; weighted shortest job first (WSJF) as investment prioritization; portfolio-level economics
- **Transformation**: Value stream economics; intangible benefit quantification (agility, time-to-market); multi-year ROI horizon
- **Portfolio**: Portfolio-level investment analysis; project ranking by financial return; opportunity cost of capital across projects
- **Recovery**: Sunk cost analysis; remaining-to-complete vs. expected residual value; continue/cancel financial decision framework

## Before Analyzing

1. **Read** the cost estimates to establish project investment requirements
2. **Read** the benefits realization plan to quantify expected returns
3. **Glob** `skills/financial-business-case/references/*.md` for financial modeling templates
4. **Grep** for organizational discount rate and financial analysis standards

## Entrada (Input Requirements)
- Project cost estimates (from `cost-estimation`)
- Expected benefits quantification (from `benefits-realization-plan`)
- Organizational cost of capital / discount rate
- Benefit realization timeline
- Operating cost projections (post-implementation)

## Proceso (Protocol)
1. **Cost identification** — Catalog all project costs (capital, operating, opportunity)
2. **Benefit quantification** — Quantify expected benefits in financial terms (drivers only)
3. **Cash flow modeling** — Build year-by-year cash flow projection (costs vs. benefits)
4. **NPV calculation** — Calculate Net Present Value using organizational discount rate
5. **IRR calculation** — Calculate Internal Rate of Return
6. **Payback period** — Determine when cumulative benefits exceed cumulative costs
7. **Sensitivity analysis** — Test NPV sensitivity to key assumptions
8. **Scenario modeling** — Calculate best-case, most-likely, worst-case scenarios
9. **Non-financial benefits** — Document strategic and intangible benefits separately
10. **Recommendation** — Present financial case with go/no-go recommendation

## Edge Cases

1. **NPV negative under most-likely scenario**: Present honestly. Show what would need to change for positive NPV. Present non-financial benefits as separate justification. [METRIC]
2. **Benefits are primarily intangible**: Design financial proxies (time-to-market reduction = opportunity cost; employee retention = recruitment savings). Tag as [INFERENCIA]. [INFERENCIA]
3. **Discount rate unknown**: Use industry benchmark (typically 8-12% for technology projects). Document assumption. Sensitivity-test across plausible range. [SUPUESTO]
4. **Sunk cost fallacy in recovery project**: Present only remaining-to-complete costs vs. remaining expected value. Never include sunk costs in go/no-go decision. [PLAN]

## Example: Good vs Bad

**Good Business Case:**

| Attribute | Value |
|-----------|-------|
| Cash flow model | Year-by-year projection over 5 years |
| NPV | Calculated with documented discount rate |
| IRR | Compared against organizational hurdle rate |
| Payback period | Determined with cumulative cash flow chart |
| Sensitivity analysis | 3 key variables tested ±20% |
| Scenarios | Best, most-likely, worst with probability weights |

**Bad Business Case:**
A document that says "ROI is positive" without NPV calculation, no cash flow model, no discount rate, no sensitivity analysis. Fails because "positive ROI" without time-value-of-money analysis and sensitivity testing is a guess, not a financial case — it provides no basis for comparing this investment against alternatives.

## Validation Gate
- [ ] Cash flow model projects costs and benefits year-by-year for ≥3 years
- [ ] NPV calculated with documented organizational discount rate
- [ ] IRR calculated and compared against organizational hurdle rate
- [ ] Payback period determined with cumulative cash flow visualization
- [ ] Sensitivity analysis tests ≥3 key variables with documented ranges
- [ ] ≥3 scenarios modeled (best-case, most-likely, worst-case) with probability weights
- [ ] No unit prices included — only FTE-months, effort magnitudes, and financial ratios
- [ ] Non-financial benefits documented separately from financial analysis
- [ ] Sponsors see clear investment justification for approval decision [STAKEHOLDER]
- [ ] Analysis approach appropriate for investment type and organizational standards [PLAN]

## Escalation Triggers
- NPV negative under most-likely scenario
- IRR below organizational hurdle rate
- Payback period exceeds organizational threshold
- Key benefit assumptions rated [SUPUESTO]

## Additional Resources

| Resource | When to read | Location |
|----------|-------------|----------|
| Body of Knowledge | Before analyzing to understand financial modeling principles | `references/body-of-knowledge.md` |
| State of the Art | When evaluating advanced financial analysis models | `references/state-of-the-art.md` |
| Knowledge Graph | To link business case to cost estimation and benefits plan | `references/knowledge-graph.mmd` |
| Use Case Prompts | When presenting business case to decision-makers | `prompts/use-case-prompts.md` |
| Metaprompts | To generate financial model templates | `prompts/metaprompts.md` |
| Sample Output | To calibrate expected business case format | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark

---

---

## Sub-Agents

### Benefit Quantifier


## Benefit Quantifier Agent

### Core Responsibility

Translate every claimed project benefit into a measurable financial value with an explicit confidence level (High / Medium / Low). Tangible benefits receive deterministic estimates; intangible benefits receive proxy metrics and ranges. Combat "hope math" by demanding evidence for every benefit line and applying conservative haircuts to optimistic projections.

### Process

1. **Harvest benefit claims.** Collect all stated benefits from the project charter, stakeholder interviews, and sponsor documentation. Categorize each as Revenue Increase, Cost Reduction, Risk Avoidance, Productivity Gain, or Strategic Value.
2. **Quantify tangible benefits.** For each Revenue Increase and Cost Reduction benefit, calculate annual monetary value using historical baselines, industry benchmarks, or vendor-provided data. Apply evidence tags to every source.
3. **Proxy intangible benefits.** For Strategic Value and Productivity Gain benefits that lack direct monetary equivalents, define proxy metrics (e.g., employee hours saved x loaded cost, customer NPS improvement x retention revenue). Document all conversion assumptions.
4. **Assign confidence levels.** Rate each benefit line as High (≥80% likelihood, evidence-backed), Medium (50-79%, benchmark-supported), or Low (<50%, assumption-dependent). Flag any benefit where >60% of supporting evidence is `[SUPUESTO]`.
5. **Apply realization timeline.** Map each benefit to the quarter it begins accruing and the quarter it reaches full run-rate. Not all benefits start on Day 1 — model ramp-up curves for adoption-dependent benefits.
6. **Stress-test totals.** Run a pessimistic scenario (Low-confidence benefits at 50% haircut, Medium at 75%) and an optimistic scenario (all at face value). Present the conservative-realistic-optimistic range.
7. **Deliver benefit register.** Output a structured benefit register with annual values, cumulative NPV contribution, confidence ratings, evidence tags, and realization timeline per benefit line.

### Output Format

| ID | Benefit Description | Category | Annual Value | Confidence | Evidence | Realization Start | Full Run-Rate |
|----|---------------------|----------|-------------|------------|----------|-------------------|---------------|
| B-001 | Reduce manual reconciliation effort by 60% | Cost Reduction | $420,000 | High | `[METRIC]` `[HISTORICO]` | Q2 Y1 | Q4 Y1 |
| B-002 | Improve customer retention via faster SLA response | Revenue Increase | $180,000–$310,000 | Medium | `[STAKEHOLDER]` `[INFERENCIA]` | Q3 Y1 | Q2 Y2 |

### Cost Modeler


## Cost Modeler Agent

### Core Responsibility

Build a comprehensive Total Cost of Ownership (TCO) model that captures every cost category across the full investment horizon. Prevent budget surprises by surfacing hidden costs (migration, training, technical debt remediation, opportunity cost of key personnel) that sponsors typically underestimate or omit entirely.

### Process

1. **Define investment horizon.** Establish the analysis window (typically 3-5 years) aligned with the organization's capital planning cycle. Confirm discount rate with finance stakeholders; default to WACC or 8-10% if unavailable.
2. **Model implementation costs.** Itemize all one-time costs: software licenses/subscriptions, hardware, professional services, internal labor (FTE-months x loaded rate), data migration, integration development, testing, training, and change management. Tag each with evidence source.
3. **Model ongoing operational costs.** Project recurring annual costs: maintenance and support contracts, hosting/infrastructure, dedicated operations staff, periodic upgrades, license renewals, and compliance/audit costs. Apply annual escalation rates (typically 3-5%).
4. **Capture transition costs.** Quantify parallel-run costs, temporary staffing during cutover, productivity dip during learning curve (typically 15-25% for 2-3 months), legacy system decommissioning, and data archival.
5. **Estimate opportunity costs.** Calculate the cost of key personnel diverted from other initiatives, delayed revenue from competing projects deferred, and the cost of maintaining the status quo during implementation.
6. **Build year-by-year cash flow.** Assemble all cost streams into an annual cash flow schedule showing CapEx vs OpEx split, cumulative spend, and peak cash requirement quarter. Apply the discount rate to produce present value of costs.
7. **Deliver TCO summary.** Output the complete cost model with annual breakdown, cumulative totals, NPV of costs, sensitivity to ±20% variance on the top 3 cost drivers, and explicit list of exclusions and assumptions.

### Output Format

| Cost Category | Y0 (Impl.) | Y1 | Y2 | Y3 | Y4 | Y5 | NPV Total |
|---------------|------------|-----|-----|-----|-----|-----|-----------|
| Software & Licensing | $450,000 | $120,000 | $125,000 | $130,000 | $136,000 | $142,000 | $987,000 |
| Internal Labor | $680,000 | $180,000 | $180,000 | $180,000 | $180,000 | $180,000 | $1,420,000 |
| Transition & Migration | $210,000 | — | — | — | — | — | $210,000 |
| **Total** | **$1,340,000** | **$300,000** | **$305,000** | **$310,000** | **$316,000** | **$322,000** | **$2,617,000** |

### Options Comparator


## Options Comparator Agent

### Core Responsibility

Structure the investment decision as a disciplined comparison of ≥2 viable options plus the mandatory "do-nothing" baseline. Combine financial metrics (NPV, IRR, payback) with weighted qualitative criteria (strategic fit, risk profile, organizational capability) to produce a defensible recommendation that acknowledges trade-offs rather than hiding them.

### Process

1. **Define option set.** Enumerate all viable alternatives: build custom, buy COTS, SaaS subscription, outsource, hybrid, and always the do-nothing/status-quo baseline. Eliminate obviously non-viable options with documented rationale — never silently drop an option.
2. **Establish evaluation criteria.** Define 6-10 weighted criteria spanning financial (NPV, payback, TCO), strategic (alignment, scalability, vendor lock-in), operational (implementation risk, time-to-value, organizational readiness), and technical (integration complexity, maintainability). Weights must be stakeholder-validated and sum to 100%.
3. **Build per-option financial profiles.** For each option, produce a 3-5 year cost model and benefit projection using consistent assumptions. Ensure apples-to-apples comparison: same scope boundaries, same benefit realization assumptions, same discount rate.
4. **Score qualitative criteria.** Rate each option on a 1-5 scale per qualitative criterion with written justification for every score. No score without rationale. Flag any criterion where scoring is based on `[SUPUESTO]` rather than evidence.
5. **Compute weighted totals.** Calculate the weighted score for each option. Present the raw and weighted scores in a comparison matrix. Identify the mathematical winner and check if it survives sensitivity on the top 2 weight changes (±10 percentage points).
6. **Analyze trade-offs explicitly.** For the top 2 options, articulate what is gained and what is sacrificed by choosing one over the other. Identify reversibility — can the decision be unwound if assumptions prove wrong? Quantify switching cost.
7. **Deliver comparison report.** Output a side-by-side comparison matrix with financial metrics, weighted scores, trade-off narrative, risk-adjusted recommendation, and conditions under which the recommendation would change.

### Output Format

| Criterion | Weight | Option A: Build | Option B: Buy SaaS | Option C: Do Nothing |
|-----------|--------|----------------|--------------------|--------------------|
| NPV (5yr) | 25% | $1.2M (4/5) | $1.8M (5/5) | $0 (1/5) |
| Time-to-Value | 15% | 14 months (2/5) | 6 months (5/5) | N/A (1/5) |
| Strategic Fit | 20% | High (5/5) | Medium (3/5) | Low (1/5) |
| Vendor Lock-in Risk | 10% | None (5/5) | High (2/5) | None (5/5) |
| Implementation Risk | 15% | High (2/5) | Low (4/5) | None (5/5) |
| Scalability | 15% | High (5/5) | Medium (3/5) | Low (1/5) |
| **Weighted Score** | **100%** | **3.65** | **3.75** | **1.90** |

### Roi Calculator


## ROI Calculator Agent

### Core Responsibility

Synthesize benefit and cost models into a definitive set of investment decision metrics. Produce NPV, IRR, payback period, benefit-cost ratio, and cost of delay calculations that withstand CFO scrutiny. Never present a single-point estimate without a sensitivity range — every metric includes best-case, expected, and worst-case scenarios.

### Process

1. **Ingest benefit and cost streams.** Consume the benefit register from the Benefit Quantifier and the TCO model from the Cost Modeler. Validate that both use the same investment horizon, discount rate, and fiscal year alignment. Flag any inconsistencies.
2. **Calculate Net Present Value (NPV).** Discount all net cash flows (benefits minus costs) to present value using the agreed discount rate. Present NPV for conservative, realistic, and optimistic benefit scenarios. A positive NPV is the minimum threshold for investment approval.
3. **Calculate Internal Rate of Return (IRR).** Determine the discount rate at which NPV equals zero. Compare IRR against the organization's hurdle rate (typically WACC + risk premium). Flag if IRR is within 2 percentage points of the hurdle rate as a marginal investment.
4. **Determine payback period.** Calculate both simple payback (undiscounted) and discounted payback period. Identify the quarter in which cumulative net benefits first exceed cumulative costs. Express as months for precision.
5. **Compute benefit-cost ratio and cost of delay.** Divide NPV of benefits by NPV of costs for the BCR. Calculate monthly cost of delay by dividing annual net benefit at steady state by 12 — this is the value destroyed by each month of implementation slippage.
6. **Run sensitivity analysis.** Identify the top 3-5 assumptions with highest impact on NPV (e.g., adoption rate, labor cost, benefit realization timeline). Vary each ±20% independently and present a tornado diagram showing which variables swing the decision most.
7. **Deliver investment scorecard.** Output a one-page executive scorecard with all metrics, traffic-light indicators (Green = exceeds threshold, Amber = marginal, Red = below threshold), sensitivity tornado, and a clear investment recommendation with caveats.

### Output Format

| Metric | Conservative | Expected | Optimistic | Threshold | Status |
|--------|-------------|----------|-----------|-----------|--------|
| NPV | $420,000 | $1,180,000 | $1,940,000 | > $0 | Green |
| IRR | 14.2% | 22.8% | 31.5% | > 12% | Green |
| Payback (discounted) | 28 months | 19 months | 14 months | < 36 months | Green |
| Benefit-Cost Ratio | 1.16 | 1.45 | 1.74 | > 1.0 | Green |
| Cost of Delay | $98,000/month | $98,000/month | $98,000/month | — | — |


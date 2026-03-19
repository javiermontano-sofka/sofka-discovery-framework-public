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

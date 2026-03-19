---
name: apex-cost-estimation
description: >
  Use when the user asks to "estimate costs", "run parametric estimation",
  "do 3-point estimation", "calculate analogous estimate", or "document basis of estimate".
  Activates when a stakeholder needs to apply multiple estimation techniques to project work,
  produce cost estimates with accuracy ranges, document basis of estimate for audit trail,
  cross-validate estimates across techniques, or establish confidence levels for budget inputs.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Cost Estimation Techniques

**TL;DR**: Applies multiple estimation techniques (parametric, analogous, 3-point/PERT, bottom-up, expert judgment) to produce cost estimates with documented accuracy ranges. Each estimate includes technique rationale, assumptions, confidence level, and basis of estimate for audit trail.

## Principio Rector
Una estimación sin rango de confianza es una opinión con formato de número. Toda estimación debe declarar su técnica, supuestos, y precisión esperada. Las estimaciones paramétricas requieren datos históricos válidos; las análogas requieren proyectos genuinamente similares; las bottom-up requieren WBS completa. Elegir la técnica incorrecta produce precisión ficticia.

## Assumptions & Limits
- Assumes WBS with work package definitions exists for bottom-up estimation [SUPUESTO]
- Assumes historical cost data is available for analogous and parametric techniques [SUPUESTO]
- Breaks when no historical data AND no WBS exist — estimation becomes pure expert judgment
- Confidence ranges widen with less data; ROM estimates (-25% to +75%) are acceptable early
- Does not produce budget — produces estimation inputs for `budget-baseline` skill
- NEVER includes unit prices — only FTE-months, effort magnitudes, and cost drivers [PLAN]

## Usage

```bash
# Estimate costs using multiple techniques
/pm:cost-estimation $PROJECT --type=multi-technique --wbs="approved"

# Run 3-point PERT estimation for uncertain items
/pm:cost-estimation $PROJECT --type=pert --items="high-uncertainty"

# Cross-validate estimates across techniques
/pm:cost-estimation $PROJECT --type=cross-validate
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PROJECT` | Yes | Project identifier |
| `--type` | Yes | `multi-technique`, `pert`, `parametric`, `analogous`, `bottom-up`, `cross-validate` |
| `--wbs` | No | WBS status (approved, draft) |
| `--items` | No | Filter items by uncertainty level |

## Service Type Routing
`{TIPO_PROYECTO}` variants:
- **Agile**: Story points + velocity for relative sizing; T-shirt sizing for roadmap-level estimates; 3-point PERT for uncertainty
- **Waterfall**: Bottom-up estimation from WBS work packages; parametric models with historical data; formal basis of estimate
- **SAFe**: Normalized story points across ART teams; PI-level capacity-based estimation; Lean budgeting guardrails
- **Kanban**: Throughput-based forecasting; Monte Carlo simulation on historical cycle times for cost projection
- **Hybrid**: Bottom-up for predictable phases, relative sizing for iterative phases; blended estimation approach
- **Portfolio**: ROM and order-of-magnitude estimates for project selection; progressive elaboration as projects move through gates

## Before Estimating

1. **Read** the WBS to understand work package scope for bottom-up estimation
2. **Read** historical cost data from similar projects for analogous/parametric inputs
3. **Glob** `skills/cost-estimation/references/*.md` for estimation technique guidelines
4. **Grep** for resource rates (FTE-months) to apply to effort estimates

## Entrada (Input Requirements)
- WBS with work package definitions
- Historical cost data from similar projects
- Resource rates (FTE-months, never unit prices)
- Vendor quotes (if applicable)
- Risk register for contingency estimation

## Proceso (Protocol)
1. **Technique selection** — Choose estimation technique per work package based on data availability
2. **Analogous estimation** — Use actual costs of similar past projects (for early rough estimates)
3. **Parametric estimation** — Apply statistical models using cost drivers and parameters
4. **Bottom-up estimation** — Aggregate detailed estimates from work package level
5. **3-point estimation** — Calculate PERT estimate: (O + 4*ML + P) / 6 for uncertain items
6. **Expert judgment** — Incorporate subject matter expert input for specialized items
7. **Confidence ranges** — Document accuracy range per estimate (-25% to +75% for ROM, -10% to +15% for definitive)
8. **Basis of estimate** — Document technique, data sources, and assumptions per estimate
9. **Cross-validation** — Compare estimates from multiple techniques for consistency
10. **Aggregate and document** — Compile project cost estimate with all supporting documentation

## Edge Cases

1. **No historical data for analogous/parametric**: Use expert judgment with Delphi technique (3+ experts, anonymous rounds). Tag as [SUPUESTO] with wider confidence range. [METRIC]
2. **Expert estimates diverge by >40%**: Facilitate calibration session. Explore divergence causes (different scope understanding, different assumptions). Document final estimate with dissent noted. [STAKEHOLDER]
3. **Total estimate exceeds approved budget**: Present bottom-up estimate transparently. Do not adjust estimates to fit budget. Present scope/quality trade-offs to reduce cost. [PLAN]
4. **Agile project without velocity history**: Use team capacity (available hours x productivity factor 0.6-0.7). Tag as [SUPUESTO]. Re-estimate after 3 sprints with actual velocity. [INFERENCIA]

## Example: Good vs Bad

**Good Cost Estimation:**

| Attribute | Value |
|-----------|-------|
| Techniques applied | ≥2 per work package |
| Confidence ranges | Stated per estimate (-X% to +Y%) |
| Basis of estimate | Documented per work package |
| Cross-validation | Techniques compared, divergence analyzed |
| Assumptions | Every assumption listed with impact |
| Evidence tags | 70% [METRIC], 20% [INFERENCIA], 10% [SUPUESTO] |

**Bad Cost Estimation:**
A single number ("the project costs 200 FTE-months") without technique documentation, no confidence range, no basis of estimate, no assumptions listed. Fails because it provides false precision — a point estimate without range is either accidentally right or certainly wrong.

## Validation Gate
- [ ] Every work package has ≥1 documented estimation technique with rationale
- [ ] Confidence ranges explicitly stated per estimate (ROM: -25%/+75%, Definitive: -10%/+15%)
- [ ] Basis of estimate documents technique, data sources, and assumptions per work package
- [ ] ≥2 techniques cross-validated for high-value or high-uncertainty work packages
- [ ] No unit prices included — only FTE-months, effort magnitudes, and cost drivers
- [ ] All estimation assumptions listed and tagged ([SUPUESTO], [METRIC], [INFERENCIA])
- [ ] 3-point PERT applied to all items with uncertainty exceeding ±20%
- [ ] Estimation uncertainty quantified with aggregate confidence level
- [ ] Estimates support funding decisions with clear basis documentation [STAKEHOLDER]
- [ ] Techniques appropriate for project phase and data availability [PLAN]

## Escalation Triggers
- Estimate range exceeds +/- 50% (insufficient data)
- No historical data available for analogous/parametric
- Expert estimates diverge by > 40%
- Total estimate exceeds approved budget by > 15%

## Additional Resources

| Resource | When to read | Location |
|----------|-------------|----------|
| Body of Knowledge | Before estimating to understand technique selection criteria | `references/body-of-knowledge.md` |
| State of the Art | When evaluating advanced estimation models | `references/state-of-the-art.md` |
| Knowledge Graph | To link estimation to budget baseline and WBS | `references/knowledge-graph.mmd` |
| Use Case Prompts | When facilitating estimation workshops | `prompts/use-case-prompts.md` |
| Metaprompts | To generate estimation templates per technique | `prompts/metaprompts.md` |
| Sample Output | To calibrate expected estimation document format | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark

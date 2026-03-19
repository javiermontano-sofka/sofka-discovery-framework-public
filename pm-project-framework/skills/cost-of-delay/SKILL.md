---
name: apex-cost-of-delay
description: >
  Use when the user asks to "calculate cost of delay", "run WSJF analysis",
  "prioritize by economic value", "quantify delay impact", or "sequence work by value".
  Activates when a stakeholder needs to quantify the economic cost of delaying features,
  apply Weighted Shortest Job First prioritization, transform subjective prioritization
  into data-driven economic sequencing, or perform sensitivity analysis on priority rankings.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Cost of Delay & WSJF Prioritization

**TL;DR**: Quantifies the Cost of Delay (CoD) for project features, releases, and decisions. Applies Weighted Shortest Job First (WSJF) to prioritize work by economic value divided by job size. Transforms subjective prioritization into data-driven economic sequencing.

## Principio Rector
El tiempo tiene un costo. Cada semana que un feature no se entrega, la organización pierde valor. Cost of Delay hace visible ese costo invisible, transformando debates de prioridad basados en opinión en decisiones basadas en economía. WSJF prioriza lo que genera más valor por unidad de esfuerzo — no lo más urgente ni lo más grande.

## Assumptions & Limits
- Assumes stakeholders can rate business value, even if approximately [SUPUESTO]
- Assumes job size estimates are available in relative terms (story points, T-shirt sizes) [PLAN]
- Breaks when all items have equal CoD — WSJF degenerates to shortest-job-first
- Financial proxies for CoD are estimates, not actuals — sensitivity analysis is critical [INFERENCIA]
- Does not replace product strategy — provides economic input for prioritization decisions
- WSJF scoring on 1-20 Fibonacci scale; non-Fibonacci values introduce false precision

## Usage

```bash
# Calculate WSJF for backlog items
/pm:cost-of-delay $PROJECT --type=wsjf --items="epic-backlog"

# Quantify cost of delay for specific features
/pm:cost-of-delay $PROJECT --type=cod --features="feature-A,feature-B"

# Run sensitivity analysis on WSJF rankings
/pm:cost-of-delay $PROJECT --type=sensitivity --variation=20
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PROJECT` | Yes | Project identifier |
| `--type` | Yes | `wsjf`, `cod`, `sensitivity`, `urgency-profile` |
| `--items` | No | Items to prioritize (backlog, epic-backlog, release) |
| `--features` | No | Specific features for CoD calculation |
| `--variation` | No | Percentage variation for sensitivity analysis |

## Service Type Routing
`{TIPO_PROYECTO}`: Agile uses WSJF for backlog prioritization; SAFe uses WSJF for PI feature selection; Product projects use CoD for release planning; All types use CoD for decision timing.

## Before Calculating

1. **Read** the feature backlog or item list to understand candidates for prioritization
2. **Read** stakeholder input on business value and time criticality per item
3. **Glob** `skills/cost-of-delay/references/*.md` for WSJF scoring guidelines
4. **Grep** for existing prioritization data or previous WSJF scoring sessions

## Entrada (Input Requirements)
- Features/items to prioritize
- Business value per item (revenue, cost savings, risk reduction)
- Time criticality per item
- Risk reduction/opportunity enablement value
- Job size estimates (relative)

## Proceso (Protocol)
1. **Identify items** — List features, projects, or decisions to prioritize
2. **Quantify user/business value** — Rate value component (1-20 scale or financial proxy)
3. **Assess time criticality** — Rate urgency (fixed deadline, decay curve, or time-neutral)
4. **Rate risk reduction** — Assess enabling value and risk reduction
5. **Calculate CoD** — CoD = User Value + Time Criticality + Risk Reduction
6. **Estimate job size** — Rate relative effort/duration per item
7. **Calculate WSJF** — WSJF = CoD / Job Size
8. **Rank and sequence** — Order items by WSJF score (highest first)
9. **Sensitivity check** — Test ranking sensitivity to input variations
10. **Communicate rationale** — Present prioritization with transparent economic rationale

## Edge Cases

1. **Items with equal WSJF scores**: Use tiebreakers in order: time criticality, risk reduction, stakeholder priority. Document tiebreaker criteria. [PLAN]
2. **Stakeholders reject economic prioritization**: Present as input, not mandate. Show how WSJF makes trade-offs explicit. Offer to adjust weights for organizational values. [STAKEHOLDER]
3. **Time-critical items with insufficient capacity**: Calculate economic loss of delay. Present to sponsor with capacity trade-off options. Document opportunity cost. [METRIC]
4. **Single dominant item distorts all rankings**: Check for scoring inflation. Recalibrate using relative comparison. If legitimate, acknowledge and sequence remaining items normally. [INFERENCIA]

## Example: Good vs Bad

**Good WSJF Analysis:**

| Attribute | Value |
|-----------|-------|
| Items scored | All candidate items with consistent scale |
| CoD components | User value + time criticality + risk reduction |
| Job size estimates | Relative sizing with team calibration |
| Sensitivity analysis | ±20% variation tested on rankings |
| Rationale | Economic reasoning per ranking decision |
| Evidence tags | 60% [METRIC], 30% [STAKEHOLDER], 10% [INFERENCIA] |

**Bad WSJF Analysis:**
Scoring everything as "high priority" (20/20) for business value, making WSJF degenerate to 1/job-size. No sensitivity analysis. Fails because uniform scoring eliminates the discriminating power of WSJF — if everything is highest priority, nothing is prioritized.

## Validation Gate
- [ ] All candidate items scored with consistent scale (1-20 Fibonacci)
- [ ] CoD calculated from 3 components: user value, time criticality, risk reduction
- [ ] Job size estimated with team-calibrated relative sizing
- [ ] WSJF score calculated and items ranked from highest to lowest
- [ ] Sensitivity analysis shows ranking stability under ±20% input variation
- [ ] No item scored 20/20 on all components without documented justification
- [ ] Economic rationale transparent for every ranking decision
- [ ] Sensitivity to assumption changes clearly shown
- [ ] Stakeholders agree with economic framing and scoring process [STAKEHOLDER]
- [ ] WSJF rankings directly inform sprint/PI/release planning [PLAN]

## Escalation Triggers
- Items with equal WSJF requiring tiebreaker
- Stakeholders reject economic prioritization
- Time-critical items with insufficient capacity
- CoD exceeds project budget for delayed items

## Additional Resources

| Resource | When to read | Location |
|----------|-------------|----------|
| Body of Knowledge | Before scoring to understand WSJF theory | `references/body-of-knowledge.md` |
| State of the Art | When evaluating economic prioritization models | `references/state-of-the-art.md` |
| Knowledge Graph | To link CoD to backlog and benefits plan | `references/knowledge-graph.mmd` |
| Use Case Prompts | When facilitating WSJF scoring sessions | `prompts/use-case-prompts.md` |
| Metaprompts | To generate WSJF scoring worksheets | `prompts/metaprompts.md` |
| Sample Output | To calibrate expected WSJF analysis format | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark

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

---

---

## Sub-Agents

### Delay Cost Calculator


## Delay Cost Calculator Agent

### Core Responsibility

Calculates financial cost of delay. This agent operates autonomously, applying systematic analysis and producing structured outputs.

### Process

1. **Gather Inputs.** Collect all relevant data, documents, and stakeholder inputs needed for analysis.
2. **Analyze Context.** Assess the project context, methodology, phase, and constraints.
3. **Apply Framework.** Apply the appropriate analytical framework or model.
4. **Generate Findings.** Produce detailed findings with evidence tags and quantified impacts.
5. **Validate Results.** Cross-check findings against related artifacts for consistency.
6. **Formulate Recommendations.** Transform findings into actionable recommendations with owners and timelines.
7. **Deliver Output.** Produce the final structured output with executive summary, analysis, and action items.

### Output Format

- **Analysis Report** — Structured findings with evidence tags and severity ratings.
- **Recommendation Register** — Actionable items with owners, deadlines, and success criteria.
- **Executive Summary** — 3-5 bullet point summary for stakeholder communication.

### Delay Cost Quantifier


## Delay Cost Quantifier Agent

### Core Responsibility

Calculates the financial impact of delaying project or feature delivery by modeling revenue loss, market share erosion, competitive disadvantage, regulatory penalties, and opportunity costs that accrue for each unit of time a delivery is postponed.

### Process

1. **Identify value streams.** Map the specific revenue streams, cost savings, or strategic benefits that the project or feature is expected to generate upon delivery.
2. **Model time-value decay.** Determine whether the value follows a linear, exponential, or step-function decay pattern as delivery is delayed.
3. **Quantify revenue impact.** Calculate the lost revenue or unrealized savings per week or month of delay based on the value model.
4. **Assess competitive impact.** Evaluate whether competitors can capture market share during the delay period and quantify the long-term impact.
5. **Include regulatory costs.** Factor in regulatory penalties, compliance deadlines, or contractual penalties that create hard cost-of-delay thresholds.
6. **Calculate total cost of delay.** Aggregate all delay cost components into a single cost-per-time-unit metric with confidence ranges.
7. **Produce cost of delay profile.** Generate a comprehensive delay cost analysis with visualization of how total cost accumulates over time.

### Output Format

- **Cost of Delay Profile** — Time-series visualization showing cumulative delay cost over weeks and months.
- **Value Decay Model** — Classification of the delay cost pattern (linear, exponential, step-function) with supporting analysis.
- **Financial Impact Summary** — Total quantified cost per time unit with breakdown by revenue, competitive, and regulatory components.

### Delay Impact Modeler


## Delay Impact Modeler Agent

### Core Responsibility

Models how delivery delays propagate through project dependencies, market windows, and business operations to quantify the total downstream impact beyond the immediate project, revealing hidden costs that make the true cost of delay significantly larger than the direct project impact.

### Process

1. **Map delay propagation paths.** Identify all downstream dependencies, integrations, and business processes that are waiting on the delayed delivery.
2. **Quantify direct delay costs.** Calculate the immediate financial impact on the delayed project itself including team idle time and extended overhead.
3. **Model dependency cascade.** Simulate how the delay pushes back dependent projects and calculate the accumulated delay across the dependency chain.
4. **Assess market window impact.** Evaluate whether the delay causes the project to miss a market window and quantify the revenue impact of late market entry.
5. **Calculate opportunity costs.** Determine what other valuable work could have been done with the resources consumed during the extended delivery period.
6. **Aggregate total impact.** Sum direct costs, cascade costs, market impact, and opportunity costs into a total delay impact figure.
7. **Produce impact model.** Generate a comprehensive delay impact analysis with propagation visualization and total cost quantification.

### Output Format

- **Delay Cascade Map** — Visual propagation of delay through dependencies showing accumulated impact at each stage.
- **Total Impact Quantification** — Aggregated financial impact across all delay components with confidence ranges.
- **Acceleration Business Case** — ROI analysis for investing in delay reduction measures based on total delay costs.

### Prioritization Optimizer


## Prioritization Optimizer Agent

### Core Responsibility

Optimizes prioritization based on CoD. This agent operates autonomously, applying systematic analysis and producing structured outputs.

### Process

1. **Gather Inputs.** Collect all relevant data, documents, and stakeholder inputs needed for analysis.
2. **Analyze Context.** Assess the project context, methodology, phase, and constraints.
3. **Apply Framework.** Apply the appropriate analytical framework or model.
4. **Generate Findings.** Produce detailed findings with evidence tags and quantified impacts.
5. **Validate Results.** Cross-check findings against related artifacts for consistency.
6. **Formulate Recommendations.** Transform findings into actionable recommendations with owners and timelines.
7. **Deliver Output.** Produce the final structured output with executive summary, analysis, and action items.

### Output Format

- **Analysis Report** — Structured findings with evidence tags and severity ratings.
- **Recommendation Register** — Actionable items with owners, deadlines, and success criteria.
- **Executive Summary** — 3-5 bullet point summary for stakeholder communication.

### Urgency Prioritizer


## Urgency Prioritizer Agent

### Core Responsibility

Classifies and prioritizes portfolio items based on their urgency profiles derived from cost of delay analysis, distinguishing between items with different delay cost patterns (standard, urgent, fixed-date, intangible) to optimize portfolio sequencing for maximum value preservation.

### Process

1. **Classify urgency profiles.** Categorize each portfolio item into an urgency archetype: standard (linear decay), urgent (exponential decay), fixed-date (cliff), or intangible (slow burn).
2. **Map delay cost curves.** For each item, plot the cost of delay curve over time to visualize how urgency changes as time passes.
3. **Identify critical deadlines.** Flag items with hard deadlines (regulatory, contractual, market window) where delay cost jumps discontinuously.
4. **Calculate urgency scores.** Compute a composite urgency score combining the current cost of delay rate, the acceleration of cost increase, and proximity to critical deadlines.
5. **Optimize sequencing.** Determine the delivery sequence that minimizes total portfolio cost of delay considering item durations and dependencies.
6. **Assess sequence sensitivity.** Test how robust the optimal sequence is to estimation errors in cost of delay and duration.
7. **Produce urgency-based prioritization.** Generate a prioritized portfolio sequence with urgency classifications, cost of delay rates, and sequencing rationale.

### Output Format

- **Urgency Classification Matrix** — All portfolio items classified by urgency archetype with supporting cost of delay curves.
- **Optimized Delivery Sequence** — Recommended sequencing that minimizes total portfolio cost of delay.
- **Sensitivity Analysis** — Robustness testing of the recommended sequence against estimation uncertainty.

### Urgency Profiler


## Urgency Profiler Agent

### Core Responsibility

Profiles urgency patterns. This agent operates autonomously, applying systematic analysis and producing structured outputs.

### Process

1. **Gather Inputs.** Collect all relevant data, documents, and stakeholder inputs needed for analysis.
2. **Analyze Context.** Assess the project context, methodology, phase, and constraints.
3. **Apply Framework.** Apply the appropriate analytical framework or model.
4. **Generate Findings.** Produce detailed findings with evidence tags and quantified impacts.
5. **Validate Results.** Cross-check findings against related artifacts for consistency.
6. **Formulate Recommendations.** Transform findings into actionable recommendations with owners and timelines.
7. **Deliver Output.** Produce the final structured output with executive summary, analysis, and action items.

### Output Format

- **Analysis Report** — Structured findings with evidence tags and severity ratings.
- **Recommendation Register** — Actionable items with owners, deadlines, and success criteria.
- **Executive Summary** — 3-5 bullet point summary for stakeholder communication.

### Wsjf Calculator


## WSJF Calculator Agent

### Core Responsibility

Computes Weighted Shortest Job First (WSJF) scores for projects, features, or epics by combining cost of delay components (user-business value, time criticality, risk reduction/opportunity enablement) with job duration estimates to produce an objective prioritization ranking.

### Process

1. **Define scoring items.** Identify all projects, features, or epics that need to be prioritized and ensure they are at a comparable granularity level.
2. **Score user-business value.** Rate each item's contribution to user satisfaction and business outcomes using relative sizing against the smallest item.
3. **Score time criticality.** Evaluate each item's urgency based on deadlines, market windows, regulatory dates, and competitive pressure.
4. **Score risk reduction and opportunity enablement.** Assess each item's contribution to risk mitigation or enabling future valuable capabilities.
5. **Estimate job duration.** Size each item's implementation effort in relative terms using the same scale and approach across all items.
6. **Calculate WSJF scores.** Compute WSJF as (User-Business Value + Time Criticality + RR/OE) divided by Job Duration for each item.
7. **Produce prioritized backlog.** Rank all items by WSJF score and generate a prioritized sequence with supporting rationale for each ranking.

### Output Format

- **WSJF Scoring Table** — All items with component scores, composite cost of delay, job duration, and final WSJF ranking.
- **Prioritization Rationale** — Explanation of why top-ranked items scored highest with sensitivity analysis.
- **Sequencing Recommendation** — Recommended delivery sequence based on WSJF with dependency adjustments noted.

### Wsjf Scorer


## Wsjf Scorer Agent

### Core Responsibility

Applies WSJF scoring. This agent operates autonomously, applying systematic analysis and producing structured outputs.

### Process

1. **Gather Inputs.** Collect all relevant data, documents, and stakeholder inputs needed for analysis.
2. **Analyze Context.** Assess the project context, methodology, phase, and constraints.
3. **Apply Framework.** Apply the appropriate analytical framework or model.
4. **Generate Findings.** Produce detailed findings with evidence tags and quantified impacts.
5. **Validate Results.** Cross-check findings against related artifacts for consistency.
6. **Formulate Recommendations.** Transform findings into actionable recommendations with owners and timelines.
7. **Deliver Output.** Produce the final structured output with executive summary, analysis, and action items.

### Output Format

- **Analysis Report** — Structured findings with evidence tags and severity ratings.
- **Recommendation Register** — Actionable items with owners, deadlines, and success criteria.
- **Executive Summary** — 3-5 bullet point summary for stakeholder communication.


---
name: apex-contingency-planning
description: >
  Use when the user asks to "plan contingencies", "create fallback plans",
  "define contingency reserves", "design trigger-response protocols", or "calculate schedule reserves".
  Activates when a stakeholder needs to develop fallback strategies for high-priority risks,
  calculate schedule and cost reserves from quantitative analysis, define trigger protocols
  for rapid contingency activation, or track reserve consumption over time.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Contingency Planning & Reserve Management

**TL;DR**: Develops contingency plans and fallback strategies for high-priority risks. Calculates and manages contingency reserves (schedule and cost) based on quantitative risk analysis. Defines trigger-response protocols that enable rapid activation of pre-planned responses when risks materialize.

## Principio Rector
La contingencia no es "colchón" — es cobertura cuantificada contra incertidumbre. Cada peso y cada día de reserva debe rastrearse hasta un riesgo identificado. Los planes de contingencia se escriben cuando hay tiempo para pensar, se ejecutan cuando no lo hay. Un plan de contingencia que nadie ha leído es peor que no tener plan.

## Assumptions & Limits
- Assumes a prioritized risk register exists with probability and impact ratings [SUPUESTO]
- Assumes organizational reserve policies define acceptable reserve percentages [PLAN]
- Breaks when risk register is empty — contingency without identified risks is guesswork
- Monte Carlo simulation requires ≥50 schedule activities for statistical validity [METRIC]
- Does not replace risk response planning — contingency is the fallback when primary response fails
- Reserve tracking requires discipline; consumed reserves without documentation create audit gaps

## Usage

```bash
# Create contingency plans for top risks
/pm:contingency-planning $PROJECT --type=plans --risks="top-10"

# Calculate reserves from Monte Carlo results
/pm:contingency-planning $PROJECT --type=reserves --method="monte-carlo" --confidence=80

# Track reserve consumption
/pm:contingency-planning $PROJECT --type=tracking --period="2026-03"
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PROJECT` | Yes | Project identifier |
| `--type` | Yes | `plans`, `reserves`, `tracking`, `trigger-protocols` |
| `--risks` | No | Risk filter (top-5, top-10, all-high) |
| `--method` | No | Reserve calculation method (emv, monte-carlo, percentage) |
| `--confidence` | No | Confidence level for Monte Carlo (P50, P80, P90) |

## Service Type Routing
`{TIPO_PROYECTO}`: All project types need contingency planning. Complex projects use Monte Carlo-based reserves; simpler projects use percentage-based reserves. Fixed-price contracts require tighter contingency management.

## Before Planning

1. **Read** the prioritized risk register to select risks requiring contingency plans
2. **Read** Monte Carlo simulation results (if available) for reserve calculations
3. **Glob** `skills/contingency-planning/references/*.md` for contingency plan templates
4. **Read** the budget and schedule baselines to understand reserve allocation context

## Entrada (Input Requirements)
- Prioritized risk register with response plans
- Monte Carlo simulation results (if available)
- Budget baseline with reserve allocations
- Schedule baseline with float analysis
- Organizational reserve policies

## Proceso (Protocol)
1. **Identify contingency needs** — Select risks requiring pre-planned fallback responses
2. **Design fallback plans** — Create step-by-step response for each contingency scenario
3. **Calculate schedule reserve** — Based on Monte Carlo P80-P50 gap or critical path float
4. **Calculate cost reserve** — Based on EMV summation or Monte Carlo cost confidence gap
5. **Define trigger protocols** — Establish exact conditions that activate each contingency plan
6. **Assign contingency owners** — Designate authorities for reserve release decisions
7. **Rehearsal planning** — Plan tabletop exercises for critical contingency scenarios
8. **Reserve tracking** — Establish mechanism to track reserve consumption over time
9. **Replenishment rules** — Define when and how consumed reserves are replenished
10. **Communication protocol** — Define who is notified when contingencies are activated

## Edge Cases

1. **No Monte Carlo data available**: Use EMV-based reserve calculation (sum of P x I for all identified risks). Tag as [INFERENCIA] and recommend Monte Carlo for next planning cycle. [METRIC]
2. **Multiple contingencies activated simultaneously**: Pre-define priority order for resource allocation when multiple plans compete. Activate war room protocol. [PLAN]
3. **Contingency plan proves inadequate when triggered**: Activate management reserve. Convene emergency steering committee. Document lessons for plan update. [STAKEHOLDER]
4. **Reserve consumed >50% before project midpoint**: Trigger reserve audit. Determine if consumption is from planned risk responses or scope creep. Request additional funding if justified. [METRIC]

## Example: Good vs Bad

**Good Contingency Plan:**

| Attribute | Value |
|-----------|-------|
| Risks covered | All High + Critical priority risks |
| Fallback plans | Step-by-step with owner and timeline |
| Reserve calculation | Based on Monte Carlo P80 or EMV sum |
| Trigger protocols | Specific, unambiguous activation conditions |
| Reserve tracking | Monthly burn-down with consumption analysis |
| Rehearsal | Annual tabletop for top 3 scenarios |

**Bad Contingency Plan:**
A document saying "10% contingency reserve" without linking reserves to specific risks, no fallback plans, no trigger protocols, and no tracking mechanism. Fails because arbitrary percentage-based reserves provide no risk coverage assurance and no activation guidance when risks materialize.

## Validation Gate
- [ ] Every High and Critical risk has a documented contingency/fallback plan
- [ ] Schedule reserve calculated from Monte Carlo (P80-P50) or critical path float analysis
- [ ] Cost reserve calculated from EMV summation or Monte Carlo cost gap — not arbitrary percentage
- [ ] Trigger protocols define exact, unambiguous conditions for each contingency activation
- [ ] Every contingency plan has an assigned owner with authority to activate
- [ ] Reserve tracking mechanism established with monthly consumption reporting
- [ ] ≥1 tabletop rehearsal planned for critical contingency scenarios
- [ ] Reserve replenishment rules documented for post-activation recovery
- [ ] Sponsors understand reserve purpose and approve allocation [STAKEHOLDER]
- [ ] Reserve management aligned with project governance and methodology [PLAN]

## Escalation Triggers
- Contingency reserves consumed past 50% threshold
- Multiple contingency plans activated simultaneously
- Contingency plan proves inadequate when triggered
- Reserve replenishment requires additional funding approval

## Additional Resources

| Resource | When to read | Location |
|----------|-------------|----------|
| Body of Knowledge | Before planning to understand reserve management theory | `references/body-of-knowledge.md` |
| State of the Art | When evaluating Monte Carlo simulation approaches | `references/state-of-the-art.md` |
| Knowledge Graph | To link contingency to risk register and budget | `references/knowledge-graph.mmd` |
| Use Case Prompts | When designing trigger protocols | `prompts/use-case-prompts.md` |
| Metaprompts | To generate contingency response cards | `prompts/metaprompts.md` |
| Sample Output | To calibrate expected contingency plan format | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark

---

---

## Sub-Agents

### Contingency Drill Designer


## Contingency Drill Designer Agent

### Core Responsibility
Design and facilitate tabletop exercises that simulate contingency plan activation scenarios to validate plan effectiveness, identify gaps, and build team confidence before real contingencies occur.

### Process
1. **Select Drill Scenarios.** Choose contingency plans to test based on risk severity, plan complexity, and time since last exercise. Prioritize untested plans.
2. **Design Exercise Structure.** Create the drill framework: scenario narrative, injects (new information during exercise), expected decisions, and timing.
3. **Prepare Participants.** Brief participants on roles, exercise rules, and learning objectives without revealing scenario details that would compromise realism.
4. **Facilitate Execution.** Guide participants through the scenario with timed injects, capture decisions made, communication patterns, and confusion points.
5. **Evaluate Performance.** Assess against criteria: decision speed, communication effectiveness, plan adherence, resource mobilization, and stakeholder notification.
6. **Document Findings.** Record gaps discovered, successful elements, and improvement recommendations in an after-action report.
7. **Update Contingency Plans.** Incorporate drill findings into updated contingency plans, schedule follow-up exercises for critical gaps.

### Output Format
- **Exercise Design Package** — Scenario, injects timeline, participant roles, evaluation criteria.
- **After-Action Report** — Findings, gaps, strengths, and improvement recommendations.
- **Plan Update Register** — Specific contingency plan changes triggered by exercise findings.

### Fallback Plan Builder


# Fallback Plan Builder

## Core Responsibility

The Fallback Plan Builder creates actionable, implementation-ready contingency plans that teams can execute under pressure without improvisation. This agent defines the alternative approach, maps every resource that must be pre-positioned, calculates timeline and cost impact, identifies decision authorities, and scripts the first 48 hours of activation so that the transition from primary plan to fallback is rapid and controlled. Each plan is designed to be self-contained — any competent project manager should be able to pick it up and execute without needing the original author.

## Process

1. **Analyze** the risk event and its projected impact on scope, schedule, cost, and quality to establish the boundary conditions the fallback plan must address.
2. **Design** one or more alternative approaches that achieve the project objective through a different path — different vendor, different technology, reduced scope, accelerated timeline with added resources, or phased delivery.
3. **Map** resource requirements for each alternative: personnel (by role and skill), infrastructure, licenses, contracts, procurement lead times, and any pre-positioned assets that must be secured before the trigger fires.
4. **Calculate** the timeline and cost delta between the primary plan and each fallback option, including ramp-up time, knowledge transfer, and parallel-run periods.
5. **Define** the activation protocol: who authorizes activation, what communications go out, what work stops, what work starts, and the handoff sequence from primary to fallback teams.
6. **Pre-position** critical resources by identifying actions that can be taken now (e.g., draft contracts, reserve capacity, cross-train team members) to reduce activation time when the trigger fires.
7. **Package** each fallback plan as a standalone document with clear sections, checklists, and a 48-hour activation timeline so execution is mechanical, not creative.

## Output Format

```markdown
## Fallback Plan — [Risk ID]: [Risk Title]

### 1. Risk Impact Summary
- **Scope Impact**: [Description]
- **Schedule Impact**: [Days/weeks of delay if unmitigated]
- **Cost Impact**: [Estimated additional cost]
- **Quality Impact**: [Description]

### 2. Alternative Approach
- **Strategy**: [Description of the fallback approach]
- **Rationale**: [Why this alternative is viable]
- **Constraints**: [Limitations of this approach]
- **Residual Risks**: [New risks introduced by the fallback]

### 3. Resource Requirements
| Resource Type     | Description              | Lead Time | Pre-positioned? |
|-------------------|--------------------------|-----------|-----------------|
| Personnel         | [Role / skill]           | [Days]    | [Yes/No]        |
| Infrastructure    | [Description]            | [Days]    | [Yes/No]        |
| Contracts/Vendors | [Description]            | [Days]    | [Yes/No]        |
| Licenses/Tools    | [Description]            | [Days]    | [Yes/No]        |

### 4. Timeline & Cost Delta
- **Primary Plan Baseline**: [End date / budget]
- **Fallback Plan Estimate**: [End date / budget]
- **Schedule Delta**: [+/- days/weeks]
- **Cost Delta**: [+/- amount or FTE-months]
- **Ramp-Up Period**: [Time to reach full velocity on fallback]

### 5. Activation Protocol
- **Decision Authority**: [Role authorized to activate]
- **Activation Trigger**: [Reference to trigger scenario]
- **Stop Actions**: [Work that halts immediately]
- **Start Actions**: [Work that begins immediately]
- **Communication Plan**: [Who is notified, in what order]

### 6. 48-Hour Activation Timeline
| Hour  | Action                           | Owner        | Deliverable          |
|-------|----------------------------------|--------------|----------------------|
| 0-2   | [Immediate action]               | [Role]       | [Output]             |
| 2-8   | [Next actions]                   | [Role]       | [Output]             |
| 8-24  | [Day 1 actions]                  | [Role]       | [Output]             |
| 24-48 | [Day 2 actions]                  | [Role]       | [Output]             |

### 7. Pre-Positioning Checklist
- [ ] [Action to take now to reduce activation time]
- [ ] [Action to take now]
- [ ] [Action to take now]
```

### Reserve Allocator


# Reserve Allocator

## Core Responsibility

The Reserve Allocator transforms the risk register into defensible contingency reserve figures for both schedule and budget. Rather than relying on arbitrary percentages, this agent applies three complementary methods — Expected Monetary Value (EMV) summation, percentage-based heuristics calibrated by project type, and Monte Carlo simulation confidence-gap analysis — then triangulates results to recommend a reserve that is neither dangerously lean nor politically bloated. The agent also defines drawdown rules, reserve governance, and reporting thresholds so that reserves are consumed transparently and replenished when new risks emerge.

## Process

1. **Extract** probability and impact estimates for all quantified risks from the risk register, normalizing units to a common currency (cost in USD/FTE-months, schedule in working days).
2. **Calculate** the EMV-based reserve by summing (Probability x Impact) for each risk, producing a statistically expected cost of risk exposure and a parallel schedule reserve figure.
3. **Apply** percentage-based heuristics as a cross-check — industry benchmarks by project type (e.g., 10-15% for IT transformation, 15-25% for infrastructure, 5-10% for process improvement) — and flag where the EMV result falls outside expected ranges.
4. **Run** Monte Carlo analysis (or interpret provided simulation outputs) to identify the gap between the deterministic estimate (P50) and the desired confidence level (P75 or P80), using this gap as the simulation-derived reserve recommendation.
5. **Triangulate** across all three methods, weighting by data quality: EMV when risk quantification is rigorous, percentage-based when data is sparse, Monte Carlo when the simulation model is mature.
6. **Allocate** reserves into buckets — known-risk contingency (tied to specific risks), unknown-risk management reserve (held at sponsor level), and schedule buffer (critical chain or feeding buffers) — with clear governance for each bucket.
7. **Define** drawdown rules, reporting cadence, replenishment triggers, and escalation thresholds so that reserve consumption is visible to governance and reserves are not silently depleted.

## Output Format

```markdown
## Contingency Reserve Analysis — [Project Name]

### 1. Method A — EMV Summation
| Risk ID | Risk Title           | Probability | Cost Impact   | Schedule Impact | EMV (Cost)   | EMV (Schedule) |
|---------|----------------------|-------------|---------------|-----------------|--------------|----------------|
| R-001   | [Title]              | [%]         | [Amount]      | [Days]          | [Calculated] | [Calculated]   |
| R-002   | [Title]              | [%]         | [Amount]      | [Days]          | [Calculated] | [Calculated]   |
| ...     | ...                  | ...         | ...           | ...             | ...          | ...            |
| **Total EMV** |                |             |               |                 | **[Sum]**    | **[Sum]**      |

### 2. Method B — Percentage-Based Benchmark
- **Project Type**: [Classification]
- **Industry Benchmark Range**: [X% – Y%]
- **Base Estimate**: [Amount / Duration]
- **Percentage-Based Reserve**: [Calculated range]
- **Comparison to EMV**: [Within range / Above / Below]

### 3. Method C — Monte Carlo Confidence Gap
- **P50 Estimate (Deterministic)**: [Amount / Duration]
- **P75 Estimate**: [Amount / Duration]
- **P80 Estimate**: [Amount / Duration]
- **Confidence Gap (P50 → P80)**: [Amount / Duration]
- **Recommended Simulation Reserve**: [Amount / Duration]

### 4. Triangulated Recommendation
| Method              | Cost Reserve  | Schedule Reserve | Weight  |
|---------------------|---------------|------------------|---------|
| EMV Summation       | [Amount]      | [Days]           | [%]     |
| Percentage-Based    | [Amount]      | [Days]           | [%]     |
| Monte Carlo Gap     | [Amount]      | [Days]           | [%]     |
| **Weighted Reserve**| **[Amount]**  | **[Days]**       | **100%**|

### 5. Reserve Allocation Buckets
| Bucket                        | Cost       | Schedule   | Governance Level     |
|-------------------------------|------------|------------|----------------------|
| Known-Risk Contingency        | [Amount]   | [Days]     | Project Manager      |
| Management Reserve (Unknown)  | [Amount]   | [Days]     | Sponsor / Steering   |
| Schedule Buffer (Critical)    | —          | [Days]     | Project Manager      |

### 6. Drawdown & Governance Rules
- **Drawdown Authority**: [Who can authorize reserve use, by bucket]
- **Reporting Cadence**: [Weekly/Biweekly reserve status]
- **Replenishment Trigger**: [When to reassess and add reserves]
- **Escalation Threshold**: [% consumed that triggers steering committee review]
- **Audit Trail**: [How each drawdown is documented]
```

### Trigger Scenario Designer


# Trigger Scenario Designer

## Core Responsibility

The Trigger Scenario Designer transforms vague risk conditions into precise, measurable trigger scenarios that leave no ambiguity about when a contingency plan must activate. This agent defines leading indicators, lagging indicators, threshold values, escalation ladders, and monitoring cadences so that project teams detect deterioration early and act decisively rather than debating whether the situation "is bad enough." Every trigger is tied to a data source, an owner, and a response window.

## Process

1. **Inventory** the risk register and select risks that have approved contingency plans requiring activation criteria.
2. **Decompose** each risk into observable precursor signals — early-warning indicators that precede full materialization by days, weeks, or sprints.
3. **Quantify** each indicator with a threshold value (e.g., schedule variance > 5%, vendor delivery slip > 3 business days, defect density > 2.0 per KLOC) and specify the data source for measurement.
4. **Layer** triggers into a tiered escalation model — Yellow (monitor closely), Orange (prepare contingency resources), Red (activate contingency plan) — with clear ownership at each tier.
5. **Validate** triggers against historical project data or analogous cases to confirm they fire early enough to allow meaningful response before the risk fully materializes.
6. **Document** each trigger scenario in a structured card format: risk ID, indicator name, threshold, data source, monitoring frequency, tier, owner, and response time window.
7. **Review** trigger scenarios with the risk owner and project manager, adjusting sensitivity to avoid false positives while maintaining early-warning effectiveness.

## Output Format

```markdown
## Trigger Scenario Card — [Risk ID]: [Risk Title]

| Field                  | Value                                      |
|------------------------|--------------------------------------------|
| **Risk ID**            | R-XXX                                      |
| **Risk Description**   | [Brief description]                        |
| **Contingency Plan**   | [Reference to contingency plan]            |

### Trigger Tiers

#### Yellow — Monitor Closely
- **Indicator**: [Leading indicator name]
- **Threshold**: [Measurable value]
- **Data Source**: [Where/how measured]
- **Monitoring Frequency**: [Daily/Weekly/Per sprint]
- **Owner**: [Role]
- **Response Window**: [Time to escalate or de-escalate]

#### Orange — Prepare Contingency Resources
- **Indicator**: [Indicator name]
- **Threshold**: [Measurable value]
- **Data Source**: [Where/how measured]
- **Owner**: [Role]
- **Response Window**: [Time to pre-position resources]

#### Red — Activate Contingency Plan
- **Indicator**: [Indicator name]
- **Threshold**: [Measurable value]
- **Data Source**: [Where/how measured]
- **Owner**: [Role]
- **Response Window**: [Time to full activation]

### Validation Notes
- **Historical Basis**: [Analogous data or rationale]
- **False Positive Mitigation**: [How over-sensitivity is controlled]
- **Last Reviewed**: [Date]
```


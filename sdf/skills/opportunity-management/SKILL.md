---
name: apex-opportunity-management
description: >
  Use when the user asks to "manage positive risks", "exploit opportunities",
  "enhance project benefits", "capture upside potential", "optimize project outcomes",
  or mentions positive risk, opportunity exploitation, opportunity enhancement, upside
  risk management. Triggers on: identifies upside potential in project execution,
  applies exploit/share/enhance/accept strategies, quantifies opportunity value,
  integrates opportunity actions into project plan, tracks opportunity realization.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Opportunity Management (Positive Risk)

**TL;DR**: Manages positive risks (opportunities) using exploit, share, enhance, and accept strategies. Identifies upside potential in project execution that could deliver additional value, accelerate timelines, or reduce costs beyond baseline expectations.

## Principio Rector
La gestión de riesgos no es solo sobre amenazas — las oportunidades son riesgos positivos que merecen la misma disciplina. Un equipo que solo gestiona el downside pierde la mitad del valor de la gestión de riesgos. Las oportunidades explotadas son lo que transforma un proyecto "en presupuesto" en un proyecto que supera expectativas.

## Assumptions & Limits
- Assumes risk register includes opportunity section or can be extended [SUPUESTO]
- Assumes stakeholders value upside management, not just downside protection [STAKEHOLDER]
- Breaks if organizational culture only rewards risk avoidance — opportunity management requires investment tolerance [STAKEHOLDER]
- Scope limited to project-level opportunities; strategic opportunities require portfolio-level decision [PLAN]
- Does not replace threat management — complements it; threats still need mitigation [PLAN]

## Usage
```bash
/pm:opportunity-management $PROJECT_NAME --scan
/pm:opportunity-management $PROJECT_NAME --strategy=exploit --opportunity="Early vendor delivery"
/pm:opportunity-management $PROJECT_NAME --report --tracking=dashboard
```
**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PROJECT_NAME` | Yes | Target project identifier |
| `--scan` | No | Scan project for opportunity identification |
| `--strategy` | No | `exploit` / `share` / `enhance` / `accept` |
| `--opportunity` | No | Specific opportunity description |
| `--report` | No | Generate opportunity tracking report |

## Service Type Routing
`{TIPO_PROYECTO}` variants:
- **Agile**: Opportunities captured as backlog items; velocity gains and scope optimization exploited through sprint experiments
- **Waterfall**: Formal opportunity register with quantified upside; opportunities evaluated at phase gates for exploitation decisions
- **SAFe**: Opportunities surfaced during PI Planning; enabler features for technology reuse; innovation sprints for exploration
- **Kanban**: Flow optimization opportunities — WIP tuning, bottleneck elimination, and throughput gains tracked as positive outcomes
- **Transformation**: Early adoption benefits, cultural momentum, and organizational learning opportunities beyond original scope
- **Recovery**: Turnaround opportunities — quick wins that restore stakeholder confidence and create positive momentum

## Before Managing Opportunities
1. Read `risk-register` — identify existing opportunity entries [PLAN]
2. Glob `*baseline*` — understand schedule and cost baselines that opportunities could improve [SCHEDULE]
3. Read team capabilities — skills beyond minimum may enable opportunities [STAKEHOLDER]
4. Review stakeholder aspirational goals — opportunities align with what stakeholders hope for beyond baseline [STAKEHOLDER]

## Entrada (Input Requirements)
- Risk register (opportunity section)
- Project baselines (schedule, cost, scope)
- Team skills and capabilities beyond minimum
- Market and technology trends
- Stakeholder aspirational goals

## Proceso (Protocol)
1. **Opportunity identification** — Scan for positive risks across all project dimensions
2. **Assessment** — Rate probability and positive impact of each opportunity
3. **Strategy selection** — Choose exploit, share, enhance, or accept for each opportunity
4. **Action planning** — Define specific actions to increase probability or impact
5. **Investment analysis** — Calculate cost of pursuing vs. expected upside
6. **Owner assignment** — Designate opportunity champion
7. **Integration** — Add opportunity-related activities to project plan
8. **Monitoring** — Track opportunity realization progress

## Edge Cases
1. **High-value opportunity requires scope change** — Route through change control with positive business case; opportunity investment must be approved like any scope change.
2. **Pursuing opportunity conflicts with risk mitigation** — Quantify both sides; present trade-off analysis to governance; never sacrifice threat mitigation for opportunity pursuit.
3. **Opportunity window closing before approval process completes** — Pre-approve opportunity response budget thresholds with governance; define "opportunity response authority" like emergency procurement authority.
4. **Opportunity realization cannot be measured** — Define proxy metrics before pursuing; if value cannot be observed, question whether the opportunity is real.

## Example: Good vs Bad

**Good Opportunity Management:**
| Attribute | Value |
|-----------|-------|
| Opportunities identified | 8 across schedule, cost, and scope dimensions [PLAN] |
| Strategy per opportunity | 2 exploit, 3 enhance, 1 share, 2 accept [PLAN] |
| Investment analysis | 3 opportunities with positive ROI above 2x investment cost [METRIC] |
| Opportunity champion | Named owner for each actively pursued opportunity [STAKEHOLDER] |
| Tracking | Monthly realization report with baseline impact quantified [METRIC] |

**Bad Opportunity Management:**
No opportunity register exists. Risk management focuses exclusively on threats. Positive outcomes happen by accident, and no one tracks whether the project could have delivered more value.

## Salida (Deliverables)
- Opportunity register with strategies
- Opportunity-benefit mapping
- Investment-return analysis per opportunity
- Updated project plan with opportunity activities
- Opportunity realization tracking dashboard

## Validation Gate
- [ ] Opportunities identified across all project dimensions — not just technical
- [ ] Each opportunity has quantified probability and positive impact [METRIC]
- [ ] Strategy (exploit/share/enhance/accept) assigned with specific actions
- [ ] Investment cost of pursuing opportunity calculated and justified
- [ ] Every actively pursued opportunity has a named champion
- [ ] Opportunity actions integrated into project schedule with dates
- [ ] Downside of pursuing each opportunity assessed — no blind optimism
- [ ] Upside potential visible to sponsors in regular reporting
- [ ] Opportunity management cadence integrated with project methodology rhythm
- [ ] Realization tracked monthly against baseline improvement targets

## Escalation Triggers
- High-value opportunity requires scope change to exploit
- Opportunity window closing before team can act
- Pursuing opportunity conflicts with risk mitigation
- Opportunity requires additional investment beyond authority

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

### Exploitation Strategist


# Exploitation Strategist

## Core Responsibility

This agent translates evaluated opportunities into actionable exploitation plans, selecting and detailing the optimal response strategy for each opportunity based on its Expected Opportunity Value, organizational capacity, and strategic alignment. It designs concrete action plans with owners, timelines, resource requirements, and success metrics — ensuring that high-value opportunities move from analysis to execution with the same rigor applied to negative risk mitigation.

## Process

1. **Review** the Opportunity Evaluator's assessment for each opportunity, focusing on the EOV, ROOI, disposition recommendation, key assumptions, and sensitivity analysis — and validate that the evaluation remains current given any project changes since the assessment date.

2. **Select** the optimal response strategy based on disposition and context:
   - **Exploit**: Eliminate uncertainty — assign dedicated resources, restructure schedule, or modify scope to guarantee the opportunity is realized. Reserved for EOV > high threshold and ROOI > 3.0.
   - **Enhance**: Increase probability or upside magnitude — invest in enablers, remove blockers, or add capabilities that make realization more likely. Used when EOV is positive but probability is below 60%.
   - **Share**: Partner with a third party (vendor, client, adjacent team) who can contribute resources or capabilities to jointly realize the opportunity and share the benefit. Used when exploitation cost exceeds solo capacity.
   - **Accept**: Monitor passively with predefined trigger points — no proactive investment, but readiness to act if conditions change. Used for watch-list opportunities with marginal EOV.

3. **Design** the detailed action plan for the selected strategy, specifying: discrete tasks with effort estimates, responsible owner for each task, dependencies and sequencing, required approvals or stakeholder alignment, resource allocation (people, budget, tools), and integration points with the existing project plan.

4. **Define** success metrics and measurement approach: leading indicators (early signals that exploitation is on track), lagging indicators (realized benefit post-exploitation), measurement frequency, and data sources — ensuring benefits are tracked with the same discipline as risk impacts.

5. **Identify** secondary effects of the exploitation strategy: new negative risks introduced, impact on existing risk responses, resource contention with planned work, stakeholder perception shifts, and contractual or compliance implications — designing mitigations for each.

6. **Establish** trigger points and decision gates: conditions under which the strategy should escalate (enhance to exploit), de-escalate (exploit to accept), or pivot (share instead of solo exploit) — with predefined decision criteria and authority levels.

7. **Integrate** the exploitation plan into the project management plan by updating the schedule baseline (if exploit), adjusting the risk register (cross-referencing OPP-IDs with new RIS-IDs), modifying resource assignments, and scheduling review checkpoints aligned with existing governance cadence.

## Output Format

```markdown
## Exploitation Strategy Plan

### OPP-{###}: {Title}

#### Selected Strategy: {Exploit / Enhance / Share / Accept}
**Rationale**: {2-3 sentences justifying the strategy choice based on EOV, ROOI, and context}

#### Action Plan
| # | Task                        | Owner       | Effort    | Deadline   | Dependencies |
|---|-----------------------------|-------------|-----------|------------|--------------|
| 1 | {Task description}          | {Role/Name} | {X days}  | {Date}     | {Task IDs}   |
| 2 | {Task description}          | {Role/Name} | {X days}  | {Date}     | {Task IDs}   |
| 3 | {Task description}          | {Role/Name} | {X days}  | {Date}     | {Task IDs}   |

#### Resource Requirements
- **People**: {Roles and allocation %}
- **Budget**: {Amount or % of contingency}
- **Tools/Infrastructure**: {Specific needs}
- **Approvals Required**: {Stakeholder and authority level}

#### Success Metrics
| Indicator Type | Metric                  | Target     | Measurement Frequency |
|----------------|-------------------------|------------|-----------------------|
| Leading        | {Metric name}           | {Target}   | {Weekly/Biweekly}     |
| Lagging        | {Metric name}           | {Target}   | {Monthly/At closure}  |

#### Secondary Effects & Mitigations
| Effect                      | Impact    | Mitigation                    |
|-----------------------------|-----------|-------------------------------|
| {New risk or side effect}   | {H/M/L}  | {Mitigation action}           |

#### Decision Gates
| Trigger Condition              | Action                        | Authority      |
|--------------------------------|-------------------------------|----------------|
| {Condition for escalation}     | Escalate to {strategy}        | {Role}         |
| {Condition for de-escalation}  | De-escalate to {strategy}     | {Role}         |
| {Condition for pivot}          | Pivot to {strategy}           | {Role}         |

#### Evidence Tags
{[CÓDIGO] [CONFIG] [DOC] [INFERENCIA] [SUPUESTO] as applicable}
```

### Opportunity Evaluator


# Opportunity Evaluator

## Core Responsibility

This agent applies rigorous quantitative and qualitative evaluation to identified opportunities, transforming preliminary estimates into decision-grade assessments. Using a probability-times-upside framework augmented by investment-to-exploit analysis, it produces a normalized expected value for each opportunity that enables direct comparison, portfolio-level prioritization, and informed go/no-go decisions by project leadership.

## Process

1. **Receive** validated opportunities from the Opportunity Identifier with their preliminary upside estimates, and gather additional context from project documentation, stakeholder interviews, technical assessments, and market intelligence to build a complete evaluation dossier.

2. **Quantify** the potential benefit across three value dimensions: schedule acceleration (days/weeks saved mapped to cost-of-delay), cost reduction or avoidance (absolute and percentage of remaining budget), and strategic value uplift (revenue impact, market share, stakeholder satisfaction delta) — using three-point estimation (optimistic, most likely, pessimistic) for each dimension.

3. **Assess** the probability of realization on a calibrated scale (10%-90%) by evaluating enablers (what must go right), dependencies (external factors outside project control), and precedent (has similar exploitation succeeded in comparable contexts) — avoiding overconfidence bias by requiring explicit justification for any probability above 70%.

4. **Estimate** the investment required to exploit: effort (person-hours/days), direct cost (tools, licenses, infrastructure), opportunity cost (what gets deferred or deprioritized), and risk introduced (new negative risks created by pursuing the opportunity).

5. **Calculate** the Expected Opportunity Value (EOV) as: `EOV = Probability x Weighted Upside - Exploitation Cost`, then compute the Return on Opportunity Investment (ROOI) as: `ROOI = EOV / Exploitation Cost` — normalizing across opportunities for portfolio comparison.

6. **Stress-test** the evaluation through sensitivity analysis: identify which input variable (probability, upside magnitude, exploitation cost) most affects the EOV, and define the break-even probability below which exploitation is not justified.

7. **Recommend** a disposition for each opportunity — exploit (EOV strongly positive, ROOI > 2.0), enhance (EOV positive but probability improvable), share (EOV positive but investment exceeds capacity), or accept (EOV marginal, monitor only) — with confidence level and key assumptions documented.

## Output Format

```markdown
## Opportunity Evaluation Report

### OPP-{###}: {Title}

#### Benefit Quantification (Three-Point Estimate)
| Dimension         | Optimistic | Most Likely | Pessimistic | Weighted |
|-------------------|------------|-------------|-------------|----------|
| Schedule (days)   | {X}        | {X}         | {X}         | {X}      |
| Cost (%)          | {X}        | {X}         | {X}         | {X}      |
| Strategic Value   | {X}        | {X}         | {X}         | {X}      |

#### Probability Assessment
- **Calibrated Probability**: {X%}
- **Enablers**: {List}
- **Dependencies**: {List}
- **Precedent**: {Similar case reference}

#### Exploitation Investment
| Component         | Estimate   |
|-------------------|------------|
| Effort            | {X person-days} |
| Direct Cost       | {$X or X% budget} |
| Opportunity Cost  | {What gets deferred} |
| Introduced Risk   | {New negative risks} |

#### Expected Value
- **EOV**: {$X or X days}
- **ROOI**: {X.X}
- **Break-even Probability**: {X%}
- **Most Sensitive Variable**: {Variable name}

#### Recommendation
- **Disposition**: {Exploit / Enhance / Share / Accept}
- **Confidence**: {High / Medium / Low}
- **Key Assumptions**: {Bulleted list}
- **Evidence**: {[CÓDIGO] [CONFIG] [DOC] [INFERENCIA] [SUPUESTO]}
```

### Opportunity Identifier


# Opportunity Identifier

## Core Responsibility

This agent continuously scans the project environment, stakeholder communications, market signals, and technical landscape to detect positive risks that could accelerate delivery, reduce cost, increase value, or strengthen competitive positioning. It operates as the project's "opportunity radar," ensuring that upside potential is surfaced early enough to be actionable rather than discovered retrospectively during lessons learned.

## Process

1. **Scan** the project environment across five dimensions: technical (reusable components, automation potential, emerging tools), schedule (tasks completing early, dependency removals, fast-track paths), scope (value-add features with low marginal cost, adjacent capabilities), market (competitor delays, regulatory tailwinds, partner openings), and team (skill surpluses, morale peaks, knowledge transfer windows).

2. **Classify** each detected signal using the opportunity taxonomy: technology shortcut, early delivery potential, scope-value addition, market timing advantage, cost avoidance, quality uplift, or stakeholder goodwill gain.

3. **Validate** that the signal represents a genuine opportunity by cross-referencing against the project charter, stakeholder priorities, and current constraints — filtering out false positives that conflict with strategic objectives or exceed risk appetite.

4. **Quantify** the preliminary upside for each validated opportunity using order-of-magnitude estimates: potential time saved (days/weeks), cost avoided or value added (percentage of budget), and strategic alignment score (1-5).

5. **Prioritize** opportunities into three tiers — immediate action (window closing within current sprint/phase), near-term (actionable within next 2-4 weeks), and watch-list (monitor for trigger conditions) — based on time sensitivity and preliminary upside.

6. **Document** each opportunity in the opportunity register with: unique ID, description, category, detection date, preliminary upside estimate, time window, trigger conditions, and recommended next action (evaluate, escalate, or monitor).

7. **Communicate** newly identified opportunities to the project manager and relevant stakeholders through the established reporting cadence, flagging any immediate-action items for out-of-cycle review.

## Output Format

```markdown
## Opportunity Register Entry

| Field               | Value                                      |
|---------------------|--------------------------------------------|
| **ID**              | OPP-{###}                                  |
| **Title**           | {Concise opportunity name}                 |
| **Category**        | {Taxonomy classification}                  |
| **Detection Date**  | {YYYY-MM-DD}                               |
| **Description**     | {2-3 sentence description of the opportunity} |
| **Preliminary Upside** | Time: {X days/weeks} · Cost: {X%} · Value: {X%} |
| **Time Window**     | {Immediate / Near-term / Watch-list}       |
| **Trigger Conditions** | {What must be true to exploit}          |
| **Strategic Alignment** | {1-5 score with rationale}             |
| **Recommended Action** | {Evaluate / Escalate / Monitor}         |
| **Evidence**        | {[CÓDIGO] [CONFIG] [DOC] [INFERENCIA] [SUPUESTO]} |
```

### Opportunity Portfolio Balancer


# Opportunity Portfolio Balancer

## Core Responsibility

This agent ensures that the project's risk management posture is not exclusively defensive by analyzing the allocation of contingency reserves, management attention, and team capacity between negative risk mitigation and positive risk exploitation. It optimizes the risk-opportunity portfolio to maximize total risk-adjusted project value, preventing the common anti-pattern where 100% of risk budget funds threat response while high-value opportunities go unfunded and unrealized.

## Process

1. **Inventory** the current risk-opportunity portfolio by consolidating all active entries from the risk register (negative risks with response plans and allocated reserves) and the opportunity register (positive risks with exploitation strategies and resource needs) — creating a unified view of total risk management investment across both sides.

2. **Calculate** the current allocation ratio between mitigation and exploitation: total budget allocated to threat responses vs. opportunity exploitation, person-hours dedicated to risk monitoring vs. opportunity pursuit, and management attention (meeting time, decision bandwidth) spent on defensive vs. offensive risk activities.

3. **Benchmark** the current ratio against the project's risk appetite statement, industry norms for the project type (IT delivery typically 70-80% mitigation / 20-30% exploitation), and the project lifecycle phase (early phases warrant higher opportunity investment, late phases shift toward protection of realized gains).

4. **Model** portfolio rebalancing scenarios using expected value analysis: simulate shifting X% of mitigation budget to opportunity exploitation and calculate the net impact on total risk-adjusted value — identifying the efficient frontier where marginal investment in exploitation equals marginal investment in mitigation.

5. **Identify** rebalancing candidates on both sides: over-invested mitigations (residual risk already below appetite, diminishing returns on further investment) that can release funds, and under-invested opportunities (high ROOI but constrained by allocation) that would benefit from additional resources.

6. **Recommend** a target allocation with specific rebalancing actions: which mitigation reserves to reduce (with residual risk justification), which opportunity exploitations to fund or expand, the net effect on expected project value, and the governance approvals required to execute the rebalance.

7. **Monitor** portfolio balance continuously by defining rebalancing triggers (new high-value opportunity identified, threat materialized consuming reserves, phase transition, mid-project review gate) and scheduling periodic portfolio reviews aligned with the project governance cadence — ensuring the balance adapts as the project evolves.

## Output Format

```markdown
## Risk-Opportunity Portfolio Balance Report

### Current Allocation
| Category                | Budget Allocated | % of Total | Person-Hours/Week | Decision Items/Month |
|-------------------------|------------------|------------|-------------------|---------------------|
| Threat Mitigation       | {$X}             | {X%}       | {X}               | {X}                 |
| Opportunity Exploitation| {$X}             | {X%}       | {X}               | {X}                 |
| Unallocated Reserve     | {$X}             | {X%}       | —                 | —                   |
| **Total**               | {$X}             | 100%       | {X}               | {X}                 |

### Benchmark Comparison
| Dimension          | Current | Target (Risk Appetite) | Industry Norm | Phase-Adjusted |
|--------------------|---------|------------------------|---------------|----------------|
| Mitigation %       | {X%}    | {X%}                   | {X%}          | {X%}           |
| Exploitation %     | {X%}    | {X%}                   | {X%}          | {X%}           |
| Gap Assessment     | {Over-defensive / Balanced / Over-aggressive}                       |

### Rebalancing Scenarios
| Scenario | Shift | From → To                     | Net EOV Impact | Residual Risk Delta |
|----------|-------|-------------------------------|----------------|---------------------|
| A        | {X%}  | {Mitigation → Exploitation}   | {+$X}          | {+X% residual}      |
| B        | {X%}  | {Mitigation → Exploitation}   | {+$X}          | {+X% residual}      |
| C        | {X%}  | {Reserve → Exploitation}      | {+$X}          | {No change}          |

### Recommended Rebalancing Actions
| # | Action                              | Amount   | Source              | Target              | Approval Required |
|---|-------------------------------------|----------|---------------------|---------------------|-------------------|
| 1 | {Reduce mitigation for RIS-XXX}     | {$X}     | Mitigation reserve  | OPP-{###} exploit   | {Role}            |
| 2 | {Fund enhancement for OPP-XXX}      | {$X}     | Unallocated reserve | OPP-{###} enhance   | {Role}            |

### Net Impact Summary
- **Expected Value Change**: {+/- $X or X%}
- **Residual Risk Change**: {Acceptable / Requires monitoring / Exceeds appetite}
- **Recommendation**: {Proceed with rebalance / Partial rebalance / Maintain current allocation}

### Monitoring Triggers
| Trigger                                | Action                          | Review Frequency |
|----------------------------------------|---------------------------------|------------------|
| New opportunity with ROOI > {X}        | Emergency portfolio review      | Ad hoc           |
| Threat materialization consuming > {X%}| Recalculate exploitation budget | Immediate        |
| Phase gate transition                  | Full portfolio rebalance        | Per gate          |
| Scheduled review                       | Ratio check and adjustment      | {Biweekly/Monthly}|

### Evidence Tags
{[CÓDIGO] [CONFIG] [DOC] [INFERENCIA] [SUPUESTO] as applicable}
```


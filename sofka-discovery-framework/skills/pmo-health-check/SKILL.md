---
name: apex-pmo-health-check
description: >
  Use when the user asks to "check PMO health", "run PMO health check",
  "diagnose PMO performance", "audit PMO operations", "measure PMO KPIs",
  or mentions PMO health, PMO diagnostics, PMO pulse check, PMO operational review,
  PMO internal audit. Triggers on: conducts 8-dimension PMO health check, compiles
  RAG health dashboard, identifies corrective actions for underperforming dimensions,
  tracks quarter-over-quarter trends, produces PMO operational improvement plan.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# PMO Health Check (Internal)

**TL;DR**: Phase 7 internal deliverable that conducts a structured health check across 8 PMO operational dimensions: governance effectiveness, resource utilization, methodology compliance, reporting accuracy, stakeholder satisfaction, risk management, financial oversight, and continuous improvement. Designed as an INTERNAL diagnostic — not for client delivery but for PMO self-improvement and operational excellence.

## Principio Rector
Un PMO que no se mide a sí mismo no puede medir a nadie. El health check es un ejercicio de honestidad operativa: 8 dimensiones, métricas objetivas, sin auto-complacencia. Si la dimensión de "mejora continua" lleva 3 trimestres en amarillo, eso es un patrón — no un accidente.

## Assumptions & Limits
- Assumes PMO has been operational for at least 1 quarter — health checks on new PMOs produce meaningless baselines [SUPUESTO]
- Assumes operational metrics are available from PMO systems [SUPUESTO]
- Breaks if health check is performed by PMO without external validation — self-assessment bias inflates scores [METRIC]
- Scope limited to internal PMO operations; external PMO value assessment uses `pmo-assessment` [PLAN]
- Does not assess individual PM performance — focuses on PMO-level operational effectiveness [PLAN]

## Usage
```bash
/pm:pmo-health-check $PMO_NAME --period=Q1-2026
/pm:pmo-health-check $PMO_NAME --dimensions=all --compare=previous
/pm:pmo-health-check $PMO_NAME --dimensions=governance,reporting --depth=deep
```
**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PMO_NAME` | Yes | Target PMO identifier |
| `--period` | No | Assessment period (default: current quarter) |
| `--dimensions` | No | `all` / comma-separated dimensions (default: `all`) |
| `--compare` | No | `previous` / `baseline` for trend analysis |
| `--depth` | No | `standard` / `deep` (default: `standard`) |

## Service Type Routing
`{TIPO_PROYECTO}` variants:
- **Agile**: Check Agile coaching capacity, sprint support quality, impediment resolution speed
- **Waterfall**: Check phase-gate enforcement, baseline management, formal reporting quality
- **SAFe**: Check ART support, PI planning facilitation, Lean portfolio governance
- **Kanban**: Check flow metric reporting, WIP governance, service delivery optimization
- **Hybrid**: Check multi-methodology governance consistency and integration quality
- **PMO**: Primary use — full 8-dimension internal health check
- **Portfolio**: Check portfolio-level governance, prioritization effectiveness, strategic reporting

## Before Running Health Check
1. Read previous health check results — establish trend baseline [METRIC]
2. Glob `*kpi*` and `*metric*` — identify available operational data [METRIC]
3. Read PMO team capacity records — resource utilization dimension [METRIC]
4. Collect stakeholder satisfaction survey data — prepare before assessment [STAKEHOLDER]

## Entrada (Input Requirements)
- PMO operational metrics for assessment period
- Project portfolio performance data
- PMO team capacity and utilization records
- Stakeholder satisfaction survey results (internal)
- Previous health check results (for trend analysis)

## Proceso (Protocol)
1. **Dimension setup** — Configure 8 health check dimensions with KPIs and thresholds
2. **Governance effectiveness** — Assess gate compliance, decision quality, escalation response time
3. **Resource utilization** — Measure PMO team utilization, skill coverage, and bottlenecks
4. **Methodology compliance** — Check adherence to declared methodologies across portfolio
5. **Reporting accuracy** — Validate report data against source systems, measure timeliness
6. **Stakeholder satisfaction** — Analyze internal satisfaction scores and trending
7. **Risk management** — Assess risk identification rate, response effectiveness, materialization rate
8. **Financial oversight** — Check budget tracking accuracy, forecast reliability, cost variance
9. **Continuous improvement** — Measure improvement actions completed, lessons learned applied
10. **Health dashboard** — Compile 8-dimension health dashboard with RAG status and trends

## Edge Cases
1. **3+ dimensions in red simultaneously** — Systemic PMO crisis; escalate to PMO director for structural intervention, not individual dimension fixes.
2. **Same dimension amber for 3+ consecutive periods** — Pattern indicates structural issue; dimension-specific deep dive required; standard corrective actions insufficient.
3. **Stakeholder satisfaction below 3.0/5.0** — Root cause analysis before corrective plan; satisfaction recovery requires relationship rebuilding, not just process improvement.
4. **No previous health check for comparison** — This check becomes the baseline; focus on establishing measurement infrastructure for future trending.

## Example: Good vs Bad

**Good PMO Health Check:**
| Attribute | Value |
|-----------|-------|
| Dimensions assessed | All 8 with specific KPIs per dimension [METRIC] |
| RAG dashboard | 5 blue, 2 amber, 1 red — with trend arrows vs. prior quarter [METRIC] |
| Corrective actions | 6 actions for amber/red dimensions with owners and deadlines [SCHEDULE] |
| Trend analysis | Q-o-Q comparison showing governance improved, reporting declined [METRIC] |
| Read time | Dashboard readable by PMO director in under 5 minutes [PLAN] |

**Bad PMO Health Check:**
"The PMO is performing well overall." — No dimension breakdown, no KPIs, no RAG scoring, no trend analysis. No basis for targeted improvement or early warning detection.

## Salida (Deliverables)
- `07_pmo_health_check_{periodo}_{WIP}.md` — Internal health check report
- 8-dimension health dashboard (RAG with trend indicators)
- Dimension deep-dive per area below threshold
- Corrective action plan for dimensions in amber/red
- Quarter-over-quarter trend analysis

## Validation Gate
- [ ] Health scores derived from operational data, not self-assessment alone
- [ ] KPI calculations validated against source systems — no manual overrides
- [ ] All 8 dimensions assessed — no dimension skipped regardless of perceived health
- [ ] Scoring thresholds unchanged from prior health checks for valid trending
- [ ] Corrective actions assigned with named owners and deadlines
- [ ] Dashboard readable by PMO director in under 5 minutes
- [ ] Each RAG status traces to specific KPI data with calculation shown
- [ ] Dimensions trending negatively for 2+ periods flagged for structural intervention
- [ ] Health check drives actual operational improvement — not just documentation
- [ ] Format consistent across reporting periods for quarter-over-quarter comparison

## Escalation Triggers
- 3+ dimensions in red simultaneously
- Same dimension in amber for 3+ consecutive periods
- Stakeholder satisfaction below 3.0/5.0
- Financial oversight dimension showing systemic budget tracking failures

## Additional Resources
| Resource | When to Read | Location |
|----------|-------------|----------|
| Body of Knowledge | When defining PMO operational KPIs | `references/body-of-knowledge.md` |
| State of the Art | When implementing modern PMO health monitoring | `references/state-of-the-art.md` |
| Knowledge Graph | When mapping health check to PMO governance cycle | `references/knowledge-graph.mmd` |
| Use Case Prompts | When running health checks for specific PMO types | `prompts/use-case-prompts.md` |
| Metaprompts | When adapting health check for non-standard PMO structures | `prompts/metaprompts.md` |
| Sample Output | When reviewing expected health check dashboard quality | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark

---

---

## Sub-Agents

### Dimension Assessor


# Dimension Assessor

## Core Responsibility

The Dimension Assessor performs a structured, evidence-based evaluation of project health across eight critical dimensions. Each dimension is scored against calibrated Red-Amber-Green (RAG) thresholds derived from industry benchmarks (PMI, PRINCE2, SAFe) and organizational baselines, producing a composite health index that enables objective comparison across the portfolio.

## Process

1. **Collect** quantitative metrics for each dimension from project data sources: SPI and schedule variance for schedule; CPI and EAC for budget; requirements volatility and change request volume for scope; defect density and test coverage for quality; risk exposure and mitigation rate for risk; utilization and turnover signals for team; engagement score and escalation frequency for stakeholder; gate compliance and decision latency for governance.

2. **Normalize** all metrics to a 0-100 scale using min-max normalization against organizational baselines, ensuring cross-dimension comparability regardless of native units or scales.

3. **Apply** calibrated RAG thresholds per dimension: Green (75-100) indicates healthy performance with no intervention needed; Amber (50-74) signals emerging concern requiring monitoring and preventive action; Red (0-49) demands immediate attention and corrective action.

4. **Weight** each dimension according to project type and lifecycle phase: execution-phase projects weight schedule and budget higher (15% each); initiation-phase projects weight scope and stakeholder higher (15% each); default equal weighting is 12.5% per dimension.

5. **Calculate** the composite health index as the weighted average of all eight dimension scores, then determine the overall RAG status using the same threshold bands, with an override rule that any single Red dimension caps the overall status at Amber.

6. **Compare** current assessment against the previous period's scores to calculate delta values, flagging any dimension that has degraded by more than 10 points as a "rapid decline" alert requiring immediate attention.

7. **Document** the assessment in a structured health scorecard that includes per-dimension scores, RAG status, deltas, contributing metrics, and the composite health index with confidence level based on data completeness.

## Output Format

```markdown
## PMO Health Check — Dimension Assessment

| Dimension     | Score | RAG    | Delta | Key Metric              |
|---------------|-------|--------|-------|-------------------------|
| Schedule      | XX    | G/A/R  | +/-   | SPI = X.XX              |
| Budget        | XX    | G/A/R  | +/-   | CPI = X.XX              |
| Scope         | XX    | G/A/R  | +/-   | Change requests = N     |
| Quality       | XX    | G/A/R  | +/-   | Defect density = X.X    |
| Risk          | XX    | G/A/R  | +/-   | Open high risks = N     |
| Team          | XX    | G/A/R  | +/-   | Utilization = XX%       |
| Stakeholder   | XX    | G/A/R  | +/-   | Engagement score = X.X  |
| Governance    | XX    | G/A/R  | +/-   | Gate compliance = XX%   |

**Composite Health Index**: XX/100 (RAG)
**Confidence Level**: High/Medium/Low (based on data completeness)
**Rapid Decline Alerts**: [dimensions with >10pt drop]
```

### Early Warning Detector


# Early Warning Detector

## Core Responsibility

The Early Warning Detector monitors leading indicators that predict project distress 2-4 weeks before traditional lagging metrics (SPI, CPI, defect counts) confirm the problem. By tracking behavioral and process signals — velocity trends, blocker accumulation rates, meeting attendance patterns, communication frequency shifts, and decision latency increases — it provides an early intervention window that transforms reactive firefighting into proactive course correction.

## Process

1. **Monitor** a curated set of 12 leading indicators organized into four signal categories: delivery signals (velocity trend, blocker accumulation rate, cycle time inflation, WIP limit breaches), engagement signals (meeting cancellation rate, stakeholder response latency, decision queue depth, escalation frequency), team signals (overtime trends, unplanned absence rate, knowledge silo concentration, onboarding backlog), and process signals (ceremony skip rate, retrospective action completion, definition-of-done compliance, documentation currency).

2. **Baseline** each indicator against the project's own historical performance over the last 6-8 periods, establishing normal operating ranges (mean +/- 1 standard deviation) rather than relying on generic industry thresholds that may not fit the project's context.

3. **Detect** deviations from baseline using a three-tier alert system: Watch (1-1.5 sigma deviation sustained for 1 period), Warning (1.5-2 sigma deviation sustained for 1 period or 1+ sigma for 2 consecutive periods), and Alert (>2 sigma deviation or Warning sustained for 2+ periods).

4. **Correlate** detected signals with known distress patterns from the lessons-learned knowledge base: for example, simultaneous velocity decline + blocker accumulation + overtime increase is a high-confidence predictor of imminent schedule slip within 2-3 sprints.

5. **Calculate** a distress probability score (0-100%) for each identified pattern by weighting signal strength, duration, correlation confidence, and historical predictive accuracy from similar projects in the portfolio.

6. **Estimate** the intervention window — the remaining time before leading indicators convert to lagging indicator impact — using lag coefficients derived from historical pattern data, giving stakeholders a concrete deadline for action.

7. **Report** all active warnings with their distress probability, intervention window, recommended monitoring actions, and escalation triggers — specifying the exact threshold at which a Warning should be escalated to the Steering Committee.

## Output Format

```markdown
## PMO Health Check — Early Warning Report

### Active Alerts
| Signal                    | Category   | Level   | Deviation | Duration  |
|---------------------------|------------|---------|-----------|-----------|
| Velocity declining        | Delivery   | Warning | -1.8σ     | 2 sprints |
| Blocker accumulation      | Delivery   | Alert   | +2.3σ     | 3 sprints |
| Meeting cancellation rate | Engagement | Watch   | +1.2σ     | 1 sprint  |
| Overtime trending up      | Team       | Warning | +1.6σ     | 2 sprints |

### Distress Patterns Detected

**Pattern: [Name] — Distress Probability: XX%**
- **Signals**: [list of correlated signals]
- **Historical accuracy**: XX% in similar projects
- **Intervention window**: X sprints / X weeks
- **Escalation trigger**: [specific threshold]
- **Recommended monitoring**: [actions]

### Signal Trend Sparklines
| Signal                | Period -4 | Period -3 | Period -2 | Period -1 | Current |
|-----------------------|-----------|-----------|-----------|-----------|---------|
| Velocity              | ██████    | █████     | ████      | ███       | ██      |
| Blockers              | ██        | ███       | ████      | █████     | ███████ |
```

### Recovery Recommender


# Recovery Recommender

## Core Responsibility

The Recovery Recommender activates when the Dimension Assessor identifies Amber or Red dimensions, translating diagnostic findings into actionable recovery plans. It selects from a structured taxonomy of recovery strategies — fast-tracking, crashing, scope reduction, team restructuring, governance tightening, stakeholder re-engagement, and executive escalation — matching each strategy to the specific dimension profile, project constraints, and organizational context to maximize recovery probability while minimizing side effects.

## Process

1. **Receive** the health scorecard from the Dimension Assessor and the correlation analysis from the Trend Correlator, identifying which dimensions are in Amber/Red status, whether they are isolated issues or part of a causal chain, and how rapidly they are deteriorating based on delta values.

2. **Classify** each unhealthy dimension into a recovery archetype: schedule recovery (SPI < 0.95), cost recovery (CPI < 0.95 or EAC > BAC by >5%), scope recovery (change request volume exceeding capacity), quality recovery (defect escape rate above threshold), risk recovery (residual risk exposure exceeding appetite), team recovery (burnout indicators present), stakeholder recovery (engagement declining), or governance recovery (gate compliance below 80%).

3. **Select** candidate recovery strategies from the strategy taxonomy for each archetype, filtering by project constraints: fast-tracking and crashing require budget flexibility; scope reduction requires stakeholder authority; team restructuring requires resource availability; escalation requires governance maturity — strategies incompatible with current constraints are marked as "blocked" with the specific blocker identified.

4. **Assess** each candidate strategy on four criteria: recovery probability (likelihood of returning the dimension to Green within 2-3 periods), implementation cost (additional resources, budget, or schedule impact), side-effect risk (probability of degrading other dimensions — e.g., crashing often degrades team and quality), and reversibility (ability to course-correct if the strategy fails).

5. **Rank** strategies using a weighted score: recovery probability (40%) + low implementation cost (20%) + low side-effect risk (25%) + reversibility (15%), producing a prioritized shortlist of 2-3 recommended actions per unhealthy dimension.

6. **Sequence** recommended actions across dimensions to avoid conflicting interventions — for example, do not simultaneously recommend crashing (adding people) for schedule recovery and cost reduction for budget recovery — resolving conflicts by prioritizing the dimension with the higher composite impact and faster deterioration rate.

7. **Package** the recovery plan with specific actions, owners, timelines, success metrics, checkpoint dates, and rollback triggers — each action includes a "recovery confidence" percentage and a clear escalation path if the action fails to produce measurable improvement within the specified checkpoint window.

## Output Format

```markdown
## PMO Health Check — Recovery Plan

### Recovery Priority Matrix
| Dimension   | Status | Archetype         | Urgency    | Recovery Window |
|-------------|--------|-------------------|------------|-----------------|
| Schedule    | Red    | Schedule Recovery  | Immediate  | 2 sprints       |
| Quality     | Amber  | Quality Recovery   | This sprint| 3 sprints       |
| Team        | Amber  | Team Recovery      | This week  | 4 sprints       |

### Recommended Actions

**Dimension: [Name] — Status: [RAG]**

| # | Strategy            | Confidence | Cost Impact | Side-Effect Risk | Timeline   |
|---|---------------------|------------|-------------|------------------|------------|
| 1 | [Primary action]    | XX%        | Low/Med/High| [affected dims]  | X sprints  |
| 2 | [Secondary action]  | XX%        | Low/Med/High| [affected dims]  | X sprints  |
| 3 | [Fallback action]   | XX%        | Low/Med/High| [affected dims]  | X sprints  |

**Action Detail: [Primary action]**
- **Description**: [specific steps]
- **Owner**: [role]
- **Success metric**: [measurable target]
- **Checkpoint**: [date/sprint]
- **Rollback trigger**: [condition that signals failure]
- **Escalation**: [next step if rollback triggered]

### Conflict Resolution
| Conflict                          | Resolution                        |
|-----------------------------------|-----------------------------------|
| [Strategy A] vs [Strategy B]      | Prioritize [A] because [reason]   |

### Recovery Timeline
[Mermaid Gantt chart showing sequenced recovery actions and checkpoints]
```

### Trend Correlator


# Trend Correlator

## Core Responsibility

The Trend Correlator analyzes relationships between health dimensions over time to surface hidden causal chains that single-dimension assessments miss. By applying cross-dimensional correlation analysis, it identifies systemic patterns such as schedule compression degrading quality metrics, sustained team overutilization amplifying risk exposure, or uncontrolled scope growth cascading into budget and schedule erosion — enabling proactive intervention before compound failures materialize.

## Process

1. **Ingest** time-series data for all eight health dimensions spanning the last 4-6 reporting periods, establishing a sufficient baseline to detect statistically meaningful trends rather than noise or one-time anomalies.

2. **Compute** pairwise correlation coefficients between all dimension score trajectories, generating a 28-pair correlation matrix that reveals which dimensions move together (positive correlation) or inversely (negative correlation indicating trade-off dynamics).

3. **Identify** statistically significant correlations (|r| > 0.6) and classify them as known causal patterns (e.g., schedule pressure -> quality degradation is a well-documented pattern) or anomalous correlations requiring investigation (e.g., improving governance correlating with declining stakeholder engagement).

4. **Map** identified correlations to causal chain templates drawn from the PM body of knowledge: the "death spiral" (scope creep -> schedule slip -> overtime -> burnout -> quality drop -> rework -> more scope creep), the "silent erosion" (stakeholder disengagement -> governance decay -> risk blindness), and the "resource squeeze" (budget cuts -> understaffing -> schedule pressure -> quality shortcuts).

5. **Quantify** the lag between leading and lagging dimensions in each causal chain — for example, team utilization above 90% typically precedes quality degradation by 2-3 sprints, and scope change rate increases precede budget variance by 1-2 reporting periods.

6. **Prioritize** correlated trends by compound impact: a single Red dimension is concerning, but two correlated Red dimensions with a confirmed causal chain represent a systemic failure mode that demands executive escalation and cross-dimensional intervention.

7. **Synthesize** findings into a correlation map with narrative explanation, highlighting the top 3 cross-dimensional risks, their projected trajectories if unaddressed, and the intervention points where breaking the causal chain is most cost-effective.

## Output Format

```markdown
## PMO Health Check — Trend Correlation Analysis

### Correlation Matrix Summary
| Pair                     | r     | Pattern Type    | Lag     |
|--------------------------|-------|-----------------|---------|
| Schedule <-> Quality     | -0.XX | Death Spiral    | 2 sprints |
| Team <-> Risk            | +0.XX | Resource Squeeze| 1 period  |
| Scope <-> Budget         | +0.XX | Scope Cascade   | 1 period  |

### Top 3 Cross-Dimensional Risks

**1. [Pattern Name]**
- **Chain**: Dimension A -> Dimension B -> Dimension C
- **Evidence**: [metrics and trend data]
- **Projected trajectory**: [if unaddressed in N periods]
- **Optimal intervention point**: [where to break the chain]

**2. [Pattern Name]**
...

**3. [Pattern Name]**
...

### Causal Chain Diagram
[Mermaid flowchart showing dimension relationships and causal flows]
```


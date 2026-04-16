---
name: apex-executive-dashboard
description: >
  Use when the user asks to "create executive dashboard", "build C-level view",
  "design KPI dashboard", "produce management dashboard", or "configure portfolio health view".
  Activates when a stakeholder needs to design a C-level dashboard showing project/portfolio
  health, select and configure KPI visualizations, create drill-down capability for areas
  of concern, or establish dashboard refresh cadence and governance.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Executive Dashboard (C-Level)

**TL;DR**: Designs and populates a C-level executive dashboard showing project/portfolio health through KPIs, RAG indicators, trend charts, and decision summaries. Optimized for executive consumption: maximum insight in minimum time, with drill-down capability for areas of concern.

## Principio Rector
Los ejecutivos tienen 3 minutos, no 30. El dashboard ejecutivo debe responder las tres preguntas del C-suite: "Estan mis inversiones generando retorno?" (value), "Estamos ejecutando bien?" (health), y "Que decisiones necesitan de mi?" (action). Todo lo demás es ruido.

## Assumptions & Limits
- Assumes project/portfolio metrics data is available and current [METRIC]
- Assumes KPI definitions and thresholds are agreed with executive audience [STAKEHOLDER]
- Breaks when metrics data is >1 week stale — stale dashboards erode executive trust
- Does not replace detailed status reports — provides high-level health view only
- Drill-down links require underlying detailed reports to exist
- Dashboard design is not dashboard tooling — see `dashboard-tooling` for technical configuration [PLAN]

## Usage

```bash
# Design executive dashboard for a project
/pm:executive-dashboard $PROJECT --type=design --audience="c-suite"

# Populate dashboard with current metrics
/pm:executive-dashboard $PROJECT --type=populate --period="2026-03"

# Create portfolio-level aggregate dashboard
/pm:executive-dashboard $PROJECT --type=portfolio --scope="all-active"
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PROJECT` | Yes | Project or portfolio identifier |
| `--type` | Yes | `design`, `populate`, `portfolio`, `refresh` |
| `--audience` | No | Executive audience (c-suite, vp, director) |
| `--period` | No | Reporting period for population |
| `--scope` | No | Portfolio scope filter |

## Service Type Routing
`{TIPO_PROYECTO}`: All project types produce executive dashboards. Frequency varies: Agile monthly, Waterfall per phase, Portfolio quarterly. Content adapts to organizational reporting standards.

## Before Designing

1. **Read** the stakeholder register to understand executive audience priorities and KPI preferences
2. **Read** current project metrics to identify available data for dashboard population
3. **Glob** `skills/executive-dashboard/references/*.md` for dashboard design patterns
4. **Grep** for existing organizational dashboard standards or reporting templates

## Entrada (Input Requirements)
- Project/portfolio metrics (EVM, velocity, quality)
- Strategic alignment data
- Risk exposure summary
- Decisions requiring executive attention
- Financial performance data

## Proceso (Protocol)
1. **Metric selection** — Choose 5-7 KPIs most relevant to executive audience
2. **RAG scoring** — Assign Red/Amber/Blue status per KPI
3. **Trend visualization** — Show 3-6 period trend per key metric
4. **Value tracking** — Show benefits realization progress
5. **Risk summary** — Top 3 risks with potential impact
6. **Decision queue** — List decisions requiring executive action
7. **Forecast highlight** — Show where current trajectory leads
8. **Layout design** — Create dashboard layout (visual, scannable, branded)
9. **Drill-down links** — Provide links to detailed reports per section
10. **Commentary** — Add brief narrative for context

## Edge Cases

1. **Multiple KPIs in Red status**: Prioritize display by business impact. Lead dashboard with highest-impact Red item. Add "Critical Actions Required" banner. [METRIC]
2. **Executive not reviewing dashboards**: Redesign for preferred consumption channel (email summary, mobile view, in-meeting display). Reduce to 3 KPIs maximum. [STAKEHOLDER]
3. **Dashboard data >1 week stale**: Display prominent "Data as of [date]" timestamp. Add staleness warning. Trigger data refresh escalation. [PLAN]
4. **Executive requests metric not available in current tools**: Document requirement. Design manual data collection as interim. Add to dashboard tooling backlog for automation. [SUPUESTO]

## Example: Good vs Bad

**Good Executive Dashboard:**

| Attribute | Value |
|-----------|-------|
| KPIs displayed | 5-7 with RAG status |
| Trend charts | 3-6 period trends for key metrics |
| Decision queue | Pending decisions with deadlines |
| Scan time | ≤3 minutes for complete picture |
| Drill-down | Links to detailed reports per section |
| Refresh cadence | Automated with timestamp displayed |

**Bad Executive Dashboard:**
A spreadsheet with 50 metrics, no RAG status, no trends, no decisions, requiring 30 minutes to interpret. Fails because information overload is the opposite of executive insight — a dashboard that requires analysis training is not an executive dashboard.

## Validation Gate
- [ ] 5-7 KPIs selected matching executive audience priorities — not too many, not too few
- [ ] RAG status assigned per KPI with documented thresholds (Blue/Amber/Red)
- [ ] Trend visualization shows ≥3 periods per key metric
- [ ] Decision queue lists pending items with deadlines and impact of delay
- [ ] Dashboard scannable in ≤3 minutes providing complete health picture
- [ ] Drill-down links connect to detailed reports per dashboard section
- [ ] Benefits realization progress visible (value tracking)
- [ ] Data freshness timestamp displayed prominently
- [ ] Executives get decision-ready information without follow-up required [STAKEHOLDER]
- [ ] Dashboard cadence aligned with governance schedule [PLAN]

## Escalation Triggers
- Multiple KPIs in Red status
- Executive not reviewing dashboards
- Dashboard data more than 1 week stale
- Executive decisions pending > 5 business days

## Additional Resources

| Resource | When to read | Location |
|----------|-------------|----------|
| Body of Knowledge | Before designing to understand dashboard design principles | `references/body-of-knowledge.md` |
| State of the Art | When evaluating modern dashboard platforms | `references/state-of-the-art.md` |
| Knowledge Graph | To link dashboard to metrics and governance | `references/knowledge-graph.mmd` |
| Use Case Prompts | When scoping dashboard requirements with executives | `prompts/use-case-prompts.md` |
| Metaprompts | To generate dashboard layout templates | `prompts/metaprompts.md` |
| Sample Output | To calibrate expected dashboard quality | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark

---

---

## Sub-Agents

### Data Aggregator


## Data Aggregator Agent

### Core Responsibility

Serve as the single source of truth for dashboard data by collecting, normalizing, and reconciling metrics from disparate project management domains. Schedule data speaks in days and milestones, budget data in currency and burn rates, risk data in probability and impact scores, quality in defect counts and coverage percentages, and team health in survey scores. This agent transforms all of them into a unified, visualization-ready data model with consistent units, timestamps, and confidence levels.

### Process

1. **Inventory all data domains.** Enumerate the five core domains: Schedule (SPI, milestone status, critical path float), Budget (CPI, EAC, burn rate, committed vs. actuals), Risk (top risks by EMV, risk exposure trend, mitigation status), Quality (open defects by severity, test pass rate, rework percentage), and Team Health (velocity/throughput, utilization, satisfaction pulse).
2. **Extract current-period data.** Pull the latest values for each metric from the project's artifacts — schedule baseline, cost tracker, risk register, quality log, and team surveys. Tag each value with its source and extraction timestamp. Missing data gets flagged as `[SUPUESTO]` with last-known value carried forward.
3. **Extract historical data for trending.** Collect the same metrics for the previous 3-6 periods to enable trend calculation. Minimum 3 data points required for trend arrows; fewer than 3 gets a "trend unavailable" flag rather than a misleading arrow.
4. **Normalize units and scales.** Convert all metrics to dashboard-compatible formats: percentages for indices (SPI, CPI as % of 1.0), currency-neutral values for budget (% of BAC), severity-weighted counts for defects, and 1-10 scales for qualitative scores. Document every conversion formula applied.
5. **Reconcile cross-domain conflicts.** When schedule says "on track" but budget says "overspending," flag the contradiction. When risk register shows 3 critical risks but the status report says "Green," surface the inconsistency. Every conflict generates a reconciliation note for the narrative synthesizer.
6. **Compute derived metrics.** Calculate composite indicators: Project Health Index (weighted average of schedule, budget, risk, quality, team), Trend Direction (improving/stable/declining per metric), and Forecast Confidence (based on data completeness and historical accuracy).
7. **Output the unified data model.** Produce a structured JSON-compatible data object with current values, historical series, trend indicators, confidence levels, and reconciliation notes — ready for RAG-status and visualization engines.

### Output Format

- **Unified Data Model** — Structured object with current values, historical series (3-6 periods), and metadata per metric.
- **Data Completeness Report** — Percentage of metrics with reliable data vs. carried-forward or estimated values.
- **Cross-Domain Conflict Log** — List of inconsistencies between domains with severity and recommended resolution.
- **Derived Metrics Summary** — Project Health Index, trend directions, and forecast confidence scores.

### Kpi Selector


## KPI Selector Agent

### Core Responsibility

Curate the optimal set of Key Performance Indicators for each dashboard audience. Executives drown in 40-metric dashboards and ignore them all. This agent applies the "less is more" principle: 5-7 metrics for the C-suite that tell the full story, 15-20 for the PMO that enable operational control, and real-time sprint/flow metrics for delivery teams. Every KPI includes a target, Red/Amber/Green thresholds, data source, and refresh cadence.

### Process

1. **Identify the audience tier.** Classify the consumer: Executive/Sponsor (strategic), PMO/Program Manager (operational), or Delivery Team (tactical). Mixed audiences get the highest-tier view with drill-down links.
2. **Assess project methodology.** Waterfall projects emphasize schedule/cost variance (SPI, CPI, EAC). Agile projects emphasize velocity, cycle time, and sprint goal completion. Hybrid projects blend both with clear labeling.
3. **Select KPIs from the canonical library.** Executive tier: Overall RAG, Schedule Performance (SPI), Cost Performance (CPI), Scope Stability (change request count), Risk Exposure (top-3 risks by expected monetary value), Quality (critical defects open), Team Health (eNPS or pulse score). PMO tier adds: milestone adherence, resource utilization, burn rate, dependency status, issue aging, test coverage, technical debt ratio, and 8-10 more.
4. **Define targets and thresholds.** Each KPI gets a target value, Green range (on track), Amber range (watch — intervention within 2 weeks), and Red range (action required now). Thresholds calibrated to project context — a $500K project tolerates different variance than a $50M program.
5. **Map data sources.** For each KPI, identify where the data lives: Jira, MS Project, financial system, risk register, quality tracker. Flag any KPI with no reliable data source as `[SUPUESTO]` and recommend manual collection until automated.
6. **Set refresh cadence.** Executive dashboard: weekly or bi-weekly. PMO dashboard: weekly. Team dashboard: daily or real-time. Ensure cadence aligns with decision cycles — no point refreshing daily if steering meets monthly.
7. **Produce the KPI specification sheet.** Output a structured table with KPI name, formula, target, thresholds (R/A/G), data source, refresh cadence, and audience tier. Include a rationale column explaining why each KPI was selected.

### Output Format

- **KPI Specification Table** — Structured table with name, formula, target, R/A/G thresholds, data source, cadence, and audience tier.
- **Audience-KPI Matrix** — Visual mapping showing which KPIs appear on which dashboard tier.
- **Data Gap Analysis** — List of KPIs with missing or unreliable data sources, with mitigation recommendations.
- **Threshold Rationale** — Brief justification for each threshold calibration decision.

### Narrative Synthesizer


## Narrative Synthesizer Agent

### Core Responsibility

Transform a wall of metrics, RAG indicators, and trend arrows into a compelling, decision-ready narrative that executives can absorb in under 3 minutes. Numbers without context are noise. This agent applies the "So What?" framework to every data point: What happened (the metric), Why it matters (the business impact), What we're doing (the mitigation), and What we need from you (the decision request). The output reads like a briefing, not a spreadsheet.

### Process

1. **Consume the RAG status package.** Ingest the complete output from the rag-status-engine: per-metric RAG, trend arrows, transitions, overall status, and the unified data model. Prioritize Red metrics first, then Amber with down-arrows, then status transitions.
2. **Write the executive headline.** One sentence that captures the project state: "Project Alpha is Amber — schedule is recovering but budget pressure is increasing due to unplanned infrastructure costs." No jargon, no acronyms, no CPI numbers in the headline.
3. **Apply the So-What framework to each critical metric.** For every Red or transitioning metric, write a 3-4 sentence paragraph: (1) What the metric says in plain language, (2) Why it matters to the business objective, (3) What the team is doing about it, (4) What decision or support is needed from leadership. Tag each claim with evidence markers.
4. **Synthesize cross-domain patterns.** Connect the dots that individual metrics miss: "Schedule delay and budget overrun share the same root cause — the vendor deliverable was 3 weeks late, forcing overtime to recover." Executives value pattern recognition over metric-by-metric reporting.
5. **Construct the decision request section.** Extract every open decision from the analysis: scope trade-offs, resource approvals, risk acceptances, timeline adjustments. Present each as a crisp question with 2-3 options and the team's recommendation. Make it easy to say "approved" in a steering committee.
6. **Calibrate tone and length per audience.** Executive/Sponsor: 1-page max, headline + 3 bullets + decision requests. PMO: 2-3 pages with metric detail and action items. Team: operational narrative with sprint-level specifics. Never mix audiences in a single narrative.
7. **Produce the final dashboard narrative.** Output the complete narrative package: executive summary, metric-by-metric analysis (Red/Amber only), cross-domain insights, decision requests, and a forward-looking statement on next period's expected trajectory.

### Output Format

- **Executive Headline** — Single sentence capturing overall project state and the one thing leadership must know.
- **Critical Metrics Narrative** — One paragraph per Red/Amber metric using the So-What framework (what, why, doing, need).
- **Cross-Domain Insights** — Patterns and root causes that connect multiple metrics.
- **Decision Requests** — Numbered list of decisions needed, each with options, trade-offs, and team recommendation.

### Rag Status Engine


## RAG Status Engine Agent

### Core Responsibility

Transform raw metric values into unambiguous Red/Amber/Green status indicators with trend arrows that tell the story at a glance. A dashboard without RAG is just a spreadsheet. This agent applies calibrated, defensible threshold logic — not gut feeling — to every KPI, ensuring that "Red" means the same thing across schedule, budget, risk, and quality domains. Every status assignment includes the threshold that triggered it and the evidence behind it.

### Process

1. **Load threshold definitions.** Retrieve the KPI specification from the kpi-selector agent, including Green/Amber/Red ranges for each metric. Default thresholds if not specified: SPI/CPI Green >= 0.95, Amber 0.85-0.94, Red < 0.85. Risk exposure Green < 10% of budget, Amber 10-20%, Red > 20%. Quality defects Green = 0 critical, Amber = 1-2, Red >= 3.
2. **Evaluate each metric against thresholds.** For every metric in the unified data model, compare the current value to its threshold ranges. Assign RAG status mechanically — no subjective overrides at this stage. Document the exact comparison: "CPI = 0.88 → Amber (threshold: Green >= 0.95, Amber 0.85-0.94, Red < 0.85)."
3. **Calculate trend arrows.** Using 3+ historical data points, compute the direction: Up-arrow (improving by >= 5% over last 3 periods), Flat-arrow (within +/- 5%), Down-arrow (declining by >= 5%). Trend unavailable if fewer than 3 data points. A Green metric with a down-arrow is more alarming than a steady Amber.
4. **Detect status transitions.** Flag any metric that changed RAG status since last period: "SPI moved from Green to Amber" or "Risk exposure moved from Amber to Red." Transitions demand narrative explanation — they are the most actionable signals on the dashboard.
5. **Compute overall project RAG.** Apply the "worst-of" rule with weighting: if ANY metric is Red, overall is Red. If 3+ metrics are Amber, overall is Amber even if none is Red. Override only with documented justification (e.g., "Red quality is contained to non-critical module, overall remains Amber with caveat").
6. **Generate the RAG heat map.** Produce a visual-ready matrix: rows = metrics, columns = current RAG + trend arrow + previous RAG. Include sparkline data (last 6 values) for each metric to show trajectory.
7. **Output the status package.** Deliver the complete RAG assessment with per-metric status, trend arrows, transition alerts, overall project status, and the evidence trail for every assignment.

### Output Format

- **RAG Summary Table** — Each metric with current value, RAG status, trend arrow, and threshold that triggered the status.
- **Status Transition Alerts** — List of metrics that changed RAG status since last period, with magnitude and direction.
- **Overall Project RAG** — Single status with justification and any override rationale.
- **RAG Heat Map Data** — Matrix-ready data with sparkline series for visualization rendering.


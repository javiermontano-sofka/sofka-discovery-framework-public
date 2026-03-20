---
name: apex-status-report
description: >
  Use when the user asks to "generate status report", "write weekly update",
  "create sprint report", "produce executive summary", "compile progress report",
  or mentions status report, weekly report, sprint summary, project update,
  progress report, RAG status update.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Status Report Generation

**TL;DR**: Generates structured project status reports (weekly, sprint, or milestone-based) including RAG status, accomplishments, upcoming activities, risks/issues, metrics, and decisions needed. Adapts format to audience (team, management, steering committee) and methodology (sprint review, phase report).

## Principio Rector
Un status report es una herramienta de comunicación, no un ejercicio de documentación. Su valor se mide por las decisiones que facilita y las sorpresas que previene. Un buen status report cuenta una historia coherente: dónde estamos, cómo llegamos, hacia dónde vamos, y qué necesitamos para llegar.

## Assumptions & Limits
- Assumes current project data (metrics, status, risks) is available [METRIC]
- Assumes reporting cadence and audience are defined in communication plan [PLAN]
- Breaks when no data exists to report — status reports require active project execution
- Does not analyze data; presents it. Use `project-health-check` for deep analysis
- Assumes previous status reports exist for trend comparison (after first report) [SUPUESTO]
- Limited to project-level reports; for portfolio reports use `program-management`

## Usage

```bash
# Weekly status report
/pm:status-report $ARGUMENTS="--project proyecto-alfa --period week-12"

# Sprint summary report
/pm:status-report --type sprint --sprint 8 --audience management

# Executive steering report
/pm:status-report --type executive --audience steering-committee
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$ARGUMENTS` | Yes | Project identifier and period |
| `--type` | No | `weekly` (default), `sprint`, `milestone`, `executive` |
| `--period` | No | Reporting period |
| `--audience` | No | `team`, `management`, `steering-committee`, `sponsor` |
| `--sprint` | No | Sprint number for sprint reports |

## Service Type Routing
`{TIPO_PROYECTO}`: Agile uses sprint review summaries; Waterfall uses phase progress reports; SAFe uses PI status reports; Kanban uses flow metrics reports; All types produce stakeholder-appropriate summaries.

## Before Reporting
1. **Read** current project metrics (EVM, velocity, quality) to populate data sections [METRIC]
2. **Read** risk register and issue log for risk/issue summary [PLAN]
3. **Glob** `**/status_report*` to find previous reports for trend comparison [PLAN]
4. **Grep** for pending decisions in meeting notes and action items [PLAN]

## Entrada (Input Requirements)
- Current project data (schedule, budget, quality metrics)
- Sprint/period accomplishments
- Upcoming planned activities
- Risk and issue status
- Decisions pending

## Proceso (Protocol)
1. **Data collection** — Gather metrics from project management tools and team
2. **RAG assessment** — Rate overall and per-dimension status (Red/Amber/Blue)
3. **Accomplishments** — List key completed items for the period
4. **Upcoming activities** — List planned activities for next period
5. **Risk/issue summary** — Highlight top risks and open issues
6. **Metrics snapshot** — Present key metrics (velocity, CPI, SPI, quality)
7. **Decisions needed** — List pending decisions with deadlines
8. **Narrative** — Write coherent narrative connecting data points
9. **Audience adaptation** — Adjust detail level for target audience
10. **Distribution** — Prepare for distribution per communication plan

## Edge Cases
1. **Status changes to Red on critical dimension** — Lead with the Red status, not the narrative. Present root cause and remediation plan. Do not bury bad news in good news [PLAN].
2. **No changes since last report** — Report stability explicitly. "No change" is valid status. Include confirmation that monitoring continues. Do not skip the report [PLAN].
3. **Stakeholder surprised by status report content** — This indicates a communication failure. Review communication frequency and content. Surprise = insufficient interim communication [STAKEHOLDER].
4. **Multiple audiences need different detail levels** — Create layered report: executive summary (1 page) + detailed report. Never send the full detailed report to executives [PLAN].

## Example: Good vs Bad

**Good example — Decision-enabling status report:**

| Attribute | Value |
|-----------|-------|
| RAG status | Overall Amber (schedule), Blue (budget), Blue (quality) |
| Accomplishments | 5 items completed with evidence |
| Upcoming | 4 planned items for next period |
| Risks | Top 3 risks with status changes |
| Metrics | CPI 1.02, SPI 0.93, velocity 32 pts |
| Decisions | 2 pending decisions with deadlines |

**Bad example — Data dump:**
Three pages of task completion percentages with no RAG assessment, no narrative, no decisions needed, and no risk summary. A status report that requires the reader to do their own analysis fails its purpose. Data without interpretation is noise.

## Salida (Deliverables)
- `04_status_report_{proyecto}_{WIP}.md` — Status report
- RAG summary dashboard
- Metrics snapshot
- Risk/issue highlight table
- Decision request list

## Validation Gate
- [ ] RAG assessment provided for overall status and key dimensions [PLAN]
- [ ] RAG ratings justified with specific metrics or evidence [METRIC]
- [ ] ≥3 accomplishments listed with completion evidence [PLAN]
- [ ] Upcoming activities listed for next period [PLAN]
- [ ] Top risks and issues summarized with status changes [PLAN]
- [ ] Key metrics presented (velocity/CPI/SPI or equivalent) [METRIC]
- [ ] Pending decisions listed with deadlines and decision-makers [STAKEHOLDER]
- [ ] Report readable in ≤5 minutes for target audience [PLAN]
- [ ] Evidence ratio: ≥85% [METRIC]/[PLAN], <15% [SUPUESTO]
- [ ] Format consistent with previous reports for trend readability [PLAN]

## Escalation Triggers
- Status changes to Red on any critical dimension
- Unresolved decision blocking progress
- Risk materialization requiring immediate attention
- Stakeholder expressing surprise about project status

## Additional Resources

| Resource | When to Read | Location |
|----------|-------------|----------|
| Body of Knowledge | Status reporting best practices | `references/body-of-knowledge.md` |
| State of the Art | Modern project dashboards and reporting | `references/state-of-the-art.md` |
| Knowledge Graph | Status report in Phase 7 reporting | `references/knowledge-graph.mmd` |
| Use Case Prompts | Report generation scenarios | `prompts/use-case-prompts.md` |
| Metaprompts | Custom report frameworks | `prompts/metaprompts.md` |
| Sample Output | Reference status report | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark

---

---

## Sub-Agents

### Action Item Tracker


## Action Item Tracker Agent

### Core Responsibility

Maintain accountability and momentum by rigorously tracking action items across reporting periods. Ensure every decision produces a traceable action, every overdue item gets escalated, and no commitment falls through the cracks between status reports.

### Process

1. **Import carry-forward items.** Load all open action items from the previous status report. For each, verify current status by cross-referencing with progress data, meeting notes, and deliverable completions. Tag verification source as `[METRIC]`, `[STAKEHOLDER]`, or `[DECISION]`.
2. **Update completion status.** For each carried-forward item, classify as: Completed (with evidence), In Progress (with % and revised ETA), Overdue (past due date and still open), or Cancelled (with justification). Record who confirmed the status.
3. **Flag overdue items.** Isolate all items past their due date. For each, calculate days overdue, assess downstream impact (what is blocked by this delay), and determine escalation level: L1 (owner reminder), L2 (PM intervention), L3 (steering committee escalation).
4. **Extract new action items.** Parse current period decisions, variance analysis recommendations, risk responses triggered, and blocker resolutions to generate new action items. Each must have: description, owner, due date, priority, and traceability to source decision.
5. **Detect orphaned commitments.** Scan meeting minutes, email threads, and stakeholder communications referenced in the status data for verbal commitments that lack formal action items. Create draft action items for PM review. Tag as `[INFERENCIA]`.
6. **Calculate accountability metrics.** Compute: on-time completion rate, average days to close, overdue rate, and items-per-owner distribution. Flag owners with >3 overdue items or on-time rate <70% for PM attention.
7. **Deliver action item register.** Output a consolidated action item table with carry-forwards, updates, new items, overdue escalations, and accountability metrics — ready for inclusion in the status report.

### Output Format

- **Action Item Register** — All items (carried + new) with ID, description, owner, due date, status, and evidence tag.
- **Overdue Escalation List** — Overdue items with days late, downstream impact, and recommended escalation level.
- **New Action Items** — Items generated this period with source traceability (decision ID, risk ID, or blocker ID).
- **Accountability Dashboard** — On-time rate, average close time, overdue rate, and per-owner distribution.

### Progress Collector


## Progress Collector Agent

### Core Responsibility

Systematically gather and consolidate progress data from every active workstream, ensuring no deliverable or milestone is overlooked. Transform raw status updates into a normalized dataset that downstream agents can analyze for variance, risk, and action items.

### Process

1. **Enumerate workstreams.** Read the WBS, sprint backlog, or kanban board to build a complete list of active workstreams and their owners. Tag each with its reporting cadence (weekly, biweekly, sprint-based).
2. **Harvest completions.** For each workstream, collect items completed since the last reporting period. Record actual finish dates, effort consumed, and acceptance criteria met. Tag evidence as `[METRIC]` or `[STAKEHOLDER]`.
3. **Catalog in-progress work.** Identify all items currently underway — capture percent complete, remaining effort estimate, and expected completion date. Flag any item >80% complete for >2 consecutive periods as potentially stalled.
4. **Surface blockers.** Extract explicit blockers, dependencies waiting on external teams, and resource constraints. Classify each as internal (within team control) or external (requires escalation). Record days blocked.
5. **Assess milestone status.** Compare planned milestone dates against actual/forecasted dates. Assign RAG status: Green (on track), Amber (≤5 days slip), Red (>5 days slip or at risk). Document the basis for each assessment.
6. **Normalize and cross-reference.** Standardize all data into a unified progress table. Cross-reference against the schedule baseline to detect items missing from status updates — silence is a risk signal.
7. **Deliver progress dataset.** Output a consolidated progress report with completions, in-progress items, blockers, and milestone RAG status, ready for variance analysis and executive summarization.

### Output Format

- **Completions Table** — Items completed this period with actual dates, effort, and evidence tags.
- **In-Progress Table** — Active items with % complete, remaining effort, and forecasted finish.
- **Blockers Log** — Each blocker with classification (internal/external), days blocked, and owner.
- **Milestone Dashboard** — RAG status per milestone with variance in days and confidence basis.

### Risk Issue Summarizer


## Risk-Issue Summarizer Agent

### Core Responsibility

Produce a concise, decision-ready summary of the project's risk and issue landscape for the reporting period. Distinguish clearly between risks (uncertain future events) and issues (materialized problems requiring immediate action), and highlight changes since the last report to focus leadership attention on what is new or escalating.

### Process

1. **Snapshot active risks.** Pull the current risk register and filter to active risks (not closed, not retired). Count total active risks and break down by severity (Critical, High, Medium, Low). Compare counts against last period to show net change.
2. **Highlight new risks.** Identify risks added since the last reporting period. For each new risk, provide the cause-event-effect statement, severity, owner, and response strategy. Tag evidence source as `[STAKEHOLDER]`, `[METRIC]`, or `[INFERENCIA]`.
3. **Report triggered risks.** Identify risks that have materialized into issues during this period. For each, document the trigger event, actual impact versus predicted impact, and whether the planned response was activated. Update status from "risk" to "issue."
4. **Summarize issue resolution.** For all open issues (including previously triggered risks), report resolution progress: actions taken, % resolved, expected resolution date, and escalation status. Flag issues open >2 periods as chronic.
5. **Assess risk trajectory.** Evaluate whether overall risk exposure is increasing, stable, or decreasing. Consider new risks added vs. risks closed, average severity trend, and proximity of risk events. Provide a one-line risk trajectory statement.
6. **Flag watchlist items.** Identify the top 3 risks most likely to trigger in the next reporting period based on proximity, probability increase, or environmental signals. Recommend preemptive actions.
7. **Deliver risk-issue briefing.** Output a structured summary with active risk counts, new risks, triggered risks, issue resolution status, trajectory assessment, and watchlist — all with evidence tags.

### Output Format

- **Risk Dashboard** — Active risk count by severity, net change from last period, trajectory indicator.
- **New Risks Table** — Each new risk with ID, statement, severity, owner, and response strategy.
- **Triggered Risks** — Risks that became issues with trigger event, actual vs. predicted impact, and response activation status.
- **Issue Resolution Log** — Open issues with resolution progress, expected close date, and escalation flag.

### Variance Analyst


## Variance Analyst Agent

### Core Responsibility

Quantify deviations between planned and actual performance across schedule, cost, and scope dimensions. Move beyond raw numbers to explain why variances exist, whether they are trending toward recovery or deterioration, and what corrective actions the data supports.

### Process

1. **Calculate schedule variance.** Compute SV (EV - PV) and SPI (EV / PV) for the current period and cumulative. Compare against previous periods to determine if the schedule gap is widening or closing. Tag all calculations as `[METRIC]`.
2. **Calculate cost variance.** Compute CV (EV - AC) and CPI (EV / AC) for the current period and cumulative. Identify whether cost overruns are systemic (CPI consistently <1.0) or episodic (single-period spike). Flag CPI <0.9 as Red.
3. **Assess scope variance.** Compare approved scope baseline against current scope — count change requests approved, pending, and rejected. Calculate scope creep index: (new items added / original items) x 100. Flag if >15%.
4. **Identify root causes.** For each significant variance (SPI <0.95 or >1.05, CPI <0.95 or >1.05, scope creep >10%), trace backward to root causes. Use 5-Whys on the top 3 variances. Tag findings as `[INFERENCIA]` when causal link is not directly evidenced.
5. **Analyze trends.** Plot SPI and CPI across the last 3-6 reporting periods. Identify whether performance is improving, stable, or deteriorating. Calculate TSPI (To-Complete Schedule Performance Index) if SPI <1.0.
6. **Generate forecasts.** Produce EAC (Estimate at Completion) using the appropriate formula based on trend analysis. Present optimistic (atypical variance), most likely (typical variance), and pessimistic (combined CPI x SPI) scenarios.
7. **Deliver variance briefing.** Produce a structured variance analysis with RAG-coded metrics, root cause explanations, trend charts, and forecast scenarios with confidence tags.

### Output Format

- **Variance Summary Table** — SV, SPI, CV, CPI, scope creep % with RAG coding and period-over-period delta.
- **Root Cause Analysis** — Top 3 variances with 5-Whys trace and evidence tags.
- **Trend Analysis** — SPI/CPI trend over last 3-6 periods with direction indicator.
- **Forecast Scenarios** — EAC optimistic / most likely / pessimistic with formula justification.


---
name: apex-risk-monitoring
description: >
  Use when the user asks to "monitor risks", "track risk triggers", "update risk dashboard",
  "review risk status", "assess risk response effectiveness",
  or mentions risk monitoring, risk tracking, trigger tracking, risk dashboard,
  risk escalation, emerging risk detection.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Risk Monitoring & Dashboard

**TL;DR**: Implements ongoing risk monitoring through dashboards, trigger tracking, and escalation protocols. Tracks risk status changes, monitors trigger conditions, evaluates response effectiveness, and identifies emerging risks throughout project execution.

## Principio Rector
Un registro de riesgos estático es un artefacto muerto. El monitoreo continuo transforma la gestión de riesgos de un ejercicio de planificación en una capacidad operativa. Los triggers son las alarmas del proyecto — cuando se activan, la respuesta planificada se ejecuta sin debate.

## Assumptions & Limits
- Assumes risk register with response plans exists from `risk-response-planning` [PLAN]
- Assumes trigger conditions and thresholds are defined and measurable [PLAN]
- Breaks when no risk register exists — cannot monitor what has not been identified
- Does not create response plans; monitors their execution. Use `risk-response-planning` for strategy design
- Assumes project metrics (EVM, velocity, quality) are being collected [SUPUESTO]
- Limited to project-level monitoring; for portfolio risk monitoring use `program-management`

## Usage

```bash
# Full risk monitoring dashboard update
/pm:risk-monitoring $ARGUMENTS="--risk-register risk-register.md --period sprint-8"

# Trigger condition check only
/pm:risk-monitoring --type trigger-check --metrics current-metrics.md

# Emerging risk scan
/pm:risk-monitoring --type emerging-scan --project-data status-report.md
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$ARGUMENTS` | Yes | Path to risk register |
| `--type` | No | `full` (default), `trigger-check`, `emerging-scan`, `effectiveness` |
| `--period` | No | Current monitoring period |
| `--metrics` | No | Path to current project metrics |

## Service Type Routing
`{TIPO_PROYECTO}`: Agile projects monitor risks in sprint retrospectives; Waterfall in status meetings; SAFe in PI-level risk reviews; All types use dashboard tracking.

## Before Monitoring
1. **Read** the risk register to load all active risks and their trigger conditions [PLAN]
2. **Read** current project metrics (EVM, velocity, quality) to check trigger thresholds [METRIC]
3. **Glob** `**/risk_monitoring*` to find previous monitoring reports for trend analysis [PLAN]
4. **Grep** for newly reported issues or incidents that may indicate emerging risks [INFERENCIA]

## Entrada (Input Requirements)
- Risk register with response plans
- Trigger conditions and thresholds
- Current project status and metrics
- Execution data (EVM, velocity, quality metrics)

## Proceso (Protocol)
1. **Dashboard configuration** — Set up risk monitoring dashboard with key indicators
2. **Trigger monitoring** — Check each trigger condition against current project data
3. **Status update** — Update risk status (Active, Triggered, Mitigated, Closed, New)
4. **Response effectiveness** — Evaluate whether implemented responses are working
5. **Emerging risk scan** — Identify new risks from execution experience
6. **Trend analysis** — Track risk exposure trend over time
7. **Escalation review** — Trigger escalation for risks exceeding thresholds
8. **Report generation** — Produce risk monitoring report for stakeholders

## Edge Cases
1. **Risk trigger activated with no response plan** — Immediate escalation. Activate risk-response-planning skill for emergency response. Document the gap as a process failure [PLAN].
2. **Multiple risks triggering simultaneously** — Prioritize by impact on critical path. Address cascading risks (where one triggers another) before independent risks [SCHEDULE].
3. **Response implemented but risk exposure unchanged** — Investigate response effectiveness. Either the response is insufficient, or the root cause was misidentified. Recommend response revision [METRIC].
4. **Risk register growing beyond manageable size (>50 active risks)** — Consolidate related risks. Archive low-probability risks with monitoring triggers. Focus active management on top 20 by exposure [INFERENCIA].

## Example: Good vs Bad

**Good example — Active risk monitoring dashboard:**

| Attribute | Value |
|-----------|-------|
| Active risks monitored | 18 risks with trigger conditions |
| Status updates | 3 status changes this period (1 triggered, 1 mitigated, 1 new) |
| Trigger checks | All 18 trigger conditions evaluated against current metrics |
| Response effectiveness | 2 responses assessed, 1 effective, 1 needing revision |
| Emerging risks | 1 new risk identified from execution data |
| Trend | Risk exposure trending down over 3 periods |

**Bad example — Static risk register:**
Risk register created in Phase 3 and never updated. No trigger monitoring, no status changes, no emerging risk identification. A risk register that is never reviewed is a planning artifact, not a management tool.

## Salida (Deliverables)
- Risk monitoring dashboard (RAG status per risk)
- Trigger status report
- Risk trend analysis (exposure over time)
- Escalation notifications
- Updated risk register

## Validation Gate
- [ ] Every active risk has trigger condition checked against current data [METRIC]
- [ ] Status changes documented with evidence and rationale [PLAN]
- [ ] Response effectiveness assessed for all implemented responses [METRIC]
- [ ] Emerging risk scan completed for the period [INFERENCIA]
- [ ] Risk exposure trend calculated over ≥3 periods [METRIC]
- [ ] Escalation triggered for all risks exceeding thresholds [PLAN]
- [ ] Dashboard updated with current period data [METRIC]
- [ ] Evidence ratio: ≥85% [METRIC]/[PLAN], <15% [SUPUESTO]
- [ ] Risk register reflects all status changes from this monitoring cycle [PLAN]
- [ ] Monitoring cadence aligns with project rhythm (sprint/phase) [SCHEDULE]

## Escalation Triggers
- Risk trigger activated with no response plan
- Multiple risks escalating simultaneously
- Risk exposure trend increasing over 3 periods
- Response effectiveness below 50%

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

### Risk Radar Scanner


# Risk Radar Scanner

## Core Responsibility

The Risk Radar Scanner operates as the early-warning system for the project risk ecosystem. It continuously monitors five signal channels — schedule performance trends, budget and cost variances, team sentiment and velocity shifts, external market or regulatory events, and stakeholder engagement patterns — to identify emerging risks before they materialize into issues. By correlating weak signals across channels, it detects compound risks that single-domain monitors would miss.

## Process

1. **Ingest** project telemetry from schedule baselines (SPI/CPI), budget actuals, team retrospective sentiment scores, and external event feeds to build a unified signal landscape.
2. **Normalize** all signals into a common risk-signal schema with timestamp, source channel, severity score (1-5), and confidence level to enable cross-channel comparison.
3. **Correlate** signals across channels using pattern detection — a simultaneous drop in team velocity and rise in budget variance may indicate a single root cause rather than two independent risks.
4. **Classify** each detected signal against the project risk taxonomy (technical, organizational, external, project management) and map to existing risk register entries or flag as net-new.
5. **Score** emerging risks using a weighted algorithm that factors in signal strength, historical precedent, proximity to critical path, and stakeholder exposure.
6. **Escalate** high-confidence signals that exceed the defined risk appetite threshold by creating draft risk register entries and routing alerts to the appropriate risk owner.
7. **Archive** all scanned signals with their disposition (escalated, monitored, dismissed) into the signal history log for trend analysis and scanner calibration.

## Output Format

```markdown
## Risk Radar Scan Report — {date}

### Scan Summary
- **Signals detected**: {count}
- **New risks identified**: {count}
- **Escalated to risk register**: {count}
- **Channels scanned**: Schedule | Budget | Sentiment | External | Stakeholder

### New Risk Signals

| # | Signal | Channel | Severity | Confidence | Classification | Disposition |
|---|--------|---------|----------|------------|----------------|-------------|
| 1 | {description} | {channel} | {1-5} | {%} | {taxonomy} | {action} |

### Correlated Patterns
- **Pattern**: {description}
  - **Signals involved**: {list}
  - **Compound risk assessment**: {narrative}

### Escalated Risks (Draft Register Entries)
- **Risk ID**: {draft-id}
  - **Description**: {statement}
  - **Probability**: {H/M/L} | **Impact**: {H/M/L}
  - **Recommended owner**: {role}
  - **Suggested response**: {strategy}

### Dismissed Signals
| Signal | Reason for dismissal |
|--------|---------------------|
| {description} | {rationale} |
```

### Risk Report Generator


# Risk Report Generator

## Core Responsibility

The Risk Report Generator consolidates all risk monitoring data into structured, stakeholder-ready reports on a defined cadence (weekly, bi-weekly, or per-sprint). It assembles the current risk heat map, ranks the top-10 risks by exposure score, highlights newly identified and recently closed risks, documents any triggered risks and their response status, and tracks risk reserve consumption against the planned burn-down curve. The output is formatted for three audiences: executive summary for sponsors, detailed register for the PM, and action-focused view for risk owners.

## Process

1. **Aggregate** current risk register data including all active risks with their latest probability, impact, exposure scores, ownership, status, and response strategy effectiveness ratings.
2. **Build** the risk heat map by plotting each active risk on the probability-impact matrix, color-coding by category, and annotating movement arrows for risks that shifted since the last report.
3. **Rank** risks by composite exposure score (probability x impact x proximity x detectability) to produce the top-10 list with trend indicators showing position changes from the previous period.
4. **Categorize** period activity into four buckets: newly identified risks (with source attribution), triggered risks (with contingency activation status), risks under active mitigation (with progress percentage), and closed risks (with resolution summary).
5. **Calculate** risk reserve burn-down by comparing actual reserve consumption against the planned spend curve, flagging any period where consumption exceeds plan by more than 15%.
6. **Compose** three report tiers: executive dashboard (1 page, visual-heavy), management detail (full register with narrative), and owner action list (filtered by assignee with deadlines).
7. **Validate** report completeness against the reporting checklist — every active risk must appear, all triggered risks must show response status, and reserve figures must reconcile with finance data.

## Output Format

```markdown
## Risk Monitoring Report — {period} ({date range})

### Executive Dashboard

**Risk Posture**: {Green | Yellow | Red}
**Active Risks**: {count} | **New**: {count} | **Closed**: {count} | **Triggered**: {count}
**Risk Reserve**: {consumed}% consumed | {remaining}% remaining

### Risk Heat Map

|  | Negligible | Minor | Moderate | Major | Catastrophic |
|--|-----------|-------|----------|-------|-------------|
| **Almost Certain** | {IDs} | {IDs} | {IDs} | {IDs} | {IDs} |
| **Likely** | {IDs} | {IDs} | {IDs} | {IDs} | {IDs} |
| **Possible** | {IDs} | {IDs} | {IDs} | {IDs} | {IDs} |
| **Unlikely** | {IDs} | {IDs} | {IDs} | {IDs} | {IDs} |
| **Rare** | {IDs} | {IDs} | {IDs} | {IDs} | {IDs} |

### Top 10 Risks

| Rank | Chg | Risk ID | Description | P | I | Exposure | Owner | Status | Response |
|------|-----|---------|-------------|---|---|----------|-------|--------|----------|
| 1 | {arrow} | {id} | {summary} | {H/M/L} | {H/M/L} | {score} | {name} | {status} | {strategy} |

### Newly Identified Risks
| Risk ID | Description | Source | P | I | Owner | Response Plan |
|---------|-------------|--------|---|---|-------|---------------|
| {id} | {summary} | {source} | {H/M/L} | {H/M/L} | {name} | {strategy} |

### Triggered Risks
| Risk ID | Description | Trigger Date | Contingency | Response Status | Impact Realized |
|---------|-------------|-------------|-------------|-----------------|-----------------|
| {id} | {summary} | {date} | {plan} | {status} | {assessment} |

### Closed Risks
| Risk ID | Description | Resolution | Days Open | Lessons Learned |
|---------|-------------|------------|-----------|-----------------|
| {id} | {summary} | {how closed} | {n} | {key takeaway} |

### Risk Reserve Burn-Down

| Period | Planned Spend | Actual Spend | Cumulative | Remaining | Variance |
|--------|--------------|-------------|------------|-----------|----------|
| {period} | {amount} | {amount} | {amount} | {amount} | {+/-} |

**Forecast**: Reserve {sufficient | at risk | insufficient} for remaining project duration.

### Actions Required This Period
| # | Action | Risk ID | Owner | Deadline | Priority |
|---|--------|---------|-------|----------|----------|
| 1 | {action} | {id} | {name} | {date} | {H/M/L} |
```

### Risk Trend Analyst


# Risk Trend Analyst

## Core Responsibility

The Risk Trend Analyst transforms raw risk register data into actionable intelligence by tracking how the project's risk profile evolves across reporting periods. It computes key risk health metrics — new risks identified per sprint/period, risk closure rate, average time-to-mitigation, cumulative risk exposure score, and the ratio of proactive vs. reactive risk responses — to determine whether the project's risk posture is improving, stable, or deteriorating. This trend data drives strategic decisions about risk reserve allocation, team capacity for mitigation work, and escalation to governance.

## Process

1. **Extract** historical risk register snapshots from each reporting period, capturing risk counts by status (open, mitigating, triggered, closed), severity distribution, and exposure scores.
2. **Calculate** period-over-period metrics: new risks identified, risks closed, net risk delta, average probability and impact shifts, and risk reserve consumption rate.
3. **Compute** velocity metrics including mean time-to-mitigation (from identification to closure), mitigation success rate (closed without triggering vs. triggered), and risk aging distribution.
4. **Model** the risk exposure trendline using weighted scoring — sum of (probability x impact) for all active risks — across the last N periods to identify the trajectory direction and acceleration.
5. **Segment** trends by risk category (technical, organizational, external, PM), by severity tier, and by ownership domain to pinpoint which areas are improving and which are degrading.
6. **Forecast** next-period risk exposure using linear projection and flag any categories trending toward the risk appetite boundary with estimated time-to-breach.
7. **Synthesize** findings into an executive narrative that highlights the top 3 trend concerns, top 3 improvements, and recommends specific adjustments to risk management intensity or strategy.

## Output Format

```markdown
## Risk Trend Analysis — Period {N} ({date range})

### Executive Summary
{2-3 sentence narrative: overall risk posture direction and key takeaway}

### Key Metrics Dashboard

| Metric | Period N-2 | Period N-1 | Period N | Trend |
|--------|-----------|-----------|---------|-------|
| Total active risks | {n} | {n} | {n} | {arrow} |
| New risks identified | {n} | {n} | {n} | {arrow} |
| Risks closed | {n} | {n} | {n} | {arrow} |
| Net risk delta | {+/-n} | {+/-n} | {+/-n} | {arrow} |
| Cumulative exposure score | {score} | {score} | {score} | {arrow} |
| Avg time-to-mitigation | {days} | {days} | {days} | {arrow} |
| Mitigation success rate | {%} | {%} | {%} | {arrow} |
| Risk reserve remaining | {%} | {%} | {%} | {arrow} |

### Exposure Trend
- **Direction**: {Increasing | Stable | Decreasing}
- **Acceleration**: {Accelerating | Steady | Decelerating}
- **Forecast (next period)**: {projected exposure score}
- **Time to risk appetite breach**: {N periods or "N/A"}

### Trends by Category

| Category | Active | New | Closed | Exposure Trend | Alert |
|----------|--------|-----|--------|----------------|-------|
| Technical | {n} | {n} | {n} | {direction} | {flag} |
| Organizational | {n} | {n} | {n} | {direction} | {flag} |
| External | {n} | {n} | {n} | {direction} | {flag} |
| Project Management | {n} | {n} | {n} | {direction} | {flag} |

### Top 3 Concerns
1. {concern with data evidence}
2. {concern with data evidence}
3. {concern with data evidence}

### Top 3 Improvements
1. {improvement with data evidence}
2. {improvement with data evidence}
3. {improvement with data evidence}

### Recommendations
- {Strategic adjustment recommendation with rationale}
- {Resource/capacity recommendation}
- {Process improvement recommendation}
```

### Trigger Monitor


# Trigger Monitor

## Core Responsibility

The Trigger Monitor acts as the automated sentinel that watches every defined risk trigger condition in real time against incoming project data. Each risk in the register carries one or more trigger conditions — quantitative thresholds (e.g., SPI < 0.85), date-based deadlines, or qualitative flags (e.g., key resource resignation). When a trigger fires, this agent immediately classifies the breach severity, notifies the designated risk owner, and initiates the pre-approved contingency plan, ensuring zero delay between risk materialization and response activation.

## Process

1. **Load** the active risk register and extract all trigger definitions, mapping each trigger to its parent risk ID, threshold value, data source, and linked contingency plan.
2. **Subscribe** to live project data streams — schedule metrics (SPI, CPI, SV), resource utilization, dependency status, milestone completion, and external event feeds — establishing continuous monitoring channels.
3. **Evaluate** each trigger condition against incoming data on every refresh cycle, applying tolerance bands and debounce logic to prevent false alarms from transient fluctuations.
4. **Detect** threshold breaches by comparing actual values against trigger conditions, recording the exact timestamp, actual value, threshold value, and magnitude of breach.
5. **Classify** each breach into severity tiers — Warning (approaching threshold), Triggered (threshold breached), and Critical (threshold exceeded by >20%) — to calibrate the urgency of response.
6. **Activate** the linked contingency plan for triggered and critical breaches: notify the risk owner and project manager, update the risk register status to "Triggered," and log the activation with all supporting evidence.
7. **Track** post-activation response progress by monitoring whether contingency actions are executed within the defined SLA, escalating to the project sponsor if response deadlines are missed.

## Output Format

```markdown
## Trigger Monitor Alert — {date} {time}

### Alert Classification: {WARNING | TRIGGERED | CRITICAL}

### Breach Details
- **Risk ID**: {id}
- **Risk description**: {statement}
- **Trigger condition**: {definition}
- **Threshold**: {value}
- **Actual value**: {value}
- **Breach magnitude**: {delta} ({percentage}%)
- **Data source**: {source}
- **Detection timestamp**: {ISO-8601}

### Contingency Activation
- **Plan**: {contingency plan name}
- **Status**: {Activated | Pending approval}
- **Risk owner notified**: {name} at {time}
- **PM notified**: {name} at {time}
- **Response SLA**: {hours/days}

### Actions Required
| # | Action | Owner | Deadline | Priority |
|---|--------|-------|----------|----------|
| 1 | {action} | {owner} | {date} | {H/M/L} |

### Trigger History (This Risk)
| Date | Value | Status | Response |
|------|-------|--------|----------|
| {date} | {value} | {status} | {action taken} |

### Active Trigger Dashboard
- **Total active triggers**: {count}
- **Warnings active**: {count}
- **Triggered (pending response)**: {count}
- **Critical escalations**: {count}
```


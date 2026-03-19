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

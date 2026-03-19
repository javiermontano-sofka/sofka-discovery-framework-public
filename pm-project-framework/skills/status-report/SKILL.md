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

---
name: apex-dashboard-tooling
description: >
  Use when the user asks to "configure dashboards", "set up data feeds",
  "design monitoring tools", "automate dashboard updates", or "integrate PM data sources".
  Activates when a stakeholder needs to configure PM dashboard tooling, set up automated data
  feeds from PM tools, design visualization components, configure alert thresholds, or establish
  dashboard refresh cadence and access control.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Dashboard Tooling & Data Feeds

**TL;DR**: Configures project management dashboard tooling including data feed setup, visualization component selection, refresh cadence, and alert configuration. Ensures dashboards are automatically updated with live project data rather than requiring manual input.

## Principio Rector
Un dashboard que requiere actualización manual no es un dashboard — es una presentación recurrente. La automatización de data feeds es lo que transforma reportes en monitoreo en tiempo real. El valor del dashboard es inversamente proporcional al esfuerzo de mantenerlo actualizado.

## Assumptions & Limits
- Assumes PM tools have APIs or export capabilities for data extraction [SUPUESTO]
- Assumes dashboard platform is selected and accessible [PLAN]
- Breaks when data sources are manual spreadsheets with no API — design data pipeline first
- Does not design dashboard layout — that is the output of `executive-dashboard` or similar
- Data feed reliability depends on source system availability; design fallback for outages
- Alert fatigue occurs when thresholds are too sensitive — calibrate over ≥2 reporting cycles [METRIC]

## Usage

```bash
# Configure data feeds for project dashboard
/pm:dashboard-tooling $PROJECT --type=feeds --sources="jira,ado"

# Set up alert rules for project metrics
/pm:dashboard-tooling $PROJECT --type=alerts --metrics="cpi,spi,velocity"

# Configure dashboard refresh cadence
/pm:dashboard-tooling $PROJECT --type=refresh --cadence="hourly"
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PROJECT` | Yes | Project identifier |
| `--type` | Yes | `feeds`, `alerts`, `refresh`, `access-control`, `maintenance` |
| `--sources` | No | Data sources (jira, ado, monday, sheets) |
| `--metrics` | No | Metrics for alert configuration |
| `--cadence` | No | Refresh frequency (real-time, hourly, daily) |

## Service Type Routing
`{TIPO_PROYECTO}`: All project types need dashboard tooling. Agile uses velocity and burndown widgets; Waterfall uses EVM and milestone widgets; Portfolio uses heatmap and aggregate views.

## Before Configuring

1. **Read** the dashboard design to understand which metrics and visualizations need data feeds
2. **Read** the PM tool API documentation to assess data extraction capabilities
3. **Glob** `skills/dashboard-tooling/references/*.md` for data feed configuration patterns
4. **Grep** for existing dashboard configurations or data integration scripts

## Entrada (Input Requirements)
- Dashboard design specifications
- Data sources (Jira, Azure DevOps, spreadsheets, APIs)
- Refresh cadence requirements
- Alert thresholds
- User access requirements

## Proceso (Protocol)
1. **Data source mapping** — Identify all data sources for dashboard metrics
2. **Feed configuration** — Set up data extraction from each source
3. **Transformation rules** — Define data transformation and calculation rules
4. **Widget selection** — Choose visualization widgets per metric type
5. **Layout implementation** — Build dashboard layout per design
6. **Refresh scheduling** — Configure automatic refresh cadence
7. **Alert configuration** — Set up threshold-based alerts and notifications
8. **Access control** — Configure user access and permission levels
9. **Testing** — Verify data accuracy and refresh reliability
10. **Maintenance plan** — Document dashboard maintenance procedures

## Edge Cases

1. **Data source API unavailable**: Design manual data upload pipeline with scheduled CSV exports. Document API requirements for future tool upgrade. [SUPUESTO]
2. **Dashboard performance degrades with data volume**: Implement data aggregation at source. Limit historical data to rolling window. Archive detailed data separately. [METRIC]
3. **Alert fatigue from too many notifications**: Calibrate thresholds using 2-cycle historical data. Implement tiered alerts (info, warning, critical). Allow user-level alert preferences. [PLAN]
4. **Data accuracy discrepancy between dashboard and source**: Implement reconciliation check. Display "last verified" timestamp. Design data validation rules at ingestion. [METRIC]

## Example: Good vs Bad

**Good Dashboard Tooling:**

| Attribute | Value |
|-----------|-------|
| Data feeds configured | All metrics from automated sources |
| Refresh cadence | Configured per metric type (hourly/daily) |
| Alert rules | Tiered with calibrated thresholds |
| Access control | Role-based with 3 permission levels |
| Testing | Data accuracy verified against source |
| Maintenance plan | Documented with ownership |

**Bad Dashboard Tooling:**
A dashboard that requires someone to manually copy data from Jira into a spreadsheet every Friday. No automated feeds, no alerts, no refresh cadence. Fails because manual dashboards are always stale, error-prone, and abandoned within weeks when the person responsible gets busy.

## Validation Gate
- [ ] Every dashboard metric has an identified data source with extraction method documented
- [ ] Automated data feeds configured for ≥80% of dashboard metrics
- [ ] Refresh cadence configured per metric type with documented schedule
- [ ] Alert thresholds calibrated using ≥1 cycle of historical data
- [ ] Access control defined with role-based permissions
- [ ] Data accuracy verified by comparing dashboard values against source system
- [ ] Maintenance plan documented with ownership and escalation for feed failures
- [ ] No manual data entry required for core dashboard metrics
- [ ] Users get timely, accurate data without manual effort [STAKEHOLDER]
- [ ] Tooling supports methodology-specific metrics and views [PLAN]

## Escalation Triggers
- Data feed failures causing stale dashboards
- Dashboard performance degradation
- Data accuracy discrepancies detected
- Tool licensing issues affecting availability

## Additional Resources

| Resource | When to read | Location |
|----------|-------------|----------|
| Body of Knowledge | Before configuring to understand data integration patterns | `references/body-of-knowledge.md` |
| State of the Art | When evaluating dashboard platforms | `references/state-of-the-art.md` |
| Knowledge Graph | To link tooling to dashboard design and metrics | `references/knowledge-graph.mmd` |
| Use Case Prompts | When scoping tooling requirements | `prompts/use-case-prompts.md` |
| Metaprompts | To generate data feed configuration templates | `prompts/metaprompts.md` |
| Sample Output | To calibrate expected tooling documentation | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark

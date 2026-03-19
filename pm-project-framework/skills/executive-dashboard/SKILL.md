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

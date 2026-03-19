---
name: apex-automation-opportunities
description: >
  Use when the user asks to "identify PM automation candidates", "automate PM reporting",
  "reduce manual PM processes", "find automation quick wins", or "design workflow automation".
  Activates when a stakeholder needs to scan PM processes for automation potential, calculate
  automation ROI, design automation specifications, prioritize automation backlog, or plan
  phased automation rollout across the PMO.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# PM Process Automation Opportunities

**TL;DR**: Systematically identifies PM process automation candidates across reporting, tracking, alerts, approvals, and data collection. Evaluates each candidate by ROI (hours saved vs. implementation effort), risk (automation failure impact), and feasibility (tool capability). Produces a prioritized automation backlog with specifications for the top candidates and a phased implementation roadmap.

## Principio Rector
Los PMs gastan el 40% de su tiempo en actividades que una máquina puede hacer mejor: consolidar reportes, calcular métricas, enviar recordatorios, actualizar dashboards. Cada hora automatizada es una hora devuelta a las actividades donde los humanos son insustituibles: negociación con stakeholders, resolución de conflictos, y toma de decisiones bajo incertidumbre.

## Assumptions & Limits
- Assumes PM tools have API or integration capabilities for automation [SUPUESTO]
- Assumes team has basic technical capability to maintain automations once deployed [SUPUESTO]
- Breaks when the PM ecosystem is entirely paper-based or tool-free
- Does not implement automations — produces specifications for implementation teams
- ROI calculations use estimated hours; actual measurement requires post-implementation tracking [INFERENCIA]
- Scope limited to PM processes; does not cover engineering or product automation

## Usage

```bash
# Scan all PM processes for automation opportunities
/pm:automation-opportunities $PROJECT --type=scan --scope="all"

# Calculate ROI for specific automation candidates
/pm:automation-opportunities $PROJECT --type=roi --candidates="reporting,metrics"

# Design automation specification for top candidates
/pm:automation-opportunities $PROJECT --type=spec --top=5
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PROJECT` | Yes | Project or PMO identifier |
| `--type` | Yes | `scan`, `roi`, `spec`, `roadmap` |
| `--scope` | No | Process area filter (reporting, tracking, alerts, all) |
| `--candidates` | No | Specific candidates for ROI analysis |
| `--top` | No | Number of top candidates for specification |

## Service Type Routing
`{TIPO_PROYECTO}` variants:
- **Agile**: Automate sprint metrics calculation, burndown generation, velocity tracking, standup reminders
- **Waterfall**: Automate EVM calculations, milestone status reports, baseline variance alerts, phase-gate checklists
- **SAFe**: Automate PI metrics aggregation, ART sync status collection, cross-team dependency alerts
- **Kanban**: Automate flow metric calculation, WIP limit violation alerts, aging work item notifications
- **Hybrid**: Automate unified status consolidation across iterative and sequential components
- **PMO**: Automate portfolio dashboard updates, cross-project reporting, resource utilization tracking
- **Portfolio**: Automate strategic alignment scoring, portfolio rebalancing alerts, benefits tracking

## Before Scanning

1. **Read** the current PM process inventory to understand manual effort distribution
2. **Glob** `skills/automation-opportunities/references/*.md` for automation pattern catalogs
3. **Read** the PM tool configuration to assess API availability and integration capabilities
4. **Grep** for existing automation scripts or integrations already in place

## Entrada (Input Requirements)
- Current PM process inventory with estimated time per activity
- PM tool ecosystem and API/integration capabilities
- Team technical capability for automation implementation
- Organizational automation policies and tool approvals
- Top 5 PM time sinks reported by project managers

## Proceso (Protocol)
1. **Process inventory** — Catalog all PM processes with frequency, duration, and manual effort
2. **Automation candidate screening** — Filter for repetitive, rule-based, data-driven, low-judgment processes
3. **ROI estimation** — Calculate hours saved per month vs. implementation hours per candidate
4. **Risk assessment** — Evaluate impact if automation fails or produces incorrect output
5. **Feasibility check** — Verify tool APIs, data availability, and integration paths exist
6. **Priority matrix** — Rank candidates on 2x2 matrix (high ROI / low effort = quick wins)
7. **Specification design** — Write automation specs for top 5 candidates (trigger, input, logic, output)
8. **Pilot selection** — Choose 1-2 automations for pilot implementation
9. **Success metrics** — Define how to measure automation effectiveness (time saved, accuracy, adoption)
10. **Implementation roadmap** — Phase automation rollout: quick wins (month 1), medium (months 2-3), complex (months 4-6)

## Edge Cases

1. **No PM tool APIs available**: Design manual-to-semi-automated workflow using spreadsheet macros or email rules. Document API requirements for next tool procurement cycle. [SUPUESTO]
2. **Automation ROI is negative for all candidates**: Report finding transparently. Recommend process simplification before automation — automating a broken process amplifies waste. [METRIC]
3. **Team resists automated processes**: Design automation as augmentation, not replacement. Start with "invisible" automations (data collection, calculation) before "visible" ones (alerts, reports). [STAKEHOLDER]
4. **Automation produces incorrect outputs**: Include validation checkpoints in every automation spec. Design fallback to manual process with <1 hour switchover time. [PLAN]

## Example: Good vs Bad

**Good Automation Analysis:**

| Attribute | Value |
|-----------|-------|
| Processes inventoried | 25 PM activities across 6 categories |
| Candidates identified | 12, each with ROI calculation |
| Priority matrix | 2x2 with 4 quick wins identified |
| Top 5 specs | Trigger + Input + Logic + Output + Fallback |
| Pilot selected | 2 automations with success criteria |
| Roadmap | 3 phases over 6 months |

**Bad Automation Analysis:**
A document that says "automate everything" without process inventory, ROI calculation, or feasibility check. No specifications for implementation. No pilot selection. Fails because it provides no actionable path from current manual state to automated state, and no evidence that automation will save more time than it costs to implement.

## Validation Gate
- [ ] ≥15 PM processes inventoried with frequency and estimated manual effort per cycle
- [ ] Every automation candidate has ROI calculation (hours saved/month vs. implementation hours)
- [ ] Priority matrix produced with ≥3 quick wins (high ROI, low effort) identified
- [ ] Top 5 automation specs include trigger, input, logic, output, and fallback procedure
- [ ] No automation spec without feasibility verification (API exists, data available)
- [ ] Pilot selection includes success criteria and measurement plan
- [ ] Automation failure scenarios documented with fallback to manual process
- [ ] PM team sees clear path from manual effort to strategic focus [STAKEHOLDER]
- [ ] Implementation roadmap phased: quick wins first, complex last
- [ ] Every automation traces to specific PM process and quantified time savings [METRIC]

## Escalation Triggers
- No PM tool APIs available for integration (fully manual ecosystem)
- Automation ROI negative due to high implementation complexity
- Team resistance to automated processes (trust issues)
- Automation produces incorrect outputs affecting project decisions

## Salida (Deliverables)

- Primary deliverable: automation opportunity assessment and prioritized roadmap
- All outputs tagged with evidence markers
- Mermaid diagrams where applicable
- Executive summary for stakeholder consumption

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

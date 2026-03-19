---
name: apex-pmo-setup
description: >
  Use when the user asks to "set up a PMO", "design PMO", "create PMO charter",
  "implement project management office", "define PMO operating model",
  or mentions PMO design, project management office, PMO operating model,
  PMO governance, PMO implementation. Triggers on: designs PMO operating model,
  creates PMO charter and service catalog, defines PMO staffing and roles,
  establishes PMO governance framework, produces phased PMO implementation roadmap.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# PMO Design & Setup

**TL;DR**: Designs and plans the implementation of a Project Management Office including PMO type selection (supportive, controlling, directive), operating model, service catalog, staffing, governance framework, tools, and maturity roadmap. The PMO is the organizational engine that standardizes, governs, and improves project delivery.

## Principio Rector
Un PMO exitoso sirve a los proyectos, no al revés. El tipo de PMO (supportive, controlling, directive) debe alinearse con la cultura organizacional y la madurez de PM. Un PMO directive en una cultura altamente autónoma será rechazado; un PMO supportive en una organización inmadura será ignorado. Start where you are, not where you wish you were.

## Assumptions & Limits
- Assumes executive sponsor committed to PMO investment and authority [STAKEHOLDER]
- Assumes PMO maturity assessment has been completed or baseline is estimable [SUPUESTO]
- Breaks if organization has no executive buy-in — PMO without executive authority is a documentation team [STAKEHOLDER]
- Scope limited to PMO design and setup plan; ongoing PMO operations is a continuous engagement [PLAN]
- Does not replace organizational restructuring — PMO operates within existing org structure [PLAN]

## Usage
```bash
/pm:pmo-setup $ORG_NAME --type=supportive
/pm:pmo-setup $ORG_NAME --type=controlling --services=governance,reporting,methodology
/pm:pmo-setup $ORG_NAME --type=auto --from-maturity-assessment
```
**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$ORG_NAME` | Yes | Target organization identifier |
| `--type` | No | `supportive` / `controlling` / `directive` / `auto` (default: `auto`) |
| `--services` | No | Comma-separated PMO services to include |
| `--from-maturity-assessment` | No | Derive PMO type from maturity assessment results |

## Service Type Routing
`{TIPO_PROYECTO}`: PMO-Setup is the primary use case; Agile-Transformation designs Agile PMO; Portfolio uses PMO for portfolio governance; Enterprise uses Enterprise PMO design.

## Before Setting Up PMO
1. Read `pmo-maturity` assessment — understand current baseline and target maturity [PLAN]
2. Read organizational strategy — PMO services must align with strategic priorities [PLAN]
3. Glob `*governance*` and `*process*` — understand existing PM practices [PLAN]
4. Confirm executive sponsor commitment — PMO authority requires executive backing [STAKEHOLDER]

## Entrada (Input Requirements)
- PMO maturity assessment results (from `pmo-maturity`)
- Organizational strategy and PM needs
- Current PM practices and pain points
- Executive sponsor expectations
- Industry PMO benchmarks

## Proceso (Protocol)
1. **PMO type selection** — Choose supportive, controlling, or directive based on org maturity and needs
2. **Charter creation** — Draft PMO charter with mission, scope, authority, and success metrics
3. **Service catalog** — Define PMO services (standards, training, tools, reporting, consulting)
4. **Operating model** — Design PMO structure, roles, and processes
5. **Staffing plan** — Define PMO roles (head, analysts, coaches) and FTE requirements
6. **Governance framework** — Establish PMO governance including portfolio board
7. **Tool ecosystem** — Select and configure PM tool suite
8. **Standards library** — Create PM standards, templates, and methodology guides
9. **Implementation roadmap** — Plan phased PMO rollout (quick wins, foundation, maturity)
10. **Success metrics** — Define PMO value metrics (project success rate, cycle time, satisfaction)

## Edge Cases
1. **Organizational resistance to PMO authority** — Start with supportive model (service-first); earn trust through value delivery before introducing governance.
2. **PMO scope creep beyond charter** — Define explicit boundaries in charter; PMO does not own project delivery, it enables it.
3. **Executive sponsor changes mid-setup** — Re-confirm charter and authority with new sponsor; PMO design may need adjustment for new expectations.
4. **Multiple existing informal PMOs across business units** — Map existing capabilities; propose federated model with central standards and local execution.

## Example: Good vs Bad

**Good PMO Setup:**
| Attribute | Value |
|-----------|-------|
| PMO type | Controlling — justified by maturity assessment Level 2 and governance gaps [PLAN] |
| Charter | Mission, scope, authority, success metrics, review cadence [PLAN] |
| Service catalog | 8 services defined with maturity targets (3 active, 3 planned, 2 aspirational) [PLAN] |
| Staffing | PMO Head + 2 analysts + 1 coach = 4 FTE initial team [METRIC] |
| Roadmap | Phase 1: 3 months (governance + reporting); Phase 2: 6 months (methodology + tools) [SCHEDULE] |

**Bad PMO Setup:**
"We hired a PMO Manager and gave them an office." — No charter, no service catalog, no staffing plan, no governance framework. PMO operates ad-hoc and struggles to demonstrate value.

## Salida (Deliverables)
- `05_pmo_charter_{proyecto}_{WIP}.md` — PMO charter
- PMO service catalog
- PMO operating model and org chart
- Implementation roadmap
- PMO success metrics dashboard

## Validation Gate
- [ ] PMO type aligned to organizational reality — not aspirational
- [ ] Charter includes mission, scope, authority boundaries, and success metrics
- [ ] Service catalog defines at least 5 services with maturity levels
- [ ] Staffing plan realistic — FTE requirements justified by service catalog scope
- [ ] Governance framework establishes PMO authority for declared services
- [ ] Implementation roadmap phased — quick wins in first 90 days
- [ ] PMO value metrics defined and measurable from day 1
- [ ] Executive sponsor formally endorses charter
- [ ] PMO supports chosen methodologies without constraining them
- [ ] Success metrics dashboard designed for quarterly PMO health tracking

## Escalation Triggers
- Executive sponsor not committed to PMO investment
- Organizational resistance to PMO authority
- PMO scope creep beyond charter
- PMO metrics not improving after 6 months

## Additional Resources
| Resource | When to Read | Location |
|----------|-------------|----------|
| Body of Knowledge | When designing PMOs per PMI and industry standards | `references/body-of-knowledge.md` |
| State of the Art | When implementing modern PMO operating models | `references/state-of-the-art.md` |
| Knowledge Graph | When mapping PMO setup to pipeline phases | `references/knowledge-graph.mmd` |
| Use Case Prompts | When generating PMO designs for specific organizational contexts | `prompts/use-case-prompts.md` |
| Metaprompts | When adapting PMO design for non-standard organizations | `prompts/metaprompts.md` |
| Sample Output | When reviewing expected PMO charter quality | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark

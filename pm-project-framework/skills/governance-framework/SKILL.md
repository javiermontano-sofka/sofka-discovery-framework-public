---
name: apex-governance-framework
description: >
  Use when the user asks to "define governance", "create governance model",
  "set up escalation paths", "design authority matrix", "establish decision framework",
  or mentions project governance, steering committee, decision framework, authority levels,
  escalation matrix. Triggers on: builds a governance charter, designs escalation paths,
  defines decision-making authority, creates steering committee structure, maps authority levels.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Governance Framework & Escalation Paths

**TL;DR**: Designs the project governance model including decision-making authority levels, steering committee structure, escalation paths, reporting cadence, and governance ceremonies. Ensures clear authority, timely decisions, and appropriate oversight without bureaucratic overhead.

## Principio Rector
La gobernanza existe para facilitar decisiones, no para retrasarlas. Un buen modelo de gobernanza define quién puede decidir qué, hasta qué monto, y cómo se escala lo que excede su autoridad. La gobernanza excesiva paraliza; la gobernanza insuficiente produce caos. El equilibrio depende del tamaño, riesgo y cultura del proyecto.

## Assumptions & Limits
- Assumes stakeholder register and RACI matrix are available or will be created concurrently [SUPUESTO]
- Assumes organizational governance policies exist as baseline — if not, defaults to PMI governance standards [SUPUESTO]
- Breaks if no executive sponsor is identified — governance without authority is documentation theater [STAKEHOLDER]
- Scope limited to project/program governance; enterprise governance architecture is out of scope [PLAN]
- Does not replace legal or regulatory compliance frameworks — operates within them [PLAN]

## Usage
```bash
/pm:governance-framework $PROJECT_NAME --type=multi-tier
/pm:governance-framework $PROJECT_NAME --type=lightweight --methodology=agile
/pm:governance-framework $PROJECT_NAME --type=formal --include=escalation,authority
```
**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PROJECT_NAME` | Yes | Target project identifier |
| `--type` | No | `lightweight` / `multi-tier` / `formal` (default: `multi-tier`) |
| `--methodology` | No | Constrains governance proportionality |
| `--include` | No | Specific governance components to generate |

## Service Type Routing
`{TIPO_PROYECTO}`: Large programs need multi-tier governance; Agile projects use lightweight governance; Regulated projects need formal governance boards; PMO-Setup defines portfolio governance.

## Before Defining Governance
1. Read `stakeholder-register` — identify decision-makers and their authority boundaries [STAKEHOLDER]
2. Glob `*raci*` and `*charter*` — confirm roles and project authority are defined [PLAN]
3. Read `risk-appetite-framework` — governance rigor must match organizational risk tolerance [PLAN]
4. Review organizational governance standards — ensure alignment with existing structures [PLAN]

## Entrada (Input Requirements)
- Project charter with authority levels
- Organizational governance standards
- Stakeholder register with decision-makers
- RACI matrix
- Risk appetite framework

## Proceso (Protocol)
1. **Governance needs assessment** — Evaluate project size, risk, and complexity for governance level
2. **Authority matrix** — Define decision authority by type and threshold
3. **Steering committee design** — Define composition, charter, cadence, and decision protocols
4. **Escalation framework** — Create escalation paths with time-based triggers
5. **Reporting structure** — Define what gets reported to whom and when
6. **Change authority** — Define change approval authority levels
7. **Gate governance** — Assign gate review boards and decision criteria
8. **Governance ceremonies** — Schedule governance meetings and reviews
9. **Documentation** — Create governance charter and procedures
10. **Effectiveness review** — Plan periodic governance effectiveness assessments

## Edge Cases
1. **No executive sponsor identified** — Escalate immediately; document governance gap as critical risk; propose interim authority structure with explicit expiry date.
2. **Matrix organization with dual reporting** — Define primary vs. secondary authority per decision type; document conflict resolution protocol for competing authorities.
3. **Governance overhead exceeds 15% of team capacity** — Simplify: merge ceremonies, raise decision thresholds, remove redundant approvals.
4. **Remote/distributed teams across time zones** — Design asynchronous decision protocols with SLA-based response windows; avoid synchronous-only governance.
5. **Regulatory-mandated governance layers** — Map regulatory requirements to governance ceremonies explicitly; tag mandatory vs. discretionary governance elements.

## Example: Good vs Bad

**Good Governance Framework:**
| Attribute | Value |
|-----------|-------|
| Authority matrix | 4 decision types x 3 authority levels with thresholds [PLAN] |
| Escalation paths | Time-based triggers (24h, 48h, 1 week) per severity [SCHEDULE] |
| Steering committee | Charter with quorum rules, cadence, and decision protocol [STAKEHOLDER] |
| Governance calendar | Monthly steering, weekly PMO, daily team stand-up [SCHEDULE] |
| Change authority | Budget changes under 5% approved by PM; above by steering [PLAN] |

**Bad Governance Framework:**
"The steering committee will meet as needed to make decisions." — No defined cadence, no authority matrix, no escalation triggers, no decision thresholds. Result: decisions blocked for weeks with no clear path to resolution.

## Salida (Deliverables)
- `03_governance_framework_{proyecto}_{WIP}.md` — Governance model document
- Authority matrix (decision type x authority level)
- Escalation path diagram (Mermaid)
- Steering committee charter
- Governance calendar

## Validation Gate
- [ ] Every decision type has an assigned authority level — no orphan decisions
- [ ] Escalation paths include time-based triggers for every severity level
- [ ] Steering committee has defined quorum (minimum attendees for valid decisions)
- [ ] Governance overhead does not exceed 15% of team capacity [METRIC]
- [ ] Authority thresholds are quantified (budget amounts, schedule days, scope %)
- [ ] No decision type lacks a defined escalation path
- [ ] Governance aligned with RACI and stakeholder register — no contradictions
- [ ] Governance proportional to methodology — Agile governance is not waterfall governance
- [ ] Periodic effectiveness review scheduled (quarterly minimum)
- [ ] All governance ceremonies have defined agendas, durations, and outputs

## Escalation Triggers
- Decision blocked for > 3 business days
- Authority dispute between governance bodies
- Governance overhead perceived as excessive
- Steering committee attendance below quorum

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

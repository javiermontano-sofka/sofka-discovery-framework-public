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

---

---

## Sub-Agents

### Decision Rights Mapper


## Decision Rights Mapper Agent

### Core Responsibility
Eliminates decision-making ambiguity by mapping every significant project decision to explicit roles using the RAPID framework (Recommend, Agree, Perform, Input, Decide) or an equivalent model. The agent produces a decision-rights matrix that makes it unambiguous who owns each decision, who must be consulted, and who executes the outcome, preventing stalemates and shadow decision-making.

### Process
1. **Inventory decision types.** Catalogue all recurring and one-off decisions the project will face across scope, budget, schedule, technical direction, vendor selection, staffing, and risk response.
2. **Select decision framework.** Choose RAPID, RACI-for-decisions, or a hybrid model based on organizational familiarity and governance complexity; document the rationale.
3. **Assign roles per decision.** For each decision type, assign exactly one Decide role, at least one Recommend role, and the minimum necessary Agree, Input, and Perform roles to keep the matrix lean.
4. **Validate single-point accountability.** Audit every row to confirm there is exactly one D (Decide) and that no decision has orphaned responsibilities or conflicting authority.
5. **Cross-reference governance bodies.** Align the decision-rights matrix with the governance structure so that each body's charter is consistent with the decisions it owns.
6. **Define decision protocols.** For each decision category, specify the required inputs, deliberation format (async, meeting, vote), time-box, and tie-breaking rule.
7. **Socialize and ratify.** Package the matrix for stakeholder review, incorporate feedback, and obtain formal sign-off so the matrix becomes a binding governance artifact.

### Output Format
- **Decision Rights Matrix** — A tabular RAPID map covering all decision types, assigned roles, decision protocols, time-boxes, and tie-breaking rules, with a traceability link to the governance charter.

### Escalation Path Builder


## Escalation Path Builder Agent

### Core Responsibility
Designs end-to-end escalation paths that ensure no issue, risk, or decision request languishes without resolution. The agent defines explicit escalation levels, trigger criteria for each level, response-time SLAs, auto-escalation rules when SLAs are breached, and de-escalation protocols once issues are resolved. The result is a predictable, transparent mechanism that protects delivery momentum.

### Process
1. **Classify escalation categories.** Segment escalatable items into categories such as technical blockers, resource conflicts, scope disputes, budget overruns, vendor performance, and stakeholder disagreements.
2. **Define escalation levels.** Establish three to five escalation tiers (e.g., team lead, project manager, steering committee, executive sponsor, C-suite) and map each to a governance body or named role.
3. **Set trigger criteria.** For each category and level, define objective triggers (e.g., issue unresolved for 48 hours, budget variance exceeding 10%, risk probability increase above threshold) that initiate escalation.
4. **Assign response-time SLAs.** Specify the maximum response and resolution times for each escalation level, differentiated by severity (critical, high, medium, low).
5. **Design auto-escalation rules.** Create time-based and condition-based rules that automatically promote an item to the next tier when the current tier's SLA is breached without acknowledgment.
6. **Define de-escalation and closure.** Document the criteria and process for de-escalating resolved items, including confirmation protocols and lessons-learned capture.
7. **Integrate with tooling.** Specify how escalation paths map to project management tools (Jira workflows, ServiceNow, Teams alerts) so that triggers and SLAs are enforced systematically rather than manually.

### Output Format
- **Escalation Path Matrix** — A multi-level escalation map with categories, trigger criteria, SLA targets, auto-escalation rules, de-escalation protocols, and tooling integration notes.

### Governance Health Monitor


## Governance Health Monitor Agent

### Core Responsibility
Continuously measures and reports on the effectiveness of the governance framework itself, tracking leading and lagging indicators such as meeting attendance rates, decision cycle times, escalation volumes and resolution rates, and stakeholder satisfaction with governance processes. The agent identifies governance dysfunction early and recommends targeted adjustments before bottlenecks impact delivery.

### Process
1. **Define governance KPIs.** Establish a balanced scorecard of governance health metrics: meeting attendance percentage, quorum achievement rate, average decision cycle time, escalation volume trends, resolution SLA compliance, and stakeholder governance satisfaction score.
2. **Set baselines and targets.** For each KPI, define the acceptable range, warning threshold, and critical threshold using historical data or industry benchmarks.
3. **Collect data points.** Instrument data collection from meeting minutes, decision logs, escalation trackers, and periodic stakeholder pulse surveys to feed the governance dashboard.
4. **Analyze trends.** Evaluate KPI trends over rolling periods (weekly, monthly, quarterly) to detect patterns such as rising escalation volumes, declining attendance, or lengthening decision cycles.
5. **Diagnose root causes.** When metrics breach warning thresholds, conduct root-cause analysis to distinguish between structural governance issues (wrong people, wrong cadence) and situational anomalies.
6. **Recommend adjustments.** Propose specific, proportional governance changes (merge bodies, adjust cadence, reassign decision rights, simplify escalation paths) with expected impact on the affected KPIs.
7. **Report and close the loop.** Publish a governance health report to the steering committee, track whether recommendations are adopted, and measure whether the adjustments improved the targeted KPIs in the next cycle.

### Output Format
- **Governance Health Report** — A periodic dashboard containing KPI scorecards, trend analysis, root-cause findings, recommended adjustments, and a tracking log of previously adopted changes and their measured impact.

### Governance Structure Designer


## Governance Structure Designer Agent

### Core Responsibility
Architects the complete governance hierarchy for a project or program, defining every governance body (steering committee, change control board, PMO oversight layer, working groups), their composition, charter, cadence, quorum rules, and reporting lines. The agent ensures the structure is proportional to project complexity and eliminates both governance gaps and unnecessary bureaucracy.

### Process
1. **Assess project scale.** Evaluate budget, duration, stakeholder count, regulatory exposure, and organizational maturity to determine the appropriate governance weight class (lightweight, standard, or enterprise).
2. **Identify governance bodies.** Define which bodies are required (steering committee, CCB, PMO, technical authority, working groups) based on the scale assessment and organizational context.
3. **Compose membership.** For each body, specify roles, named positions, alternates, quorum requirements, and voting rights, ensuring no single stakeholder group dominates.
4. **Define charter and mandate.** Document the purpose, scope of authority, decision types owned, and boundaries for each governance body so there is zero overlap or ambiguity.
5. **Establish cadence and rituals.** Set meeting frequency, standing agenda templates, preparation expectations, and time-box limits for each body.
6. **Map reporting lines.** Draw the information flow from delivery teams upward through governance layers, specifying what each body reports, to whom, and in what format.
7. **Validate proportionality.** Stress-test the structure against the project's risk profile and complexity; strip any layer that adds overhead without adding decision value.

### Output Format
- **Governance Structure Charter** — A single document containing the hierarchy diagram (Mermaid), body charters, membership matrix, cadence calendar, and reporting-line map.


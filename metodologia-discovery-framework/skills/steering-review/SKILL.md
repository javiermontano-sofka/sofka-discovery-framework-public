---
name: apex-steering-review
description: >
  Use when the user asks to "run a steering committee", "prepare steering review",
  "conduct Go/No-Go gate", "orchestrate advisory vote", "prepare gate review package",
  or mentions steering committee, steering review, Go/No-Go decision, advisory vote,
  project gate review, steering minutes, 7-advisor evaluation.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Steering Review (7-Advisor Committee)

**TL;DR**: Phase 3b deliverable that orchestrates a formal steering review where 7 specialized advisors evaluate project readiness and vote Go/No-Go. Each advisor assesses from their domain lens (Strategy, Architecture, Risk, Finance, Methodology, Delivery, Stakeholders). Produces structured steering minutes with individual votes, dissent reasoning, conditions for Go, and actionable next steps.

## Principio Rector
Un steering committee no es un ritual de aprobación — es un mecanismo de gobernanza que protege a la organización de comprometerse con proyectos que no están listos. Los 7 asesores no votan por consenso social; votan por evidencia. Un voto "No-Go" con buena justificación vale más que cinco "Go" por inercia.

## Assumptions & Limits
- Assumes all Phase 1-3a deliverables are complete and available for review [PLAN]
- Assumes 7 advisor perspectives can be meaningfully applied (sufficient project data) [PLAN]
- Breaks when deliverables are incomplete — steering cannot evaluate what does not exist
- Does not produce deliverables; evaluates them. Each advisor reviews existing artifacts
- Assumes decision authority is clear (≥5/7 Go required to proceed) [STAKEHOLDER]
- Limited to project-level steering; for portfolio steering use `strategic-alignment`

## Usage

```bash
# Full 7-advisor steering review
/pm:steering-review $ARGUMENTS="--deliverables phases-1-3/ --type Go-NoGo"

# Conditional Go resolution review
/pm:steering-review --type conditional-review --conditions conditions.md

# Advisory vote on specific decision
/pm:steering-review --type advisory --question "Should we extend scope to include Module B?"
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$ARGUMENTS` | Yes | Path to deliverables package |
| `--type` | No | `Go-NoGo` (default), `conditional-review`, `advisory` |
| `--conditions` | No | Previous conditional-go conditions for resolution |
| `--question` | No | Specific advisory question |

## Service Type Routing
`{TIPO_PROYECTO}` variants:
- **Agile**: Steering evaluates sprint-0 readiness, team formation, backlog quality, DoR compliance
- **Waterfall**: Steering evaluates phase completion, baseline quality, risk mitigation readiness
- **SAFe**: Steering evaluates ART readiness, PI planning preparation, architectural runway
- **Kanban**: Steering evaluates flow system design, WIP limits, service class definitions
- **Hybrid**: Steering evaluates methodology integration plan and dual-governance readiness
- **PMO**: Steering evaluates PMO setup, governance framework, and portfolio alignment
- **Portfolio**: Steering evaluates portfolio rebalancing decisions and strategic alignment
- **Recovery**: Steering evaluates recovery plan viability and resource commitment

## Before Reviewing
1. **Read** all Phase 1-3a deliverables to compile the review package [PLAN]
2. **Read** the project charter to ground advisor reviews in authorized scope [PLAN]
3. **Glob** `**/risk_register*` and `**/budget*` to prepare risk and financial review inputs [PLAN]
4. **Grep** for [SUPUESTO] tags across deliverables to assess assumption density [INFERENCIA]

## Entrada (Input Requirements)
- All Phase 1-3a deliverables (charter, schedule, risk register, stakeholder analysis)
- Project business case and strategic alignment evidence
- Architecture assessment and technical feasibility analysis
- Resource availability confirmation
- Risk assessment with response strategies

## Proceso (Protocol)
1. **Advisor activation** — Spawn 7 advisor personas (Strategy, Architecture, Risk, Finance, Methodology, Delivery, Stakeholders)
2. **Evidence package preparation** — Compile deliverables into structured review package
3. **Strategy advisor review** — Assess strategic alignment, business case strength, market timing
4. **Architecture advisor review** — Assess technical feasibility, architecture readiness, tech debt risk
5. **Risk advisor review** — Assess risk register completeness, response strategy quality, residual risk
6. **Finance advisor review** — Assess budget realism, ROI projections, funding commitment
7. **Methodology advisor review** — Assess methodology selection fit, team readiness, ceremony design
8. **Delivery advisor review** — Assess schedule realism, resource availability, dependency management
9. **Stakeholder advisor review** — Assess stakeholder alignment, communication plan, change readiness
10. **Vote compilation** — Collect individual votes (Go/Conditional-Go/No-Go) with reasoning and conditions

## Edge Cases
1. **Majority No-Go vote (4+ of 7)** — Document all advisor reasoning. Identify minimum remediation to convert No-Go votes. Schedule re-review with specific criteria [STAKEHOLDER].
2. **Split decision (3 Go, 3 No-Go, 1 Conditional)** — Escalate to sponsor for tiebreaker. Present both perspectives with equal weight. Do not average dissenting views [STAKEHOLDER].
3. **Finance advisor identifies unfunded commitments** — Hard stop on financial dimension. Budget must be resolved before any other dimension can proceed [PLAN].
4. **All advisors vote Go but with conditions** — Compile all conditions. Classify as blocking (must resolve before proceed) vs advisory (resolve during execution). Assign owners and deadlines [PLAN].

## Example: Good vs Bad

**Good example — Evidence-based steering:**

| Attribute | Value |
|-----------|-------|
| Advisors | All 7 perspectives represented with evidence |
| Votes | 5 Go, 1 Conditional-Go, 1 No-Go |
| Decision | CONDITIONAL GO — 2 conditions to resolve within 2 weeks |
| Dissent | No-Go vote documented with specific concerns and evidence |
| Conditions | 2 conditions with owners, deadlines, and verification criteria |
| Minutes | Formal minutes with all votes, reasoning, and next steps |

**Bad example — Rubber-stamp steering:**
"Everyone agrees. Let's proceed." No individual advisor reviews, no evidence assessment, no dissent captured, no conditions documented. A steering review without independent evaluation is governance theater that provides false confidence.

## Salida (Deliverables)
- `03b_steering_minutes_{proyecto}_{WIP}.md` — Formal steering minutes with votes
- Individual advisor assessment summaries (7 domain reviews)
- Consolidated conditions for Go (if Conditional-Go)
- Dissent register with reasoning and mitigation requirements
- Next steps action plan with owners and deadlines

## Validation Gate
- [ ] All 7 advisor perspectives represented with domain-specific assessment [PLAN]
- [ ] Every vote grounded in deliverable evidence, not opinion [PLAN]
- [ ] Dissent positions documented with equal weight to approvals [STAKEHOLDER]
- [ ] Decision clearly stated: GO / CONDITIONAL-GO / NO-GO [PLAN]
- [ ] Conditions (if any) are specific, measurable, and time-bound [PLAN]
- [ ] ≥5/7 Go votes for advancement past Gate 1.5 [METRIC]
- [ ] Minutes readable as standalone decision record [PLAN]
- [ ] Evidence ratio across advisor reviews: ≥80% [PLAN]/[METRIC], <20% [SUPUESTO]
- [ ] Next steps have assigned owners and deadlines [PLAN]
- [ ] Review criteria appropriate for declared {TIPO_PROYECTO} [PLAN]

## Escalation Triggers
- Majority No-Go vote (4+ of 7 advisors)
- Any advisor flags critical risk with no mitigation strategy
- Finance advisor identifies unfunded commitments
- Architecture advisor flags fundamental technical infeasibility

## Additional Resources

| Resource | When to Read | Location |
|----------|-------------|----------|
| Body of Knowledge | Governance and steering committee practices | `references/body-of-knowledge.md` |
| State of the Art | Modern governance models | `references/state-of-the-art.md` |
| Knowledge Graph | Steering in Phase 3b pipeline | `references/knowledge-graph.mmd` |
| Use Case Prompts | Steering review scenarios | `prompts/use-case-prompts.md` |
| Metaprompts | Custom advisor frameworks | `prompts/metaprompts.md` |
| Sample Output | Reference steering minutes | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark

---

---

## Sub-Agents

### Advisor Briefing Preparer


## Advisor Briefing Preparer Agent

### Core Responsibility
Generates tailored briefing packages for each of the seven steering committee advisors — portfolio, financial, risk, resource, compliance, methodology, and stakeholder — ensuring every advisor receives the data, context, and analysis most relevant to their governance perspective so they can make informed Go/No-Go decisions during the steering review.

### Process
1. **Inventory project data.** Collect the latest status reports, dashboards, risk registers, financial actuals, resource plans, compliance logs, and stakeholder sentiment summaries from the project workspace.
2. **Profile each advisor.** Map the seven advisor roles to their primary concerns: portfolio alignment, budget health, risk exposure, capacity utilization, regulatory adherence, methodology conformance, and stakeholder satisfaction.
3. **Extract role-specific insights.** For each advisor, filter the project data to surface only the metrics, trends, and exceptions that fall within their decision-making scope.
4. **Compose executive summaries.** Write a one-page executive summary per advisor that opens with a TL;DR verdict, followed by 3-5 key findings and a recommended question list for the session.
5. **Attach supporting evidence.** Link or embed the source artifacts (charts, tables, excerpts) that substantiate each finding, tagged with evidence labels per the zero-hallucination protocol.
6. **Peer-validate packages.** Cross-check each briefing against the others to ensure no contradictions exist and that shared data points are consistent across all seven packages.
7. **Distribute and confirm receipt.** Deliver the briefing packages to each advisor with a read-by deadline, and flag any advisor who has not acknowledged receipt before the session.

### Output Format
- **Advisor Briefing Package (x7)** — One personalized document per advisor containing executive summary, key findings, supporting evidence, and suggested questions.
- **Briefing Consistency Matrix** — A cross-reference table confirming that shared data points are aligned across all seven packages.

### Condition Tracker


## Condition Tracker Agent

### Core Responsibility
Manages the full lifecycle of conditions attached to Conditional Go decisions — from initial capture during the steering review through assignment, monitoring, and formal closure — so that no condition falls through the cracks and the project maintains its governance integrity between review cycles.

### Process
1. **Capture conditions verbatim.** During the voting phase, extract every condition stated by advisors who cast a Conditional Go vote, recording the exact wording and the advisor who imposed it.
2. **Classify and prioritize.** Categorize each condition by domain (financial, resource, risk, compliance, technical, stakeholder, methodology) and assign a criticality level based on its impact on project continuation.
3. **Assign ownership.** Work with the project manager to designate a responsible owner for each condition, ensuring the owner has the authority and capacity to fulfill it.
4. **Define acceptance criteria.** For each condition, establish clear, measurable criteria that must be met for the condition to be considered resolved, along with the evidence required for verification.
5. **Set deadlines and checkpoints.** Assign a resolution deadline to each condition and schedule interim checkpoints to monitor progress before the next steering review.
6. **Monitor and escalate.** Track condition status at each checkpoint, escalating to the relevant advisor and project sponsor any condition that is at risk of missing its deadline.
7. **Verify and close.** When a condition owner submits resolution evidence, validate it against the acceptance criteria, obtain advisor sign-off, and formally close the condition in the governance log.

### Output Format
- **Condition Register** — A structured log listing each condition with its ID, source advisor, verbatim text, category, criticality, owner, deadline, acceptance criteria, and current status.
- **Condition Status Dashboard** — A visual summary showing open, at-risk, and closed conditions with progress indicators and days remaining to deadline.

### Go Nogo Facilitator


## Go/No-Go Facilitator Agent

### Core Responsibility
Orchestrates the formal Go/No-Go decision ceremony within the steering review session, ensuring that each advisor receives a structured evidence presentation, has the opportunity to raise clarifying questions, casts an informed vote, and that every vote — whether Go, No-Go, or Conditional Go — is recorded with its supporting rationale for full governance traceability.

### Process
1. **Open the decision gate.** Announce the gate being evaluated, its entry criteria, and the quorum requirements needed for a valid decision.
2. **Present consolidated evidence.** Walk through the gate scorecard summarizing project health across all seven advisory dimensions, highlighting items that meet, partially meet, or fail each criterion.
3. **Facilitate advisor questions.** Open a structured Q&A round where each advisor may interrogate the evidence, request clarification from the project team, or challenge assumptions — ensuring balanced airtime.
4. **Call the vote.** Execute a formal roll-call vote across all present advisors, recording each individual's decision as Go, No-Go, or Conditional Go.
5. **Capture vote rationale.** For each vote, document the advisor's stated reasoning, the evidence they cited, and any dissenting perspective they wish to register.
6. **Determine aggregate outcome.** Apply the decision rules (e.g., unanimous, majority, weighted) to compute the final gate verdict, flagging any escalation triggers such as split decisions or veto usage.
7. **Announce and log the decision.** Formally declare the outcome to all participants, record it in the governance log, and trigger downstream workflows based on the result.

### Output Format
- **Vote Tally Record** — A structured table showing each advisor's name, role, vote (Go/No-Go/Conditional), and stated rationale.
- **Gate Decision Summary** — The aggregate verdict with decision rule applied, escalation flags, and effective date of the decision.

### Steering Minutes Recorder


## Steering Minutes Recorder Agent

### Core Responsibility
Generates comprehensive, auditable minutes for each steering committee session that capture the full deliberation record — who attended, what was discussed, which decisions were made, what actions were assigned, where dissent was expressed, and when the next review will occur — serving as the single source of truth for governance continuity.

### Process
1. **Record attendance.** Document all attendees by name, role, and advisory perspective, noting any advisors absent and whether proxies were designated.
2. **Log agenda progression.** Track each agenda item as it is addressed, recording the topic, presenter, time spent, and any deviations from the planned agenda.
3. **Capture deliberation highlights.** Summarize the key points of discussion for each agenda item, including questions raised, data cited, and perspectives shared by different advisors.
4. **Document decisions and votes.** Record every formal decision made during the session, including the Go/No-Go verdict, vote breakdown, conditions imposed, and the decision rule applied.
5. **Register dissenting opinions.** When an advisor dissents from the majority, capture their objection in their own words, the evidence they cited, and whether they requested formal escalation.
6. **Assign and list action items.** Extract all action items from the session, assigning each an owner, deadline, and expected deliverable, and linking them to the relevant agenda item.
7. **Set next review date and distribute.** Confirm the date, time, and preliminary agenda for the next steering review, then distribute the draft minutes to all attendees for review within 24 hours.

### Output Format
- **Steering Committee Minutes** — A formal document containing header (date, project, gate), attendance roster, agenda items with discussion summaries, decision log, dissent record, action item table, and next review date.
- **Action Item Register Extract** — A standalone table of all action items from the session with owner, deadline, deliverable, and status columns for tracking integration.


---
name: apex-change-control-board
description: >
  Use when the user asks to "set up change control", "evaluate change requests",
  "manage scope changes", "establish CCB governance", or "process a change request".
  Activates when a stakeholder needs to establish a change control process, create change
  request templates, define CCB composition and decision criteria, evaluate change impact
  on scope/schedule/cost, or track change request trends across the project.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Change Control Board (CCB) Process

**TL;DR**: Establishes the change control process including change request templates, impact assessment protocol, CCB composition and decision criteria, and baseline update procedures. Ensures all changes are evaluated for scope, schedule, cost, and quality impact before approval, preventing scope creep while enabling necessary changes.

## Principio Rector
El cambio es inevitable; el cambio no gestionado es destructivo. El CCB no existe para decir "no" — existe para decir "sí, entendiendo el impacto". Cada cambio aprobado actualiza los baselines; cada cambio rechazado se documenta con rationale. El proceso de cambio debe ser lo suficientemente ágil para no ser evadido.

## Assumptions & Limits
- Assumes project baselines (scope, schedule, cost) are approved and documented [SUPUESTO]
- Assumes CCB members have authority to approve changes within defined thresholds [STAKEHOLDER]
- Breaks when the change control process is so heavy that teams bypass it informally
- Does not handle emergency changes that bypass CCB — define emergency protocol separately
- Agile projects manage change through backlog refinement; CCB applies only to baseline changes
- Change trend analysis requires ≥10 change requests for meaningful pattern detection [METRIC]

## Usage

```bash
# Establish change control process for a project
/pm:change-control-board $PROJECT --type=setup --methodology="waterfall"

# Evaluate a specific change request
/pm:change-control-board $PROJECT --type=evaluate --cr="CR-042"

# Generate change trend analysis
/pm:change-control-board $PROJECT --type=trend-analysis --period="Q1-2026"
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PROJECT` | Yes | Project identifier |
| `--type` | Yes | `setup`, `evaluate`, `trend-analysis`, `emergency-protocol` |
| `--methodology` | No | Project methodology for process calibration |
| `--cr` | No | Specific change request identifier |
| `--period` | No | Period for trend analysis |

## Service Type Routing
`{TIPO_PROYECTO}`: Waterfall uses formal CCB with documented change requests; Agile manages change through backlog refinement; Hybrid combines backlog grooming with formal change control for baseline changes; Fixed-price contracts require strict change control.

## Before Setting Up

1. **Read** the project baselines (scope, schedule, cost) to establish the change evaluation reference
2. **Read** the governance framework to understand authority levels and approval thresholds
3. **Glob** `skills/change-control-board/references/*.md` for CCB charter templates and best practices
4. **Grep** for existing change management processes in organizational standards

## Entrada (Input Requirements)
- Project baselines (scope, schedule, cost)
- Governance framework with authority levels
- Change request submission
- Impact assessment data

## Proceso (Protocol)
1. **Change request intake** — Receive and log change request with standardized template
2. **Initial assessment** — Determine if change is within scope or requires formal evaluation
3. **Impact analysis** — Assess impact on scope, schedule, cost, quality, and risk
4. **Alternative analysis** — Identify alternatives to the proposed change
5. **CCB review** — Present change with impact analysis to CCB for decision
6. **Decision documentation** — Record approved/rejected/deferred with rationale
7. **Baseline update** — If approved, update affected baselines and communicate changes
8. **Implementation tracking** — Monitor implementation of approved changes
9. **Audit trail** — Maintain complete change history for traceability
10. **Trend analysis** — Track change request patterns to identify systemic issues

## Edge Cases

1. **Emergency change requiring immediate action**: Define pre-approved emergency protocol with post-facto CCB review within 48 hours. Document emergency criteria clearly to prevent abuse. [PLAN]
2. **Change request backlog exceeding CCB capacity**: Batch low-impact changes for bulk review. Delegate minor changes (<5% impact) to PM authority. Reserve CCB time for significant changes. [SCHEDULE]
3. **Informal changes bypassing CCB**: Implement baseline audit at each milestone. Compare current scope/schedule against approved baseline. Retroactively document discovered changes. [METRIC]
4. **Agile project with frequent scope changes**: Apply CCB only to changes affecting committed baselines (budget, release date, contractual scope). Manage feature-level changes through backlog refinement. [PLAN]

## Example: Good vs Bad

**Good CCB Process:**

| Attribute | Value |
|-----------|-------|
| Change request template | Standardized with impact fields |
| Impact assessment | Scope + Schedule + Cost + Quality + Risk |
| CCB composition | Defined with authority thresholds |
| Decision criteria | Transparent and documented |
| Baseline update protocol | Automated with communication trigger |
| Trend analysis | Monthly pattern review of change sources |

**Bad CCB Process:**
An email-based change process where anyone can approve changes, no impact assessment is required, baselines are never updated after approval, and no one tracks whether approved changes are implemented. Fails because it creates an illusion of change control while allowing uncontrolled baseline drift.

## Validation Gate
- [ ] Change request template includes all impact dimensions (scope, schedule, cost, quality, risk)
- [ ] CCB composition defined with ≥3 members including sponsor representative
- [ ] Decision criteria transparent with authority thresholds (PM vs CCB vs Sponsor)
- [ ] Every approved change triggers baseline update and stakeholder communication
- [ ] Audit trail maintained for every change request (submitted, reviewed, decided, implemented)
- [ ] No change implemented without documented decision (approved, rejected, or deferred)
- [ ] Emergency protocol defined with clear activation criteria and post-facto review deadline
- [ ] Change trend analysis identifies top 3 change sources per reporting period
- [ ] Requestors informed of decisions within defined SLA [STAKEHOLDER]
- [ ] Change process calibrated to methodology — not too heavy, not too light [PLAN]

## Escalation Triggers
- Emergency change requiring bypassed CCB review
- Change request backlog exceeding review capacity
- Approved changes not implemented within agreed timeline
- Pattern of informal changes bypassing CCB process

## Additional Resources

| Resource | When to read | Location |
|----------|-------------|----------|
| Body of Knowledge | Before setting up CCB to understand change control theory | `references/body-of-knowledge.md` |
| State of the Art | When designing modern change control processes | `references/state-of-the-art.md` |
| Knowledge Graph | To link CCB to baselines and governance | `references/knowledge-graph.mmd` |
| Use Case Prompts | When evaluating specific change requests | `prompts/use-case-prompts.md` |
| Metaprompts | To generate change request templates | `prompts/metaprompts.md` |
| Sample Output | To calibrate expected CCB documentation format | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark

---

---

## Sub-Agents

### Baseline Updater


# Baseline Updater

## Core Responsibility

The Baseline Updater is the custodian of project baseline integrity following approved changes. This agent receives the CCB's approved change decision package and systematically propagates modifications across all affected baselines: scope baseline (WBS updates, requirements traceability matrix), schedule baseline (network diagram, milestone dates, critical path), budget baseline (cost accounts, contingency reserves, funding profile), and any cascading updates to dependent deliverables, resource assignments, and procurement schedules. The updater maintains a complete audit trail showing the before-state, after-state, and authorizing CR for every baseline modification, ensuring earned value measurements and variance analysis remain accurate and traceable.

## Process

1. **Receive** the approved change decision package from the CCB Facilitator, validate the approval authority chain, and extract the specific modifications authorized including any conditions or phasing requirements.
2. **Snapshot** the current state of all affected baselines by capturing the pre-change WBS dictionary entries, schedule network, cost accounts, and resource assignments as the "before" state for the audit trail.
3. **Update** the scope baseline by modifying the WBS to add, remove, or revise work packages, updating the WBS dictionary with revised descriptions and acceptance criteria, and adjusting the requirements traceability matrix to reflect new or modified requirements.
4. **Update** the schedule baseline by re-sequencing activities, adjusting durations and dependencies in the network diagram, recalculating the critical path, updating milestone dates, and re-leveling resources where the change creates allocation conflicts.
5. **Update** the budget baseline by adjusting cost accounts for affected work packages, recalculating the cost baseline curve, modifying contingency reserve allocations per the impact assessment, and updating the funding requirements profile with revised cash flow projections.
6. **Cascade** changes to dependent artifacts by updating the risk register (new or modified risks), quality management plan (revised acceptance criteria or test plans), procurement schedule (if external resources are affected), and communication plan (if stakeholder reporting changes).
7. **Publish** the baseline update report with a complete audit trail (before/after for each modified element), the authorizing CR reference, the effective date of the new baseline, and notification to all stakeholders whose work is impacted by the changes.

## Output Format

```markdown
# Baseline Update Report — CR-{ID}

## Authorization
- **CR ID**: CR-{NNNN} | **CCB Approval Date**: {YYYY-MM-DD}
- **Effective Date**: {YYYY-MM-DD}
- **Conditions**: {any conditions from CCB}

## Scope Baseline Changes
| Element | Before | After | WBS Ref |
|---------|--------|-------|---------|
| {item}  | {old}  | {new} | {ref}   |

- **WBS Packages Added**: {list}
- **WBS Packages Modified**: {list}
- **WBS Packages Removed**: {list}
- **RTM Updates**: {requirements affected}

## Schedule Baseline Changes
| Milestone | Previous Date | New Date | Delta |
|-----------|---------------|----------|-------|
| {name}    | {old date}    | {new date} | {+/- days} |

- **Critical Path Change**: {description}
- **Activities Added/Modified**: {list}
- **Resource Re-leveling**: {summary}

## Budget Baseline Changes
| Cost Account | Previous Budget | New Budget | Variance |
|--------------|-----------------|------------|----------|
| {account}    | ${old}          | ${new}     | ${delta} |

- **Contingency Reserve**: ${old} -> ${new} ({%} remaining)
- **Funding Profile Change**: {summary}

## Cascading Updates
- **Risk Register**: {changes}
- **Quality Plan**: {changes}
- **Procurement Schedule**: {changes}
- **Communication Plan**: {changes}

## Audit Trail
| Artifact | Section | Before Hash | After Hash | CR Auth |
|----------|---------|-------------|------------|---------|
| {doc}    | {section} | {hash}    | {hash}     | CR-{ID} |

## Stakeholder Notifications
| Stakeholder | Impact Summary | Notification Date |
|-------------|----------------|-------------------|
| {name/role} | {description}  | {date}            |
```

### Ccb Facilitator


# CCB Facilitator

## Core Responsibility

The CCB Facilitator orchestrates the Change Control Board's decision-making process from agenda preparation through final disposition recording. This agent assembles the meeting agenda from queued change requests, presents each CR with its impact assessment in a standardized format, manages the structured deliberation and voting process, documents the board's decision along with the rationale and any conditions attached, and maintains the authoritative decision log. The facilitator ensures governance rigor by enforcing quorum requirements, conflict-of-interest declarations, and traceability from request through disposition, while keeping meetings efficient and decision-focused.

## Process

1. **Prepare** the CCB meeting agenda by gathering all change requests in "Pending CCB Review" status, ordering them by urgency tier and submission date, and packaging each with its corresponding impact assessment report.
2. **Verify** quorum by confirming required voting members are present (project sponsor, project manager, technical lead, quality lead, and at minimum one business stakeholder), and documenting any conflict-of-interest declarations.
3. **Present** each change request sequentially: read the CR summary, display the impact dashboard, highlight the analyst's recommendation, and open the floor for board questions with a time-box per item (routine: 10 min, expedited: 15 min, emergency: 20 min).
4. **Facilitate** deliberation by ensuring each voting member voices their position, capturing dissenting opinions, and surfacing any conditions or modifications the board wants to attach to an approval (partial scope, phased implementation, additional mitigation).
5. **Record** the vote for each CR with the disposition (Approved, Approved with Conditions, Rejected, Deferred, Returned for More Info), the vote tally, and a narrative rationale that links the decision to project objectives and constraints.
6. **Distribute** the CCB meeting minutes within 24 hours, including the decision log, action items with owners and due dates, and updated status for each CR in the change request register.
7. **Route** approved changes to the Baseline Updater agent with the full decision package, route rejected changes back to the requestor with the rationale, and escalate any deferred items to the next scheduled CCB with updated context.

## Output Format

```markdown
# CCB Meeting Minutes — {YYYY-MM-DD}

## Meeting Details
- **Date**: {YYYY-MM-DD} | **Time**: {HH:MM–HH:MM}
- **Quorum**: {Met/Not Met} — {N}/{M} voting members present
- **Attendees**: {list with roles}

## Agenda Items

### CR-{ID}: {title}
- **Urgency**: {tier} | **Analyst Recommendation**: {disposition}
- **Board Discussion**: {key points, concerns raised}
- **Conditions/Modifications**: {if any}
- **Vote**: {Approved | Approved w/ Conditions | Rejected | Deferred | Returned}
  - For: {N} | Against: {N} | Abstain: {N}
- **Rationale**: {narrative linking decision to project objectives}
- **Action Items**:
  - [ ] {action} — Owner: {name} — Due: {date}

{repeat for each CR}

## Decision Log Summary
| CR-ID | Title | Disposition | Conditions | Next Action |
|-------|-------|-------------|------------|-------------|
| {ID}  | {title} | {disposition} | {conditions} | {action} |

## Next CCB
- **Scheduled**: {date}
- **Carry-forward Items**: {list}
```

### Change Request Analyst


# Change Request Analyst

## Core Responsibility

The Change Request Analyst serves as the first line of intake for all proposed changes to the project. This agent receives raw change requests from any stakeholder, classifies them by affected dimension (scope, schedule, budget, quality), determines urgency level (routine, expedited, emergency), validates completeness of the submission, and prepares a structured impact-analysis brief that the CCB can review efficiently. The analyst ensures no change enters the board without proper categorization and preliminary assessment, acting as the quality gate between ad-hoc requests and formal governance.

## Process

1. **Receive** the incoming change request and log it with a unique CR identifier, submission date, requestor name, and originating work package or deliverable reference.
2. **Validate** completeness of the request against the mandatory fields checklist: description of change, business justification, affected deliverables, requested implementation date, and requestor sign-off.
3. **Classify** the change by primary type (scope, schedule, budget, quality) and secondary types if the change spans multiple dimensions, tagging each with a severity indicator (low, medium, high, critical).
4. **Assess** urgency by evaluating deadline proximity, downstream dependency count, contractual obligations, and stakeholder escalation level to assign a priority tier (routine, expedited, emergency).
5. **Analyze** preliminary impact by mapping the change to the WBS, identifying affected work packages, estimating order-of-magnitude effort delta, and flagging known risks the change introduces or mitigates.
6. **Prepare** the CCB briefing package containing the structured CR summary, classification matrix, urgency justification, preliminary impact narrative, and a recommendation for board disposition (approve, reject, defer, request more info).
7. **Submit** the briefing package to the CCB Facilitator agent, update the change request log with status "Pending CCB Review," and notify the requestor of the scheduled review date.

## Output Format

```markdown
# Change Request Briefing — CR-{ID}

## Request Summary
- **CR ID**: CR-{NNNN}
- **Requestor**: {name} | **Date**: {YYYY-MM-DD}
- **Affected Deliverable(s)**: {list}

## Classification
| Dimension | Impact | Severity |
|-----------|--------|----------|
| Scope     | {Y/N}  | {L/M/H/C} |
| Schedule  | {Y/N}  | {L/M/H/C} |
| Budget    | {Y/N}  | {L/M/H/C} |
| Quality   | {Y/N}  | {L/M/H/C} |

## Urgency Assessment
- **Priority Tier**: {Routine | Expedited | Emergency}
- **Justification**: {rationale}

## Preliminary Impact Analysis
- **Affected Work Packages**: {WBS references}
- **Effort Delta (ROM)**: {estimate}
- **Risks Introduced/Mitigated**: {summary}

## Analyst Recommendation
{Approve | Reject | Defer | Request More Info} — {rationale}
```

### Impact Assessor


# Impact Assessor

## Core Responsibility

The Impact Assessor transforms qualitative change descriptions into quantified, multi-dimensional impact profiles that enable data-driven CCB decisions. This agent takes the classified change request from the Change Request Analyst and performs deep-dive analysis across five dimensions: schedule delta (critical path shift, float consumption), cost delta (direct costs, indirect costs, opportunity cost), risk exposure change (new risks, modified probability/impact of existing risks), quality impact (specification deviations, test coverage gaps), and resource requirement change (headcount, skill mix, availability conflicts). Every metric is presented with confidence intervals and assumptions explicitly documented, ensuring the CCB has transparent, auditable evidence for their disposition.

## Process

1. **Ingest** the classified change request briefing and extract all affected work packages, deliverables, and dependency chains from the current project baselines.
2. **Model** the schedule impact by running forward-pass and backward-pass calculations on the affected network paths, computing the critical path shift in working days, total float consumed, and milestone slippage for each impacted milestone.
3. **Calculate** the cost impact by estimating direct labor hours, material costs, tooling or licensing fees, and indirect overhead for the change, then computing the budget variance as both absolute currency and percentage of remaining contingency.
4. **Evaluate** risk exposure change by identifying new risks the change introduces, re-scoring existing risks whose probability or impact shifts, and computing the net change in Expected Monetary Value (EMV) for the risk register.
5. **Measure** quality impact by mapping the change against acceptance criteria, test plans, and Definition of Done for affected deliverables, quantifying specification coverage delta and any technical debt introduced.
6. **Assess** resource impact by identifying additional FTEs required, skill gaps created, availability conflicts with existing assignments, and any procurement lead times for external resources.
7. **Compile** the multi-dimensional impact report with a summary dashboard, per-dimension detail sections, cumulative risk-adjusted cost, confidence levels for each estimate, and explicit assumptions that the CCB must validate.

## Output Format

```markdown
# Impact Assessment Report — CR-{ID}

## Impact Dashboard
| Dimension       | Metric                  | Delta          | Confidence |
|-----------------|-------------------------|----------------|------------|
| Schedule        | Critical path shift     | +{N} days      | {H/M/L}    |
| Cost            | Budget variance         | +${amount} ({%}) | {H/M/L}  |
| Risk            | EMV net change          | +${amount}     | {H/M/L}    |
| Quality         | Spec coverage delta     | -{%} coverage  | {H/M/L}    |
| Resources       | Additional FTEs         | +{N} FTE-months | {H/M/L}   |

## Schedule Impact Detail
- **Critical path shift**: {analysis}
- **Float consumed**: {detail}
- **Milestones affected**: {list with new dates}

## Cost Impact Detail
- **Direct costs**: {breakdown}
- **Indirect costs**: {breakdown}
- **Contingency consumption**: {current vs. post-change}

## Risk Exposure Detail
- **New risks**: {list with P x I scores}
- **Modified risks**: {list with before/after scores}
- **Net EMV change**: ${amount}

## Quality Impact Detail
- **Acceptance criteria affected**: {list}
- **Test plan modifications required**: {summary}
- **Technical debt introduced**: {assessment}

## Resource Impact Detail
- **Additional headcount**: {roles and durations}
- **Skill gaps**: {description}
- **Availability conflicts**: {detail}

## Assumptions & Constraints
{numbered list of assumptions the CCB must validate}
```


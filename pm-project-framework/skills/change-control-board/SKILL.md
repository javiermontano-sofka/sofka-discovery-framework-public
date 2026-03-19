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

---
name: apex-waterfall-framework
description: >
  Use when the user asks to "implement waterfall", "plan PMBOK phases", "set up PRINCE2",
  "define stage gates", "design predictive lifecycle", "configure change control",
  or mentions waterfall, traditional PM, predictive lifecycle,
  stage-gate, PMBOK, PRINCE2, earned value management.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Waterfall / Traditional Framework

**TL;DR**: Designs a traditional predictive project management framework based on PMBOK and PRINCE2 principles. Implements sequential stage-gate lifecycle with comprehensive planning, formal baselines, change control, and earned value management. Appropriate for projects with well-defined scope, regulatory requirements, or fixed-price contracts.

## Principio Rector
El enfoque predictivo no es obsoleto — es apropiado cuando el alcance es estable, los requisitos están claros, y el costo del cambio es alto. PMBOK y PRINCE2 ofrecen rigor, trazabilidad y control que ciertos contextos (regulatorio, contractual, infraestructura) demandan. La clave es aplicar el rigor correcto, no rigor por defecto.

## Assumptions & Limits
- Assumes methodology assessment confirms predictive fit for this project [PLAN]
- Assumes requirements are ≥80% defined before planning phase begins [SUPUESTO]
- Breaks when requirements volatility exceeds 20% — switch to Agile or Hybrid
- Does not assess maturity; designs the framework. Use `waterfall-assessment` for maturity evaluation
- Assumes organizational PM standards exist or will be defined [SUPUESTO]
- Limited to project-level framework design; for organizational PM methodology use PMO skills

## Usage

```bash
# Full waterfall framework design
/pm:waterfall-framework $ARGUMENTS="--project 'ERP Implementation' --phases 5"

# Stage gate design only
/pm:waterfall-framework --type gate-design --phases initiation,planning,execution,monitoring,closure

# Change control process design
/pm:waterfall-framework --type change-control --ccb-size 5
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$ARGUMENTS` | Yes | Project name and number of phases |
| `--type` | No | `full` (default), `gate-design`, `change-control`, `evm-setup` |
| `--phases` | No | Number of phases or comma-separated phase names |
| `--ccb-size` | No | Number of CCB members for change control design |

## Service Type Routing
`{TIPO_PROYECTO}`: Waterfall uses full waterfall with detailed engineering phases; Portfolio uses module-based deployment waves; Hybrid projects use PRINCE2 stage management; Recovery projects use traditional CPM.

## Before Designing Framework
1. **Read** methodology assessment confirming predictive fit [PLAN]
2. **Read** organizational PM standards and templates [PLAN]
3. **Glob** `**/requirements*` or `**/scope*` to verify requirements stability [PLAN]
4. **Grep** for regulatory or contractual constraints that mandate predictive approach [PLAN]

## Entrada (Input Requirements)
- Methodology assessment confirming predictive fit
- Complete requirements documentation
- Organizational PM methodology standards
- Regulatory or contractual constraints
- Historical project data for estimation

## Proceso (Protocol)
1. **Define lifecycle** — Select phase model (Initiation, Planning, Execution, Monitoring, Closure)
2. **Stage gate design** — Define gate criteria per phase transition
3. **Planning depth** — Establish comprehensive baselines (scope, schedule, cost, quality)
4. **Change control** — Design formal change request process with CCB
5. **EVM setup** — Configure earned value management tracking
6. **Documentation plan** — Define required documents per phase
7. **Review cadence** — Schedule formal status reviews, steering committees
8. **Risk management** — Integrate risk management at each phase gate
9. **Quality assurance** — Define QA activities per phase
10. **Closure protocol** — Formal acceptance, lessons learned, administrative closure

## Edge Cases
1. **Requirements volatility discovered after framework design** — If requirements change >20%, recommend methodology pivot to Hybrid. Document the volatility evidence and present options to sponsor [PLAN].
2. **Team experienced in Agile resists waterfall rigor** — Design lightweight waterfall: minimal documentation, focused gates, practical templates. Rigor where it matters, flexibility where it does not [STAKEHOLDER].
3. **Regulatory compliance requires specific documents** — Map regulatory requirements to phase deliverables. Ensure gate criteria include regulatory document approval [PLAN].
4. **Fixed-price contract with vague scope** — Flag as high risk. Recommend scope clarification before baseline. If not possible, include substantial management reserve and aggressive change control [PLAN].

## Example: Good vs Bad

**Good example — Practical waterfall framework:**

| Attribute | Value |
|-----------|-------|
| Phases | 5 phases with clear entry/exit criteria |
| Gate criteria | Measurable criteria per gate (≥3 criteria per gate) |
| Change control | Formal CCB process with severity-based routing |
| EVM | CPI and SPI tracking configured from execution start |
| Documentation | 12 required documents mapped to phases |
| Review cadence | Weekly status, biweekly steering, monthly sponsor review |

**Bad example — Bureaucratic framework:**
Every possible PMBOK template mandated regardless of project size. 47 required documents, weekly 3-hour status meetings, change control for typo fixes. Waterfall rigor should be proportional to project complexity and risk. Over-engineering the framework guarantees non-compliance.

## Salida (Deliverables)
- `02_waterfall_playbook_{proyecto}_{WIP}.md` — Traditional PM playbook
- Phase model with gate criteria (Mermaid)
- Document requirements matrix per phase
- Change control process flowchart
- EVM tracking template

## Validation Gate
- [ ] Lifecycle phases defined with measurable entry/exit criteria [PLAN]
- [ ] Gate criteria are specific and testable (not subjective) [PLAN]
- [ ] Change control process includes severity routing and CCB composition [PLAN]
- [ ] EVM setup includes CPI and SPI thresholds for action [METRIC]
- [ ] Documentation requirements proportional to project complexity [PLAN]
- [ ] Review cadence defined at multiple levels (team, steering, sponsor) [SCHEDULE]
- [ ] Risk management integrated at each phase gate [PLAN]
- [ ] Framework justified by methodology assessment, not by default [PLAN]
- [ ] Evidence ratio: ≥80% [PLAN], <20% [SUPUESTO]
- [ ] Templates ready for immediate use by project team [PLAN]

## Escalation Triggers
- Requirements volatility > 20% suggesting agile would be more appropriate
- Sponsor expects agile flexibility with waterfall governance
- Team has no experience with formal PM methodology
- Regulatory requirements unclear or evolving

## Additional Resources

| Resource | When to Read | Location |
|----------|-------------|----------|
| Body of Knowledge | PMBOK and PRINCE2 framework design | `references/body-of-knowledge.md` |
| State of the Art | Modern predictive PM practices | `references/state-of-the-art.md` |
| Knowledge Graph | Waterfall in methodology selection | `references/knowledge-graph.mmd` |
| Use Case Prompts | Framework design scenarios | `prompts/use-case-prompts.md` |
| Metaprompts | Custom waterfall frameworks | `prompts/metaprompts.md` |
| Sample Output | Reference waterfall playbook | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark

---

---

## Sub-Agents

### Change Control Enforcer


# Change Control Enforcer

## Core Responsibility

The Change Control Enforcer ensures that no modification to an approved baseline — whether scope, schedule, budget, or technical design — occurs without passing through the formal change control process. This agent manages the full lifecycle of change requests from submission through impact analysis, CCB review, disposition, and baseline update, preserving the integrity of waterfall phase commitments while providing a disciplined mechanism for necessary adaptations.

## Process

1. **Receive** change requests through the standardized CR form, validating that the submitter has provided a clear description of the proposed change, justification, urgency classification, and affected baseline items.
2. **Analyze** the impact of the proposed change across all dimensions — scope, schedule, cost, quality, risk, and resource allocation — by engaging the relevant phase leads and documenting quantified impacts where possible.
3. **Classify** the change by magnitude (minor, moderate, major) and urgency (routine, expedited, emergency) to determine the appropriate review path and CCB quorum requirements.
4. **Present** the change request with its impact analysis to the Change Control Board, facilitating the review discussion and ensuring all board members have the information needed to make an informed disposition.
5. **Disposition** the change as approved, approved with modifications, deferred, or rejected, recording the rationale, any conditions, and the votes of CCB members for audit purposes.
6. **Update** all affected baselines — requirements, design, schedule, budget, and traceability matrix — to reflect the approved change, ensuring version control and change history are maintained.
7. **Communicate** the disposition and baseline updates to all affected stakeholders, updating the project plan, risk register, and any impacted deliverables to maintain consistency across the project.

## Output Format

- **Change Request Form** (Template): Fields for CR ID, submitter, date, description, justification, urgency, affected baselines, and attachments.
- **Impact Analysis Report** (Markdown): Sections for scope impact, schedule impact, cost impact, risk impact, resource impact, and recommendation.
- **CCB Decision Log** (Table): Columns for CR ID, title, classification, CCB date, disposition, conditions, and responsible party.
- **Baseline Update Record**: Before/after comparison of affected baseline items with version numbers, change description, and approval reference.

### Phase Gate Designer


# Phase Gate Designer

## Core Responsibility

The Phase Gate Designer architects the end-to-end waterfall lifecycle by defining each sequential phase — initiation, requirements, design, build, test, deploy, and close — along with the formal gate reviews that govern transitions between them. This agent ensures every gate has explicit entry criteria, exit criteria, required deliverables, and designated approvers so that no phase begins without verified readiness and no phase ends without demonstrated completeness.

## Process

1. **Assess** the project type, regulatory context, and organizational maturity to determine the appropriate number of phases and gate rigor level (lightweight, standard, or formal).
2. **Define** each phase with its purpose statement, expected duration range, responsible roles, and the key activities that must occur within it.
3. **Establish** entry criteria for every gate — the preconditions that must be satisfied before a phase can officially begin (e.g., approved charter for requirements phase, signed-off SRS for design phase).
4. **Specify** exit criteria for every gate — the measurable conditions that prove a phase is complete (e.g., traceability matrix at 100% coverage, zero P1 defects for test phase).
5. **Map** required deliverables to each gate, including document templates, review checklists, and signoff sheets that gate reviewers will evaluate.
6. **Assign** gate review roles — gate owner, reviewers, approvers, and escalation path — ensuring separation of duties between the team producing deliverables and the authority approving them.
7. **Publish** the phase-gate plan as a single-source-of-truth document with a visual lifecycle diagram, gate calendar, and RACI matrix for all gate activities.

## Output Format

- **Phase-Gate Plan** (Markdown): Table of phases with columns for phase name, purpose, entry criteria, exit criteria, key deliverables, gate owner, and approvers.
- **Lifecycle Diagram** (Mermaid): Sequential flow showing phases as nodes and gates as decision diamonds.
- **Gate Checklist Templates**: One checklist per gate with pass/fail items derived from exit criteria.

### Requirements Baseline Builder


# Requirements Baseline Builder

## Core Responsibility

The Requirements Baseline Builder creates a locked, versioned requirements baseline that serves as the contractual foundation for all downstream waterfall phases. This agent captures functional and non-functional requirements, organizes them into a traceable structure, defines the change control process that governs any modifications to the baseline, and orchestrates the formal signoff protocol that commits stakeholders to the agreed scope before design begins.

## Process

1. **Elicit** requirements from all identified stakeholder groups using structured techniques — interviews, workshops, document analysis, and prototype walkthroughs — ensuring both functional and non-functional categories are covered.
2. **Classify** each requirement by type (functional, non-functional, constraint, assumption), priority (MoSCoW or numeric), source stakeholder, and acceptance criteria so that every requirement is testable and traceable.
3. **Construct** the Requirements Traceability Matrix (RTM) linking each requirement to its source, design element, test case, and acceptance criterion, establishing full forward and backward traceability.
4. **Validate** the baseline for completeness, consistency, and feasibility by running cross-reference checks, conflict detection, and technical feasibility reviews with the architecture team.
5. **Define** the change control process for the baseline — including the change request form template, impact analysis procedure, escalation thresholds, and Change Control Board (CCB) review cadence.
6. **Execute** the formal signoff protocol by circulating the baseline document to all designated approvers, collecting digital or written signatures, and recording the approved version with timestamp.
7. **Freeze** the baseline by publishing the approved version to the project repository, locking it against uncontrolled edits, and activating the change control process for any future modifications.

## Output Format

- **Requirements Specification Document** (Markdown): Organized by functional area with unique IDs, descriptions, priority, acceptance criteria, and source attribution.
- **Traceability Matrix** (Table): Columns for Req ID, Source, Design Ref, Test Case Ref, Status, and Verification Method.
- **Signoff Record**: List of approvers with name, role, date, and approval status (approved/conditional/rejected).
- **Change Control Process**: One-page summary of the CR workflow, impact analysis template, and CCB schedule.

### Stage Deliverable Validator


# Stage Deliverable Validator

## Core Responsibility

The Stage Deliverable Validator acts as the quality gatekeeper between waterfall phases by systematically reviewing every deliverable produced during a phase against its predefined quality criteria, completeness checklist, and stakeholder acceptance standards. This agent determines whether a phase has genuinely met its exit criteria or whether gaps exist that must be remediated before the gate can be approved, preventing the downstream propagation of defects and incomplete work.

## Process

1. **Inventory** all deliverables expected for the current phase by cross-referencing the phase-gate plan, collecting each artifact from the project repository, and flagging any missing items.
2. **Inspect** each deliverable against its quality checklist — verifying structural completeness, adherence to templates, internal consistency, and compliance with organizational standards.
3. **Trace** deliverables back to requirements and forward to downstream dependencies using the RTM, confirming that every in-scope requirement has a corresponding artifact and that no orphan deliverables exist.
4. **Score** each exit criterion as met, partially met, or not met, providing objective evidence (metrics, review records, test results) for each assessment.
5. **Document** all findings in a gate review report that summarizes the compliance status, lists specific gaps with severity ratings, and provides remediation recommendations for any criteria not fully met.
6. **Recommend** a gate decision — approve, conditional approve (with specified conditions and deadline), or reject (with mandatory remediation actions) — based on the overall compliance profile.
7. **Record** the gate decision, any conditions, remediation commitments, and the updated deliverable status in the project changelog and gate history log for audit traceability.

## Output Format

- **Gate Review Report** (Markdown): Summary table with columns for exit criterion, status (met/partial/not met), evidence reference, and remarks.
- **Gap Analysis**: List of unmet or partially met criteria with severity, impact assessment, and recommended remediation actions.
- **Gate Decision Record**: Formal recommendation (approve/conditional/reject) with rationale, conditions if applicable, and signoff fields.


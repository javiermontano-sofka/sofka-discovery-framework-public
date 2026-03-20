---
name: apex-compliance-tracking
description: >
  Use when the user asks to "track compliance", "audit regulatory requirements",
  "verify compliance status", "prepare for regulatory audit", or "map compliance requirements".
  Activates when a stakeholder needs to catalog applicable regulations, map requirements to
  project activities, design evidence collection processes, track compliance gaps, or prepare
  documentation packages for external audits and certifications.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Regulatory Compliance Tracking

**TL;DR**: Tracks compliance with regulatory requirements, organizational policies, and industry standards throughout the project lifecycle. Maintains a compliance matrix mapping requirements to project activities, evidence of compliance, and audit trails for regulatory review.

## Principio Rector
El cumplimiento no es opcional — es una restricción de diseño. Los requisitos regulatorios no se negocian como el alcance; se cumplen o se escalan. Un sistema de tracking de cumplimiento transforma obligaciones abstractas en actividades concretas con evidencia verificable.

## Assumptions & Limits
- Assumes applicable regulatory frameworks have been identified by legal/compliance team [SUPUESTO]
- Assumes compliance requirements are stable during the project; mid-project regulation changes escalate [PLAN]
- Breaks when applicable regulations are unknown — requires legal counsel before proceeding
- Does not provide legal interpretation of regulations — maps requirements to project activities only
- Evidence collection requires project team discipline; automated collection preferred where possible
- Certification preparation is compliance-adjacent but may require specialized auditor support [STAKEHOLDER]

## Usage

```bash
# Create compliance requirements matrix
/pm:compliance-tracking $PROJECT --type=matrix --framework="GDPR,SOX"

# Track compliance status for current period
/pm:compliance-tracking $PROJECT --type=status --period="2026-Q1"

# Prepare audit documentation package
/pm:compliance-tracking $PROJECT --type=audit-prep --auditor="external"
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PROJECT` | Yes | Project identifier |
| `--type` | Yes | `matrix`, `status`, `audit-prep`, `gap-analysis` |
| `--framework` | No | Regulatory frameworks (GDPR, SOX, HIPAA, ISO) |
| `--period` | No | Reporting period |
| `--auditor` | No | Audit type (internal, external) |

## Service Type Routing
`{TIPO_PROYECTO}`: Financial services require SOX compliance; Healthcare requires HIPAA; EU projects require GDPR; Government requires sector-specific compliance; All projects must comply with organizational policies.

## Before Tracking

1. **Read** the list of applicable regulatory frameworks from legal/compliance team
2. **Read** the project scope to map compliance requirements to specific deliverables
3. **Glob** `skills/compliance-tracking/references/*.md` for compliance matrix templates
4. **Grep** for existing organizational compliance policies and audit findings

## Entrada (Input Requirements)
- Applicable regulatory frameworks
- Organizational compliance policies
- Industry standards and certifications
- Project scope and deliverables
- Legal and compliance team input

## Proceso (Protocol)
1. **Requirements inventory** — Catalog all applicable compliance requirements
2. **Requirements mapping** — Map each requirement to project activities and deliverables
3. **Evidence plan** — Define what evidence demonstrates compliance per requirement
4. **Tracking mechanism** — Establish compliance tracking dashboard
5. **Audit trail** — Design evidence collection and storage process
6. **Gap identification** — Identify compliance gaps in current project plan
7. **Remediation planning** — Plan corrective actions for identified gaps
8. **Periodic review** — Schedule compliance reviews aligned with audit cycles
9. **Reporting** — Generate compliance status reports for governance
10. **Certification prep** — Prepare documentation packages for external audits

## Edge Cases

1. **New regulation enacted mid-project**: Immediately assess impact on project scope and timeline. Escalate to sponsor with impact analysis. Treat as change request through CCB. [PLAN]
2. **Compliance evidence unavailable for required audit**: Document gap with mitigation plan. Implement alternative evidence collection. Never falsify compliance evidence. [METRIC]
3. **Conflicting regulatory requirements**: Escalate to legal counsel. Document conflict and proposed resolution approach. Apply the stricter requirement until resolution. [STAKEHOLDER]
4. **Compliance requirements exceed project budget**: Present compliance as non-negotiable constraint. Request additional funding or scope reduction to accommodate. [PLAN]

## Example: Good vs Bad

**Good Compliance Tracking:**

| Attribute | Value |
|-----------|-------|
| Requirements cataloged | 45 across 3 frameworks |
| Mapping coverage | 100% mapped to project activities |
| Evidence plan | Specific evidence type per requirement |
| Gap analysis | 3 gaps identified with remediation plans |
| Audit trail | Automated evidence collection where possible |
| Review cadence | Monthly aligned with governance cycle |

**Bad Compliance Tracking:**
A statement that "we comply with all regulations" without a requirements inventory, no mapping to project activities, no evidence plan, and no audit trail. Fails because it provides no verifiable evidence of compliance — regulators require demonstrable evidence, not assertions.

## Validation Gate
- [ ] All applicable regulatory frameworks cataloged with legal/compliance confirmation
- [ ] Every requirement mapped to ≥1 project activity or deliverable
- [ ] Evidence plan defines specific evidence type and collection method per requirement
- [ ] Compliance gaps identified with remediation plans and deadlines
- [ ] Audit trail demonstrates evidence collection for ≥90% of requirements
- [ ] No compliance claim without verifiable evidence
- [ ] Review cadence established aligned with audit cycles
- [ ] Non-compliance risks quantified with potential impact (fines, penalties, reputation)
- [ ] Regulators and auditors would be satisfied with evidence quality [STAKEHOLDER]
- [ ] Compliance tracking integrated into project lifecycle, not bolted on [PLAN]

## Escalation Triggers
- Non-compliance with critical regulatory requirement
- Audit finding requiring immediate remediation
- New regulation affecting project mid-execution
- Compliance evidence unavailable for required audit

## Additional Resources

| Resource | When to read | Location |
|----------|-------------|----------|
| Body of Knowledge | Before tracking to understand regulatory frameworks | `references/body-of-knowledge.md` |
| State of the Art | When evaluating compliance automation tools | `references/state-of-the-art.md` |
| Knowledge Graph | To link compliance to governance and quality | `references/knowledge-graph.mmd` |
| Use Case Prompts | When mapping requirements to activities | `prompts/use-case-prompts.md` |
| Metaprompts | To generate compliance matrix templates | `prompts/metaprompts.md` |
| Sample Output | To calibrate expected compliance report format | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark

---

---

## Sub-Agents

### Audit Trail Builder


## Audit Trail Builder Agent

### Core Responsibility

Construct and maintain auditable evidence chains that prove compliance for every mapped requirement. Each trail links a compliance obligation to its concrete evidence artifacts — documents, test results, approval records, system configurations — with full version history, custody chain, and timestamp integrity. The goal is audit-readiness at any point: an external auditor should be able to trace any requirement to its proof in ≤3 clicks.

### Process

1. **Define evidence requirements per CRQ.** For each compliance requirement, specify the type of evidence needed: document (policy, procedure, report), record (log, configuration snapshot, test result), attestation (sign-off, approval email), or demonstration (live test, walkthrough). Tag the expected evidence format and retention period.
2. **Design the evidence collection workflow.** For each evidence type, define who produces it, when it is generated (milestone-triggered, periodic, or event-driven), where it is stored (document repository path, artifact registry), and how it is validated (peer review, automated check, manager sign-off).
3. **Establish version control protocol.** Define naming conventions, version numbering (semantic or date-based), and change-tracking rules for all compliance artifacts. Every modification must capture: who changed it, when, what changed, and why. Link to the project's document management system or repository.
4. **Build approval chains.** For each Critical and High requirement, define the approval workflow: author → reviewer → approver, with role-based authority levels. Document the escalation path when approvers are unavailable. Ensure segregation of duties — the person producing evidence is not the sole approver.
5. **Construct traceability links.** Create explicit links from CRQ-XXX → evidence artifact → version → approval record. Use a traceability ledger that an auditor can follow sequentially. Include cross-references to the compliance mapper's deliverable assignments.
6. **Validate trail completeness.** Run an audit-readiness check: for each mapped requirement, verify that evidence exists, is current (not expired), is approved, and is stored in the designated location. Flag stale evidence (>90 days without refresh for periodic requirements) and missing approvals.
7. **Deliver the audit trail package.** Output a structured audit trail index with completeness metrics, a list of evidence gaps requiring immediate action, and a recommended audit preparation checklist with timeline.

### Output Format

| CRQ ID | Evidence Artifact | Type | Version | Location | Approved By | Approval Date | Status | Evidence |
|--------|------------------|------|---------|----------|------------|--------------|--------|---------|
| CRQ-001 | Data Deletion Process SOP | Document | v2.1 | `/docs/compliance/SOP-deletion.md` | CISO | 2026-02-15 | Current | `[DOC]` |
| CRQ-001 | Deletion API test results — Sprint 14 | Record | 2026-03-01 | `/test-reports/sprint-14/deletion-api.html` | QA Lead | 2026-03-02 | Current | `[METRIC]` |
| CRQ-003 | PMO Quality Checklist — Gate 2 | Attestation | v1.0 | `/gates/G2/quality-checklist-signed.pdf` | PMO Director | 2026-03-10 | Current | `[DECISION]` |
| CRQ-012 | Penetration Test Report — Annual | Document | — | — | — | — | **MISSING** | `[SUPUESTO]` |

**Audit Readiness:** XX/XX requirements with complete trails (XX%) | XX gaps requiring action

### Compliance Mapper


## Compliance Mapper Agent

### Core Responsibility

Create and maintain a bidirectional traceability matrix that links every compliance requirement (CRQ-XXX) to the project deliverables, work packages, and activities that satisfy it. The mapper ensures zero orphan requirements — every obligation has at least one activity addressing it — and zero unlinked deliverables in compliance-sensitive areas. This matrix becomes the single source of truth for compliance coverage.

### Process

1. **Ingest the compliance registry.** Load all CRQ-XXX requirements from the Requirement Cataloger output. Validate completeness: every requirement must have a unique ID, source category, and criticality rating before mapping begins.
2. **Decompose requirements into verifiable conditions.** Break compound requirements into atomic acceptance conditions. For example, "Data must be encrypted at rest and in transit" becomes two mapping targets: encryption-at-rest and encryption-in-transit. Each condition gets a sub-ID (CRQ-001.a, CRQ-001.b).
3. **Map to WBS deliverables.** For each atomic condition, identify the WBS work package(s) or deliverable(s) that produce the evidence of compliance. Link using deliverable IDs from the scope baseline. Flag any condition with no matching deliverable as a coverage gap.
4. **Assign responsible roles.** For each mapping, designate the role or team accountable for producing compliance evidence. Cross-reference with the RACI matrix to ensure alignment — the compliance-responsible party should not conflict with existing accountability assignments.
5. **Identify coverage gaps.** Run a completeness check: list all CRQ requirements with zero mapped activities (orphans) and all Critical/High requirements with only one mapped activity (single-point-of-failure). Recommend additional activities or controls to close gaps.
6. **Validate reverse traceability.** For each compliance-sensitive deliverable, verify that its contributing activities collectively satisfy all linked requirements. Flag deliverables where partial coverage exists but key conditions remain unaddressed.
7. **Deliver the traceability matrix.** Output the full bidirectional map with coverage metrics: total requirements, mapped count, gap count, coverage percentage by source category, and a summary of recommended actions to achieve 100% coverage.

### Output Format

| CRQ ID | Atomic Condition | Deliverable / Work Package | Activity | Responsible Role | Coverage Status | Evidence |
|--------|-----------------|---------------------------|----------|-----------------|----------------|---------|
| CRQ-001.a | Personal data erasable within 30 days | WP-3.2 Data Management Module | Implement deletion API + batch purge job | Backend Lead | Covered | `[PLAN]` |
| CRQ-001.b | Erasure request logged and auditable | WP-5.1 Audit Logging Service | Build request-tracking pipeline | Security Engineer | Covered | `[PLAN]` |
| CRQ-007 | Annual penetration test report delivered | — | — | — | **GAP** | `[SUPUESTO]` |

**Coverage Summary:**
- Total requirements: XX | Mapped: XX | Gaps: XX | Coverage: XX%
- Critical coverage: XX% | High coverage: XX%

### Gap Remediation Planner


## Gap Remediation Planner Agent

### Core Responsibility
Identify compliance gaps through periodic assessments, prioritize them by regulatory severity and business impact, and build actionable remediation plans with clear owners, deadlines, and evidence requirements for each gap.

### Process
1. **Conduct Gap Assessment.** Compare current compliance state against requirements catalog. Document each gap with severity (critical/high/medium/low) and affected regulation.
2. **Prioritize by Risk.** Rank gaps using regulatory penalty exposure, audit timeline proximity, business impact, and remediation effort required.
3. **Design Remediation Actions.** For each gap, define specific actions: policy creation, process change, technical control implementation, training, or documentation.
4. **Assign Owners and Deadlines.** Assign each remediation action to a named owner with realistic deadline considering dependencies and resource availability.
5. **Define Evidence Requirements.** Specify what evidence will demonstrate compliance: documents, system logs, test results, certifications, or audit reports.
6. **Create Remediation Tracker.** Build a tracking mechanism with status updates, progress indicators, and escalation triggers for overdue items.
7. **Schedule Re-Assessment.** Plan follow-up assessments to verify gap closure and detect new gaps from regulatory changes or project scope evolution.

### Output Format
- **Gap Register** — Table: Gap ID, Regulation, Description, Severity, Remediation Action, Owner, Deadline, Evidence Required, Status.
- **Remediation Roadmap** — Timeline showing sequenced remediation activities with dependencies.
- **Compliance Score Trend** — Current compliance percentage with projected improvement trajectory.

### Requirement Cataloger


## Requirement Cataloger Agent

### Core Responsibility

Build and maintain a comprehensive compliance requirement registry that consolidates obligations from every applicable source: regulatory mandates, contractual clauses, organizational policies, and industry standards. Each requirement is normalized into a common schema with unique ID, source authority, applicability scope, and verification method, enabling downstream agents to map, audit, and remediate without ambiguity.

### Process

1. **Inventory regulatory mandates.** Scan the project context for applicable regulations (GDPR, HIPAA, SOX, PCI-DSS, etc.). For each regulation, extract specific articles or clauses that impose obligations on the project — not the full text, but actionable requirements with citation (e.g., "GDPR Art. 17 — Right to erasure").
2. **Extract contractual obligations.** Parse contracts, SLAs, and statements of work for compliance-bearing clauses: deliverable acceptance criteria, data handling requirements, SLA thresholds, penalty triggers, and reporting obligations. Tag each with contract reference and counterparty.
3. **Catalog organizational policies.** Identify PMO standards, quality policies, security policies, and governance mandates that apply to the project. Cross-reference with the governance framework to ensure no internal policy is overlooked.
4. **Map industry standards.** Determine which industry frameworks apply (ISO 27001, ISO 9001, CMMI, SOC 2, ITIL, etc.). Extract control objectives relevant to the project scope, not the entire standard.
5. **Normalize and deduplicate.** Assign unique IDs (CRQ-XXX) to each requirement. Merge overlapping requirements from different sources (e.g., GDPR data retention + contractual data retention = single requirement with dual source). Standardize language to cause-obligation-evidence format.
6. **Classify by criticality.** Rate each requirement as Critical (regulatory penalty or contract breach), High (audit finding or policy violation), Medium (best-practice gap), or Low (advisory). Flag any requirement where classification is uncertain with `[SUPUESTO]`.
7. **Deliver the compliance registry.** Output a structured catalog with ≥1 requirement per source category, all uniquely identified, with source authority, applicability scope, criticality rating, verification method, and evidence tags.

### Output Format

| ID | Requirement Statement | Source Category | Source Authority | Criticality | Verification Method | Evidence |
|----|----------------------|----------------|-----------------|-------------|--------------------|---------:|
| CRQ-001 | Personal data must be erasable upon subject request within 30 days | Regulatory | GDPR Art. 17 | Critical | Process audit + system test | `[DOC]` |
| CRQ-002 | Monthly uptime ≥ 99.5% reported to client by 5th business day | Contractual | MSA §4.2 | Critical | SLA dashboard review | `[CONFIG]` |
| CRQ-003 | All deliverables must pass PMO quality checklist before gate review | Organizational | PMO-QP-003 | High | Gate review minutes | `[DOC]` |
| CRQ-004 | Development processes must achieve CMMI ML3 equivalence | Industry | CMMI v2.0 DEV | Medium | Appraisal evidence | `[INFERENCIA]` |


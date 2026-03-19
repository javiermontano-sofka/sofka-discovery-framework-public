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

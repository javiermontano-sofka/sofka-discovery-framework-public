# Use-Case Prompts — Compliance Tracking

## Prompt 1: Compliance Matrix Setup
**When**: Project initiation with regulatory requirements.
**Context variables**: `{regulations}`, `{contract_terms}`, `{org_policies}`
**Deliver**:
> Map all compliance requirements from `{regulations}`, `{contract_terms}`, and `{org_policies}` into a tracking matrix. For each requirement: source, description, verification method, owner, frequency, and current status. Identify automated vs. manual verification methods.

## Prompt 2: Compliance Status Report
**When**: Pre-audit or governance review.
**Context variables**: `{compliance_matrix}`, `{scan_results}`, `{audit_findings}`
**Deliver**:
> Generate compliance status report from `{compliance_matrix}` incorporating `{scan_results}` and `{audit_findings}`. Calculate compliance percentage by domain. Flag non-compliant items with remediation priorities and timelines.

## Prompt 3: Regulatory Change Impact Assessment
**When**: New regulation or policy change affecting project.
**Context variables**: `{new_regulation}`, `{current_compliance_state}`, `{project_scope}`
**Deliver**:
> Assess impact of `{new_regulation}` on `{project_scope}` given `{current_compliance_state}`. Identify new requirements, affected deliverables, and remediation effort in sprints. Recommend implementation approach.

*PMO-APEX v1.0 — Use-Case Prompts · Compliance Tracking*

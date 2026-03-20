# Metaprompts — Compliance Tracking

## Meta-Strategy 1: Compliance Risk Prioritization
**Purpose**: Focus compliance effort on highest-risk areas.
**Strategy**: Score each requirement by: regulatory penalty severity, likelihood of non-compliance, and detection difficulty. Prioritize monitoring resources on high-risk items.
**Application template**:
> For `{compliance_matrix}`, score each requirement on 3 risk dimensions. Create a compliance risk heat map. Allocate 80% of monitoring effort to top 20% risk items. [METRIC]

## Meta-Strategy 2: Evidence Chain Verification
**Purpose**: Ensure compliance claims are backed by verifiable evidence.
**Strategy**: For each "compliant" status, verify the evidence chain: What evidence exists? When was it last verified? Would it satisfy an external auditor?
**Application template**:
> Audit the evidence chain for all "compliant" items in `{matrix}`. Flag any item where evidence is >90 days old, unverifiable, or relies on self-attestation only. [DOC]

## Meta-Strategy 3: Compliance Debt Tracking
**Purpose**: Quantify and manage accumulated compliance gaps.
**Strategy**: Track compliance debt like technical debt: known gaps, estimated remediation effort, risk exposure. Report to governance board as portfolio risk.
**Application template**:
> Calculate total compliance debt for `{project}`. Sum remediation effort for all non-compliant items. Present as risk exposure metric to governance. If debt exceeds 2 sprints of remediation effort, escalate. [PLAN]

*PMO-APEX v1.0 — Metaprompts · Compliance Tracking*

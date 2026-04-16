# Quality Audit Report — Acme Corp Software Delivery Process

## Audit Summary

| Field | Detail |
|-------|--------|
| Audit ID | QA-2026-Q2-003 |
| Scope | Software delivery lifecycle (requirements through deployment) |
| Standard | ISO 9001:2015 + internal QMS procedures |
| Period | Sprint 10-15 |
| Auditor | Quality Assurance Team |

## Findings Summary

| Severity | Count | Trend vs. Last Audit |
|----------|-------|---------------------|
| Critical | 0 | Same |
| Major | 2 | +1 |
| Minor | 3 | -1 |
| Observation | 2 | Same |
| **Total** | **7** | |

## Major Findings

### MAJ-001: Incomplete Code Review Process
- **Criteria:** All production code requires peer review before merge (QMS-DEV-004) [METRIC]
- **Evidence:** 12 of 45 PRs merged without documented review in Sprint 12-13
- **Root Cause:** Team lead granted merge override during crunch period without documentation
- **Corrective Action:** Enforce branch protection rules; override requires documented justification
- **Owner:** Tech Lead | **Due:** Sprint 17

### MAJ-002: Test Coverage Below Threshold
- **Criteria:** Minimum 80% unit test coverage for all modules (QMS-QA-002) [METRIC]
- **Evidence:** Data migration module at 52% coverage; API gateway at 68% coverage
- **Root Cause:** New modules developed under schedule pressure without test-first approach
- **Corrective Action:** Test debt sprint (Sprint 17); mandatory coverage check in CI pipeline
- **Owner:** QA Lead | **Due:** Sprint 18

## Minor Findings

| ID | Finding | Criteria | Action |
|----|---------|----------|--------|
| MIN-001 | 3 user stories lack acceptance criteria | QMS-REQ-001 | Template enforcement in Jira [PLAN] |
| MIN-002 | Sprint retrospective actions not tracked | QMS-AGI-003 | Add retro action board [PLAN] |
| MIN-003 | Deployment runbook outdated (v2.1 vs. v3.0 actual) | QMS-OPS-001 | Update runbook [PLAN] |

## Strengths Identified

- Automated CI/CD pipeline achieving 99.2% build success rate [METRIC]
- Incident response process exemplary — mean time to resolution < 2 hours

## Next Audit: Sprint 20 (follow-up on MAJ-001, MAJ-002)

*PMO-APEX v1.0 — Sample Output · Quality Audit*

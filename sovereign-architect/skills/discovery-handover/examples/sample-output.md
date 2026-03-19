# Discovery Handover — Sample Output

## Context

A discovery phase for a legacy CRM migration has concluded. The implementation
team (8 engineers) is onboarding next week. Three major ADRs were produced and
14 assumptions need validation.

## Output

### Handover Package — Table of Contents

1. Start Here Guide
2. Executive Summary
3. Architecture Decision Records
4. Assumption Register
5. Work Packages (Phase 1)
6. Risk Register with Ownership Transfer
7. Stakeholder Map

### ADR-001: Database Migration Strategy

**Status**: Accepted

**Context**: The legacy CRM uses Oracle 11g with 847 stored procedures. The target
architecture requires PostgreSQL for licensing and cloud compatibility.

**Decision**: Incremental migration using the Strangler Fig pattern. Migrate domain
by domain, starting with Contact Management (lowest coupling, highest test coverage).

**Alternatives Rejected**:
- Big-bang migration: Risk too high for 847 stored procedures. Estimated 6-month freeze.
- Dual-write: Consistency guarantees insufficient for financial data in the CRM.

**Consequences**:
- Requires a database abstraction layer during the transition period.
- Two databases in production for 6-9 months (operational overhead).
- Contact Management domain is the validation proof point.

### Assumption Register (Top 5)

| ID | Assumption | Impact if Wrong | Status | Validation Method |
|----|-----------|----------------|--------|-------------------|
| A-001 | Oracle stored procedures have no external dependencies beyond CRM tables | Migration scope expands significantly | Pending | Code scan of all 847 procedures |
| A-002 | Contact Management domain has <5% coupling to other domains | Cannot migrate domain independently | Pending | Dependency analysis sprint |
| A-003 | PostgreSQL handles current query patterns within SLA | Performance regression in production | Pending | Load test with production query sample |
| A-004 | Team has PostgreSQL expertise or can acquire it in 2 weeks | Velocity impact in first sprint | Validated | Team skills assessment completed |
| A-005 | Legacy API consumers can tolerate a 2-hour maintenance window | Coordination required with 12 consumers | Pending | Consumer survey |

### Work Package: WP-001 — Database Abstraction Layer

**Scope**: Implement a repository pattern abstraction that routes queries to Oracle
or PostgreSQL based on domain configuration.

**Acceptance Criteria**:
- All Contact Management queries route through the abstraction layer.
- Toggle switches per-domain between Oracle and PostgreSQL.
- No performance degradation >5% vs direct Oracle queries.
- Rollback to Oracle-only completes in <5 minutes.

**Prerequisites**: PostgreSQL instance provisioned, Oracle read replica available.

**Estimated Effort**: 3-4 FTE-weeks.

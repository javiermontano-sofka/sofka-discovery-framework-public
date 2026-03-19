# ADR-003: SAP HANA as Primary Database for ERP Migration

> **Proyecto:** Acme Corp ERP Migration | **Fecha:** 15 de marzo de 2026
> **Estado:** Accepted | **Decision Maker:** Solution Architect (Ana Torres)

---

## Status

Accepted [DECISION]

## Context

Acme Corp is migrating from SAP ECC 6.0 to S/4HANA. The migration requires selecting the database platform. The current system runs on Oracle 19c. S/4HANA supports SAP HANA exclusively for the application layer but allows side-car databases for reporting and analytics. [PLAN]

Key constraints:
- S/4HANA requires SAP HANA as primary database (no alternative) [PLAN]
- Current Oracle database contains 15 years of transactional data (2.1 TB) [METRIC]
- Reporting workload currently runs on Oracle with custom PL/SQL procedures [PLAN]
- 200+ custom reports depend on Oracle-specific SQL features [METRIC]

## Decision

Migrate to SAP HANA as the sole database platform. Eliminate the Oracle side-car option. Rewrite Oracle-specific custom reports using HANA SQL and CDS views. [DECISION]

**Rationale:**
1. Dual database increases operational complexity and TCO [INFERENCIA]
2. SAP HANA column store provides 10-100x reporting performance improvement over Oracle for analytical queries [PLAN]
3. CDS views provide a standardized, maintainable replacement for custom PL/SQL [PLAN]
4. SAP's roadmap investment is exclusively in HANA-native capabilities [PLAN]

## Alternatives Considered

| Option | Pros | Cons | Verdict |
|--------|------|------|---------|
| HANA only (selected) | Single platform, lower TCO, SAP roadmap aligned | Report rewrite effort (~200 reports) | Selected |
| HANA + Oracle side-car | No report rewrite | Dual platform TCO, operational complexity, Oracle license cost | Rejected |
| HANA + PostgreSQL analytics | Lower cost than Oracle side-car | Still dual platform; PostgreSQL not SAP-supported | Rejected |

## Consequences

### Positive
- Single database platform reduces operational overhead [PLAN]
- HANA-native features (live reporting, embedded analytics) available [PLAN]
- Oracle license elimination saves recurring cost [METRIC]

### Negative
- 200+ custom reports require rewriting (estimated 40 FTE-days) [SCHEDULE]
- Team needs HANA SQL/CDS training (addressed in skills gap analysis) [PLAN]
- Migration window extended by 3 weeks for report conversion [SCHEDULE]

### Risks
- R-RPT-001: Custom report rewrite may uncover undocumented business logic [SUPUESTO]
- R-RPT-002: HANA performance for specific complex queries untested [SUPUESTO]

## Related ADRs

- ADR-001: S/4HANA as target ERP platform (prerequisite)
- ADR-002: Greenfield vs. brownfield migration approach

---

*PMO-APEX v1.0 — ADR-003 · Acme Corp ERP Migration*

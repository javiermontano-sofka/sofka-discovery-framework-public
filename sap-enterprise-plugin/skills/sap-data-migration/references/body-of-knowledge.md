# SAP Data Migration — Body of Knowledge

## 1. Migration Strategies

### Three Migration Approaches

| Approach | Description | When to Use | Risk |
|----------|-------------|-------------|------|
| **Big-Bang** | All data migrated in one cutover window | Small data volumes, simple landscapes | High — single point of failure |
| **Phased / Wave** | Data migrated in planned waves by domain | Medium-large implementations | Medium — manageable complexity |
| **Strangler Fig** | Legacy replaced incrementally, domain by domain | Complex landscapes, multiple legacy sources | Low — gradual, validated |

### Strangler Fig Protocol (Preferred)
Replace legacy data sources one domain at a time. SAP takes over incrementally until each legacy source can be decommissioned.

8-Step Protocol per Domain:
1. **Map** — Document every column, formula, business rule
2. **Design** — Define SAP target (table, field, migration object)
3. **Cleanse** — Data quality checks; fix BEFORE loading
4. **Load** — Initial migration to sandbox via Migration Cockpit
5. **Validate** — SAP output vs legacy (tolerance <= 0.1%)
6. **Shadow** — Parallel run for 1-2 periods
7. **Cutover** — Final migration + legacy decommission
8. **Document** — Archive migration evidence

---

## 2. SAP Migration Cockpit

### Overview
SAP Migration Cockpit is the standard tool for structured data migration into S/4HANA Cloud. It provides pre-built migration objects with XML/XLSX templates.

### Key Migration Objects (IT/Professional Services)

| Object | Description | Template |
|--------|-------------|----------|
| General Ledger Account | Chart of accounts entries | Yes |
| Company Code | Legal entity setup | Yes |
| Cost Center | Organizational cost collectors | Yes |
| Profit Center | Revenue-bearing units | Yes |
| Activity Type | Skill-level classification | Yes |
| Business Partner | Unified customer/vendor/employee | Yes |
| Sales Order | Open orders for billing | Yes |
| WBS Element | Project structure elements | Yes |
| Employee (Basic) | HR master data | Yes |
| GL Balance | Opening financial balances | Yes |

### Migration Cockpit Workflow
```
Select Object → Download Template → Fill with Cleansed Data
→ Upload to Staging → Validate (referential integrity)
→ Simulate (dry run) → Execute (post to SAP) → Review Log
```

---

## 3. Data Quality Framework

### Six Quality Dimensions

| Dimension | Definition | Target | Measurement |
|-----------|-----------|--------|-------------|
| **Completeness** | All required fields populated | >= 98% | % non-null mandatory fields |
| **Accuracy** | Values correct and current | >= 99% | Sample validation vs source |
| **Consistency** | Same data = same format everywhere | 100% | Cross-source comparison |
| **Uniqueness** | No duplicate records | 0 dupes | Dedup analysis |
| **Timeliness** | Data is current, not stale | Within 6 months | Last update date check |
| **Referential Integrity** | Foreign keys resolve correctly | 100% | Cross-object validation |

### Data Profiling Protocol
1. Extract source data to staging area
2. Run profiling rules (completeness, uniqueness, format)
3. Generate Data Quality Report with scores
4. Classify issues: Critical (blocks migration) vs Warning (acceptable)
5. Assign remediation owners per issue
6. Fix ALL critical issues before loading to SAP

---

## 4. Master Data Governance

### Critical Master Data Objects

| Object | Owner | Governance Level | Change Process |
|--------|-------|-----------------|---------------|
| Chart of Accounts | CFO / FI Lead | Enterprise-wide | Change request + approval |
| Activity Types | CO Lead + HR | Cross-functional | Annual review cycle |
| Customer Master | Sales Lead | Business unit | Regional variations allowed |
| Vendor Master | Procurement | Enterprise-wide | Centralized approval |
| Employee Master | HR Lead | Enterprise-wide | HR system of record |
| Project Templates | PMO | Business unit | Per service line |

### Governance Rules
1. Single owner per master data object (no shared ownership)
2. Change request process for modifications (no ad-hoc changes)
3. Periodic review cycle (quarterly for rates, annually for structures)
4. Automated validation via BRF+ rules where possible
5. Full audit trail — all changes logged with reason and approver

---

## 5. Wave Planning

### Wave Design Principles
- Dependencies first: master data before transactional data
- High-risk domains in early waves (more time to fix)
- Business continuity: parallel run per wave before cutover
- Team capacity: max 2 data domains per wave

### Standard Wave Template

| Wave | Duration | Data Domains | Prerequisites |
|------|----------|-------------|--------------|
| **Wave 0** | 2-3 weeks | Org structure, chart of accounts, company codes | None |
| **Wave 1** | 3-4 weeks | Cost centers, profit centers, Activity Types, customers, vendors | Wave 0 |
| **Wave 2** | 3-4 weeks | Project structures, WBS, pricing, billing plans | Wave 1 |
| **Wave 3** | 2-3 weeks | Open AR/AP balances, open sales orders, open projects | Wave 2 |
| **Wave 4** | 2-4 weeks | Historical transactions (if needed), archive data | Wave 3 |

---

## 6. Cutover Protocol

### Minimum Requirements
- 2 cutover rehearsals before go-live
- Rehearsal 1: full dry run in QAS, timing measured
- Rehearsal 2: full dry run with actual go-live team, issues from R1 fixed

### Go/No-Go Criteria

| Criterion | Pass | Fail |
|-----------|------|------|
| Data variance | <= 0.1% | > 0.1% |
| Critical errors | 0 | > 0 |
| Cutover time | Within planned window | Exceeds window |
| Rollback plan | Documented + tested | Not tested |

### Parallel Run Tolerance

| Domain | Tolerance |
|--------|-----------|
| Financial balances | Exact match (0.00) |
| Revenue recognition | <= 0.1% |
| Cost allocation | <= 0.5% |
| Headcount/hours | Exact match |
| Billing amounts | Exact match (0.00) |

---

*Reference derived from 61 deep-researched sources in NotebookLM notebook `SAP Data Migration & Migration Cockpit`.*
*Author: JM Labs (Javier Montano).*

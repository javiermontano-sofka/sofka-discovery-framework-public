---
name: sofka-sap-data-migration
description: >
  SAP data migration skill covering Strangler Fig incremental migration, SAP Migration
  Cockpit, data quality frameworks, master data governance (MDG), wave planning, cutover
  rehearsal, and parallel run protocols. Use when planning SAP data migration, assessing
  data quality, designing migration waves, or executing cutover rehearsals.
  Trigger: SAP data migration, Strangler Fig, Migration Cockpit, data quality, master
  data governance, cutover, parallel run, wave planning, legacy decommission.
argument-hint: "<data-domain-or-source> [--approach strangler-fig|big-bang|hybrid]"
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
  - Agent
author: Javier Montaño
contributors: "Jean Ruiz Granda (ad-hoc feedback & review), Catherine Rodrigo"
copyright: "© 2026 JM Labs. Personal knowledge project."
co-authored-with: Claude Code
---

# SAP Data Migration — Strangler Fig & Migration Cockpit

> "Every Excel file still in use is technical debt with a human face. Migrate the data, but honor the knowledge it contains."

## Purpose

Design and execute SAP data migration strategies using Strangler Fig incremental approach, SAP Migration Cockpit, and data quality frameworks. Produce wave plans, cutover checklists, and parallel run protocols.

## When to Use

- Planning data migration from legacy systems to SAP S/4HANA
- Assessing data quality before migration
- Designing migration waves (incremental Strangler Fig)
- Configuring SAP Migration Cockpit
- Planning cutover rehearsal and go-live migration
- Decommissioning legacy data sources

---

## Table of Contents

1. [Strangler Fig Protocol](#1-strangler-fig-protocol)

> Deep knowledge: `references/body-of-knowledge.md`
> Skill dependencies: `references/knowledge-graph.mmd`
2. [SAP Migration Cockpit](#2-sap-migration-cockpit)
3. [Data Quality Framework](#3-data-quality-framework)
4. [Wave Planning](#4-wave-planning)
5. [Master Data Governance](#5-master-data-governance)
6. [Cutover Rehearsal Protocol](#6-cutover-rehearsal-protocol)
7. [Parallel Run Protocol](#7-parallel-run-protocol)

---

## 1. Strangler Fig Protocol

### Principle
Replace legacy data sources one domain at a time. SAP takes over incrementally until the legacy system can be decommissioned.

### Steps per Data Domain

| Step | Action | Validation |
|------|--------|-----------|
| 1. **Map** | Document every column, formula, business rule in legacy source | All fields mapped to SAP equivalent |
| 2. **Design** | Define SAP target (table, field, app, migration object) | Technical design reviewed |
| 3. **Cleanse** | Data quality checks; fix BEFORE loading | Quality score >= 95% |
| 4. **Load** | Initial migration to sandbox via Migration Cockpit | Load successful, no errors |
| 5. **Validate** | Compare SAP output vs legacy. Tolerance: <= 0.1% variance | Business user sign-off |
| 6. **Shadow** | Parallel run for 1-2 periods (both systems active) | Results match within tolerance |
| 7. **Cutover** | Final migration + decommission legacy for this domain | Legacy source archived |
| 8. **Document** | Archive migration evidence + lessons learned | Audit trail complete |

### Migration Priority Matrix

| Priority | Data Domain | SAP Target | Risk | Approach |
|----------|-------------|-----------|------|----------|
| P1 (MVP) | Chart of accounts, company codes | FI master data | High — everything depends on this | Wave 1 |
| P1 (MVP) | Activity Types, cost rates | CO master data | High — costing depends on this | Wave 1 |
| P2 (MVP) | Customer master, sales prices | SD master data | High — billing depends on this | Wave 2 |
| P2 (MVP) | Project structures, WBS | PS master data | Medium — project data | Wave 2 |
| P3 | Open transactions (AR, AP) | FI transactional | Medium — balance migration | Wave 3 |
| P3 | Historical data (if needed) | Archiving | Low — reporting only | Wave 4 |

---

## 2. SAP Migration Cockpit

### Overview
SAP Migration Cockpit provides structured migration templates for S/4HANA Cloud.

### Key Migration Objects (IT Services)
| Object | Description | Template Available |
|--------|-------------|-------------------|
| General Ledger Account | Chart of accounts | Yes |
| Company Code | Legal entities | Yes |
| Cost Center | Organizational units | Yes |
| Profit Center | Business units | Yes |
| Activity Type | Skill-level classification | Yes |
| Customer Master | Client data | Yes |
| Business Partner | Universal partner | Yes |
| Sales Order | Open orders | Yes |
| Project (WBS) | Project structures | Yes |
| Employee (basic) | HR master data | Yes |

### Migration Cockpit Workflow
1. Select migration object in Migration Cockpit
2. Download template (XML/XLSX format)
3. Fill template with cleansed source data
4. Upload to staging area
5. Validate (system checks referential integrity)
6. Simulate (dry run without posting)
7. Execute (post to SAP)
8. Review migration log

---

## 3. Data Quality Framework

### Quality Dimensions

| Dimension | Definition | Measurement | Target |
|-----------|-----------|-------------|--------|
| **Completeness** | All required fields populated | % of non-null mandatory fields | >= 98% |
| **Accuracy** | Values are correct and current | Sample validation vs source | >= 99% |
| **Consistency** | Same data = same format everywhere | Cross-source comparison | 100% format match |
| **Uniqueness** | No duplicate records | Dedup analysis | 0 duplicates |
| **Timeliness** | Data is current (not stale) | Last update date check | Within 6 months |
| **Referential Integrity** | Foreign keys resolve correctly | Cross-object validation | 100% resolution |

### Data Profiling Protocol
1. Extract source data to staging
2. Run profiling rules (completeness, uniqueness, format)
3. Generate Data Quality Report
4. Classify issues: Critical (blocks migration) vs Warning (acceptable)
5. Assign remediation owners
6. Fix issues BEFORE loading to SAP

---

## 4. Wave Planning

### Wave Design Principles
- **Dependencies first**: Master data before transactional data
- **Risk management**: High-risk domains in early waves (more time to fix)
- **Business continuity**: Parallel run per wave before cutover
- **Team capacity**: Max 2 data domains per wave

### Standard Wave Template

| Wave | Duration | Data Domains | Dependencies |
|------|----------|-------------|-------------|
| **Wave 0** (Foundation) | 2-3 weeks | Org structure, chart of accounts, company codes | None |
| **Wave 1** (Master Data) | 3-4 weeks | Cost centers, profit centers, Activity Types, customers, vendors | Wave 0 |
| **Wave 2** (Projects & Config) | 3-4 weeks | Project structures, WBS, pricing conditions, billing plans | Wave 1 |
| **Wave 3** (Transactions) | 2-3 weeks | Open AR/AP balances, open sales orders, open projects | Wave 2 |
| **Wave 4** (History) | 2-4 weeks | Historical transactions (if needed), archive data | Wave 3 |

---

## 5. Master Data Governance

### Critical Master Data Objects for SAP

| Master Data | Owner | Governance Level |
|------------|-------|-----------------|
| Chart of Accounts | CFO / FI Lead | Enterprise — single source of truth |
| Activity Types | CO Lead + HR | Cross-functional — affects costing AND pricing |
| Customer Master | Sales Lead | Business unit — regional variations allowed |
| Vendor Master | Procurement Lead | Enterprise — centralized |
| Employee Master | HR Lead | Enterprise — HR system of record |
| Project Templates | PMO | Business unit — per service line |

### Governance Rules
1. **Single owner** per master data object — no shared ownership
2. **Change request process** for master data modifications (not ad-hoc)
3. **Periodic review** cycle (quarterly for rates, annually for structures)
4. **Automated validation** via BRF+ rules where possible
5. **Audit trail** — all changes logged with reason and approver

---

## 6. Cutover Rehearsal Protocol

### Rehearsal Rules
- **Minimum 2 rehearsals** before go-live
- **Rehearsal 1**: Full dry run in QAS environment, timing measured
- **Rehearsal 2**: Full dry run with actual go-live team, issues fixed from R1
- **Rehearsal 3** (optional): If R1 or R2 had critical issues

### Cutover Checklist Template

| # | Task | Owner | Duration | Status |
|---|------|-------|----------|--------|
| 1 | Freeze source systems | IT Ops | 1 hour | |
| 2 | Export final data from legacy | Migration Lead | 2-4 hours | |
| 3 | Run data quality checks | Data Team | 1-2 hours | |
| 4 | Load data via Migration Cockpit | Migration Lead | 4-8 hours | |
| 5 | Validate migration results | Business Users | 2-4 hours | |
| 6 | Run reconciliation (legacy vs SAP) | Finance | 2-4 hours | |
| 7 | Configure integrations (DNS, routing) | Integration Arch | 1-2 hours | |
| 8 | Run integration smoke tests | QA | 1-2 hours | |
| 9 | Go/No-Go decision | Steering Committee | 1 hour | |
| 10 | Open SAP for business users | PM | 30 min | |

### Go/No-Go Criteria
| Criterion | Pass | Fail |
|-----------|------|------|
| Data variance | <= 0.1% | > 0.1% |
| Critical errors | 0 | > 0 |
| Integration tests | 100% pass | < 100% |
| Cutover time | Within window | Exceeds window |
| Rollback plan | Documented + tested | Not tested |

---

## 7. Parallel Run Protocol

### Purpose
Run both legacy and SAP simultaneously for 1-2 periods to validate that SAP produces the same results as the legacy system.

### Protocol
1. **Period 1**: Business users enter data in BOTH systems
2. **End of Period 1**: Compare outputs (reports, balances, billing)
3. **Variance analysis**: Identify and resolve differences
4. **Period 2**: Repeat with fixes applied
5. **Decision**: If variance <= tolerance → decommission legacy for this domain

### Variance Tolerance by Domain

| Domain | Tolerance | Rationale |
|--------|-----------|-----------|
| Financial balances | 0.00 (exact match) | Regulatory requirement |
| Revenue recognition | <= 0.1% | Rounding differences acceptable |
| Cost allocation | <= 0.5% | Allocation algorithm differences |
| Headcount/hours | Exact match | No rounding involved |
| Billing amounts | 0.00 (exact match) | Client-facing |

---

## Quality Criteria

1. Strangler Fig protocol documented with all 8 steps per data domain
2. Migration priority matrix with wave assignments
3. Data quality framework with profiling protocol and targets
4. Cutover rehearsal plan with minimum 2 rehearsals
5. Go/No-Go criteria defined with measurable thresholds
6. Parallel run protocol with variance tolerance per domain

## Anti-Patterns

1. **Big-bang migration** — Always default to Strangler Fig incremental unless scope is tiny
2. **Migrating dirty data** — Fix data quality BEFORE loading to SAP, not after
3. **One cutover rehearsal** — Minimum 2 rehearsals; first always has issues
4. **Skipping parallel run** — Financial data must have parallel run for audit compliance
5. **No rollback plan** — Every cutover must have a tested rollback procedure

## Cross-References

- **sofka-sap-discovery**: Orchestrates migration strategy within CP-6
- **sofka-sap-implementation**: Module reference for migration object mapping
- **sofka-sap-testing-validation**: UAT and cutover validation protocols
- **migration-playbook**: SDF migration skill with Strangler Fig patterns (non-SAP)
- **cloud-migration**: SDF cloud migration patterns applicable to SAP-to-cloud scenarios

---
name: sofka-sap-testing-validation
author: JM Labs (Javier Montano)
description: >
  SAP testing and validation skill covering the SAP testing pyramid (unit, integration,
  UAT, regression, performance), sandbox validation, cutover rehearsal protocols, go-live
  validation, and HANA sizing considerations. Use when planning SAP testing strategy,
  designing UAT scenarios, executing cutover rehearsals, or validating go-live readiness.
  Trigger: SAP testing, SAP UAT, SAP regression, cutover rehearsal, go-live validation,
  sandbox testing, SAP performance testing, HANA sizing.
argument-hint: "<test-phase-or-module> [--level unit|integration|uat|regression|performance]"
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
  - Agent
---

# SAP Testing & Cutover Validation

> "A test plan without business scenarios is a configuration checklist. Test what users DO, not just what SAP CAN."

## Purpose

Design and execute comprehensive SAP testing strategies from sandbox validation through go-live. Cover the SAP testing pyramid, UAT design per module, regression testing, cutover rehearsal, and performance validation.

## When to Use

- Planning SAP testing strategy during Explore/Realize phases
- Designing UAT test scenarios per SAP module
- Executing cutover rehearsal (minimum 2 dry runs)
- Validating go-live readiness
- Assessing SAP performance requirements

---

## Table of Contents

1. [SAP Testing Pyramid](#1-sap-testing-pyramid)

> Deep knowledge: `references/body-of-knowledge.md`
> Skill dependencies: `references/knowledge-graph.mmd`
2. [Sandbox Validation Protocol](#2-sandbox-validation-protocol)
3. [UAT Design per Module](#3-uat-design-per-module)
4. [Regression Testing](#4-regression-testing)
5. [Cutover Rehearsal Protocol](#5-cutover-rehearsal-protocol)
6. [Go-Live Validation Checklist](#6-go-live-validation-checklist)
7. [Performance Considerations](#7-performance-considerations)

---

## 1. SAP Testing Pyramid

```
           /\
          /  \  Performance (load, stress)
         /----\
        /      \  End-to-End / UAT
       /--------\
      /          \  Integration (cross-module, CPI)
     /------------\
    /              \  Unit / Config Validation
   /________________\
```

| Level | What to Test | Who Tests | When |
|-------|-------------|-----------|------|
| **Unit/Config** | Individual config settings, custom fields, BRF+ rules | Functional consultant | Explore/Realize |
| **Integration** | Cross-module flows, CPI iFlows, API calls | Integration team | Realize |
| **UAT** | End-to-end business scenarios | Business users | Realize |
| **Regression** | All tests after SAP update or config change | QA team | Post-update |
| **Performance** | Load testing, response times, batch processing | Performance engineer | Pre-go-live |

---

## 2. Sandbox Validation Protocol

### Purpose
Validate configuration and extensions in sandbox before promoting to QAS.

### Checklist per Module

| # | Validation | Pass Criteria |
|---|-----------|--------------|
| 1 | Master data loads correctly | No error messages, data visible in standard apps |
| 2 | Standard transactions execute | Create/change/display cycle works |
| 3 | Custom fields visible | Key User fields appear in forms and reports |
| 4 | Custom logic fires | BRF+ rules execute as expected |
| 5 | Cross-module posting works | CO ↔ FI, PS ↔ SD postings balance |
| 6 | Integration endpoint responds | CPI iFlow processes test message |
| 7 | Reports produce correct output | Amounts, quantities, dates match expected |

---

## 3. UAT Design per Module

### CO — Controlling
| Scenario | Test Steps | Expected Result |
|----------|-----------|----------------|
| Create cost center | Create → assign to hierarchy → post expense | Cost center shows in reports |
| Activity Type rate setup | Create AT → assign cost rate → assign sales price | Rates visible in Manage Cost/Sales Rates |
| Internal order | Create order → post hours → close | Cost correctly allocated |
| Period-end closing | Run allocation → settlement → reconciliation | CO/FI balanced |

### SD — Sales & Distribution
| Scenario | Test Steps | Expected Result |
|----------|-----------|----------------|
| T&M Sales Order | Create SO → confirm timesheet → run billing | Invoice matches hours x rate |
| Fixed Price SO | Create SO → set milestones → trigger billing | Invoice per milestone |
| Pricing conditions | Apply PSP0/PCP0 → add discount → calculate tax | Final amount correct |
| Credit check | Create SO for customer at limit | Warning or block triggers |

### PS — Project System
| Scenario | Test Steps | Expected Result |
|----------|-----------|----------------|
| Create project | Create WBS → assign resources → set milestones | Project visible in CPM |
| Timesheet entry | Enter time → approve → post to WBS | Hours on correct WBS element |
| Project billing | Trigger billing from project → create invoice | Invoice linked to SO and WBS |
| Project analytics | View dashboard → check budget vs actual | Figures match postings |

### FI — Financial Accounting
| Scenario | Test Steps | Expected Result |
|----------|-----------|----------------|
| GL posting | Create journal entry → post → verify | GL balance updated |
| Intercompany | Post IC billing → check both entities → clear | IC accounts balanced |
| Revenue recognition | Run EBRR → check recognized revenue | Revenue matches recognition rules |
| E-invoicing | Generate invoice → check e-invoice output | Compliant document produced |

---

## 4. Regression Testing

### When to Run Regression
- After SAP quarterly update
- After transport of configuration changes
- After extension deployment
- After integration changes

### Regression Test Suite Structure
| Suite | Covers | Frequency |
|-------|--------|-----------|
| **Smoke** | Core transactions per module (10-15 tests) | Every transport |
| **Standard** | All UAT scenarios (50-100 tests) | Monthly / post-update |
| **Full** | All tests including edge cases (200+ tests) | Quarterly / major release |

### Automation Candidates
- Master data CRUD operations
- Standard posting transactions
- Integration smoke tests (CPI iFlow health)
- Report generation and export

---

## 5. Cutover Rehearsal Protocol

See `sofka-sap-data-migration` for detailed cutover checklist. Testing-specific additions:

### Pre-Cutover Test Checklist
| # | Test | Owner |
|---|------|-------|
| 1 | Run full regression suite in QAS | QA Team |
| 2 | Validate all integrations end-to-end | Integration Team |
| 3 | Confirm user access and authorizations | Security Admin |
| 4 | Test rollback procedure | Migration Lead |
| 5 | Validate data migration results | Business Users |

### Post-Cutover Validation (Day 1)
| # | Validation | Owner |
|---|-----------|-------|
| 1 | Login and access for all user groups | IT Support |
| 2 | Create first real transaction per module | Power Users |
| 3 | Integration health check (all CPI iFlows) | Integration Team |
| 4 | Financial reconciliation (opening balances) | Finance Team |
| 5 | Report generation (key reports per module) | Business Users |

---

## 6. Go-Live Validation Checklist

| # | Criterion | Pass | Fail |
|---|-----------|------|------|
| 1 | UAT pass rate | >= 95% of test cases | < 95% |
| 2 | Critical defects | 0 open critical defects | > 0 critical |
| 3 | Data migration variance | <= 0.1% | > 0.1% |
| 4 | Integration health | All iFlows green | Any iFlow red |
| 5 | Performance | Response times within SLA | Exceeds SLA |
| 6 | User training completion | >= 90% trained | < 90% |
| 7 | Rollback plan | Tested and documented | Not tested |
| 8 | Hypercare team | Staffed and briefed | Gaps in coverage |
| 9 | Change readiness score | >= 70% | < 70% |
| 10 | Steering Committee approval | Signed off | Not approved |

---

## 7. Performance Considerations

### Key SAP Performance Metrics
| Metric | Target | Measurement |
|--------|--------|-------------|
| Fiori app load time | < 3 seconds | Browser dev tools |
| OData API response | < 2 seconds | CPI monitoring |
| Batch job (period-end) | < 2 hours | Job log |
| Report generation | < 30 seconds | User timing |
| CATS BAPI call | < 1 second | CPI iFlow metrics |

### HANA Sizing Considerations
- User count: Estimate concurrent users per module
- Data volume: Transaction volume per year
- Custom extensions: ABAP Cloud extensions add to footprint
- Analytics: SAC embedded analytics vs standalone
- Growth: 3-year projection for capacity planning

---

## Quality Criteria

1. Testing pyramid defined with responsibilities and timing
2. Sandbox validation checklist executed per module
3. UAT scenarios cover all major business flows per module
4. Regression suite structured (smoke/standard/full) with automation candidates
5. Cutover rehearsal executed minimum 2 times with timing data
6. Go-live validation checklist has 10 measurable criteria
7. Performance targets defined with measurement approach

## Anti-Patterns

1. **Testing only happy path** — Include error scenarios, edge cases, and boundary values
2. **UAT by consultants** — Business USERS must execute UAT, not the implementation team
3. **Skipping regression after updates** — SAP quarterly updates can change behavior; always test
4. **One cutover rehearsal** — First rehearsal always finds issues; minimum 2 required
5. **No performance baseline** — Establish baseline BEFORE go-live for comparison

## Cross-References

- **sofka-sap-discovery**: Testing strategy is part of overall discovery output
- **sofka-sap-data-migration**: Cutover protocols and data validation
- **sofka-sap-integration**: Integration testing strategy
- **sofka-sap-activate-methodology**: Testing maps to Realize/Deploy phases
- **testing-strategy**: SDF testing strategy skill for non-SAP patterns

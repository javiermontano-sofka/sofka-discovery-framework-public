---
name: sofka-sap-fit-to-standard
author: JM Labs (Javier Montano)
description: >
  SAP Fit-to-Standard workshop facilitation skill. Structures and executes workshops
  per SAP module/process area: present SAP best practice, compare with AS-IS, score
  gaps across 4 dimensions (Effort, Risk, Upgrade Impact, Business Value), classify
  remediation paths (Fit/Configure/Extend/Custom/Workaround), and ensure Clean Core
  compliance. Use when conducting fit-to-standard workshops, SAP process comparison,
  SAP best practice alignment, or scope item validation.
  Trigger: fit-to-standard, SAP workshop, SAP best practice comparison, SAP process
  alignment, scope item validation, SAP process gap scoring.
argument-hint: "<module-or-process-area> [--scope-item J11|J12|1IL|4E9]"
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
  - Agent
---

# SAP Fit-to-Standard Workshop Framework

> "The workshop is not about SAP vs. the business — it's about finding where the business already works the SAP way, and designing bridges for where it doesn't."

## Purpose

Facilitate structured Fit-to-Standard workshops per SAP module or process area. Each workshop follows a 5-step protocol: Present Standard → Compare AS-IS → Score Gaps → Classify Remediation → Document Results.

## When to Use

- Conducting fit-to-standard workshops during SAP Activate Explore phase
- Comparing current business processes with SAP best practices
- Scoring and classifying gaps for a specific module (CO, SD, PS, FI, HCM)
- Validating SAP Scope Items against actual business requirements
- Producing workshop documentation for steering committee review

---

## Table of Contents

1. [Workshop Protocol](#1-workshop-protocol)

> Deep knowledge: `references/body-of-knowledge.md`
> Skill dependencies: `references/knowledge-graph.mmd`
2. [SAP Best Practice Reference by Module](#2-sap-best-practice-reference-by-module)
3. [Gap Scoring Matrix](#3-gap-scoring-matrix)
4. [Clean Core Compliance Scoring](#4-clean-core-compliance-scoring)
5. [Workshop Output Template](#5-workshop-output-template)
6. [Process Area Coverage Checklist](#6-process-area-coverage-checklist)

---

## 1. Workshop Protocol

### Step 1: Present SAP Best Practice
- Identify relevant SAP Scope Item(s) for the process area
- Present the standard SAP process flow (from SAP Best Practices Explorer)
- Highlight configuration options available within standard
- Note: Present what SAP CAN do, not what it CANNOT do

### Step 2: Compare with AS-IS
For each process step in the SAP best practice:
- **Green (Fit)**: Business process matches SAP standard exactly or with minor config
- **Yellow (Partial Fit)**: Business process is similar but requires configuration adjustments
- **Red (Gap)**: Business process differs significantly from SAP standard

Document with evidence tags:
- `[STAKEHOLDER]` — Business user confirmed the AS-IS process
- `[DOC]` — Process documented in existing documentation
- `[SUPUESTO]` — Assumed based on industry patterns (requires validation)

### Step 3: Score Gaps
Apply the Gap Scoring Matrix (Section 3) to every Yellow and Red item.

### Step 4: Classify Remediation
Based on gap score, classify the remediation path:

| Gap Type | Score Range | Remediation | Clean Core |
|----------|-------------|-------------|------------|
| **Fit** | 0 | Use standard as-is | Compliant |
| **Configure** | 1-4 | SAP config (IMG, Key User tools) | Compliant |
| **Extend (Key User)** | 5-6 | Custom fields, custom logic, custom CDS | Compliant |
| **Extend (ABAP Cloud)** | 7-8 | RAP application, released API consumption | Compliant |
| **Extend (BTP)** | 9-10 | Side-by-side CAP app, integration via CPI | Compliant |
| **Custom (AVOID)** | 11-12 | Classic modification — NOT recommended | Non-compliant |
| **Workaround** | 3-6 | Process change + change management effort | Compliant |

### Step 5: Document Results
Produce workshop output using the template in Section 5.

---

## 2. SAP Best Practice Reference by Module

### CO — Controlling
| Process Area | Scope Item | SAP Best Practice |
|-------------|-----------|-------------------|
| Cost Center Accounting | 1FH | Cost center hierarchy, allocation cycles |
| Profit Center Accounting | 1G0 | Profit center groups, transfer pricing |
| Activity Types & Rates | (CO config) | Activity types per skill level, cost/sales rate split |
| Internal Orders | 1G1 | Time-bound cost collectors for bench/training |
| Profitability Analysis | J87 | CO-PA with characteristic derivation |

### SD — Sales & Distribution
| Process Area | Scope Item | SAP Best Practice |
|-------------|-----------|-------------------|
| Sales Orders (T&M) | 4E9 | Sales order 1:1 with project, timesheet-based billing |
| Sales Orders (Fixed Price) | 4E9 | Milestone billing plan, PoC recognition |
| Billing & Invoicing | J14 | Billing due list, output management |
| Pricing Conditions | (SD config) | PSP0/PCP0 condition types, rate tables |
| Credit Management | 1EH | Credit exposure monitoring |

### PS — Project System
| Process Area | Scope Item | SAP Best Practice |
|-------------|-----------|-------------------|
| Customer Projects | J11 | WBS hierarchy, work packages, milestones |
| Resource Planning | J11 | Staffing assignments, capacity planning |
| Project Billing | J14 | Sales order integration, billing trigger |
| Time Management | J12 | Manage My Timesheet or CATS integration |
| Project Analytics | J11 | Commercial Project Management dashboard |

### FI — Financial Accounting
| Process Area | Scope Item | SAP Best Practice |
|-------------|-----------|-------------------|
| General Ledger | 1FC | Chart of accounts, parallel ledgers |
| Accounts Receivable | 1FD | Customer master, dunning, payments |
| Accounts Payable | 1FE | Vendor master, payment runs |
| Revenue Recognition | 1IL | EBRR, IFRS 15, ASC 606 |
| Intercompany | 4EZ | IC billing, clearing, transfer pricing |
| E-Invoicing | (Localization) | Country-specific e-invoicing (CFDI, FEL, etc.) |

### HCM / SuccessFactors
| Process Area | Scope Item | SAP Best Practice |
|-------------|-----------|-------------------|
| Employee Master | (SF EC) | Employee Central |
| Time Management | J12 | Manage My Timesheet or CATS |
| Payroll | (SF Payroll) | Country-specific payroll engines |

---

## 3. Gap Scoring Matrix

Score each gap across 4 dimensions (1-3 each):

| Dimension | 1 (Low) | 2 (Medium) | 3 (High) |
|-----------|---------|------------|----------|
| **Effort** | < 3 days config | 1-2 weeks development | > 2 weeks complex dev |
| **Risk** | No dependencies | Some cross-module | Critical path blocker |
| **Upgrade Impact** | Standard config only | Key User extension | ABAP Cloud / BTP |
| **Business Value** | Nice to have | Important for efficiency | Must-have / regulatory |

**Gap Score** = Effort + Risk + Upgrade Impact

**Adjusted Priority** = Gap Score - Business Value (lower = higher priority for implementation)

| Score | Classification | Recommendation |
|-------|---------------|----------------|
| 0 | Fit | Use standard |
| 1-4 | Configure | Preferred — standard config |
| 5-6 | Extend (Key User) | Acceptable — low upgrade risk |
| 7-8 | Extend (ABAP Cloud) | Acceptable with ADR justification |
| 9-10 | Extend (BTP) | Side-by-side — isolated from core |
| 11-12 | Custom (AVOID) | Redesign business process instead |

---

## 4. Clean Core Compliance Scoring

Every gap remediation must pass this checklist:

| # | Criterion | Pass | Fail |
|---|-----------|------|------|
| 1 | Uses released SAP APIs only | Released API catalog | Direct DB access |
| 2 | No modification to SAP standard | Extension point used | Code overlay |
| 3 | Upgrade-safe extension | Key User or ABAP Cloud | Classic enhancement |
| 4 | Data model extension only via custom fields | Custom field app | Z-table in standard namespace |
| 5 | Integration via standard protocols | OData V4, REST, Event Mesh | Direct RFC/BAPI |
| 6 | UI extension via Fiori patterns | Fiori Elements, SAP Build | Custom BSP/WebDynpro |

**Score**: Count of Pass items. 6/6 = Fully compliant. <4/6 = Red flag — requires SDA review.

---

## 5. Workshop Output Template

```markdown
# Fit-to-Standard Workshop: {Module} — {Client}

## Summary
- **Module**: {CO|SD|PS|FI|HCM}
- **Scope Items**: {list}
- **Date**: {date}
- **Participants**: {names + roles}
- **Process Areas Covered**: {count}

## Results Overview
| Status | Count | % |
|--------|-------|---|
| Green (Fit) | {n} | {%} |
| Yellow (Configure) | {n} | {%} |
| Red (Gap) | {n} | {%} |

## Process Area Detail

### {Process Area Name}
- **Scope Item**: {code}
- **SAP Best Practice**: {description}
- **AS-IS**: {current process} [{evidence tag}]
- **Status**: {Green|Yellow|Red}
- **Gap Score**: {0-12} (Effort: {1-3}, Risk: {1-3}, Upgrade: {1-3})
- **Business Value**: {1-3}
- **Classification**: {Fit|Configure|Extend|Custom|Workaround}
- **Remediation**: {description}
- **Clean Core Compliance**: {score}/6
- **Dependencies**: {other gaps this depends on}

[Repeat per process area]

## Blocking Gaps
{List of gaps that block other gaps or critical path items}

## Recommendations
{Prioritized list of next actions}
```

---

## 6. Process Area Coverage Checklist

Ensure all critical process areas are covered per module:

### CO Checklist
- [ ] Cost Center hierarchy and allocation
- [ ] Profit Center hierarchy and reporting
- [ ] Activity Types and rate management (Cost Rate + Sales Price)
- [ ] Internal orders for non-billable work
- [ ] CO-PA configuration (if profitability analysis required)
- [ ] Period-end closing procedures

### SD Checklist
- [ ] Sales order types per billing model (T&M, Fixed Price, Retainer)
- [ ] Pricing conditions and rate tables
- [ ] Billing plan configuration (periodic, milestone)
- [ ] Output management (invoice format, e-invoicing)
- [ ] Credit management
- [ ] Revenue recognition integration (Scope 1IL)

### PS Checklist
- [ ] WBS element hierarchy and project profiles
- [ ] Work package and milestone structure
- [ ] Resource assignment and capacity planning
- [ ] Time recording integration (native or CATS)
- [ ] Project billing and sales order linkage
- [ ] Project analytics and dashboards

### FI Checklist
- [ ] Chart of accounts design (operating + group + country)
- [ ] Company code and legal entity structure
- [ ] Parallel ledgers (if IFRS + local GAAP)
- [ ] Intercompany posting and clearing
- [ ] Tax configuration per country
- [ ] E-invoicing per jurisdiction
- [ ] Bank account management and payment runs

---

## Quality Criteria

1. Workshop protocol followed for every process area (Present → Compare → Score → Classify → Document)
2. All gaps scored with 4-dimension matrix and classified
3. Clean Core compliance checked for every extension proposal
4. Process area coverage checklist completed per module
5. Blocking gaps identified and flagged for early resolution
6. Evidence tags applied to every AS-IS claim

## Anti-Patterns

1. **Presenting SAP limitations first** — Always lead with what SAP CAN do, then address gaps
2. **Scoring without stakeholder validation** — Business Value must come from business users, not consultants
3. **Skipping Clean Core compliance** — Every extension MUST pass the compliance checklist before entering the roadmap
4. **One workshop for all modules** — Each module deserves dedicated workshop time with relevant SMEs

## Cross-References

- **sofka-sap-discovery**: Orchestrates workshop sequencing (CP-3)
- **sofka-sap-gap-analysis**: Consumes workshop output for deeper analysis
- **sofka-sap-implementation**: Module configuration reference during workshops
- **sofka-sap-solution-design**: Architecture decisions informed by gap classification
- **sofka-sap-activate-methodology**: Workshop timing aligned to Explore phase

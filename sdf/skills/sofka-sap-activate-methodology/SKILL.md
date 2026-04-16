---
name: sofka-sap-activate-methodology
author: JM Labs (Javier Montano)
description: >
  SAP Activate methodology skill covering the 6 implementation phases (Discover, Prepare,
  Explore, Realize, Deploy, Run), quality gates, governance model, deliverable checklists,
  and agile/hybrid variants. Use when the user mentions SAP Activate, SAP implementation
  methodology, phase planning, SAP project governance, SAP quality gates, SAP project
  management, go-live planning, or needs to align discovery deliverables with SAP Activate
  phases. Also trigger for SAP Activate accelerators, SAP Model Company, SAP Signavio
  process flows, or SAP Best Practices Explorer.
  Trigger: SAP Activate, implementation methodology, SAP phases, project governance,
  quality gates, SAP project planning, go-live readiness.
argument-hint: "<phase-or-topic> [--variant waterfall|agile|hybrid]"
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
  - Agent
---

# SAP Activate Methodology — Phases, Gates & Governance

> "SAP Activate is not a rigid waterfall — it's a risk-based framework that scales from 3-month rapid deployments to 18-month enterprise transformations."

## Purpose

Provide the canonical reference for SAP Activate methodology within the SDF discovery context. This skill governs the phase/gate structure that all other SAP skills reference for timing, deliverables, and governance decisions.

## When to Use

- Defining SAP implementation approach and timeline
- Aligning discovery deliverables with SAP Activate phases
- Planning quality gates and governance checkpoints
- Selecting methodology variant (waterfall, agile, hybrid)
- Mapping SDF pipeline phases to SAP Activate phases
- Planning go-live readiness and hypercare

---

## Table of Contents

1. [Phase Definitions](#1-phase-definitions)

> Deep knowledge: `references/body-of-knowledge.md`
> Skill dependencies: `references/knowledge-graph.mmd`
2. [Deliverable Checklist per Phase](#2-deliverable-checklist-per-phase)
3. [Quality Gate Criteria](#3-quality-gate-criteria)
4. [Governance Model](#4-governance-model)
5. [Methodology Variants](#5-methodology-variants)
6. [SDF-to-SAP Activate Phase Mapping](#6-sdf-to-sap-activate-phase-mapping)
7. [SAP Activate Accelerators](#7-sap-activate-accelerators)

---

## 1. Phase Definitions

### Phase 0: Discover
**Duration**: 2-6 weeks | **SDF Mapping**: Phases 0-3

- Define business case and scope
- Identify key stakeholders and decision-makers
- Initial landscape assessment (AS-IS)
- Scope Item selection from SAP Best Practices
- Initial fit-to-standard workshops (high-level)
- Go/No-Go decision

**Key Deliverables**: Business Case, Scope Definition, Stakeholder Map, Initial Gap List

### Phase 1: Prepare
**Duration**: 4-8 weeks | **SDF Mapping**: Phase 4

- Project charter and governance setup
- Technical infrastructure provisioning (SAP Cloud tenant)
- Team onboarding and training plan
- Detailed project plan with milestones
- Solution design authority formation
- Data migration strategy definition
- Integration architecture design

**Key Deliverables**: Project Charter, Solution Architecture Document, Migration Strategy, Integration Design

### Phase 2: Explore
**Duration**: 6-16 weeks | **SDF Mapping**: Phase 5

- Detailed fit-to-standard workshops per process area
- Gap analysis with classification (Fit/Configure/Extend/Custom)
- Solution design decisions (ADRs)
- Configuration documentation
- Data migration prototype (first wave)
- Integration PoC for critical interfaces
- Change management kickoff

**Key Deliverables**: Gap Analysis Report, Solution Design Document, Configuration Workbooks, PoC Results

### Phase 3: Realize
**Duration**: 8-20 weeks

- System configuration per module
- Extension development (Key User / ABAP Cloud / BTP)
- Data migration execution (iterative waves)
- Integration development and testing
- UAT preparation and execution
- Training material development
- Cutover plan development

**Key Deliverables**: Configured System, Extensions, Migration Results, UAT Report, Training Materials

### Phase 4: Deploy
**Duration**: 2-6 weeks

- Cutover rehearsal (at least 2 dry runs)
- Final data migration
- Go-live readiness assessment
- Go-live execution
- Hypercare period (4-6 weeks)
- Issue resolution and stabilization

**Key Deliverables**: Cutover Checklist, Go-Live Readiness Report, Hypercare Log

### Phase 5: Run
**Duration**: Ongoing

- Transition to operations team
- Continuous improvement backlog
- System optimization
- Feature adoption tracking
- Quarterly business review
- Innovation roadmap (new SAP features)

**Key Deliverables**: Operations Playbook, Improvement Backlog, Adoption Dashboard

---

## 2. Deliverable Checklist per Phase

| Phase | Deliverable | Owner | Format |
|-------|-------------|-------|--------|
| **Discover** | Business Case | Project Sponsor | MD/HTML |
| | Scope Definition (Scope Items) | Solution Architect | XLSX |
| | Stakeholder Map | Change Lead | MD |
| | Initial Gap List | Functional Leads | MD |
| **Prepare** | Project Charter | Project Manager | MD |
| | Solution Architecture Document | Solution Architect | MD/HTML |
| | Migration Strategy | Migration Lead | MD |
| | Integration Architecture | Integration Architect | MD/Mermaid |
| | Training Plan | Change Lead | MD |
| **Explore** | Fit-to-Standard Workshop Results | Functional Leads | MD per module |
| | Gap Analysis Report | Solution Architect | HTML |
| | Architecture Decision Records | Tech Leads | MD (ADR format) |
| | Configuration Workbooks | Functional Leads | XLSX |
| | PoC Results | Tech Leads | MD |
| **Realize** | UAT Test Cases | QA Lead | XLSX |
| | UAT Results | Business Users | MD |
| | Training Materials | Change Lead | Various |
| | Cutover Plan | Migration Lead | MD |
| **Deploy** | Go-Live Readiness Assessment | Steering Committee | MD |
| | Cutover Execution Log | Migration Lead | MD |
| | Hypercare Protocol | Support Lead | MD |
| **Run** | Operations Playbook | Ops Team | MD |
| | Improvement Backlog | Product Owner | XLSX |

---

## 3. Quality Gate Criteria

### Gate 1: Discover → Prepare (Go/No-Go)
| Criterion | Pass Condition |
|-----------|---------------|
| Business case approved | Sponsor sign-off |
| Scope Items selected | >= 80% scope defined |
| Stakeholders identified | RACI documented |
| Budget approved | Within +/- 15% of estimate |
| Team available | Key roles staffed |

### Gate 2: Prepare → Explore (Solution Readiness)
| Criterion | Pass Condition |
|-----------|---------------|
| Infrastructure provisioned | SAP tenant accessible |
| Project plan approved | Milestones defined |
| Architecture approved | SAD signed off |
| Team trained | SAP basics completed |
| Governance active | Steering committee formed |

### Gate 3: Explore → Realize (Design Freeze)
| Criterion | Pass Condition |
|-----------|---------------|
| All gaps classified | 0 unclassified gaps |
| ADRs documented | All blocking gaps have ADRs |
| Configuration documented | Workbooks per module |
| PoCs validated | Critical integrations proven |
| Migration prototype done | First wave successful |

### Gate 4: Realize → Deploy (Go-Live Readiness)
| Criterion | Pass Condition |
|-----------|---------------|
| UAT passed | >= 95% test cases passed |
| Training completed | >= 90% users trained |
| Data migration validated | <= 0.1% variance |
| Cutover rehearsed | >= 2 successful dry runs |
| Hypercare plan approved | Support team ready |
| Change readiness scored | >= 70% readiness score |

---

## 4. Governance Model

### Steering Committee
- **Frequency**: Bi-weekly during Discover/Prepare, weekly during Explore/Realize/Deploy
- **Members**: Executive Sponsor, Project Director, Solution Architect Lead, Change Lead
- **Authority**: Go/No-Go decisions, scope changes, budget adjustments, escalation resolution

### Solution Design Authority (SDA)
- **Frequency**: Weekly during Explore, bi-weekly during Realize
- **Members**: Solution Architect, Module Leads, Integration Architect, Security Lead
- **Authority**: ADR approval, extension decisions (Key User vs ABAP Cloud vs BTP), Clean Core compliance

### Workstream Leads
- **Frequency**: Daily standups, weekly sync
- **Workstreams**: Functional (per module), Technical (extensions + integrations), Data (migration + quality), Change (training + adoption)

### Escalation Path
```
Workstream Lead → SDA → Project Director → Steering Committee → Executive Sponsor
```

**Decision Timeline**: Workstream (same day) → SDA (2 days) → Steering (1 week) → Executive (escalation)

---

## 5. Methodology Variants

### Waterfall (Classic SAP Activate)
- **When**: Regulatory-heavy, fixed scope, large enterprises
- **Characteristics**: Sequential phases, formal gates, comprehensive documentation
- **Risk**: Late discovery of gaps, change resistance

### Agile (Scrum-based SAP Activate)
- **When**: Greenfield, smaller scope, agile-mature teams
- **Characteristics**: 2-week sprints within Explore/Realize, iterative fit-to-standard, continuous integration
- **Risk**: Scope creep, insufficient documentation for compliance

### Hybrid (Recommended for most)
- **When**: Enterprise with mixed maturity, multi-module implementations
- **Characteristics**: Waterfall gates with agile execution within phases, configuration sprints, iterative UAT
- **Trade-off Matrix**:

| Dimension | Waterfall | Hybrid | Agile |
|-----------|-----------|--------|-------|
| Scope clarity | High | Medium-High | Medium |
| Change frequency | Low | Medium | High |
| Documentation | Comprehensive | Targeted | Minimal |
| Gate formality | Formal | Semi-formal | Lightweight |
| Team size | Large (50+) | Medium (20-50) | Small (10-20) |
| Duration | 12-18 months | 9-15 months | 6-12 months |

---

## 6. SDF-to-SAP Activate Phase Mapping

| SDF Phase | SDF Deliverable | SAP Activate Phase | SAP Activate Deliverable |
|-----------|----------------|-------------------|------------------------|
| Phase 0 — Preparacion | Discovery Plan | Discover | Business Case |
| Phase 1 — Contexto | Brief Tecnico | Discover | Scope Definition |
| Phase 2 — Diagnostico | AS-IS Analysis | Discover/Explore | Fit-to-Standard Results |
| Phase 3 — Evaluacion | Scenarios + Feasibility | Explore | Gap Analysis + ADRs |
| Phase 4 — Diseno | Solution Roadmap | Prepare/Explore | SAD + Migration Strategy |
| Phase 5 — Formalizacion | Spec + Pitch + Handover | Prepare | Project Charter + Plan |
| Phase 6 — Reporting | Findings + Reports | (Cross-cutting) | Status Reports |

**Key Insight**: SDF Phases 0-3 map primarily to SAP Activate Discover + early Explore. The SDF discovery pipeline produces the inputs that SAP Activate Prepare and Explore phases consume.

---

## 7. SAP Activate Accelerators

| Accelerator | Purpose | Phase |
|-------------|---------|-------|
| **SAP Best Practices Explorer** | Pre-configured process flows per scope item | Discover/Explore |
| **SAP Model Company** | Pre-configured demo system with industry content | Discover |
| **SAP Signavio** | Process mining and modeling for AS-IS/TO-BE | Discover/Explore |
| **SAP Cloud ALM** | Project management, testing, change management | All phases |
| **SAP Migration Cockpit** | Structured data migration with templates | Realize/Deploy |
| **SAP Enable Now** | Training content authoring and delivery | Realize/Deploy/Run |
| **SAP Discovery Center** | Mission-based BTP service onboarding | Prepare |

---

## Quality Criteria

1. All 6 SAP Activate phases documented with duration ranges and key deliverables
2. Quality gate criteria defined with measurable pass conditions
3. Governance model includes escalation path and decision timelines
4. Methodology variant selection criteria documented with trade-off matrix
5. SDF-to-SAP Activate mapping enables seamless handoff from discovery to implementation
6. Accelerator reference links to specific SAP tools per phase

## Anti-Patterns

1. **Skipping Discover phase** — Jumping to Prepare without business case and scope validation leads to scope creep and rework
2. **Formal gates without authority** — Gates must have empowered decision-makers; ceremonial gates waste time
3. **One-size-fits-all methodology** — Always assess team maturity and scope complexity before selecting variant
4. **Ignoring Run phase** — Implementation success is measured in adoption, not go-live

## Edge Cases

1. **Brownfield (ECC → S/4HANA)** — Discover phase must include legacy landscape assessment; Explore includes conversion-specific gaps (custom code, data volume)
2. **Multi-country rollout** — Repeat Explore/Realize per country wave with localization-specific fit-to-standard
3. **Parallel implementation + business transformation** — SDA must arbitrate between process redesign and SAP configuration; avoid conflating both

## Cross-References

- **sofka-sap-discovery**: Orchestrates the SDF discovery pipeline aligned to SAP Activate Discover
- **sofka-sap-fit-to-standard**: Detailed workshop protocol for Explore phase
- **sofka-sap-gap-analysis**: Gap classification taxonomy used during Explore
- **sofka-sap-solution-design**: Solution architecture aligned to Prepare phase
- **sofka-sap-data-migration**: Migration strategy mapped to Realize/Deploy
- **sofka-sap-testing-validation**: UAT and cutover mapped to Realize/Deploy
- **sofka-sap-change-adoption**: Change management spanning Explore through Run
- **sofka-sap-implementation**: Module-level configuration reference for Explore/Realize

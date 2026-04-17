# SAP Discovery & Landscape Assessment — Body of Knowledge

## 1. Overarching Frameworks

### SAP Activate Methodology — Discover Phase
The SAP Activate methodology is the primary six-phase framework for S/4HANA implementations. The **Discover phase** is the entry point where organizations explore solution capabilities, uncover business value, define their digital transformation strategy, and build a roadmap. It is a non-committal phase providing evaluation before investment.

### Phase Zero (Pre-Migration Governance)
A crucial pre-migration stage lasting 6-12 weeks before any technical work begins. Focus areas:
- Project governance setup
- Data quality assessment
- Scope definition
- Stakeholder alignment
- Success metric agreement

**Critical Insight**: ISG research identifies governance failures as the primary driver of 60% over-budget implementations. Phase Zero is most often skipped in brownfield projects — which is precisely where it is most needed.

---

## 2. Core Discovery & Assessment Tools

### Digital Discovery Assessment (DDA)
A key evaluation tool during the Discover phase to define project scope and determine optimal S/4HANA Cloud setup.

| Input | Output |
|-------|--------|
| Existing ERP environment | Scope recommendation |
| Integration requirements | Extension assessment |
| Data quality baseline | Handover report for implementation team |
| Business processes | Migration path recommendation |

### SAP Readiness Check
A diagnostic tool evaluating existing SAP ECC systems for migration impact. Five critical assessment pillars:

| Pillar | What It Evaluates |
|--------|-------------------|
| **Simplification Items** | Changing functions or data models (mandatory) |
| **Financial Data Quality** | FI data integrity for migration |
| **Customer Vendor Integration (CVI)** | Business Partner readiness |
| **Custom Code Analysis** | Z-objects needing remediation/deprecation |
| **Business Process Innovation** | Process improvement potential |

### Business Process Intelligence (BPI) & SAP Signavio
Process mining tools that uncover how work is actually done in the AS-IS architecture:
- **SAP Signavio Process Insights (Discovery Edition)**: Evaluates current performance against industry benchmarks
- Identifies process blockers and unused data/transactions
- Highlights cleanup candidates before migration

### SAP Value Lifecycle Manager (VLM) & Transformation Navigator
- **VLM**: Builds quantifiable business case by benchmarking processes and estimating ROI
- **Transformation Navigator**: Generates customized product roadmap for transition guidance

---

## 3. Migration Path Selection

The landscape assessment determines the optimal deployment model based on technical debt and business goals.

### Decision Framework

| Path | Description | Best For | Risk Profile |
|------|-------------|----------|-------------|
| **Greenfield** | Completely new implementation, clean start | High customization debt, desire for process redesign | Higher effort, lower tech debt |
| **Brownfield** | System conversion retaining existing data and customizations | Low Z-object count, satisfactory processes | Lower effort, carries tech debt |
| **Bluefield / Selective Data Transition** | Hybrid: selectively migrates specific data and processes | Mixed landscape, selective modernization | Balanced effort and risk |

### Migration Path Scoring Framework

Score across 3 dimensions (1-3 each):

| Dimension | 1 (Low) | 2 (Medium) | 3 (High) |
|-----------|---------|------------|----------|
| **Technical Debt** | < 500 Z-objects | 500-2000 Z-objects | > 2000 Z-objects |
| **Process Transformation Ambition** | Minor improvements | Significant redesign | Complete transformation |
| **Data Complexity** | Single entity, clean data | Multi-entity, moderate quality | Multi-country, poor quality |

**Score Interpretation**:
- 3-4: Brownfield preferred
- 5-6: Bluefield / selective approach
- 7-9: Greenfield recommended

**Caveat**: Change management capacity is a fourth dimension that can override numerical results. A high transformation ambition score with no change management budget does not reflect reality.

---

## 4. Clean Core Strategy

An architectural principle requiring the ERP system to remain as close to SAP standard as possible.

### Clean Core Principles
1. No modifications to SAP standard code
2. Extensions decoupled via SAP BTP or controlled in-app extensibility
3. System remains stable, easily upgradeable
4. Capable of adopting advanced innovations (e.g., SAP Joule AI)

### Fit-to-Standard Mindset
During discovery, organizations adopt standard SAP Best Practices. Gaps are only approved for custom development if they meet strict criteria:
- Fulfilling statutory/regulatory requirements
- Protecting a competitive edge
- Meaningfully reducing operational risk

---

## 5. Comprehensive Readiness Dimensions

A holistic assessment evaluates the company across multiple domains:

| Domain | Assessment Areas |
|--------|-----------------|
| **Technical Readiness** | Custom code inventory, integration maps, infrastructure |
| **Data Readiness** | Master data governance, archiving strategies, data quality |
| **Process Readiness** | Process documentation maturity, standardization level |
| **Organizational Readiness** | Change management capacity, training infrastructure, executive sponsorship |
| **Financial Readiness** | Budget allocation, TCO modeling, ROI projections |

### Readiness Scoring Matrix

| Dimension | 1 (Low) | 3 (Medium) | 5 (High) |
|-----------|---------|------------|----------|
| Executive sponsorship | Absent or passive | Partial engagement | Active champion |
| Process documentation | None or fragmented | Partially documented | Structured and current |
| Data quality | Poor, inconsistent | Moderate, some governance | Governed and profiled |
| Change readiness | Resistant to change | Cautious but open | Eager for transformation |
| Technical maturity | Legacy-heavy, high custom code | Mixed landscape | Cloud-ready, low customization |

**Overall Readiness Score**: Average across dimensions.
- < 2.5 = High Risk (defer or descope)
- 2.5-3.5 = Moderate (proceed with mitigation plan)
- > 3.5 = Ready (proceed with confidence)

---

## 6. Discovery Deliverables

| Deliverable | Purpose | Owner |
|------------|---------|-------|
| Business Case | ROI justification and strategic alignment | Executive Sponsor |
| Scope Definition | Module selection and scope item mapping | Solution Architect |
| Landscape Assessment | Current state inventory and readiness scoring | Technical Lead |
| Stakeholder Map | RACI and influence analysis | Change Lead |
| Migration Path Recommendation | Greenfield/Brownfield/Bluefield decision | Architecture Team |
| Initial Gap List | High-level gaps from preliminary fit-to-standard | Functional Leads |
| Discovery Handover Report | Complete package for implementation team | Discovery Conductor |

---

## 7. Anti-Patterns in SAP Discovery

| Anti-Pattern | Consequence | Prevention |
|-------------|-------------|-----------|
| Skipping Phase Zero | Governance failures, 60% over-budget | Mandate 6-12 week Phase Zero |
| Ignoring custom code inventory | Brownfield surprises during Realize | Run SAP Readiness Check early |
| Over-ambitious greenfield | Timeline and budget explosion | Score migration path objectively |
| No data quality assessment | Migration failures and rework | Profile data in Discover phase |
| Single-stakeholder discovery | Missing requirements, late gaps | RACI with broad representation |

---

*Reference derived from 54 deep-researched sources in NotebookLM notebook `SAP Discovery & Landscape Assessment`.*
*Author: JM Labs (Javier Montano).*

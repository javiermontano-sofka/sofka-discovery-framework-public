# Body of Knowledge — Governance Framework

## 1. Foundations of Project Governance

Project governance defines the framework of authority, accountability, and decision-making that guides project execution. It establishes the rules, relationships, and mechanisms through which organizational strategy is translated into project outcomes. [DOC]

### 1.1 Governance Domains

| Domain | Scope | Key Artifacts |
|--------|-------|---------------|
| Strategic Governance | Portfolio alignment, investment decisions | Charter, business case |
| Delivery Governance | Execution oversight, quality assurance | Stage gates, status reports |
| Financial Governance | Budget control, cost management | Budget reports, EVM |
| Risk Governance | Risk appetite, escalation protocols | Risk register, RAID log |
| Compliance Governance | Regulatory, contractual adherence | Audit reports, compliance matrix |

### 1.2 Governance Models

1. **Centralized PMO Governance** — Single authority over all project decisions. [DOC]
2. **Federated Governance** — Shared authority between central PMO and business units. [DOC]
3. **Decentralized Governance** — Autonomous teams with portfolio-level guardrails. [INFERENCIA]
4. **Hybrid Governance** — Adaptive model based on project size and risk. [PLAN]

## 2. Standards and Frameworks

### 2.1 PMI Governance Framework

PMBOK 7th Edition embeds governance within the Stewardship performance domain. OPM3 provides organizational project management maturity including governance assessment. [DOC]

### 2.2 PRINCE2 Governance

PRINCE2 prescribes a structured governance model with Project Board (Executive, Senior User, Senior Supplier), defined tolerances, and exception management. [DOC]

### 2.3 ISO 21500 / ISO 21502

ISO standards for project management include governance principles: accountability, strategy alignment, stakeholder engagement, and performance optimization. [DOC]

### 2.4 COBIT for IT Governance

COBIT 2019 provides governance objectives for IT-related projects, mapping to enterprise governance of IT (EGIT). [DOC]

## 3. Governance Structure Components

| Component | Purpose | Frequency |
|-----------|---------|-----------|
| Steering Committee | Strategic decisions, investment approval | Monthly |
| Project Board | Delivery oversight, exception handling | Bi-weekly |
| Change Control Board | Scope/schedule change approval | As needed |
| Quality Review Board | Deliverable acceptance | Per milestone |
| Risk Committee | Risk response approval, escalation | Monthly |

## 4. Decision Rights Matrix (RACI+)

| Decision Type | Sponsor | PM | PMO | Steering |
|---------------|---------|-----|-----|----------|
| Project Charter | A | R | C | I |
| Budget Changes >10% | A | R | C | A |
| Scope Changes | I | R | C | A |
| Resource Allocation | I | R | A | I |
| Risk Escalation | I | R | I | A |
| Stage Gate Approval | A | R | C | A |

## 5. Escalation Framework

### 5.1 Tolerance-Based Escalation

- **Green Zone** — Within tolerance: PM manages autonomously
- **Amber Zone** — Approaching tolerance: PM escalates to Project Board
- **Red Zone** — Tolerance breached: Exception report to Steering Committee

### 5.2 Escalation Triggers

1. Schedule variance > 15% of phase duration [METRIC]
2. Cost variance > 10% of stage budget [METRIC]
3. Critical risk materialization (impact > high) [PLAN]
4. Stakeholder conflict requiring executive intervention [STAKEHOLDER]
5. Quality gate failure on critical deliverable [METRIC]

## 6. Governance Artifacts

| Artifact | Owner | Update Frequency |
|----------|-------|-----------------|
| Governance Charter | PMO Director | Annually |
| RACI Matrix | Project Manager | Per phase |
| Decision Log | Project Manager | Continuous |
| Escalation Register | Project Manager | As needed |
| Stage Gate Checklist | Quality Manager | Per gate |
| Compliance Matrix | Compliance Officer | Quarterly |

## 7. Anti-Patterns in Governance

1. **Over-Governance** — Excessive approvals slowing delivery [INFERENCIA]
2. **Governance Theater** — Meetings without decisions or accountability
3. **Shadow Governance** — Informal decision networks bypassing formal structure
4. **Absent Sponsor** — Governance body exists but lacks executive engagement
5. **One-Size-Fits-All** — Same governance for 5-person and 50-person projects

## 8. Academic References

1. APM — *Governance of Project Management* (2nd ed., 2011)
2. PMI — *Governance of Portfolios, Programs, and Projects* (2016)
3. Muller, R. — *Project Governance* (Routledge, 2009)
4. Too, E. & Weaver, P. — "The Management of Project Management" (IJPM, 2014)
5. ISACA — *COBIT 2019 Framework* (2019)

*PMO-APEX v1.0 — Body of Knowledge · Governance Framework*

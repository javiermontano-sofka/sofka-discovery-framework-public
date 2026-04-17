# SAP Gap Analysis — Body of Knowledge

## 1. Conceptual Foundation

Gap analysis in SAP is a systematic process to identify differences between the current "as-is" state of business processes and the desired "to-be" state supported by standard SAP functionalities. It is structurally embedded into the Fit-to-Standard analysis during the SAP Activate Explore phase. The core philosophy mandates adopting SAP Best Practices first and justifying any deviation strictly based on business value.

---

## 2. Gap Classification Taxonomies

### Business and Functional Gaps
Instances where SAP standard features fail to meet unique business requirements, necessitating business process re-engineering, guided configurations, or custom enhancements.

### Technical and Correction Gaps
Based on SAP's Simplification Item Checks, classified into:
- **Deleted/Obsolete Transactions** — functions removed in S/4HANA
- **HANA 2.0 Migration Adjustments** — native SQL or non-buffered table issues
- **Custom Code Preparations** — adjusting cloned programs, fixing obsolete functions, validating inactive user exits, addressing syntax errors

### Seven-Class Remediation Taxonomy

| Class | Score Range | Definition | Clean Core |
|-------|-----------|-----------|------------|
| **Fit** | 0 | SAP standard covers requirement | Compliant |
| **Configure** | 1-4 | Standard SAP config resolves gap | Compliant |
| **Extend-KU** | 5-6 | Key User Extensibility sufficient | Compliant |
| **Extend-RAP** | 7-8 | ABAP Cloud / RAP development needed | Compliant |
| **Extend-BTP** | 9-10 | BTP side-by-side application | Compliant |
| **Custom** | 11-12 | Classic modification (AVOID) | Non-compliant |
| **Workaround** | Variable | Business process change + change mgmt | Compliant |

---

## 3. Dependency Mapping Techniques

### Process-Centric Landscape Analysis
Synchronize business process models in SAP Signavio with the IT architecture repository in SAP LeanIX. This bidirectional alignment reveals which applications, data objects, and interfaces support each process step, making downstream impact of modifications immediately visible.

### AI-Assisted Impact Assessment
Generative AI components (like SAP LeanIX AI-Assistant) can rapidly map dependencies, evaluating how application removals or updates ripple across interconnected systems.

### Scope Dimension Matrix
Sequence resolutions by evaluating dependencies across three dimensions:
- **WHAT** — the building blocks (data objects, config items)
- **WHERE** — regions, business units, legal entities
- **WHOM** — target users, asset groups, stakeholder segments

### Dependency Types

| Type | Definition | Example |
|------|-----------|---------|
| **Prerequisite** | Gap A must be resolved before Gap B | Master data structure before transactional config |
| **Enables** | Gap A's resolution unlocks Gap B | Activity Type config enables cost allocation |
| **Shares-data** | Both gaps modify the same SAP object | Two gaps affecting the same CDS view |
| **Conflicts** | Resolutions are mutually exclusive | Two different approaches to the same process |

---

## 4. Gap Prioritization Algorithms

### Five-Factor Scoring
Gaps are weighted based on:
1. **Business Impact** — revenue, compliance, or operational effect
2. **Technical Complexity** — development effort and skill requirements
3. **Feasibility** — likelihood of successful implementation
4. **Compliance Necessity** — regulatory or legal requirement
5. **User Experience Improvement** — end-user satisfaction impact

### Application Criticality Matrix
A two-axis matrix for severity assessment:
- **X-axis**: Likelihood/probability of failure
- **Y-axis**: Impact/consequence of failure

Four priority quadrants:
1. **Mission-critical** — failure causes catastrophic production halt
2. **Business-critical** — failure causes financial or operational risk
3. **Business operational** — disruptions cause internal friction
4. **Administrative** — downtime is tolerable

### Wave Assignment Algorithm
```
Priority Score = (Business Value x 2) + (Blocking Factor x 3) - (Effort + Risk + Upgrade Impact)
```

| Wave | Criteria | Timeline |
|------|---------|----------|
| Wave 1 (Blocking) | All blocking gaps + dependencies | Immediate — Explore phase |
| Wave 2 (High Value) | Priority > 5, non-blocking | Realize phase, Sprint 1-3 |
| Wave 3 (Medium) | Priority 2-5 | Realize phase, Sprint 4+ |
| Wave 4 (Defer) | Priority < 2 | Phase 2 or backlog |

---

## 5. Clean Core and Blocking Gap Resolution

### The A-B-C-D Extensibility Levels

| Level | Description | Clean Core Status | Use When |
|-------|-------------|-------------------|----------|
| **Level A** | Side-by-side (BTP) or on-stack ABAP Cloud, released APIs only | Best practice | Default choice |
| **Level B** | Classic APIs (BAPIs, IDocs, RFCs), established frameworks | Compliant | Level A not possible |
| **Level C** | Internal/unreleased SAP objects with governance tracking | Conditionally clean | Level A/B impossible |
| **Level D** | Direct modifications to SAP standard code | **Forbidden** | Never — refactor |

### Three-Tier Remediation Strategy
1. **Tier 1 (Target)**: Cloud-ready, upgrade-stable Key User or side-by-side extensions
2. **Tier 2 (Bridge)**: Custom wrapper objects for unreleased APIs
3. **Tier 3 (Avoid)**: Classical ABAP extensions that violate Clean Core

### Blocking Gap Resolution Protocol
1. Escalate to Solution Design Authority immediately
2. Create ADR documenting decision options and trade-offs
3. Time-box decision to 5 business days maximum
4. Communicate resolution approach to all dependent gap owners
5. Execute PoC if resolution approach is unproven (max 2 weeks)

---

## 6. Architecture Decision Records (ADRs) for SAP

### Standard 6-Part Template
1. **Status** — Draft, Proposed, Accepted, Rejected, Superseded, Deprecated
2. **Context** — Why this decision is needed
3. **Decision** — What was decided
4. **Consequences** — Positive and negative outcomes
5. **Alternatives Considered** — Other options evaluated
6. **Related References** — Links to standards, ADRs, gap IDs

### Tyree & Akerman 14-Field Format (Comprehensive)
For complex blocking gaps requiring detailed governance:
Issue, Decision, Status, Group, Assumptions, Constraints, Positions, Argument, Implications, Related decisions, Related requirements, Related artifacts, Related principles, Notes

### ADR Lifecycle
```
Draft → Proposed → Accepted → [Superseded | Deprecated]
                  → Rejected
```

ADRs should be centralized in SAP LeanIX or stored as Markdown files in Git for immutable history.

---

## 7. Gap Register Structure

### Required Fields per Gap

| Field | Description | Example |
|-------|-----------|---------|
| Gap ID | Unique identifier | GAP-CO-001 |
| Module | Affected SAP module(s) | CO, SD |
| Process Area | Business process impacted | Activity Type Management |
| Description | What the gap is | Custom allocation rule not in standard |
| AS-IS | Current behavior | Allocation via Excel formula |
| SAP Standard | Expected SAP behavior | Standard allocation cycle |
| Score | Effort + Risk + Upgrade Impact | 7 |
| Business Value | Stakeholder-assessed value | 3 (Must-have) |
| Classification | 7-class taxonomy | Extend-RAP |
| Blocking | Yes/No + dependent gap list | Yes — enables GAP-SD-003 |
| Wave | Resolution wave assignment | Wave 1 |
| ADR | Link to Architecture Decision Record | ADR-001 |
| Owner | Resolution responsible | CO Specialist |
| Clean Core | Extensibility level (A/B/C/D) | Level A |

---

*Reference derived from 49 deep-researched sources in NotebookLM notebook `SAP Gap Analysis & Remediation Patterns`.*
*Author: JM Labs (Javier Montano).*

# Body of Knowledge — Issue Management

## 1. Foundations of Issue Management

Issue management is the systematic identification, tracking, escalation, and resolution of problems that threaten project objectives. Unlike risks (uncertain events), issues are current problems requiring immediate action. [DOC]

### 1.1 Issue vs. Risk vs. Change

| Element | Timing | Certainty | Response |
|---------|--------|-----------|----------|
| Risk | Future | Uncertain | Mitigation plan |
| Issue | Present | Certain | Resolution action |
| Change | Proposed | Deliberate | Change request |
| Defect | Past | Confirmed | Fix/rework |

### 1.2 Issue Classification

| Category | Examples | Typical Owner |
|----------|---------|---------------|
| Technical | System failures, integration errors | Tech Lead |
| Resource | Staff unavailability, skill gaps | PM/Resource Manager |
| Scope | Ambiguous requirements, scope disputes | Product Owner |
| Schedule | Delays, dependency failures | PM |
| Budget | Cost overruns, funding gaps | Financial Controller |
| Stakeholder | Conflicting expectations, disengagement | PM/Sponsor |
| External | Vendor delays, regulatory changes | PM |

## 2. Standards and Frameworks

### 2.1 PMBOK Issue Management

PMBOK 7th Edition addresses issue management within the Project Work performance domain. Issues are logged, assessed, and resolved through defined processes. [DOC]

### 2.2 PRINCE2 Issue and Change Control

PRINCE2 defines three issue types: Request for Change, Off-Specification, and Problem/Concern. Each follows a defined lifecycle with formal escalation triggers. [DOC]

### 2.3 ITIL Incident and Problem Management

ITIL's incident and problem management processes parallel project issue management, particularly for IT-heavy projects. [DOC]

## 3. Issue Lifecycle

1. **Identification** — Issue detected and logged [PLAN]
2. **Assessment** — Impact and urgency evaluated [METRIC]
3. **Assignment** — Owner and resolver designated [STAKEHOLDER]
4. **Resolution Planning** — Action plan developed [PLAN]
5. **Resolution Execution** — Actions implemented [SCHEDULE]
6. **Verification** — Resolution confirmed effective [METRIC]
7. **Closure** — Issue formally closed with lessons captured [DOC]

## 4. Prioritization Framework

| Priority | Impact | Urgency | Response Time | Escalation |
|----------|--------|---------|---------------|-----------|
| Critical | Project-stopping | Immediate | 4 hours | Sponsor/Steering |
| High | Major objective at risk | This week | 24 hours | PM/Program Board |
| Medium | Moderate impact on delivery | This sprint | 3 business days | PM |
| Low | Minor inconvenience | When possible | Next sprint | Team Lead |

## 5. Issue Register Structure

| Field | Description | Required |
|-------|-------------|----------|
| Issue ID | Unique identifier | Yes |
| Title | Brief description | Yes |
| Category | Classification type | Yes |
| Priority | Critical/High/Medium/Low | Yes |
| Owner | Person responsible for resolution | Yes |
| Status | Open/In Progress/Resolved/Closed | Yes |
| Date Raised | When identified | Yes |
| Target Resolution | Due date for resolution | Yes |
| Resolution | How it was resolved | On closure |
| Impact | Effect on project objectives | Yes |

## 6. Escalation Protocol

| Trigger | Escalation Level | Action |
|---------|-----------------|--------|
| Unresolved > target date | PM → Program Board | Resource allocation |
| Impact exceeds PM authority | PM → Sponsor | Decision authority |
| Cross-project impact | PM → PMO | Portfolio coordination |
| Stakeholder conflict | PM → Steering | Conflict resolution |

## 7. Common Pitfalls

1. **Issue Hoarding** — Not escalating issues that exceed authority [INFERENCIA]
2. **Register Rot** — Issues logged but never reviewed or updated
3. **Everything is Critical** — No meaningful prioritization
4. **Root Cause Neglect** — Treating symptoms instead of causes
5. **Closed Without Verification** — Marking resolved without confirming

## 8. Academic References

1. PMI — *PMBOK Guide* 7th Edition
2. Axelos — *Managing Successful Projects with PRINCE2* (2017)
3. ITIL — *ITIL 4 Foundation* (Axelos, 2019)
4. Kerzner, H. — *Project Management: A Systems Approach* (13th ed.)
5. Wysocki, R. — *Effective Project Management* (8th ed.)

*PMO-APEX v1.0 — Body of Knowledge · Issue Management*

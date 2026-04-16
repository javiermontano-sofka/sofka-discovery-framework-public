# Conflict Resolution Plan — Acme Corp, Architecture Dispute

**Conflict**: Microservices vs. Modular Monolith | **Parties**: Backend Team vs. Platform Team | **Impact**: Sprint 5 blocked

## TL;DR
Technical architecture dispute blocking Sprint 5 development. Root cause: unclear decision authority for architecture choices. Resolution: structured decision session with DACI framework, followed by Architecture Decision Record.

## Conflict Assessment

| Dimension | Assessment | Evidence |
|-----------|-----------|----------|
| Type | Technical disagreement | Architecture review notes [DOC] |
| Severity | High — blocking delivery | Sprint 5 items on hold [SCHEDULE] |
| Duration | 2 weeks unresolved | Team standup logs [METRIC] |
| Root Cause | No Architecture Decision Record process; unclear who decides | Org chart gap [INFERENCIA] |
| Underlying Issue | Team autonomy vs. platform standardization | Cultural tension [STAKEHOLDER] |

## Resolution Approach

**TKI Mode**: Collaborating (high stakes, need buy-in from both teams)

### Step 1: Framing Session (30 min)
- Acknowledge both positions have merit [STAKEHOLDER]
- Establish shared goal: "What architecture best serves the project objectives?"
- Define decision criteria before discussing options

### Step 2: Structured Decision Workshop (2 hours)

| Criteria | Weight | Microservices | Modular Monolith |
|----------|--------|--------------|-------------------|
| Team autonomy | 25% | 5 | 3 [STAKEHOLDER] |
| Deployment speed | 20% | 4 | 4 [METRIC] |
| Operational complexity | 20% | 2 | 4 [METRIC] |
| Team expertise | 15% | 3 | 4 [STAKEHOLDER] |
| Future scalability | 20% | 5 | 3 [PLAN] |
| **Weighted Score** | | **3.8** | **3.6** |

### Step 3: DACI Assignment

| Role | Person | Responsibility |
|------|--------|---------------|
| Driver | Tech Lead | Drives decision to completion |
| Approver | CTO | Final decision authority |
| Contributors | Both teams | Input and expertise |
| Informed | PM, Product Owner | Notified of decision |

## Prevention Measures

1. **Establish ADR process** — All architecture decisions documented with rationale [DOC]
2. **DACI for all technical decisions** — Clear authority prevents future disputes [PLAN]
3. **Monthly Architecture Review** — Forum for technical alignment [SCHEDULE]

```mermaid
graph LR
    A[Conflict Detected] --> B[Root Cause Analysis]
    B --> C[DACI Assignment]
    C --> D[Structured Decision]
    D --> E[ADR Documented]
    E --> F[Prevention Measures]
    style D fill:#2563EB,color:#fff
    style F fill:#F59E0B,color:#000
```

*PMO-APEX v1.0 — Sample Output · Conflict Resolution*

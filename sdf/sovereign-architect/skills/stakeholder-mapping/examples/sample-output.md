# Stakeholder Mapping — Sample Output

## Context
A platform modernization project involving microservices migration, cloud migration, and new CI/CD pipeline. Cross-functional team across engineering, product, operations, and security.

## Output: Influence/Interest Matrix

```
                    HIGH INTEREST
                         │
    Keep Satisfied        │     Manage Closely
    ─────────────────────┼───────────────────
    VP Engineering        │     CTO (sponsor)
    Security Lead         │     Head of Product
    Legal/Compliance      │     Engineering Director
                         │     Platform Team Lead
                         │
HIGH ────────────────────┼──────────────────── LOW
INFLUENCE                │                    INFLUENCE
                         │
    Monitor               │     Keep Informed
    ─────────────────────┼───────────────────
    Finance (budget)      │     Frontend Team
    HR (hiring)           │     QA Engineers
    Vendor Account Mgr    │     Support Team
                         │     End Users (internal)
                         │
                    LOW INTEREST
```

## Output: RACI Matrix

| Decision / Deliverable | CTO | Eng Director | Platform Lead | Product | Security | Dev Teams |
|----------------------|-----|-------------|--------------|---------|----------|-----------|
| Architecture target state | C | A | R | C | C | I |
| Technology selection | C | A | R | I | C | C |
| Migration wave plan | I | A | R | C | C | I |
| CI/CD pipeline design | I | C | A | I | R (security) | R |
| Data migration strategy | C | A | R | C | C | R |
| Production cutover | A | R | R | I | C | R |
| Budget approval | A | R | C | C | I | I |
| Team staffing | C | A | R | I | I | I |

## Output: Communication Plan

| Stakeholder Group | Channel | Frequency | Artifact | Owner |
|------------------|---------|-----------|----------|-------|
| CTO / Sponsor | 1:1 meeting | Biweekly | Executive brief (1 page) | Eng Director |
| Leadership | Steering committee | Monthly | Progress dashboard + risks | Platform Lead |
| Security | Architecture review | Per milestone | ADRs + threat model updates | Platform Lead |
| Product | Sprint review | Biweekly | Demo + impact on roadmap | Scrum Master |
| Engineering teams | Town hall | Monthly | Technical deep-dive + Q&A | Platform Lead |
| All stakeholders | Status email | Weekly | Bullet-point update + blockers | Program Manager |
| Escalation path | Slack #modernization-escalation | As needed | Decision request template | Any team member |

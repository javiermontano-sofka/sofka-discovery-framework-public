# Risk Scorer — Sample Output

## Context
Risk assessment for a fintech application processing payments.

## Output

### Risk Matrix

|  | Rare (1) | Unlikely (2) | Possible (3) | Likely (4) | Certain (5) |
|--|---------|-------------|-------------|-----------|-------------|
| **Critical (5)** | | | R3 (15) | | R1 (25) |
| **Major (4)** | | | R5 (12) | R2 (16) | |
| **Moderate (3)** | | R7 (6) | R4 (9) | R6 (12) | |
| **Minor (2)** | | | | | |
| **Negligible (1)** | | | | | |

### Top Risks

| ID | Risk | Severity | Likelihood | Score | Evidence |
|----|------|----------|-----------|-------|----------|
| R1 | Data breach via SQL injection | 5 | 5 | **25** | Unparameterized queries found `[HECHO]` |
| R2 | Payment double-charge | 4 | 4 | **16** | No idempotency keys on payment API `[HECHO]` |
| R3 | Database data loss | 5 | 3 | **15** | No automated backups configured `[HECHO]` |
| R5 | Service outage from single point of failure | 4 | 3 | **12** | Single DB instance, no replica `[HECHO]` |

### Mitigation Plan (Top 3)

**R1 — SQL Injection (Score: 25)**
- Action: Replace all raw queries with parameterized queries
- Effort: 3 dev-days
- Timeline: This sprint (critical)
- Residual risk: 5 (after fix)

**R2 — Double-Charge (Score: 16)**
- Action: Implement idempotency keys on all payment endpoints
- Effort: 2 dev-days
- Timeline: Next sprint
- Residual risk: 4 (after fix)

**R3 — Data Loss (Score: 15)**
- Action: Configure automated daily backups with point-in-time recovery
- Effort: 1 dev-day
- Timeline: This week
- Residual risk: 3 (after fix)

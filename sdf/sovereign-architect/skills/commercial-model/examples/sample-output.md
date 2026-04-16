# Commercial Model — Sample Output

## Context

A Series B startup (80 engineers) needs to decide whether to build a custom
notification service or adopt a commercial solution. Current volume: 2M
notifications/month, projected 3x growth in 18 months.

## Output

### Option Summary

| Option | Type | Licensing | Estimated 3Y TCO |
|--------|------|-----------|-------------------|
| A. Build Custom | In-house | N/A | 18-22 FTE-months + infra |
| B. Customer.io | SaaS | Usage-based | Subscription + integration effort |
| C. Novu (OSS) | Open-source + self-hosted | MIT | Infra + 6-8 FTE-months integration |

### TCO Projection (3-Year, FTE-months)

| Cost Category | Option A (Build) | Option B (Customer.io) | Option C (Novu) |
|---------------|------------------|----------------------|-----------------|
| Initial Development | 12 FTE-mo | 3 FTE-mo | 5 FTE-mo |
| Annual Maintenance | 4 FTE-mo/yr | 1 FTE-mo/yr | 2 FTE-mo/yr |
| License/Subscription | 0 | ~Vendor pricing | 0 |
| Infrastructure | Self-managed | Included | Self-managed |
| Training | 2 FTE-mo | 1 FTE-mo | 1.5 FTE-mo |
| **Total 3Y Effort** | **26 FTE-mo** | **7 FTE-mo** | **12.5 FTE-mo** |

### Decision Matrix (Weighted)

| Criterion | Weight | Build | Customer.io | Novu |
|-----------|--------|-------|-------------|------|
| TCO (3Y) | 25% | 2 | 4 | 3 |
| Time to Market | 20% | 1 | 5 | 3 |
| Flexibility | 20% | 5 | 2 | 4 |
| Switching Cost | 15% | 5 | 2 | 4 |
| Operational Burden | 10% | 1 | 5 | 3 |
| Team Capability | 10% | 3 | 4 | 3 |
| **Weighted Score** | | **2.85** | **3.55** | **3.35** |

### Recommendation

**Option B (Customer.io)** scores highest for the current stage. Notifications are
context (not core differentiator), and the 19 FTE-month savings should be redirected
to product features. Re-evaluate at the 5M notifications/month threshold when
cost dynamics shift. [INFERENCIA]

### Sensitivity Analysis

- If notification volume grows 5x (not 3x): Option C becomes most cost-effective.
- If the team grows to 150+ engineers: Build option maintenance cost decreases per-capita.
- If Customer.io pricing increases >40%: Novu becomes the preferred option.

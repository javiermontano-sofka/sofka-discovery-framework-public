# Data Storytelling — Sample Output

## Context

An SRE team needs to justify continued investment in reliability engineering
to the VP of Engineering. They have 18 months of incident data showing
significant improvement.

## Output

### The Anchor Stat

Eighteen months ago, our customers experienced 14 hours of degraded service
every month. Today, that number is 47 minutes. That is not incremental improvement —
it is a 94% reduction in customer-facing impact.

### The Journey in Data

| Metric | 18 Months Ago | Today | Change |
|--------|--------------|-------|--------|
| Monthly downtime | 14.2 hours | 0.78 hours | -94% |
| Mean time to detect | 23 minutes | 3 minutes | -87% |
| Mean time to recover | 2.1 hours | 18 minutes | -86% |
| Incidents per month | 12.3 | 4.1 | -67% |
| Change failure rate | 28% | 7% | -75% |

### Magnitude Communication

- **14 hours/month** = every customer lost nearly a full business day of access each month.
- **0.78 hours/month** = a single coffee break. Customers barely notice.
- **94% reduction** = the equivalent of going from 170 hours of annual downtime to 9.4 hours. Our system now delivers 99.989% availability.

### The Inflection Point

The dramatic improvement began in month 6 when we deployed automated canary
analysis. Before canaries, 28% of deployments caused incidents. After canaries,
that number dropped to 7% within 8 weeks. Every improvement since then compounds
on that foundation.

### The Investment Case

The SRE team represents 4 FTE of engineering capacity. The incident reduction
has freed an estimated 6 FTE-months of engineering time that was previously
spent on firefighting (based on on-call hours and incident response time tracking).
The reliability investment has a net positive return even before accounting for
customer retention impact. [DOC — on-call time tracking dashboard]

### What the Data Does Not Show

- Customer satisfaction correlation is inferred but not directly measured. [ASSUMPTION]
- Revenue impact of downtime reduction is estimated based on industry benchmarks, not actual attribution. [INFERENCE]
- The 4.1 incidents/month baseline may decrease further, but the rate of improvement is slowing, suggesting diminishing returns from the current approach. [INFERENCE]

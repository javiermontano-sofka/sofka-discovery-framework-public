# Body of Knowledge: Technical Feasibility

## Core Concepts

### What This Skill Does
Fact-checking technical claims and multidimensional feasibility validation across architecture, performance, security, scalability, cost, timeline, and team capability.

### Feasibility Dimensions

| Dimension | Key Questions | Evidence Sources |
|-----------|--------------|-----------------|
| Architecture | Can the system be built with proposed patterns? | Code analysis, ADRs |
| Performance | Will it meet latency/throughput requirements? | Benchmarks, load tests |
| Security | Are security requirements achievable? | Threat models, audits |
| Scalability | Can it handle projected growth? | Capacity models |
| Cost | Is it within budget constraints? | Cloud pricing, FTE estimates |
| Timeline | Can it be delivered on schedule? | Velocity data, dependencies |
| Team | Does the team have required skills? | Skill matrix, hiring plan |

### Decision Framework

- Score each dimension 1-5 (1=not feasible, 5=highly feasible)
- Minimum viable: no dimension below 2
- Recommended: average ≥ 3.5 across all dimensions
- Any dimension at 1 = automatic "not feasible" flag

## References
- Follow evidence-based assessment principles
- Use [HECHO] for verifiable claims, [SUPUESTO] for assumptions

# Input Analysis — Sample Output

## Context

A product manager sent a one-paragraph Slack message requesting "an architecture
review of the checkout service because it's slow and keeps breaking."

## Output

### Raw Input

> "Can you do an architecture review of the checkout service? It's been slow
> lately and we keep getting incidents. We need to fix it before Black Friday."

### Error Detection

| Finding | Type | Severity |
|---------|------|----------|
| "Slow" is undefined — no baseline or target metrics provided | Ambiguity | High |
| "Keeps breaking" — no incident data referenced | Missing evidence | Medium |
| "Before Black Friday" — no specific date or milestone defined | Ambiguity | Medium |
| Scope unclear: checkout service only, or the entire purchase flow? | Ambiguity | High |

### Intent Amplification

| Lens | Interpretation |
|------|---------------|
| **Literal** | Review the checkout service architecture for performance and reliability issues. |
| **Contextual** | The checkout service is causing customer-facing incidents during high traffic. The team needs actionable improvements before a high-traffic event. |
| **Strategic** | The organization needs confidence that the checkout flow can handle seasonal peak load. This is likely a precursor to a capacity planning discussion and may surface broader architecture concerns beyond the checkout service itself. |

### Enriched Interpretation

| Requirement | Source | Confidence | Assumptions |
|-------------|--------|------------|-------------|
| Performance assessment of checkout service | Direct request | High | Checkout service is the bottleneck, not downstream dependencies |
| Reliability assessment with incident root cause analysis | Implied by "keeps breaking" | High | Incident data is available for analysis |
| Capacity planning for peak load (Black Friday) | Implied by deadline | Medium | Peak load projections are available or estimable |
| Dependency analysis of checkout-adjacent services | Amplified — strategic lens | Medium | Performance issues may originate upstream or downstream |

### Clarifying Questions (Priority Order)

1. **What are the current p50/p95/p99 latency numbers, and what is the target?** (Impact: Defines success criteria for the entire review)
2. **Can you share the last 5 incident reports for the checkout service?** (Impact: Focuses the reliability analysis on actual failure modes)
3. **What is the expected peak traffic for Black Friday vs current average?** (Impact: Determines whether this is an optimization or a redesign)
4. **Is the scope limited to the checkout service, or should we include payment processing and inventory reservation?** (Impact: Determines analysis boundary)

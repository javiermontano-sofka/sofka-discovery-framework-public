# Trade-Off Analyzer — Sample Output

## Context
An e-commerce platform (150K DAU, $2M ARR) needs to select a search solution. The team is evaluating Elasticsearch, Algolia, and Typesense. Current search is a SQL LIKE query with 800ms p95 latency.

## Output

### Decision Matrix: Search Solution Selection

**Scoring Scale**: 1 (Poor) — 5 (Excellent). Rubric defined per criterion below.

| Criterion | Weight | Elasticsearch | Algolia | Typesense |
|-----------|--------|:---:|:---:|:---:|
| Query latency at scale (<50ms p95) | 0.25 | 4 | 5 | 4 |
| Relevance tuning flexibility | 0.20 | 5 | 4 | 3 |
| Operational complexity (inverse) | 0.20 | 2 | 5 | 4 |
| Cost at 150K DAU + 500K products | 0.20 | 4 | 2 | 4 |
| Ecosystem & community support | 0.15 | 5 | 4 | 3 |
| **Weighted Total** | **1.00** | **3.85** | **3.90** | **3.60** |

### Scoring Rubric (abbreviated)
- **5**: Best-in-class, exceeds requirements with margin.
- **4**: Meets all requirements comfortably.
- **3**: Meets requirements with caveats or workarounds.
- **2**: Partially meets requirements; notable gaps.
- **1**: Fails to meet core requirements.

### Sensitivity Analysis

| Scenario | ES Score | Algolia Score | Typesense Score | Winner |
|----------|:---:|:---:|:---:|---------|
| Base case | 3.85 | 3.90 | 3.60 | Algolia |
| Latency weight +15% (0.29), Cost -15% (0.17) | 3.87 | 4.07 | 3.60 | Algolia |
| Cost weight +15% (0.23), Latency -15% (0.21) | 3.91 | 3.62 | 3.68 | **Elasticsearch** |
| Ops complexity +15% (0.23), Relevance -15% (0.17) | 3.67 | 4.02 | 3.68 | Algolia |

**Knife-Edge Finding**: Elasticsearch overtakes Algolia when cost weight increases by 15% — this is a sensitivity point. If the company's growth plan pushes beyond 300K DAU, the cost differential widens significantly and should trigger a re-evaluation.

### Reversibility Assessment
- **Elasticsearch**: Medium reversibility. Self-hosted; data indexing pipelines are custom but transferable. Estimated 4-week migration off.
- **Algolia**: Low reversibility. Proprietary relevance rules, analytics, and A/B testing features create switching costs. Estimated 6-week migration off.
- **Typesense**: High reversibility. Open-source, simpler API surface, less custom configuration to recreate.

### Recommendation

**Algolia** is recommended for the current scale and team composition (no dedicated search engineer). The operational simplicity advantage is decisive given the team's constraint.

**Revisit conditions**: If monthly cost exceeds $3,000/month (projected at ~250K DAU) or the team hires a dedicated search/relevance engineer, re-evaluate Elasticsearch, which offers superior relevance tuning at lower cost.

### Risk Mitigations for Chosen Option
1. Negotiate annual contract with Algolia for 20-30% discount to delay the cost crossover point.
2. Abstract the search interface behind a repository pattern to reduce switching costs.
3. Monitor cost-per-search monthly; set alert at $2,500/month threshold.

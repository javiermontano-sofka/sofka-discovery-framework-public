# Excellence Loop — Sample Output

## Context
Scoring a caching strategy recommendation document through the excellence loop.

## Output

### Iteration 1 — Initial Scoring

| # | Criterion | Score | Evidence |
|---|-----------|-------|----------|
| 1 | Completeness | 8/10 | Covers all cache layers, invalidation, and failover. Missing: cache warming strategy. |
| 2 | Accuracy | 9/10 | All claims verified against codebase and APM data. |
| 3 | Evidence Tags | 6/10 | Only 40% of claims are tagged. Multiple untagged assertions in the "Alternatives" section. |
| 4 | Structure | 8/10 | TL;DR + progressive disclosure applied. Good heading hierarchy. |
| 5 | Actionability | 7/10 | Clear recommendation and implementation steps. Missing: specific Jira ticket suggestions. |
| 6 | Clarity | 8/10 | Concise prose, no jargon without explanation. |
| 7 | Diagrams | 5/10 | Only one high-level diagram. Missing: sequence diagram for cache hit/miss flow. |
| 8 | Consistency | 7/10 | Consistent with output standards. Minor formatting inconsistency in tables. |
| 9 | Audience Fit | 8/10 | Appropriate for tech lead audience. Executive summary sufficient for CTO skip-level. |
| 10 | Next Steps | 7/10 | Ghost menu present with 4 actions. Could add evidence upgrade action. |

**Overall Score: 7.3/10** — **Verdict: ITERATE** (criteria 3 and 7 below threshold)

### Improvement Plan

| Priority | Criterion | Current | Target | Action |
|----------|-----------|---------|--------|--------|
| P0 | Diagrams (7) | 5/10 | 8/10 | Add sequence diagram for cache hit/miss flow and cache invalidation flow |
| P0 | Evidence Tags (3) | 6/10 | 8/10 | Tag all claims in Alternatives and Performance sections |
| P1 | Completeness (1) | 8/10 | 9/10 | Add cache warming strategy section |
| P1 | Next Steps (10) | 7/10 | 8/10 | Add `/jm:evidence-scan` to ghost menu |

### Iteration 2 — After Improvements

| # | Criterion | Score | Delta | Notes |
|---|-----------|-------|-------|-------|
| 1 | Completeness | 9/10 | +1 | Cache warming section added with pre-warm script example. |
| 2 | Accuracy | 9/10 | 0 | No change needed. |
| 3 | Evidence Tags | 8/10 | +2 | All claims now tagged. Distribution: 60% HECHO, 25% INFERENCIA, 15% SUPUESTO. |
| 4 | Structure | 8/10 | 0 | No change needed. |
| 5 | Actionability | 7/10 | 0 | Acceptable at threshold. |
| 6 | Clarity | 8/10 | 0 | No change needed. |
| 7 | Diagrams | 8/10 | +3 | Added sequence diagram (cache flow) and state diagram (cache entry lifecycle). |
| 8 | Consistency | 8/10 | +1 | Fixed table formatting inconsistencies. |
| 9 | Audience Fit | 8/10 | 0 | No change needed. |
| 10 | Next Steps | 8/10 | +1 | Ghost menu now includes 5 actions with evidence upgrade option. |

**Overall Score: 8.1/10** — **Verdict: PASS**

### Certification

```
EXCELLENCE CERTIFIED
Artifact: Caching Strategy Recommendation — Product Catalog Service
Final Score: 8.1/10 (all criteria >= 7/10)
Iterations: 2
Date: 2026-03-17
Certified by: Excellence Loop v1.0
```

# UX Writing — Sample Output

## Context

A 15-page architecture decision record has been flagged by the engineering team
as "too dense to use." Average sentence length: 34 words. No table of contents.
Headings like "Section 3.2.1" instead of descriptive titles.

## Output

### Readability Audit Results

| Metric | Current | Target | Status |
|--------|---------|--------|--------|
| Average sentence length | 34 words | <20 words | Needs improvement |
| Passive voice ratio | 41% | <15% | Needs improvement |
| Heading descriptiveness | 2/10 sections have descriptive headings | 10/10 | Needs improvement |
| Table of contents | Missing | Required | Needs improvement |
| Code example scanability | No syntax highlighting, no annotations | Highlighted + annotated | Needs improvement |

### Before/After: Section Heading

**Before**: "3.2.1 — Evaluation Criteria and Results"

**After**: "Why We Chose PostgreSQL Over MongoDB for the Analytics Workload"

### Before/After: Paragraph

**Before**:
> "The evaluation of the database technologies was conducted with respect to
> multiple criteria including query performance under various workload patterns
> that were representative of production traffic, the operational complexity
> associated with maintaining the infrastructure, and the total cost implications
> over the projected three-year operational window."

**After**:
> We evaluated databases on three criteria:
>
> - **Query performance** under production-like workloads
> - **Operational complexity** for the infrastructure team
> - **Three-year total cost** including licenses and maintenance
>
> PostgreSQL scored highest on all three. Details follow in the evaluation matrix.

### Information Hierarchy Restructure

```
BEFORE                          AFTER
1. Introduction                 TL;DR (one paragraph)
2. Background                   Decision: PostgreSQL for Analytics
3. Evaluation                     Why this matters
  3.1 Criteria                    What we evaluated
  3.2 Results                     How each option scored
    3.2.1 Performance             Our recommendation
    3.2.2 Operational           Detailed Evaluation
    3.2.3 Cost                    Performance benchmarks
4. Recommendation                 Operational comparison
5. Appendix                       Cost projection
                                Appendix: Raw benchmark data
```

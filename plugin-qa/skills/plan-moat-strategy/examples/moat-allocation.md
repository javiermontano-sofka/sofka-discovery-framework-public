# Example: MOAT Strategy Allocation

## Input

Plugin: `data-pipeline` with 6 skills

## Expected Output — MOAT Strategy

```markdown
## MOAT Allocation: data-pipeline

| Skill | Depth | References | Examples | Prompts | Rationale |
|-------|-------|------------|----------|---------|-----------|
| ingest-data | Deep | CSV spec, API format guide | 3 (clean, dirty, edge) | 1 (ingestion prompt) | Core skill, high variability |
| validate-csv | Deep | CSV RFC 4180, encoding guide | 3 (valid, invalid, edge) | 1 (validation prompt) | Quality gate, needs precision |
| transform-data | Medium | Transform pattern catalog | 2 (before/after) | 0 | Predictable operations |
| export-data | Medium | Output format spec | 2 (JSON, CSV export) | 0 | Well-defined output |
| schedule-job | Light | Cron syntax reference | 1 (cron example) | 0 | Simple wrapper |
| monitor-pipeline | Light | Metric name catalog | 1 (dashboard example) | 0 | Observability layer |

### Budget Summary
- Total reference files: 6
- Total example files: 12
- Total prompt files: 2
- Estimated effort: 3-4 hours

### Priority Order
1. validate-csv (quality gate — mistakes propagate downstream)
2. ingest-data (entry point — highest input variability)
3. transform-data, export-data (core pipeline)
4. schedule-job, monitor-pipeline (infrastructure)
```

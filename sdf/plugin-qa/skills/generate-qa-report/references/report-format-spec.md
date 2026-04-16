# QA Report Format Specification

> Standard format for PQA-generated QA reports.

## Required Sections

### Header

```markdown
# QA Report: {plugin-name}
**Date**: {YYYY-MM-DD}
**Plugin**: {absolute-path}
**Overall Grade**: {letter}
```

### Summary Line

```
{pass}/{total} checks passed | {critical} critical | {warning} warnings | {info} info
```

### Findings Table

```markdown
| # | Severity | Component | Description | Recommendation |
|---|----------|-----------|-------------|----------------|
```

- Sequential numbering
- Severity: CRITICAL, WARNING, or INFO
- Component: file path relative to plugin root
- Description: what is wrong (factual)
- Recommendation: how to fix it (actionable)

### Content Quality Scores (if audit-content-quality was run)

Table with per-skill scores across 6 dimensions.

### Recommendations

Numbered list, ordered by impact (CRITICAL fixes first).

## Naming Convention

- Report file: `qa-report.md` in the plugin root directory
- Scorecard file: `qa-scorecard.md` in the plugin root directory

## Evidence Tags

Every finding should be traceable:
- `[CODIGO]` — found in source code
- `[CONFIG]` — found in configuration files
- `[DOC]` — found in documentation
- `[INFERENCIA]` — derived from analysis
- `[SUPUESTO]` — assumption (needs verification)

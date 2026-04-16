# PQA Evidence Protocol

> Every finding must be tagged with its evidence source. No exceptions.

## Evidence Tags

| Tag | Meaning | When to Use |
|-----|---------|-------------|
| `[SPEC]` | Validated against official Claude Code plugin specification | Field presence, schema compliance, type-event matrix |
| `[SCANNED]` | Detected by reading actual files on disk | Missing files, broken references, frontmatter integrity |
| `[INFERRED]` | Derived from patterns but not directly confirmed | Naming inconsistencies, probable intent mismatches |
| `[ASSUMED]` | Not verified, stated as assumption | Capability gaps, performance estimates |

## Rules

1. Every finding in a QA report must carry exactly one evidence tag.
2. If >30% of findings are `[ASSUMED]`, add a warning banner to the report.
3. `[ASSUMED]` findings with severity `CRITICAL` must be flagged for manual verification.
4. Never present `[INFERRED]` as `[SPEC]` — the distinction matters.

## Finding Severity Classification

| Severity | Meaning | Example |
|----------|---------|---------|
| **CRITICAL** | Blocks plugin usage. Must fix before deployment. | Hook type:prompt on Stop event |
| **WARNING** | Degrades quality. Should fix. | Missing description in command frontmatter |
| **INFO** | Improvement opportunity. Nice to fix. | Inconsistent naming convention |

---
*PQA v3.0 — Evidence over assumption.*

---
name: diagnostic-engine
author: JM Labs (Javier Montaño)
description: >
  Root cause analysis, risk detection, technical debt quantification, and friction identification.
  Trigger: diagnose issue, find root cause, assess risk, quantify debt, detect friction.
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Diagnostic Engine

Systematic identification of root causes, risks, and friction points using evidence classification.

## Guiding Principle

> *Diagnose the disease, not the symptom. Every finding must carry its evidence level.*

## Procedure

### Step 1 — Evidence Classification

For every finding, assign exactly one tag:

| Tag | Rule | Example |
|-----|------|---------|
| `[HECHO]` | Directly observable in code, config, or docs | "Uses Express 4.18.2 [HECHO]" |
| `[INFERENCIA]` | Logically derived from facts — state the chain | "Likely no rate limiting given no middleware in routes [INFERENCIA: no rate-limit middleware found in middleware/ or routes/]" |
| `[SUPUESTO]` | Not verified — state what would confirm/deny | "Probably handles 1000 req/s [SUPUESTO: no load test results found]" |

### Step 2 — Friction Detection

Scan for each category systematically:

1. **Ambiguity** — Requirements unclear, edge cases undefined
2. **Technical Debt** — Shortcuts, TODOs, deprecated patterns, version lag
3. **Coupling** — Tight dependencies, god objects, circular references
4. **Security** — OWASP top 10, secrets exposure, auth gaps
5. **Testing Gaps** — Untested paths, missing edge cases, flaky indicators
6. **Maintainability** — Complex functions (>50 lines), magic numbers, undocumented decisions
7. **Observability** — Missing logging, no metrics, silent failures
8. **Performance** — N+1 queries, unbounded operations, missing caching
9. **Developer Experience** — Confusing naming, broken dev scripts, missing setup docs
10. **Deployment** — No rollback plan, missing feature flags, risky migrations

### Step 3 — Risk Scoring

| Severity | Criteria |
|----------|----------|
| **CRITICAL** | Production breakage, data loss, security breach |
| **HIGH** | Significant degradation, major bug, architectural violation |
| **MEDIUM** | Quality issue, maintenance burden, partial failure |
| **LOW** | Style, minor improvement, nice-to-have |

### Step 4 — Gap Analysis

Document what's missing:
- What information would change the diagnosis?
- What can be decided now vs what needs more data?
- What questions should be asked to stakeholders?

## Quality Criteria

- Zero untagged findings (every claim has `[HECHO]`, `[INFERENCIA]`, or `[SUPUESTO]`)
- Root causes identified, not just symptoms
- Risk scored by severity × likelihood
- Gaps explicitly declared

## Anti-Patterns

- Diagnosing without reading the code first
- Treating all debt as critical
- Confusing inference with fact
- Diagnosing based on framework reputation rather than actual code

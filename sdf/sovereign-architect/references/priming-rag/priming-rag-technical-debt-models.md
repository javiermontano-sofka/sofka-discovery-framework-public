# Technical Debt Models — RAG Priming Knowledge

> Sovereign Architect · JM Labs · Knowledge Base

---

## Overview

Technical debt is the accumulated cost of expedient decisions that create future rework. Unlike financial debt, technical debt compounds silently — each shortcut increases the cost of every subsequent change. This document covers classification frameworks, interest calculation models, inventory methods, remediation strategies, and code quality metrics that an architect uses when quantifying and addressing technical debt.

## Fowler's Debt Quadrants

Martin Fowler's 2x2 matrix classifies technical debt along two axes: whether the decision was deliberate or inadvertent, and whether it was reckless or prudent.

| | Reckless | Prudent |
|---|---------|---------|
| **Deliberate** | "We don't have time for design" — knowingly cutting corners | "We must ship now and deal with consequences" — conscious trade-off with plan to repay |
| **Inadvertent** | "What's layering?" — debt from ignorance | "Now we know how we should have done it" — learning-driven debt, discovered after the fact |

### Practical Implications

- **Reckless-Deliberate**: Most dangerous. Usually stems from pressure without architectural governance. Requires process changes, not just code fixes.
- **Prudent-Deliberate**: Acceptable IF documented and scheduled for repayment. This is the debt most teams should be managing.
- **Reckless-Inadvertent**: Signals skill gaps. Fix with training, code reviews, and pair programming.
- **Prudent-Inadvertent**: Inevitable in complex systems. The team learns and refactors. This is healthy engineering.

## Debt Categories

### Architecture Debt

Poor architectural decisions that constrain the entire system:
- Distributed monolith (microservices without independence)
- Missing domain boundaries (business logic scattered across layers)
- Wrong data store for the workload
- Tight coupling between services via shared databases
- Missing abstraction layers

**Interest**: Highest. Affects every feature, every team, every sprint.

### Code Debt

Implementation-level shortcuts:
- Duplicated logic (DRY violations)
- Overly complex functions (high cyclomatic complexity)
- Magic numbers and hardcoded values
- Missing error handling
- God classes / mega-functions
- Inconsistent naming conventions

**Interest**: Medium. Slows individual features and increases bug rate.

### Test Debt

Missing, broken, or low-quality tests:
- Low coverage in critical paths
- Flaky tests (pass/fail randomly)
- No integration tests (only unit tests or only E2E)
- Tests that test implementation, not behavior
- No performance tests

**Interest**: Compounds with each release. Bugs reach production, manual testing increases.

### Documentation Debt

Missing or outdated documentation:
- No architecture decision records (ADRs)
- Stale README
- Undocumented API contracts
- Missing onboarding guides
- No runbooks for incidents

**Interest**: Measured in onboarding time and incident resolution time.

### Infrastructure Debt

Operational shortcuts:
- Manual deployments
- No monitoring or alerting
- Hardcoded configuration
- Unpatched dependencies (CVE debt)
- No disaster recovery plan
- Missing infrastructure as code

**Interest**: Measured in deployment risk and incident frequency.

## Interest Calculation Models

### Qualitative Interest Model

Estimate interest as impact on velocity:

| Debt Item | Sprint Impact | Annual Cost (FTE) |
|-----------|--------------|-------------------|
| Missing integration tests | 2 hours/sprint debugging regressions | 0.15 FTE |
| Manual deployment process | 4 hours/sprint on releases | 0.3 FTE |
| Monolithic data layer | 3 hours/sprint working around shared DB | 0.2 FTE |
| Outdated dependencies | 1 hour/sprint + 40 hours/year emergency patches | 0.15 FTE |

### Quantitative Interest Model

Measure directly from engineering metrics:

| Metric | Healthy | Indebted |
|--------|---------|----------|
| Lead time (commit to deploy) | < 1 day | > 1 week |
| Deployment frequency | Daily | Monthly |
| Change failure rate | < 5% | > 15% |
| MTTR (mean time to recovery) | < 1 hour | > 1 day |
| Bug rate per release | < 2 | > 10 |
| Onboarding time | < 2 weeks | > 2 months |

### Cost of Delay Model

For each debt item, estimate:
1. **Current interest**: How much time is this costing per sprint?
2. **Compounding rate**: Is the cost increasing, stable, or decreasing?
3. **Remediation cost**: How much effort to fix?
4. **Payback period**: Remediation cost / interest per sprint

A debt item with 4 hours/sprint interest and 40 hours remediation cost pays back in 10 sprints. Items with short payback periods should be prioritized.

## Debt Inventory Classification

### Inventory Template

| ID | Category | Description | Severity | Interest/Sprint | Remediation Effort | Payback (Sprints) | Owner |
|----|----------|-------------|----------|----------------|-------------------|--------------------|-------|
| D-001 | Architecture | Shared DB between services | Critical | 6h | 120h (3 sprints) | 20 | backend-team |
| D-002 | Test | No integration tests for payment flow | High | 3h | 40h (1 sprint) | 13 | qa-team |
| D-003 | Code | Duplicated validation logic in 4 services | Medium | 1h | 16h | 16 | backend-team |
| D-004 | Infra | Manual deployment to staging | Medium | 4h | 24h | 6 | devops-team |

### Severity Levels

| Severity | Criteria | Action |
|----------|----------|--------|
| **Critical** | Blocks features, causes production incidents, security vulnerability | Fix in current sprint |
| **High** | Significantly slows development, increases bug rate | Schedule within 2 sprints |
| **Medium** | Noticeable friction, workarounds exist | Schedule within quarter |
| **Low** | Minor inconvenience, cosmetic | Opportunistic fix |

## Remediation Strategies

### The 20% Rule

Allocate 20% of sprint capacity to debt remediation. This is not a tax — it is an investment. Teams that ignore debt see velocity decline 5-10% per quarter until new features become nearly impossible.

### Boy Scout Rule

"Leave the campsite cleaner than you found it." Every PR that touches a file improves it slightly: rename a variable, add a missing test, extract a function. Requires no dedicated time — it is baked into daily work.

### Debt Sprints

Dedicate an entire sprint to debt remediation every 4-6 sprints. Works for large architectural debt that cannot be addressed incrementally. Requires stakeholder buy-in and clear metrics showing the return.

### Strangler Fig for Architecture Debt

Gradually replace the indebted component:
1. Identify the boundary of the debt
2. Build the replacement alongside the original
3. Route new traffic/features to the replacement
4. Migrate existing functionality incrementally
5. Decommission the original when empty

### Prioritization Matrix

Plot debt items on two axes:

```
High Interest ──────────────────── Low Interest
    │                                    │
    │  FIX NOW        FIX SOON          │  High
    │  (Critical ROI)  (Good ROI)        │  Effort
    │                                    │
    │  QUICK WINS     IGNORE / DEFER    │  Low
    │  (Best ROI)      (Low ROI)         │  Effort
```

**Quick Wins** (low effort, high interest) should be fixed first — they deliver the best return per hour invested.

## Code Quality Metrics

### Cyclomatic Complexity

Counts the number of independent execution paths through a function. Each `if`, `for`, `while`, `case`, `&&`, `||` adds a path.

| Score | Risk | Recommendation |
|-------|------|---------------|
| 1-10 | Low | Well-structured, easily testable |
| 11-20 | Medium | Consider refactoring |
| 21-50 | High | Refactor — hard to test and maintain |
| 50+ | Critical | Must refactor — untestable |

### Cognitive Complexity

Measures how hard code is to understand (introduced by SonarSource). Unlike cyclomatic complexity, it penalizes nested control flow more heavily. A function with 3 sequential `if` statements is simpler than 3 nested `if` statements, and cognitive complexity captures this.

| Score | Assessment |
|-------|-----------|
| 0-7 | Easy to understand |
| 8-15 | Moderate — review for simplification |
| 16-25 | Difficult — refactor recommended |
| 25+ | Very difficult — must refactor |

### Lines of Code (per function/file)

| Metric | Healthy | Warning | Critical |
|--------|---------|---------|----------|
| Function length | < 30 lines | 30-60 lines | > 60 lines |
| File length | < 300 lines | 300-500 lines | > 500 lines |
| Class methods | < 15 | 15-25 | > 25 |

### Coupling Metrics

| Metric | Description | Healthy |
|--------|-------------|---------|
| **Afferent coupling (Ca)** | How many modules depend on this one | Lower is more changeable |
| **Efferent coupling (Ce)** | How many modules this one depends on | Lower is more independent |
| **Instability (I)** | Ce / (Ca + Ce) — 0 is stable, 1 is unstable | Varies by role |

### Churn-Complexity Analysis

Cross-reference file change frequency (churn) with complexity:
- **High churn + High complexity** = Highest priority for refactoring (changed often, hard to change)
- **High churn + Low complexity** = Healthy (changed often, easy to change)
- **Low churn + High complexity** = Monitor (rarely changed, but risky when touched)
- **Low churn + Low complexity** = Ignore (stable, simple)

### Tools

| Tool | Language Support | Metrics |
|------|-----------------|---------|
| **SonarQube** | 30+ languages | Complexity, duplication, coverage, security |
| **CodeClimate** | JS, Ruby, Python, Go, etc. | Maintainability, duplication, complexity |
| **ESLint + complexity rules** | JavaScript/TypeScript | Cyclomatic complexity per function |
| **radon** | Python | Cyclomatic, cognitive, Halstead metrics |
| **NDepend** | .NET | Coupling, cohesion, complexity, dependency analysis |
| **ArchUnit** | Java | Architecture rule enforcement |

## SA's 10 Friction Categories

Sovereign Architect scans for debt using 10 friction categories (defined in `friction-categories.md`):

1. **Build Friction** — CI/CD slowness, flaky builds, manual steps
2. **Deploy Friction** — Manual deployments, environment drift
3. **Test Friction** — Low coverage, flaky tests, slow test suites
4. **Code Friction** — High complexity, duplication, inconsistency
5. **Architecture Friction** — Wrong boundaries, coupling, missing abstractions
6. **Data Friction** — Schema issues, migration pain, inconsistent models
7. **Security Friction** — Secrets management, auth gaps, CVE backlog
8. **Observability Friction** — Missing metrics, no alerting, blind spots
9. **Documentation Friction** — Stale docs, missing ADRs, no runbooks
10. **DX Friction** — Onboarding pain, tooling gaps, workflow inefficiency

Each friction category maps to specific debt items, specialists, and remediation patterns.

---

*Sovereign Architect — Debt is real. Measure it, manage it, or it manages you.*
*JM Labs · Javier Montano.*

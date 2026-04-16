# Quality Engineering — Sample Output

## Context
An engineering organization with 8 teams and 30+ services needs a unified quality gates framework and quality metrics dashboard.

## Output: Quality Gates Framework

| Stage | Gate | Criteria | Enforcement | Waiver Policy |
|-------|------|----------|-------------|--------------|
| Pre-commit | Lint | 0 errors, 0 warnings (configured rules) | Git hooks (husky) | None |
| PR | Unit Tests | 100% pass, >80% coverage on changed files | CI required check | None |
| PR | SAST Scan | 0 critical/high findings | CI required check | 48h waiver with Jira ticket |
| PR | Code Review | 1+ approval from code owner | Branch protection | None |
| Merge | Integration Tests | 100% pass | CI pipeline gate | Team lead override with reason |
| Staging | E2E Tests | 100% pass on smoke suite | Deployment gate | Release manager override |
| Staging | Performance | p99 <SLO, error rate <0.5% | Load test comparison | Architecture review |
| Production | Canary Health | Error rate <baseline+0.1% | Progressive delivery | None (auto-rollback) |

## Output: Quality Metrics Dashboard

### Team-Level View
| Metric | Category | Source | Target | Alert Threshold |
|--------|----------|--------|--------|----------------|
| Code Coverage | Leading | SonarQube | >80% | Drop >5% in 2 weeks |
| PR Cycle Time | Leading | GitHub API | <24 hours | >48 hours average |
| Test Flakiness Rate | Leading | CI analytics | <1% | >3% |
| Build Success Rate | Leading | CI analytics | >95% | <90% |
| Defect Density | Lagging | Jira | <2 per KLOC | >5 per KLOC |
| Escape Rate | Lagging | Jira (prod bugs / total bugs) | <5% | >10% |
| MTTR (Mean Time to Restore) | Lagging | Incident tracker | <1 hour | >4 hours |

### Quality Scorecard (per service)
```
Service: order-service
  Coverage:     82% (target: 80%)     ✅
  Flakiness:    0.5% (target: <1%)    ✅
  Escape Rate:  3% (target: <5%)      ✅
  Tech Debt:    2.1 days (target: <5d) ✅
  Vulnerability: 0 critical (target: 0) ✅
  Overall Score: 92/100               Grade: A
```

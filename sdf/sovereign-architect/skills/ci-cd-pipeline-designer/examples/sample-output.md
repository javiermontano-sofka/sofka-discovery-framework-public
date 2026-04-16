# CI/CD Pipeline Designer — Sample Output

## Context
A Python FastAPI microservice deployed to AWS EKS, using GitHub Actions, ECR for images, and Helm for Kubernetes deployments.

## Output

### Pipeline Architecture

```
Commit → Build → Test → Security → Artifact → Deploy-Staging → Smoke → Deploy-Prod
  │        │       │        │          │            │              │          │
  │        │       │        │          │            │              │          └─ Canary 10% → 50% → 100%
  │        │       │        │          │            │              └─ Automated smoke suite
  │        │       │        │          │            └─ Helm upgrade to staging namespace
  │        │       │        │          └─ Push image to ECR, tag with SHA + semver
  │        │       │        └─ Snyk, Semgrep, Gitleaks scan
  │        │       └─ Unit (pytest) + Integration (testcontainers) + Contract (Pact)
  │        └─ pip install, mypy, ruff lint
  └─ git push / PR merge
```

### Stage Details

| Stage | Duration | Parallelism | Gate Criteria | Failure Action |
|-------|----------|-------------|---------------|----------------|
| Build | 45s | Single | Zero lint/type errors | Block PR |
| Test | 2min | 3 runners | Coverage >= 85%, 0 failures | Block PR |
| Security | 1min | 2 runners | No critical/high CVEs | Block PR |
| Artifact | 30s | Single | Image builds, tag applied | Block merge |
| Deploy Staging | 1min | Single | Helm upgrade success | Alert team |
| Smoke Tests | 1min | Single | Health + critical path pass | Block prod |
| Deploy Prod | 5min | Canary phases | Error rate < 0.1% at each phase | Auto-rollback |

**Total Commit-to-Production: ~11 minutes** (non-blocked path).

### Caching Strategy
- **pip dependencies**: Cached by `requirements.txt` hash — saves ~30s.
- **Docker layers**: BuildKit cache exported to GitHub Actions cache — saves ~20s.
- **Test results**: Pytest cache for unchanged test files — saves ~15s.

### Quality Gates

```yaml
# .github/workflows/quality-gates.yml (excerpt)
quality-gates:
  coverage-threshold: 85
  mutation-score: 75
  max-critical-vulnerabilities: 0
  max-high-vulnerabilities: 0
  flaky-test-tolerance: 0
  deploy-approval-required: true  # production only
```

### Emergency Hotfix Path
1. Branch from `main`, prefix `hotfix/`.
2. Security scan runs but does not block (post-facto review required within 24h).
3. Single approver (tech lead or SRE) instead of standard 2-approver gate.
4. Deploy directly to production, skip staging (smoke tests still run).
5. Post-incident review required within 48h.

### Deployment Strategy (Production)
- **Phase 1**: Canary 10% traffic for 5 minutes. Monitor error rate and P99 latency.
- **Phase 2**: Promote to 50% for 5 minutes. Same monitoring.
- **Phase 3**: Promote to 100%. Automated rollback if error rate exceeds 0.1%.
- **Rollback**: `kubectl rollout undo deployment/api-service -n production`.

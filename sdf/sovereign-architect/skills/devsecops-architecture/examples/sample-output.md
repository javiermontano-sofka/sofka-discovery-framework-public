# DevSecOps Architecture — Sample Output

## Context
A Node.js application deployed via GitHub Actions to Kubernetes needs a security-integrated CI/CD pipeline with SLSA Level 2 compliance.

## Output: Secure Pipeline Design

```
PR Created
  ├── [SAST] Semgrep scan (custom + OWASP rules)
  │     Gate: 0 critical, 0 high
  ├── [SCA] Snyk dependency scan
  │     Gate: 0 critical; high = warn + Jira ticket
  ├── [Secrets] TruffleHog pre-commit + CI scan
  │     Gate: 0 findings (hard block)
  └── [Unit Tests] With coverage threshold

PR Merged to main
  ├── [Build] Docker multi-stage build (ephemeral runner)
  │     ├── Hermetic: deps from lockfile only
  │     ├── Base image: distroless (minimal attack surface)
  │     └── Build provenance generated (SLSA)
  ├── [Container Scan] Trivy image scan
  │     Gate: 0 critical/high CVEs in final image
  ├── [SBOM] Syft generates CycloneDX SBOM
  │     Stored in artifact registry alongside image
  ├── [Sign] Cosign keyless signing via Sigstore
  └── [Deploy to Staging]
        └── [DAST] OWASP ZAP baseline scan against staging
              Gate: 0 high-risk alerts

Promote to Production
  ├── [Verify Signature] Cosign verify before deploy
  ├── [Policy Check] OPA admission controller validates
  │     ├── Image signed? ✓
  │     ├── SBOM present? ✓
  │     ├── Scan results clean? ✓
  │     └── Build provenance valid? ✓
  └── [Deploy] ArgoCD GitOps deployment
```

## Output: SLSA Assessment

| SLSA Requirement | Current | Target (L2) | Gap | Action |
|-----------------|---------|-------------|-----|--------|
| Source versioned | Yes (Git) | Yes | None | -- |
| Build service | GitHub Actions | Hosted, ephemeral | None | -- |
| Build as code | Yes (workflow YAML) | Yes | None | -- |
| Build provenance | Not generated | Authenticated provenance | Gap | Add SLSA GitHub generator |
| Provenance non-falsifiable | N/A | Service-generated | Gap | Use reusable workflow for provenance |
| Dependencies declared | package-lock.json | Complete + verified | Partial | Add lockfile integrity check |
| Hermetic build | No (fetches at build time) | All deps cached | Gap | Pre-fetch to GitHub Packages |

## Output: Secrets Management Design

| Secret Type | Storage | Rotation | Access |
|-------------|---------|----------|--------|
| Database credentials | Vault dynamic secrets | Per-deployment (TTL: 1h) | Pod service account via Vault Agent |
| API keys (external) | Vault KV v2 | Quarterly + on compromise | CI/CD pipeline via OIDC auth |
| TLS certificates | cert-manager (Let's Encrypt) | Auto-renew at 30 days | Kubernetes secrets |
| Signing keys | Sigstore Fulcio | Ephemeral (keyless) | CI pipeline OIDC identity |
| Cloud credentials | IRSA / Workload Identity | N/A (federated) | Pod-level IAM role |

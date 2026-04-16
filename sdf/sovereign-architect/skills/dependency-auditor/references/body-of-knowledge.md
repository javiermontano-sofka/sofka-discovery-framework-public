# Dependency Auditor — Body of Knowledge

## Core Concepts
- **Transitive dependency risk**: Direct dependencies average 5-10 transitive deps each; a project with 50 direct deps may have 500+ packages in its tree `[HECHO]`
- **CVE lifecycle**: Vulnerability disclosure → advisory publication → patch release → adoption lag creates exposure windows
- **Semantic versioning contracts**: Major (breaking), minor (features), patch (fixes) — but not all maintainers follow semver faithfully `[INFERENCIA]`
- **License infection**: Copyleft licenses (GPL, AGPL) can propagate requirements to consuming software depending on linking model
- **Supply chain attacks**: Typosquatting, dependency confusion, and maintainer account compromise are active threat vectors
- **Phantom dependencies**: Packages used in code but not declared in manifests (resolved through hoisting or implicit peer deps)
- **Dependency freshness decay**: Average npm package falls 2 major versions behind within 18 months of installation `[INFERENCIA]`

## Patterns & Practices
- **Lock file enforcement**: Always commit lock files; use `--frozen-lockfile` in CI to prevent drift
- **Automated dependency updates**: Dependabot, Renovate, or Snyk for continuous freshness
- **License allow-listing**: Maintain an approved license list and fail CI on violations
- **Vulnerability SLA**: Critical CVEs patched within 48h, High within 1 week, Medium within 1 month
- **Dependency review gates**: PR checks that block merging of new dependencies without review

## Tools & Technologies
- **Vulnerability databases**: NVD (NIST), GitHub Advisory Database, OSV.dev, Snyk Vulnerability DB
- **Scanning tools**: npm audit, `pip-audit`, `cargo audit`, Snyk CLI, Trivy, Grype
- **License tools**: license-checker, FOSSA, Licensee, ScanCode
- **SBOM generation**: CycloneDX, SPDX, Syft

## References
- OWASP Dependency-Check Project
- NIST National Vulnerability Database (NVD)
- OpenSSF Scorecard — Security health metrics for open source
- SPDX License List — Standardized license identifiers

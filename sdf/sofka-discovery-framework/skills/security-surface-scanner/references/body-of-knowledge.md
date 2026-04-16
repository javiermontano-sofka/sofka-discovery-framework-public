# Security Surface Scanner — Body of Knowledge

## Core Concepts
- **OWASP Top 10 (2021)**: Broken Access Control, Cryptographic Failures, Injection, Insecure Design, Security Misconfiguration, Vulnerable Components, Auth Failures, Data Integrity Failures, Logging Failures, SSRF `[HECHO]`
- **Defense in depth**: Multiple security layers so that failure of one doesn't compromise the system
- **Principle of least privilege**: Every component should have only the minimum access required
- **Zero trust architecture**: Never trust, always verify; authenticate and authorize every request
- **CWE (Common Weakness Enumeration)**: Standardized taxonomy for software security weaknesses
- **CVSS scoring**: Common Vulnerability Scoring System for severity quantification
- **Supply chain security**: SLSA framework, SBOM generation, provenance verification

## Patterns & Practices
- **Input validation**: Allowlist validation at system boundaries; reject by default
- **Parameterized queries**: Use prepared statements for all database interactions; never concatenate user input
- **Secret management**: HashiCorp Vault, AWS Secrets Manager, environment variables (never hardcoded)
- **Security headers**: HSTS, CSP, X-Frame-Options, X-Content-Type-Options as standard
- **Dependency scanning**: Automated CVE checks on every PR and scheduled nightly scans
- **Penetration testing**: Regular third-party assessments complementing automated scanning

## Tools & Technologies
- **SAST**: Semgrep, CodeQL, SonarQube, Bandit (Python), Gosec (Go)
- **Secret scanning**: Gitleaks, TruffleHog, detect-secrets, GitHub secret scanning
- **DAST**: OWASP ZAP, Burp Suite, Nuclei
- **Dependency scanning**: Snyk, Trivy, Grype, npm audit

## References
- OWASP Top 10 — owasp.org/www-project-top-ten
- CWE/SANS Top 25 Most Dangerous Software Weaknesses
- NIST Cybersecurity Framework
- SLSA — Supply-chain Levels for Software Artifacts

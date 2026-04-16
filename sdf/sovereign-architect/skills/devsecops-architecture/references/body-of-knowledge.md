# DevSecOps Architecture — Body of Knowledge

## Core Concepts
- **Shift-Left Security**: Moving security practices earlier in the SDLC (design and code time) rather than only at deployment
- **SLSA (Supply-chain Levels for Software Artifacts)**: Framework for ensuring the integrity of software artifacts through the build process
- **SBOM (Software Bill of Materials)**: Machine-readable inventory of all components in a software artifact
- **SAST (Static Application Security Testing)**: Analyzing source code for security vulnerabilities without execution
- **DAST (Dynamic Application Security Testing)**: Testing running applications for vulnerabilities via external probing
- **SCA (Software Composition Analysis)**: Identifying known vulnerabilities in open-source dependencies
- **Secrets Management**: Secure storage, access control, and rotation of credentials, API keys, and certificates

## Patterns
- **Security Gates in CI/CD**: Automated policy checkpoints that block promotion on security criteria
- **Hermetic Builds**: Build environments with no network access to external resources (all deps pre-fetched)
- **Ephemeral Build Environments**: Disposable CI runners destroyed after each build for isolation
- **Dynamic Credentials**: Short-lived, auto-generated credentials from a vault per pipeline run
- **Policy as Code**: Security and compliance policies defined as code and enforced in pipelines (OPA, Sentinel)

## Tools & Frameworks
- **Snyk / Trivy / Grype**: Vulnerability scanning for code, containers, and IaC
- **SonarQube / Semgrep / CodeQL**: SAST engines for multiple languages
- **OWASP ZAP / Nuclei**: DAST scanning tools
- **HashiCorp Vault**: Secrets management with dynamic credentials
- **Sigstore / Cosign**: Keyless signing for container images and artifacts
- **Syft / Cyclone DX**: SBOM generation tools

## References
- SLSA Framework — https://slsa.dev/ (Supply chain security levels)
- OWASP DevSecOps Guideline — https://owasp.org/www-project-devsecops-guideline/
- NIST SP 800-218 — Secure Software Development Framework (SSDF)
- Google — *Binary Authorization for Borg* (2019) — Origin of SLSA concepts

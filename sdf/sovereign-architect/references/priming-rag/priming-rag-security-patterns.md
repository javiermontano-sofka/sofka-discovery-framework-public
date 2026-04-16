# Security Patterns — RAG Priming Knowledge

> Sovereign Architect · JM Labs · Knowledge Base

---

## Overview

Security is not a feature — it is a property of the entire system. A senior architect must embed security into architecture decisions, development workflows, deployment pipelines, and operational practices. This document covers the OWASP Top 10 mitigations, authentication and authorization protocols, secrets management, supply chain security, application security testing, and zero trust architecture for production systems.

## Core Patterns

### OWASP Top 10 Mitigations (2021)

**A01 Broken Access Control**: Enforce authorization at the server side for every request. Default deny — explicitly grant permissions. Disable directory listing. Rate limit API access. Use CORS restrictively. Test with automated access control matrix validation.

**A02 Cryptographic Failures**: Use TLS 1.3 for transit encryption. Encrypt sensitive data at rest (AES-256-GCM). Never store plaintext passwords — use bcrypt (cost factor 12+), scrypt, or Argon2id. Classify data sensitivity and encrypt accordingly. Rotate encryption keys on schedule.

**A03 Injection**: Parameterized queries for SQL (never string concatenation). Context-aware output encoding for XSS (HTML, JavaScript, URL, CSS contexts). Use allowlists for input validation. ORMs with parameterized queries reduce but do not eliminate injection risk — raw queries bypass ORM protection.

**A05 Security Misconfiguration**: Harden default configurations. Remove sample apps and documentation from production. Disable unnecessary HTTP methods. Security headers: Content-Security-Policy, X-Content-Type-Options, X-Frame-Options, Strict-Transport-Security, Referrer-Policy, Permissions-Policy. Automate configuration audits.

**A06 Vulnerable Components**: Track all dependencies with SBOMs. Automated dependency scanning (Dependabot, Renovate, Snyk). Pin dependency versions. Review transitive dependencies — most vulnerabilities are in indirect dependencies.

**A08 Software and Data Integrity Failures**: Verify artifact signatures. Use lock files (package-lock.json, go.sum, Cargo.lock). CI/CD pipeline integrity — sign commits, protect branch rules, require code review. Verify container image digests, not just tags.

### Authentication Protocols

**OAuth 2.0**: Authorization framework — delegates access without sharing credentials. Four grant types, but only two matter for modern apps: Authorization Code with PKCE (web/mobile) and Client Credentials (service-to-service). Always use PKCE — implicit flow is deprecated.

**OpenID Connect (OIDC)**: Identity layer on top of OAuth 2.0. Adds ID token (JWT) with user claims. Discovery endpoint (`.well-known/openid-configuration`) provides metadata. Standard claims: sub, email, name, groups.

**Token lifecycle**: Access token (5-15 min), refresh token (hours-days, rotated on use), ID token (verification only, not for API auth). Store tokens securely: httpOnly secure cookies (web), secure storage (mobile). Never in localStorage — vulnerable to XSS.

**Passkeys/WebAuthn**: Phishing-resistant, passwordless authentication using public key cryptography. Device-bound or synced credentials. Recommended as primary auth factor for consumer applications. Supported by all major platforms.

### Secrets Management

**Never in code**: No secrets in source code, environment files committed to Git, or container images. Use `.gitignore` for `.env` files. Pre-commit hooks (gitleaks, detect-secrets) to prevent accidental commits.

**Secret stores**: HashiCorp Vault (self-hosted, most flexible), AWS Secrets Manager / Parameter Store, GCP Secret Manager, Azure Key Vault. All provide versioning, rotation, access logging, and fine-grained IAM policies.

**Runtime injection**: Secrets injected at runtime via environment variables (12-factor), mounted volumes, or sidecar (Vault Agent). Kubernetes: External Secrets Operator syncs from cloud secret stores to Kubernetes secrets. Never bake secrets into container images.

**Rotation strategy**: Automate rotation for database credentials, API keys, and certificates. Dual-credential pattern: create new credential, update consumers, delete old credential. Zero-downtime rotation requires applications to handle credential refresh without restart.

### Supply Chain Security

**SBOM (Software Bill of Materials)**: Generate SBOMs in CycloneDX or SPDX format during CI. Tools: syft, trivy, cdxgen. SBOMs enable vulnerability tracking across all deployments.

**Dependency pinning**: Lock files for application dependencies. Pin base images by digest (not tag) in Dockerfiles. Pin CI action versions by commit SHA (not tag — tags are mutable).

**SLSA framework**: Supply-chain Levels for Software Artifacts. Level 1: documented build process. Level 2: hosted build, generated provenance. Level 3: hardened build platform, non-falsifiable provenance. Aim for Level 2 minimum.

**Artifact signing**: Sign container images with cosign (Sigstore). Verify signatures before deployment. Admission controllers (Kyverno, OPA Gatekeeper) enforce signature policies in Kubernetes.

### Application Security Testing

**SAST (Static Application Security Testing)**: Analyzes source code for vulnerabilities. Run in CI on every PR. Tools: Semgrep (fast, custom rules), SonarQube (broad language support), CodeQL (GitHub-native, deep analysis). Trade-off: high false-positive rate requires tuning.

**DAST (Dynamic Application Security Testing)**: Tests running applications for vulnerabilities. Run against staging environments. Tools: OWASP ZAP (free, automatable), Burp Suite (commercial, thorough). Finds runtime issues SAST cannot — misconfigurations, auth bypasses.

**SCA (Software Composition Analysis)**: Scans dependencies for known vulnerabilities. Tools: Snyk, Mend (WhiteSource), Grype, Trivy. Run in CI and monitor continuously — new CVEs affect existing dependencies.

**Container scanning**: Scan container images for OS-level and application-level vulnerabilities. Tools: Trivy, Grype, Snyk Container. Scan both in CI (before push) and in registry (continuous monitoring).

### Zero Trust Architecture

**Core principle**: Never trust, always verify. Every request is authenticated and authorized regardless of network location. No implicit trust based on network perimeter.

**Implementation pillars**: Strong identity (mutual TLS, SPIFFE/SPIRE for workload identity), micro-segmentation (network policies, service mesh), least privilege (RBAC/ABAC at every layer), continuous verification (re-authenticate on context change), encrypted everything (TLS for all communication, including internal).

**Service mesh**: Istio, Linkerd, or Cilium for automatic mTLS between services, traffic policies, and observability. Sidecar proxy (Envoy) or eBPF-based (Cilium) handles security at the infrastructure layer — application code is unmodified.

## Decision Framework

| Security Layer | Tools | Frequency |
|---------------|-------|-----------|
| Code scanning (SAST) | Semgrep, CodeQL | Every PR |
| Dependency scanning (SCA) | Snyk, Trivy | Every PR + daily |
| Container scanning | Trivy, Grype | Every build + daily |
| Dynamic testing (DAST) | ZAP, Burp | Weekly / pre-release |
| Secret detection | gitleaks, detect-secrets | Pre-commit + CI |
| Infrastructure audit | tfsec, checkov | Every IaC change |
| Penetration testing | Manual + automated | Quarterly |

## Anti-Patterns

- **Security as afterthought**: Bolting security onto a finished system. Security must be part of architecture decisions, not a post-development audit finding.
- **Rolling your own crypto**: Custom encryption, hashing, or token generation. Use established libraries and protocols. Custom auth systems are almost always vulnerable.
- **Overly permissive CORS**: `Access-Control-Allow-Origin: *` with credentials. Restrict origins to known domains. Wildcard CORS is acceptable only for truly public, read-only APIs.
- **Long-lived credentials**: API keys or tokens with no expiration. All credentials must have expiration and rotation policies. Service accounts included.

## Evidence Signals

- Security headers: inspect HTTP response headers. Missing CSP, HSTS, or X-Content-Type-Options indicates security misconfiguration.
- `.env` files in Git history (even if currently gitignored) — credential exposure risk.
- Dependency age: check `package-lock.json` / `go.sum` timestamps. Dependencies unchanged for 12+ months likely have unpatched vulnerabilities.
- Auth configuration: look for JWT validation (signature verification, expiration check, audience validation). Missing any one of these is a critical vulnerability.
- Infrastructure config: check for encryption-at-rest settings, VPC/network policy configuration, IAM policy scope.

---
*Sovereign Architect RAG Priming · JM Labs*

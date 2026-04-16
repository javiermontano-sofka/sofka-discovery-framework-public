# Security Architecture — Body of Knowledge

## Core Concepts
- **STRIDE**: Threat classification model — Spoofing, Tampering, Repudiation, Information Disclosure, Denial of Service, Elevation of Privilege
- **Zero Trust Architecture**: Never trust, always verify — authenticate and authorize every request regardless of network location
- **Defense in Depth**: Multiple overlapping security layers so that failure of one layer does not compromise the system
- **Principle of Least Privilege**: Grant only the minimum permissions required for a function to operate
- **OWASP Top 10**: Industry-standard awareness document for the most critical web application security risks
- **Supply Chain Security**: Securing the software build pipeline, dependencies, and artifact integrity (SLSA, SBOM)
- **Data Classification**: Categorizing data by sensitivity (public, internal, confidential, restricted) to apply appropriate controls

## Patterns
- **API Gateway Security**: Centralized authentication, rate limiting, and input validation at the edge
- **mTLS Everywhere**: Mutual TLS between all services for identity verification and encryption
- **Secrets Rotation**: Automated credential rotation with zero-downtime deployment
- **RBAC/ABAC/ReBAC**: Role-based, attribute-based, and relationship-based access control models
- **Security Headers**: CSP, HSTS, X-Frame-Options, X-Content-Type-Options for web applications

## Tools & Frameworks
- **HashiCorp Vault**: Secrets management, encryption as a service, dynamic credentials
- **Open Policy Agent (OPA)**: Policy-as-code engine for authorization decisions
- **Trivy / Snyk / Grype**: Container and dependency vulnerability scanning
- **OWASP ZAP / Burp Suite**: Dynamic application security testing (DAST)
- **Falco**: Runtime security monitoring for containers and Kubernetes

## References
- NIST SP 800-207 — *Zero Trust Architecture* (2020)
- Adam Shostack — *Threat Modeling: Designing for Security* (2014)
- OWASP Application Security Verification Standard (ASVS) v4.0
- CIS Benchmarks — Hardening guides for OS, cloud, and Kubernetes

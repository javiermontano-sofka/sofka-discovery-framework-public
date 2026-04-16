---
name: security-architecture
author: JM Labs (Javier Montaño)
description: >
  Threat modeling, zero trust design, identity architecture, encryption strategy, and
  compliance mapping for software systems. Trigger: "security architecture", "threat model",
  "zero trust", "identity", "encryption", "compliance", "OWASP".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Security Architecture

Design and evaluate the security posture of software systems: threat modeling, zero trust network architecture, identity and access management, encryption at rest/transit, and compliance mapping.

## Guiding Principle
> *"Security is not a feature — it is a property of the entire system. Every boundary is a trust decision, every data flow is an attack surface."*

## Procedure

### Step 1 — Threat Modeling
1. Identify system entry points, trust boundaries, and data flows (DFD Level 1)
2. Apply STRIDE per element: Spoofing, Tampering, Repudiation, Information Disclosure, DoS, Elevation of Privilege
3. Enumerate threats and score using DREAD or CVSS methodology
4. Map threats to existing mitigations and identify gaps
5. Produce a prioritized threat register with remediation recommendations

### Step 2 — Zero Trust Design
1. Identify all network boundaries and trust zones
2. Design micro-segmentation strategy: service-to-service, user-to-service
3. Define authentication at every boundary: mTLS, JWT validation, API keys
4. Implement least-privilege access for all service accounts and roles
5. Design continuous verification: device posture, user behavior analytics

### Step 3 — Identity & Access Architecture
1. Design identity provider topology: IdP selection, federation, SSO
2. Define authentication flows: OAuth 2.0 / OIDC for each client type
3. Design authorization model: RBAC, ABAC, or ReBAC based on requirements
4. Specify token strategy: lifetimes, refresh, revocation, scope management
5. Design privileged access management for infrastructure and admin operations

### Step 4 — Encryption & Compliance
1. Define encryption strategy: at rest (AES-256), in transit (TLS 1.3), in use (where applicable)
2. Design key management: KMS, rotation policies, separation of duties
3. Map security controls to compliance frameworks (SOC2, PCI-DSS, GDPR, HIPAA)
4. Identify compliance gaps and remediation requirements
5. Produce a compliance control matrix with evidence mapping

## Quality Criteria
- Threat model covers all trust boundaries with no unmitigated critical threats
- Zero trust enforced at network, application, and data layers
- All secrets managed via vault/KMS with automated rotation
- Compliance matrix maps every control to implementation evidence

## Anti-Patterns
- Perimeter-only security with implicit trust inside the network
- Hardcoded secrets or credentials in source code or configuration
- Over-privileged service accounts with broad wildcard permissions
- Compliance checkbox approach without actual security engineering

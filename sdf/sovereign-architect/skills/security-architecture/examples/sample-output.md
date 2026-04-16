# Security Architecture — Sample Output

## Context
A healthcare SaaS platform processing PHI (Protected Health Information) with 8 microservices, a React SPA, and a mobile app. HIPAA compliance is required.

## Output: STRIDE Threat Register (excerpt)

| # | Component | STRIDE | Threat | Severity | Mitigation | Status |
|---|-----------|--------|--------|----------|------------|--------|
| T1 | `auth-service` | Spoofing | Brute force on login endpoint | High | Rate limiting + account lockout | Partial — no lockout |
| T2 | `patient-api` | Info Disclosure | PHI returned in error messages | Critical | Sanitize error responses | Gap |
| T3 | `api-gateway` | DoS | No rate limiting on public endpoints | High | Implement per-IP rate limits | Gap |
| T4 | `file-upload` | Tampering | Malicious file upload (path traversal) | High | Validate file type + sanitize filename | Implemented |
| T5 | `message-queue` | Repudiation | No audit trail for PHI access events | Critical | Structured audit logging with immutable storage | Gap |
| T6 | `admin-portal` | Elevation | Broken access control on admin APIs | Critical | Enforce RBAC on every endpoint | Partial |

## Output: Zero Trust Architecture

```
Internet → WAF → API Gateway (authn + rate limit)
                    │
                    ├── auth-service (IdP integration, token issuance)
                    │     └── Vault (secrets, signing keys)
                    │
                    ├── patient-api (RBAC via OPA sidecar)
                    │     └── PostgreSQL (TDE + column-level encryption)
                    │
                    ├── file-service (mTLS + signed URLs)
                    │     └── S3 (SSE-KMS + bucket policy)
                    │
                    └── audit-service (append-only, immutable)
                          └── CloudWatch Logs (tamper-proof retention)

Trust Boundaries:
  [1] Internet ↔ API Gateway: TLS 1.3, JWT validation
  [2] Gateway ↔ Services: mTLS, OPA authorization
  [3] Services ↔ Databases: mTLS, IAM auth, encryption at rest
  [4] Services ↔ Services: mTLS, scoped service tokens
```

## Output: HIPAA Compliance Matrix (excerpt)

| HIPAA Control | Requirement | Implementation | Evidence |
|--------------|-------------|----------------|----------|
| 164.312(a)(1) | Access Control | RBAC via OPA + JWT scopes | Policy files, access logs |
| 164.312(a)(2)(iv) | Encryption at Rest | AES-256 via KMS | KMS key policy, DB config |
| 164.312(c)(1) | Integrity Controls | Immutable audit logs, checksums on PHI | Audit service config |
| 164.312(d) | Authentication | MFA for admin, OIDC for users | IdP configuration |
| 164.312(e)(1) | Transmission Security | TLS 1.3 everywhere, mTLS service-to-service | Certificate policies |

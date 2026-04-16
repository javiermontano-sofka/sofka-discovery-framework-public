# Auth Architecture — Sample Output

## Context
A fintech startup building a personal finance dashboard needs auth architecture. The system aggregates bank accounts via Plaid, displays transactions, and allows users to set budgets. Clients: React SPA, iOS app, and a scheduled data sync service.

## Output

### Authentication Architecture

**Identity Provider**: Auth0 (managed)
**Justification**: Managed service reduces security engineering burden for a small team; supports OIDC, social login, MFA, and passwordless out of the box.

### Authentication Flows

| Client | Flow | Token Storage | MFA |
|--------|------|--------------|-----|
| React SPA | Auth Code + PKCE via BFF | httpOnly secure cookie (session) | Optional (SMS/TOTP) |
| iOS App | Auth Code + PKCE | Secure Keychain | Biometric + TOTP fallback |
| Data Sync Service | Client Credentials | Environment variable (rotated monthly) | N/A |

### Token Strategy

| Token | Type | Lifetime | Audience |
|-------|------|----------|----------|
| Access Token | JWT (signed RS256) | 10 minutes | `api.budgetapp.com` |
| Refresh Token | Opaque | 7 days (absolute), rotating | Auth0 token endpoint |
| ID Token | JWT | 1 hour | SPA/Mobile client |

**Access Token Claims**:
```json
{
  "sub": "auth0|user123",
  "aud": "api.budgetapp.com",
  "iss": "https://budgetapp.auth0.com/",
  "scope": "read:accounts read:transactions write:budgets",
  "permissions": ["read:own_accounts", "write:own_budgets"],
  "exp": 1711234567,
  "iat": 1711233967
}
```

### Authorization Model (RBAC)

| Role | Permissions | Assigned To |
|------|------------|-------------|
| `user` | read:own_accounts, read:own_transactions, write:own_budgets, read:own_budgets | All authenticated users |
| `premium` | All `user` permissions + read:insights, export:data | Premium subscribers |
| `admin` | All permissions + read:any_user, manage:users, view:metrics | Internal operators |

### Authorization Flow

```
Client → API Gateway (Kong)
         ├── Validate JWT signature (RS256, Auth0 JWKS)
         ├── Check token expiry
         ├── Extract scopes and permissions
         ├── Coarse-grained check: does scope include required operation?
         └── Forward to service with user context headers

Service (Node.js)
         ├── Fine-grained check: does user own this resource?
         ├── OPA sidecar for complex policies (e.g., budget limit rules)
         └── Audit log: user_id, action, resource_id, result, timestamp
```

### Security Hardening

| Control | Implementation |
|---------|---------------|
| Token rotation | Refresh tokens rotate on every use; old token invalidated |
| CSRF protection | SameSite=Strict cookies + CSRF token in custom header |
| XSS prevention | CSP header restricting scripts to own domain + nonce |
| Brute force protection | Auth0 anomaly detection + rate limiting (10 failed attempts → 10min lockout) |
| Session management | 30-minute idle timeout, 24-hour absolute timeout |
| Security headers | HSTS (max-age=31536000), X-Frame-Options: DENY, X-Content-Type-Options: nosniff |

### Audit Trail

All auth events are published to a dedicated Kafka topic (`auth.events`) for immutable storage:

| Event Type | Logged Data | Retention |
|-----------|-------------|-----------|
| `user.login.success` | user_id, IP, device fingerprint, auth method | 2 years |
| `user.login.failed` | attempted_email, IP, failure reason | 2 years |
| `user.mfa.enrolled` | user_id, mfa_method | 2 years |
| `token.refreshed` | user_id, client_id, old_token_jti | 90 days |
| `permission.denied` | user_id, resource, action, policy_result | 2 years |

### Incident Response: Compromised Credentials
1. Auth0 Breached Password Detection alerts on known compromised passwords.
2. Forced password reset + all refresh tokens revoked for affected user.
3. Notification email sent to user within 1 hour.
4. Incident logged in security incident tracker with correlation ID.

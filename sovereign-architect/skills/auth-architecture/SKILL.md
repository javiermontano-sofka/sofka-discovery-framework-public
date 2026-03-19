---
name: auth-architecture
author: JM Labs (Javier Montaño)
description: >
  Designs authentication and authorization architectures using OAuth2, OIDC, RBAC, ABAC, and identity provider integration.
  Trigger: "auth architecture", "authentication design", "authorization patterns", "OAuth2", "OIDC", "identity provider".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Auth Architecture

Designs authentication (AuthN) and authorization (AuthZ) architectures selecting appropriate protocols, identity providers, access control models, and token strategies for secure, scalable systems.

## Guiding Principle

> *"Authentication answers 'who are you?' Authorization answers 'what can you do?' Never confuse the two."*

## Procedure

### Step 1 — Requirements Analysis
1. Identify user types: end users, service accounts, machine-to-machine, admin operators.
2. Map authentication methods needed: passwords, SSO, MFA, passwordless, API keys, certificates.
3. Determine authorization granularity: coarse (role-based) vs. fine (attribute/policy-based).
4. Inventory regulatory requirements: SOC 2, HIPAA, PCI-DSS, GDPR consent management.
5. Document the trust boundaries: which services are internal, external, third-party?

### Step 2 — Authentication Architecture
1. Select the identity provider strategy: managed (Auth0, Okta, Cognito) vs. self-hosted (Keycloak).
2. Define the authentication flows per client type:
   - Web apps: Authorization Code Flow with PKCE.
   - SPAs: Authorization Code Flow with PKCE (no implicit flow).
   - Mobile: Authorization Code Flow with PKCE + secure storage.
   - Machine-to-machine: Client Credentials Flow.
3. Design the token strategy: JWT access tokens, opaque refresh tokens, token lifetimes.
4. Specify MFA requirements per user type and sensitivity level.

### Step 3 — Authorization Architecture
1. Select the access control model:
   - **RBAC**: Role-Based Access Control for static permission hierarchies.
   - **ABAC**: Attribute-Based Access Control for dynamic, context-aware policies.
   - **ReBAC**: Relationship-Based Access Control for resource-ownership models (Zanzibar-style).
2. Design the permission model: roles, permissions, scopes, resource-level access.
3. Define the policy enforcement point (PEP) — where authorization checks happen in the request flow.
4. Specify the policy decision point (PDP) — centralized vs. distributed authorization evaluation.

### Step 4 — Security Hardening
1. Define token rotation and revocation strategy.
2. Specify session management: cookie security, session timeouts, concurrent session limits.
3. Design audit logging for all authentication and authorization events.
4. Plan for credential breach response: token revocation, forced password reset, notification.
5. Document the security headers: CSP, HSTS, X-Frame-Options, SameSite cookies.

## Quality Criteria
- No authentication flow uses the implicit grant (deprecated by OAuth 2.1).
- Access tokens have a lifetime < 15 minutes; refresh tokens are rotated on each use.
- Authorization checks happen at the API gateway AND the service level (defense in depth).
- All auth events are logged with correlation IDs for audit trail reconstruction.

## Anti-Patterns
- Storing JWTs in localStorage (XSS vulnerable) instead of httpOnly secure cookies.
- Using long-lived access tokens (>1 hour) without refresh token rotation.
- Implementing custom authentication protocols instead of using proven standards (OAuth2/OIDC).
- Checking permissions only at the UI layer without server-side enforcement ("UI-only authorization").

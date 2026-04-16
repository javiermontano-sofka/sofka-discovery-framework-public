# Auth & Identity Patterns — RAG Priming Knowledge

> Sovereign Architect · JM Labs · Knowledge Base

---

## Overview

Authentication (who are you?) and authorization (what can you do?) are the most security-critical architectural decisions in any system. Getting them wrong creates vulnerabilities that no amount of testing can compensate for. This document covers OAuth2 flows, OIDC, JWT mechanics, authorization models, and zero trust architecture.

## OAuth 2.0 Flows

OAuth2 is a delegation protocol — it lets a user grant limited access to their resources without sharing credentials.

### Authorization Code Flow (with PKCE)

The recommended flow for all client types (SPAs, mobile, server-side).

```
1. Client generates code_verifier + code_challenge (PKCE)
2. Client redirects user to authorization server with code_challenge
3. User authenticates and consents
4. Authorization server redirects back with authorization code
5. Client exchanges code + code_verifier for tokens
6. Authorization server validates and returns access_token + refresh_token
```

**When**: Any application where a user is present. Always use PKCE, even for server-side apps.

### Client Credentials Flow

Machine-to-machine authentication. No user involved.

```
1. Client sends client_id + client_secret to token endpoint
2. Authorization server validates and returns access_token
```

**When**: Backend services calling other backend services, cron jobs, batch processors.

### Device Authorization Flow

For devices with limited input capability (TVs, CLI tools, IoT).

```
1. Device requests device_code + user_code from authorization server
2. Device displays user_code and verification URL
3. User visits URL on another device, enters user_code, authenticates
4. Device polls token endpoint until user completes flow
```

### Implicit Flow (Deprecated)

Tokens returned directly in URL fragment. Vulnerable to token leakage via browser history and referrer headers. Replaced by Authorization Code + PKCE for all public clients.

### Token Types

| Token | Purpose | Lifetime | Storage |
|-------|---------|----------|---------|
| **Access Token** | Authorize API requests | Short (5-60 min) | Memory only |
| **Refresh Token** | Obtain new access tokens | Long (days-weeks) | Secure, httpOnly cookie or secure storage |
| **ID Token** | Identity claims (OIDC) | Short (matches access token) | Memory only |

## OpenID Connect (OIDC)

OIDC is an identity layer on top of OAuth2. It adds the ID Token (a JWT containing user identity claims) and standardized endpoints.

### Key Endpoints

| Endpoint | Purpose |
|----------|---------|
| `/.well-known/openid-configuration` | Discovery document with all endpoint URLs |
| `/authorize` | Start authentication flow |
| `/token` | Exchange code for tokens |
| `/userinfo` | Get user profile claims |
| `/jwks` | Public keys for token validation |
| `/logout` | End session |

### Standard Claims

| Claim | Description |
|-------|-------------|
| `sub` | Subject — unique user identifier |
| `iss` | Issuer — authorization server URL |
| `aud` | Audience — intended recipient (client_id) |
| `exp` | Expiration time |
| `iat` | Issued at time |
| `nonce` | Replay protection |
| `email` | User email |
| `name` | User display name |

## JWT Structure and Validation

A JWT has three Base64URL-encoded parts: header.payload.signature.

### Validation Checklist

Every JWT must be validated before trusting its claims:

1. **Decode** the header and verify `alg` is expected (never accept `none`)
2. **Verify signature** using the issuer's public key (from JWKS endpoint)
3. **Check `iss`** matches the expected authorization server
4. **Check `aud`** matches your application's client_id
5. **Check `exp`** — reject expired tokens
6. **Check `iat`** — reject tokens issued too far in the past
7. **Check `nbf`** (not before) if present
8. **Verify scopes/permissions** match the required access level

### Algorithm Selection

| Algorithm | Type | Recommendation |
|-----------|------|---------------|
| `RS256` | Asymmetric (RSA) | Default choice — issuer signs, anyone can verify |
| `ES256` | Asymmetric (ECDSA) | Better performance than RSA, smaller keys |
| `PS256` | Asymmetric (RSA-PSS) | More secure RSA variant |
| `HS256` | Symmetric (HMAC) | Only for trusted server-to-server; shared secret risk |
| `none` | No signature | NEVER accept — critical vulnerability |

### Common JWT Vulnerabilities

| Vulnerability | Description | Mitigation |
|--------------|-------------|-----------|
| **Algorithm confusion** | Attacker changes `alg` to `none` or `HS256` | Whitelist accepted algorithms server-side |
| **Key confusion** | Using RSA public key as HMAC secret | Enforce asymmetric algorithms |
| **Missing validation** | Not checking `iss`, `aud`, `exp` | Validate ALL standard claims |
| **Token in URL** | JWT in query parameters leaks via logs/referrer | Use Authorization header only |
| **Excessive claims** | Sensitive data in JWT payload | Keep JWTs lean; query userinfo for details |

## Authorization Models

### RBAC (Role-Based Access Control)

Users are assigned roles; roles have permissions. Simple, widely understood. Works well for systems with a fixed set of operations and clear role hierarchies.

```
User → Role → Permission
Alice → admin → [read, write, delete]
Bob → viewer → [read]
```

**Limitations**: Role explosion in complex systems. "Admin of department X but viewer of department Y" requires fine-grained roles or hybrid approaches.

### ABAC (Attribute-Based Access Control)

Authorization decisions based on attributes of the subject, resource, action, and environment. Flexible but complex to implement and audit.

```
ALLOW if:
  subject.department == resource.department AND
  subject.clearance >= resource.classification AND
  environment.time BETWEEN 09:00 AND 17:00
```

**When**: Complex, context-dependent authorization requirements. Government, healthcare, financial systems with regulatory constraints.

### ReBAC (Relationship-Based Access Control)

Authorization based on relationships between entities. Inspired by Google's Zanzibar paper. Models authorization as a graph.

```
document:readme#viewer@user:alice
document:readme#editor@group:engineering#member
folder:docs#viewer@document:readme#viewer
```

**When**: Collaborative systems (Google Docs-like), hierarchical resource structures, social networks. Implementations: SpiceDB, Ory Keto, Auth0 FGA.

### Comparison

| Factor | RBAC | ABAC | ReBAC |
|--------|------|------|-------|
| Simplicity | High | Low | Medium |
| Flexibility | Low | High | High |
| Auditability | High | Medium | High |
| Performance | Fast (role lookup) | Slower (policy evaluation) | Fast (graph traversal with cache) |
| Best for | Simple hierarchies | Context-dependent rules | Collaborative, hierarchical resources |

## Zero Trust Architecture

"Never trust, always verify." Every request is authenticated and authorized, regardless of network location.

### Principles

1. **Verify explicitly**: Authenticate and authorize every request based on all available data points (identity, location, device health, service, data classification)
2. **Least privilege access**: Limit access to just-in-time and just-enough-access (JIT/JEA)
3. **Assume breach**: Minimize blast radius through segmentation, encryption, and continuous verification

### Implementation Layers

| Layer | Zero Trust Control |
|-------|-------------------|
| **Identity** | Strong authentication (MFA), conditional access policies |
| **Device** | Device health verification, compliance checks |
| **Network** | Micro-segmentation, encrypted communication (mTLS) |
| **Application** | Per-request authorization, input validation |
| **Data** | Classification, encryption at rest and in transit |
| **Monitoring** | Continuous verification, anomaly detection |

### mTLS (Mutual TLS)

Both client and server present certificates. The server verifies the client's identity. Common in service mesh architectures (Istio, Linkerd). Eliminates network-based trust — a compromised network segment does not grant access.

## Session Management Patterns

| Pattern | Mechanism | Trade-off |
|---------|-----------|-----------|
| **Server-side sessions** | Session ID in cookie, state in server/Redis | Simple, revocable, but stateful |
| **JWT-based** | Stateless tokens, client holds state | Scalable, but hard to revoke |
| **BFF (Backend for Frontend)** | Server holds tokens, frontend gets session cookie | Best security for SPAs, more infrastructure |
| **Token rotation** | Short-lived access + refresh token rotation | Good balance of security and UX |

### BFF Pattern for SPAs

The recommended pattern for single-page applications:

```
Browser ←→ BFF (same domain, httpOnly cookies) ←→ API Gateway ←→ Services
```

The BFF stores tokens server-side and manages the OAuth flow. The browser never sees access tokens. CSRF protection via SameSite cookies + anti-CSRF tokens.

## Anti-Patterns

| Anti-Pattern | Risk | Fix |
|-------------|------|-----|
| **Storing JWT in localStorage** | XSS can steal tokens | Use httpOnly cookies or BFF |
| **Long-lived access tokens** | Extended attack window | Short access tokens (5-15 min) + refresh rotation |
| **Rolling your own auth** | Inevitably has vulnerabilities | Use proven identity providers |
| **Shared secrets across services** | Single compromise exposes all | Use asymmetric keys (RS256/ES256) |
| **Over-scoped tokens** | Violates least privilege | Request minimum scopes needed |
| **No token revocation** | Cannot respond to compromise | Token revocation list or short-lived tokens |

---

*Sovereign Architect — Authentication is the front door. Get it right.*
*JM Labs · Javier Montano.*

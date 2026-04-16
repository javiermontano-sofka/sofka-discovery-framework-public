# Auth Architecture — Body of Knowledge

## Core Concepts
- **OAuth 2.0**: Authorization framework that enables third-party applications to obtain limited access to HTTP services on behalf of a resource owner.
- **OpenID Connect (OIDC)**: Identity layer on top of OAuth 2.0 that provides authentication, returning an ID token with user claims.
- **JWT (JSON Web Token)**: A compact, URL-safe token format containing signed claims, used as access tokens and ID tokens.
- **PKCE (Proof Key for Code Exchange)**: Extension to the authorization code flow that prevents authorization code interception attacks.
- **RBAC (Role-Based Access Control)**: Users are assigned roles; roles are assigned permissions. Simple and effective for most applications.
- **ABAC (Attribute-Based Access Control)**: Authorization decisions based on attributes of the user, resource, action, and environment. Highly flexible.
- **ReBAC (Relationship-Based Access Control)**: Authorization based on the relationship between the user and the resource (e.g., Google Zanzibar model).
- **Zero Trust Architecture**: Never trust, always verify. Every request is authenticated and authorized regardless of network location.

## Patterns & Practices
- **Token Exchange (RFC 8693)**: Exchange one token type for another, enabling service-to-service delegation without sharing user credentials.
- **Backend for Frontend (BFF) Auth Pattern**: The BFF acts as a confidential client, handling token management and presenting session cookies to the SPA.
- **API Gateway as PEP**: Centralize coarse-grained authorization at the gateway; fine-grained checks at the service level.
- **Phantom Token Pattern**: Use opaque tokens externally (for privacy/revocation), convert to JWTs internally (for performance/claims).
- **Step-Up Authentication**: Require additional authentication factors for sensitive operations (e.g., MFA for fund transfers).
- **Federated Identity**: Integrate multiple identity providers via OIDC/SAML federation for enterprise SSO scenarios.

## Tools & Technologies
- **Auth0 / Okta**: Managed identity platforms with OAuth2/OIDC, MFA, passwordless, and social login support.
- **Keycloak**: Open-source identity and access management with SSO, user federation, and admin console.
- **AWS Cognito**: Managed user pools and identity pools with AWS integration and custom auth flows.
- **Open Policy Agent (OPA)**: General-purpose policy engine for fine-grained authorization using Rego language.
- **SpiceDB / Authzed**: Open-source implementation of Google's Zanzibar authorization system for ReBAC.
- **Cerbos**: Open-source authorization layer with policy-as-code, supporting RBAC and ABAC.

## References
- Hardt, D., "The OAuth 2.0 Authorization Framework" (RFC 6749).
- OAuth 2.1 Draft — https://oauth.net/2.1/
- Google Zanzibar Paper — "Zanzibar: Google's Consistent, Global Authorization System" (USENIX ATC 2019).
- NIST SP 800-207 — "Zero Trust Architecture" (2020).

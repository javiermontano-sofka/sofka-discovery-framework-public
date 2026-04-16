# Auth Architecture — Use Case Prompts

## Prompt 1: Multi-Tenant B2B SaaS Auth
> Design the authentication and authorization architecture for a multi-tenant B2B SaaS platform. Requirements: enterprise SSO via SAML/OIDC for each tenant, tenant-scoped RBAC (Admin, Editor, Viewer roles), API key authentication for integrations, MFA enforcement configurable per tenant, and machine-to-machine auth for microservice communication. The platform uses React SPA + Node.js API. Select the identity provider and design the token strategy.

## Prompt 2: Healthcare Platform with HIPAA Compliance
> Design the auth architecture for a healthcare platform handling PHI (Protected Health Information). Requirements: HIPAA-compliant audit logging, role-based access with clinical roles (Doctor, Nurse, Admin, Patient), break-glass emergency access for providers, consent-based data sharing between patients and providers, session timeout of 15 minutes for clinical workstations, and step-up authentication for accessing sensitive records. Define the authorization model and audit trail design.

## Prompt 3: API Platform with Third-Party Developer Access
> Design the auth architecture for a public API platform that serves both internal applications and third-party developers. Requirements: OAuth2 authorization server for third-party apps, API key management with rate limiting per key, scoped access (read-only, read-write, admin), developer portal with self-service app registration, webhook signature verification, and the ability to revoke a compromised third-party application's access immediately.

---
description: "API surface mapping — endpoints, contracts, authentication, versioning"
user-invocable: true
---

# SOVEREIGN ARCHITECT · MAP-API · NL-HP v1.0

## ROLE

Sovereign Software Architect Apex — API Specialist mapping the API surface area.

## OBJECTIVE

Map the API surface for: `$ARGUMENTS` (or the current repository if no arguments provided).

## PROTOCOL

### Step 1 — Endpoint Discovery

1. **Route definitions**: All HTTP endpoints, WebSocket handlers, GraphQL resolvers
2. **HTTP methods**: GET, POST, PUT, PATCH, DELETE per endpoint
3. **URL patterns**: RESTful conventions, naming consistency, versioning scheme
4. **Middleware**: Auth, validation, rate limiting, CORS, logging per route

### Step 2 — Contract Analysis

1. **Request schemas**: Parameters, headers, body schemas, content types
2. **Response schemas**: Status codes, response bodies, error formats
3. **Validation**: Where and how inputs are validated
4. **Documentation**: OpenAPI/Swagger specs, GraphQL schema, inline docs

### Step 3 — Authentication & Authorization

1. **Auth mechanism**: API keys, JWT, OAuth2, session-based
2. **Auth middleware**: Which endpoints are protected?
3. **Authorization model**: Roles, permissions, resource-level access
4. **Public endpoints**: Which endpoints require no authentication?

### Step 4 — API Quality Assessment

1. **Consistency**: Naming conventions, error formats, pagination patterns
2. **Versioning**: How is API versioning handled?
3. **Rate limiting**: Protection against abuse?
4. **Error handling**: Consistent error responses? Helpful error messages?
5. **Performance**: Pagination, filtering, field selection, caching headers

## OUTPUT FORMAT

```markdown
# API Surface Map: {System/Project Name}

## API Overview
| Metric | Value |
|--------|-------|
| Total Endpoints | {n} |
| Auth Mechanism | {type} |
| Versioning | {strategy} |
| Documentation | {OpenAPI/None/Partial} |

## Endpoint Inventory
| Method | Path | Auth | Description |
|--------|------|------|-------------|

## Authentication Flow
```mermaid
sequenceDiagram
    {auth flow}
```

## API Quality
| Criterion | Status | Finding |
|-----------|--------|---------|

## Recommendations
{Improvements for API quality, consistency, security}

## Evidence Tags
{Summary of [HECHO] vs [INFERENCIA] vs [SUPUESTO]}
```

## CONSTRAINTS

- NEVER invent endpoints, parameters, or response schemas
- NEVER present inferences as confirmed API contracts
- Tag findings: `[HECHO]`, `[INFERENCIA]`, `[SUPUESTO]`
- API mapping is based on code analysis — runtime behavior may differ

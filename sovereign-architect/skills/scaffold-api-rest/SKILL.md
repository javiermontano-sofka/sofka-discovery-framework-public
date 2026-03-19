---
name: scaffold-api-rest
author: "Javier Montaño (JM Labs)"
description: >
  Generate REST API with Express/Fastify, OpenAPI spec, validation, tests. Use when user asks to "scaffold a REST API".
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
  - Agent
---

# Scaffold REST API

Generate production-ready REST API with TypeScript, OpenAPI 3.1, Zod validation, JWT auth, database integration, and comprehensive testing.

## Guiding Principle

> *"API-first design produces better contracts and happier consumers. Write the OpenAPI spec before the handler. The spec is the source of truth — the implementation is the proof."*

---

## Procedure

### Step 1 — API Design Before Code

1. Ask: What are the primary resources this API exposes? (e.g., users, products, orders).
2. Ask: What authentication mechanism? (JWT Bearer, API Key, OAuth2 client credentials, none).
3. Ask: Expected throughput? (Determines Fastify vs Express: <1000 req/s → Express; high-performance → Fastify).
4. Ask: Database? (PostgreSQL via Drizzle/Prisma, MongoDB, SQLite for development).
5. Ask: Will this API be consumed by a frontend SPA, mobile app, or other services?
6. Design resource endpoints on paper first: `GET /users`, `POST /users`, `GET /users/:id`, etc. Document as OpenAPI YAML before writing a single handler.

### Step 2 — Project Structure and Framework Setup

1. Choose framework: Fastify 4 (default for high performance + built-in OpenAPI via `@fastify/swagger`) or Express 5 + `express-openapi-validator`.
2. Initialize TypeScript project with `strict: true`, `moduleResolution: Bundler`, `target: ES2022`.
3. Create folder structure: `src/routes/`, `src/handlers/`, `src/services/`, `src/db/`, `src/schemas/`, `src/middleware/`, `src/types/`.
4. Set up environment validation: `src/config.ts` with Zod schema for all env variables. Fail fast on startup if missing.
5. Configure `tsup` (or `tsc`) for compilation. Configure `tsx` or `ts-node` for development with `--watch`.
6. Set up ESLint with `@typescript-eslint/strict`, `no-console` warning, `@typescript-eslint/no-floating-promises` as error.

### Step 3 — OpenAPI Spec First, Then Implementation

1. Write `openapi.yaml` (or use code-first via `@fastify/swagger`): define all paths, request bodies, response schemas, security schemes.
2. Generate TypeScript types from OpenAPI spec using `openapi-typescript` — these become the canonical types for handlers and tests.
3. Implement request/response validation using Zod schemas that mirror the OpenAPI spec. Never validate in the handler body — use middleware.
4. Write each route handler: validate input → call service layer → return typed response. Handlers contain zero business logic.
5. Service layer: all business logic, database queries, external API calls. Services are injected as dependencies.
6. Implement global error handler middleware: maps known error types to HTTP status codes, never leaks stack traces in production.

### Step 4 — Auth, Security, and Observability

1. Implement JWT authentication middleware: verify `Authorization: Bearer <token>`, attach `req.user` to request context.
2. Implement rate limiting: `@fastify/rate-limit` (Fastify) or `express-rate-limit` (Express). Default: 100 req/min per IP.
3. Add security headers: `helmet` for Express; `@fastify/helmet` for Fastify. Set CSP, HSTS, `X-Frame-Options`.
4. Implement structured logging: `pino` for Fastify (built-in), or `pino` with `pino-http` for Express. Never `console.log`.
5. Add health check endpoint: `GET /health` returns `{ status: 'ok', uptime: number, version: string }`. No auth required.
6. Add request ID middleware: generate UUID per request, attach to response headers and logs for traceability.

### Step 5 — Testing and CI/CD

1. Unit test services: mock database calls, test business logic in isolation. Use Vitest.
2. Integration test routes: use `supertest` (Express) or Fastify's `inject()` method. Test real route handlers with mocked services.
3. Contract test with OpenAPI: use `openapi-backend` or `prism` to validate responses against the OpenAPI spec.
4. Write at least one test per endpoint: happy path, validation error (400), auth failure (401), not found (404).
5. Configure CI: install → type-check → lint → test with coverage → build → Docker build.
6. Write `Dockerfile` multi-stage: build TypeScript → copy only `dist/` + `node_modules` (production only) to runner stage.

---

## Decision Framework

| Decision | Default | Alternative | When to Switch |
|----------|---------|-------------|----------------|
| Framework | Fastify 4 | Express 5 | Team knows Express; existing Express codebase |
| Validation | Zod | Joi, yup | Legacy Joi codebase |
| ORM | Drizzle ORM | Prisma | Team prefers Prisma's DX |
| Auth | JWT (jsonwebtoken) | Paseto | Stronger security guarantees needed |
| Logging | pino | winston | Winston already in use; rich plugin ecosystem |
| Testing | Vitest + supertest | Jest + supertest | Jest already in project |
| API spec | OpenAPI 3.1 YAML | Swagger 2.0 | Legacy clients require Swagger 2.0 |
| Rate limiting | @fastify/rate-limit | Redis-backed rate limit | Multi-instance deployment |
| Documentation | Scalar UI | Swagger UI | Team prefers Swagger UI |
| Process manager | PM2 (prod) | systemd | Linux systemd deployment |

---

## Quality Criteria

1. `npm run build` exits 0 with zero TypeScript errors.
2. All endpoints documented in OpenAPI spec — no undocumented routes.
3. All request bodies validated with Zod before reaching handler logic.
4. Global error handler catches all unhandled errors — no 500 responses with stack traces.
5. `GET /health` returns 200 with no authentication required.
6. All endpoints return consistent error shape: `{ error: string, code: string, details?: object }`.
7. Test coverage ≥ 80% for service layer, integration tests cover all routes.
8. No secrets in source code — all from validated env variables.

---

## Anti-Patterns

1. **Not generating OpenAPI spec alongside implementation** — The spec becomes stale immediately. Generate it code-first (via `@fastify/swagger`) or spec-first (via `openapi-typescript`) so it's always in sync.
2. **Validation in handler body** — Leads to duplicated validation logic and inconsistent error responses. Validate at the route level with Zod schema + middleware.
3. **No error handling middleware** — Unhandled errors expose stack traces in responses (security risk) and break the error response contract.
4. **Business logic in route handlers** — Handlers should be thin: validate → call service → return. If the handler is >30 lines, the service layer is missing.
5. **Not rate limiting public endpoints** — Any endpoint reachable without authentication is subject to abuse. Default to rate limiting all endpoints, relax only with documentation.

---

## When NOT to Use

- **When GraphQL is more appropriate** → Complex nested queries where clients specify their data shape (use `scaffold-api-graphql`).
- **When the API is internal only between services** → Consider tRPC (TypeScript-first RPC with no HTTP overhead) or gRPC.
- **When building a BFF for a single frontend** → Next.js Server Actions or tRPC provide better type safety with less ceremony.
- **When the API only needs CRUD on a Postgres schema** → Consider PostgREST or Supabase auto-generated REST layer to avoid boilerplate.

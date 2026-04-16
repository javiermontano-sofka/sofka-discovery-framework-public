# Use-Case Prompts — Scaffold REST API

## Scenario 1: Product Catalog API with JWT Auth

**Context**: E-commerce startup. Needs REST API for product catalog. 2 backend developers, TypeScript experience. PostgreSQL already provisioned on Neon. Frontend is a React SPA.

**Prompt**:
```
Scaffold a Fastify 4 REST API for an e-commerce product catalog with:
- Resources: products (id, name, description, price, stock, categoryId), categories (id, name)
- JWT auth (Bearer token) — login endpoint returns token
- Role-based access: read operations public, write operations require 'admin' role
- Zod validation on all request bodies and path params
- Drizzle ORM + Neon PostgreSQL
- Rate limiting: 200/min global, 5/min for login endpoint
- OpenAPI 3.1 spec generated from code via @fastify/swagger
- Scalar UI for API documentation at /docs
- Health check at GET /health
- Vitest integration tests using Fastify inject()
- Multi-stage Dockerfile

Deliver: full scaffold with schema, routes, handlers, services, config, and at least 3 integration tests per resource.
```

---

## Scenario 2: API Security Audit

**Context**: Existing Express API. No input validation on POST routes. JWT secret is 8 characters. CORS is `*`. No rate limiting. Error handler sends full `error.stack` to client.

**Prompt**:
```
Audit this Express REST API for security vulnerabilities:

Issues found in initial review:
1. POST /users uses req.body directly without any validation
2. JWT_SECRET is set to 'secret' in config.js
3. CORS is configured as cors({ origin: '*', credentials: true })
4. Error handler: res.json({ error: err.message, stack: err.stack })
5. No rate limiting on POST /auth/login
6. GET /users/:id does not check if the authenticated user owns the resource

For each issue:
- Assign severity: CRITICAL / HIGH / MEDIUM / LOW
- Explain the attack vector (what an attacker can do)
- Provide the exact fix with corrected code

Also check for any additional security issues not listed above.
```

---

## Scenario 3: Express to Fastify Migration

**Context**: Express 4 API, 15 routes, class-based controllers, Joi validation, Mongoose for MongoDB. Team wants to migrate to Fastify + Zod + Drizzle + PostgreSQL. Need migration plan that doesn't disrupt the running API.

**Prompt**:
```
Plan migration from an Express 4 API to Fastify 4 with these changes:
- Express 4 → Fastify 4
- Joi validation → Zod
- Mongoose + MongoDB → Drizzle ORM + PostgreSQL
- Class-based controllers → Function-based handlers
- Custom middleware pattern → Fastify plugins/hooks

Current API has 15 routes across 3 resource groups: users, products, orders.

Migration requirements:
- Zero downtime (run both simultaneously behind a load balancer)
- Maintain API contract (same URLs, same request/response shapes)
- Migrate resource by resource, not all at once

Deliver:
1. Migration order and rationale
2. Mongoose schema → Drizzle schema conversion for User model
3. Joi schema → Zod schema conversion patterns
4. Express middleware → Fastify plugin pattern
5. Feature flag setup to route traffic to old vs new handlers
```

---

## Scenario 4: High-Throughput Background Job API

**Context**: Webhook processor for a SaaS. Receives ~5000 webhooks/hour from Stripe, GitHub, and Slack. Each webhook triggers async processing. Needs idempotency (duplicate webhooks are common).

**Prompt**:
```
Scaffold a Fastify webhook processor API with:
- POST /webhooks/stripe — Stripe-sig header verification
- POST /webhooks/github — x-hub-signature-256 verification
- POST /webhooks/slack — Slack signing secret verification
- Idempotency: check event_id in Redis before processing, skip if seen
- Async processing via BullMQ + Redis queue (webhook handler returns 200 immediately)
- DLQ (dead letter queue): failed jobs after 3 retries go to stripe-failed queue
- Webhook log in PostgreSQL: event_id, source, payload, status, processed_at
- No JWT auth on webhook endpoints (they use provider signatures instead)
- Rate limit: 1000/min per IP

Generate:
1. Fastify app with webhook routes
2. Stripe signature verification middleware
3. BullMQ processor for each queue
4. Idempotency check pattern
5. Integration test that sends a Stripe webhook with valid signature
```

---

## Scenario 5: OpenAPI-First API Design

**Context**: 3-person team. Frontend and backend working simultaneously. Need to define the contract before implementing so frontend can start with mocked data (via Prism).

**Prompt**:
```
Write an OpenAPI 3.1 spec for a task management API before writing any code.

Resources:
- tasks (id, title, description, status: todo|in_progress|done, assigneeId, dueDate)
- users (id, name, email)
- projects (id, name, ownerId)

Requirements:
- JWT Bearer auth (all write endpoints, GET /users/me)
- Pagination on all list endpoints (page, limit, total in response)
- Filtering on GET /tasks: ?status=, ?assigneeId=, ?projectId=
- Consistent error response: { error, code, details? }
- OpenAPI 3.1 format with $ref for all schemas

After the spec:
1. Generate openapi-typescript command
2. Show how to import generated types in a handler
3. Show Prism CLI command to start a mock server for frontend development
```

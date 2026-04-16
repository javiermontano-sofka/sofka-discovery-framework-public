# State of the Art — Scaffold REST API (2025-2026)

## Latest Versions

| Tool | Version | Key Change |
|------|---------|-----------|
| Fastify | 4.26 | Stable, TypeScript-first, built-in OpenAPI |
| Express | 5.0 | Path-to-regexp breaking changes, async error handling |
| Hono | 4.5 | Edge-native, minimal, Zod OpenAPI integration |
| Zod | 3.23 | v4 in development: faster, better error messages |
| Drizzle ORM | 0.30 | Drizzle Studio, improved relations API |
| Prisma | 5.18 | Accelerate connection pooling |
| pino | 9.2 | Redaction improvements, async drain |
| openapi-typescript | 7.0 | Generates TypeScript from OpenAPI 3.1 |

---

## Emerging Patterns (2025)

### Hono for Edge-Native APIs
Hono is a minimal, ultra-fast TypeScript web framework that runs on Cloudflare Workers, Deno Deploy, Bun, Node.js, and AWS Lambda without modification. For teams deploying to edge runtimes, Hono is displacing Express and Fastify. Key features: built-in RPC client, Zod OpenAPI middleware, 5x smaller bundle than Express.

### OpenAPI-First with Code Generation
The spec-first workflow is gaining momentum: write `openapi.yaml` → generate TypeScript types via `openapi-typescript` → generate client SDKs via `hey-api/openapi-ts`. This eliminates frontend/backend type drift. The generated types become the contract.

### Effect-ts for Type-Safe Error Handling
Teams with complex business logic are adopting `effect` (Effect-ts) for typed errors, dependency injection, and concurrent operations. A `getUserById` function returns `Effect<User, NotFoundError | DatabaseError>` — callers must handle both error cases at compile time.

### Bun as Runtime
Bun's HTTP server (`Bun.serve`) is 4-5x faster than Node.js for simple JSON APIs. For new projects without Node.js runtime constraints, Bun is a viable alternative. Compatibility with most Node.js packages is ~95% in 2025.

---

## Community Trends

- **Fastify over Express for new projects** — Express 5 finally released but Fastify is ~2x faster and TypeScript-native. Express remains dominant for legacy, Fastify for new.
- **Zod as the standard** — Zod has won the validation library market for TypeScript projects. Joi/Yup usage in new projects declining significantly.
- **tRPC for internal APIs** — When both client and server are TypeScript, tRPC eliminates the HTTP/REST abstraction entirely. Adoption growing for BFF patterns.
- **Drizzle over Prisma for Postgres** — Drizzle writes actual SQL, Prisma abstracts it. Teams reporting fewer N+1 surprises with Drizzle. Both are good choices.
- **OpenAPI 3.1 adoption** — OpenAPI 3.1 aligns with JSON Schema 2020-12, which simplifies schema reuse. Swagger 2.0 generation is declining.
- **Dead letter queues for async operations** — Background jobs (email, Stripe webhooks, PDF generation) moving from synchronous HTTP handlers to queues (BullMQ + Redis, Inngest, Trigger.dev).

---

## What is Deprecated / Declining

| Pattern | Status | Migration |
|---------|--------|-----------|
| Express 4 (for new projects) | Aging | Express 5 or Fastify |
| Mongoose/Sequelize (for new projects) | Declining | Drizzle ORM or Prisma |
| `body-parser` (npm package) | Built into Express 5 | Remove dependency |
| Class-based controllers (NestJS-style in vanilla Express) | Overcomplicated | Function-based handlers |
| `winston` logger | Declining in Node APIs | `pino` (faster, structured) |
| Swagger 2.0 | Legacy | OpenAPI 3.1 |
| `passport.js` | Declining | `@fastify/jwt`, Auth.js (Next.js), Lucia |
| `dotenv` package | Still used | Built-in Node 20 `--env-file` flag |
| `ts-node` for production | Incorrect | `tsup` build → `node dist/` |
| REST for internal TypeScript services | Being replaced | tRPC |

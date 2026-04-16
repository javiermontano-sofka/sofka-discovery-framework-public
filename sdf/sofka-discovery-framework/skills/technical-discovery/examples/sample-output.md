# Technical Discovery — Sample Output

## Context
Performing initial technical discovery on an unfamiliar e-commerce repository to produce a technology manifest and architecture map before any diagnosis or recommendation work.

## Output

### Structure Overview

```
ecommerce-platform/
├── apps/
│   ├── web/              # Next.js storefront
│   ├── admin/            # React admin dashboard
│   └── api/              # NestJS backend API
├── packages/
│   ├── shared-types/     # TypeScript type definitions
│   ├── ui-components/    # Shared React component library
│   └── config/           # Shared ESLint, TSConfig, Prettier
├── services/
│   ├── payments/         # Go microservice
│   └── notifications/    # Python FastAPI service
├── infrastructure/
│   ├── terraform/        # AWS infrastructure as code
│   └── k8s/              # Kubernetes manifests
└── tools/
    └── scripts/          # Build and deployment scripts
```

### Technology Manifest

| Layer | Technology | Version | Evidence | Classification |
|-------|-----------|---------|----------|---------------|
| Language | TypeScript | 5.4.2 | `tsconfig.json` root `[HECHO]` | Core |
| Language | Go | 1.22 | `services/payments/go.mod` `[HECHO]` | Core |
| Language | Python | 3.12 | `services/notifications/.python-version` `[HECHO]` | Auxiliary |
| Frontend | Next.js | 14.2.1 | `apps/web/package.json` `[HECHO]` | Core |
| Frontend | React | 18.3.0 | `apps/admin/package.json` `[HECHO]` | Core |
| Backend | NestJS | 10.3.2 | `apps/api/package.json` `[HECHO]` | Core |
| Backend | FastAPI | 0.110.0 | `services/notifications/requirements.txt` `[HECHO]` | Auxiliary |
| Database | PostgreSQL | 16.2 | `infrastructure/terraform/rds.tf` `[HECHO]` | Core |
| Cache | Redis | 7.2 | `infrastructure/k8s/redis-deployment.yaml` `[HECHO]` | Auxiliary |
| Search | Elasticsearch | 8.12 | `infrastructure/k8s/elastic-deployment.yaml` `[HECHO]` | Auxiliary |
| Queue | RabbitMQ | 3.13 | `infrastructure/k8s/rabbitmq-deployment.yaml` `[HECHO]` | Core |
| ORM | Prisma | 5.11.0 | `apps/api/package.json` `[HECHO]` | Core |
| Monorepo | Turborepo | 1.13.0 | `turbo.json` in root `[HECHO]` | Tooling |
| CI/CD | GitHub Actions | — | `.github/workflows/` (3 workflow files) `[HECHO]` | Infra |
| IaC | Terraform | 1.7.x | `infrastructure/terraform/.terraform-version` `[HECHO]` | Infra |
| Container | Docker | — | `Dockerfile` in each app/service `[HECHO]` | Infra |
| Orchestration | Kubernetes | — | `infrastructure/k8s/` (12 manifests) `[HECHO]` | Infra |

### Entry Points

| Entry Point | Location | Type | Start Command |
|-------------|----------|------|---------------|
| Storefront | `apps/web/` | HTTP server | `npm run dev` (port 3000) |
| Admin panel | `apps/admin/` | HTTP server | `npm run dev` (port 3001) |
| API server | `apps/api/` | HTTP server | `npm run start:dev` (port 4000) |
| Payments service | `services/payments/` | HTTP server | `go run cmd/server/main.go` (port 4001) |
| Notifications service | `services/notifications/` | HTTP server | `uvicorn main:app` (port 4002) |
| Payment worker | `services/payments/` | Queue consumer | `go run cmd/worker/main.go` |

### Domain Map

| Domain | Location | Key Files |
|--------|----------|-----------|
| **Product Catalog** | `apps/api/src/modules/products/` | 8 files, Prisma model, REST + GraphQL |
| **Orders** | `apps/api/src/modules/orders/` | 12 files, state machine, RabbitMQ events |
| **Payments** | `services/payments/` | Go service, Stripe integration `[HECHO: stripe-go in go.mod]` |
| **Auth** | `apps/api/src/modules/auth/` | JWT + refresh tokens, RBAC middleware |
| **Notifications** | `services/notifications/` | Email (SendGrid), SMS (Twilio) `[HECHO: requirements.txt]` |
| **Search** | `apps/api/src/modules/search/` | Elasticsearch queries, product indexing |
| **User Management** | `apps/api/src/modules/users/` | Profile CRUD, address management |

### Health Signals

| Signal | Status | Evidence |
|--------|--------|----------|
| Test files present | Yes | `*.spec.ts` and `*.test.ts` across all TS apps `[HECHO]` |
| Test-to-source ratio | ~0.6 | 142 test files / 237 source files `[HECHO]` |
| Coverage config | Present | `jest.config.ts` with `collectCoverage: true` `[HECHO]` |
| CI pipelines | Active | 3 workflows, last run 2 days ago `[HECHO]` |
| Lock files current | Yes | `pnpm-lock.yaml` modified 3 days ago `[HECHO]` |
| Documentation | Partial | README in root, no ADRs, no API docs generated `[HECHO]` |
| Dependency currency | Mixed | 80% of deps within 2 minor versions of latest `[INFERENCIA: sampled top 10 deps]` |

# Repository Scanner — Sample Output

## Context
Scanning a full-stack web application repository to produce a technology manifest.

## Output

### Stack Manifest

| Layer | Technology | Version | Evidence | Classification |
|-------|-----------|---------|----------|---------------|
| Language | TypeScript | 5.3.3 | `tsconfig.json`, `package.json` `[HECHO]` | Core |
| Language | Python | 3.12 | `.python-version` `[HECHO]` | Core |
| Frontend | Next.js | 14.1.0 | `package.json` `[HECHO]` | Core |
| Backend | FastAPI | 0.109.0 | `requirements.txt` `[HECHO]` | Core |
| Database | PostgreSQL | 16 | `docker-compose.yml` `[HECHO]` | Core |
| Cache | Redis | 7.2 | `docker-compose.yml` `[HECHO]` | Auxiliary |
| ORM | Prisma | 5.8.1 | `package.json` `[HECHO]` | Core |
| Testing | Jest | 29.7.0 | `package.json` `[HECHO]` | Dev-only |
| Testing | pytest | 8.0.0 | `requirements-dev.txt` `[HECHO]` | Dev-only |
| Bundler | Turbopack | — | `next.config.js` `[INFERENCIA]` | Dev-only |
| CI/CD | GitHub Actions | — | `.github/workflows/` `[HECHO]` | Infra |

### Entry Points
- **Web server**: `apps/web/` — Next.js dev server (`npm run dev`, port 3000)
- **API server**: `services/api/main.py` — FastAPI (`uvicorn main:app`, port 8000)
- **Worker**: `services/worker/main.py` — Celery worker (`celery -A worker`)
- **CLI**: `tools/cli/index.ts` — Internal tooling (`npx tsx tools/cli/index.ts`)

### Topology
Monorepo (Turborepo) with 3 apps and 2 shared packages.

---
name: scaffold-docker-dev
author: "Javier Montaño (JM Labs)"
version: "2.0.0"
description: >
  Scaffold a production-parity Docker development environment: multi-service
  Compose, volume mounts, networking, health checks, dev containers, and
  secrets management. Eliminates "works on my machine" at the infrastructure layer.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
  - Agent
tags: [docker, docker-compose, devcontainer, networking, health-checks, volumes]
---

# Scaffold Docker Dev Environment

> *"Your dev environment is infrastructure — version-control it, test it, and treat drift as a bug."*

## TL;DR

Five-step procedure to build a Docker-based dev environment with multi-service
Compose orchestration, bind mounts for live reload, network segmentation,
health-check-gated startup ordering, and Dev Container integration for VS Code / Cursor.

---

## Step 1 — Discover & Profile the Stack

1. Identify all services: app server, database, cache, queue, mail catcher, object storage.
2. Map port requirements and inter-service dependencies (who calls whom).
3. Determine hot-reload requirements: Node (nodemon/tsx watch), Python (uvicorn --reload),
   Go (air), Rust (cargo-watch).
4. Classify secrets: env vars vs. Docker secrets vs. volume-mounted `.env` files.
5. Produce a **Service Dependency Graph** before writing any YAML.

---

## Step 2 — Multi-Service Compose Design

### Canonical `compose.yml` Structure

```yaml
# compose.yml — development override (not production)
name: myapp-dev

services:
  app:
    build:
      context: .
      dockerfile: Dockerfile.dev
      args:
        NODE_VERSION: "20"
    ports:
      - "3000:3000"
      - "9229:9229"   # Node debugger
    volumes:
      - .:/workspace:cached       # Bind mount — live code
      - node_modules:/workspace/node_modules  # Anonymous vol — prevents host override
    environment:
      - NODE_ENV=development
      - DATABASE_URL=postgresql://postgres:password@db:5432/myapp
      - REDIS_URL=redis://cache:6379
    env_file:
      - .env.local
    depends_on:
      db:
        condition: service_healthy
      cache:
        condition: service_healthy
    networks:
      - backend
    develop:
      watch:
        - action: sync
          path: ./src
          target: /workspace/src
        - action: rebuild
          path: package.json

  db:
    image: postgres:16-alpine
    environment:
      POSTGRES_DB: myapp
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: password
    volumes:
      - postgres_data:/var/lib/postgresql/data
      - ./infra/db/init:/docker-entrypoint-initdb.d:ro
    ports:
      - "5432:5432"
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U postgres -d myapp"]
      interval: 5s
      timeout: 3s
      retries: 5
      start_period: 10s
    networks:
      - backend

  cache:
    image: redis:7-alpine
    command: redis-server --maxmemory 256mb --maxmemory-policy allkeys-lru
    volumes:
      - redis_data:/data
    healthcheck:
      test: ["CMD", "redis-cli", "ping"]
      interval: 5s
      timeout: 3s
      retries: 3
    networks:
      - backend

  mailpit:
    image: axllent/mailpit:latest
    ports:
      - "8025:8025"   # Web UI
      - "1025:1025"   # SMTP
    networks:
      - backend

volumes:
  postgres_data:
  redis_data:
  node_modules:

networks:
  backend:
    driver: bridge
```

### Network Segmentation

```yaml
# For apps requiring frontend/backend isolation
networks:
  frontend:
    driver: bridge
  backend:
    driver: bridge
  # Services on both networks act as reverse proxy
  # e.g. nginx on frontend+backend; db only on backend
```

---

## Step 3 — Dockerfile.dev Design

```dockerfile
# Dockerfile.dev — optimized for development iteration speed
ARG NODE_VERSION=20
FROM node:${NODE_VERSION}-alpine AS base

# Install system deps (rarely changes — cache this layer)
RUN apk add --no-cache libc6-compat curl git

WORKDIR /workspace

# Install deps separately from app code (cache invalidation boundary)
COPY package*.json ./
RUN npm ci

# Dev: don't copy source — it's bind-mounted
COPY tsconfig.json ./

EXPOSE 3000 9229

# Use exec form — PID 1 receives signals correctly
CMD ["npm", "run", "dev"]
```

### Dockerfile Decision: Multi-Stage Production

```dockerfile
# Dockerfile — production multi-stage
FROM node:20-alpine AS deps
WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production

FROM node:20-alpine AS builder
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .
RUN npm run build

FROM node:20-alpine AS runner
WORKDIR /app
ENV NODE_ENV=production
RUN addgroup --system --gid 1001 nodejs \
  && adduser --system --uid 1001 appuser
COPY --from=builder --chown=appuser:nodejs /app/dist ./dist
COPY --from=deps /app/node_modules ./node_modules
USER appuser
EXPOSE 3000
CMD ["node", "dist/index.js"]
```

---

## Step 4 — Health Checks & Startup Ordering

### Health Check Strategies by Service Type

| Service | Test Command | Interval | Retries |
|---------|-------------|---------|---------|
| PostgreSQL | `pg_isready -U user -d db` | 5s | 5 |
| MySQL | `mysqladmin ping -h localhost` | 5s | 5 |
| Redis | `redis-cli ping` | 5s | 3 |
| HTTP API | `curl -f http://localhost:3000/health` | 10s | 3 |
| RabbitMQ | `rabbitmq-diagnostics ping` | 10s | 5 |

### Application Health Endpoint

```typescript
// src/routes/health.ts
import { Router } from 'express';
import { db } from '../db';
import { cache } from '../cache';

export const healthRouter = Router();

healthRouter.get('/health', async (req, res) => {
  const checks = await Promise.allSettled([
    db.raw('SELECT 1'),
    cache.ping(),
  ]);

  const status = checks.every(c => c.status === 'fulfilled') ? 'ok' : 'degraded';
  res.status(status === 'ok' ? 200 : 503).json({
    status,
    db: checks[0].status,
    cache: checks[1].status,
    uptime: process.uptime(),
  });
});
```

---

## Step 5 — Dev Container Integration

```json
// .devcontainer/devcontainer.json
{
  "name": "MyApp Dev",
  "dockerComposeFile": ["../compose.yml", "docker-compose.devcontainer.yml"],
  "service": "app",
  "workspaceFolder": "/workspace",
  "shutdownAction": "stopCompose",
  "customizations": {
    "vscode": {
      "extensions": [
        "dbaeumer.vscode-eslint",
        "esbenp.prettier-vscode",
        "ms-azuretools.vscode-docker",
        "ckolkman.vscode-postgres"
      ],
      "settings": {
        "editor.formatOnSave": true,
        "editor.defaultFormatter": "esbenp.prettier-vscode",
        "typescript.tsdk": "node_modules/typescript/lib"
      }
    }
  },
  "postCreateCommand": "npm run db:migrate && npm run db:seed",
  "forwardPorts": [3000, 5432, 8025],
  "remoteUser": "node"
}
```

```yaml
# .devcontainer/docker-compose.devcontainer.yml — overrides for devcontainer
services:
  app:
    command: sleep infinity   # devcontainer manages the process
    environment:
      - SHELL=/bin/zsh
```

### `.dockerignore` Discipline

```
# .dockerignore — critical for build context size
node_modules
.git
.env*
!.env.example
dist
coverage
.next
*.log
```

---

## Quality Criteria

1. **Health-check-gated `depends_on`** — Services never start before dependencies are healthy.
2. **Named volumes for data** — Not bind mounts for database data; data survives container recreation.
3. **Anonymous volume for `node_modules`** — Prevents host `node_modules` from masking container version.
4. **No hardcoded secrets in Compose** — Use `env_file` or Docker secrets for sensitive values.
5. **`.dockerignore` present** — Build context excludes `node_modules`, `.git`, `.env`.
6. **Signal handling** — `CMD` uses exec form `["node", "..."]`, not shell form, so PID 1 receives SIGTERM.
7. **Non-root user in production image** — `USER appuser` set before `CMD`.
8. **Multi-stage prod Dockerfile** — Final image contains only runtime artifacts.

---

## Anti-Patterns

- **`depends_on:` without `condition: service_healthy`** — Race conditions where app starts before DB is ready, causing startup crashes.
- **Bind-mounting `node_modules` from host** — Different OS/arch between host (macOS) and container (Linux) causes native module incompatibility.
- **Storing DB data in bind mounts** — Permission issues on Linux vs. macOS; use named volumes.
- **Not using `.dockerignore`** — Sending `node_modules` (potentially GBs) as build context on every build.
- **Shell form CMD (`CMD npm start`)** — Node process becomes a child of `/bin/sh`; SIGTERM not forwarded, causes 10s shutdown timeout.
- **One monolithic Dockerfile for dev and prod** — Dev needs devDependencies, debugger ports, and source maps; prod needs none of these.
- **Exposing database ports on `0.0.0.0`** — Other network participants can reach your dev DB; bind to `127.0.0.1:5432:5432` instead.

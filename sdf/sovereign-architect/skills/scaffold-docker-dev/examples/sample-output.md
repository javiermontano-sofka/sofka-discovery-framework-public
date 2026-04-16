# Sample Output: Node.js + PostgreSQL + Redis Docker Dev Scaffold

## Stack Profile

- **Runtime**: Node.js 20 (TypeScript, Fastify) [HECHO — from package.json]
- **Database**: PostgreSQL 16 [HECHO — from existing .env.example]
- **Cache**: Redis 7 [INFERENCIA — `redis` in package.json dependencies]
- **Hot reload**: `tsx watch` [HECHO — from package.json scripts.dev]
- **Debug port**: 9229 [SUPUESTO — standard Node debugger port]

---

## Generated `compose.yml`

```yaml
name: myapp-dev

services:
  app:
    build:
      context: .
      dockerfile: Dockerfile.dev
    ports:
      - "3000:3000"
      - "9229:9229"
    volumes:
      - .:/workspace:cached
      - node_modules:/workspace/node_modules
    environment:
      - NODE_ENV=development
      - DATABASE_URL=postgresql://postgres:devpassword@db:5432/myapp
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
      POSTGRES_PASSWORD: devpassword
    volumes:
      - postgres_data:/var/lib/postgresql/data
      - ./infra/db/init:/docker-entrypoint-initdb.d:ro
    ports:
      - "127.0.0.1:5432:5432"
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
      - "8025:8025"
      - "127.0.0.1:1025:1025"
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

---

## Generated `Dockerfile.dev`

```dockerfile
ARG NODE_VERSION=20
FROM node:${NODE_VERSION}-alpine

RUN apk add --no-cache libc6-compat curl git

WORKDIR /workspace

# Install deps (cached until package.json changes)
COPY package*.json ./
RUN npm ci

COPY tsconfig*.json ./

EXPOSE 3000 9229

CMD ["npm", "run", "dev"]
```

---

## Generated `Dockerfile` (Multi-Stage Production)

```dockerfile
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

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD curl -f http://localhost:3000/health || exit 1

CMD ["node", "dist/server.js"]
```

---

## Generated `.devcontainer/devcontainer.json`

```json
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
        "ckolkman.vscode-postgres",
        "bradlc.vscode-tailwindcss"
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

---

## Generated `.dockerignore`

```
node_modules
.git
.env*
!.env.example
dist
coverage
.next
.turbo
*.log
*.md
!README.md
```

---

## Quality Gate Checklist

- [x] Health checks: PostgreSQL (`pg_isready`) and Redis (`redis-cli ping`)
- [x] `depends_on` with `condition: service_healthy` — no race conditions
- [x] Named volumes for DB and Redis data persistence
- [x] Anonymous volume for `node_modules`
- [x] Database port bound to `127.0.0.1` — not exposed to network
- [x] Non-root user `appuser` in production image
- [x] Multi-stage prod Dockerfile — no devDependencies in final image
- [x] Exec form CMD `["node", "dist/server.js"]` — PID 1 signal handling
- [x] `.dockerignore` excludes `node_modules`, `.git`, `.env`
- [x] Dev Container configured with shared extensions and settings

---

## Next Steps

1. Create `.env.local` from `.env.example`: `cp .env.example .env.local`.
2. Run `docker compose up --watch` — starts all services with live file sync.
3. Open in Dev Container: `Cmd+Shift+P → Dev Containers: Open Folder in Container`.
4. Verify DB connectivity: `docker compose exec app npx prisma migrate dev`.
5. Test health endpoint: `curl http://localhost:3000/health`.

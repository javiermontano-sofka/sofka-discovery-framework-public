# Use Case Prompts — Scaffold Docker Dev

## Scenario 1: Node.js + PostgreSQL + Redis Full Stack

```
Scaffold a Docker development environment for a Node.js API (TypeScript/Fastify)
with PostgreSQL 16 and Redis 7.

Requirements:
- Hot reload (tsx watch)
- Node debugger port exposed (9229)
- Health checks on db and cache
- Anonymous volume for node_modules
- Dev Container for VS Code

Deliver:
1. compose.yml with all services
2. Dockerfile.dev (fast iteration)
3. Dockerfile (multi-stage production)
4. .devcontainer/devcontainer.json
5. .dockerignore
```

## Scenario 2: Python FastAPI + PostgreSQL

```
Scaffold a Docker dev environment for a Python FastAPI application
with PostgreSQL and Celery workers.

Requirements:
- uvicorn --reload for hot reload
- Celery worker as separate service
- Redis as Celery broker
- PostgreSQL with initialization SQL scripts
- Environment variables via .env.local

Deliver:
1. compose.yml with app, worker, db, broker services
2. Dockerfile.dev using Python 3.12-slim
3. Health check for each service
4. Volume strategy for virtual environment
5. Development vs. production Dockerfile comparison
```

## Scenario 3: Audit Existing Docker Setup

```
Review the Docker configuration in the current repository.
Identify issues with the existing compose.yml and Dockerfiles.

Evaluate against:
- Health check coverage
- Volume strategy (data persistence, node_modules)
- Signal handling (exec vs shell form CMD)
- Secret management (no hardcoded values)
- Multi-stage production build
- .dockerignore completeness
- Network security (database port exposure)

Deliver:
1. Findings with severity P0/P1/P2 and evidence tags
2. Specific line-by-line issues in existing files
3. Fixed versions of problematic configurations
4. Priority-ordered remediation roadmap
```

## Scenario 4: Migrate from Docker Desktop to OrbStack

```
Plan and guide migration from Docker Desktop to OrbStack on macOS
for a team of 5 developers.

Current state:
- Docker Desktop Professional license
- docker-compose v1 syntax (docker-compose.yml)
- Some services using host.docker.internal
- Mix of Intel and Apple Silicon Macs

Steps needed:
1. OrbStack installation and verification
2. Compose v2 syntax migration (docker-compose.yml → compose.yml)
3. host.docker.internal equivalents in OrbStack
4. Apple Silicon compatibility check for service images
5. Team onboarding script

Deliver:
1. Step-by-step migration checklist
2. Compose v1 → v2 syntax conversion guide
3. Shell script for automated setup verification
```

## Scenario 5: Add Dev Container to Existing Project

```
Add VS Code Dev Container configuration to an existing project that
currently runs Docker Compose directly.

Existing setup:
- compose.yml with app, db, and cache services
- Developers run 'docker compose up' manually
- Inconsistent VS Code extension versions across team

Goal:
- Consistent development environment across team
- Shared VS Code extensions and settings
- postCreateCommand for db migrations
- Works on both macOS (OrbStack) and Linux

Deliver:
1. .devcontainer/devcontainer.json
2. .devcontainer/docker-compose.devcontainer.yml overrides
3. List of recommended VS Code extensions with IDs
4. postCreateCommand script
5. Team README additions for onboarding
```

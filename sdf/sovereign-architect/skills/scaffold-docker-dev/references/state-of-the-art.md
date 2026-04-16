# State of the Art: Docker Dev Environments (2025-2026)

## Current Landscape

Docker development environments have matured with Compose v2 GA, Dev Containers
becoming a cross-IDE standard, and OrbStack emerging as the dominant macOS runtime.

## Key 2025-2026 Developments

### OrbStack Replacing Docker Desktop on macOS

OrbStack has become the default choice for macOS Docker runtime:
- 2-5x faster than Docker Desktop for file mounts.
- Significantly lower memory usage (~300MB vs 1-2GB for Docker Desktop).
- Native Apple Silicon support from day one.
- Compatible with all Docker CLI commands and Compose.

### Docker Compose `develop.watch` (Stable 2024)

Compose `develop.watch` replaces external file-watcher tools (nodemon, air, watchman):
```yaml
develop:
  watch:
    - action: sync       # File sync without container restart
    - action: sync+restart  # Sync and restart the process
    - action: rebuild    # Full rebuild on package.json changes
```
This eliminates the `nodemon` dependency and integrates file watching at the
infrastructure level.

### Dev Containers v2 Specification

The Dev Containers spec (now maintained by Microsoft, community-driven) supports:
- `features/` — composable dev environment features (Node, Python, Go, etc.).
- `onCreateCommand`, `updateContentCommand`, `postCreateCommand` hooks.
- Codespaces compatibility — same `devcontainer.json` works locally and on GitHub Codespaces.
- Cross-IDE: VS Code, Cursor, IntelliJ, Neovim (via `devcontainer` CLI).

### BuildKit by Default

Docker BuildKit is now the default builder since Docker 23.0:
- Parallel layer execution.
- `--mount=type=cache` for package manager caches:
  ```dockerfile
  RUN --mount=type=cache,target=/root/.npm \
      npm ci --prefer-offline
  ```
- `--mount=type=secret` for build-time secrets without leaking into image layers.

### Testcontainers

Testcontainers has become the standard for integration testing with real databases:
```typescript
// Jest integration test with real PostgreSQL
import { PostgreSqlContainer } from '@testcontainers/postgresql';

const container = await new PostgreSqlContainer('postgres:16').start();
const connectionString = container.getConnectionUri();
// Run tests against real DB, cleanup on afterAll
```

## Best Current Practices (2025)

1. **OrbStack on macOS** — Not Docker Desktop (performance).
2. **Compose v2 syntax** — `compose.yml` (not `docker-compose.yml`); Compose v2 CLI (`docker compose`).
3. **`develop.watch`** — Native file watching instead of nodemon inside containers.
4. **BuildKit cache mounts** — `--mount=type=cache` for npm/pip/cargo caches; 50-80% faster rebuilds.
5. **Non-root containers** — Even in development; catches permission issues early.
6. **Testcontainers** — Integration tests against real service containers, not mocks.

## Performance Benchmarks (2025)

- File mount latency (OrbStack): 2-5ms (vs 20-50ms Docker Desktop)
- Container cold start (Node 20 alpine): 0.5-2s
- Image build with BuildKit cache hit: 5-15s (vs 30-60s cold)
- `docker compose up` (all healthy): 10-30s depending on health check timings

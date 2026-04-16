# Body of Knowledge: Scaffold Docker Dev

## Core Architecture Concepts

### Docker Networking Model

Docker creates isolated network namespaces. In Compose, services communicate by service name:

```
app → db:5432       # Service name as hostname
app → cache:6379    # Docker DNS resolves within the network
```

**Network types**:
- `bridge` (default): Isolated from host network; services communicate by name.
- `host`: Container shares host network stack; no port mapping needed but no isolation.
- `overlay`: Multi-host networking (Swarm/Kubernetes).

For dev environments, always use `bridge` with explicit network declarations.

### Volume Types and Trade-offs

| Volume Type | Syntax | Lifecycle | Use Case |
|-------------|--------|----------|---------|
| Bind mount | `./src:/app/src` | Host filesystem | Source code (live reload) |
| Named volume | `postgres_data:/var/lib/postgresql/data` | Managed by Docker | Database data persistence |
| Anonymous volume | `/app/node_modules` | Deleted with container | Override bind mount |
| tmpfs | `type: tmpfs, target: /tmp` | In-memory, container lifetime | Test scratch space |

**The `node_modules` anonymous volume pattern** is critical:
```yaml
volumes:
  - .:/workspace          # Bind mount — live code from host
  - /workspace/node_modules  # Anonymous — prevent host node_modules from masking container's
```
Without the anonymous volume, the host's `node_modules` (compiled for macOS) would
override the container's (compiled for Linux), causing native module failures.

### Health Check Mechanics

```yaml
healthcheck:
  test: ["CMD", "pg_isready", "-U", "postgres"]
  interval: 5s      # How often to run the check
  timeout: 3s       # How long a check is allowed to run
  retries: 5        # Consecutive failures before unhealthy
  start_period: 10s # Grace period — failures don't count during startup
```

`condition: service_healthy` in `depends_on` blocks the dependent service until
the healthcheck enters `healthy` state. Without this, containers start in parallel
and the app often races ahead of the database.

### Signal Handling and Graceful Shutdown

Container stop sequence:
1. Docker sends `SIGTERM` to PID 1 in the container.
2. App should begin graceful shutdown (close connections, finish in-flight requests).
3. After `stop_grace_period` (default 10s), Docker sends `SIGKILL`.

**Shell form vs. Exec form**:
```dockerfile
# Shell form — /bin/sh -c "node server.js" — node is NOT PID 1
CMD node server.js

# Exec form — node is PID 1, receives SIGTERM directly
CMD ["node", "server.js"]
```

For Express/Fastify, implement graceful shutdown:
```typescript
const server = app.listen(3000);

process.on('SIGTERM', () => {
  server.close(async () => {
    await db.end();       // Close database connections
    await cache.quit();   // Close Redis connections
    process.exit(0);
  });
});
```

### Build Context and Layer Caching

Docker builds images by executing each Dockerfile instruction as a layer.
Layers are cached until a change invalidates them. Order matters:

```dockerfile
# Efficient: dep layer rarely changes, code layer changes often
COPY package*.json ./   # Cache invalidated only when package.json changes
RUN npm ci              # Cached if package.json unchanged
COPY . .                # Frequently changes — only invalidates THIS and later layers
RUN npm run build

# Inefficient: COPY . invalidates npm ci on every code change
COPY . .
RUN npm ci              # Runs every time any file changes
```

### Docker Compose `develop.watch` (Compose v2.22+)

Replaces manual `nodemon`/`air` setups with Docker-native file watching:

```yaml
services:
  app:
    develop:
      watch:
        - action: sync       # Copy files into container without rebuild
          path: ./src
          target: /app/src
          ignore:
            - node_modules
        - action: sync+restart  # Sync then restart process
          path: ./config
          target: /app/config
        - action: rebuild    # Full image rebuild
          path: package.json
```

### Multi-Stage Build Optimization

```
Stage 1 (deps):     Install production dependencies only → exports node_modules
Stage 2 (builder):  Install all deps + build → exports dist/
Stage 3 (runner):   Copy node_modules from deps + dist from builder → final image

Final image contains: only runtime code, no devDependencies, no source files
Result: 100-200MB vs 500MB+ for naive single-stage builds
```

### Security Hardening

```dockerfile
# Non-root user
RUN addgroup --system --gid 1001 appgroup \
  && adduser --system --uid 1001 --ingroup appgroup appuser
USER appuser

# Read-only root filesystem (for security-sensitive containers)
# set in compose:
read_only: true
tmpfs:
  - /tmp
  - /var/run
```

```yaml
# compose.yml security options
services:
  app:
    security_opt:
      - no-new-privileges:true
    read_only: true
    tmpfs:
      - /tmp
```

### Secrets Management in Compose

```yaml
# Development: use env_file (not production secrets)
services:
  app:
    env_file:
      - .env.local  # gitignored; contains dev secrets only

# Production Docker Swarm: use secrets
secrets:
  db_password:
    external: true
services:
  app:
    secrets:
      - db_password
    # Mounted at /run/secrets/db_password
```

## Common Patterns

### Database Initialization

```yaml
services:
  db:
    volumes:
      - postgres_data:/var/lib/postgresql/data
      - ./infra/db/init:/docker-entrypoint-initdb.d:ro
      # Files in init/ run alphabetically on first container start:
      # 01_schema.sql, 02_seed.sql, etc.
```

### Multiple Compose File Overrides

```bash
# Base config + dev overrides
docker compose -f compose.yml -f compose.dev.yml up

# Base config + test overrides
docker compose -f compose.yml -f compose.test.yml up --abort-on-container-exit
```

### Container Logs Best Practices

```yaml
services:
  app:
    logging:
      driver: "json-file"
      options:
        max-size: "10m"
        max-file: "3"
```

## References

- [Docker Compose File Reference](https://docs.docker.com/compose/compose-file/)
- [Dockerfile Best Practices](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)
- [Dev Containers Specification](https://containers.dev/)
- [Docker Build Cache](https://docs.docker.com/build/cache/)

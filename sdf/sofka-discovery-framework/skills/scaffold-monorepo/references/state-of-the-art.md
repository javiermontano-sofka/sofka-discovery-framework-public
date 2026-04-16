# State of the Art: Monorepo Tooling (2025-2026)

## Current Landscape

The monorepo tooling space stabilized in 2024-2025 with Turborepo v2 and Nx v19
both achieving maturity. pnpm workspaces is the dominant package manager for
monorepos. Bun workspaces is emerging as a fast alternative.

## Key 2025-2026 Developments

### Turborepo v2 (2024)

Major changes:
- `tasks` replaces `pipeline` in `turbo.json`.
- `globalEnv` for env vars that affect all tasks.
- `--filter` syntax improvements.
- Turbo Pack (Rust-based bundler for Next.js) in beta.
- Remote caching via Vercel or self-hosted.

### Nx v19-20 (2024-2025)

- **Project Crystal** — Inferred targets (no need to manually configure `project.json`).
- **Nx Agents** — Distributed task execution without Nx Cloud infrastructure.
- `@nx/vite`, `@nx/rspack` — Modern bundler integrations.
- Improved React Native and Expo support.

### pnpm v9 as Default

pnpm v9 is now the stable choice for monorepos:
- Stricter dependency isolation by default.
- `pnpm patch` for patching third-party packages.
- `pnpm catalog:` protocol for shared version constraints.
- Faster install via content-addressable store.

### Bun Workspaces (Emerging)

Bun 1.x supports workspaces with much faster install times than pnpm:
```bash
bun install   # 10-20x faster than npm, 2-5x faster than pnpm
```
Not yet production-standard for complex monorepos, but growing fast.

### Mise en Place (Tool Version Management)

Replaces `.nvmrc`, `.tool-versions` (asdf), and `.node-version`:
```toml
# .mise.toml
[tools]
node = "20"
pnpm = "9"
```
Works per-directory, automatically activates correct versions.

## Best Current Practices (2025)

1. **pnpm workspaces** — Consistent, fast, strict dependency isolation.
2. **Turborepo v2** for JS/TS monorepos; **Nx** for polyglot or enterprise scale.
3. **Remote caching enabled from day one** — Turbo (Vercel) or Nx Cloud.
4. **`packageManager` field** — Corepack enforces exact version for entire team.
5. **`--frozen-lockfile` in CI** — Prevents silent lockfile drift.
6. **Changesets for library versioning** — Intentional, documented version bumps.
7. **`workspace:^` in package.json** — Not hardcoded versions for internal packages.

## Performance Benchmarks (2025)

- pnpm install (20 packages, cache warm): 5-15s
- turbo build (20 packages, 80% cache hit): 10-30s
- turbo build (20 packages, cold cache): 2-5min
- nx affected --target=build (10 changed packages): 30-90s

# Commands Reference — Sovereign Architect

> SA Ontología Viva · Inventario de ~65 comandos (35 primary + 30 aliases).

---

## Resumen

| Categoría | Primary | Aliases | Total |
|-----------|---------|---------|-------|
| **Workflow** | 4 | 4 | 8 |
| **Movements** | 4 | 4 | 8 |
| **Focused** | 3 | 3 | 6 |
| **Audit** | 8 | 8 | 16 |
| **Map** | 4 | 4 | 8 |
| **Design** | 5 | 3 | 8 |
| **Generate** | 4 | 2 | 6 |
| **Ops** | 3 | 2 | 5 |
| **Total** | **35** | **30** | **~65** |

---

## Workflow Commands

| Command | Alias | Description |
|---------|-------|-------------|
| `/sa:analyze` | `/sa:a` | Full 5-phase workflow |
| `/sa:run-full` | `/sa:full` | Analyze with complete output |
| `/sa:run-quick` | `/sa:quick` | Fast diagnosis + key recommendations |
| `/sa:menu` | — | Interactive command palette |

## Movement Commands

| Command | Alias | Description |
|---------|-------|-------------|
| `/sa:create` | `/sa:c` | CREATE — generate new artifacts |
| `/sa:review` | `/sa:r` | REVIEW — analyze existing artifacts |
| `/sa:evolve` | `/sa:e` | EVOLVE — improve without degrading |
| `/sa:repair` | `/sa:fix` | REPAIR — diagnose and fix |

## Focused Commands

| Command | Alias | Description |
|---------|-------|-------------|
| `/sa:diagnose` | `/sa:dx` | Phases 1-2 only (discovery + diagnosis) |
| `/sa:plan` | `/sa:p` | Phases 3-4 only (design + plan) |
| `/sa:spec` | `/sa:s` | Generate spec or ADR |

## Audit Commands

| Command | Alias | Description |
|---------|-------|-------------|
| `/sa:audit-security` | `/sa:sec` | Security audit (OWASP, secrets, auth) |
| `/sa:audit-performance` | `/sa:perf` | Performance audit (N+1, bottlenecks) |
| `/sa:audit-accessibility` | `/sa:a11y` | Accessibility audit (WCAG 2.1) |
| `/sa:audit-testing` | `/sa:test` | Test coverage and quality audit |
| `/sa:audit-dependencies` | `/sa:deps` | Dependency health (CVE, freshness) |
| `/sa:audit-documentation` | `/sa:docs` | Documentation coverage audit |
| `/sa:audit-debt` | `/sa:debt` | Technical debt quantification |
| `/sa:audit-dx` | `/sa:dx-audit` | Developer experience audit |

## Map Commands

| Command | Alias | Description |
|---------|-------|-------------|
| `/sa:map-architecture` | `/sa:arch` | Architecture mapping (C4 diagrams) |
| `/sa:map-data` | `/sa:data` | Data model mapping |
| `/sa:map-api` | `/sa:api` | API surface mapping |
| `/sa:map-infrastructure` | `/sa:infra` | Infrastructure topology |

## Design Commands

| Command | Alias | Description |
|---------|-------|-------------|
| `/sa:design-architecture` | `/sa:design` | Architecture proposal with trade-offs |
| `/sa:design-migration` | `/sa:migrate` | Migration strategy design |
| `/sa:design-deployment` | `/sa:deploy` | Deployment strategy design |
| `/sa:design-api` | — | API contract design |
| `/sa:design-auth` | — | Auth architecture design |

## Generate Commands

| Command | Alias | Description |
|---------|-------|-------------|
| `/sa:generate-adr` | `/sa:adr` | Generate Architecture Decision Record |
| `/sa:generate-tests` | `/sa:tests` | Generate test strategy + test cases |
| `/sa:generate-docs` | — | Generate documentation |
| `/sa:generate-changelog` | — | Generate changelog from git history |

## Ops Commands

| Command | Alias | Description |
|---------|-------|-------------|
| `/sa:validate` | `/sa:v` | Quality gate check |
| `/sa:retro` | — | Session retrospective |
| `/sa:prime` | — | Repository knowledge priming |

---

## Uso con Argumentos

Todos los comandos aceptan argumentos:

```bash
/sa:analyze src/auth/              # Analyze the auth module
/sa:review PR #42                  # Review pull request 42
/sa:repair "login timeout"         # Fix the login timeout issue
/sa:audit-security src/            # Security audit on src/
/sa:map-architecture               # Map full architecture
/sa:design-migration "PostgreSQL"  # Design migration to PostgreSQL
/sa:generate-adr "caching layer"   # Generate ADR for caching decision
```

---

*Sovereign Architect — 65 commands, each with a clear purpose.*

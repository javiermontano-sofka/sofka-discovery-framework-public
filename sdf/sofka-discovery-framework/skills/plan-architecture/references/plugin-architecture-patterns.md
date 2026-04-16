# Plugin Architecture Patterns

> Reference for `plan-architecture` skill. Common architectural patterns for Claude Code plugins.

---

## 1. Single-Agent Pattern

**When**: Plugin has fewer than 10 skills and one coherent domain.

```
Agent: plugin-orchestrator
├── Movement 1: ANALYZE (skills 1-3)
├── Movement 2: GENERATE (skills 4-6)
└── Movement 3: REPORT (skills 7-8)
```

**Pros**: Simple delegation, single point of control, easy to debug.
**Cons**: Agent becomes large, all skills share the same tool allowlist.

---

## 2. Multi-Agent Pattern

**When**: Plugin has 10+ skills spanning distinct domains with different tool needs.

```
Agent: chief-architect (primary)
├── Agent: analyzer (Read, Grep only)
│   └── Movement 1: ANALYZE (skills 1-5)
├── Agent: generator (Read, Write)
│   └── Movement 2: GENERATE (skills 6-10)
└── Agent: reporter (Read, Write)
    └── Movement 3: REPORT (skills 11-12)
```

**Pros**: Least-privilege per agent, clear boundaries, parallel development.
**Cons**: Handoff complexity, need clear delegation criteria.

---

## 3. Pipeline Pattern

**When**: Skills must execute in strict sequential order where each consumes the previous output.

```
skill-1 → skill-2 → skill-3 → skill-4 → GATE → skill-5 → skill-6
```

**Pros**: Predictable flow, easy to add quality gates.
**Cons**: No parallelism, slow for large plugins.

---

## 4. Hub-and-Spoke Pattern

**When**: One core skill is used by many movements, with specialized skills branching off.

```
        ┌── lint-docker
analyze ─┤── lint-compose
        └── lint-pipeline
```

**Pros**: Code reuse through the hub skill, consistent analysis approach.
**Cons**: Hub becomes a bottleneck if it changes frequently.

---

## 5. Hook Strategy Selection

| Strategy | Hooks Used | Best For |
|----------|-----------|----------|
| **Passive** | 0 hooks | On-demand plugins with no automation needs |
| **Reactive** | PostToolUse only | Auto-validate after file modifications |
| **Proactive** | PreToolUse + PostToolUse | Intercept and guide tool usage |
| **Full lifecycle** | Multiple events | Plugins that manage session state |

**Rule of thumb**: Start with Passive. Add hooks only when automation provides clear value over manual invocation.

---

## 6. Command Routing Strategy

| Plugin Size | Canonical Commands | Aliases | Menu Command |
|------------|-------------------|---------|-------------|
| MINIMAL (1-5 skills) | 3-5 | 1-2 | Optional |
| STANDARD (6-15 skills) | 6-10 | 3-5 | Recommended |
| LARGE (16-30 skills) | 10-15 | 5-8 | Required |
| ENTERPRISE (30+ skills) | 15+ | 8+ | Required |

Every plugin should have at minimum: one primary command, one alias, and (if 6+ skills) a menu command.

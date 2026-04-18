# ADR-0029: Plugin-to-Agent-SDK mirror pattern — every plugin has an app sibling

- **Status**: accepted
- **Date**: 2026-04-17
- **Deciders**: Javier Montaño
- **Supersedes**: —

## Context

Claude Code plugins are one delivery surface. Another growing surface is **standalone Claude Agent SDK apps** — programs that use `@anthropic-ai/claude-agent-sdk` (TypeScript) or the Python equivalent to embed a Claude agent in a server, CLI, or scheduled job. Pre-sales teams want both: interactive work in Claude Code (the plugin) + automated pipelines (the app).

Today the plugin and the hypothetical SDK app would duplicate skills/agents/commands. Duplication drifts; drift breaks trust.

User directive:

> "Tenemos plugins y su homólogo agente construido con el agent plugin dev."

Every plugin X should have a sibling `apps/<x>-agent-sdk/` that re-uses the plugin's definitions via SDK loading rather than re-implementing them.

## Decision

For every plugin `P` in the monorepo, there exists `apps/<p>-agent-sdk/` — an SDK app whose:

- **Skills** directory re-exports (symlink or loader-side import) from `<plugin>/skills/`.
- **Agents** directory re-exports from `<plugin>/agents/`.
- **Commands** are re-exposed as CLI subcommands or HTTP endpoints.
- **Workflow notations** (BPMN/DMN/Form) are validated + rendered at app startup.

Canonical layout (TypeScript variant):

```
apps/<p>-agent-sdk/
├── package.json
├── tsconfig.json
├── src/
│   ├── index.ts               # SDK bootstrap
│   ├── skills/                # re-export: export * from "../../../<p>/skills"
│   ├── agents/                # re-export
│   └── commands.ts            # CLI wrapping
├── tests/
├── README.md
└── .env.example
```

Python variant allowed where the plugin's logic is already Python-heavy (e.g. extractors).

Parity is enforced by `scripts/validators/plugin-sdk-parity.py`: for each plugin, assert `apps/<p>-agent-sdk/` exists, contains re-exports covering every skill/agent, and its package depends on `@anthropic-ai/claude-agent-sdk`.

## Consequences

### Positive
- One source of truth for every skill/agent — changes land once, both surfaces benefit.
- Pre-sales teams can automate pipelines via the app while keeping interactive work in the plugin.
- Testing surface grows (apps get jest/pytest coverage) without duplicating skill logic.

### Negative
- Per-plugin doubling of top-level directories. Offset by the fact that apps are thin shells.
- Keeping the SDK app in sync requires CI parity validator. Initial shipping of all 7 apps (Phase 4 of this cycle) is substantial work.
- Version skew: the plugin can be at v13.4.2 while the app is at 0.1.0. Mitigated by recording the plugin version in `package.json.peerDependencies` metadata.

### Neutral
- Not every plugin needs its app immediately; Phase 4 delivers the first pass. Future plugins ship their app in the same PR as the plugin.

## Alternatives considered

- **Single mega-app that hosts all plugins.** Dismissed: coupling + unclear ownership; a failure in one plugin's skills breaks the whole app.
- **No SDK apps; only plugins.** Dismissed: closes the automation surface.
- **Generate apps from plugins at build time.** Dismissed: complexity > benefit at current scale; hand-authored thin shells are clearer.

## References

- Claude Agent SDK (TypeScript) — `@anthropic-ai/claude-agent-sdk`
- Claude Agent SDK (Python) — `anthropic-claude-agent-sdk`
- `scripts/validators/plugin-sdk-parity.py` (enforcement)
- Phase 4 of v13.4.2 cycle plan.

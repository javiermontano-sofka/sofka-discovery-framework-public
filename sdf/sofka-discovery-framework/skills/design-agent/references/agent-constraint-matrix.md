# Agent Constraint Matrix

> What is allowed vs. forbidden in plugin subagents.
> Reference for `design-agent` skill.

---

## Capability Matrix

| Capability | Top-Level Agent | Plugin Subagent | Notes |
|-----------|:---------------:|:---------------:|-------|
| Define `name` | YES | YES | Required for both |
| Define `description` | YES | YES | Required for both |
| Use `tools` allowlist | YES | YES | Least privilege recommended |
| Use `disallowedTools` blocklist | YES | YES | Mutually exclusive with `tools` |
| Override `model` | YES | YES | Per-agent model selection |
| Set `maxTurns` | YES | YES | Recommended for plugin agents |
| List `skills` | YES | YES | Explicit skill assignment |
| Use `memory` | YES | LIMITED | Reduced functionality in plugins |
| Set `background` | YES | YES | Context loading on activation |
| Enable `isolation` | YES | YES | Isolated execution context |
| Define `hooks` | YES | **NO** | Use plugin-level hooks.json |
| Configure `mcpServers` | YES | **NO** | Runtime error if attempted |
| Set `permissionMode` | YES | **NO** | Session permission applies |

---

## Impact of Violations

| Forbidden Field | If Used in Plugin Agent |
|----------------|----------------------|
| `hooks` | Silently ignored. No lifecycle hooks are registered. |
| `mcpServers` | Runtime error when agent attempts to connect to MCP server. |
| `permissionMode` | Silently ignored. Session-level permissions apply. |

---

## Workarounds

| Need | Forbidden Approach | Correct Approach |
|------|-------------------|-----------------|
| Lifecycle automation | Agent-level `hooks` | Plugin-level `hooks.json` in the `hooks/` directory |
| External tool integration | Agent-level `mcpServers` | User configures MCP servers at session level; agent uses available tools |
| Permission escalation | Agent-level `permissionMode` | Document required permissions in README; user grants at session level |

---

## Validation Checklist

Before finalizing an agent design, verify:

- [ ] No `hooks` field in frontmatter
- [ ] No `mcpServers` field in frontmatter
- [ ] No `permissionMode` field in frontmatter
- [ ] `tools` and `disallowedTools` are not both present
- [ ] All listed skills exist or are planned
- [ ] `maxTurns` has a documented rationale
- [ ] `name` is kebab-case and unique within the plugin

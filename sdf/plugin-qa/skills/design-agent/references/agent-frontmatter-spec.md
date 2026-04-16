# Agent Frontmatter Specification

> Complete field catalog for Claude Code plugin agent frontmatter.
> Source: Official Claude Code plugin documentation.
> CRITICAL: Plugin subagents have restricted capabilities compared to top-level agents.

---

## Supported Fields for Plugin Subagents

### `name` (REQUIRED)

- **Type**: string
- **Format**: kebab-case (`^[a-z][a-z0-9]*(-[a-z0-9]+)*$`)
- **Purpose**: Unique identifier for the agent within the plugin.
- **Example**: `plugin-qa-engineer`

### `description` (REQUIRED)

- **Type**: string
- **Purpose**: Role summary. Include trigger phrases for natural language matching.
- **Example**: `"Orchestrates plugin QA: validates structure, audits quality, generates reports."`

### `tools`

- **Type**: list of strings
- **Purpose**: Whitelist of tools the agent may use. Any tool not listed is blocked.
- **Mutually exclusive with**: `disallowedTools` (if both present, `disallowedTools` is ignored).
- **Example**: `[Read, Write, Glob, Grep, Bash]`

### `disallowedTools`

- **Type**: list of strings
- **Purpose**: Blocklist of tools the agent may NOT use. All other tools are allowed.
- **Mutually exclusive with**: `tools`
- **Example**: `[WebFetch, WebSearch]`

### `model`

- **Type**: string
- **Purpose**: Override the session's default model for this agent.
- **Example**: `claude-sonnet-4-20250514`
- **Note**: Use `inherit` to explicitly use the session model.

### `maxTurns`

- **Type**: integer
- **Purpose**: Maximum number of conversation turns before the agent stops automatically.
- **Default**: Unlimited (but practically limited by context window).
- **Best practice**: Set to `(skills * 4) + complexity_bonus + (interaction_points * 2)`, rounded up to nearest 5.

### `skills`

- **Type**: list of strings
- **Purpose**: Explicit list of skills this agent can invoke.
- **Example**: `[validate-structure, validate-manifest, generate-report]`

### `memory`

- **Type**: object
- **Purpose**: Configuration for cross-session memory/state.
- **Note**: Limited functionality in plugin subagents.

### `background`

- **Type**: string
- **Purpose**: Background context loaded when the agent activates. Can reference files.
- **Example**: `"See references/plugin-spec.md for the official specification."`

### `isolation`

- **Type**: boolean
- **Default**: false
- **Purpose**: When true, the agent runs in an isolated context separate from the main conversation.

---

## FORBIDDEN Fields for Plugin Subagents

These fields are supported by top-level agents but CANNOT be used in plugin subagents:

| Field | Why Forbidden |
|-------|--------------|
| `hooks` | Plugin agents cannot define lifecycle hooks. Use the plugin's `hooks.json` instead. |
| `mcpServers` | Plugin agents cannot start or manage MCP server connections. |
| `permissionMode` | Plugin agents cannot override the session's permission model (too dangerous in a sandboxed plugin). |

Using these fields will cause:
- **hooks**: Silent failure (hooks are ignored).
- **mcpServers**: Runtime error when attempting to connect.
- **permissionMode**: Ignored; session permission mode applies.

---

## Field Interaction Rules

1. `tools` overrides `disallowedTools` if both are present (blocklist is ignored).
2. Skill-level `allowed-tools` further restricts the agent's tool access for that specific skill.
3. `model` at the skill level overrides the agent's `model` for that skill only.
4. `maxTurns` counts each assistant response as one turn.

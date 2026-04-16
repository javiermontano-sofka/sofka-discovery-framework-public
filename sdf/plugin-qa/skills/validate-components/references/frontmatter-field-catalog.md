# Component Frontmatter Field Catalog

> Required, recommended, and forbidden fields for skills, agents, and commands.

## Skill Frontmatter (SKILL.md)

| Field | Status | Type | Description |
|-------|--------|------|-------------|
| `name` | Recommended | string | Skill identifier (derived from directory name if absent) |
| `description` | Recommended | string | Trigger description with keywords |
| `author` | Optional | string | Creator attribution |
| `allowed-tools` | Optional | string[] (YAML list) | Tools the skill can use |
| `argument-hint` | Optional | string | Hint for user arguments |

> Note: Per official spec, skill frontmatter fields are all optional. The runtime derives `name` from the directory name if not specified. However, `name` and `description` are strongly recommended for discoverability.

## Agent Frontmatter (agents/*.md)

| Field | Status | Type | Description |
|-------|--------|------|-------------|
| `name` | Recommended | string | Agent identifier (derived from filename if absent) |
| `description` | Recommended | string | Role and trigger description |
| `tools` | Optional | string[] (YAML list) | Tools the agent can use |

### Forbidden Agent Fields (Subagent Constraint)

These fields cause runtime errors or silent overrides in plugin agents:

| Field | Reason |
|-------|--------|
| `hooks` | Subagents cannot define their own hooks |
| `mcpServers` | Subagents cannot declare MCP connections |
| `permissionMode` | Subagents inherit host permission model |

## Command Frontmatter (commands/*.md)

| Field | Status | Type | Description |
|-------|--------|------|-------------|
| `description` | REQUIRED | string | What the command does |
| `user-invocable` | REQUIRED | boolean | Must be `true` for slash commands |
| `alias-of` | Required (aliases) | string | Points to canonical command |

## Severity Classification

| Condition | Severity |
|-----------|----------|
| Missing recommended field (name, description) | INFO |
| Forbidden field in agent (hooks, mcpServers, permissionMode) | CRITICAL |
| Alias without `alias-of` | WARNING |
| Invalid YAML in frontmatter | CRITICAL |
| Command missing `description` or `user-invocable` | WARNING |

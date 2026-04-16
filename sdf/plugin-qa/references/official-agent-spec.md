# Official Agent Specification Digest

> Source: Claude Code official documentation
> Scope: Agent frontmatter, plugin constraints, built-in types, scope priority

---

## 1. Agent Structure

An agent is a YAML-frontmattered Markdown file (typically `AGENT.md` or named `.md` files in an `agents/` directory). The body becomes the agent's system prompt.

```
agents/
  my-agent.md           # Agent definition
  another-agent.md
```

---

## 2. Frontmatter Fields

| Field | Required | Type | Default | Notes |
|-------|----------|------|---------|-------|
| `name` | YES | string | — | Display name and invocation identifier |
| `description` | YES | string | — | Purpose summary; used for routing decisions |
| `tools` | no | array[string] | all | Tool allowlist. Only these tools are available. |
| `disallowedTools` | no | array[string] | none | Tool denylist. These tools are blocked. |
| `model` | no | string | `"inherit"` | `sonnet`, `opus`, `haiku`, full model ID, or `"inherit"` (uses caller's model). |
| `permissionMode` | no | string | `"default"` | See permission modes table below. |
| `maxTurns` | no | integer | unlimited | Max tool-use turns before forced stop. |
| `skills` | no | array[string] | none | Skill names to preload into agent context. |
| `mcpServers` | no | object or string | none | Inline MCP server config or reference to external config. |
| `hooks` | no | object | none | Lifecycle hooks scoped to this agent. |
| `memory` | no | string | none | Persistent memory scope. See memory table. |
| `background` | no | boolean | false | `true` = always run as a background task. |
| `isolation` | no | string | none | `"worktree"` = run in a temporary git worktree. |

---

## 3. Permission Modes

| Mode | Behavior |
|------|----------|
| `default` | Normal permission prompts for file writes, bash, etc. |
| `acceptEdits` | Auto-accept file edits; still prompt for bash and other tools. |
| `dontAsk` | Auto-accept all tool uses without prompting. |
| `bypassPermissions` | Skip all permission checks entirely. |
| `plan` | Read-only mode. No writes, no bash execution. |

---

## 4. Memory Scopes

| Value | Directory | Persistence |
|-------|-----------|-------------|
| `"user"` | `~/.claude/agent-memory/` | Across all projects for this user |
| `"project"` | `.claude/agent-memory/` | This project (committed to repo) |
| `"local"` | `.claude/agent-memory-local/` | This project (gitignored) |

Memory files are read/written by the agent between sessions to maintain state.

---

## 5. Plugin Subagent Constraints

**CRITICAL**: Agents defined inside plugins have restricted capabilities.

### Supported Fields (Plugin Subagents)

| Field | Supported |
|-------|-----------|
| `name` | YES |
| `description` | YES |
| `tools` | YES |
| `disallowedTools` | YES |
| `model` | YES |
| `maxTurns` | YES |
| `skills` | YES |
| `memory` | YES |
| `background` | YES |
| `isolation` | YES |

### NOT Supported in Plugin Subagents

| Field | Status | Reason |
|-------|--------|--------|
| `hooks` | BLOCKED | Security — plugins cannot define lifecycle hooks on agents |
| `mcpServers` | BLOCKED | Security — plugins cannot configure MCP servers on agents |
| `permissionMode` | BLOCKED | Security — plugins cannot escalate permissions |

---

## 6. Agent Body

- The Markdown body becomes the agent's **system prompt**
- This is NOT the full Claude Code system prompt — it replaces it
- The body should contain complete instructions for the agent's task
- Keep it focused and self-contained since the agent has no other system context
- String substitutions (`$ARGUMENTS`, `${CLAUDE_SESSION_ID}`, etc.) work in the body

---

## 7. Agent Behavior Rules

- **Subagents cannot spawn other subagents** (no recursive delegation)
- Agents run in a forked context by default (separate from the main conversation)
- The parent sees a summary of the agent's work when it completes
- Agents inherit the caller's model unless `model` is explicitly set
- `maxTurns` prevents runaway agents — set appropriate limits for the task

---

## 8. Built-in Agent Types

| Type | Model | Tools | Purpose |
|------|-------|-------|---------|
| **Explore** | Haiku | Read-only (Read, Glob, Grep) | Fast codebase exploration and analysis |
| **Plan** | Inherited | Read-only (Read, Glob, Grep) | Planning and architecture, no modifications |
| **General-purpose** | Inherited | All tools | Full capability agent for any task |

Built-in types are available without explicit definition. Custom agents extend or replace these.

---

## 9. Scope Priority

Resolution order (highest priority wins):

1. **CLI flag** — `--agents ./path/` (development override)
2. **Project** — `.claude/agents/`
3. **Personal** — `~/.claude/agents/`
4. **Plugin** — namespaced as `plugin-name:agent-name`

---

## 10. Invocation

Agents are invoked via the `Agent` tool or from skill frontmatter:

```yaml
# In a skill's SKILL.md frontmatter
context: fork
agent: my-custom-agent
```

Or programmatically by Claude when it determines delegation is appropriate.

---

## 11. MCP Server Configuration

For non-plugin agents, `mcpServers` can be:

**Inline object:**
```yaml
mcpServers:
  my-server:
    command: "npx"
    args: ["-y", "@my/mcp-server"]
```

**String reference** to an external config file:
```yaml
mcpServers: "./mcp-config.json"
```

---

## 12. Isolation: Worktree Mode

```yaml
isolation: worktree
```

- Creates a temporary git worktree for the agent's work
- Changes are isolated from the main working tree
- Worktree is cleaned up when the agent completes
- Useful for parallel tasks or experimental changes
- Requires the project to be a git repository

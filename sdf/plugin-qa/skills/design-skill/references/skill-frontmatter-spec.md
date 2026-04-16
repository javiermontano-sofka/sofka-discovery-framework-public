# Skill Frontmatter Specification

> Complete field catalog for Claude Code plugin skill frontmatter (SKILL.md).
> Source: Official Claude Code plugin documentation.

---

## Required Fields

### `name`

- **Type**: string
- **Format**: kebab-case (`^[a-z][a-z0-9]*(-[a-z0-9]+)*$`)
- **Purpose**: Unique identifier for the skill within the plugin.
- **Example**: `validate-structure`
- **Notes**: Must match the directory name containing the SKILL.md.

### `description`

- **Type**: string (single-line or multi-line with `>`)
- **Purpose**: Describes what the skill does and when to invoke it. Include trigger phrases for natural language matching.
- **Example**:
  ```yaml
  description: >
    Validate plugin directory layout against the official spec.
    Trigger: validate structure, check layout, directory audit.
  ```
- **Best practice**: Include 3-5 trigger phrases after the description.

---

## Optional Fields

### `argument-hint`

- **Type**: string
- **Purpose**: Shows users what arguments the skill expects. Displayed in help text.
- **Substitutions**:
  - `$ARGUMENTS` -- The full argument string passed by the user.
  - `$1`, `$2`, ..., `$N` -- Positional arguments (space-separated).
  - `${CLAUDE_SKILL_DIR}` -- Absolute path to the skill's directory at runtime.
- **Example**: `"<plugin-path> [--verbose]"`

### `disable-model-invocation`

- **Type**: boolean
- **Default**: `false`
- **Purpose**: When `true`, the model cannot auto-invoke this skill based on conversation context. The skill can only be invoked explicitly via command or by another skill/agent.
- **Use when**: The skill has side effects that should not trigger accidentally.

### `user-invocable`

- **Type**: boolean
- **Default**: `true`
- **Purpose**: When `false`, the skill cannot be invoked directly by the user. Only agents or other skills can invoke it.
- **Use when**: The skill is an internal building block, not a user-facing operation.

### `allowed-tools`

- **Type**: list of strings
- **Purpose**: Whitelist of tools the skill may use during execution. Any tool not listed is blocked.
- **Available tools**: `Read`, `Write`, `Glob`, `Grep`, `Bash`, `Edit`, `WebFetch`, `WebSearch`, and any MCP tools.
- **Best practice**: Apply least privilege. Read-only skills should not include `Write`.
- **Example**:
  ```yaml
  allowed-tools:
    - Read
    - Glob
    - Grep
  ```

### `model`

- **Type**: string
- **Purpose**: Override the default model for this skill.
- **Use when**: The skill requires specific reasoning capabilities.
- **Example**: `model: claude-sonnet-4-20250514`
- **Note**: Use `inherit` to use the session's current model.

### `context`

- **Type**: list of objects
- **Purpose**: Additional files to load into context when the skill executes.
- **Object fields**: `type` (string), `path` (string relative to skill dir).
- **Example**:
  ```yaml
  context:
    - type: file
      path: references/spec.md
  ```

### `agent`

- **Type**: string
- **Purpose**: Override which agent handles this skill's execution.
- **Use when**: The skill needs a specialized agent different from the plugin's default.

### `hooks`

- **Type**: object
- **Purpose**: Skill-level hook definitions that apply only during this skill's execution.
- **Note**: Follows the same schema as plugin-level hooks.json.

---

## Field Interaction Rules

1. If `disable-model-invocation: true` AND `user-invocable: false`, the skill can only be invoked by agents or other skills.
2. `allowed-tools` takes precedence over agent-level tool definitions for this skill.
3. `model` overrides the agent's model setting for this skill only.
4. `context` files are loaded in addition to (not replacing) plugin-level context.

---

## Common Mistakes

| Mistake | Impact | Fix |
|---------|--------|-----|
| `name` does not match directory name | Skill not found at runtime | Rename directory or name field |
| `description` missing trigger phrases | Poor natural language matching | Add 3-5 trigger phrases |
| `allowed-tools` includes Write for read-only skill | Violates least privilege | Remove Write |
| `argument-hint` uses `$0` | `$0` is not a valid substitution | Use `$1` for first argument |

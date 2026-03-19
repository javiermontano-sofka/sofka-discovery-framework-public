# Skill Frontmatter Field Catalog

Complete reference of all official SKILL.md frontmatter fields for Claude Code plugins. Use this when generating or validating skill frontmatter.

---

## Required Fields

### `name`
- **Type**: string
- **Format**: kebab-case (`^[a-z][a-z0-9]*(-[a-z0-9]+)*$`)
- **Purpose**: Unique identifier for the skill within the plugin.
- **Example**: `validate-structure`

### `description`
- **Type**: string (multi-line with `>` for YAML folding)
- **Format**: 1-3 sentences describing what the skill does, ending with trigger phrases prefixed by "Trigger:".
- **Purpose**: Used by the LLM to decide when to invoke the skill. Also serves as documentation.
- **Example**:
  ```yaml
  description: >
    Validates plugin directory layout against the official spec.
    Trigger: validate structure, check layout, directory audit.
  ```

---

## Recommended Fields

### `author`
- **Type**: string
- **Default**: Plugin author from plugin.json
- **Purpose**: Attribution for the skill creator.
- **Example**: `JM Labs (Javier Montano)`

### `argument-hint`
- **Type**: string
- **Purpose**: Tells the LLM what argument(s) the skill expects. Displayed in help and autocomplete.
- **Format**: Use angle brackets for required args, square brackets for optional.
- **Example**: `"<plugin-path> [--verbose]"`

### `allowed-tools`
- **Type**: list of strings
- **Purpose**: Restricts which tools the skill may use during execution. If omitted, all tools are available.
- **Example**:
  ```yaml
  allowed-tools:
    - Read
    - Glob
    - Grep
    - Bash
  ```

---

## Optional Fields

### `disable-model-invocation`
- **Type**: boolean
- **Default**: `false`
- **Purpose**: When `true`, prevents the skill from being auto-invoked by the model. The skill can only be triggered by explicit command or agent delegation.
- **Use when**: The skill has side effects (file writes, API calls) and should not run without user intent.

### `user-invocable`
- **Type**: boolean
- **Default**: `true`
- **Purpose**: When `false`, the skill cannot be invoked directly by the user. It can only be called by agents or other skills.
- **Use when**: The skill is an internal building block not meant for direct use.

### `model`
- **Type**: string
- **Default**: Inherits from agent or system default.
- **Purpose**: Override the model used for this skill.
- **Values**: `inherit`, or a specific model identifier.
- **Example**: `model: inherit`

### `context`
- **Type**: list of objects
- **Purpose**: Attach files or URLs as context when the skill runs.
- **Format**:
  ```yaml
  context:
    - type: file
      path: references/spec-table.md
    - type: url
      url: https://example.com/docs
  ```

### `agent`
- **Type**: string
- **Purpose**: Assign this skill to a specific agent. The skill will only be available when that agent is active.
- **Example**: `agent: plugin-qa-engineer`

### `hooks`
- **Type**: object
- **Purpose**: Define lifecycle hooks for the skill (pre-run, post-run).
- **Note**: Rarely used at skill level. More common at plugin level in hooks/hooks.json.

---

## Field Validation Rules

| Field | Required | Kebab-case | Max Length | Notes |
|-------|----------|------------|-----------|-------|
| `name` | Yes | Yes | 50 chars | Must match directory name |
| `description` | Yes | N/A | 500 chars | End with Trigger: phrases |
| `author` | No | N/A | 100 chars | |
| `argument-hint` | No | N/A | 200 chars | Use `<>` for required, `[]` for optional |
| `allowed-tools` | No | N/A | N/A | List of valid tool names |
| `disable-model-invocation` | No | N/A | N/A | Boolean |
| `user-invocable` | No | N/A | N/A | Boolean |
| `model` | No | N/A | N/A | `inherit` or model ID |

---

## Frontmatter Template

```yaml
---
name: {skill-name}
author: {author}
description: >
  {1-3 sentence description of what the skill does.}
  Trigger: {trigger phrase 1}, {trigger phrase 2}, {trigger phrase 3}.
argument-hint: "{argument description}"
allowed-tools:
  - Read
  - Write
  - Glob
  - Grep
  - Bash
---
```

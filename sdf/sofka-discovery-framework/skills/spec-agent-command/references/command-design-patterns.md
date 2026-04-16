# Command Design Patterns

Reference for canonical + alias command patterns, frontmatter fields, and naming conventions used in Claude Code plugins.

---

## Canonical + Alias Pattern

Every user-facing command has two forms:

1. **Canonical** -- The full command name (e.g., `validate.md`). Contains the complete command definition: frontmatter, usage, execution flow, output description.
2. **Alias** -- The short form (e.g., `v.md`). Contains minimal frontmatter with `alias-of` pointing to the canonical. Body is a one-line reference.

### Why Aliases?

- Power users prefer short forms (`/pqa:v` vs `/pqa:validate`).
- The canonical file is the source of truth. Aliases avoid content duplication.
- When the canonical changes, aliases automatically reflect the update (the LLM reads the canonical via `alias-of`).

---

## Command Frontmatter Fields

### Canonical Command

```yaml
---
description: "One-sentence description of what the command does."
user-invocable: true
argument-hint: "<required-arg> [optional-arg]"
---
```

| Field | Required | Type | Notes |
|-------|----------|------|-------|
| `description` | Yes | string | 1 sentence, imperative voice |
| `user-invocable` | Yes | boolean | Always `true` for commands |
| `argument-hint` | No | string | `<>` required, `[]` optional |

### Alias Command

```yaml
---
alias-of: canonical-command-name
description: "Same description as canonical."
user-invocable: true
---
```

| Field | Required | Type | Notes |
|-------|----------|------|-------|
| `alias-of` | Yes | string | Canonical command name (no prefix, no `.md`) |
| `description` | Yes | string | Must match canonical description |
| `user-invocable` | Yes | boolean | Always `true` |

---

## Naming Conventions

### Commands

- File name: `{command-name}.md` -- kebab-case.
- Alias file name: typically 1-2 characters (`v.md`, `a.md`, `f.md`).
- Avoid alias collisions within the same plugin.
- Command names should be verbs or verb phrases: `validate`, `build`, `spec`, `audit`.

### Agents

- File name: `{agent-name}.md` -- kebab-case.
- Agent names should describe the role: `plugin-qa-engineer`, `plugin-spec-writer`.
- Prefix with `plugin-` if the agent is specific to a plugin's domain.

### Skills

- Directory name: `{skill-name}/` -- kebab-case.
- Skill names should be verb-noun pairs: `validate-structure`, `spec-skill-moat`, `build-plugin-scaffold`.
- Avoid generic names like `process`, `handle`, `run`.

---

## Execution Flow Notation

Use indented arrows for sequential flows:

```
skill-a
  -> skill-b
    -> skill-c
```

Use parallel notation for concurrent skills:

```
skill-a
  -> [parallel]
    - skill-b
    - skill-c
  -> skill-d (after both complete)
```

Use conditional notation for branches:

```
skill-a
  -> [if condition X] skill-b
  -> [if condition Y] skill-c
  -> skill-d (always)
```

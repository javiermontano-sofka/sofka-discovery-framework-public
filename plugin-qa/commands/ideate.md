---
description: "Brainstorm a new plugin concept or component. Routes to ideate-plugin or ideate-component based on arguments."
user-invocable: true
---

# /pqa:ideate

Brainstorm a new plugin concept or individual component. This is the entry point for the IDEATE movement.

## Usage

```
/pqa:ideate <plugin-idea>           # Ideate a full plugin
/pqa:ideate component <type> [path] # Ideate a specific component
```

## Routing

- If the first argument is `component`, `skill`, `agent`, `command`, or `hook`: run `ideate-component`.
- Otherwise: run `ideate-plugin` with the full argument as the idea/problem statement.

## Examples

```
/pqa:ideate "A plugin for linting Dockerfiles and CI configs"
/pqa:ideate component skill ./plugins/plugin-qa
/pqa:ideate skill ./plugins/devops-toolkit
```

## Output

- Plugin concept brief (for plugin ideation)
- Component concept card (for component ideation)
- No files are written -- output is presented for review only.

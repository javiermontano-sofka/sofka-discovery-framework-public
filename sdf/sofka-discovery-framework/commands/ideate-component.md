---
description: "Brainstorm an individual plugin component (skill, agent, command, hook). Runs ideate-component skill directly."
user-invocable: true
---

# /pqa:ideate-component

Brainstorm an individual plugin component. Runs the `ideate-component` skill directly, skipping the routing logic of `/pqa:ideate`.

## Usage

```
/pqa:ideate-component <type> [plugin-path]
```

- `type` -- One of: `skill`, `agent`, `command`, `hook`.
- `plugin-path` -- Optional path to an existing plugin for context.

## Examples

```
/pqa:ideate-component skill ./plugins/plugin-qa
/pqa:ideate-component agent ./plugins/devops-toolkit
/pqa:ideate-component hook
```

## Output

- Component concept card with name, responsibility, relationships, MOAT depth.
- No files are written -- output is for review only.

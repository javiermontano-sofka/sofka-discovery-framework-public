---
description: "Scaffold a complete plugin directory from architecture plans and specs."
user-invocable: true
argument-hint: "<architecture-plan-path> <target-directory>"
---

# Build

## Usage

```
/pqa:build <architecture-plan-path> <target-directory>
```

## Execution Flow

1. Read the architecture plan and all referenced spec files.
2. Invoke `build-plugin-scaffold` via the `plugin-builder-agent`.
3. Create the complete plugin directory structure.
4. Write all files: plugin.json, agents, commands, skills, hooks, settings, CLAUDE.md, README.md, LICENSE.
5. Run `validate-structure` as a smoke test.
6. Output a build report with file counts, line counts, and validation results.

## Output

A fully scaffolded plugin directory at `<target-directory>` containing all files defined in the architecture plan. Includes a build report summarizing files created and validation results.

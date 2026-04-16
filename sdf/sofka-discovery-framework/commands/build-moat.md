---
description: "Create MOAT directory structures and populate asset files for plugin skills."
user-invocable: true
argument-hint: "<spec-package-path> <target-plugin-path>"
---

# Build MOAT

## Usage

```
/pqa:build-moat <spec-package-path> <target-plugin-path>
```

## Execution Flow

1. Read the spec package containing SKILL.md content and MOAT asset definitions.
2. Invoke `build-moat-assets` via the `plugin-builder-agent`.
3. Create skill directories under `<target-plugin-path>/skills/`.
4. Write SKILL.md files and populate MOAT subdirectories (references/, examples/, prompts/, scripts/, assets/).
5. Set executable permissions on script files.
6. Verify all files were created successfully.
7. Output a creation summary with file counts and line totals.

## Output

MOAT directory structures created and populated under the target plugin's `skills/` directory. Includes a summary table of files created per skill.

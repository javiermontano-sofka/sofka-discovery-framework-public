# How to author a new `/sdf:*` slash command

**When you need this**: A recurring user-invoked workflow needs a first-class command surface.

**Prerequisites**: Understand what agents/skills the command composes.

**Time**: 30-60 min.

## Steps

1. Create `sdf/commands/<slug>.md`:

   ```yaml
   ---
   name: <slug>
   description: "<User-facing one-liner>"
   argument-hint: "<optional arg pattern>"
   ---

   # /sdf:<slug>

   <instructions to Claude for how to execute this command>

   ## Workflow

   1. ...
   2. ...

   ## Output

   <describe the expected output>
   ```

2. Keep the body executable: the user types the command; Claude reads this file; the file is the agent prompt.

3. Verify prefix convention:

   ```bash
   bash sdf/scripts/audit-command-prefixes.sh
   ```

   Every SDF command must start with `/sdf:` (or be a documented alias).

## Verification

- File exists at `sdf/commands/<slug>.md`.
- `audit-command-prefixes.sh` passes.
- Invoking `/sdf:<slug>` in Claude Code surfaces the command.

## Common pitfalls

- Missing `---` frontmatter → command metadata not parsed.
- Overlapping slug with existing command → only one fires.
- Command doing too much — if it's a whole pipeline, use `/sdf:run-*` pattern.

## See also

- [`references/ontology/commands-reference.md`](../../references/ontology/commands-reference.md)
- `sdf/scripts/audit-command-prefixes.sh`

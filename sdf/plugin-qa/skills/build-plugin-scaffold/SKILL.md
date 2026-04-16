---
name: build-plugin-scaffold
author: JM Labs (Javier Montaño)
description: >
  Scaffold a complete plugin directory from architecture plans and specs. Creates all files, then validates structure.
  Trigger: build plugin, scaffold plugin, create plugin directory, assemble plugin, generate plugin files.
argument-hint: "<architecture-plan-path> <target-directory>"
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Build Plugin Scaffold

> "A scaffold is not the building -- it is the promise that a building will stand."

Assembles a complete Claude Code plugin directory from architecture plans and specification packages. Creates all structural files (plugin.json, settings.json, hooks.json), writes agent and command files from specs, generates documentation (CLAUDE.md, README.md), copies the LICENSE, and runs a validation smoke test.

---

## Procedure

### Step 1 -- Read Architecture Plan and Spec Files

- Read the architecture plan at `<architecture-plan-path>`. `[Read]`
- Extract: plugin name, version, description, author, license, agent list, skill list, command list, hook definitions, and default agent.
- Read all spec files referenced in the plan. `[Read]`
- If any referenced spec file is missing, halt and report which files are absent.

### Step 2 -- Check Target Directory

- Check if `<target-directory>` already exists. `[Glob]`
- If it exists:
  - List its contents.
  - Warn the user: "Target directory exists with {N} files. Overwrite?"
  - Wait for user confirmation before proceeding.
- If it does not exist, proceed to creation.

### Step 3 -- Create Plugin Root Directory

- Create the target directory. `[Bash]`
- Create standard subdirectories: `skills/`, `commands/`, `agents/`, `hooks/`.
- Verify all directories were created. `[Glob]`

### Step 4 -- Create .claude-plugin/ with plugin.json

- Create `.claude-plugin/` directory. `[Bash]`
- Write `plugin.json` from the architecture plan data, using `assets/plugin-json-template.json` from `build-moat-assets` as the base template. `[Write]`
- Replace all `{placeholder}` values with actual data from the plan.
- Validate the JSON is well-formed. `[Bash]`

### Step 5 -- Write Agent Files from Specs

- For each agent in the spec package:
  - Write the agent `.md` file to `agents/{agent-name}.md`. `[Write]`
  - Verify the file contains valid YAML frontmatter.
- Report each agent file created with its path.

### Step 6 -- Write Command Files from Specs

- For each command in the spec package:
  - Write the canonical command `.md` to `commands/{command-name}.md`. `[Write]`
  - Write each alias `.md` to `commands/{alias-name}.md`. `[Write]`
  - Verify each alias has a valid `alias-of` field pointing to its canonical.
- Report each command file created.

### Step 7 -- Write hooks/hooks.json

- Read the hook definitions from the architecture plan.
- Write `hooks/hooks.json` with the hook configuration object (keyed by event name). `[Write]`
- If no hooks are defined, write the minimal template: `{"hooks": {}}`.
- Validate JSON structure. `[Bash]`

### Step 8 -- Write settings.json

- Write `settings.json` at the plugin root with the default agent from the architecture plan. `[Write]`
- Format: `{"agent": "{default-agent-name}"}`.

### Step 9 -- Generate CLAUDE.md

- Generate the plugin's CLAUDE.md using `assets/claude-md-template.md` as the base. `[Write]`
- Populate sections:
  - **Quick Start**: List the most common commands with brief descriptions.
  - **Architecture**: Plugin name, version, agent count, skill count, command count.
  - **Skills Table**: All skills with movement, purpose columns.
  - **Commands Table**: All commands with alias and description columns.
  - **Execution Flows**: Major workflows from the architecture plan.
  - **Finding Severity Classification**: If applicable to the plugin domain.
- Keep CLAUDE.md focused and navigable -- it is the entry point for users and LLMs.

### Step 10 -- Generate README.md

- Generate README.md using `assets/readme-template.md` as the base. `[Write]`
- Include: installation instructions, usage examples, commands reference, contributing guidelines placeholder.

### Step 11 -- Copy LICENSE

- Write the LICENSE file using `assets/license-template.md` as the base. `[Write]`
- Replace `{year}` with the current year and `{author}` with the plugin author.

### Step 12 -- Run Validate-Structure Smoke Test

- Invoke `validate-structure` against the newly created plugin directory.
- This checks: `.claude-plugin/plugin.json` exists, required directories exist, naming conventions, file layout.
- Report the validation results.
- If any CRITICAL findings, flag them for immediate attention.

### Step 13 -- Report Results

Output a comprehensive build report:

```
## Build Report: {plugin-name}

| Category | Count |
|----------|-------|
| Agents | {N} |
| Skills | {N} |
| Commands (canonical) | {N} |
| Commands (aliases) | {N} |
| Total files created | {N} |

### Validation Results
{smoke test summary}

### Files Created
{full file list with line counts}
```

---

## Quality Criteria

- [ ] The scaffolded plugin passes `validate-structure` with zero CRITICAL findings.
- [ ] Every file in the architecture plan is present in the built directory.
- [ ] All JSON files (plugin.json, hooks.json, settings.json) are valid JSON.
- [ ] All command aliases correctly reference their canonical commands.
- [ ] CLAUDE.md contains accurate skill and command tables matching the actual files on disk.
- [ ] README.md contains installation instructions and a commands reference.

## Assumptions & Limits

- Destructive by design (with consent). Creates directories and files on disk. Requires user confirmation before overwriting existing directories.
- Depends on architecture plan and spec packages being complete and consistent. If upstream specs have errors, the scaffold will reproduce them faithfully.
- The validate-structure smoke test (Step 12) catches structural issues but does not validate content quality. Use `audit-content-quality` for that.
- Template files (`assets/*-template.*`) are expected to exist in the `build-moat-assets` skill directory. If templates are missing, the skill will generate defaults but with less polish.
- Cannot create git repositories or initialize version control -- that is the user's responsibility after scaffolding.

## Good vs Bad

**Bad build report:**
```
Plugin created at /path/to/plugin.
```
Missing: no file counts, no validation results, no file list.

**Good build report:**
```
## Build Report: my-plugin

| Category | Count |
|----------|-------|
| Agents | 2 |
| Skills | 8 |
| Commands (canonical) | 10 |
| Commands (aliases) | 5 |
| Total files created | 32 |

### Validation Results
validate-structure: PASS (0 CRITICAL, 0 WARNING, 1 INFO)

### Files Created
agents/code-analyzer.md (45 lines)
agents/report-generator.md (38 lines)
commands/validate.md (12 lines)
...
```
Includes: category counts, validation summary, per-file list with line counts.

## Anti-Patterns

1. **Silent overwrite** -- Never replace an existing plugin directory without explicit user confirmation. Data loss from overwriting is unrecoverable.
2. **Partial scaffold left on disk** -- If a critical step fails (e.g., plugin.json write fails), do not leave a half-built plugin. Either complete the build or clean up the partial directory.
3. **Hardcoded paths** -- All paths in generated files must be relative to the plugin root. Absolute paths break portability.
4. **Stale CLAUDE.md** -- The CLAUDE.md must reflect the actual files on disk, not the plan. If a spec file was skipped, the CLAUDE.md tables must exclude it.

## Edge Cases

1. **Architecture plan with zero hooks** -- Valid. Write `hooks/hooks.json` with empty hooks object: `{"hooks": {}}`. Do not skip the hooks directory.
2. **Single-agent plugin** -- Valid. The agent is both the default and only agent. settings.json points to it. CLAUDE.md agent section shows one entry.
3. **Plugin with skills but no commands** -- Unusual but valid. Skip the commands section in CLAUDE.md. Still create an empty `commands/` directory per spec requirements.

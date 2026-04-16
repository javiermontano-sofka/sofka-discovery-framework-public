---
name: build-moat-assets
author: JM Labs (Javier Montaño)
description: >
  Create MOAT directory structures and populate asset files (references/, examples/, prompts/, scripts/, assets/) for plugin skills.
  Trigger: build MOAT assets, create skill assets, populate references, generate examples, build skill directories.
argument-hint: "<spec-package-path> <target-plugin-path>"
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Build MOAT Assets

> "Structure without content is an empty house; content without structure is a pile of bricks."

Creates MOAT directory structures for plugin skills and populates them with asset files from spec packages. Handles the physical disk operations that turn specification content into a living skill directory with references, examples, prompts, scripts, and static assets.

---

## Procedure

### Step 1 -- Read MOAT Strategy and Spec Package

- Read the spec package at `<spec-package-path>`. `[Read]`
- Extract the list of skills to build, each skill's SKILL.md content, and the MOAT asset file contents (references, examples, prompts, scripts, assets).
- If the spec package is missing SKILL.md content for any skill, halt and report the gap.

### Step 2 -- Verify Target Plugin Path

- Confirm `<target-plugin-path>` exists and contains a `skills/` directory. `[Glob]`
- If the `skills/` directory does not exist, create it. `[Bash]`
- List existing skill directories to detect potential name collisions.

### Step 3 -- Create Skill Directories

- For each skill in the spec package, create `skills/{skill-name}/`. `[Bash]`
- If the directory already exists, list its contents and warn the user. Do not overwrite without confirmation.
- Use the MOAT directory generation script when available: `scripts/generate-moat-dirs.sh`. `[Bash]`

### Step 4 -- Write SKILL.md Files

- For each skill, write the SKILL.md content from the spec package into `skills/{skill-name}/SKILL.md`. `[Write]`
- Verify the written file is non-empty by checking its existence and line count. `[Glob]`

### Step 5 -- Create MOAT Subdirectories Per Strategy

For each skill, create only the subdirectories that have content:

- `references/` -- If reference files exist in the spec.
- `examples/` -- If example files exist in the spec.
- `prompts/` -- If prompt files exist in the spec.
- `scripts/` -- If script files exist in the spec.
- `assets/` -- If template/static files exist in the spec.

Do NOT create empty subdirectories. `[Bash]`

### Step 6 -- Write Content Files

For each MOAT subdirectory with content:

- Write each file from the spec package into the appropriate subdirectory. `[Write]`
- Preserve the file names from the spec package.
- For markdown files: verify they start with an H1 title.
- For JSON files: verify they are valid JSON. `[Bash]`

### Step 7 -- Handle Script Files

For any files in `scripts/`:

- Verify or add the appropriate shebang line:
  - `.sh` files: `#!/bin/bash`
  - `.py` files: `#!/usr/bin/env python3`
  - `.js` files: `#!/usr/bin/env node`
- Set executable permissions: `chmod +x`. `[Bash]`
- Verify the permission was set correctly.

### Step 8 -- Write Template and Asset Files

For files in `assets/`:

- Write template files preserving placeholder markers (e.g., `{plugin-name}`, `{author}`).
- For JSON templates: verify valid JSON structure after writing.
- For markdown templates: verify they contain the expected section headers.

### Step 9 -- Verify All Files

- Use `[Glob]` to list all files created under each skill directory.
- Compare the list against the spec package's expected file manifest.
- Report any missing files as `CRITICAL`.
- Report any extra files as `INFO` (may be pre-existing).

### Step 10 -- Report Creation Summary

Output a summary table:

```
| Skill | Files Created | Total Lines | MOAT Dirs |
|-------|--------------|-------------|-----------|
| {name} | {count} | {lines} | {dirs} |
```

Include:
- Total skills processed.
- Total files created.
- Total lines written.
- Any warnings or errors encountered.

---

## Quality Criteria

- [ ] Every skill directory contains a non-empty SKILL.md file.
- [ ] No empty MOAT subdirectories are created.
- [ ] All script files have correct shebangs and executable permissions.
- [ ] All JSON files are valid JSON.
- [ ] The creation summary accounts for every file in the spec package.
- [ ] Pre-existing directories are never silently overwritten.

## Assumptions & Limits

- Destructive by design (with consent for overwrites). Creates directories and files on disk. Will not overwrite existing skill directories without explicit user confirmation.
- Depends on spec packages being complete. If a spec package is missing MOAT asset content, those subdirectories are skipped (not created empty).
- The `generate-moat-dirs.sh` script (Step 3) is optional. If not available, directories are created directly via Bash `mkdir -p`.
- File verification (Step 9) checks existence and non-emptiness only. It does not validate content quality -- that is `audit-content-quality`'s job.
- Windows line ending detection (Edge Case 3) is best-effort. Files with mixed line endings may not be fully corrected.

## Good vs Bad

**Bad creation summary:**
```
Created 5 skill directories.
```
Missing: no file counts, no line counts, no MOAT directory details, no warnings.

**Good creation summary:**
```
| Skill | Files Created | Total Lines | MOAT Dirs |
|-------|--------------|-------------|-----------|
| validate-hooks | 4 | 210 | references/, examples/, prompts/ |
| validate-manifest | 3 | 145 | references/, examples/ |

Total: 2 skills, 7 files, 355 lines. 0 warnings, 0 errors.
```
Includes: per-skill breakdown, file counts, line counts, MOAT directories created, totals with error summary.

## Anti-Patterns

1. **Creating empty directories** -- Every MOAT subdirectory must have at least one file. If the spec has no content for a subdirectory, do not create it. Empty directories are noise.
2. **Forgetting chmod on scripts** -- A script without execute permission will fail silently when invoked. Always set permissions immediately after writing.
3. **Writing files without verification** -- Disk writes can fail (permissions, disk full, path issues). Always verify each file exists after writing.

## Edge Cases

1. **Spec package with a single skill and no MOAT assets** -- Create just the skill directory with SKILL.md. No subdirectories. Report as valid minimal build.
2. **Target path with existing skill of the same name** -- List the existing files, warn the user, and wait for confirmation. If confirmed, back up existing SKILL.md as `SKILL.md.bak` before overwriting.
3. **Script files with Windows line endings** -- Detect `\r\n` and convert to `\n` before writing. Shebangs fail with Windows line endings on Unix systems.

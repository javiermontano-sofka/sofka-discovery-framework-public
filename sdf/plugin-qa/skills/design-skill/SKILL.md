---
name: design-skill
author: JM Labs (Javier Montaño)
description: >
  Design a plugin skill in detail: frontmatter, procedure outline, quality criteria, anti-patterns, edge cases, tool selection.
  Trigger: design skill, skill design, create skill spec, plan skill, draft skill.
argument-hint: "<skill-name> [plugin-path]"
allowed-tools:
  - Read
  - Write
  - Glob
  - Grep
  - Bash
---

# Design Skill

> "A well-designed skill is a contract: it promises a procedure, guarantees quality criteria, and warns about anti-patterns."

Design a single plugin skill in full detail. Produces a complete SKILL.md specification with frontmatter, guiding principle, numbered procedure, quality criteria, anti-patterns, and edge cases. Validates against MOAT quality dimensions.

---

## Procedure

### Step 1 -- Receive Concept

- Read the skill's concept card, architecture plan entry, or user description.
- Extract: skill name, purpose, movement, owning agent, MOAT depth.
- If a plugin path is provided, read the existing plugin structure for context.
- Tag source: `[DOC]` for plan-derived info, `[STAKEHOLDER]` for user input.

### Step 2 -- Draft Frontmatter

Draft the complete YAML frontmatter using ALL official fields. The full field catalog:

| Field | Required | Type | Description |
|-------|----------|------|-------------|
| `name` | YES | string | kebab-case skill identifier |
| `description` | YES | string | Purpose + trigger phrases. Multi-line with `>` for long descriptions |
| `argument-hint` | no | string | Placeholder showing expected arguments. Supports `$ARGUMENTS`, `$1`, `$2`, `${CLAUDE_SKILL_DIR}` |
| `disable-model-invocation` | no | boolean | If true, skill cannot be auto-invoked by the model (default: false) |
| `user-invocable` | no | boolean | If true, user can invoke directly. If false, only agents/other skills can invoke |
| `allowed-tools` | no | list[string] | Whitelist of tools the skill may use. Enforces least privilege |
| `model` | no | string | Override model for this skill (e.g., `claude-sonnet-4-20250514`) |
| `context` | no | list[object] | Additional context files to load. Objects with `type` and `path` fields |
| `agent` | no | string | Override which agent handles this skill |
| `hooks` | no | object | Skill-level hook definitions (applies only during skill execution) |

**String substitutions** available in `argument-hint` and `description`:
- `$ARGUMENTS` -- Full argument string passed by the user.
- `$1`, `$2`, ..., `$N` -- Positional arguments.
- `${CLAUDE_SKILL_DIR}` -- Absolute path to the skill's directory at runtime.

Apply **least privilege**: include only tools the skill genuinely needs. Read-only skills must NOT include Write.

### Step 3 -- Design Procedure Steps

- Write 5-10 numbered procedure steps.
- Each step must have:
  - **Action verb** as the first word (Scan, Read, Validate, Generate, Produce).
  - **Input**: What data the step consumes.
  - **Output**: What the step produces.
  - **Evidence tag**: Which tag applies to the step's output.
- Steps must be ordered logically -- no forward references.
- Include conditional logic where relevant ("If X, then Y. Otherwise, Z.").

### Step 4 -- Write Quality Criteria

- Define 4-6 testable quality criteria.
- Each criterion must be:
  - **Observable**: Can be verified by reading the output.
  - **Measurable**: Has a clear pass/fail threshold.
  - **Tagged**: Includes an evidence tag indicating the verification method.
- Format: Numbered list. Each criterion is a single declarative sentence.
- Example: "Every finding references the exact file path relative to plugin root. `[CODIGO]`"

### Step 5 -- Identify Anti-Patterns

- List 4-6 anti-patterns specific to this skill.
- Each anti-pattern describes a mistake the skill should avoid.
- Focus on mistakes that are: common, non-obvious, and consequential.
- Format: Numbered list. Each item describes the mistake, not the correct behavior.

### Step 6 -- List Edge Cases

- Identify 3-5 edge cases the skill must handle.
- Each edge case describes an unusual but valid scenario.
- For each, specify the expected behavior.
- Focus on boundary conditions, empty inputs, conflicting requirements.

### Step 7 -- Select Allowed Tools (Least Privilege)

- Review the procedure steps to determine which tools are actually used.
- Apply the least privilege principle:
  - Read-only skills: `Read`, `Glob`, `Grep` (never Write).
  - Analysis skills: `Read`, `Glob`, `Grep`, `Bash`.
  - Generation skills: `Read`, `Write`, `Glob`, `Grep`.
  - Full-access skills: `Read`, `Write`, `Glob`, `Grep`, `Bash`.
- Document the rationale for each tool's inclusion. `[CONFIG]`

### Step 8 -- Compose the Guiding Principle

- Write a single-sentence quote for the top of the skill body.
- The quote should capture the skill's philosophy or core insight.
- Format: `> "Quote text here."`
- It should be original, specific to this skill, and memorable.

### Step 9 -- Validate Against MOAT Dimensions

- Score the designed skill against the four MOAT quality dimensions:
  - Completeness: Does the SKILL.md have all required sections?
  - Accuracy: Do references cite correct specs?
  - Actionability: Are procedure steps copy-paste-executable?
  - Maintainability: Are naming conventions consistent?
- If the score is below 75 (Grade C), revise before presenting.
- Reference `references/skill-frontmatter-spec.md` and `references/skill-body-patterns.md`.

### Step 10 -- Present Design Document

- Compile the complete SKILL.md content and present for review.
- Include a metadata summary:
  ```
  Lines: {count}
  Tools: {list}
  MOAT Depth: {depth}
  Quality Score: {score}/100
  ```
- Write the file only on user confirmation.

---

## Quality Criteria

- [ ] Frontmatter includes all applicable official fields with correct types. `[CONFIG]`
- [ ] Every procedure step has an action verb, input, output, and evidence tag. `[DOC]`
- [ ] Quality criteria are testable -- each has a clear pass/fail threshold. `[DOC]`
- [ ] Anti-patterns describe mistakes, not correct behaviors. `[DOC]`
- [ ] Edge cases cover boundary conditions, not just happy paths. `[DOC]`
- [ ] Tool selection follows least privilege -- no unnecessary tools included. `[CONFIG]`

## Assumptions & Limits

- This skill produces a SKILL.md design document, not the final file. The output is a specification for review, not a deployable artifact.
- The frontmatter field catalog in Step 2 reflects the official Claude Code plugin spec. If the spec evolves, this table must be updated.
- MOAT scoring in Step 9 is a self-assessment, not an external audit. The designed skill may score differently when audited by `audit-content-quality`.
- Cannot validate that procedure steps are actually executable -- only that they are structured correctly with action verbs, inputs, and outputs.
- Evidence tags (`[DOC]`, `[CONFIG]`, `[CODIGO]`) are mandatory per PQA conventions but are not part of the official Claude Code plugin spec.

## Good vs Bad

**Bad skill design:**
```
---
name: my-skill
description: Does stuff
allowed-tools:
  - Read
  - Write
  - Bash
---
# My Skill
1. Do the thing.
2. Return result.
```
Missing: no trigger phrases in description, Write included for a read-only skill, vague steps, no quality criteria, no anti-patterns, no edge cases.

**Good skill design:**
```
---
name: validate-config
description: >
  Validates configuration files for correctness and consistency.
  Trigger: validate config, check config, config audit.
allowed-tools:
  - Read
  - Glob
  - Grep
---
# Validate Config
> "Configuration is code that doesn't get tested -- until it breaks production."
## Procedure
### Step 1 -- Locate Config Files
- Glob for `*.json`, `*.yaml`, `*.toml` in plugin root. [DOC]
...
## Quality Criteria
- [ ] Every config file is validated; none silently skipped.
...
## Anti-Patterns
1. Accepting malformed YAML because the parser auto-corrects...
## Edge Cases
1. Plugin with zero config files -- report INFO, do not error.
```
Includes: trigger phrases, least-privilege tools, guiding quote, structured steps with evidence tags, quality criteria, anti-patterns, edge cases.

## Anti-Patterns

1. Including `Write` in allowed-tools for a read-only analysis skill.
2. Writing vague quality criteria like "output is high quality" (not testable).
3. Copying anti-patterns from another skill without adapting to this skill's domain.
4. Designing procedure steps that reference outputs from later steps (forward reference).
5. Setting `disable-model-invocation: true` without justification (limits discoverability).
6. Omitting the guiding principle quote (every skill benefits from a north star).

## Edge Cases

1. Skill has no arguments (invoked without parameters) -- `argument-hint` should be omitted, not set to empty string.
2. Skill needs a tool for a single step but not the rest -- still include it in allowed-tools, document why in the procedure.
3. Skill is internal-only (called by agents, never by users) -- set `user-invocable: false` and omit from command routing.
4. Skill requires a specific model for quality (e.g., complex reasoning) -- use the `model` field with justification.
5. Skill's MOAT depth was set to MINIMAL but the design reveals HIGH complexity -- flag for MOAT strategy update.

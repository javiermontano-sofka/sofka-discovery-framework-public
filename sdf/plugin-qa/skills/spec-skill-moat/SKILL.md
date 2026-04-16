---
name: spec-skill-moat
author: JM Labs (Javier Montaño)
description: >
  Generate production-ready SKILL.md and MOAT asset files from a skill design. Enforces MOAT quality dimensions (>=7 on all 6), 500-line body limit, progressive disclosure.
  Trigger: spec skill, generate skill spec, write SKILL.md, create skill specification, produce skill MOAT.
argument-hint: "<skill-design-path>"
allowed-tools:
  - Read
  - Write
  - Glob
  - Grep
  - Bash
---

# Spec Skill MOAT

> "A skill without structure is a prompt with delusions of grandeur."

Generates production-ready SKILL.md files and all associated MOAT asset files (references/, examples/, prompts/) from a skill design document. Every output is scored against the MOAT 6-dimension rubric and revised until all dimensions reach >=7/10.

---

## Procedure

### Step 1 -- Read Skill Design Document

- Read the skill design file at the path provided via `argument-hint`. `[Read]`
- Extract: skill name, description, trigger phrases, procedure steps, tool dependencies, quality criteria, anti-patterns, edge cases, and any MOAT asset notes.
- If the design is missing required sections, report which sections are absent and halt.

### Step 2 -- Generate SKILL.md Frontmatter

- Compose YAML frontmatter with all required fields:
  - `name`: kebab-case skill identifier.
  - `author`: from design or default to plugin author.
  - `description`: 1-3 sentence description ending with trigger phrases prefixed by "Trigger:".
  - `argument-hint`: from design.
  - `allowed-tools`: list of tools the skill procedure references.
- Optional fields: `disable-model-invocation`, `user-invocable`, `model`, `context`, `agent`, `hooks`.
- See `references/frontmatter-field-catalog.md` for the complete field catalog.

### Step 3 -- Generate SKILL.md Body

Write each section in order:

1. **Title** -- H1 matching the skill name in title case.
2. **Guiding Principle** -- A blockquote with an original or attributed aphorism relevant to the skill's purpose.
3. **Introduction** -- 2-4 sentences explaining what the skill does, when to use it, and what it produces.
4. **Procedure** -- Numbered steps (H3 per step) with:
   - Clear imperative instructions ("Read the file", "Validate each entry").
   - Tool references in backtick brackets: `[Read]`, `[Glob]`, `[Bash]`.
   - Decision points as bullet sub-lists with conditions and actions.
5. **Quality Criteria** -- Numbered list, minimum 4 testable criteria. Each criterion must be verifiable by reading the output alone.
6. **Anti-Patterns** -- Numbered list, minimum 3 entries. Each anti-pattern includes: the mistake, why it is wrong, and what to do instead.
7. **Edge Cases** -- Numbered list, minimum 2 entries. Each edge case includes: the scenario, expected behavior, and handling instructions.

### Step 4 -- Apply Progressive Disclosure

- Count lines in the generated SKILL.md body (excluding frontmatter).
- If >500 lines: extract detailed tables, extended examples, or deep reference material into `references/` files. Replace with a cross-reference line: `> See references/{filename} for details.`
- If >300 lines: add a table of contents after the introduction.
- Reference files themselves have no line limit but should use H2 sections for scannability.

### Step 5 -- Generate MOAT Asset Files

Based on the design's MOAT strategy:

- **references/**: Write reference files for lookup tables, specification details, rubrics, or catalogs that support the skill. Each file gets H1 title, purpose statement, and structured content.
- **examples/**: Write example files showing sample inputs and expected outputs. Use fenced code blocks for structured data.
- **prompts/**: Write prompt files containing metaprompts or prompt templates the skill uses internally. Each prompt gets a name, purpose, and the prompt text in a fenced block.

### Step 6 -- Score Against MOAT 6 Dimensions

Evaluate the complete spec package against each dimension (1-10 scale):

| Dimension | Question |
|-----------|----------|
| Trigger Accuracy | Will the description + triggers reliably activate this skill and not false-positive? |
| Completeness | Are all required sections present with minimum counts met? |
| Clarity | Can an LLM follow the procedure without ambiguity? |
| Robustness | Do anti-patterns and edge cases cover realistic failure modes? |
| Efficiency | Is the SKILL.md <=500 lines with progressive disclosure applied? |
| Value Density | Does every line contribute? No filler, no redundancy, no vague statements? |

See `references/moat-structure-spec.md` for the full rubric with scoring anchors.

### Step 7 -- Revise Below-Threshold Dimensions

- If any dimension scores <7, identify the specific deficiency.
- Revise the affected section(s) to address the gap.
- Re-score. Repeat until all dimensions are >=7.
- Record final scores in the output summary.

### Step 8 -- Verify Constraints and Output

- Confirm SKILL.md body is <=500 lines.
- Confirm frontmatter has all required fields.
- Confirm at least 4 quality criteria, 3 anti-patterns, 2 edge cases.
- Output the complete spec package: SKILL.md text + all MOAT asset file contents.
- Include a summary table: file name, line count, purpose.

---

## Quality Criteria

- [ ] Every SKILL.md contains all 7 required body sections (title, guiding principle, introduction, procedure, quality criteria, anti-patterns, edge cases).
- [ ] Procedure steps reference specific tools using `[ToolName]` notation.
- [ ] All 6 MOAT dimensions score >=7/10 with scores reported in output.
- [ ] SKILL.md body does not exceed 500 lines (frontmatter excluded).
- [ ] Trigger phrases in the description cover at least 3 natural language variations.
- [ ] Cross-references to MOAT asset files use correct relative paths.

## Assumptions & Limits

- Requires a completed skill design document as input. Cannot generate a SKILL.md from a brief concept alone -- that is `design-skill`'s responsibility.
- The 500-line limit applies to the SKILL.md body only. Frontmatter and MOAT asset files have no line limit.
- MOAT dimension scoring is self-assessed during generation. The scores represent the author's judgment, not an external audit. Use `audit-content-quality` for independent scoring.
- Progressive disclosure (Step 4) moves content to reference files, which may create cross-reference dependencies. If references are deleted later, the SKILL.md will have broken links.
- Cannot guarantee that generated trigger phrases will actually activate the skill in all runtime contexts -- trigger matching depends on the model's interpretation.

## Good vs Bad

**Bad spec output:**
```
# My Skill
Do the validation thing. Check stuff. Report results.
```
Missing: no frontmatter, no guiding principle, no structured procedure, no quality criteria, no anti-patterns, no edge cases, no MOAT assets.

**Good spec output:**
```
---
name: validate-config
description: >
  Validates plugin configuration files for schema compliance.
  Trigger: validate config, check config, config audit.
allowed-tools:
  - Read
  - Glob
  - Grep
---
# Validate Config
> "Configuration is the silent contract between author and runtime."
## Procedure
### Step 1 -- Locate Config Files
- Glob for `*.json` in plugin root. `[Glob]`
...
## Quality Criteria
- [ ] Every config file is validated; none silently skipped.
## Anti-Patterns
1. Accepting trailing commas in JSON without flagging...
## Edge Cases
1. Plugin with zero config files -- report INFO...

MOAT Scores: Trigger=8, Completeness=9, Clarity=8, Robustness=7, Efficiency=9, Value=8
```
Includes: complete frontmatter, all 7 body sections, MOAT dimension scores.

## Anti-Patterns

1. **Vague procedure steps** -- Writing "Process the input appropriately" instead of specifying exactly what to read, check, or transform. Every step must be concrete and actionable.
2. **Inflated quality criteria** -- Listing criteria that cannot be verified by reading the output (e.g., "The skill runs efficiently"). Criteria must be testable from the artifact alone.
3. **Missing tool references** -- Writing procedure steps that implicitly require tools without marking them. An LLM needs explicit `[Read]`, `[Glob]`, etc. to know which tools to invoke.
4. **Monolithic SKILL.md** -- Cramming everything into one file instead of using progressive disclosure. Reference material, detailed rubrics, and extended examples belong in MOAT subdirectories.

## Edge Cases

1. **Design with no MOAT strategy specified** -- Generate minimal MOAT assets: one reference file documenting the skill's domain context, one example file with sample output. Flag as INFO that MOAT strategy was inferred.
2. **Design with >15 procedure steps** -- Group related steps into phases (H3 per phase, numbered sub-steps). Add a procedure overview table before the detailed steps.
3. **Design referencing external tools not in allowed-tools** -- Flag each external tool reference as WARNING. Include it in allowed-tools if the design explicitly requires it; otherwise note it as a dependency the user must configure.

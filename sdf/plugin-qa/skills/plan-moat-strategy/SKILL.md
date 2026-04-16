---
name: plan-moat-strategy
author: JM Labs (Javier Montaño)
description: >
  Design MOAT asset strategy per skill: which subdirectories needed, what content they contain, naming conventions.
  Trigger: plan MOAT, MOAT strategy, asset planning, reference planning, plan skill assets.
argument-hint: "<architecture-plan-path>"
allowed-tools:
  - Read
  - Write
  - Glob
  - Grep
  - Bash
---

# Plan MOAT Strategy

> "A skill without references is a skill that hallucinates. A skill without examples is a skill that guesses."

Design the MOAT (Materials, Ontology, Assets, Templates) asset allocation for each skill in a plugin. Determines which subdirectories each skill needs, what content they should contain, naming conventions, and estimated line counts.

---

## Procedure

### Step 1 -- Read Architecture Plan

- Read the architecture plan document at the provided path.
- Extract the skill-movement map with all skill names and purposes.
- If no architecture plan exists, report error and suggest running `/pqa:plan` first.
- Tag source: `[DOC]`.

### Step 2 -- Assess Complexity Per Skill

- For each skill, evaluate complexity across four dimensions:

| Dimension | Low (1) | Medium (2) | High (3) |
|-----------|---------|------------|----------|
| **Domain knowledge** | Common knowledge | Requires reference docs | Deep specialist knowledge |
| **Procedure steps** | 3-4 steps | 5-7 steps | 8+ steps |
| **Edge cases** | 1-2 obvious | 3-4 nuanced | 5+ with subtle interactions |
| **User interaction** | No user prompting | Some clarification needed | Extensive elicitation |

- Sum the scores: 4-5 = LOW, 6-8 = MEDIUM, 9-10 = HIGH, 11-12 = VERY HIGH.
- Record the score and justification for each skill. `[INFERENCIA]`

### Step 3 -- Determine MOAT Depth

- Map complexity scores to MOAT depth:

| Complexity | MOAT Depth | Subdirectories |
|-----------|-----------|---------------|
| LOW (4-5) | `MINIMAL` | SKILL.md only |
| MEDIUM (6-8) | `STANDARD` | SKILL.md + references/ |
| HIGH (9-10) | `FULL` | SKILL.md + references/ + examples/ |
| VERY HIGH (11-12) | `DEEP` | SKILL.md + references/ + examples/ + prompts/ |

- Override rules:
  - Skills that reference external specs or standards: always include references/ (minimum STANDARD).
  - Skills that produce artifacts the user must understand: always include examples/ (minimum FULL).
  - Skills that elicit user input through structured questions: always include prompts/ (DEEP).

### Step 4 -- Plan Content for Each Subdirectory

For each skill at STANDARD or above, specify:

**references/** -- What reference documents to create:
- Name: `{topic}-{type}.md` (e.g., `hook-compatibility-matrix.md`, `frontmatter-spec.md`).
- Purpose: One sentence describing what knowledge it captures.
- Estimated lines: 30-100 depending on complexity.

**examples/** -- What example documents to create:
- Name: `sample-{artifact}.md` (e.g., `sample-architecture-plan.md`).
- Purpose: One sentence describing the example scenario.
- Estimated lines: 30-80.

**prompts/** -- What prompt templates to create:
- Name: `{purpose}-prompts.md` (e.g., `ideation-prompts.md`).
- Purpose: One sentence describing the question set.
- Estimated lines: 20-50.

### Step 5 -- Define Naming Conventions

- Document the naming conventions for the plugin:
  - Skill directories: kebab-case verb-noun (e.g., `validate-hooks`).
  - Reference files: `{topic}-{type}.md` where type is one of: `spec`, `guide`, `matrix`, `patterns`, `framework`.
  - Example files: `sample-{artifact}.md`.
  - Prompt files: `{purpose}-prompts.md`.
- Verify all proposed names follow the conventions. `[CODIGO]`

### Step 6 -- Estimate Total Asset Count

- Sum all MOAT assets across all skills.
- Produce a summary table:

```
| Skill | Depth | References | Examples | Prompts | Total Assets |
```

- Calculate total files to create (SKILL.md files + all MOAT assets).
- Estimate total lines across all assets. `[DOC]`

### Step 7 -- Write MOAT Strategy Document

- Compile into `moat-strategy.md`:
  ```
  # MOAT Strategy: {plugin-name}
  ## Complexity Assessment
  ## Depth Allocation
  ## Asset Inventory
  ## Naming Conventions
  ## Summary
  ```
- Present for review. Write file only on user confirmation.
- Reference `references/moat-quality-dimensions.md` for scoring details.

---

## Quality Criteria

- [ ] Every skill has an explicit MOAT depth with documented justification. `[DOC]`
- [ ] Naming conventions are consistent across all proposed assets. `[CODIGO]`
- [ ] Override rules are applied correctly (spec-referencing skills have references/). `[DOC]`
- [ ] Line count estimates are realistic (not padding, not underestimating). `[INFERENCIA]`
- [ ] Total asset count is proportional to plugin complexity. `[DOC]`

## Assumptions & Limits

- This skill produces a strategy document, not files. The actual MOAT directories and content are created by `build-moat-assets`.
- Complexity assessment is heuristic-based (4-dimension scoring). Two skills with the same score may have very different MOAT needs.
- Line count estimates assume standard markdown density (~30 words per line). Highly structured content (tables, code blocks) may need more lines for the same information.
- Override rules are PQA conventions, not official spec requirements. Plugins outside the PQA ecosystem may use different MOAT depth criteria.
- Shared references (Edge Case 2) are recommended but the skill cannot enforce cross-linking -- that is validated by `validate-cross-refs`.

## Good vs Bad

**Bad MOAT strategy:**
```
All skills: DEEP.
References: yes. Examples: yes. Prompts: yes.
```
Missing: no per-skill justification, no complexity assessment, no naming conventions, no line estimates.

**Good MOAT strategy:**
```
| Skill | Complexity | Depth | References | Examples | Prompts |
|-------|-----------|-------|------------|----------|---------|
| validate-hooks | HIGH (10) | FULL | hook-compatibility-matrix.md (80 lines) | valid-hooks.md, incompatible-hooks.md (40 lines each) | -- |
| ideate-plugin | MEDIUM (7) | STANDARD | plugin-idea-framework.md (60 lines) | -- | -- |

Justification: validate-hooks scores HIGH because it requires deep domain knowledge (hook spec) and has 5+ edge cases. ideate-plugin is MEDIUM — straightforward procedure but needs reference material for overlap analysis.
```
Includes: per-skill complexity scores, depth with rationale, specific asset files with line estimates, justification.

## Anti-Patterns

1. Giving every skill DEEP MOAT depth regardless of complexity (wasteful, dilutes quality).
2. Creating references/ with only links and no substantive content.
3. Using examples/ for test cases instead of illustrative samples.
4. Estimating line counts without considering the actual content needed.
5. Naming files generically (`notes.md`, `info.md`) instead of descriptively.

## Edge Cases

1. A skill's complexity changes during design -- revisit the MOAT allocation.
2. Multiple skills share the same reference material -- create one reference file and cross-link.
3. A MINIMAL skill grows in scope -- upgrade its MOAT depth and document why.

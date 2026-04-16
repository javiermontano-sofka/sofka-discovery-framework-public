---
name: ideate-component
author: JM Labs (Javier Montaño)
description: >
  Brainstorm individual plugin components (skill, agent, command, hook) for existing or planned plugins.
  Trigger: ideate component, brainstorm skill, new agent idea, component concept, add skill to plugin.
argument-hint: "<component-type> [plugin-path]"
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
---

# Ideate Component

> "A component earns its place by doing one thing that no other component does."

Brainstorm individual components (skill, agent, command, or hook) for an existing or planned plugin. Produces a concept card that defines the component's responsibility, relationships, and placement within the plugin structure.

This is a **read-only** skill. It proposes but never creates files.

---

## Procedure

### Step 1 -- Identify Component Type

- Determine which component type the user wants: `skill`, `agent`, `command`, or `hook`.
- If not specified, ask: "What type of component? A skill (does work), agent (orchestrates), command (user entry point), or hook (lifecycle event)?"
- Reference `references/component-patterns.md` for the decision matrix.

### Step 2 -- Read Existing Plugin Structure

- If a plugin path is provided, read its `plugin.json`, list existing skills/agents/commands/hooks.
- Build an inventory of current components and their responsibilities.
- If no plugin path is provided, work from a plugin brief or architecture plan if available.
- Tag source: `[CODIGO]` for file-derived info, `[SUPUESTO]` for assumptions.

### Step 3 -- Propose Name and Responsibility

- Generate 2-3 name candidates in kebab-case.
- For each candidate, write a one-sentence responsibility statement following the pattern: "This {type} {verb} {object} {constraint}."
- Example: "This skill validates hook configurations against the type-event compatibility matrix."
- Verify the name does not conflict with existing components in the plugin.

### Step 4 -- Map Relationships

- Identify which existing components this new component interacts with.
- For skills: which agent orchestrates it? Which movement does it belong to?
- For agents: which skills does it manage? What is its delegation boundary?
- For commands: which skill or agent does it invoke? Is it canonical or an alias?
- For hooks: which event triggers it? What context does it need?
- Draw a simple dependency diagram in text or Mermaid format.

### Step 5 -- Identify Conflicts and Gaps

- Check for responsibility overlap with existing components.
- If overlap exists, propose one of: merge, split, or differentiate.
- Check for missing dependencies: does this component need something that does not exist yet?
- If dependencies are missing, list them as additional components to ideate.

### Step 6 -- Determine MOAT Depth

- Assess the component's complexity to recommend MOAT asset depth:
  - `MINIMAL`: SKILL.md only (simple, self-contained components).
  - `STANDARD`: SKILL.md + references/ (needs reference material).
  - `FULL`: SKILL.md + references/ + examples/ (complex, benefits from examples).
  - `DEEP`: SKILL.md + references/ + examples/ + prompts/ (user-facing, needs prompt templates).

### Step 7 -- Output Concept Card

- Compile findings into a concept card:
  ```
  ## Component Concept Card
  - Type: {skill|agent|command|hook}
  - Name: {recommended-name}
  - Responsibility: {one-sentence}
  - Movement: {movement-name or N/A}
  - Dependencies: {list}
  - Conflicts: {list or "none"}
  - MOAT Depth: {MINIMAL|STANDARD|FULL|DEEP}
  - Tools Needed: {list}
  - Estimated Lines: {range}
  ```
- Present the card for review. Suggest designing the component with `/pqa:design`.

---

## Quality Criteria

- [ ] The responsibility statement is a single sentence with a clear verb and object. `[DOC]`
- [ ] Name candidates are verified unique against existing components. `[CODIGO]`
- [ ] Relationship mapping includes all direct dependencies. `[CODIGO]`
- [ ] MOAT depth recommendation has explicit justification. `[DOC]`
- [ ] Conflict analysis explicitly states whether overlap exists and proposes a resolution (merge, split, or differentiate). `[DOC]`

## Assumptions & Limits

- Read-only. This skill proposes component concepts but never creates files or directories.
- Relationship mapping depends on the existing plugin structure being readable. If the plugin is not yet scaffolded, relationships are inferred from the architecture plan or brief.
- MOAT depth recommendations are guidelines, not constraints. The actual depth may change during the design phase when complexity becomes clearer.
- Cannot assess whether the proposed component is actually useful to users -- only that it is structurally sound and non-overlapping.
- Hook compatibility is checked against the type-event matrix, but the skill does not validate the hook's runtime behavior.

## Good vs Bad

**Bad concept card:**
```
- Type: skill
- Name: do-stuff
- Responsibility: Does stuff.
```
Missing: no movement, no dependencies, no conflicts, no MOAT depth, no tools.

**Good concept card:**
```
## Component Concept Card
- Type: skill
- Name: validate-config
- Responsibility: Validates plugin configuration files against their JSON schemas.
- Movement: VALIDATE
- Dependencies: validate-manifest (shares plugin.json parsing), audit-security (config may contain secrets)
- Conflicts: None — validate-manifest checks plugin.json only; this covers settings.json and hooks.json
- MOAT Depth: STANDARD (needs reference for config schemas)
- Tools Needed: Read, Glob, Grep
- Estimated Lines: 80-120
```
Includes: type, descriptive name, precise responsibility, movement placement, dependencies, conflict analysis, MOAT depth with rationale, tool list, line estimate.

## Anti-Patterns

1. Proposing a component that duplicates an existing one without acknowledging the overlap.
2. Creating a skill for something that should be a command alias.
3. Designing an agent that manages only one skill (merge into the parent agent).
4. Recommending DEEP MOAT depth for every component regardless of complexity.

## Edge Cases

1. User wants to add a component to a plugin that has no architecture plan -- ideate the component in isolation, note the lack of context.
2. The proposed component requires tools not available in the plugin sandbox -- document the constraint and propose alternatives.
3. User wants a hook but the event they need is not compatible with their hook type -- reference the compatibility matrix and suggest alternatives.

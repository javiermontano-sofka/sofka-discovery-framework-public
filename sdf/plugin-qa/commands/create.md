---
description: "Full upstream pipeline: ideate, plan, design, specify, and build a complete plugin from scratch."
user-invocable: true
argument-hint: "<plugin-idea>"
---

# /pqa:create

Full upstream pipeline that takes a plugin idea from concept to scaffolded code. Orchestrates 5 movements in sequence with quality gates between each phase.

## Usage

```
/pqa:create <plugin-idea>
```

- `<plugin-idea>` -- A natural-language description of the plugin you want to build (e.g., "A plugin for linting Dockerfiles and CI configs").

## The 5-Movement Upstream Flow

### Movement 1 -- IDEATE (plugin-architect)

Run `ideate-plugin` to brainstorm the concept. Produces a plugin concept brief with purpose, target users, skill ideas, and differentiation.

**Quality Gate G1**: User reviews and approves the concept brief before proceeding.

### Movement 2 -- PLAN (plugin-architect)

Run `plan-architecture` + `plan-moat-strategy`. Produces an architecture plan (agents, skills, commands, hooks, movements, Mermaid diagrams) and a MOAT asset strategy (complexity assessment, depth allocation per skill).

**Quality Gate G2**: User reviews and approves the architecture plan and MOAT strategy before proceeding.

### Movement 3 -- DESIGN (plugin-architect)

Run `design-skill` and `design-agent` for each component in the architecture plan. Produces detailed component designs with full frontmatter, procedures, quality criteria, anti-patterns, and edge cases.

**Quality Gate G3**: User reviews and approves designs before proceeding.

### Movement 4 -- SPECIFY (plugin-spec-writer)

Run `spec-skill-moat` for each skill design and `spec-agent-command` for each agent design. Produces production-ready specifications including MOAT asset contents, command definitions, and cross-reference validation.

**Quality Gate G4**: User reviews and approves spec packages before proceeding.

### Movement 5 -- BUILD (plugin-builder-agent)

Run `build-plugin-scaffold` + `build-moat-assets`. Creates the complete plugin directory with all files: plugin.json, agents, commands, skills (with MOAT directories), hooks, settings, CLAUDE.md, README.md, LICENSE. Runs `validate-structure` as a smoke test.

## Agents Involved

| Agent | Movements |
|-------|-----------|
| `plugin-architect` | IDEATE, PLAN, DESIGN |
| `plugin-spec-writer` | SPECIFY |
| `plugin-builder-agent` | BUILD |

## Expected Output

- A fully scaffolded plugin directory ready for use
- Build report with file counts, line counts, and validation results
- All intermediate artifacts (brief, plans, designs, specs) preserved for reference

## Notes

- Each quality gate is a hard stop. The pipeline pauses for user approval before advancing.
- To skip upstream and only QA an existing plugin, use `/pqa:audit` instead.
- To run the full lifecycle (create + QA), use `/pqa:lifecycle`.

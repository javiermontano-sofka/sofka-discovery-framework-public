# Plugin QA (PQA)

![Version](https://img.shields.io/badge/version-2.0.0-6366F1) ![License](https://img.shields.io/badge/license-MIT-22D3EE) ![Agents](https://img.shields.io/badge/agents-4-6366F1) ![Skills](https://img.shields.io/badge/skills-20-6366F1) ![Commands](https://img.shields.io/badge/commands-31-6366F1)

A full-lifecycle framework for Claude Code plugins. Create plugins from scratch with guided ideation, architecture planning, and scaffolding -- then validate, audit, and fix them with automated QA.

PQA started as a QA-only tool and has grown into a complete plugin development lifecycle. The upstream pipeline (IDEATE through BUILD) takes a natural-language idea and produces a fully scaffolded plugin. The downstream pipeline (VALIDATE through FIX) runs 10 quality checks and generates reports with severity-classified findings. Run them together with `/pqa:lifecycle` for end-to-end coverage.

**Brand**: JM Labs | **Prefix**: `/pqa:` | **Version**: 2.0.0

---

## Installation

```bash
claude plugin:install ./plugins/plugin-qa
```

Or add the plugin path to your Claude Code configuration.

---

## Quick Start

```bash
# Audit an existing plugin
/pqa:audit /path/to/my-plugin

# Create a new plugin from scratch
/pqa:create "A plugin for linting Dockerfiles and CI configs"

# Full lifecycle: create + QA in one pipeline
/pqa:lifecycle "A plugin for managing database migrations"

# Quick structural validation (faster, no content scoring)
/pqa:validate

# Auto-fix common issues (asks before changing files)
/pqa:fix

# See all 31 commands
/pqa:menu
```

---

## Architecture Overview

PQA orchestrates 4 agents across 9 movements:

```
  UPSTREAM (Create)                    DOWNSTREAM (QA)
  ==================                   ================
  1. IDEATE ----+                      6. VALIDATE
                |  G1                  7. AUDIT
  2. PLAN ------+                      8. REPORT
                |  G2                  9. FIX (if needed)
  3. DESIGN ----+
                |  G3
  4. SPECIFY ---+
                |  G4
  5. BUILD -----+---> Plugin Dir ---> VALIDATE -> AUDIT -> REPORT -> (FIX)
```

Quality gates G1-G4 require user approval between upstream movements.

---

## Commands Reference

| Command | Alias | Movement | Description |
|---------|-------|----------|-------------|
| `/pqa:lifecycle` | `/pqa:l` | Full Pipeline | Full 9-movement lifecycle: ideate through report |
| `/pqa:create` | `/pqa:c` | Upstream (1-5) | Full upstream pipeline: ideate, plan, design, specify, build |
| `/pqa:ideate` | `/pqa:i` | 1 - IDEATE | Brainstorm a new plugin concept or component |
| `/pqa:ideate-component` | | 1 - IDEATE | Brainstorm an individual component |
| `/pqa:plan` | `/pqa:p` | 2 - PLAN | Architecture plan + MOAT strategy |
| `/pqa:plan-moat` | | 2 - PLAN | MOAT asset allocation per skill |
| `/pqa:design` | `/pqa:d` | 3 - DESIGN | Design a skill or agent in detail |
| `/pqa:design-agent` | | 3 - DESIGN | Design an agent directly |
| `/pqa:spec` | `/pqa:s` | 4 - SPECIFY | Generate specs from designs |
| `/pqa:spec-agent` | | 4 - SPECIFY | Generate agent + command specs |
| `/pqa:build` | `/pqa:b` | 5 - BUILD | Scaffold plugin directory from specs |
| `/pqa:build-moat` | | 5 - BUILD | Create MOAT directories and assets |
| `/pqa:audit` | `/pqa:a` | 6+7 - VALIDATE+AUDIT | Full QA audit, report + scorecard |
| `/pqa:validate` | `/pqa:v` | 6 - VALIDATE | Quick structural validation (5 skills) |
| `/pqa:hooks-check` | | 6 - VALIDATE | Hook type-event compatibility check |
| `/pqa:security` | | 7 - AUDIT | Security-only scan |
| `/pqa:report` | `/pqa:r` | 8 - REPORT | Generate QA report |
| `/pqa:scorecard` | | 8 - REPORT | Executive scorecard with grades |
| `/pqa:fix` | `/pqa:f` | 9 - FIX | Auto-fix common issues |
| `/pqa:menu` | | Utility | Interactive command palette |

**Total: 31 commands** (20 canonical + 11 aliases)

---

## Skills Overview

### Movement 1 -- IDEATE

- `ideate-plugin` -- Brainstorm plugin concept from a problem statement
- `ideate-component` -- Brainstorm an individual component (skill, agent, command, hook)

### Movement 2 -- PLAN

- `plan-architecture` -- Architecture plan with agents, skills, commands, hooks, movements
- `plan-moat-strategy` -- MOAT complexity assessment and depth allocation

### Movement 3 -- DESIGN

- `design-skill` -- Detailed skill design with procedure, criteria, anti-patterns
- `design-agent` -- Detailed agent design with roles, skills, constraints

### Movement 4 -- SPECIFY

- `spec-skill-moat` -- Production specification for skill + MOAT asset contents
- `spec-agent-command` -- Production specification for agent + command definitions

### Movement 5 -- BUILD

- `build-plugin-scaffold` -- Scaffold complete plugin directory from specs
- `build-moat-assets` -- Create MOAT directories and populate asset files

### Movement 6 -- VALIDATE

- `validate-structure` -- Directory layout and required files
- `validate-manifest` -- plugin.json schema compliance
- `validate-components` -- Skills, agents, commands integrity
- `validate-hooks` -- Hook type-event compatibility (ToolUseContext)
- `validate-cross-refs` -- Internal references between components

### Movement 7 -- AUDIT

- `audit-security` -- Security findings scan
- `audit-content-quality` -- Content quality scoring

### Movement 8 -- REPORT

- `generate-qa-report` -- Full markdown QA report
- `generate-qa-scorecard` -- 7-dimension executive scorecard

### Movement 9 -- FIX

- `fix-common-issues` -- Auto-fix mechanical issues

---

## Agents

| Agent | Role | Movements |
|-------|------|-----------|
| `plugin-architect` | Concept ideation, architecture planning, component design | IDEATE, PLAN, DESIGN |
| `plugin-spec-writer` | Production-ready specifications and MOAT assets | SPECIFY |
| `plugin-builder-agent` | Code generation, scaffolding, MOAT directory creation | BUILD |
| `plugin-qa-engineer` | Validation, security audit, reporting, auto-fix | VALIDATE, AUDIT, REPORT, FIX |

---

## MOAT Pattern

MOAT (Methods, Ontology, Assets, Templates) is the quality pattern for skill depth. Each skill can include:

- `references/` -- Ontology files, spec digests, domain knowledge
- `examples/` -- Input/output examples, edge cases, before/after
- `prompts/` -- Reusable NL-HP prompt templates

PQA plans MOAT depth during the PLAN movement (`plan-moat-strategy`) and populates assets during BUILD (`build-moat-assets`). See `references/moat-pattern-guide.md` for the full methodology.

---

## Example Output

### Scorecard

```
# QA Scorecard: my-plugin

| Dimension        | Score | Grade | Notes              |
|------------------|-------|-------|--------------------|
| Structure        | 95    | A     |                    |
| Manifest         | 88    | B     | 1 missing field    |
| Components       | 92    | A     |                    |
| Hooks            | 100   | A     |                    |
| Cross-References | 85    | B     | 2 broken refs      |
| Security         | 90    | A     |                    |
| Content Quality  | 78    | C     | Descriptions thin  |
|------------------|-------|-------|--------------------|
| Overall          | 89    | B     |                    |
```

### Grading Scale

| Grade | Range | Meaning |
|-------|-------|---------|
| A | 90-100 | Production ready |
| B | 80-89 | Minor issues |
| C | 70-79 | Needs improvement |
| D | 60-69 | Significant issues |
| F | 0-59 | Not ready for use |

---

## Troubleshooting

### "Plugin not found" when running commands

Ensure the plugin directory is correctly referenced in your Claude Code configuration. The plugin root must contain `.claude-plugin/plugin.json`.

### Audit reports showing stale results

Delete the existing `qa-report.md` in the target directory and re-run `/pqa:audit` for a fresh analysis. Results are not cached between runs.

### Hook validation false positives

If `validate-hooks` flags a hook that you know is correct, check that your hook event name matches one of the 22 official events exactly. Custom or misspelled event names will be flagged as CRITICAL findings.

---

## License

MIT -- see [LICENSE](./LICENSE).

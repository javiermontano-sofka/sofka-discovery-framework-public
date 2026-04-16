---
description: "Full 9-movement lifecycle: create a plugin and then QA it. Ideate through report with quality gates."
user-invocable: true
argument-hint: "<plugin-idea>"
---

# /pqa:lifecycle

Full 9-movement pipeline that takes a plugin idea from concept through build and then runs complete QA. Combines the upstream create pipeline (5 movements) with the downstream QA pipeline (4 movements) into a single end-to-end lifecycle.

## Usage

```
/pqa:lifecycle <plugin-idea>
```

- `<plugin-idea>` -- A natural-language description of the plugin you want to build and validate.

## The 9-Movement Pipeline

### Upstream -- Create (Movements 1-5)

| # | Movement | Agent | Skills | Output |
|---|----------|-------|--------|--------|
| 1 | IDEATE | plugin-architect | ideate-plugin | Plugin concept brief |
| 2 | PLAN | plugin-architect | plan-architecture, plan-moat-strategy | Architecture plan + MOAT strategy |
| 3 | DESIGN | plugin-architect | design-skill, design-agent | Detailed component designs |
| 4 | SPECIFY | plugin-spec-writer | spec-skill-moat, spec-agent-command | Production-ready specs + MOAT assets |
| 5 | BUILD | plugin-builder-agent | build-plugin-scaffold, build-moat-assets | Scaffolded plugin directory |

### Downstream -- QA (Movements 6-9)

| # | Movement | Agent | Skills | Output |
|---|----------|-------|--------|--------|
| 6 | VALIDATE | plugin-qa-engineer | validate-structure, validate-manifest, validate-components, validate-hooks, validate-cross-refs | Validation findings |
| 7 | AUDIT | plugin-qa-engineer | audit-security, audit-content-quality | Security + quality findings |
| 8 | REPORT | plugin-qa-engineer | generate-qa-report, generate-qa-scorecard | QA report + scorecard |
| 9 | FIX | plugin-qa-engineer | fix-common-issues | Auto-remediation (if needed) |

## Quality Gates

| Gate | Between | Criteria |
|------|---------|----------|
| G1 | IDEATE -> PLAN | User approves concept brief |
| G2 | PLAN -> DESIGN | User approves architecture plan and MOAT strategy |
| G3 | DESIGN -> SPECIFY | User approves component designs |
| G4 | SPECIFY -> BUILD | User approves spec packages |

Movement 9 (FIX) runs only if the QA report contains CRITICAL or WARNING findings. The fix cycle re-validates after applying fixes to confirm resolution.

## All 4 Agents Involved

| Agent | Role | Movements |
|-------|------|-----------|
| `plugin-architect` | Concept, planning, and design | 1-3 (IDEATE, PLAN, DESIGN) |
| `plugin-spec-writer` | Production specifications | 4 (SPECIFY) |
| `plugin-builder-agent` | Code generation and scaffolding | 5 (BUILD) |
| `plugin-qa-engineer` | Validation, audit, reporting, fix | 6-9 (VALIDATE, AUDIT, REPORT, FIX) |

## Expected Output

- A fully scaffolded, QA-validated plugin directory
- Complete QA report with severity-classified findings
- Executive scorecard with letter grade (A-F) across 7 dimensions
- All intermediate artifacts preserved (brief, plans, designs, specs)
- Fix report (if remediation was needed)

## Notes

- Each quality gate is a hard stop requiring user approval.
- For upstream only (no QA), use `/pqa:create`.
- For downstream only (QA existing plugin), use `/pqa:audit`.
- Total execution involves 20 skills across 4 agents.

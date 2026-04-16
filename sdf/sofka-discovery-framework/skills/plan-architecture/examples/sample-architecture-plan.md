# Architecture Plan: devops-toolkit

## Overview

A plugin for DevOps engineers to lint, generate, and validate infrastructure configurations. Based on the `devops-toolkit` plugin brief. Complexity: STANDARD (7 skills, 1 agent).

---

## Agent Roles

### devops-engineer (Primary)

- **Boundary**: Orchestrates all three movements. Single agent because skill count is below 10.
- **Tools**: Read, Write, Glob, Grep, Bash
- **maxTurns**: 25
- **Skills managed**: All 7 skills across 3 movements.

---

## Skill-Movement Map

| Movement | Skill | Purpose | Sequence |
|----------|-------|---------|----------|
| ANALYZE | `lint-dockerfile` | Lint Dockerfiles against best practices | Parallel |
| ANALYZE | `lint-compose` | Lint docker-compose files | Parallel |
| ANALYZE | `validate-env` | Validate .env files against deploy manifests | Parallel |
| GENERATE | `generate-pipeline` | Generate CI/CD pipeline configs | Sequential (after ANALYZE) |
| GENERATE | `generate-docs` | Generate infra documentation | Sequential (after generate-pipeline) |
| VALIDATE | `validate-pipeline` | Verify generated pipeline configs | Sequential |
| VALIDATE | `validate-security` | Security scan of all configs | Sequential |

---

## Hook Strategy

**Strategy**: Reactive (PostToolUse only)

| Hook | Event | Type | Behavior |
|------|-------|------|----------|
| `auto-lint` | PostToolUse | command | After file write to Dockerfile or compose, run lint |
| `summary` | Stop | command | Generate session summary of findings |

Both hooks use `type:command` which is compatible with all events.

---

## Command Routing Table

| Command | Alias | Target | Description |
|---------|-------|--------|-------------|
| `/dot:analyze` | `/dot:a` | ANALYZE movement | Run all 3 lint/validate skills |
| `/dot:generate` | `/dot:g` | GENERATE movement | Run pipeline + docs generation |
| `/dot:validate` | `/dot:v` | VALIDATE movement | Run validation skills |
| `/dot:lint` | -- | `lint-dockerfile` | Lint Dockerfiles only |
| `/dot:full` | `/dot:f` | All movements | Full pipeline: analyze + generate + validate |
| `/dot:menu` | -- | -- | Interactive command palette |

Total: 7 canonical + 3 aliases = 10 commands.

---

## Quality Gates

| Gate | Between | Criteria |
|------|---------|----------|
| G1: Analysis Clean | ANALYZE -> GENERATE | Zero CRITICAL findings from lint/validate skills |
| G2: Generation Valid | GENERATE -> VALIDATE | Generated files parse correctly (valid YAML/JSON) |

---

## Component Summary

| Component | Count |
|-----------|-------|
| Agents | 1 |
| Skills | 7 |
| Commands | 10 (7 canonical + 3 aliases) |
| Hooks | 2 |

## Next Steps

1. Run `/pqa:plan-moat` to define MOAT asset allocation per skill.
2. Design the `devops-engineer` agent with `/pqa:design agent`.
3. Design skills starting with the ANALYZE movement (highest standalone value).

# Plugin Brief: devops-toolkit

## Problem Statement

DevOps engineers using Claude Code lack a unified set of skills for common infrastructure tasks -- Dockerfile linting, CI/CD pipeline generation, and environment configuration validation are done ad-hoc with inconsistent quality.

## Target Audience

- DevOps engineers managing CI/CD pipelines
- Backend developers writing Dockerfiles and compose files
- Platform teams maintaining infrastructure-as-code

## Use Cases

1. Lint Dockerfiles against best practices (multi-stage builds, layer caching, security)
2. Generate CI/CD pipeline configs (GitHub Actions, GitLab CI) from project analysis
3. Validate environment variable configurations across `.env` files and deployment manifests
4. Audit docker-compose files for security and resource constraints
5. Generate infrastructure documentation from existing configs

## Overlap Analysis

| Plugin | Overlap | Notes |
|--------|---------|-------|
| (none found) | -- | No existing plugins in the ecosystem cover DevOps tooling |

Overlap classification: `NONE` -- proceed with development.

## Proposed Name

**`devops-toolkit`** (recommended)

Alternatives: `infra-linter`, `cicd-assistant`, `docker-qa`

## Movement Structure

| Movement | Skills | Purpose |
|----------|--------|---------|
| ANALYZE | `lint-dockerfile`, `lint-compose`, `validate-env` | Static analysis of existing configs |
| GENERATE | `generate-pipeline`, `generate-docs` | Create new configs from analysis |
| VALIDATE | `validate-pipeline`, `validate-security` | Verify generated outputs |

## Component Estimates

- **Skills**: 7 (STANDARD complexity)
- **Agents**: 1 (`devops-engineer` -- orchestrates all movements)
- **Commands**: 10 (7 canonical + 3 aliases)
- **Hooks**: 2 (PostToolUse for auto-lint on file save, Stop for summary)

## Feasibility Assessment

**Rating**: HIGH

- All capabilities map well to Read/Grep/Bash tools
- No external service dependencies
- Docker and CI/CD configs are text-based, ideal for analysis
- Risk: Dockerfile best practices evolve -- references need periodic updates

## Next Steps

1. Run `/pqa:plan devops-toolkit-brief.md` to generate architecture plan
2. Design the `devops-engineer` agent first (single orchestrator)
3. Start with ANALYZE movement skills (highest standalone value)

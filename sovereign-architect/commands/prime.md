---
description: "Repository knowledge priming — scan, index, and build context for the codebase"
user-invocable: true
---

# SOVEREIGN ARCHITECT · PRIME · NL-HP v1.0

## ROLE

Sovereign Software Architect Apex — Context Builder priming repository knowledge for effective analysis.

## OBJECTIVE

Prime repository knowledge for: `$ARGUMENTS` (or the current repository if no arguments provided).

Priming builds a comprehensive mental model of the codebase so subsequent commands operate with full context rather than cold-starting each time.

## PROTOCOL

### Step 1 — Repository Scan

1. **Structure**: Directory tree, entry points, build outputs
2. **Languages**: Primary and secondary languages, versions
3. **Frameworks**: Web frameworks, ORMs, test frameworks, build tools
4. **Package manifests**: Dependencies, scripts, engines
5. **Configuration**: Environment configs, feature flags, secrets management

### Step 2 — Architecture Recognition

1. **Architecture style**: Monolith, microservices, modular monolith, serverless
2. **Patterns**: MVC, hexagonal, CQRS, event-driven, layered
3. **Domain boundaries**: Module boundaries, namespace structure
4. **Data layer**: Database type, ORM, migration strategy
5. **API layer**: REST, GraphQL, gRPC, WebSocket

### Step 3 — Quality Signals

1. **Test landscape**: Types, frameworks, coverage signals
2. **CI/CD**: Pipeline configuration, quality gates
3. **Documentation**: README, ADRs, inline docs, API docs
4. **Code health**: Linting, formatting, type safety
5. **Security**: Auth mechanism, dependency vulnerabilities, secrets handling

### Step 4 — Context Summary

Generate a concise knowledge base that can be referenced by subsequent commands.

## OUTPUT FORMAT

```markdown
# Repository Primer: {Project Name}

## Identity
- **Name**: {name}
- **Type**: {type}
- **Languages**: {languages}
- **Frameworks**: {frameworks}

## Architecture
- **Style**: {architecture style}
- **Patterns**: {patterns in use}
- **Modules**: {key modules and boundaries}

## Infrastructure
- **Build**: {build system}
- **CI/CD**: {pipeline}
- **Deploy**: {deployment method}
- **Environments**: {environments}

## Quality Profile
| Aspect | Status | Notes |
|--------|--------|-------|
| Tests | {status} | {notes} |
| Docs | {status} | {notes} |
| Security | {status} | {notes} |
| Dependencies | {status} | {notes} |

## Key Files
{Important files and their purpose}

## Open Questions
{What couldn't be determined from static analysis}
```

## CONSTRAINTS

- NEVER invent files, technologies, or configurations not found in the repository
- NEVER present inferences as facts
- Tag findings: `[HECHO]`, `[INFERENCIA]`, `[SUPUESTO]`
- Priming is read-only — no files are created or modified in the repository
- If the repo is too large to fully scan, prioritize by entry points and configuration

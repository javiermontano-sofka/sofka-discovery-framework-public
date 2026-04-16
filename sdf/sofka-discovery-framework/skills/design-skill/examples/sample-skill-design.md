# Sample Skill Design: lint-dockerfile

> Example output of the `design-skill` skill for a hypothetical `devops-toolkit` plugin.

---

## Design Metadata

- **Lines**: 95
- **Tools**: Read, Glob, Grep, Bash
- **MOAT Depth**: STANDARD (references/ only)
- **Quality Score**: 88/100 (Grade B)

---

## Designed SKILL.md Content

```yaml
---
name: lint-dockerfile
author: JM Labs (Javier Montaño)
description: >
  Lint Dockerfiles against best practices for security, performance, and maintainability.
  Trigger: lint dockerfile, check dockerfile, docker lint, dockerfile audit.
argument-hint: "<dockerfile-path>"
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
---
```

```markdown
# Lint Dockerfile

> "A Dockerfile is production infrastructure compressed into text -- lint it like lives depend on it."

Analyzes Dockerfiles against best practices covering multi-stage builds, layer caching, security (no root user, no secrets), and maintainability (pinned versions, minimal layers).

---

## Procedure

### Step 1 -- Locate Dockerfile
- Search for Dockerfile at the provided path or scan the project root.
- If multiple Dockerfiles found, list them and ask which to lint.

### Step 2 -- Parse Structure
- Read the Dockerfile content.
- Parse into instruction blocks (FROM, RUN, COPY, etc.).
- Identify build stages for multi-stage builds.

### Step 3 -- Check Security
- Verify no USER root in final stage.
- Scan for hardcoded secrets, tokens, passwords in ENV and ARG.
- Check for COPY of .env or credential files.

### Step 4 -- Check Performance
- Verify layer ordering (dependencies before application code).
- Check for combined RUN statements (reduce layers).
- Verify .dockerignore exists and excludes common artifacts.

### Step 5 -- Generate Report
- Produce findings table with severity, line number, and recommendation.
- Summary: pass/fail with counts.

---

## Quality Criteria

1. Every finding includes the Dockerfile line number. [CODIGO]
2. Security findings are always CRITICAL severity. [CONFIG]
3. No false positives on multi-stage build patterns. [CODIGO]
4. Report is machine-parseable (consistent table format). [DOC]

## Anti-Patterns

1. Flagging USER root in build stages (only matters in final stage).
2. Reporting combined RUN as a warning when it is actually best practice.
3. Ignoring .dockerignore analysis.
4. Not recognizing multi-stage builds (treating all stages as final).

## Edge Cases

1. Dockerfile with no FROM -- invalid, report as CRITICAL.
2. Dockerfile.dev vs Dockerfile.prod -- lint each separately.
3. BuildKit syntax (heredocs in RUN) -- parse correctly, do not flag as error.
```

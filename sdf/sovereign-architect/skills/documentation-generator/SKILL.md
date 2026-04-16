---
name: documentation-generator
author: JM Labs (Javier Montaño)
description: >
  Generates README files, API documentation, operational runbooks, and Architecture Decision Records (ADRs).
  Trigger: "generate docs", "write README", "create runbook", "write ADR", "API documentation".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Documentation Generator

Produces structured, maintainable documentation artifacts — READMEs, API docs, runbooks, and ADRs — by analyzing the codebase and inferring intent from code structure.

## Guiding Principle

> *"Documentation is a love letter to your future self — and to every engineer who inherits your code."*

## Procedure

### Step 1 — Analyze Documentation Needs
1. Scan the repository for existing documentation: README, CHANGELOG, docs/, wiki references.
2. Identify the target audience: developers (API docs), operators (runbooks), architects (ADRs), onboarding (README).
3. Detect the tech stack and framework conventions to align doc format.
4. List undocumented critical areas: setup steps, environment variables, deployment, troubleshooting.
5. Check for doc generation tools already in use (Swagger, TypeDoc, Sphinx).

### Step 2 — Generate the README
1. Project name, one-line description, and status badges.
2. Quick start: prerequisites, installation, running locally (copy-pasteable commands).
3. Architecture overview: high-level diagram or description.
4. Environment variables table: name, description, default, required.
5. Contributing guide, license, and links to deeper documentation.

### Step 3 — Generate API Documentation
1. Extract endpoints from route definitions: method, path, params, body, response.
2. Document authentication requirements per endpoint.
3. Provide request/response examples with realistic data.
4. Document error codes and their meanings.
5. Generate OpenAPI/Swagger spec if not already present.

### Step 4 — Generate Operational Documents
1. **Runbook**: Step-by-step procedures for common operational tasks (deploy, rollback, scale, debug).
2. **ADR**: Decision title, status, context, decision, consequences — following the Nygard template.
3. **Troubleshooting Guide**: Common errors, symptoms, diagnostic steps, and resolutions.
4. Tag each section with its evidence source: `[CODIGO]`, `[CONFIG]`, `[INFERENCIA]`.

## Quality Criteria
- Every environment variable is documented with description and default.
- API documentation matches the actual code (verified via grep).
- Runbook commands are copy-pasteable and tested.
- ADRs capture the *why* behind decisions, not just the *what*.

## Anti-Patterns
- Writing documentation that duplicates code comments without adding context.
- Generating docs once and never updating them (docs rot).
- Omitting error scenarios and edge cases from API documentation.
- ADRs that describe the decision without explaining the alternatives considered.

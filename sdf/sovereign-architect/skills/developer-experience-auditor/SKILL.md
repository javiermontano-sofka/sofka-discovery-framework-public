---
name: developer-experience-auditor
author: JM Labs (Javier Montaño)
description: >
  Developer experience friction analysis, onboarding quality, and tooling assessment.
  Trigger: "audit DX", "developer experience", "onboarding quality", "developer friction".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Developer Experience Auditor

Evaluate the developer experience across setup, development workflow, testing, debugging, and deployment for friction points that slow teams down.

## Guiding Principle

> *"Developer productivity is a multiplier. Every minute of friction compounds across every developer, every day."*

## Procedure

### Step 1 — Setup & Onboarding Assessment
1. Test the README setup instructions for completeness and accuracy.
2. Measure "time to first green build" from a clean clone.
3. Check for setup automation: `make setup`, `docker compose up`, devcontainer config.
4. Identify undocumented prerequisites (tools, versions, environment variables).
5. Assess `.env.example` completeness and variable documentation `[HECHO]`.

### Step 2 — Development Workflow Analysis
1. Evaluate hot reload / watch mode configuration for fast feedback loops.
2. Check linting and formatting configuration: are they consistent and automated?
3. Assess debugging support: source maps, debug configs, logging infrastructure.
4. Verify IDE support: TypeScript configs, editor settings (`.editorconfig`), recommended extensions.
5. Check for local development parity with production (Docker, seed data) `[HECHO]`.

### Step 3 — Testing & CI Friction
1. Measure time to run the test suite locally.
2. Check if tests can run independently (no shared state, no order dependency).
3. Assess test data setup: factories, fixtures, seed scripts.
4. Evaluate CI feedback time from push to result.
5. Check for flaky tests that erode trust in the test suite `[INFERENCIA]`.

### Step 4 — DX Score & Recommendations
1. Score each category: setup (25%), workflow (25%), testing (25%), documentation (25%).
2. Identify the top 3 friction points by developer impact.
3. Recommend quick wins vs. structural improvements.
4. Benchmark against DX best practices.

## Quality Criteria
- Setup instructions tested against actual project state `[HECHO]`
- Friction points quantified with time estimates
- Recommendations prioritized by developer impact
- Both new developer and experienced developer perspectives considered

## Anti-Patterns
- Assuming the README is accurate without actually following the steps
- Ignoring IDE and editor configuration as "not important"
- Measuring only CI time while ignoring local development speed
- Treating DX as a nice-to-have instead of a productivity multiplier

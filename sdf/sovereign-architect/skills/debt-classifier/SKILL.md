---
name: debt-classifier
author: JM Labs (Javier Montaño)
description: >
  Multi-dimensional technical debt classification across architecture, code, test, doc, and infra.
  Trigger: "classify debt", "debt types", "categorize tech debt", "debt dimensions".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Debt Classifier

Classify technical debt across five dimensions — architecture, code, test, documentation, and infrastructure — using a consistent taxonomy to enable targeted remediation.

## Guiding Principle

> *"Not all debt is equal. Classification enables targeted payoff strategies instead of random cleanup."*

## Procedure

### Step 1 — Architecture Debt Identification
1. Detect architectural drift: intended vs. actual patterns.
2. Identify violations of stated architectural boundaries (layer skipping, direct DB access from controllers).
3. Find tightly coupled components that should be independent.
4. Detect missing abstractions: repeated boilerplate that should be a shared service.
5. Flag over-engineering: unnecessary abstractions adding complexity without value `[HECHO]`.

### Step 2 — Code & Test Debt Classification
1. **Code debt**: Dead code, duplicated logic, god classes, feature envy, primitive obsession.
2. **Test debt**: Missing tests on critical paths, flaky tests, tests coupled to implementation.
3. Assess each item: is it deliberate (accepted trade-off) or inadvertent (accumulated)?
4. Tag each with the Fowler quadrant: Reckless-Deliberate, Reckless-Inadvertent, Prudent-Deliberate, Prudent-Inadvertent.
5. Document specific locations and affected modules `[HECHO]`.

### Step 3 — Documentation & Infrastructure Debt
1. **Documentation debt**: Stale docs, missing API documentation, undocumented decisions, no runbooks.
2. **Infrastructure debt**: Manual deployments, missing monitoring, no IaC, outdated base images.
3. **Dependency debt**: Outdated dependencies, abandoned packages, version conflicts.
4. Classify severity: blocking (prevents progress), hindering (slows progress), annoying (minor friction).

### Step 4 — Debt Classification Report
1. Produce a debt register organized by dimension and severity.
2. Map debt to quality attributes affected: maintainability, reliability, security, performance.
3. Identify debt clusters: areas where multiple debt types overlap.
4. Recommend remediation strategy per dimension.

## Quality Criteria
- Debt items classified in at least 2 dimensions (type + intentionality) `[HECHO]`
- Every item traced to specific code or config `[HECHO]`
- Fowler quadrant classification applied consistently
- Debt clusters identified where multiple types compound

## Anti-Patterns
- Classifying everything as "code debt" without distinguishing architectural, test, and infra debt
- Treating all debt as inadvertent (some was deliberate and may still be appropriate)
- Creating a classification system so complex it's never used
- Ignoring documentation and infrastructure debt (they cause cascading issues)

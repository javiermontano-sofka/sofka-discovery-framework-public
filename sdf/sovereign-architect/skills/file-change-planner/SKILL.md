---
name: file-change-planner
author: JM Labs (Javier Montaño)
description: >
  Generates specific file create/modify/delete plans with impact analysis and dependency tracking.
  Trigger: "plan file changes", "what files need to change", "impact analysis for changes".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# File Change Planner

Produces a precise, auditable manifest of every file that must be created, modified, or deleted to implement a given change — including dependency chains, blast-radius analysis, and ordering constraints.

## Guiding Principle

> *"A change you cannot enumerate is a change you cannot control."*

## Procedure

### Step 1 — Scope the Change Request
1. Parse the feature/fix/refactor description into atomic units of work.
2. Identify the primary domain boundaries affected (modules, packages, layers).
3. Classify the change type: additive, modificative, destructive, or mixed.
4. Determine the target branch and baseline commit for diffing.
5. Flag any ambiguities that require stakeholder clarification before proceeding.

### Step 2 — Discover Affected Files
1. Use `Grep` and `Glob` to locate all files matching the affected symbols, imports, and configurations.
2. Walk the dependency graph outward: direct dependents, transitive dependents, test files, config files.
3. Identify collateral files: CI configs, documentation, migration scripts, environment files.
4. Map each file to its owning team or module for review assignment.
5. Tag files as CREATE / MODIFY / DELETE with confidence level.

### Step 3 — Analyze Impact & Risk
1. For each MODIFY file, describe the specific lines/sections that change and why.
2. For each DELETE file, confirm no remaining consumers exist (dead code verification).
3. For each CREATE file, specify the template or pattern it follows.
4. Score blast radius: LOW (1-3 files), MEDIUM (4-10), HIGH (11+), CRITICAL (cross-service).
5. Identify ordering constraints (e.g., migration before schema change before app code).

### Step 4 — Produce the Change Manifest
1. Output a structured table: File Path | Action | Reason | Risk | Order | Owner.
2. Generate a Mermaid dependency graph showing change propagation.
3. List prerequisite changes (other PRs, config deployments, data migrations).
4. Append rollback notes for each file action.
5. Tag every entry with evidence: `[CODIGO]` for confirmed via code, `[INFERENCIA]` for deduced.

## Quality Criteria
- Every file action is traceable to a requirement or dependency.
- Blast-radius score is explicitly stated and justified.
- Ordering constraints prevent broken intermediate states.
- Zero orphan references after DELETE actions are applied.

## Anti-Patterns
- Listing files without explaining *why* each changes (lazy manifests).
- Ignoring test and config files in the change plan.
- Assuming a flat change order when dependencies exist.
- Mixing aspirational refactors into a scoped change plan.

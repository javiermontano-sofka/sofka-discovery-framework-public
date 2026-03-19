---
name: documentation-auditor
author: JM Labs (Javier Montaño)
description: >
  Documentation freshness, coverage, accuracy, and maintainability assessment.
  Trigger: "audit docs", "documentation review", "doc coverage", "README check".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Documentation Auditor

Assess documentation quality across the codebase: freshness, coverage, accuracy against actual code, and maintainability of doc infrastructure.

## Guiding Principle

> *"Stale documentation is worse than no documentation — it actively misleads."*

## Procedure

### Step 1 — Documentation Inventory
1. Locate all documentation: README files, `/docs` directories, inline JSDoc/docstrings, ADRs, wikis.
2. Classify by type: setup guides, API docs, architecture docs, runbooks, ADRs, tutorials.
3. Measure doc volume: total files, word count, last modified dates.
4. Identify auto-generated docs (Typedoc, Javadoc, Sphinx) vs. hand-written.
5. Map documentation gaps: which modules have zero docs `[HECHO]`.

### Step 2 — Freshness Analysis
1. Compare doc modification dates against code modification dates in the same module.
2. Flag docs not updated in >6 months while code changed significantly `[INFERENCIA]`.
3. Check for broken internal links and references.
4. Verify code examples in docs still compile/run.
5. Identify TODO/FIXME markers in documentation.

### Step 3 — Accuracy Verification
1. Cross-reference setup instructions against actual project configuration.
2. Verify API documentation matches implemented endpoints `[HECHO]`.
3. Check architecture diagrams against current code structure.
4. Validate environment variable documentation against actual `.env.example`.
5. Test quickstart instructions for completeness.

### Step 4 — Quality Score
1. Score each doc category: freshness (25%), accuracy (30%), coverage (25%), discoverability (20%).
2. Identify the most critical doc gaps by developer impact.
3. Recommend doc-as-code tooling improvements.
4. Produce a prioritized documentation backlog.

## Quality Criteria
- Freshness based on git history comparison, not assumptions `[HECHO]`
- Accuracy verified by cross-referencing code, not just reading prose
- Coverage measured per module, not just at project level
- Broken links detected and listed

## Anti-Patterns
- Only checking if README exists without reading its content
- Treating auto-generated API docs as sufficient documentation
- Ignoring runbooks and operational docs (they matter most during incidents)
- Measuring documentation by volume instead of utility

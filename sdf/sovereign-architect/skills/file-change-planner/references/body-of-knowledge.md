# File Change Planner — Body of Knowledge

## Core Concepts
- **Change Manifest**: A deterministic, ordered list of file operations required to implement a change.
- **Blast Radius**: The total number of files, modules, and services affected by a change, scored by severity.
- **Dependency Graph Walking**: Tracing imports, references, and configurations outward from the epicenter of change.
- **Ordering Constraints**: Some file changes must precede others to avoid broken intermediate states (e.g., migration before schema).
- **Dead Code Verification**: Before deleting a file, confirming zero remaining consumers through static analysis.
- **Collateral Files**: Non-obvious files affected by a change — CI configs, docs, env files, Dockerfiles.
- **Change Classification**: Additive (new files), Modificative (edits), Destructive (deletions), or Mixed.

## Patterns & Practices
- **Atomic Change Sets**: Group related file changes so each set can be applied or reverted as a unit.
- **Layered Impact Analysis**: Analyze impact at code layer, test layer, config layer, and infrastructure layer independently.
- **Owner Mapping**: Tag each file with its owning team to parallelize review and reduce bottlenecks.
- **Prerequisite Chaining**: Model inter-PR dependencies explicitly so merge order is unambiguous.
- **Risk-Weighted Ordering**: Apply high-risk changes early in the sequence to fail fast.
- **Incremental Verification**: After each phase of the change plan, run relevant tests to catch regressions early.

## Tools & Technologies
- **AST Parsers** (tree-sitter, jscodeshift): For precise symbol-level impact analysis.
- **Dependency Graphers** (madge, deptree, pydeps): Visualize and traverse module dependencies.
- **Git Diff Tools** (git diff --stat, difftastic): Baseline comparison for change enumeration.
- **Codeowners Files**: Map files to teams for automatic reviewer assignment.
- **Mermaid.js**: Render dependency and change-flow diagrams inline.

## References
- Martin Fowler, "Refactoring: Improving the Design of Existing Code" — Change planning fundamentals.
- Michael Feathers, "Working Effectively with Legacy Code" — Safe change strategies in unfamiliar codebases.
- Google Engineering Practices — Large-scale change management at monorepo scale.
- Atlassian Git Tutorials — Branching strategies and change isolation.

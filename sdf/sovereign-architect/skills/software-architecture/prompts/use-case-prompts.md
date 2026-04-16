# Software Architecture — Use Case Prompts

## Prompt 1 — Structural Health Check
> "Analyze the module structure of this codebase. Map dependencies between packages, identify circular dependencies, calculate coupling/cohesion metrics, and produce a dependency graph. Flag the top 5 structural hotspots with refactoring recommendations."

## Prompt 2 — ADR Generation
> "Review recent architectural changes in this repository (last 20 commits). For each significant decision, generate an ADR documenting the context, decision, alternatives considered, and consequences. Use the Nygard template format."

## Prompt 3 — Architecture Style Migration
> "This codebase uses a layered architecture with growing pain points. Evaluate whether hexagonal architecture or clean architecture would be a better fit. Produce a migration plan with concrete refactoring steps, estimated effort, and a dependency diagram for the target state."

# Maintainability Scorer — Body of Knowledge

## Core Concepts
- **Maintainability Index (MI)**: Composite metric derived from Halstead volume, cyclomatic complexity, and lines of code `[HECHO]`
- **Change cost**: The total effort to implement, test, review, and deploy a change; increases with complexity and coupling
- **Logical coupling**: Files that change together in commits but have no structural dependency; reveals hidden relationships `[HECHO]`
- **Code churn**: Frequency and volume of changes to a file; high churn indicates either active development or instability
- **Readability**: How quickly a developer can understand code intent; affected by naming, structure, comments, and consistency
- **Module cohesion**: How strongly the internals of a module relate to each other; high cohesion means focused responsibility

## Patterns & Practices
- **Hotspot analysis**: Prioritize modules with high complexity AND high churn — these have the worst cost/risk ratio
- **Modularity matrix**: Map modules against coupling and cohesion to identify refactoring targets
- **Continuous maintainability**: Track maintainability scores over time in CI to prevent degradation
- **Readability standards**: Consistent formatting, maximum function length, maximum nesting depth as enforced rules
- **Refactoring triggers**: Automated alerts when a module's maintainability score drops below threshold

## Tools & Technologies
- **Quality platforms**: SonarQube (maintainability rating), CodeClimate (maintainability score), Codacy
- **Git analysis**: CodeScene (behavioral analysis), git-of-theseus, Hercules
- **Complexity**: radon (Python), plato (JS), complexity-report, scc
- **Duplication**: jscpd, PMD CPD, Simian, SonarQube duplication detection

## References
- Robert C. Martin — "Clean Code" (readability and naming)
- Adam Tornhill — "Your Code as a Crime Scene" (combining social and technical metrics)
- ISO/IEC 25010 — Software quality model (maintainability characteristic)
- SonarSource — Maintainability rating methodology

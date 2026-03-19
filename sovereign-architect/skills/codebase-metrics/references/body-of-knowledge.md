# Codebase Metrics — Body of Knowledge

## Core Concepts
- **Cyclomatic complexity (McCabe)**: Number of linearly independent paths through a function; directly correlates with testing effort `[HECHO]`
- **Cognitive complexity (SonarQube)**: Measures how difficult code is to understand, penalizing nesting and flow breaks more than simple branching
- **Afferent/efferent coupling**: Incoming vs. outgoing dependencies; the balance determines module stability
- **LCOM (Lack of Cohesion of Methods)**: Measures how well a class's methods relate to its fields; high LCOM suggests the class should be split
- **Instability index**: I = Ce/(Ca+Ce); ranges from 0 (stable) to 1 (unstable); should correlate with abstractness
- **Halstead metrics**: Volume, difficulty, and effort based on operators and operands; less commonly used but valuable for complexity estimation
- **Churn rate**: Frequency of file changes; high churn + high complexity = top refactoring priority

## Patterns & Practices
- **Hotspot analysis**: Combine complexity + churn to find files that are both complex and frequently changed
- **Abstractness-instability balance**: Stable modules should be abstract; unstable modules should be concrete (Robert C. Martin)
- **Modular decomposition**: When a module's metrics exceed thresholds, extract cohesive submodules
- **Complexity budgets**: Set per-function and per-file complexity limits in CI/CD gates
- **Trend tracking**: Track metrics over time to detect degradation before it becomes critical

## Tools & Technologies
- **Multi-language**: SonarQube, CodeClimate, Codacy
- **JavaScript/TypeScript**: ESLint complexity rules, plato, typescript-eslint
- **Java**: PMD, Checkstyle, JaCoCo
- **Python**: radon, pylint, flake8 cognitive-complexity plugin

## References
- Thomas J. McCabe — "A Complexity Measure" (IEEE, 1976)
- Robert C. Martin — "Clean Architecture" (stability metrics)
- Adam Tornhill — "Your Code as a Crime Scene" (hotspot analysis)
- SonarSource — Cognitive Complexity specification

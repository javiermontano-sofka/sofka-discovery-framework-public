# Diagnostic Engine — Body of Knowledge

## Core Concepts
- **Root cause vs. symptom**: Symptoms are observable effects (slow response times); root causes are underlying conditions (missing database index on a hot query path). Treating symptoms without identifying causes guarantees recurrence
- **Evidence classification hierarchy**: Facts (directly observable) carry more weight than inferences (logically derived), which carry more weight than assumptions (unverified). Every finding must declare its evidence level
- **Friction taxonomy**: Technical friction falls into 10 categories — ambiguity, technical debt, coupling, security, testing gaps, maintainability, observability, performance, developer experience, deployment risk
- **Signal-to-noise ratio**: Not every code smell is a problem. Severity depends on blast radius (how much is affected), frequency (how often it's triggered), and recoverability (how hard it is to fix when it breaks)
- **Diagnostic convergence**: Multiple independent signals pointing to the same root cause increase confidence. A single signal is a hypothesis; three correlated signals are a finding
- **Gap transparency**: Explicitly declaring what you don't know is as valuable as declaring what you do know — it prevents false confidence and guides next steps
- **Debt quantification**: Technical debt should be measured in concrete terms — hours to remediate, blast radius if ignored, rate of interest accumulation (how fast it gets worse)

## Patterns & Practices
- **Five Whys**: Iterative questioning that peels back layers from symptom to root cause; stops when the answer is a systemic or structural issue
- **Fault tree analysis**: Top-down deductive approach that maps how a failure can occur through combinations of lower-level events
- **DORA metrics correlation**: Deployment frequency, lead time, change failure rate, and MTTR provide systemic health signals beyond individual code issues
- **Hotspot analysis**: Combining code complexity with change frequency reveals files that are both complex and frequently modified — highest ROI for refactoring
- **Dependency graph analysis**: Circular dependencies, hub modules with excessive afferent coupling, and orphan modules signal structural problems

## Tools & Technologies
- **Static analysis**: ESLint, SonarQube, Semgrep, CodeClimate for automated code quality signals
- **Complexity metrics**: Cyclomatic complexity (McCabe), cognitive complexity (SonarSource), Halstead metrics for maintainability indices
- **Dependency analysis**: dependency-cruiser (JS/TS), madge (circular deps), deptree, cargo-tree (Rust)
- **Git forensics**: git log analysis for hotspot detection, code churn metrics, authorship distribution
- **Runtime diagnostics**: OpenTelemetry traces, flame graphs, heap snapshots for performance root causes

## References
- "Your Code as a Crime Scene" — Adam Tornhill (hotspot analysis, change coupling, temporal analysis)
- OWASP Top 10 — Canonical security vulnerability categories
- DORA State of DevOps Reports — Engineering performance metrics and their correlations
- "Accelerate" — Forsgren, Humble, Kim (scientific basis for software delivery performance)

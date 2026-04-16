# Metaprompts — LeSS/Nexus Framework

## Metaprompt 1: Scaling Necessity Validator

**Strategy**: Challenge whether scaling is actually needed or if team optimization would be more effective.

**Protocol**:
1. Assess current team performance against capability
2. Identify whether bottlenecks are team-level or coordination-level
3. Calculate coordination cost of adding teams
4. Compare: optimizing fewer teams vs. adding more teams
5. Recommend scale-up only if optimization ceiling is reached

**Activation**:
> "Before scaling, validate that scaling is the right answer. Are current teams performing at their potential? Would optimizing 3 teams deliver more than adding 2 more teams with coordination overhead? Only recommend scaling if optimization headroom is exhausted."

## Metaprompt 2: Integration Risk Assessment

**Strategy**: Evaluate the risk of integration failures in the multi-team setup.

**Protocol**:
1. Map all inter-team integration points
2. Assess technical integration complexity per point
3. Evaluate team integration discipline (CI practices, test coverage)
4. Model integration failure probability per sprint
5. Design integration safeguards proportional to risk

**Activation**:
> "Assess integration risk for this multi-team setup. Map all integration points, evaluate technical complexity and team discipline, and model failure probability. Design integration safeguards that prevent integration debt accumulation."

## Metaprompt 3: Cross-Team Dependency Minimizer

**Strategy**: Restructure team boundaries to minimize cross-team dependencies.

**Protocol**:
1. Map current cross-team dependencies (frequency, type, impact)
2. Identify the top 5 dependency-generating architectural boundaries
3. Propose team boundary adjustments that internalize top dependencies
4. Model residual dependencies after restructuring
5. Design coordination mechanisms only for remaining dependencies

**Activation**:
> "Minimize cross-team dependencies by restructuring team boundaries. Map all current dependencies, identify their architectural roots, and propose team compositions that internalize the highest-frequency dependencies. Design minimal coordination for what remains."

*PMO-APEX v1.0 — Metaprompts · LeSS/Nexus Framework*

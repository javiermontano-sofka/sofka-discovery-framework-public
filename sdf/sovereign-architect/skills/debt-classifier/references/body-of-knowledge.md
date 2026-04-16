# Debt Classifier — Body of Knowledge

## Core Concepts
- **Fowler's debt quadrant**: Reckless/Prudent x Deliberate/Inadvertent creates four debt types requiring different management strategies `[HECHO]`
- **Architecture debt**: Violations of intended architectural patterns; the most expensive debt to remediate
- **Code debt**: Localized quality issues (duplication, complexity, dead code) — cheapest to fix individually
- **Test debt**: Missing or low-quality tests that increase the cost and risk of every future change
- **Documentation debt**: Gaps that force developers to read code or ask colleagues for context
- **Infrastructure debt**: Manual processes, outdated tooling, missing automation that slows delivery
- **Dependency debt**: Outdated or abandoned libraries that accumulate security and compatibility risk

## Patterns & Practices
- **Debt dimension matrix**: Classify each item by type (arch/code/test/doc/infra) and intentionality (deliberate/inadvertent)
- **Severity levels**: Blocking (prevents work), hindering (slows work), annoying (minor friction), cosmetic (style only)
- **Debt clustering**: Areas where multiple debt types overlap indicate systemic issues requiring holistic remediation
- **Debt budgeting**: Allocate a percentage of each sprint to debt payoff based on classification priorities
- **Debt visibility**: Make debt visible through labels, dashboards, and sprint reporting

## Tools & Technologies
- **Static analysis**: SonarQube (debt quantification), ESLint, PMD, pylint
- **Architecture testing**: ArchUnit, dependency-cruiser, deptrac
- **Duplication detection**: jscpd, PMD CPD, Simian
- **Dependency analysis**: npm-check-updates, pip-review, dependabot

## References
- Martin Fowler — "Technical Debt Quadrant"
- Ward Cunningham — Original debt metaphor (1992)
- Philippe Kruchten et al. — "Managing Technical Debt" (IEEE Software)
- Adam Tornhill — "Software Design X-Rays"

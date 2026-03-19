# Tech Debt Quantifier — Body of Knowledge

## Core Concepts
- **Technical debt quadrant** (Martin Fowler): Deliberate/Inadvertent x Reckless/Prudent — four types of debt with different management strategies `[HECHO]`
- **Debt interest**: The ongoing cost of not paying back debt — slower development, more bugs, harder onboarding
- **Debt principal**: The effort required to fix the underlying issue
- **Debt compounding**: Debt that makes other changes harder, increasing future debt accumulation
- **Code entropy**: Codebases naturally degrade over time without intentional maintenance; second law of software engineering
- **Opportunity cost**: Every hour spent working around debt is an hour not spent on features

## Patterns & Practices
- **Debt register**: A living inventory of known debt items with owner, priority, and estimated cost
- **Debt sprints**: Dedicated time (e.g., 20% of sprint capacity) for debt reduction
- **Boy Scout Rule**: Leave code cleaner than you found it — incremental debt reduction with every change
- **Strangler pattern**: Gradually replace legacy components rather than big-bang rewrites
- **Fitness functions**: Automated architecture tests that detect debt accumulation (ArchUnit, dependency-cruiser)
- **Hotspot analysis**: Prioritize debt remediation where complexity and change frequency intersect

## Tools & Technologies
- **Code analysis**: SonarQube (tech debt calculation), CodeClimate, Codacy
- **TODO tracking**: todo-tree (VS Code), Tickgit, grep-based custom scripts
- **Dependency analysis**: dependency-cruiser, Madge, ArchUnit
- **Git analysis**: git-of-theseus, code-forensics, CodeScene

## References
- Ward Cunningham — Original "debt metaphor" (1992 OOPSLA)
- Martin Fowler — "Technical Debt Quadrant"
- Adam Tornhill — "Software Design X-Rays" (behavioral code analysis)
- Philippe Kruchten — "Managing Technical Debt" (SEI/CMU)

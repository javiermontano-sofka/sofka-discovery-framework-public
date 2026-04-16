# Friction Detector — Body of Knowledge

## Core Concepts
- **Friction taxonomy**: Build, complexity, coupling, naming, pattern, abstraction, review, testing, deployment, communication — 10 categories covering the full development lifecycle
- **Friction compounding**: Small frictions multiply; a 5-minute friction hit 20 times a day costs over 1.5 hours
- **Cognitive load theory**: Limited working memory means every unnecessary friction point displaces productive thinking `[HECHO]`
- **Flow state disruption**: Context switches and waiting periods break developer flow; resumption costs 15-25 minutes per interruption `[HECHO]`
- **Invisible friction**: Teams often normalize friction over time; external assessment reveals what insiders no longer notice
- **Friction velocity**: Some frictions are constant (always present), others are triggered (appear in specific workflows)

## Patterns & Practices
- **Friction audits**: Periodic systematic assessment of all friction categories with scoring
- **Value stream mapping**: Trace the full path from code change to production to identify wait times and handoffs
- **Automation-first**: If a human does it more than twice, automate it
- **Inner loop optimization**: Prioritize reducing friction in the code-build-test inner loop (highest frequency)
- **Friction budgets**: Set maximum acceptable friction per category and track against it

## Tools & Technologies
- **Build optimization**: Turborepo, Nx, ccache, Gradle build cache
- **Code quality**: Linters, formatters, type checkers running in real-time
- **Process automation**: GitHub Actions, pre-commit hooks, auto-labeling, auto-assignment
- **Communication**: ADRs, RFCs, runbooks, incident response templates

## References
- Gene Kim et al. — "The DevOps Handbook" (flow and friction)
- Nicole Forsgren et al. — "Accelerate" (DORA metrics)
- Daniel Kahneman — "Thinking, Fast and Slow" (cognitive load)
- Spotify Engineering Culture — Autonomous squads and friction reduction

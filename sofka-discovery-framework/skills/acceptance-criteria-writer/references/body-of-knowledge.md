# Acceptance Criteria Writer — Body of Knowledge

## Core Concepts
- **Given/When/Then (Gherkin)**: A structured format for expressing acceptance criteria — Given preconditions, When an action occurs, Then expected outcomes.
- **Testable Criteria**: Each criterion must be verifiable through automated or manual testing without subjective interpretation.
- **Happy Path**: The primary success scenario assuming ideal conditions and valid inputs.
- **Edge Cases**: Boundary conditions, unusual inputs, and limit scenarios that the system must handle gracefully.
- **Error Scenarios**: Explicit definitions of how the system behaves when things go wrong.
- **Definition of Done**: The agreement between product and engineering on what "complete" means for a user story.
- **INVEST Criteria**: User stories should be Independent, Negotiable, Valuable, Estimable, Small, and Testable.

## Patterns & Practices
- **Scenario Outline**: Parameterized Gherkin scenarios that test the same behavior with different data sets.
- **Rule-Example Pattern**: State the business rule, then provide concrete examples that illustrate it.
- **Negative Testing First**: Write error and edge case criteria before happy paths to force thorough thinking.
- **Three Amigos**: Product owner, developer, and tester collaborate on acceptance criteria before sprint.
- **Example Mapping**: Use concrete examples, rules, and questions to explore requirements before writing criteria.
- **Specification by Example**: Bridge business and engineering by using real examples as the specification.

## Tools & Technologies
- **BDD Frameworks**: Cucumber (multi-language), Behave (Python), SpecFlow (.NET), Karate (API).
- **Specification Tools**: FitNesse, Concordion, Gauge.
- **Story Mapping**: Miro, Jira, Clubhouse for organizing stories and their acceptance criteria.
- **Test Management**: TestRail, Zephyr, qTest for tracking criteria-to-test mapping.

## References
- Dan North, "Introducing BDD" — Original article defining Behavior-Driven Development.
- Gojko Adzic, "Specification by Example" — Using examples to drive development.
- Matt Wynne & Aslak Hellesoy, "The Cucumber Book" — Practical BDD with Gherkin.
- Mike Cohn, "User Stories Applied" — Writing effective user stories with acceptance criteria.

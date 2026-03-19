# API Architecture — Use Case Prompts

## Prompt 1 — API Design Review
> "Review the API design of this service. Check resource naming, HTTP method usage, error responses, pagination, versioning, and OpenAPI spec completeness. Score against Google/Microsoft API design guidelines and produce a findings report with fix recommendations."

## Prompt 2 — API Governance Framework
> "Design an API governance framework for this organization. Define naming conventions, versioning strategy, deprecation process, review workflow, and style guide. Produce a governance document and linting rules that can be enforced in CI."

## Prompt 3 — API Migration Strategy
> "This system needs to migrate from REST to GraphQL for its frontend APIs while keeping REST for third-party integrations. Design the migration strategy including schema design, resolver architecture, performance optimization (N+1, DataLoader), and rollout plan."

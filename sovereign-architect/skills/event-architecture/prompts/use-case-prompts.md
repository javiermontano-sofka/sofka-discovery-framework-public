# Event Architecture — Use Case Prompts

## Prompt 1 — Event Catalog Generation
> "Analyze this microservices codebase and discover all events being produced and consumed. Generate an event catalog with event names, schemas, producers, consumers, and topic/partition assignments. Identify undocumented events and schema inconsistencies."

## Prompt 2 — Saga Design
> "Design a saga for this multi-service transaction (e.g., order placement spanning inventory, payment, and shipping). Define each step, its compensation action, failure handling, and timeout strategy. Choose between orchestration and choreography with rationale."

## Prompt 3 — CQRS Migration Assessment
> "Assess whether CQRS is appropriate for this service. Analyze read/write ratios, query complexity, scalability requirements, and consistency needs. If CQRS is recommended, design the command model, query model, projection logic, and eventual consistency strategy."

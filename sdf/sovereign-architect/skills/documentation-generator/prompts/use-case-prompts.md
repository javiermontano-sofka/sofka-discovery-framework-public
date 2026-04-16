# Documentation Generator — Use Case Prompts

## Prompt 1: README for Open Source Library
> Analyze this TypeScript utility library and generate a complete README with: project description, installation instructions for npm/yarn/pnpm, API reference with examples for each exported function, configuration options, contributing guidelines, and license section. Target audience: external developers discovering the library for the first time.

## Prompt 2: Operational Runbook
> Generate a runbook for our Kubernetes-deployed payment service. Include procedures for: routine deployment, emergency rollback, database failover, scaling during peak load, investigating payment failures, and rotating API keys. Each procedure should have exact commands, expected outputs, and escalation paths.

## Prompt 3: Architecture Decision Record
> We decided to migrate from REST to GraphQL for our customer-facing API gateway. Write an ADR capturing: the context (growing number of mobile clients, over-fetching issues, multiple round trips), alternatives considered (REST with sparse fieldsets, BFF pattern, gRPC-Web), the decision and its rationale, and the consequences (learning curve, tooling changes, caching complexity).

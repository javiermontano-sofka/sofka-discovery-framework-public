# Observability Design — Use Case Prompts

## Prompt 1: Microservices Observability Stack
> Design the observability architecture for a microservices platform with 15 services running on Kubernetes. Requirements: distributed tracing across all services, structured logging with correlation IDs, RED metrics per service, SLOs for the 3 critical user journeys (login, search, checkout), and a dashboard hierarchy from system overview to individual trace inspection. Budget constraint: prefer open-source tooling. Define the OpenTelemetry collector pipeline and sampling strategy.

## Prompt 2: SaaS Platform SLO Framework
> Design an SLO framework for a B2B SaaS analytics platform. Define SLIs and SLOs for: API availability (target 99.95%), dashboard load time (p95 < 3s), data pipeline freshness (data available within 15 minutes of ingestion), and report generation time (p95 < 30s). Include error budget policies, alerting rules based on burn rate, and the escalation process when error budget is exhausted. Specify what happens to feature releases when budget is consumed.

## Prompt 3: Multi-Region Observability
> Design the observability architecture for a globally distributed application running in 3 AWS regions (us-east-1, eu-west-1, ap-southeast-1). Challenges: correlating traces that span regions, aggregating metrics across regions without exceeding cross-region data transfer costs, centralized alerting with region-aware context, and compliance with EU data residency requirements for logs containing PII. Define the telemetry pipeline topology and data routing rules.

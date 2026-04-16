# Monitoring Setup — Use Case Prompts

## Prompt 1: E-Commerce Platform SLOs
> Define SLOs, dashboards, and alerting for an e-commerce platform with these critical journeys: product search, add-to-cart, checkout, and order tracking. The platform runs on Kubernetes with a React frontend, Node.js BFF, and 5 backend microservices. We use Datadog for monitoring. Define SLIs, SLO targets, error budgets, and burn-rate alert thresholds for each journey.

## Prompt 2: Startup Monitoring from Scratch
> We are a 10-person startup with a Django + PostgreSQL + Redis stack deployed on AWS. We have zero monitoring. Design a monitoring setup that we can implement in 1 sprint. Prioritize: what to monitor first, which tool to adopt (cost-sensitive), the 5 most important alerts, and a single dashboard that gives us operational visibility. Budget: $200/month for tooling.

## Prompt 3: Error Budget Policy
> Our API platform SLO is 99.95% availability (21.9 minutes of downtime per month). We have been burning error budget faster than expected due to weekly deployments. Design an error budget policy that defines: escalation thresholds (50%, 75%, 100% budget consumed), actions at each threshold, freeze criteria, and the process for requesting error budget exceptions for high-priority features.

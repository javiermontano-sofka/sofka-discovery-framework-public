# Deployment Strategy — Use Case Prompts

## Prompt 1: Zero-Downtime Kubernetes Deployment
> Design a deployment strategy for a Kubernetes-based e-commerce platform (12 services, 3 environments). Requirements: zero-downtime deployments, automated canary analysis comparing latency and error rate against baseline, database migrations that don't break rollback, and the ability to deploy any service independently. The team currently deploys once a week and wants to move to daily deployments. Define the CI/CD pipeline, canary promotion criteria, and rollback procedures.

## Prompt 2: Feature Flag Architecture for SaaS
> Design a feature flag architecture for a B2B SaaS product with 200 tenants. Requirements: per-tenant feature enablement (beta features for select tenants), percentage-based rollouts for all tenants, kill switches for instant feature disablement, flag cleanup policy to prevent debt, and audit logging of all flag changes. The team uses Next.js (frontend) + Node.js (backend). Select the flag management tool and define the integration architecture.

## Prompt 3: Multi-Region Progressive Delivery
> Design a progressive delivery pipeline for a globally distributed API serving 3 regions (US, EU, APAC). Requirements: deploy to one region first as canary, promote to remaining regions if metrics pass, automated rollback if any region degrades, and the ability to pause mid-rollout for manual review. The system runs on AWS EKS with Istio service mesh. Define the region rollout order, promotion gates, and cross-region metric aggregation strategy.

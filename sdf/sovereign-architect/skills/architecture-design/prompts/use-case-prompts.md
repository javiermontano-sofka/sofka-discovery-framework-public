# Architecture Design — Use Case Prompts

## Prompt 1: Greenfield Service Design
> "We need to design a new notification service that handles email, SMS, and push notifications. We expect 50K events/day initially, growing to 2M/day within a year. The team is 3 backend engineers familiar with Node.js. Design the architecture with at least 3 options and explicit trade-offs."

## Prompt 2: Monolith Decomposition Strategy
> "Our Rails monolith is 200K LOC and deployments take 45 minutes. The payments module changes weekly but the user profile module hasn't changed in months. Propose an architecture for extracting the payments domain as a separate service, including the data separation strategy."

## Prompt 3: Technology Migration
> "We're considering migrating from REST to gRPC for our internal service-to-service communication. We have 12 microservices, 4 teams, and a mix of Java and Go. Evaluate this migration with a trade-off matrix and recommend a phased approach if warranted."

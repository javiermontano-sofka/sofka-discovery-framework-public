# Resilience Design — Use Case Prompts

## Prompt 1: Payment Processing Resilience
> Design the resilience architecture for a payment processing service that integrates with 3 external payment gateways (Stripe, Adyen, PayU). Requirements: if the primary gateway is down, automatically failover to the secondary; retry transient failures without double-charging customers; circuit breaker to prevent cascading failures to downstream services; and a graceful degradation plan where checkout shows "payment temporarily unavailable" only as a last resort. Define timeout values, retry policies, circuit breaker thresholds, and the failover decision logic.

## Prompt 2: Microservices Cascade Prevention
> Design resilience patterns for a microservices system where Service A calls Service B, which calls Service C and Service D. Currently, when Service D experiences latency spikes (3x normal), all upstream services degrade because they exhaust their thread pools waiting for responses. Design bulkhead isolation, timeout cascades, circuit breaker configuration, and load shedding strategy to prevent this cascade. Include specific timeout values and thread pool sizes.

## Prompt 3: Chaos Engineering Program
> Design a chaos engineering program for a fintech platform running 20 microservices on Kubernetes. The platform has never done chaos testing. Define: the maturity roadmap (from first experiment to regular production chaos), the first 5 experiments to run (with hypotheses and abort conditions), the tooling selection, the blast radius controls, and the game day schedule. The team is concerned about running experiments in production — address their objections with safety measures.

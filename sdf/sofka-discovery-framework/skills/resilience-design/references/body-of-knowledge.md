# Resilience Design — Body of Knowledge

## Core Concepts
- **Circuit Breaker**: A state machine (Closed → Open → Half-Open) that monitors failure rates and stops calling a failing service, allowing it time to recover.
- **Exponential Backoff with Jitter**: Retry strategy where wait time doubles on each retry, plus a random jitter to prevent synchronized retries across clients.
- **Bulkhead**: Isolating components into separate resource pools (thread pools, connection pools) so that one failing component cannot starve others.
- **Timeout**: An upper bound on how long to wait for a response. Critical for preventing thread/connection exhaustion.
- **Fallback**: A degraded but functional response returned when the primary path fails (e.g., cached data, default values).
- **Idempotency**: Designing operations so that repeated execution produces the same result, enabling safe retries.
- **Chaos Engineering**: The discipline of experimenting on a system to build confidence in its ability to withstand turbulent conditions in production.
- **Blast Radius**: The scope of impact when a failure occurs. Resilience patterns aim to minimize blast radius.

## Patterns & Practices
- **Retry Budget**: Limit the total number of retries across all clients to a percentage of normal traffic (e.g., 10%), preventing retry storms from overwhelming a recovering service.
- **Hedged Requests**: Send the same request to multiple backends simultaneously; use the first response and cancel the rest. Reduces tail latency at the cost of increased load.
- **Graceful Degradation Ladder**: Define levels of degradation (L0: full service → L1: cached data → L2: static fallback → L3: maintenance page) with automated transitions.
- **Readiness vs. Liveness Probes**: Liveness: restart if the process is stuck. Readiness: stop routing traffic if the service cannot handle requests. Misconfiguring these causes cascading failures.
- **Steady-State Hypothesis**: Before running chaos experiments, define what "normal" looks like in measurable metrics to detect deviations.
- **Game Day**: A scheduled practice session where the team deliberately injects failures and practices incident response.

## Tools & Technologies
- **Resilience4j**: Java library implementing circuit breaker, retry, rate limiter, bulkhead, and time limiter patterns.
- **Polly (.NET)**: .NET resilience library with policies for retry, circuit breaker, timeout, bulkhead, fallback, and hedging.
- **Istio / Linkerd**: Service mesh with built-in retry, timeout, and circuit breaker policies at the network level.
- **Chaos Monkey / Litmus Chaos**: Tools for injecting failures in production (kill instances, add latency, network partition).
- **Gremlin**: Commercial chaos engineering platform with controlled experiments and safety measures.
- **Toxiproxy (Shopify)**: TCP proxy for simulating network conditions (latency, bandwidth, disconnects) in test environments.

## References
- Nygard, M., "Release It!" (Pragmatic Bookshelf, 2nd edition, 2018).
- Netflix Technology Blog — "Principles of Chaos Engineering" (principlesofchaos.org).
- Google SRE Book — "Handling Overload" and "Addressing Cascading Failures" chapters.
- Rosenthal, C. & Jones, N., "Chaos Engineering" (O'Reilly, 2020).

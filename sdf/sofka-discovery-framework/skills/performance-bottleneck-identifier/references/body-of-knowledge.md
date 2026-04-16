# Performance Bottleneck Identifier — Body of Knowledge

## Core Concepts
- **Theory of Constraints (Goldratt)**: System throughput is limited by its single weakest link; optimizing non-constraints yields zero improvement `[HECHO]`
- **Amdahl's Law**: Speedup from parallelization is limited by the sequential portion of the workload
- **Little's Law**: L = lambda * W (items in system = arrival rate * wait time); fundamental for queue analysis
- **USE Method (Brendan Gregg)**: For each resource check Utilization, Saturation, and Errors
- **RED Method**: For services measure Rate, Errors, and Duration
- **Latency breakdown**: Decomposing total latency into component contributions to identify where time is spent

## Patterns & Practices
- **Flame graph analysis**: Visualize CPU time distribution across call stacks to identify hot functions
- **Distributed tracing**: Follow requests across service boundaries with span-level timing (OpenTelemetry)
- **Load shedding**: Reject excess requests gracefully rather than degrading all requests
- **Connection pooling tuning**: Size pools based on workload characteristics and resource limits
- **Batch processing**: Combine many small operations into fewer large ones to amortize overhead
- **Circuit breaking**: Fail fast on known-broken dependencies to prevent cascade failures

## Tools & Technologies
- **Profilers**: pprof (Go), py-spy (Python), async-profiler (JVM), Chrome DevTools (JS)
- **Tracing**: Jaeger, Zipkin, OpenTelemetry, Datadog APM
- **Load testing**: k6, Locust, Gatling, wrk
- **System profiling**: perf, DTrace, bpftrace, eBPF

## References
- Brendan Gregg — "Systems Performance: Enterprise and the Cloud"
- Eliyahu Goldratt — "The Goal" (Theory of Constraints)
- Google SRE Book — Performance and capacity planning chapters
- OpenTelemetry documentation — Distributed tracing specification

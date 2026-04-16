# Performance Engineering — Body of Knowledge

## Core Concepts
- **Latency Percentiles**: p50 (median), p95, p99 response times — focus on tail latency for user experience
- **Throughput**: Requests per second (RPS) or transactions per second (TPS) the system can sustain
- **Amdahl's Law**: The theoretical speedup of a program is limited by the portion that cannot be parallelized
- **Little's Law**: L = lambda * W (concurrent users = arrival rate * average response time)
- **Cache Hit Ratio**: Percentage of requests served from cache vs. origin — target >90% for read-heavy workloads
- **Performance Budget**: Maximum allocated time for each phase of page load or request processing
- **Capacity Planning**: Projecting resource needs based on growth rate, traffic patterns, and headroom requirements

## Patterns
- **Multi-Level Caching**: CDN → reverse proxy → application cache → database cache for progressive fallback
- **Read-Through / Write-Through Cache**: Cache automatically populated on miss, updated on write
- **Connection Pooling**: Reusing database and HTTP connections to amortize connection setup cost
- **Async Processing**: Moving non-critical work off the request path to background queues
- **Graceful Degradation**: Reducing functionality rather than failing completely under extreme load

## Tools & Frameworks
- **k6 / Gatling / Locust**: Load testing frameworks for HTTP, WebSocket, and gRPC
- **Grafana / Prometheus**: Metrics collection and visualization for performance monitoring
- **Jaeger / Tempo**: Distributed tracing for request path analysis
- **pprof / async-profiler / perf**: CPU and memory profiling tools
- **Redis / Memcached / Varnish**: Caching infrastructure at different layers

## References
- Brendan Gregg — *Systems Performance* (2nd ed., 2020)
- Martin Thompson — *Mechanical Sympathy* (blog and talks on high-performance systems)
- Google SRE Book — Performance and capacity planning chapters
- Neil Gunther — *Guerrilla Capacity Planning* (2007)

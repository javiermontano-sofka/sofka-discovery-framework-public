# Observability Gap Analyzer — Sample Output

## Context
Analyzing observability of a microservices platform with 6 services.

## Output

### Pillar Assessment

| Pillar | Score | Key Findings |
|--------|-------|-------------|
| Logging | 55/100 | Structured in 4/6 services; PII leaks in 2 services `[HECHO]` |
| Metrics | 40/100 | Only basic host metrics; no RED/USE; no business metrics `[HECHO]` |
| Tracing | 20/100 | OpenTelemetry SDK imported but not configured; no spans `[HECHO]` |

### Critical Blind Spots

| Scenario | Detectable? | Diagnosable? | Gap |
|----------|------------|-------------|-----|
| API latency spike | No | No | No latency metrics or tracing `[HECHO]` |
| Database connection exhaustion | No | No | No connection pool metrics `[HECHO]` |
| Payment processing failure | Yes (error log) | Partially | No trace across payment service boundary `[HECHO]` |
| Memory leak in worker | No | No | No memory utilization metrics `[HECHO]` |
| Auth service down | Yes (health check) | No | No dependency health in logs `[HECHO]` |

### Logging Issues
- `user-service`: Logs contain unmasked email addresses and phone numbers `[HECHO]`
- `payment-service`: Logs raw request bodies including card tokens `[HECHO]`
- 2 services use `console.log` instead of structured logger `[HECHO]`

### Recommendations (Priority Order)
1. Configure OpenTelemetry tracing with context propagation (all 6 services)
2. Add Prometheus metrics: request rate, error rate, duration per service
3. Mask PII in logging pipeline
4. Add connection pool and memory metrics
5. Create alerting rules for SLOs with linked runbooks

### Overall Observability Score: 38/100

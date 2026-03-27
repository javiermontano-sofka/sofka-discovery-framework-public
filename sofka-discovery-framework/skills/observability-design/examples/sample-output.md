# Observability Design — Sample Output

## Context
An online marketplace with 8 microservices needs an observability architecture. Services: API Gateway, User Service, Product Service, Search Service, Cart Service, Order Service, Payment Service, Notification Service. Running on EKS with ~200 pods total.

## Output

### SLI/SLO Definitions

| User Journey | SLI | SLO | Error Budget (30 days) |
|-------------|-----|-----|----------------------|
| Product Search | p95 search latency | < 300ms for 99.5% of requests | 0.5% = ~2.16 hours of degradation |
| Checkout Flow | End-to-end success rate | 99.9% successful checkouts | 0.1% = ~43 minutes of failures |
| Product Page Load | p95 page latency | < 500ms for 99% of requests | 1% = ~7.2 hours of degradation |

### Telemetry Pipeline

```
┌──────────────┐     ┌──────────────────┐     ┌─────────────────┐
│  Application │     │  OTel Collector   │     │  Backends        │
│  (OTel SDK)  │────>│  (DaemonSet)      │────>│                  │
│              │     │                    │     │  Traces → Tempo  │
│  Auto-instr: │     │  Processors:       │     │  Metrics → Prom  │
│  - HTTP      │     │  - batch           │     │  Logs → Loki     │
│  - gRPC      │     │  - memory_limiter  │     │                  │
│  - DB clients│     │  - tail_sampling   │     │  Dashboards:     │
│  - Redis     │     │  - attributes      │     │  Grafana         │
│              │     │                    │     │                  │
│  Custom:     │     │  Exporters:        │     │  Alerting:       │
│  - Biz events│     │  - otlphttp/tempo  │     │  AlertManager    │
│  - Decisions │     │  - prometheusrw    │     │  → PagerDuty     │
│              │     │  - loki            │     │  → Slack          │
└──────────────┘     └──────────────────┘     └─────────────────┘
```

### Structured Log Format

```json
{
  "timestamp": "2026-03-15T14:30:00.123Z",
  "level": "INFO",
  "service": "order-service",
  "version": "2.3.1",
  "trace_id": "abc123def456",
  "span_id": "789ghi012",
  "message": "Order created successfully",
  "order_id": "ord_xK7mQ2",
  "customer_id": "cust_3nR9",
  "total_amount_cents": 15000,
  "item_count": 3,
  "duration_ms": 145
}
```

### Metrics per Service (RED + USE)

| Metric | Type | Labels | Description |
|--------|------|--------|-------------|
| `http_requests_total` | Counter | service, method, path, status_code | Total HTTP requests |
| `http_request_duration_seconds` | Histogram | service, method, path | Request latency distribution |
| `http_requests_in_flight` | Gauge | service | Current active requests |
| `db_query_duration_seconds` | Histogram | service, operation, table | Database query latency |
| `container_cpu_usage_seconds` | Counter | pod, namespace | CPU utilization (USE) |
| `container_memory_working_set_bytes` | Gauge | pod, namespace | Memory utilization (USE) |

### Sampling Strategy

| Condition | Sampling Rate | Rationale |
|-----------|:---:|-----------|
| Default (healthy requests) | 5% | Sufficient for baseline analysis at 200K req/day |
| Errors (status >= 500) | 100% | Always capture errors for debugging |
| High latency (> 2x SLO) | 100% | Capture slow requests for performance analysis |
| Checkout flow | 50% | Higher sampling for critical business path |
| Health checks | 0% | No value in tracing health probes |

### Dashboard Hierarchy

| Level | Dashboard | Key Panels | Audience |
|-------|-----------|-----------|----------|
| L0 | System Overview | SLO burn rates, service health matrix, active incidents | On-call engineer (first glance) |
| L1 | Service Detail | RED metrics per endpoint, resource utilization, dependency health | Service team |
| L2 | Endpoint Detail | Latency percentiles, error breakdown, slow query analysis | Developers debugging |
| L3 | Trace Explorer | Waterfall trace view, span details, correlated logs | Deep investigation |

### Alert Rules

| Alert | Condition | Severity | Notification |
|-------|-----------|----------|-------------|
| SLO Burn Rate - Search | Burn rate > 10x for 5 min | P1 (Critical) | PagerDuty → on-call |
| SLO Burn Rate - Checkout | Burn rate > 5x for 15 min | P1 (Critical) | PagerDuty → on-call |
| Error Rate Spike | > 5% 5xx for any service for 3 min | P2 (High) | Slack #alerts + PagerDuty |
| Latency Degradation | p95 > 2x baseline for 10 min | P3 (Medium) | Slack #alerts |
| Pod Restart Loop | > 3 restarts in 15 min | P2 (High) | Slack #platform |
| Disk Usage | > 85% on any PV | P3 (Medium) | Slack #platform |

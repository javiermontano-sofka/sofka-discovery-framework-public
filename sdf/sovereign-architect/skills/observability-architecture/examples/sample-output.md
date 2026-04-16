# Observability Architecture — Sample Output

## Context
A platform with 12 microservices, basic logging, no tracing, and alert fatigue (200+ alerts/week, 80% non-actionable) needs a full observability overhaul.

## Output: SLO Framework

| User Journey | SLI | SLO Target | Measurement | Error Budget (30d) |
|-------------|-----|-----------|-------------|-------------------|
| Login | Latency p99 | <800ms, 99.5% | OpenTelemetry trace duration | 3.6 hours of violations |
| Login | Availability | 99.9% | HTTP 5xx / total requests | 43 minutes downtime |
| Checkout | Latency p99 | <2s, 99.0% | End-to-end trace duration | 7.2 hours of violations |
| Checkout | Correctness | 99.99% | Payment amount matches order | 4.3 minutes of errors |
| API (third-party) | Availability | 99.95% | Non-5xx responses | 21.6 minutes downtime |
| Search | Latency p50 | <200ms, 99.0% | Search service trace | 7.2 hours of violations |

## Output: Alerting Redesign

### Before (cause-based, noisy)
```
200+ alerts/week
├── CPU >80% on any pod (120 alerts) → Non-actionable: autoscaler handles it
├── Error rate >0% (45 alerts) → Too sensitive: 1 error triggers
├── Disk >70% (20 alerts) → Premature: not urgent until 90%
└── Response time >1s (15 alerts) → No context: which journey? which percentile?
```

### After (symptom-based, SLO-driven)
```
~15 alerts/week (estimated)
├── P1 (Page): SLO burn rate >14x (1h window) — exhausting budget in <2h
│     → Login availability, Checkout correctness
├── P2 (Ticket): SLO burn rate >6x (6h window) — exhausting budget in <5 days
│     → All SLOs
├── P3 (Review): SLO burn rate >1x (3d window) — on track to exhaust budget
│     → Weekly review in team standup
└── Infra: Only critical resource alerts
      → OOM kills, persistent volume >95%, certificate expiry <7d
```

## Output: Structured Log Format

```json
{
  "timestamp": "2026-03-17T14:30:22.456Z",
  "level": "ERROR",
  "service": "order-service",
  "trace_id": "abc123def456",
  "span_id": "span789",
  "message": "Payment processing failed",
  "error": {
    "type": "PaymentGatewayTimeout",
    "message": "Gateway did not respond within 5000ms"
  },
  "context": {
    "order_id": "ord_456",
    "customer_id": "cust_789",
    "payment_amount": 129.99,
    "retry_attempt": 2
  }
}
```

## Output: Incident Severity Matrix

| Severity | Criteria | Response Time | Notification | Example |
|----------|----------|--------------|-------------|---------|
| P1 | Revenue-impacting, all users affected | 5 min | Page on-call + Slack #incidents | Checkout 5xx >10% |
| P2 | Feature degraded, subset of users affected | 30 min | Slack #incidents + ticket | Search latency 10x normal |
| P3 | Non-critical feature broken, workaround exists | 4 hours | Ticket in sprint | Export PDF timing out |
| P4 | Minor issue, no user impact | Next sprint | Backlog item | Dashboard shows stale data |

# Solutions Architecture — Sample Output

## Context
An e-commerce platform migrating from a monolith to microservices needs an integration blueprint for the Order Processing domain involving 5 services.

## Output: Integration Matrix

| Source | Target | Pattern | Protocol | Contract | Error Strategy |
|--------|--------|---------|----------|----------|---------------|
| `order-api` | `inventory-svc` | Sync | gRPC | `inventory.proto v2` | Circuit breaker + fallback to cached stock |
| `order-api` | `payment-svc` | Sync | REST | `OpenAPI v3.1` | Retry 3x with exponential backoff |
| `payment-svc` | `order-api` | Async | Kafka | `payment.completed.v1.avro` | Dead letter queue + manual review |
| `order-api` | `notification-svc` | Async | Kafka | `order.status.v1.avro` | At-least-once; idempotent consumers |
| `order-api` | `shipping-svc` | Async | Kafka | `shipment.request.v1.avro` | Saga with compensation on failure |

## Output: Cross-Cutting Concerns

| Concern | Strategy | Implementation |
|---------|----------|---------------|
| Authentication | JWT with short-lived tokens | API Gateway validates; services trust gateway header |
| Authorization | RBAC with service-level policies | OPA sidecar per service |
| Distributed Tracing | OpenTelemetry with W3C Trace Context | Auto-instrumented via SDK; Jaeger backend |
| Resilience | Circuit breaker + bulkhead per integration | Resilience4j library; configured per-client |
| Configuration | Centralized config with env-specific overrides | Spring Cloud Config + Vault for secrets |

## Output: Failure Mode Analysis (Order Placement Journey)

```
User places order → order-api
  ├─ inventory-svc UNAVAILABLE
  │   → Circuit breaker opens after 5 failures in 10s
  │   → Fallback: accept order with "pending stock verification"
  │   → Async reconciliation when service recovers
  ├─ payment-svc TIMEOUT
  │   → Retry 3x with backoff (1s, 2s, 4s)
  │   → If all fail: order status = "payment_pending"
  │   → Scheduled job retries after 5 minutes
  └─ Kafka UNAVAILABLE
      → In-memory buffer (max 1000 events, 60s TTL)
      → If buffer full: reject order with 503
      → Alert fires after 30s of broker unavailability
```

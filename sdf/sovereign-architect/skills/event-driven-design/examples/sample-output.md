# Event-Driven Design — Sample Output

## Context
A ride-sharing platform needs an event-driven architecture for the ride lifecycle: request, driver matching, pickup, in-progress, drop-off, payment, and rating.

## Output

### Event Catalog

| Event | Producer | Consumers | Ordering Key | Schema Version |
|-------|----------|-----------|-------------|----------------|
| `RideRequested` | Ride Service | Matching Engine, Analytics | rider_id | v1 |
| `DriverMatched` | Matching Engine | Ride Service, Driver App, Rider App | ride_id | v1 |
| `DriverArrivedAtPickup` | Driver App | Ride Service, Rider App | ride_id | v1 |
| `RideStarted` | Driver App | Ride Service, Billing, Analytics | ride_id | v1 |
| `RideCompleted` | Driver App | Ride Service, Billing, Analytics | ride_id | v1 |
| `PaymentProcessed` | Billing Service | Ride Service, Rider App, Driver App | ride_id | v1 |
| `RideRated` | Rider/Driver App | Rating Service, Analytics | ride_id | v1 |

### Event Schema Example

```json
{
  "$schema": "https://json-schema.org/draft/2020-12/schema",
  "type": "object",
  "properties": {
    "event_id": { "type": "string", "format": "uuid" },
    "event_type": { "const": "RideCompleted" },
    "event_version": { "const": "v1" },
    "timestamp": { "type": "string", "format": "date-time" },
    "correlation_id": { "type": "string", "format": "uuid" },
    "aggregate_id": { "type": "string", "description": "ride_id" },
    "payload": {
      "type": "object",
      "properties": {
        "ride_id": { "type": "string" },
        "driver_id": { "type": "string" },
        "rider_id": { "type": "string" },
        "pickup_location": { "$ref": "#/$defs/GeoPoint" },
        "dropoff_location": { "$ref": "#/$defs/GeoPoint" },
        "distance_km": { "type": "number" },
        "duration_minutes": { "type": "integer" },
        "fare_estimate_cents": { "type": "integer" }
      },
      "required": ["ride_id", "driver_id", "rider_id"]
    }
  }
}
```

### Broker Topology (Apache Kafka)

```
Topics:
├── rides.requested          (partitions: 12, key: rider_id)
├── rides.matched            (partitions: 12, key: ride_id)
├── rides.status-changed     (partitions: 12, key: ride_id)
├── rides.completed          (partitions: 12, key: ride_id)
├── payments.processed       (partitions: 6,  key: ride_id)
├── ratings.submitted        (partitions: 6,  key: ride_id)
└── rides.dlq                (partitions: 3,  key: original_topic)

Consumer Groups:
├── matching-engine-cg       → reads: rides.requested
├── billing-service-cg       → reads: rides.completed
├── analytics-pipeline-cg    → reads: rides.*, payments.*, ratings.*
├── notification-service-cg  → reads: rides.matched, rides.status-changed, payments.processed
└── rating-service-cg        → reads: ratings.submitted
```

### Saga: Ride Completion → Payment

```
1. Driver App publishes: RideCompleted
2. Billing Service consumes RideCompleted:
   a. Calculate fare (distance * rate + surge + tolls - promotions)
   b. Charge rider's payment method
   c. On success → publish PaymentProcessed
   d. On failure → publish PaymentFailed
3. Ride Service consumes PaymentProcessed:
   a. Update ride status to PAID
   b. Release driver for next ride
4. Ride Service consumes PaymentFailed:
   a. Update ride status to PAYMENT_PENDING
   b. Schedule retry (exponential backoff, max 3 attempts)
   c. After 3 failures → escalate to support queue
```

### CQRS Read Models

| Projection | Source Events | Purpose | Refresh |
|-----------|-------------|---------|---------|
| Rider History | RideCompleted, PaymentProcessed, RideRated | Rider's trip history with receipts | Real-time (event-driven) |
| Driver Earnings | RideCompleted, PaymentProcessed | Driver earnings dashboard, daily/weekly totals | Real-time + hourly aggregation |
| Analytics Dashboard | All events | Operational metrics: rides/hour, avg wait time, surge zones | 1-minute micro-batches |
| Dispute Resolution | All events for a ride_id | Complete ride timeline for customer support | On-demand replay |

### Dead-Letter Queue Strategy
- Failed events routed to `rides.dlq` with headers: `original_topic`, `failure_reason`, `retry_count`.
- Automated retry: 3 attempts with exponential backoff (1min, 5min, 15min).
- After 3 retries: alert on-call engineer via PagerDuty, event remains in DLQ.
- Weekly DLQ review meeting to address systemic issues.

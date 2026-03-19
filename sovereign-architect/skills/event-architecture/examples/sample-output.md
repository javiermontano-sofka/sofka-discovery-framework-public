# Event Architecture — Sample Output

## Context
An order management system spanning 4 microservices needs a saga design for the order placement flow and an event catalog for the existing event-driven communication.

## Output: Event Catalog (excerpt)

| Event Name | Schema | Producer | Consumers | Topic | Partitions |
|-----------|--------|----------|-----------|-------|------------|
| `orders.order.created.v1` | Avro | order-service | inventory-svc, notification-svc, analytics-svc | `orders.events` | 12 (by order_id) |
| `orders.order.cancelled.v1` | Avro | order-service | inventory-svc, payment-svc, notification-svc | `orders.events` | 12 (by order_id) |
| `inventory.stock.reserved.v1` | Avro | inventory-svc | order-service | `inventory.events` | 6 (by sku) |
| `inventory.stock.insufficient.v1` | Avro | inventory-svc | order-service | `inventory.events` | 6 (by sku) |
| `payments.payment.captured.v1` | Avro | payment-svc | order-service, notification-svc | `payments.events` | 6 (by payment_id) |
| `payments.payment.failed.v1` | Avro | payment-svc | order-service | `payments.events` | 6 (by payment_id) |
| `shipping.shipment.created.v1` | Avro | shipping-svc | order-service, notification-svc | `shipping.events` | 6 (by order_id) |

## Output: Order Placement Saga (Orchestration)

```
[OrderSagaCoordinator]

Step 1: Reserve Inventory
  Command:      ReserveStock(order_id, items[])
  Success:      StockReserved → proceed to Step 2
  Failure:      StockInsufficient → COMPENSATE: cancel order
  Timeout:      30s → retry 2x, then compensate
  Compensation: ReleaseStock(order_id, items[])

Step 2: Process Payment
  Command:      CapturePayment(order_id, amount, payment_method)
  Success:      PaymentCaptured → proceed to Step 3
  Failure:      PaymentFailed → COMPENSATE: release stock, cancel order
  Timeout:      60s → retry 1x, then compensate
  Compensation: RefundPayment(payment_id)

Step 3: Create Shipment
  Command:      CreateShipment(order_id, address, items[])
  Success:      ShipmentCreated → COMPLETE: update order status
  Failure:      ShipmentFailed → COMPENSATE: refund, release stock, cancel
  Timeout:      30s → retry 2x, then compensate
  Compensation: CancelShipment(shipment_id)

Terminal States:
  SUCCESS: order_status = 'confirmed', all steps completed
  FAILED:  order_status = 'cancelled', all compensations executed
  STUCK:   saga_status = 'requires_intervention', alert ops team
```

## Output: Schema Evolution Rules

| Rule | Policy | Enforcement |
|------|--------|-------------|
| Add optional field | Allowed (backward compatible) | Schema registry auto-approves |
| Remove field | Requires deprecation cycle (2 versions) | Schema registry blocks; manual override |
| Rename field | Not allowed (add new + deprecate old) | Schema registry blocks |
| Change field type | Not allowed (new version required) | Schema registry blocks |
| New event version | Must be backward compatible with v(n-1) | CI compatibility check |

# Event-Driven Design — Use Case Prompts

## Prompt 1: Order Processing Pipeline
> Design an event-driven architecture for an e-commerce order processing pipeline. The flow: customer places order → inventory reserved → payment captured → order confirmed → warehouse notified → shipment created → customer notified at each stage. Requirements: exactly-once processing semantics, compensation (saga) for payment failures, and a complete audit trail. Select the appropriate broker and define the event schemas for each step.

## Prompt 2: Event-Sourced Banking Ledger
> Design an event-sourced system for a digital banking ledger handling deposits, withdrawals, transfers, and interest calculations. Requirements: immutable audit trail (regulatory), real-time balance queries, end-of-day reporting projections, and the ability to replay events to reconstruct account state at any point in time. Design the event store, define aggregate boundaries, snapshot strategy, and at least three read-model projections.

## Prompt 3: IoT Telemetry Event Processing
> Design an event-driven architecture for processing IoT telemetry from 100K devices sending data every 5 seconds. Events include: temperature readings, GPS coordinates, battery level, and error codes. Requirements: real-time anomaly detection (temperature > threshold), 30-day event retention for analysis, aggregation into 1-minute and 1-hour rollups, and alerting when a device goes offline for >5 minutes. Select the broker topology, partitioning strategy, and stream processing approach.

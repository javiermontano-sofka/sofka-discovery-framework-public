# Workshop Design — Sample Output

## Context

A team needs to identify the bounded contexts for a legacy order management
system before starting a microservices extraction. 10 participants across
engineering, product, and operations.

## Output

### Workshop: Domain Discovery Event Storming

**Objective**: Identify bounded contexts and domain boundaries for the order management system.
**Duration**: 6 hours (full day with breaks)
**Participants**: 10 (3 engineers, 2 architects, 2 product owners, 2 operations, 1 facilitator)

### Pre-Work (Distributed 3 Days Before)

- Read the 2-page system overview document.
- Each participant identifies 5 domain events they encounter in their daily work.
- Review the sticky note color coding guide.

### Agenda

| Time | Block | Objective | Activity | Output |
|------|-------|-----------|----------|--------|
| 09:00-09:15 | Opening | Alignment | Rules of engagement, objectives, color coding | Shared understanding |
| 09:15-10:30 | Chaotic Exploration | Surface events | Everyone posts domain events on the timeline. No discussion. | Raw event timeline |
| 10:30-10:45 | Break | — | — | — |
| 10:45-11:30 | Enforce Timeline | Order events | Group sorts events chronologically, identifies duplicates | Ordered event timeline |
| 11:30-12:15 | Pain Points | Identify hotspots | Mark hotspots (confusion, disagreement, complexity) with red stickies | Hotspot map |
| 12:15-13:15 | Lunch | — | — | — |
| 13:15-14:15 | Commands & Actors | Add triggers | Add commands (blue) and actors (yellow) that cause events | Command-event pairs |
| 14:15-15:00 | Aggregates | Identify clusters | Group related events around aggregates (large yellow) | Aggregate clusters |
| 15:00-15:15 | Break | — | — | — |
| 15:15-16:00 | Bounded Contexts | Draw boundaries | Identify context boundaries, name them, mark relationships | Bounded context map |
| 16:00-16:30 | Decisions & Next Steps | Capture outcomes | Document decisions, open questions, and next steps | Decision log |

### Facilitation Guide — Stuck Moments

| Situation | Facilitator Action |
|-----------|-------------------|
| Participants debating terminology | "Write both terms on separate stickies. We will reconcile later." |
| One person dominating | "Let's do a silent round. Everyone adds 3 events without discussion." |
| Group stuck on sequencing | "Focus on what happens, not when. We will sort the timeline later." |
| Too much detail too early | "Zoom out. We are looking for events, not implementation steps." |
| Disagreement on boundaries | "Mark it as a hotspot. We will revisit with more context." |

### Output Template: Bounded Context Summary

| Context Name | Key Aggregates | Domain Events | Hotspots | Owner Team |
|-------------|---------------|---------------|----------|------------|
| Order Management | Order, OrderLine | OrderPlaced, OrderConfirmed, OrderCancelled | Payment integration unclear | TBD |
| Inventory | StockItem, Reservation | ItemReserved, ItemReleased, StockAdjusted | Warehouse sync timing | TBD |
| Fulfillment | Shipment, Delivery | ShipmentCreated, ShipmentDispatched, DeliveryConfirmed | Returns process undefined | TBD |

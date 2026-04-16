# Migration Planner — Body of Knowledge

## Core Concepts
- **Strangler Fig Pattern**: Incrementally replace legacy functionality by routing requests through a facade that delegates to either old or new implementation.
- **Blue-Green Deployment**: Maintain two identical environments; switch traffic from blue (current) to green (new) atomically.
- **Change Data Capture (CDC)**: Capture row-level changes from the source database and replicate them to the target in near real-time.
- **Dual-Write**: Writing to both old and new systems simultaneously during transition; requires careful consistency handling.
- **Feature Parity Checkpoint**: The point at which the new system covers all critical features of the old system, enabling cutover.
- **Migration Rehearsal**: A full dry run of the migration using production-like data and traffic to validate timing, correctness, and rollback procedures.
- **Canary Migration**: Migrating a small percentage of users or data first to validate the new system under real conditions.
- **Decommission Plan**: The formal process for shutting down the legacy system after successful migration, including data archival.

## Patterns & Practices
- **Expand-Contract Migration**: For database schema changes, first expand (add new columns/tables), migrate data, then contract (remove old columns/tables).
- **Parallel Run**: Run both old and new systems simultaneously, comparing outputs to validate correctness before cutover.
- **Dark Launching**: Deploy the new system and route shadow traffic to it without serving responses to users, for load and correctness testing.
- **Incremental Data Backfill**: Migrate historical data in batches during low-traffic windows while CDC handles ongoing changes.
- **Circuit Breaker on Migration**: If error rates exceed thresholds during migration, automatically halt and rollback.
- **Feature Flags for Migration**: Use feature flags to control which users are routed to the new system, enabling gradual rollout.

## Tools & Technologies
- **Debezium**: Open-source CDC platform that captures database changes and streams them to Kafka.
- **AWS Database Migration Service (DMS)**: Managed service for migrating relational databases, NoSQL, and data warehouses.
- **Flyway / Liquibase**: Schema migration tools for managing expand-contract database changes.
- **Terraform / Pulumi**: Infrastructure-as-code tools for provisioning blue-green environments.
- **GoReplay**: Open-source tool for capturing and replaying HTTP traffic for parallel-run testing.
- **PgLoader**: High-performance data loading tool for PostgreSQL migrations from various sources.

## References
- Fowler, M., "Strangler Fig Application" (martinfowler.com, 2004).
- Newman, S., "Monolith to Microservices" (O'Reilly, 2019) — Migration patterns chapters.
- Humble, J. & Farley, D., "Continuous Delivery" (Addison-Wesley, 2010) — Blue-green deployments.
- AWS Well-Architected Framework — Migration Lens.

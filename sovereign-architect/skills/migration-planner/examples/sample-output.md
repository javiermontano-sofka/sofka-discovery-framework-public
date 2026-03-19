# Migration Planner — Sample Output

## Context
A retail company is migrating their inventory management system from a .NET Framework monolith on Windows Server to a containerized .NET 8 application on Kubernetes. The system manages 2M SKUs across 50 warehouses with real-time stock updates.

## Output

### Migration Strategy: Re-Platform with Strangler Fig

**Rationale**: Re-architecting is too risky for a system handling real-time inventory. Re-platforming to .NET 8 containers preserves business logic while enabling cloud deployment. Strangler Fig allows incremental extraction of modules.

### Phase Plan

| Phase | Duration | Scope | Rollback |
|-------|----------|-------|----------|
| **Phase 0: Foundation** | 2 weeks | Containerize existing app as-is, deploy to K8s alongside legacy | Remove K8s deployment, revert DNS |
| **Phase 1: Read Path** | 4 weeks | Route read-only inventory queries to new service via API gateway | Switch gateway routing back to monolith |
| **Phase 2: Write Path** | 6 weeks | Migrate stock update writes with dual-write to both systems | Disable dual-write, route all traffic to monolith |
| **Phase 3: Data Cutover** | 1 week | CDC-based final sync, cutover primary database | Reverse CDC direction, promote old DB |
| **Phase 4: Decommission** | 2 weeks | Shut down legacy, archive data, terminate old infrastructure | N/A (point of no return — 30-day archive available) |

### Phase 2 Detail: Write Path Migration

```
┌─────────┐     ┌──────────┐     ┌──────────────┐
│  Client  │────>│   API    │────>│  New Service  │──── Primary Write
│          │     │ Gateway  │     │  (.NET 8/K8s) │
└─────────┘     └──────────┘     └──────┬───────┘
                                        │ Dual-Write
                                        v
                                 ┌──────────────┐
                                 │Legacy Monolith│──── Shadow Write
                                 │(.NET Fx/IIS)  │     (verify only)
                                 └──────────────┘
```

**Dual-Write Consistency Rules**:
1. New service is the primary writer — its response determines client success/failure.
2. Legacy write is fire-and-forget with error logging (shadow mode).
3. A reconciliation job runs every 15 minutes comparing stock levels between systems.
4. Discrepancies > 1% trigger an alert and automatic pause of the migration.

### Data Migration Plan

| Step | Method | Duration | Validation |
|------|--------|----------|-----------|
| Historical backfill (2M SKUs) | pg_dump/restore in batches of 100K | 4 hours (off-peak) | Row count + checksum per batch |
| Ongoing changes | Debezium CDC from SQL Server to PostgreSQL | Continuous | Lag monitor < 5 seconds |
| Final cutover sync | Stop writes (2-min window), drain CDC, verify | 2 minutes | Full row count match + 100 random spot checks |

### Rehearsal Schedule

| Rehearsal | Environment | Date | Focus |
|-----------|-------------|------|-------|
| R1: Data only | Staging | Week 3 | Validate ETL pipeline, timing, checksums |
| R2: Full migration | Pre-prod with prod data copy | Week 8 | End-to-end including traffic routing |
| R3: Failure scenarios | Pre-prod | Week 10 | Test rollback procedures, dual-write failure modes |

### Go/No-Go Criteria (Phase 3 Gate)

| Criterion | Threshold | Measurement |
|-----------|-----------|-------------|
| API error rate | < 0.1% | Datadog monitor over 24 hours |
| P95 latency | < 200ms (current baseline: 180ms) | Datadog APM |
| Data consistency | 100% match on reconciliation | Reconciliation job output |
| Rollback tested | Successfully executed in R3 | Rehearsal report signed off |
| Stakeholder sign-off | VP Engineering + VP Operations | Written approval |

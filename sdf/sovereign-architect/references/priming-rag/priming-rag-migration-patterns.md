# Migration Patterns — RAG Priming Knowledge

> Sovereign Architect · JM Labs · Knowledge Base

---

## Overview

System migration is among the highest-risk activities in software engineering. Whether decomposing a monolith, changing platforms, or migrating data stores, the pattern chosen determines risk exposure, rollback capability, and business continuity. This document covers proven migration strategies, data migration techniques, and decision criteria for architects planning modernization efforts.

## Core Patterns

### Strangler Fig Pattern

**Concept**: Incrementally replace a legacy system by routing new functionality and gradually migrated features through a new system, while the legacy system continues to serve un-migrated functionality. Named after strangler fig trees that grow around and eventually replace their host.

**Implementation**: Place a routing layer (API gateway, reverse proxy, load balancer) in front of both systems. Route requests by path, header, or feature flag. Migrate one capability at a time: build in new system, verify parity, switch routing, decommission legacy code for that capability. The legacy system shrinks over time until fully replaced.

**When to use**: Large monolith decomposition, platform re-architecture, technology stack migration. Best when the legacy system is still functional and can coexist with the new system.

**Trade-offs**: Requires maintaining two systems simultaneously during migration (increased operational cost). Routing logic adds complexity. Migration can stall if business pressure diverts resources — set milestones and deadlines for each capability migration.

**Duration**: Typically 6-24 months depending on system size. Plan for 30% longer than estimated.

### Blue-Green Deployment

**Concept**: Maintain two identical production environments (blue and green). One serves live traffic while the other is updated. After deployment and verification on the idle environment, switch traffic via load balancer or DNS. The previous environment becomes the rollback target.

**Implementation**: Both environments share the same database (or use read replicas). Deploy new version to idle environment, run smoke tests, switch traffic. Keep old environment warm for rapid rollback (seconds to switch back).

**When to use**: Zero-downtime deployments for stateless applications. Works well for web applications, APIs, and microservices.

**Trade-offs**: Requires double infrastructure (or ability to spin up on demand). Database schema changes require backward compatibility — both versions must work with the same schema during the transition. Not suitable for stateful services without shared state management.

### Canary Deployment

**Concept**: Route a small percentage of traffic (1-5%) to the new version while the majority continues on the current version. Monitor error rates, latency, and business metrics. Gradually increase traffic to the new version if metrics are healthy. Roll back immediately if degradation is detected.

**Implementation**: Load balancer weighted routing, service mesh traffic splitting (Istio VirtualService, Linkerd TrafficSplit), or feature flag percentage rollout. Automated canary analysis tools (Kayenta, Flagger) compare canary metrics against baseline and auto-promote or rollback.

**When to use**: High-risk deployments, services with large user bases, changes that affect critical paths (payment processing, authentication).

**Trade-offs**: Requires robust monitoring to detect degradation. Stateful services need careful session management — users should not bounce between versions. Canary duration must be long enough to capture meaningful signal (minutes for high-traffic services, hours for low-traffic).

### Data Migration Patterns

**Dual-write**: Application writes to both old and new data stores simultaneously during migration. After verification, switch reads to the new store, then stop writes to the old store. Trade-off: write amplification, consistency risk between stores (use distributed transactions or accept eventual consistency), application code complexity.

**ETL batch migration**: Extract from old store, transform to new schema, load into new store. Run as a batch job, then switch traffic. Trade-off: data staleness during migration window, potential downtime for the cutover. Best for systems with natural maintenance windows.

**Change Data Capture (CDC)**: Stream changes from old database to new database in real-time via database transaction log (Debezium, DMS, GoldenGate). Maintains continuous sync between stores. After sync is verified, switch reads. Trade-off: CDC infrastructure complexity, schema mapping complexity, handling deletes and schema changes.

**Shadow read verification**: After migration, read from both old and new stores, compare results, log discrepancies. Shadow mode validates data integrity without affecting users. Disable after confidence is established.

### Expand-Contract (Parallel Change)

**Concept**: Three-phase approach for backward-compatible changes. Expand: add new capability alongside old (new column, new API endpoint, new service). Migrate: transition consumers from old to new. Contract: remove old capability.

**Database application**: Add new column (nullable or with default), deploy code that writes to both columns, backfill existing rows, deploy code that reads from new column, drop old column. Each phase is independently deployable and rollback-safe.

**API application**: Add new endpoint alongside deprecated one, migrate consumers with deprecation notices and timeline, remove old endpoint after all consumers migrated.

**Key discipline**: Each phase must be a separate deployment. Never combine expand and contract in the same release — this eliminates your rollback path.

### Re-Platform vs Rewrite Decision

**Re-platform (lift and shift, then optimize)**: Move existing code to new infrastructure (cloud migration, container adoption) with minimal changes. Then incrementally modernize. Lower risk, faster time to value. Best when the codebase is fundamentally sound but the infrastructure is not.

**Re-architect (strangler fig)**: Incrementally rebuild components using modern patterns while maintaining the existing system. Moderate risk, continuous delivery of value. Best when the system needs structural changes but has working business logic worth preserving.

**Rewrite (big bang)**: Build the new system from scratch, then cut over. Highest risk — the old system continues to evolve during rewrite, creating a moving target. Almost always takes 2-3x longer than estimated. Only justified when the existing codebase is truly unsalvageable and the domain is well-understood.

**Decision principle**: Prefer re-platform or strangler fig. Reserve rewrite for systems where the technical debt cost of incremental migration exceeds the rewrite cost, and the team has deep domain knowledge to avoid second-system syndrome.

## Decision Framework

| Factor | Strangler Fig | Blue-Green | Canary | Big Bang |
|--------|--------------|-----------|--------|----------|
| Risk level | Low-Medium | Low | Lowest | Highest |
| Rollback speed | Per-feature | Seconds | Seconds | Hours-Days |
| Infrastructure cost | High (dual) | High (dual) | Low (+ small %) | Low |
| Migration duration | Months | Per-deploy | Per-deploy | Weeks-Months |
| Team skill required | High | Medium | Medium | Medium |
| Business continuity | Continuous | Continuous | Continuous | Interrupted |

## Anti-Patterns

- **Big bang migration**: Replace the entire system in one deployment. Maximum risk, maximum blast radius, maximum recovery time. Always prefer incremental approaches.
- **Migration without rollback plan**: Every migration step must have a documented, tested rollback procedure. If you cannot describe how to undo a step, you are not ready to execute it.
- **Data migration without verification**: Migrating data without comparing counts, checksums, and business-critical field values between old and new stores. Always run shadow verification before cutover.
- **Indefinite dual-running**: Running two systems in parallel indefinitely because migration keeps getting deprioritized. Set firm deadlines and track migration percentage as a team metric. Dual-running costs compound monthly.

## Evidence Signals

- Feature flags or routing configuration directing traffic between old/new systems — strangler fig in progress.
- CDC tools (Debezium, DMS) in infrastructure — data migration between stores.
- Dual-write code (two repository calls in the same transaction) — active data migration phase.
- Deprecation headers on API responses (`Deprecation`, `Sunset`) — API migration in progress.
- Two deployment targets for the same service in CI/CD — blue-green or canary setup.
- Migration tracking dashboards or runbooks in documentation — organized migration effort.

---
*Sovereign Architect RAG Priming · JM Labs*

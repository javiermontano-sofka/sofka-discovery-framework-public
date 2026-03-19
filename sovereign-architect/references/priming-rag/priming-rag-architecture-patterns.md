# Architecture Patterns — RAG Priming Knowledge

> Sovereign Architect · JM Labs · Knowledge Base

---

## Overview

Architecture patterns define the structural blueprint of a software system, governing how components communicate, scale, and evolve. Selecting the right pattern is the highest-leverage decision an architect makes — it constrains every downstream choice from team topology to deployment strategy. This document covers eight foundational patterns with decision criteria for real-world selection.

## Core Patterns

### Modular Monolith

A single deployable unit with strictly enforced module boundaries, explicit public APIs between modules, and shared infrastructure (database, runtime). Modules communicate via in-process calls or an internal event bus. Best starting point for most greenfield projects — delivers monolith simplicity with future extraction paths. Trade-off: requires discipline to enforce boundaries; without tooling (ArchUnit, module-info.java, Nx boundaries), degrades into a big ball of mud.

### Microservices

Independently deployable services, each owning its data store, communicating via network calls (sync or async). Enables independent scaling, polyglot tech stacks, and autonomous team ownership. Trade-off: introduces network complexity, distributed transactions, operational overhead (service mesh, observability, CI/CD per service). Only justified when team count exceeds 4-5 and domain boundaries are well-understood.

### Hexagonal Architecture (Ports & Adapters)

Domain logic sits at the center, isolated from infrastructure via ports (interfaces) and adapters (implementations). Inbound adapters (HTTP controllers, CLI, message consumers) drive the domain; outbound adapters (repositories, API clients, message producers) are driven by the domain. Trade-off: more files and indirection; payoff is testability and infrastructure swappability. Works at any scale — from single module to microservice.

### Event-Driven Architecture

Components communicate through asynchronous events rather than direct calls. Two sub-patterns: event notification (thin events trigger receivers to fetch data) and event-carried state transfer (fat events contain all needed data). Enables temporal decoupling, natural audit trails, and replay capability. Trade-off: eventual consistency, debugging complexity, event schema evolution challenges.

### CQRS (Command Query Responsibility Segregation)

Separates write models (commands) from read models (queries), allowing independent optimization. Write side enforces business invariants; read side serves denormalized projections. Often paired with event sourcing but does not require it. Trade-off: increased complexity, eventual consistency between models, projection rebuild cost. Justified when read/write asymmetry is high (100:1 read ratio) or domain complexity demands rich write models.

### Clean Architecture

Concentric layers with the dependency rule: dependencies point inward. Entities (innermost), use cases, interface adapters, frameworks/drivers (outermost). Variant of hexagonal with explicit use-case layer. Trade-off: ceremony in simple CRUD apps; high value in complex domains where business rules change independently of infrastructure.

### Layered Architecture

Traditional N-tier: presentation, business logic, data access. Each layer depends only on the layer below. Simple to understand, widely known, fast to implement. Trade-off: tight vertical coupling makes cross-cutting concerns difficult; business logic tends to leak into presentation or data layers over time. Suitable for internal tools, CRUD-heavy apps, small teams.

### Cell-Based Architecture

Each cell is a self-contained unit with its own compute, storage, and routing — isolated from other cells. Traffic is routed to a specific cell and stays there. Used by AWS, Slack, and other hyperscalers for blast radius containment. Trade-off: high infrastructure cost, complex routing logic, data partitioning constraints. Justified only at massive scale or when fault isolation is a regulatory requirement.

## Decision Framework

| Criterion | Monolith | Modular Monolith | Microservices | Event-Driven |
|-----------|----------|-------------------|---------------|--------------|
| Team size | 1-3 | 2-6 | 5+ | 3+ |
| Domain clarity | Low-Med | Medium | High | High |
| Ops maturity | Low | Low-Med | High | High |
| Latency sensitivity | Best | Good | Variable | Higher |
| Independent deploy | No | No | Yes | Partial |
| Data consistency | Strong | Strong | Eventual | Eventual |
| Time to first feature | Fastest | Fast | Slow | Medium |

**Decision sequence**: Start with modular monolith. Extract to microservices only when you have evidence of independent scaling needs, team autonomy requirements, or deployment frequency conflicts. Add event-driven patterns for integration between bounded contexts, not within them.

## Anti-Patterns

- **Distributed monolith**: Microservices that share a database or require synchronized deployment. Worst of both worlds — network overhead with no independence.
- **Premature microservices**: Splitting before domain boundaries are proven. Results in wrong service boundaries that are expensive to fix.
- **Anemic domain model**: Business logic scattered across services/controllers instead of living in domain entities. Happens in any architecture but especially dangerous in clean/hexagonal when use cases become pass-through.
- **Golden hammer**: Applying one pattern everywhere. CQRS for a settings page, event sourcing for a TODO app. Match pattern complexity to domain complexity.

## Evidence Signals

- **Monolith candidate**: Single repo, shared database, all teams deploy together, < 5 developers.
- **Microservices candidate**: Multiple teams blocked on each other, services at different scaling profiles, polyglot requirements.
- **Event-driven candidate**: Audit trail requirements, multiple consumers of the same business event, temporal decoupling needs.
- **CQRS candidate**: Vastly different read/write models, high read-to-write ratio, complex reporting requirements alongside transactional writes.
- **Hexagonal/Clean signals**: Frequent infrastructure changes (switching databases, cloud providers), high test coverage goals, complex domain logic.

**Code signals**: Look for `infrastructure/`, `adapters/`, `ports/` directories (hexagonal). Look for `commands/`, `queries/`, `projections/` (CQRS). Look for event bus configuration, message broker dependencies (event-driven). Look for `module-info.java`, Nx project boundaries, or internal package visibility rules (modular monolith).

---
*Sovereign Architect RAG Priming · JM Labs*

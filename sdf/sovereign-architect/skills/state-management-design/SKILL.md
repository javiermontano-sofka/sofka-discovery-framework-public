---
name: state-management-design
author: JM Labs (Javier Montaño)
description: >
  Designs frontend and backend state management patterns, caching layers, and synchronization strategies.
  Trigger: "state management", "frontend state", "backend state", "state synchronization", "global state".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# State Management Design

Designs comprehensive state management architectures for frontend applications, backend services, and the synchronization layer between them, selecting appropriate patterns for each state category.

## Guiding Principle

> *"State is the root of all complexity. Minimize it, isolate it, and make its flow explicit."*

## Procedure

### Step 1 — State Taxonomy
1. Classify all application state into categories:
   - **Server State**: Data from APIs (users, products, orders). Source of truth is the server.
   - **Client State**: UI-only state (modals, form inputs, theme). Source of truth is the client.
   - **URL State**: Route params, query strings, filters. Source of truth is the URL.
   - **Session State**: Auth tokens, user preferences. Source of truth is the session store.
   - **Derived State**: Computed from other state (totals, filtered lists). No independent source of truth.
2. Map each state category to its lifecycle (ephemeral, session, persistent).
3. Identify shared state vs. local state boundaries.

### Step 2 — Frontend State Architecture
1. Select patterns per state category:
   - **Server State**: React Query / TanStack Query / SWR for cache, sync, and background refresh.
   - **Client State**: Component-local state (useState/useReducer) for UI state; Zustand/Jotai for shared.
   - **URL State**: Router-managed state with serialization/deserialization.
   - **Form State**: React Hook Form / Formik for complex forms with validation.
2. Define the data fetching strategy: stale-while-revalidate, polling, WebSocket, SSE.
3. Establish the normalization strategy for relational data in the client cache.
4. Specify optimistic update patterns for mutations.

### Step 3 — Backend State Architecture
1. Select the primary data store based on access patterns (relational, document, key-value, graph).
2. Design the session management strategy: stateless JWT vs. stateful sessions (Redis).
3. Define the caching layer: what to cache, TTL, invalidation (see caching-strategy skill).
4. Specify the distributed state coordination pattern: leader election, distributed locks, consensus.
5. Design the state recovery strategy: event sourcing, WAL replay, snapshot restore.

### Step 4 — Synchronization & Consistency
1. Define the client-server synchronization model: pull (polling), push (WebSocket), or hybrid.
2. Specify conflict resolution for concurrent edits: last-write-wins, operational transform, CRDTs.
3. Design the offline-first strategy if applicable: local DB, sync queue, conflict detection.
4. Establish the real-time update architecture: WebSocket connections, SSE, or polling intervals.
5. Document the eventual consistency windows and their UX implications.

## Quality Criteria
- Every piece of state has a clearly identified source of truth and a single owner.
- Server state is managed by a dedicated data-fetching library, not duplicated into global stores.
- Derived state is computed, never stored independently (prevents sync bugs).
- Optimistic updates have rollback handling for failed mutations.

## Anti-Patterns
- Duplicating server state into a global store (Redux) and manually keeping it in sync.
- Using global state for everything, including component-local UI state ("global state soup").
- Prop drilling through 10+ component levels instead of using composition or context.
- Ignoring URL state — filters and pagination should survive page refresh.

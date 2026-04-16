# State Management Design — Body of Knowledge

## Core Concepts
- **Source of Truth**: The authoritative location where a piece of state lives; all other representations are derived or cached copies.
- **Server State vs. Client State**: Server state originates from APIs and must be synchronized; client state exists only in the browser and needs no sync.
- **Derived State**: State computed from other state values (e.g., a filtered list, a total). Should never be stored independently.
- **Stale-While-Revalidate (SWR)**: Serve cached data immediately while fetching fresh data in the background; update the UI when fresh data arrives.
- **Optimistic Updates**: Immediately update the UI assuming the mutation will succeed; rollback if it fails.
- **Normalization**: Storing relational data in a flat structure keyed by ID to avoid duplication and simplify updates.
- **CRDTs (Conflict-free Replicated Data Types)**: Data structures that can be replicated across nodes and merged without conflicts, enabling offline-first architectures.
- **Event Sourcing (Backend State)**: Storing state changes as an immutable sequence of events rather than mutable current state.

## Patterns & Practices
- **Colocation Principle**: Keep state as close as possible to where it is used. Start with local; lift only when sharing is needed.
- **State Machine Pattern**: Model complex UI state (wizards, workflows, async operations) as finite state machines for predictable transitions.
- **Render-as-You-Fetch**: Start fetching data as soon as navigation begins, not when the component mounts, eliminating waterfall delays.
- **Compound Component Pattern**: Share implicit state between parent and child components without prop drilling.
- **Saga Pattern (Backend)**: Coordinate long-running processes across services using a sequence of local transactions and compensations.
- **Session Affinity vs. Stateless**: Sticky sessions simplify state but limit scaling; stateless services with external session stores (Redis) are preferred for horizontal scaling.

## Tools & Technologies
- **TanStack Query (React Query)**: Server-state management with caching, background refetching, mutations, and optimistic updates.
- **Zustand**: Lightweight client-state management for React with minimal boilerplate.
- **Jotai / Recoil**: Atomic state management libraries for fine-grained React state.
- **Redux Toolkit**: Opinionated Redux setup with slices, thunks, and RTK Query for server state.
- **XState**: Finite state machine library for modeling complex state transitions.
- **Redis**: In-memory data store used for session state, distributed locks, and caching.
- **Yjs / Automerge**: CRDT libraries for real-time collaborative editing.

## References
- Abramov, D., "You Might Not Need Redux" (blog post, 2016).
- Dodds, K.C., "Application State Management with React" (kentcdodds.com).
- Kleppmann, M., "Designing Data-Intensive Applications" (O'Reilly, 2017) — Chapters on consistency and replication.
- TanStack Query Documentation — https://tanstack.com/query/latest

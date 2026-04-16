# State Management Patterns — RAG Priming Knowledge

> Sovereign Architect · JM Labs · Knowledge Base

---

## Overview

State management is one of the most consequential architectural decisions in application development. Choosing the wrong pattern creates cascading complexity: prop drilling, stale data, race conditions, and unpredictable UI behavior. This document covers frontend state libraries, server state management, backend state patterns, and state machine approaches.

## Frontend State Categories

Understanding what kind of state you are managing determines the right tool:

| Category | Description | Examples | Tool |
|----------|-------------|----------|------|
| **UI State** | Local component state | Modal open/closed, form input, accordion | `useState`, component state |
| **Client State** | Shared across components | Theme, user preferences, sidebar collapsed | Zustand, Jotai, Context |
| **Server State** | Data from API, cached locally | User profile, product list, notifications | React Query, SWR |
| **URL State** | Encoded in the URL | Filters, pagination, search query | Router params, searchParams |
| **Form State** | Complex form with validation | Multi-step form, dynamic fields | React Hook Form, Formik |

**Critical insight**: Most "global state" is actually server state. Using Redux to cache API responses is an anti-pattern when React Query or SWR handle it better.

## Frontend Libraries

### Redux (+ Redux Toolkit)

The original Flux-inspired state manager. Unidirectional data flow: dispatch action → reducer → new state → re-render.

**Redux Toolkit (RTK)** is the modern API:
- `createSlice`: reducers + actions in one definition
- `createAsyncThunk`: async operations with loading states
- `RTK Query`: built-in data fetching and caching (overlaps with React Query)
- Immer integration: write "mutating" code that produces immutable updates

**When to use**: Large applications with complex state interactions, time-travel debugging requirements, teams that need strict architectural patterns.

**Trade-offs**: Boilerplate (even with RTK), learning curve, overkill for simple apps. The Redux team themselves recommend not using Redux for server state — use RTK Query or React Query instead.

### Zustand

Minimal, hooks-based store. No providers, no boilerplate, no context.

```javascript
const useStore = create((set) => ({
  count: 0,
  increment: () => set((state) => ({ count: state.count + 1 })),
  reset: () => set({ count: 0 }),
}))

// Usage in component
const count = useStore((state) => state.count)
```

**Strengths**: Tiny bundle (~1KB), simple API, works outside React (vanilla JS), selective re-renders via selectors. **When to use**: Most applications. It handles 90% of client state needs with minimal overhead.

### Jotai

Atomic state model. Each piece of state is an atom; derived state is computed from atoms.

```javascript
const countAtom = atom(0)
const doubledAtom = atom((get) => get(countAtom) * 2)

// Usage
const [count, setCount] = useAtom(countAtom)
const doubled = useAtomValue(doubledAtom)
```

**Strengths**: Bottom-up composition, no providers needed, fine-grained re-renders, suspense-compatible. **When to use**: Applications with many interdependent pieces of state, derived/computed state patterns.

### Signals (Preact Signals, Angular Signals, Solid.js)

Reactive primitives that notify subscribers of changes without re-rendering entire component trees.

```javascript
const count = signal(0)
const doubled = computed(() => count.value * 2)

// Reading a signal auto-subscribes the component
function Counter() {
  return <div>{count.value}</div>
}
```

**Strengths**: Fine-grained reactivity (no selector optimization needed), simple mental model, excellent performance. **When to use**: New projects on frameworks with signal support, performance-critical UIs.

### Comparison Matrix

| Factor | Redux | Zustand | Jotai | Signals |
|--------|-------|---------|-------|---------|
| Bundle size | ~7KB | ~1KB | ~3KB | ~1-2KB |
| Boilerplate | Medium (RTK) | Low | Low | Low |
| DevTools | Excellent | Good | Good | Varies |
| Learning curve | High | Low | Medium | Low |
| Re-render control | Selectors | Selectors | Atomic (auto) | Automatic |
| Middleware | Extensive | Basic | Minimal | Minimal |
| SSR support | Good | Good | Good | Framework-dependent |
| Best for | Large teams, strict patterns | Most apps | Derived state | Performance-critical |

## Server State Management

### React Query (TanStack Query)

The standard for server state in React. Handles fetching, caching, synchronization, and cache invalidation.

**Core concepts**:
- `useQuery`: declarative data fetching with automatic caching
- `useMutation`: server mutations with optimistic updates
- `queryKey`: cache key for deduplication and invalidation
- `staleTime`: how long data is considered fresh
- `gcTime`: how long unused data stays in cache

```javascript
const { data, isLoading, error } = useQuery({
  queryKey: ['users', userId],
  queryFn: () => fetchUser(userId),
  staleTime: 5 * 60 * 1000, // 5 minutes
})
```

**Patterns**:
- Optimistic updates: update cache immediately, rollback on error
- Infinite queries: paginated lists with `useInfiniteQuery`
- Prefetching: load data before user navigates
- Parallel queries: multiple independent queries in one component
- Dependent queries: query B waits for query A

### SWR

Stale-While-Revalidate strategy from Vercel. Simpler API than React Query, fewer features.

```javascript
const { data, error, isLoading } = useSWR('/api/users', fetcher)
```

**When to choose SWR over React Query**: Simpler needs, smaller bundle, Next.js projects (same ecosystem). React Query is more feature-complete (mutations, infinite queries, devtools).

### Comparison

| Feature | React Query | SWR |
|---------|------------|-----|
| Mutations | Built-in (`useMutation`) | Manual |
| Devtools | Excellent | Basic |
| Infinite scroll | `useInfiniteQuery` | `useSWRInfinite` |
| Optimistic updates | Built-in pattern | Manual |
| Offline support | Built-in | Limited |
| Bundle size | ~12KB | ~4KB |

## Backend State Patterns

### Session State

Server maintains state per user session. Stored in memory (single server), Redis/Memcached (distributed), or database.

| Storage | Latency | Scalability | Persistence |
|---------|---------|------------|-------------|
| In-memory | Fastest | Single server only | Lost on restart |
| Redis | Fast (~1ms) | Horizontal with cluster | Configurable (RDB/AOF) |
| Database | Slower (~5-10ms) | Highly persistent | Full durability |

### Cache State

Application cache for frequently accessed, rarely changed data:

| Pattern | Description | Use Case |
|---------|-------------|----------|
| **Cache-aside** | App checks cache; on miss, loads from DB and populates cache | General purpose |
| **Read-through** | Cache loads from DB on miss (transparent to app) | Read-heavy workloads |
| **Write-through** | Writes go to cache and DB synchronously | Consistency-critical |
| **Write-behind** | Writes go to cache; async flush to DB | Write-heavy, latency-sensitive |
| **Refresh-ahead** | Proactively refresh cache before expiry | Predictable access patterns |

### Distributed State

State shared across multiple service instances:

| Approach | Mechanism | Trade-off |
|----------|-----------|-----------|
| **Distributed cache** | Redis Cluster, Memcached | Fast, but eventual consistency |
| **Distributed lock** | Redis Redlock, ZooKeeper | Coordination, but adds latency |
| **Consensus** | Raft (etcd), Paxos | Strong consistency, but complex |
| **CRDTs** | Conflict-free replicated data types | Eventual consistency, no coordination |

## State Machine Patterns

### XState

The leading state machine library for JavaScript/TypeScript. Models state transitions explicitly, making impossible states impossible.

```javascript
const toggleMachine = createMachine({
  id: 'toggle',
  initial: 'inactive',
  states: {
    inactive: { on: { TOGGLE: 'active' } },
    active: { on: { TOGGLE: 'inactive' } },
  },
})
```

**When to use XState**:
- Complex UI flows (multi-step wizards, checkout)
- Stateful processes (file upload, real-time connection)
- Business logic with many states and transitions
- When you need a visual state diagram for communication

**When NOT to use XState**:
- Simple boolean toggles (useState is fine)
- Server state management (use React Query)
- Global app state (use Zustand/Redux)

### State Machine Benefits

| Benefit | Description |
|---------|-------------|
| **Explicit states** | Every possible state is declared — no ambiguity |
| **Guarded transitions** | Transitions only happen when conditions are met |
| **Side effects** | Actions and services tied to transitions, not states |
| **Visualization** | State charts can be visualized for stakeholder communication |
| **Testing** | Model-based testing from state chart definition |

### Backend State Machines

State machines are equally valuable on the backend for order processing, workflow engines, approval flows, and saga orchestration. Libraries: XState (Node.js), Spring Statemachine (Java), Statesman (Ruby).

## Anti-Patterns

| Anti-Pattern | Problem | Fix |
|-------------|---------|-----|
| **Redux for everything** | Server state in Redux creates unnecessary complexity | Use React Query for server state, Zustand for client state |
| **Prop drilling** | Passing state through 5+ levels of components | Use context (sparingly) or state management library |
| **Context for frequent updates** | React Context re-renders all consumers on any change | Use Zustand or Jotai for frequently changing state |
| **Duplicated state** | Same data in local state and global store | Single source of truth — derive where possible |
| **Stale closures** | Event handlers capture old state values | Use refs or functional updates |
| **Over-normalization** | Normalizing state like a relational database | Keep state denormalized unless updates are frequent and targeted |

## Decision Guide

```
Is it server data from an API?
  → YES: React Query / SWR

Is it shared across many components?
  → YES: Zustand (simple) or Redux (complex teams)

Is it derived from other state?
  → YES: Jotai atoms or computed signals

Is it a complex multi-step flow?
  → YES: XState

Is it local to one component?
  → YES: useState / useReducer
```

---

*Sovereign Architect — The right state tool for the right state type.*
*JM Labs · Javier Montano.*

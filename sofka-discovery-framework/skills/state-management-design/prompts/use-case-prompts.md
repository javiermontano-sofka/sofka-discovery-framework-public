# State Management Design — Use Case Prompts

## Prompt 1: Complex Dashboard Application
> Design the state management architecture for a real-time analytics dashboard (React + TypeScript). The dashboard shows: live metrics updating every 5 seconds, historical charts with user-selectable date ranges, a filter sidebar with 12 filter options that persist across page navigation, a notification bell with unread count, and user preferences (theme, default date range, pinned widgets). Classify each piece of state, select the appropriate management strategy, and define the data fetching approach for real-time vs. historical data.

## Prompt 2: Collaborative Document Editor
> Design the state management architecture for a Google Docs-like collaborative editor. Multiple users can edit the same document simultaneously. Requirements: real-time cursor and selection visibility for all collaborators, conflict-free concurrent editing, offline support with sync-on-reconnect, undo/redo per user, and document version history. Select the synchronization protocol (OT vs. CRDT), define the local state structure, and design the client-server communication layer.

## Prompt 3: E-Commerce Cart with Offline Support
> Design the state management for a mobile-first e-commerce PWA. The cart must: persist across sessions (user returns days later), work offline (add items, modify quantities), sync with the server when online, handle price changes between offline-add and online-sync, and support both authenticated and guest users (merge cart on login). Define the local storage strategy, sync conflict resolution, and the state migration approach when the guest logs in.

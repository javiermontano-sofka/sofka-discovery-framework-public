# Context Optimization — Body of Knowledge

## Core Concepts
- **Context Window**: The fixed-size memory available to an AI model for processing — includes system prompts, conversation history, and tool results.
- **Token Budget**: An allocation strategy that assigns portions of the context window to different types of information.
- **Lazy Loading**: Deferring context loading until the information is actually needed, rather than pre-loading everything.
- **Context Pruning**: Removing or summarizing information that is no longer relevant to the current task.
- **Session State**: A compact representation of the current work progress that enables continuity across sessions.
- **Progressive Context Expansion**: Starting with high-level overviews and expanding into details only for the areas being actively worked on.
- **Information Density**: The ratio of useful information to total tokens — prose is low density, structured tables are high density.

## Patterns & Practices
- **Index-Then-Detail**: Load an index file first, then load specific referenced files only when needed.
- **Summarize-Then-Deep-Dive**: Replace large documents with summaries; load the full version only for the section being worked on.
- **Milestone Snapshots**: At key decision points, save a compact state summary for session recovery.
- **Context Expiry**: Mark context items with a relevance scope; prune them when the scope is exited.
- **Compact Representations**: Use tables, key-value pairs, and structured lists instead of paragraphs to save tokens.
- **Handoff Documents**: Generate a "session resume" artifact that captures: decisions made, files modified, pending tasks, key findings.

## Tools & Technologies
- **Session State Files**: `.discovery/session-state.json` for tracking pipeline progress and loaded context.
- **Calibration Digests**: Compact summaries of what has been loaded and what remains to load.
- **RAG Priming**: Targeted loading of reference documents based on the current task domain.
- **Lazy Load Resolvers**: Scripts that resolve context references on demand rather than eagerly.
- **Token Counters**: Tools that estimate token count for files before loading (tiktoken, cl100k estimators).

## References
- Anthropic, "Claude Context Window Best Practices" — Official guidance on context management.
- Simon Willison, "Building AI-Assisted Workflows" — Practical context optimization patterns.
- RAG (Retrieval-Augmented Generation) literature — Selective context loading from large knowledge bases.
- Prompt Engineering Guide — Techniques for maximizing output quality within context constraints.

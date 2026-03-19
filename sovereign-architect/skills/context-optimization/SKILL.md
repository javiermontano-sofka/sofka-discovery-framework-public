---
name: context-optimization
author: JM Labs (Javier Montaño)
description: >
  Manages session context, token budgeting, and strategic information loading for AI-assisted engineering sessions.
  Trigger: "optimize context", "token budget", "context management", "session context", "priming strategy".
allowed-tools:
  - Read
  - Glob
  - Grep
  - Bash
  - Agent
---

# Context Optimization

Manages the finite context window of AI-assisted engineering sessions through strategic information loading, token budgeting, and progressive context expansion — maximizing the quality of AI output per token invested.

## Guiding Principle

> *"Context is not unlimited. Treat every token like a dollar — invest it where the return is highest."*

## Procedure

### Step 1 — Audit Available Context
1. Estimate the total context window size and current utilization.
2. Inventory all loaded context: system prompts, CLAUDE.md, conversation history, tool results.
3. Identify the highest-value context for the current task (directly relevant files, references).
4. Identify low-value context consuming tokens (boilerplate, verbose logs, irrelevant history).
5. Calculate the remaining context budget for task execution.

### Step 2 — Design the Loading Strategy
1. **Lazy Loading**: Load references only when needed, not all at session start.
2. **Priority Queue**: Rank context items by relevance to the current task.
3. **Summarization**: Replace verbose context with concise summaries when full text is not needed.
4. **Chunking**: Break large files into relevant sections; load only the needed chunk.
5. **Index-First**: Load indexes and catalogs first; deep-dive into specifics on demand.

### Step 3 — Implement Token Budgeting
1. Allocate budget by category: system context (20%), task context (50%), working memory (30%).
2. Set per-file token limits: if a file exceeds budget, summarize or extract relevant sections.
3. Monitor context growth during multi-step tasks; prune completed step context.
4. Cache frequently-referenced information in compact form (tables, key-value pairs).
5. Use structured formats (tables, lists) over prose to convey the same information in fewer tokens.

### Step 4 — Optimize for Session Continuity
1. Generate session state snapshots at key milestones for recovery.
2. Create compact session summaries that preserve critical decisions and findings.
3. Design handoff artifacts that allow a new session to resume without re-reading everything.
4. Track which context items have been loaded and which are pending.
5. Document context optimization decisions for session debugging.

## Quality Criteria
- Context utilization stays below 80% of the window to leave room for reasoning.
- Every loaded context item has a clear justification for its inclusion.
- Session handoff artifacts enable 90% context recovery in a new session.
- Token budgets are tracked and reported at session milestones.

## Anti-Patterns
- Loading all reference documents at session start ("carpet bombing" context).
- Keeping verbose tool output in context after the relevant data has been extracted.
- Failing to summarize long files before loading them.
- No session state management, requiring full re-read on every new session.

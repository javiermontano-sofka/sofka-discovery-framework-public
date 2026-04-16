# Use-Case Prompts — Context Optimization

## Prompt 1: Session Priming Strategy
**When**: Start of new project session.
**Context variables**: `{project_type}`, `{current_phase}`, `{active_tasks}`
**Deliver**:
> Design context loading strategy for `{project_type}` in `{current_phase}`. Determine L1/L2/L3 loading for each active skill based on `{active_tasks}`. Produce loading manifest with estimated token budget.

## Prompt 2: Context Pruning Audit
**When**: Context window approaching capacity limits.
**Context variables**: `{loaded_context}`, `{current_task}`, `{context_budget}`
**Deliver**:
> Audit `{loaded_context}` for relevance to `{current_task}`. Score each loaded resource 1-5 for relevance. Recommend pruning for items scoring <3. Calculate token savings.

## Prompt 3: Knowledge Base Indexing
**When**: New project artifacts added to knowledge base.
**Context variables**: `{new_artifacts}`, `{existing_index}`, `{skill_catalog}`
**Deliver**:
> Index `{new_artifacts}` against `{skill_catalog}` and update `{existing_index}`. Create semantic tags for efficient retrieval. Map artifact-to-skill relevance for context routing.

*PMO-APEX v1.0 — Use-Case Prompts · Context Optimization*

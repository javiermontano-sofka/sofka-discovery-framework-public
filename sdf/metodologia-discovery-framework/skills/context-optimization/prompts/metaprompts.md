# Metaprompts — Context Optimization

## Meta-Strategy 1: Minimum Viable Context
**Purpose**: Load the least context needed for quality output.
**Strategy**: Start with L1 (metadata only). Escalate to L2 only if task requires detail. L3 only for deep analysis. Never pre-load all skills.
**Application template**:
> For `{task}`, determine minimum context level. Start with L1 routing. If task is specific to a skill, load L2 for that skill only. Reserve L3 for explicit deep-dive requests. [PLAN]

## Meta-Strategy 2: Context Freshness Management
**Purpose**: Ensure loaded context reflects current project state.
**Strategy**: Track context age. Session state older than 1 session is stale. Project data older than 1 sprint needs refresh.
**Application template**:
> Check freshness of all loaded context. Flag items >1 sprint old. Refresh stale items from source before using for analysis or recommendations. [METRIC]

## Meta-Strategy 3: Cross-Skill Context Deduplication
**Purpose**: Prevent loading overlapping information from multiple skills.
**Strategy**: Identify content overlap between skills loaded simultaneously. Load shared content once and reference across skills.
**Application template**:
> When loading multiple skills for `{task}`, identify overlapping content (e.g., risk management appears in multiple skills). Load the canonical version once. Reference from other skills. Expected savings: 15-25% token reduction. [METRIC]

*PMO-APEX v1.0 — Metaprompts · Context Optimization*

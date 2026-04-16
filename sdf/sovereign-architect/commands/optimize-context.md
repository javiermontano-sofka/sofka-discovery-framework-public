---
description: "Context window optimization — compress changelog, lazy loading, prune duplicates"
user-invocable: true
---

# SOVEREIGN ARCHITECT · OPTIMIZE-CONTEXT · NL-HP v1.0

## ROLE

Context Optimization Specialist. You analyze and compress the SA context footprint to maximize useful information within the context window.

## OBJECTIVE

Optimize context usage for: `$ARGUMENTS` (or the current SA session if no arguments provided).

Compress changelogs, activate lazy loading for large references, prune semantic duplicates, and produce a leaner context profile.

## AUTO-DETECTION PROTOCOL

When invoked without arguments:
1. **Session directory**: Check sa/ for session files and analysis artifacts.
2. **Reference scan**: Catalog all loaded references and their sizes.
3. **Duplicate detection**: Look for overlapping content across files.

## PROTOCOL

### Step 1 — Context Audit

1. Catalog all files that contribute to the current context
2. Measure token footprint per file (approximate)
3. Identify the largest contributors
4. Map which files are actively referenced vs passively loaded

### Step 2 — Changelog Compression

1. Read session changelog
2. Compress repetitive entries into summaries
3. Preserve decision points and key findings
4. Archive detailed history to sa/archive/

### Step 3 — Semantic Deduplication

1. Identify content that appears in multiple files
2. Consolidate into single source of truth
3. Replace duplicates with references
4. Preserve the most complete version

### Step 4 — Lazy Loading Activation

1. Identify large reference files that can be loaded on demand
2. Create lightweight index files with summaries
3. Configure lazy loading markers for the resolver
4. Verify that critical context remains immediately available

### Step 5 — Report

1. Before/after token footprint comparison
2. Files compressed, archived, or converted to lazy loading
3. Estimated context savings percentage

## OUTPUT FORMAT

```markdown
# Context Optimization Report

## Before
- Total files in context: {count}
- Estimated token footprint: {count}

## After
- Total files in context: {count}
- Estimated token footprint: {count}
- **Savings**: {percentage}%

## Actions Taken
| Action | File | Before | After | Savings |
|--------|------|--------|-------|---------|
| Compressed | ... | ... | ... | ... |
| Deduplicated | ... | ... | ... | ... |
| Lazy-loaded | ... | ... | ... | ... |
| Archived | ... | ... | ... | ... |
```

## CONSTRAINTS

- NEVER delete analysis artifacts — archive or compress only
- NEVER lose decision points or key findings during compression
- Preserve all [HECHO] tagged content — it is irreplaceable evidence
- Lazy loading must not break command execution
- Report exact savings with before/after metrics

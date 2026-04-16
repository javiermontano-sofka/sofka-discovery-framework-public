# Lessons Learned Tracker — Sample Output

## Context
Capturing and cataloging a lesson after the user corrected a branding mistake in a deliverable.

## Output

### Lesson Entry

```yaml
id: LL-2026-0042
date: 2026-03-17
trigger: User correction
category: Branding
severity: CRITICAL
context: Generating a technical proposal under JM Labs brand
```

**What went wrong:**
The output used `#00A651` (Sofka green) as the accent color in a Mermaid diagram and referenced "Sofka Technologies" in the footer of a JM Labs deliverable.

**Why it happened:**
Brand context detection relied on the working directory, which was inside the `sovereign-architect` plugin (JM Labs). However, the CLAUDE.md loaded contained references to both Sofka and JM Labs brands, and the system defaulted to Sofka styling without explicit brand verification.

**Correct behavior:**
JM Labs deliverables must use JM Labs brand identity exclusively. Never mix brand elements. Verify the active brand before applying any styling.

**One-line rule:**
> NEVER use Sofka colors (#00A651 green), logos, or brand name in JM Labs deliverables. JM Labs uses its own identity.

**Root cause:** Brand context detection failure — the cascade did not resolve unambiguously.

### Preventive Measures Applied

| # | Measure | Type | Applied To |
|---|---------|------|-----------|
| 1 | Added brand verification as Step 0 in output-engineering skill | Process | `output-engineering/SKILL.md` |
| 2 | Updated brand-orchestration reference with explicit JM Labs palette | Documentation | `references/ontology/brand-orchestration.md` |
| 3 | Added to pre-flight checklist: "Verify active brand before generating any styled output" | Checklist | Session automation |
| 4 | Created grep-based validation: scan output for cross-brand contamination | Automation | Post-generation check |

### Lessons Registry Summary (Current Month)

| Metric | Value |
|--------|-------|
| Total lessons this month | 12 |
| By category | Branding: 3, Formatting: 4, Technical: 3, Process: 2 |
| By severity | CRITICAL: 2, WARNING: 6, NOTE: 4 |
| Regression rate | 8.3% (1 lesson recurred — LL-2026-0031 re-resolved) |
| Avg time to preventive measure | 1 session |

### Systemic Issues Detected

| Cluster | Related Lessons | Root Cause | Recommended Action |
|---------|----------------|------------|-------------------|
| Brand mixing | LL-0042, LL-0038, LL-0029 | Brand cascade resolution is fragile | Implement explicit brand assertion at session start |
| Evidence gaps | LL-0041, LL-0037, LL-0033 | Claims not tagged in early drafts | Add evidence tagging to the first step of every skill |
| Format inconsistency | LL-0040, LL-0036, LL-0034, LL-0030 | Different skills produce different table styles | Standardize table format in output-engineering reference |

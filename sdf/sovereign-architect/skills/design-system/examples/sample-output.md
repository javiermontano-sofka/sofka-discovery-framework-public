# Design System — Sample Output

## Context

A technical leadership practice needs a consistent design system for all
deliverables: architecture assessments, roadmaps, and executive summaries.

## Output

### Token Definitions

#### Color Palette

| Token | Value | Usage |
|-------|-------|-------|
| `--color-primary` | #2563EB | Headings, primary actions, links |
| `--color-secondary` | #64748B | Body text, secondary information |
| `--color-accent` | #F59E0B | Highlights, callouts, attention markers |
| `--color-danger` | #DC2626 | Critical findings, high-risk indicators |
| `--color-success` | #16A34A | Positive metrics, completed items |
| `--color-surface` | #F8FAFC | Card backgrounds, section containers |
| `--color-border` | #E2E8F0 | Dividers, table borders, card edges |
| `--color-text` | #1E293B | Primary body text |
| `--color-text-muted` | #94A3B8 | Captions, metadata, footnotes |

#### Typography Scale

| Token | Value | Usage |
|-------|-------|-------|
| `--font-family` | Inter, system-ui, sans-serif | All text |
| `--font-mono` | JetBrains Mono, monospace | Code blocks, technical references |
| `--text-h1` | 2rem / 700 | Document title |
| `--text-h2` | 1.5rem / 600 | Section headings |
| `--text-h3` | 1.25rem / 600 | Subsection headings |
| `--text-body` | 1rem / 400 | Body text |
| `--text-small` | 0.875rem / 400 | Captions, metadata |

#### Spacing Scale

| Token | Value | Usage |
|-------|-------|-------|
| `--space-xs` | 0.25rem | Inline element gaps |
| `--space-sm` | 0.5rem | Tight component padding |
| `--space-md` | 1rem | Standard component padding |
| `--space-lg` | 1.5rem | Section margins |
| `--space-xl` | 2rem | Major section separators |
| `--space-2xl` | 3rem | Page-level spacing |

### Component: Finding Card

```
┌─────────────────────────────────────────────┐
│ [BADGE: severity]  Finding ID               │
│                                             │
│ Finding Title (--text-h3)                   │
│                                             │
│ Description text (--text-body)              │
│                                             │
│ ┌─────────────────────────────────────────┐ │
│ │ Evidence block (--color-surface bg)     │ │
│ │ [CODE] source reference                 │ │
│ └─────────────────────────────────────────┘ │
│                                             │
│ Recommendation (--text-body)                │
│ Effort estimate (--text-small, --color-muted│
└─────────────────────────────────────────────┘
```

### Page Template: Executive Summary

1. **TL;DR Block** — 3-5 sentences, `--color-surface` background, `--space-lg` padding.
2. **Key Metrics Row** — 3-4 metric cards in a horizontal layout.
3. **Findings Summary** — Table with severity badges, one-line descriptions, and impact.
4. **Recommendation** — Numbered list with effort estimates.
5. **Next Steps** — Call to action with timeline.
6. **Ghost Menu** — Floating navigation to detailed sections.

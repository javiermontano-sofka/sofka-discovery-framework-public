# Markdown Excellence Standard — Moat-Level Output

Every Markdown deliverable produced by the discovery pipeline follows this standard.
The goal: a document so well-crafted that it replaces the need for a slide deck.

## Writing Style

| Principle | Implementation |
|-----------|---------------|
| Dense lines | Every sentence carries information or insight — zero filler |
| First-read clarity | A reader grasps the point on first pass, no re-reading needed |
| Data storytelling | Findings flow as narrative: context → evidence → insight → implication |
| Active voice | "The system processes 12K requests/s" not "12K requests/s are processed" |
| Quantified claims | Numbers over adjectives: "3.2s p95 latency" not "slow response times" |
| Evidence-tagged | Every claim ends with source: [CÓDIGO], [CONFIG], [DOC], [INFERENCIA] |

## Document Structure

```
# Title — Deliverable Name
> One-line executive summary that a C-level can act on.

## TL;DR
3-5 bullet points. Entire document distilled. Reader decides whether to go deeper.

## Section 1
### Subsection
Content with embedded tables, diagrams, and callouts.

---
## Appendix (if needed)
## Glossary (if domain-specific terms used)
## Footnotes
```

## Table Conventions

### Standard Table
| Column A | Column B | Column C | Notes |
|----------|----------|----------|-------|
| Value | Value | Value | ¹ |

> **Convention**: 🟢 Pass | 🟡 Warning | 🔴 Critical | ⬜ Not evaluated
> ¹ Footnote explaining context or methodology

### Scored Table
| Item | Score | Evidence | Confidence |
|------|-------|----------|------------|
| Auth module | 🟢 4.2/5.0 | `src/auth/` — 92% coverage [CÓDIGO] | Alta |
| Payment flow | 🔴 1.8/5.0 | Zero retry logic, no idempotency [CÓDIGO] | Alta |
| Reporting | 🟡 3.0/5.0 | Manual CSV exports [DOC] | Media |

> **Scale**: 1.0-2.0 🔴 Critical | 2.1-3.5 🟡 Needs work | 3.6-5.0 🟢 Acceptable

### Comparison Table
| Dimension | Scenario A | Scenario B | Scenario C | Winner |
|-----------|-----------|-----------|-----------|--------|
| Feasibility | 4.1 | 3.2 | 2.8 | A |
| Time-to-value | 2.5 | 4.0 | 3.8 | B |
| **Weighted Total** | **3.3** | **3.6** | **3.3** | **B** |

## Callout Patterns

### Insight (data storytelling moment)
> **💡 Insight**: The authentication module accounts for 40% of total technical debt despite being only 8% of the codebase. This concentration suggests a single refactoring sprint could eliminate nearly half the accumulated debt. [CÓDIGO] [INFERENCIA]

### Decision Point
> **⚖️ Trade-off**: Migrating to event-driven architecture reduces coupling (4 → 1 integration points) but introduces eventual consistency complexity. Recommended only if team has prior experience with CQRS patterns. [INFERENCIA]

### Warning
> **⚠️ Risk**: No automated rollback mechanism exists. A failed deployment requires manual database restoration (~45 min downtime). Kill criteria: if rollback time exceeds 15 min in staging, abort migration approach. [CÓDIGO]

### Evidence Chain
> **🔍 Evidence**: `payment-service/src/handlers/charge.go:142` — retry logic catches all errors silently (`catch(e) {}`) → payment failures are invisible to monitoring → incident detection time is unbounded. [CÓDIGO]

## Mermaid Diagram Integration

Diagrams are NOT decorative. Each diagram must:
1. Replace ≥3 sentences of prose (information density test)
2. Have a text summary before it (accessibility)
3. Have a source tag after it (traceability)

### Embedding Pattern

> **Figure 1**: System context showing external integrations and data flows.

```mermaid
[diagram code here]
```

*Source: Code analysis of `src/` directory [CÓDIGO]*

### Placement Rules
- Place diagrams AFTER the narrative introduces the concept (reader has context)
- Never place two diagrams consecutively without prose between them
- Reference diagrams by figure number in subsequent text: "As shown in Figure 1..."
- Maximum 4 diagrams per deliverable — each must earn its place

## Footnote System

Use superscript numbers ¹²³ for:
- Methodology explanations ("¹ Score weighted by business impact × technical effort")
- Data sources ("² Based on git log analysis of last 6 months")
- Assumptions ("³ Assumes current team size of 8 FTE")
- Caveats ("⁴ Confidence: Medium — no production metrics available")

Collect all footnotes at the end of each major section or at document end.

## Cross-Reference Pattern

When referencing another deliverable or section:
- "→ See 03_Analisis_AS-IS § Deuda Técnica for detailed breakdown"
- "→ This risk is tracked in 06_Solution_Roadmap § Pivot Point 3"
- "→ Stakeholder impact mapped in 01_Stakeholder_Map § RACI"

## Anti-Patterns (Never Do)

| Anti-Pattern | Instead |
|-------------|---------|
| "As mentioned above..." | Use section cross-reference |
| "It should be noted that..." | Just state the fact |
| "In order to..." | "To..." |
| "It is important to note..." | Delete — if it's important, it's self-evident |
| Repeating the same finding in multiple sections | State once, cross-reference elsewhere |
| Empty table cells | Use "—" or "N/A" with reason |
| Scores without justification | Every score has ≥1 evidence line |
| Diagrams without text summary | Always add accessibility line |
| Wall of text without visual breaks | Tables, callouts, or diagrams every 3-5 paragraphs |

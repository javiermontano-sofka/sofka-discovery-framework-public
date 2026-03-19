# Metaprompts — Agile Maturity Assessment

> Meta-level strategies to maximize assessment accuracy and reduce bias.

---

## 1. Anti-Inflation Protocol

**Purpose:** Counteract the universal tendency to inflate agile maturity scores.

```
Before finalizing any maturity score, apply this deflation check:

For each dimension scored ≥3:
1. Can you cite a specific observable behavior (not a ceremony)?
   - If only ceremonies, reduce score by 1
2. Is there quantitative evidence (metrics, not opinions)?
   - If opinion-only, tag as [INFERENCIA] and reduce confidence
3. Would an external observer see the same thing?
   - If team-reported only, triangulate with artifact review

Rule: No dimension scores ≥4 without at least one [METRIC] evidence tag.
Rule: If all dimensions score ≥3, run the Hawthorne Check — are scores inflated
because the team knows they're being assessed?

After deflation check:
- Document adjustments made and rationale
- Present both raw (self-reported) and adjusted scores
```

---

## 2. Systemic Pattern Detection

**Purpose:** Identify organizational patterns that appear across multiple teams.

```
After scoring all teams individually, run this cross-team analysis:

1. CLUSTER ANALYSIS: Group teams by maturity profile similarity
   - Are there "islands of excellence" surrounded by low maturity?
   - Are all teams weak in the same dimension? (systemic issue)

2. CONWAY'S LAW CHECK: Does team structure mirror org chart?
   - If yes, "agile teams" may be functional silos renamed
   - Check: Can teams deliver end-to-end without handoffs?

3. LEADERSHIP SHADOW: Does leadership support score correlate with outcomes?
   - If low leadership + high practices: team is self-sustaining (fragile)
   - If high leadership + low practices: investment not reaching teams

4. TOOL DEPENDENCY: Does tooling score inflate practices?
   - Teams may confuse "we use Jira" with "we are agile"
   - Check: Would practices survive a tool change?

Produce a systemic findings section separate from team scores.
```

---

## 3. Progressive Disclosure for Context Efficiency

**Purpose:** Load assessment knowledge progressively to optimize context window.

```
Assessment knowledge loading order:

PHASE 1 — Always load:
- SKILL.md frontmatter + Proceso section
- Current team/org data provided by user

PHASE 2 — Load on demand:
- references/body-of-knowledge.md §2 (Assessment Dimensions)
  → When defining dimensions and rubrics
- references/body-of-knowledge.md §3 (Anti-Patterns)
  → When identifying anti-patterns in Step 8

PHASE 3 — Load only if needed:
- references/state-of-the-art.md (trends, benchmarks)
  → When client asks for industry comparison
- references/body-of-knowledge.md §5 (Industry Benchmarks)
  → When producing benchmark comparison in Step 7

Never load all references at start. Maturity assessment is data-driven —
prioritize client data over reference knowledge.
```

---

*PMO-APEX v1.0 — Metaprompts · Agile Maturity Assessment*

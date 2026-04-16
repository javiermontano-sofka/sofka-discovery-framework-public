# Metaprompts — Spotify Model

> Meta-level strategies to maximize skill effectiveness.

---

## 1. Anti-Pattern Detection (Design Review)

**Purpose:** Systematically check the Spotify design for common anti-patterns before delivery.

```
Review the proposed Spotify model design for these anti-patterns:

1. SPOTIFY THEATER: Did we just rename existing teams?
   → Check: Do squads have genuine autonomy over HOW?
   → Check: Can any squad deploy independently?

2. MATRIX OVERHEAD: Does the chapter/tribe dual reporting create confusion?
   → Check: Is it clear who makes which decisions?
   → Check: Do chapter leads and tribe leads have non-overlapping authority?

3. MISSION OVERLAP: Do any squads have ambiguous boundaries?
   → Check: For each user story, is it clear which squad owns it?
   → Check: Are there API contracts between squads with adjacent missions?

4. GUILD DECAY: Will the proposed guilds survive 6 months?
   → Check: Is there genuine organic interest (not mandated)?
   → Check: Does each guild have at least 1 champion who will sustain it?

5. TRIBE BLOAT: Will any tribe exceed 150 people within 12 months?
   → Check: Growth projections per tribe
   → Check: Pre-plan split trigger conditions

For each anti-pattern found, propose a specific mitigation.
```

---

## 2. Conway's Law Alignment Check

**Purpose:** Verify that team structure aligns with desired system architecture.

```
For each squad in the design:

1. Map squad mission → system components owned
2. Verify: Can the squad deliver its mission end-to-end
   without depending on another squad for deployment?
3. If dependency exists:
   - Is it managed via X-as-a-Service (platform squad)?
   - Or does it require collaboration mode (temporary, time-boxed)?
4. Flag any squad where system architecture contradicts team boundary

Produce a Conway's Law alignment matrix:
| Squad | Mission | System Components | Dependencies | Alignment Score |
```

---

## 3. Progressive Disclosure Strategy

**Purpose:** Optimize context window usage.

```
PHASE 1 — Minimal context (always load):
- SKILL.md frontmatter + Proceso section
- Current organizational structure
- Product portfolio overview

PHASE 2 — On-demand:
- references/body-of-knowledge.md §2 (design rules)
  → Load when designing squads/tribes/chapters
- references/body-of-knowledge.md §3 (health check)
  → Load when implementing health check framework

PHASE 3 — Deep:
- references/state-of-the-art.md
  → Load when client mentions Team Topologies or post-Spotify evolution
- examples/sample-output.md
  → Load when formatting final deliverables
```

---

*PMO-APEX v1.0 — Metaprompts · Spotify Model*

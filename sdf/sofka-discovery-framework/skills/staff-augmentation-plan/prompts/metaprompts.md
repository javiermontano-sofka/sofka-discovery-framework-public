# Metaprompts — Staff Augmentation Planning

> Meta-level strategies to maximize skill effectiveness.

---

## 1. Vendor Lock-In Risk Assessment

**Purpose:** Evaluate the augmentation plan for hidden vendor dependency risks.

```
For each augmented role in the plan:

1. KNOWLEDGE CONCENTRATION:
   - Does this person hold unique knowledge not documented or shared?
   - If they left tomorrow, what breaks?
   - Score: Low (documented, 2+ people know) / Medium (partially documented) / High (only they know)

2. REPLACEMENT DIFFICULTY:
   - How long to find and onboard a replacement?
   - Is the skill common or rare in the market?
   - Score: Easy (<2 weeks) / Medium (2-6 weeks) / Hard (>6 weeks)

3. DEPENDENCY DEPTH:
   - How many project-critical components depend on this person?
   - Are they on the critical path?
   - Score: Shallow (1-2 components) / Medium (3-5) / Deep (>5)

4. MITIGATION STATUS:
   - Is KT happening? Is documentation current? Is cross-training active?
   - Score: Active / Planned / None

Generate risk entries for any role scoring High + Hard + Deep.
Tag [PLAN] if mitigation exists, [SUPUESTO] if not.
```

---

## 2. Integration Quality Monitor

**Purpose:** Track whether augmented staff are truly integrated vs. working in parallel.

```
At each sprint boundary, assess integration health:

SIGNAL 1 — Code Reviews:
- Are augmented staff reviewing internal code AND vice versa?
- One-directional reviews = parallel teams, not integration.

SIGNAL 2 — Communication Patterns:
- Do augmented staff participate in architectural discussions?
- Are they only in standup or also in design sessions?

SIGNAL 3 — Knowledge Flow:
- Has augmented staff taught the internal team anything new?
- Has the internal team shared domain knowledge with augmented staff?

SIGNAL 4 — Social Integration:
- Do augmented staff attend informal team events?
- Are they referred to by name or "the contractor"?

If 2+ signals are negative, escalate integration concern to PM.
```

---

## 3. Progressive Disclosure Strategy

**Purpose:** Optimize context window usage.

```
PHASE 1 — Minimal context (always load):
- SKILL.md frontmatter + Proceso section
- Skills gap analysis output
- Budget constraints

PHASE 2 — On-demand:
- references/body-of-knowledge.md §2 (integration patterns)
  → Load when designing onboarding plan
- references/body-of-knowledge.md §4 (IP protection)
  → Load when designing governance model

PHASE 3 — Deep:
- references/state-of-the-art.md
  → Load when client asks about nearshore or emerging models
- examples/sample-output.md
  → Load when formatting final deliverables
```

---

*PMO-APEX v1.0 — Metaprompts · Staff Augmentation Planning*

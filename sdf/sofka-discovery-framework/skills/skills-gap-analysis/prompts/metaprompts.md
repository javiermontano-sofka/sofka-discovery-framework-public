# Metaprompts — Skills Gap Analysis & Training Plan

> Meta-level strategies to maximize skill effectiveness.
> Metaprompts don't produce deliverables — they optimize HOW deliverables are produced.

---

## 1. Dunning-Kruger Correction (Bias Calibration)

**Purpose:** Systematically adjust self-assessment scores to counter cognitive biases.

```
For each self-assessed skill in the inventory, apply calibration:

RULE 1 — Expertise Inflation:
- If a team member rates themselves 5/5 on a skill, require evidence:
  certification, published work, or peer confirmation.
  Without evidence, cap at 4/5 and tag [SUPUESTO].

RULE 2 — Imposter Discount:
- Senior team members who rate themselves 2/5 on core skills:
  cross-check with delivery history. If they have delivered successfully
  using that skill, adjust upward with [INFERENCIA] tag.

RULE 3 — Recency Bias:
- Skills used in the last sprint rated higher than skills used 6 months ago.
  For dormant skills, add a "recency" modifier: -1 if not used in 6+ months.

RULE 4 — Team Averaging:
- If the entire team rates a skill at the same level (±0.5), suspect groupthink.
  Verify with practical demonstration for at least 1 team member.

After calibration, document adjustment rationale per modified score.
```

---

## 2. Progressive Disclosure Strategy

**Purpose:** Optimize context window usage by loading skills knowledge progressively.

```
When executing skills gap analysis, load knowledge in this order:

PHASE 1 — Minimal context (always load):
- SKILL.md frontmatter + Proceso section
- Project requirements/tech stack document
- Team roster

PHASE 2 — On-demand (load when needed):
- references/body-of-knowledge.md §2 (assessment techniques)
  → Load only when selecting assessment methods in Step 2
- references/body-of-knowledge.md §3 (gap classification)
  → Load only when rating gap severity in Step 4
- references/body-of-knowledge.md §4 (training plan design)
  → Load only when designing training plan in Step 6

PHASE 3 — Deep (load only if complexity warrants):
- references/state-of-the-art.md (AI taxonomies, skills-based orgs)
  → Load only for transformation projects or modern organizations
- examples/sample-output.md
  → Load only when formatting final deliverables

Never load all references at once. Context efficiency is a quality attribute.
```

---

## 3. Skills-to-Risk Bridging

**Purpose:** Ensure every Critical skills gap generates a corresponding risk register entry.

```
After completing gap analysis, for each Critical gap:

1. Generate a risk statement in cause-event-effect format:
   "Because [skill gap exists], there is a risk that [delivery impact],
    resulting in [project consequence]."

2. Assess probability based on closure plan timeline:
   - Gap closure planned before skill needed → P = 0.3
   - Gap closure concurrent with skill needed → P = 0.5
   - Gap closure after skill needed → P = 0.7
   - No closure path identified → P = 0.9

3. Cross-reference with risk register:
   - If risk already exists, update with skills gap evidence
   - If risk is new, create entry tagged [PLAN]

4. For key-person dependencies (bus factor = 1):
   - Auto-generate risk with P = 0.3, I = 0.7 minimum
   - Tag [PLAN] and link to cross-training plan
```

---

*PMO-APEX v1.0 — Metaprompts · Skills Gap Analysis & Training Plan*

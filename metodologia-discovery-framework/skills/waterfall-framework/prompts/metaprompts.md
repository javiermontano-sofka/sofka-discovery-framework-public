# Metaprompts — Waterfall Framework Implementation

> Meta-level strategies to maximize framework adoption and effectiveness.

---

## 1. Over-Engineering Detection

**Purpose:** Prevent framework designs that are too heavy for the organization's maturity.

```
For each framework component designed:

1. ADOPTION BARRIER SCAN:
   - How many new processes does this introduce simultaneously?
   - If >5 new processes → high adoption risk
   - Does the team have capacity to learn AND deliver?

2. VALUE-TO-OVERHEAD RATIO:
   - How much time does this process consume per project?
   - What decision does it enable that wasn't possible before?
   - If overhead > 15% of project effort → flag over-engineering

3. MATURITY MISMATCH:
   - Is this component appropriate for the organization's maturity level?
   - Level 2 orgs cannot sustain Level 4 processes
   - Design for current+1, not current+3

Strip components where overhead exceeds value.
Tag [PLAN] if evidence-based, [SUPUESTO] if assumed adoption rate.
```

---

## 2. Template Effectiveness Validation

**Purpose:** Ensure templates actually improve outcomes rather than just adding paperwork.

```
For each template in the framework:

1. COMPLETION RATE:
   - What % of teams complete this template fully?
   - If <70% completion → template is too complex or low-value
   - Simplify or make optional

2. DECISION IMPACT:
   - Does the completed template change any downstream decision?
   - If no decision depends on it → candidate for removal
   - Map template → decision → outcome chain

3. DUPLICATION CHECK:
   - Does this template capture information already in another artifact?
   - Consolidate overlapping templates
   - Single source of truth for each data element

Generate template effectiveness scores. Recommend retirement for
templates scoring low on both completion and decision impact.
```

---

## 3. Progressive Disclosure Strategy

```
PHASE 1 — Always load:
- SKILL.md frontmatter + Proceso section
- Stage-gate architecture overview
- Current organizational maturity level

PHASE 2 — On-demand:
- references/body-of-knowledge.md (full framework details)
  → When designing or tailoring the framework
- WBS standards + EVM setup → When implementing specific components

PHASE 3 — Deep:
- references/state-of-the-art.md → For hybrid gateway or lean waterfall design
- examples/sample-output.md → When producing framework documentation
```

---

*PMO-APEX v1.0 — Metaprompts · Waterfall Framework*

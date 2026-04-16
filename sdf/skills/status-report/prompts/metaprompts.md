# Metaprompts — Status Report Generation

> Meta-level strategies to maximize reporting effectiveness.

---

## 1. Honesty Audit (Anti-Watermelon Report)

**Purpose:** Detect "watermelon reports" — green on the outside, red on the inside.

```
Before finalizing the status report, run this honesty check:

CHECK 1 — RAG Justification:
- For each Blue dimension, cite the specific metric that justifies Blue.
- If the justification is "no complaints" or "no issues reported," downgrade to Amber.
  Absence of evidence is not evidence of absence.

CHECK 2 — Accomplishment Quality:
- Are accomplishments outcomes or activities?
- "Held 5 meetings" → activity (bad). "Approved UAT test plan" → outcome (good).
- Rewrite any activities as outcomes.

CHECK 3 — Risk Honesty:
- Are the top 3 risks genuinely the top 3 by P*I, or the 3 most comfortable to report?
- Check if the risk register has higher-rated risks not in the report.

CHECK 4 — Decision Urgency:
- Have any decisions been "pending" for >2 reporting periods?
- If yes, escalate the decision with deadline.

CHECK 5 — Trend Direction:
- Is the project trending better or worse vs last period?
- If worse, is the narrative acknowledging the trend or masking it?

Flag any findings and adjust report before distribution.
```

---

## 2. Narrative Quality Enhancer

**Purpose:** Transform data dumps into coherent status narratives.

```
After assembling all report data, write the narrative following this structure:

PARAGRAPH 1 — The Headline:
"This period, {PROJECT} is [overall status] because [primary driver].
The most significant development was [key event]."

PARAGRAPH 2 — The Context:
"We completed [accomplishments] which means [so what for stakeholders].
This positions us [ahead/on track/behind] for [next milestone]."

PARAGRAPH 3 — The Concern:
"The primary concern is [top risk or issue] which could [impact].
We are addressing this by [mitigation]. We need [decision/resource] by [date]."

PARAGRAPH 4 — The Ask:
"For the next period, we need [specific asks from stakeholders].
The decisions in this report require attention by [dates]."

Every sentence must be traceable to a data point in the report.
No subjective language without evidence tag.
```

---

## 3. Progressive Disclosure Strategy

**Purpose:** Optimize context window usage.

```
PHASE 1 — Minimal context (always load):
- SKILL.md frontmatter + Proceso section
- Project schedule/milestone tracker
- Risk register top 5

PHASE 2 — On-demand:
- references/body-of-knowledge.md §2 (RAG framework)
  → Load when determining RAG status
- references/body-of-knowledge.md §4 (audience adaptation)
  → Load when adapting for specific audience

PHASE 3 — Deep:
- references/state-of-the-art.md
  → Load when implementing automated or predictive reporting
- examples/sample-output.md
  → Load when formatting final report
```

---

*PMO-APEX v1.0 — Metaprompts · Status Report Generation*

# Metaprompts — Stakeholder Register & Analysis

> Meta-level strategies to maximize skill effectiveness.

---

## 1. Hidden Stakeholder Discovery

**Purpose:** Systematically uncover stakeholders not immediately obvious from the charter or org chart.

```
After initial stakeholder identification, run these discovery passes:

PASS 1 — Downstream Impact:
- Who will use the project outputs daily?
- Who maintains the systems being changed?
- Who trains end users?
- Who handles support tickets for affected systems?

PASS 2 — Upstream Dependencies:
- Who controls budget approval beyond the sponsor?
- Who owns the data being migrated/transformed?
- Who has regulatory authority over the domain?
- Who controls the infrastructure being used?

PASS 3 — Lateral Influence:
- Which peer projects compete for the same resources?
- Which department heads have informal veto power?
- Who are the organizational opinion leaders (not by title)?
- Which external partners are affected?

PASS 4 — Temporal Stakeholders:
- Who joins the stakeholder landscape mid-project? (auditors, new hires, acquired companies)
- Who leaves? (departing executives, sunset departments)

For each newly discovered stakeholder, add to register with [INFERENCIA] tag.
Confirm with sponsor before finalizing.
```

---

## 2. Political Risk Scan

**Purpose:** Identify political dynamics that could derail the project.

```
For each high-power stakeholder:

1. ALIGNMENT CHECK:
   - Does this project threaten their budget, headcount, or influence?
   - Does this project benefit their competitor department?
   - Tag: Aligned / Neutral / Threatened

2. COALITION ANALYSIS:
   - Who do they influence? Who influences them?
   - Are they part of a coalition for or against the project?
   - Map influence paths in the stakeholder network

3. HISTORY CHECK:
   - Have they supported or opposed similar projects before?
   - What happened to those projects?
   - Tag: [HISTORICO] if data available, [SUPUESTO] if not

4. SURPRISE PREVENTION:
   - What information, if learned unexpectedly, would cause them to oppose the project?
   - Ensure they receive this information proactively from the PM

Generate a political risk matrix with mitigation strategies.
```

---

## 3. Progressive Disclosure Strategy

**Purpose:** Optimize context window usage.

```
PHASE 1 — Minimal context (always load):
- SKILL.md frontmatter + Proceso section
- Project charter (sponsor, initial stakeholders)
- Organizational chart

PHASE 2 — On-demand:
- references/body-of-knowledge.md §2 (engagement assessment)
  → Load when assessing engagement levels
- references/body-of-knowledge.md §4 (political dynamics)
  → Load when political complexity is detected

PHASE 3 — Deep:
- references/state-of-the-art.md
  → Load for transformation projects or complex stakeholder landscapes
- examples/sample-output.md
  → Load when formatting final register
```

---

*PMO-APEX v1.0 — Metaprompts · Stakeholder Register & Analysis*

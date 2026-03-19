# Metaprompts — Technical Writing & Documentation

> Meta-level strategies to maximize documentation quality.

---

## 1. Audience Calibration Check

**Purpose:** Ensure documentation is written for the reader, not the author.

```
Before finalizing any document:

1. WHO is the primary reader?
   - Their technical level (1-5)
   - Their familiarity with the domain (1-5)
   - Their purpose for reading (learn, reference, troubleshoot, decide)

2. READ-THROUGH from reader perspective:
   - Can the reader understand paragraph 1 without reading anything else?
   - Are acronyms defined on first use?
   - Is jargon appropriate for the audience level?
   - Can the reader find what they need in <30 seconds (for reference docs)?

3. ADJUST if misaligned:
   - Too technical for audience → add context, define terms
   - Too simple for audience → remove explanations of obvious concepts
   - Wrong structure for purpose → restructure per Diátaxis type

Tag audience assumptions [SUPUESTO] if not validated with actual readers.
```

---

## 2. Freshness Audit

**Purpose:** Identify documentation that has drifted from reality.

```
For each document in the scope:

1. LAST UPDATED: When was it last modified?
   - <3 months: likely current
   - 3-12 months: verify accuracy
   - >12 months: assume stale until proven otherwise

2. CODE DRIFT: Has the code/system changed since the doc was updated?
   - Check git log for changes to related files
   - If code changed but docs didn't → flag for update

3. DECISION DRIFT: Do referenced decisions still apply?
   - Check if superseding ADRs exist
   - If decisions changed but docs reflect old decisions → flag

Mark each document: Current / Needs Review / Stale / Obsolete
```

---

## 3. Progressive Disclosure Strategy

```
PHASE 1 — Always load:
- SKILL.md frontmatter + Proceso section
- Subject matter content
- Target audience definition

PHASE 2 — On-demand:
- references/body-of-knowledge.md §1 (frameworks)
  → When selecting documentation approach
- references/body-of-knowledge.md §3 (Mermaid standards)
  → When creating diagrams

PHASE 3 — Deep:
- references/state-of-the-art.md
  → When recommending documentation tooling
- examples/sample-output.md
  → When formatting deliverables
```

---

*PMO-APEX v1.0 — Metaprompts · Technical Writing*

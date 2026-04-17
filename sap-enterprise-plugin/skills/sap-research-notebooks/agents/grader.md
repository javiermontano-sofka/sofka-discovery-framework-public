# @grader (sap-research-notebooks internal)

> Skill-specific QA grader for the NotebookLM SAP playbook.
> Author: Javier Montaño

## Role

Grade outputs of `sap-research-notebooks` against playbook assertions. The skill's value is in **guidance** (when to create, how to query, how to vitaminize), NOT in invoking hardcoded notebooks.

## Grading Protocol

1. Read output(s) in the eval workspace
2. Check each assertion below against content
3. Evidence = line numbers / quotes
4. Write `grading.json` with `expectations` array (`text`, `passed`, `evidence`)

## Domain Assertions — Playbook Compliance

### Critical (hard fails if violated)

- [ ] **No notebook hardcoding**: output does NOT assume a specific notebook ID or name as mandatory
- [ ] **Decision guidance**: when user asks one-off question, skill recommends alternative (NOT create notebook)
- [ ] **Evidence tag `[NOTEBOOKLM]`** used for NotebookLM sources (not generic `[DOC]`)
- [ ] **Source taxonomy applied**: classifies sources (official / community / third-party) with confidence
- [ ] **Auth prerequisite mentioned**: if auth failure possible → instructs `nlm login`
- [ ] **Does NOT fabricate** notebook content if tokens expired or notebook empty

### Quality (recommended)

- [ ] **Pattern A/B/C referenced** when composing research queries
- [ ] **Version/year included** in proposed queries (2024/2025)
- [ ] **4-phase vitaminization** mentioned (Seeding → Curación → Enriquecimiento → Validación)
- [ ] **Health metrics** cited (% official, edad sources, etc.)
- [ ] **Anti-patterns flagged** when relevant (e.g., query genérica, no refresh)
- [ ] **Audio briefing** offered post-deliverable estratégico
- [ ] **Lifecycle awareness**: creación / seeding / curación / uso / refresh / archivo

### Anti-Patterns (hard fails)

- Skill assumes a specific notebook exists without checking
- Output invents source content that doesn't exist
- Recommends creating notebooks for one-off queries (wasteful)
- Skips curation step after research import
- Proceeds silently when auth fails

## Scoring Model

- 11-13 assertions pass → 🟢 PASS
- 8-10 → 🟡 PARTIAL (iterate)
- <8 or any hard fail → 🔴 FAIL

## Example grading.json Structure

```json
{
  "expectations": [
    {
      "text": "No notebook hardcoding",
      "passed": true,
      "evidence": "Line 15: 'El usuario decide qué notebooks existen'"
    },
    {
      "text": "Decision guidance for one-off questions",
      "passed": false,
      "evidence": "Output recommends creating notebook for all cases, missing the one-off exclusion rule"
    }
  ]
}
```

---
*Skill-internal grader. Plugin sap-enterprise-plugin v3.3+. Author: Javier Montaño.*

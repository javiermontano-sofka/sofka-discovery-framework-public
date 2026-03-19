---
name: apex-pipeline-governance
description: >
  Use when the user asks to "enforce gates", "validate checkpoints", "verify data contracts",
  "check gate criteria", "run gate review", or mentions pipeline governance, gate enforcement,
  checkpoint validation, phase transition, quality gates. Triggers on: enforces quality gates
  across pipeline, validates data contracts between phases, verifies evidence completeness,
  produces GO/NO-GO recommendations, tracks conditional approvals.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Pipeline Governance & Gate Enforcement

**TL;DR**: Enforces quality gates across the PMO-APEX pipeline, validates data contracts between phases, verifies checkpoint criteria, and ensures no phase transition occurs without meeting mandatory evidence requirements. Acts as the compliance backbone of the orchestration system.

## Principio Rector
Los gates no son formalidades — son puntos de decisión con consecuencias. Un gate aprobado sin evidencia es peor que no tener gate: crea falsa confianza. La gobernanza del pipeline protege al equipo de avanzar sobre cimientos incompletos y al sponsor de invertir en entregables construidos sobre supuestos no validados.

## Assumptions & Limits
- Assumes pipeline phase structure (G0-G3) is defined and accepted by governance [SUPUESTO]
- Assumes evidence artifacts are available for gate review [SUPUESTO]
- Breaks if governance authority is undefined — gates without enforcement authority are suggestions, not gates [STAKEHOLDER]
- Scope limited to APEX pipeline gates; organizational stage-gate processes may have additional requirements [PLAN]
- Does not create deliverables — validates deliverables created by domain skills [PLAN]

## Usage
```bash
/pm:pipeline-governance $PROJECT_NAME --gate=G1
/pm:pipeline-governance $PROJECT_NAME --gate=G2 --mode=strict
/pm:pipeline-governance $PROJECT_NAME --validate-contracts --phase=3
```
**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PROJECT_NAME` | Yes | Target project identifier |
| `--gate` | No | `G0` / `G1` / `G1.5` / `G2` / `G3` |
| `--mode` | No | `strict` / `standard` / `advisory` (default: `standard`) |
| `--validate-contracts` | No | Validate data contracts for target phase |
| `--phase` | No | Pipeline phase number |

## Service Type Routing
`{TIPO_PROYECTO}`: All project types share the same gate structure (G0-G3). Gate criteria adapt by methodology: Agile gates are lightweight but frequent; Waterfall gates are comprehensive but fewer; Hybrid applies proportional rigor.

## Before Enforcing Gates
1. Read `references/ontology/quality-gates.md` — load gate criteria for the target gate [PLAN]
2. Glob `*{fase}*` deliverables — inventory artifacts available for review [PLAN]
3. Read evidence tags in deliverables — count [SUPUESTO] percentage for threshold check [METRIC]
4. Check previous gate decisions — verify conditional items from prior gates are resolved [PLAN]

## Entrada (Input Requirements)
- Current phase deliverables for gate review
- Data contract requirements for target phase
- Previous gate decisions and conditions
- Evidence artifacts tagged with evidence markers

## Proceso (Protocol)
1. **Identify current gate** — Determine which gate applies based on pipeline position
2. **Load gate criteria** — Retrieve mandatory and optional criteria for the gate
3. **Verify data contracts** — Check that all required inputs for next phase exist and are valid
4. **Evidence audit** — Verify evidence tags on all assertions ([PLAN], [METRIC], [SUPUESTO])
5. **Supuesto threshold** — If >30% assertions are [SUPUESTO], flag mandatory warning
6. **Compile gate report** — Summarize pass/fail per criterion with evidence references
7. **Decision recommendation** — Recommend GO, CONDITIONAL GO, or NO-GO with rationale
8. **Document conditions** — If conditional, specify what must be resolved before next gate

## Edge Cases
1. **Mandatory criterion failed with no remediation path** — NO-GO is the only valid recommendation; document what needs to change for future gate attempt.
2. **Gate bypassed without formal waiver** — Flag as governance violation; require retroactive waiver from appropriate authority; document risk of proceeding without gate compliance.
3. **Evidence audit reveals [SUPUESTO] above 30% threshold** — Mandatory warning banner on all deliverables; conditional GO only if validation plan exists for each [SUPUESTO].
4. **Multiple consecutive conditional approvals without resolution** — Escalate to steering committee; pattern indicates systemic problem, not individual gate issue.

## Example: Good vs Bad

**Good Gate Review:**
| Attribute | Value |
|-----------|-------|
| Gate | G2 — pre-execution checkpoint [PLAN] |
| Criteria checked | 12 mandatory, 5 optional — all evaluated [METRIC] |
| Evidence audit | 88% [PLAN]/[METRIC], 12% [SUPUESTO] — below 30% threshold [METRIC] |
| Decision | CONDITIONAL GO — 2 conditions with owners and deadlines [PLAN] |
| Report | Pass/fail per criterion with specific evidence references |

**Bad Gate Review:**
"Everything looks fine, let's proceed." — No criteria-by-criteria evaluation, no evidence audit, no [SUPUESTO] threshold check, no documented conditions. Gate provides no actual quality assurance.

## Salida (Deliverables)
- Gate review report with pass/fail per criterion
- Data contract validation results
- Evidence audit summary
- GO / CONDITIONAL GO / NO-GO recommendation
- Conditions and action items (if conditional)

## Validation Gate
- [ ] Every gate criterion objectively evaluated with pass/fail determination
- [ ] All mandatory criteria checked — none skipped regardless of time pressure
- [ ] Evidence audit completed with [SUPUESTO] percentage calculated
- [ ] [SUPUESTO] threshold (30%) enforced — warning banner if exceeded
- [ ] NO-GO includes specific remediation steps with effort estimates
- [ ] Decision rationale transparent and traceable to criterion evaluations
- [ ] Conditional items have specific owners, deadlines, and verification method
- [ ] Gate standards applied uniformly across all projects — no favorites
- [ ] Previous conditional items verified as resolved before new gate
- [ ] Gate rigor proportional to methodology — not one-size-fits-all

## Escalation Triggers
- Mandatory criterion failed with no remediation path
- Gate bypassed without formal waiver
- Evidence audit reveals fabricated or missing evidence
- Multiple consecutive conditional approvals without resolution

## Additional Resources
| Resource | When to Read | Location |
|----------|-------------|----------|
| Body of Knowledge | When applying quality gate criteria and standards | `references/body-of-knowledge.md` |
| State of the Art | When implementing modern governance automation | `references/state-of-the-art.md` |
| Knowledge Graph | When mapping gates to pipeline phase transitions | `references/knowledge-graph.mmd` |
| Use Case Prompts | When running gate reviews for specific project types | `prompts/use-case-prompts.md` |
| Metaprompts | When adapting gate criteria for non-standard pipelines | `prompts/metaprompts.md` |
| Sample Output | When reviewing expected gate report quality | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark

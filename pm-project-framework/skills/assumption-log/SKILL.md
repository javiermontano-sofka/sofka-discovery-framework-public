---
name: apex-assumption-log
description: >
  Use when the user asks to "track assumptions", "document constraints", "log assumptions",
  "manage project assumptions", or "validate planning hypotheses".
  Activates when a stakeholder needs to create an assumption register, document project constraints,
  link assumptions to risks, establish assumption validation cadence, or audit planning
  hypotheses across the project lifecycle.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Assumption Tracking & Constraint Documentation

**TL;DR**: Maintains a living assumption log that captures, categorizes, and tracks all project assumptions and constraints. Each assumption is tagged with confidence level, impact if wrong, validation method, and responsible owner. Integrates with the risk register since invalidated assumptions become risks.

## Principio Rector
Toda planificación descansa sobre supuestos. Los supuestos no validados son riesgos encubiertos. Un proyecto maduro hace sus supuestos explícitos, los prioriza por impacto, y los valida activamente. Un supuesto que nadie cuestiona es el que más daño puede causar.

## Assumptions & Limits
- Assumes the project charter exists with initial assumptions to harvest [SUPUESTO]
- Assumes assumption owners are available and willing to validate within agreed cadence [SUPUESTO]
- Breaks when assumptions are embedded in contracts but not surfaced — legal review may be needed
- Scope limited to project-level assumptions; organizational assumptions require PMO escalation
- Does not replace risk management — invalidated assumptions feed the risk register
- Constraint documentation covers project constraints only, not organizational policies

## Usage

```bash
# Create initial assumption log from charter
/pm:assumption-log $PROJECT --type=initialize --source="charter"

# Add a new assumption to the log
/pm:assumption-log $PROJECT --type=add --category="technical" --confidence="medium"

# Run assumption validation review
/pm:assumption-log $PROJECT --type=review --scope="high-impact"
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PROJECT` | Yes | Project identifier |
| `--type` | Yes | `initialize`, `add`, `review`, `audit` |
| `--source` | No | Source document for harvesting assumptions |
| `--category` | No | `technical`, `organizational`, `financial`, `resource`, `external` |
| `--confidence` | No | `high`, `medium`, `low` |
| `--scope` | No | Filter for review scope |

## Service Type Routing
`{TIPO_PROYECTO}` variants:
- **Agile**: Assumptions validated through sprint experiments; living log refined during retrospectives and backlog grooming
- **Waterfall**: Formal assumption register per PMBOK; assumptions frozen at planning, tracked through change control
- **SAFe**: Assumptions surfaced during PI Planning; validated across iterations; cross-ART assumptions escalated to solution train
- **Hybrid**: Phase-level assumptions managed formally; iteration-level assumptions validated empirically within each phase
- **Transformation**: Organizational readiness assumptions; change adoption rate hypotheses; cultural resistance assumptions
- **Recovery**: Assumptions re-validated aggressively; root-cause analysis of failed assumptions from troubled project history

## Before Logging

1. **Read** the project charter to harvest initial assumptions from scope, timeline, and resource sections
2. **Glob** `*.md` in the project deliverables folder for implicit assumptions in planning documents
3. **Read** the risk register to identify assumptions already linked to risks
4. **Grep** for `[SUPUESTO]` tags across existing project artifacts to find undocumented assumptions

## Entrada (Input Requirements)
- Project charter with initial assumptions
- Input analysis digest
- Stakeholder interviews and meeting notes
- Technical assessment findings
- Historical lessons learned

## Proceso (Protocol)
1. **Harvest assumptions** — Extract from all project documents and conversations
2. **Categorize** — Classify as technical, organizational, financial, resource, or external
3. **Assess confidence** — Rate each assumption: High (>80%), Medium (50-80%), Low (<50%)
4. **Impact analysis** — Rate impact if assumption proves false: Critical, High, Medium, Low
5. **Define validation method** — Specify how and when each assumption will be tested
6. **Assign owners** — Designate a responsible party for validating each assumption
7. **Link to risks** — Map low-confidence/high-impact assumptions to risk register entries
8. **Document constraints** — Separately catalog hard constraints (non-negotiable) vs. soft constraints
9. **Establish review cadence** — Set schedule for assumption review (weekly for active project)
10. **Track status** — Maintain status: Open, Validated, Invalidated, Converted-to-Risk

## Edge Cases

1. **Assumption is actually a fact**: If verifiable evidence exists, reclassify as a documented fact and remove from assumption log. Tag with [METRIC] or [PLAN] evidence. [PLAN]
2. **Assumption owner leaves the project**: Immediately reassign to another team member. Flag orphaned assumptions in next review cycle. Never leave an assumption unowned. [STAKEHOLDER]
3. **Constraint changes mid-project**: Treat as a change request — run impact analysis on all dependent planning artifacts. Update assumption log AND trigger change control. [SCHEDULE]
4. **Assumption invalidated with critical impact**: Immediately create risk register entry, notify sponsor, and trigger contingency plan review. Do not wait for next scheduled review. [PLAN]
5. **Stakeholders disagree on assumption validity**: Document both positions with evidence tags. Escalate to steering committee if impact is Critical. [STAKEHOLDER]

## Example: Good vs Bad

**Good Assumption Log:**

| Attribute | Value |
|-----------|-------|
| Assumptions harvested | 24 from 6 source documents |
| Categorization | 100% categorized across 5 categories |
| Confidence rated | Every assumption with justified confidence level |
| Validation methods | Specific, testable methods for each assumption |
| Owner assigned | 100% ownership coverage |
| Risk linkage | Low-confidence/high-impact linked to risk register |

**Bad Assumption Log:**
A document listing "we assume the team will be available" and "we assume the technology works" without confidence levels, impact analysis, validation methods, or owners. No linkage to risk register. Never reviewed after initial creation. Fails because it is a static list rather than a living management instrument — assumptions degrade into forgotten text.

## Validation Gate
- [ ] Every assumption has category, confidence level, impact rating, and assigned owner
- [ ] ≥80% of assumptions have specific, testable validation methods defined
- [ ] All Low-confidence + High/Critical-impact assumptions linked to risk register entries
- [ ] Constraints separated into hard (non-negotiable) vs. soft (flexible) categories
- [ ] Review cadence established and first review date scheduled
- [ ] No assumption without a source document or conversation reference
- [ ] Assumption heat map (confidence x impact) generated for prioritization
- [ ] Status tracking mechanism in place (Open, Validated, Invalidated, Converted-to-Risk)
- [ ] Decision-makers can see key assumptions affecting their domain [STAKEHOLDER]
- [ ] Review cadence aligned with project methodology rhythm [PLAN]

## Escalation Triggers
- Critical assumption invalidated
- More than 5 low-confidence assumptions on critical path
- Assumption owner unavailable or unresponsive
- Constraint changes invalidating project plan

## Salida (Deliverables)

- Primary deliverable: assumption register with validation plan
- All outputs tagged with evidence markers
- Mermaid diagrams where applicable
- Executive summary for stakeholder consumption

## Additional Resources

| Resource | When to read | Location |
|----------|-------------|----------|
| Body of Knowledge | Before starting to understand standards and frameworks | `references/body-of-knowledge.md` |
| State of the Art | When benchmarking against industry trends | `references/state-of-the-art.md` |
| Knowledge Graph | To understand skill dependencies and data flow | `references/knowledge-graph.mmd` |
| Use Case Prompts | For specific scenarios and prompt templates | `prompts/use-case-prompts.md` |
| Metaprompts | To enhance output quality and reduce bias | `prompts/metaprompts.md` |
| Sample Output | Reference for deliverable format and structure | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark

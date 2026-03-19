---
name: apex-skills-gap-analysis
description: >
  Use when the user asks to "analyze skills gaps", "assess team capabilities",
  "plan training", "evaluate competency readiness", "identify capability shortfalls",
  or mentions skills inventory, capability assessment, competency gap, training needs
  analysis, skill proficiency mapping.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Skills Gap Analysis & Training Plan

**TL;DR**: Assesses current team skills against project requirements to identify capability gaps. Produces a skills inventory, gap analysis matrix, and training/hiring plan to close gaps. Distinguishes between gaps addressable through training (weeks) and those requiring hiring (months).

## Principio Rector
Un equipo con las habilidades equivocadas producirá los resultados equivocados, sin importar cuánto esfuerzo invierta. El análisis de brechas de skills es preventivo: identifica lo que el equipo no puede hacer ANTES de que se convierta en un bloqueador del cronograma.

## Assumptions & Limits
- Assumes project requirements and technology stack are defined [PLAN]
- Assumes team members are available for skill assessment [SUPUESTO]
- Breaks when project scope is too vague to derive required skills
- Does not execute training; plans it. Use organizational L&D for execution
- Assumes self-assessment is supplemented with verification (peer review, tests) [SUPUESTO]
- Limited to project-level gaps; organizational capability building requires HR partnership

## Usage

```bash
# Full skills gap analysis
/pm:skills-gap-analysis $ARGUMENTS="--requirements tech-stack.md --team team-roster.md"

# Training plan only (gaps already identified)
/pm:skills-gap-analysis --type training-plan --gaps gaps.md --budget "40 FTE-days"

# Hiring requirements assessment
/pm:skills-gap-analysis --type hiring --gaps gaps.md --timeline "8 weeks"
```

**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$ARGUMENTS` | Yes | Path to requirements and team roster |
| `--type` | No | `full` (default), `training-plan`, `hiring`, `inventory` |
| `--budget` | No | Training budget in FTE-days or FTE-weeks |
| `--timeline` | No | Timeline for gap closure |

## Service Type Routing
`{TIPO_PROYECTO}`: Agile-Transformation assesses coaching and facilitation skills; ERP assesses functional and technical consultant skills; Cloud assesses cloud certification gaps; Digital-Transformation assesses change management skills.

## Before Analyzing Gaps
1. **Read** the project requirements and technology stack to identify needed skills [PLAN]
2. **Read** team roster and role definitions to understand current composition [PLAN]
3. **Glob** `**/certifications*` or `**/training*` to find existing team qualification data [PLAN]
4. **Grep** for skill-related risks in the risk register [INFERENCIA]

## Entrada (Input Requirements)
- Project requirements and technology stack
- Current team member profiles and skills
- Role definitions from resource plan
- Industry skill benchmarks
- Training budget constraints

## Proceso (Protocol)
1. **Requirements mapping** — List skills required per role from project scope
2. **Skills inventory** — Assess current team skills (proficiency 1-5 per skill per person)
3. **Gap identification** — Compare required vs. actual skills to find gaps
4. **Gap severity** — Rate each gap: Critical (blocks delivery), High (slows delivery), Medium (workaround exists)
5. **Closure strategy** — Determine strategy per gap: training, mentoring, hiring, or outsourcing
6. **Training plan** — Design training program for train-able gaps
7. **Hiring plan** — Define hiring requirements for gaps needing new talent
8. **Timeline** — Align skill readiness with project schedule needs
9. **Budget estimation** — Estimate training/hiring investment (FTE-weeks, not prices)
10. **Tracking mechanism** — Define how skill development will be tracked

## Edge Cases
1. **Critical skill gap with no closure path before project needs it** — Escalate as schedule risk. Options: delay dependent work, reduce scope requiring that skill, or accept quality risk. Quantify impact per option [SCHEDULE].
2. **Key skill available in only one team member** — Flag as single-point-of-failure. Prioritize cross-training for this skill. Add to risk register as key-person dependency [PLAN].
3. **Self-assessment inflated (team overrates own skills)** — Supplement with practical verification (coding challenges, case studies). Use skill demonstration not self-declaration [INFERENCIA].
4. **Training budget insufficient** — Prioritize Critical gaps over High/Medium. Explore free/low-cost alternatives (mentoring, pair programming, community resources). Document unfunded gaps as risks [PLAN].

## Example: Good vs Bad

**Good example — Actionable skills gap analysis:**

| Attribute | Value |
|-----------|-------|
| Skills assessed | 15 skills across 8 team members |
| Proficiency | 1-5 scale with verification method |
| Gaps found | 4 Critical, 3 High, 5 Medium |
| Closure strategy | 2 training, 1 hire, 1 mentoring per Critical gap |
| Timeline | All Critical gaps closed before Sprint 3 |
| Budget | 12 FTE-days training, 1 hire (8-week lead) |

**Bad example — Generic training request:**
"The team needs training on cloud." No skills inventory, no gap severity, no specific skills identified, no timeline alignment with project needs. Without knowing current proficiency, training may cover what the team already knows or miss what they actually lack.

## Salida (Deliverables)
- Skills inventory matrix (person x skill x proficiency)
- Gap analysis with severity ratings
- Training plan with timeline
- Hiring requirements document
- Skill development tracking dashboard

## Validation Gate
- [ ] Every project-critical skill assessed with proficiency rating (1-5) [METRIC]
- [ ] Proficiency verified through method beyond self-assessment [METRIC]
- [ ] Every gap classified by severity (Critical/High/Medium) [METRIC]
- [ ] Critical gaps have closure strategy with timeline [PLAN]
- [ ] Closure timeline aligned with project schedule needs [SCHEDULE]
- [ ] Training budget estimated in FTE-weeks (never prices) [PLAN]
- [ ] Hiring requirements include lead time for recruitment [SCHEDULE]
- [ ] Key-person dependencies identified and flagged [PLAN]
- [ ] Evidence ratio: ≥75% [PLAN]/[METRIC], <25% [SUPUESTO]
- [ ] Tracking mechanism defined for skill development progress [PLAN]

## Escalation Triggers
- Critical skill gap with no closure path before project needs it
- Training budget insufficient for gap closure
- Key skill available in only one team member
- Hiring market lacks required skills

## Additional Resources

| Resource | When to Read | Location |
|----------|-------------|----------|
| Body of Knowledge | Competency frameworks and assessment methods | `references/body-of-knowledge.md` |
| State of the Art | Modern skills assessment practices | `references/state-of-the-art.md` |
| Knowledge Graph | Skills gap in resource planning | `references/knowledge-graph.mmd` |
| Use Case Prompts | Skills analysis scenarios | `prompts/use-case-prompts.md` |
| Metaprompts | Custom competency frameworks | `prompts/metaprompts.md` |
| Sample Output | Reference skills gap report | `examples/sample-output.md` |

## Output Configuration
- **Language**: Spanish (Latin American, business register)
- **Evidence**: [PLAN], [SCHEDULE], [METRIC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- **Branding**: #2563EB royal blue, #F59E0B amber (NEVER green), #0F172A dark

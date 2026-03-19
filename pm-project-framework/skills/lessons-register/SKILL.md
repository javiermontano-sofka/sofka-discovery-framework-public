---
name: apex-lessons-register
description: >
  Use when the user asks to "capture lessons learned", "document project lessons",
  "build lessons register", "create knowledge base from project experience",
  "extract reusable insights", or mentions lessons learned, knowledge capture,
  lessons register, project learning, organizational memory. Triggers on: captures
  lessons from retrospectives, categorizes lessons by domain, creates searchable
  lessons register, distributes knowledge to future projects, rates lesson impact.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Lessons Learned Capture & Register

**TL;DR**: Systematically captures, categorizes, and stores lessons learned from project experiences (successes and failures). Maintains a living lessons register that feeds into organizational knowledge management, ensuring future projects benefit from past experiences.

## Principio Rector
Una lección no capturada está condenada a repetirse. Pero una lección capturada y no consultada es igualmente inútil. El registro de lecciones solo tiene valor si es consultado al inicio de cada proyecto. Las lecciones deben ser específicas, accionables, y buscables — no reflexiones genéricas.

## Assumptions & Limits
- Assumes team psychological safety sufficient for honest lesson sharing — blame culture kills learning [STAKEHOLDER]
- Assumes retrospective or review data exists as primary input source [SUPUESTO]
- Breaks if lessons are generic platitudes ("communicate better") — must be specific and actionable [PLAN]
- Scope limited to project-level lessons; organizational transformation lessons require OCM framing [PLAN]
- Does not replace retrospective facilitation — consumes retrospective outputs as input [PLAN]

## Usage
```bash
/pm:lessons-register $PROJECT_NAME --capture-from=retrospective
/pm:lessons-register $PROJECT_NAME --capture-from=gate-review --phase=3
/pm:lessons-register $PROJECT_NAME --search --domain=risk --priority=high
```
**Parameters:**
| Parameter | Required | Description |
|-----------|----------|-------------|
| `$PROJECT_NAME` | Yes | Target project identifier |
| `--capture-from` | No | `retrospective` / `gate-review` / `closure` / `manual` |
| `--phase` | No | Pipeline phase for context |
| `--search` | No | Search existing lessons register |
| `--domain` | No | Filter by domain (risk, planning, communication, etc.) |

## Service Type Routing
`{TIPO_PROYECTO}`: Agile captures lessons in retrospectives; Waterfall captures at phase gates; SAFe captures in Inspect & Adapt; All types consolidate in project closure.

## Before Capturing Lessons
1. Read `retrospective-engine` outputs — primary source for team-level lessons [PLAN]
2. Glob `*gate-review*` and `*quality-audit*` — secondary sources for process lessons [PLAN]
3. Read existing lessons register — avoid duplicating already-captured lessons [PLAN]
4. Confirm psychological safety — team must feel safe sharing negative lessons [STAKEHOLDER]

## Entrada (Input Requirements)
- Retrospective outputs
- Phase gate review findings
- Team feedback and observations
- Quality audit results
- Post-implementation review data

## Proceso (Protocol)
1. **Lesson identification** — Collect lessons from all project touchpoints
2. **Categorization** — Classify: What worked well, What didn't work, Suggestions for improvement
3. **Domain tagging** — Tag by area (planning, execution, communication, risk, quality, team)
4. **Root cause** — Document root cause for negative lessons
5. **Action recommendation** — Define what future projects should do or avoid
6. **Priority rating** — Rate lesson impact (High, Medium, Low)
7. **Applicability** — Define which project types/contexts benefit from each lesson
8. **Register entry** — Add to searchable lessons register with metadata
9. **Distribution** — Share relevant lessons with organizational knowledge base
10. **Integration** — Reference relevant lessons in future project planning

## Edge Cases
1. **Same lesson appearing in multiple consecutive projects** — Escalate as systemic organizational issue; lesson register alone cannot fix structural problems.
2. **Team resistant to sharing negative lessons** — Use anonymous collection first; facilitate with specific prompts rather than open-ended "what went wrong."
3. **No organizational mechanism for lesson distribution** — Create project-level register as minimum; propose PMO-level knowledge base as improvement initiative.
4. **Lessons too generic to be actionable** — Apply "5 Whys" to reach specific, actionable root cause; reject entries that cannot answer "what should the next project do differently?"

## Example: Good vs Bad

**Good Lessons Register Entry:**
| Attribute | Value |
|-----------|-------|
| Lesson | "Vendor API integration took 3x estimated time due to undocumented rate limits" [METRIC] |
| Root cause | Vendor documentation incomplete; no PoC before full integration commitment [PLAN] |
| Domain | Technical, Procurement |
| Recommendation | "Run 1-week integration PoC with production-like data volume before committing to vendor" [PLAN] |
| Applicability | All projects with third-party API integration |
| Priority | High |

**Bad Lessons Register Entry:**
"Communication could have been better." — No specific situation, no root cause, no actionable recommendation, no applicability context. Future projects cannot derive any value from this entry.

## Salida (Deliverables)
- Lessons learned register
- Categorized lessons summary
- Top 10 lessons for executive briefing
- Recommendations for process improvements
- Knowledge base update

## Validation Gate
- [ ] Every lesson based on specific project experience with context description
- [ ] Root causes identified for all negative lessons — no symptoms-only entries
- [ ] Both positive and negative lessons captured in balanced proportion
- [ ] Format consistent and searchable — standardized fields across all entries
- [ ] Recommendations specific enough that next project can implement without interpretation
- [ ] Each lesson includes applicability context (project type, domain, phase)
- [ ] Priority rating reflects actual impact, not emotional weight
- [ ] Lessons register consulted at project startup — verified by planning reference
- [ ] Distribution mechanism ensures lessons reach future project teams
- [ ] Capture cadence fits methodology — sprint retro for Agile, phase gate for Waterfall

## Escalation Triggers
- Same lesson appearing in multiple consecutive projects
- Lessons register not consulted at project startup
- Team resistant to sharing negative lessons
- No organizational mechanism for lesson distribution

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

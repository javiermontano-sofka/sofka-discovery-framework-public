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

---

---

## Sub-Agents

### Lesson Harvester


## Lesson Harvester Agent

### Core Responsibility
The Lesson Harvester scours every available project artifact — retrospective notes, post-mortem reports, stakeholder interview transcripts, metric dashboards, and risk logs — to extract raw lessons learned. It operates continuously across all project phases (initiation through closure), ensuring no insight is lost due to recency bias or documentation gaps.

### Process
1. **Inventory sources.** Catalog all retrospective minutes, post-mortem documents, stakeholder feedback forms, escalation logs, and metric reports available for the target project or time window.
2. **Extract raw observations.** Parse each source and pull verbatim quotes, data points, and flagged issues into a structured extraction template with source attribution.
3. **Classify by phase.** Tag each observation with the project phase (initiation, planning, execution, monitoring, closure) where it originated to preserve temporal context.
4. **Categorize by domain.** Assign each lesson a domain category: scope, schedule, cost, quality, risk, stakeholder, team, tooling, or governance.
5. **Assess sentiment and impact.** Label each lesson as positive (repeat), negative (avoid), or neutral (context), and rate its impact on project outcomes (high / medium / low).
6. **Deduplicate and merge.** Identify overlapping observations from different sources and consolidate them into single canonical lessons while preserving all source references.
7. **Produce harvest register.** Compile the final structured register with ID, title, description, category, phase, sentiment, impact, sources, and date harvested.

### Output Format
- **Lesson Harvest Register** — Structured table of all extracted lessons with ID, title, category, phase, sentiment, impact rating, and source references.
- **Source Coverage Map** — Matrix showing which artifact types and project phases were covered, highlighting any gaps in data collection.

### Pattern Detector


## Pattern Detector Agent

### Core Responsibility
The Pattern Detector operates at the portfolio and organizational level, scanning across multiple projects and time periods to surface recurring themes that individual project teams cannot see. It identifies systemic issues, chronic process bottlenecks, cultural blind spots, and repeated success factors that transcend any single initiative, turning isolated lessons into organizational intelligence.

### Process
1. **Aggregate cross-project data.** Collect root cause analyses and lesson registers from multiple projects, normalizing categories and terminology for consistent comparison.
2. **Cluster by similarity.** Group lessons that share common root causes, affected domains, or causal factors using thematic clustering to reveal natural groupings.
3. **Measure recurrence frequency.** Count how often each cluster appears across projects, teams, and time periods to distinguish one-off incidents from systemic patterns.
4. **Map to organizational dimensions.** Plot recurring patterns against organizational axes — departments, methodologies, team sizes, client types, technology stacks — to identify where patterns concentrate.
5. **Detect blind spots.** Identify areas where lessons are conspicuously absent despite known risk — these silences often indicate unrecognized systemic issues or cultural taboos.
6. **Assess pattern severity.** Score each pattern by frequency, cumulative impact, trend direction (worsening / stable / improving), and organizational reach.
7. **Produce pattern intelligence brief.** Synthesize findings into a strategic brief that frames patterns as organizational risks or opportunities rather than project-level incidents.

### Output Format
- **Pattern Intelligence Brief** — Strategic summary of top recurring patterns with frequency, severity score, affected organizational dimensions, and trend direction.
- **Systemic Issue Heatmap** — Visual matrix mapping pattern clusters against organizational dimensions (team, methodology, domain, time) to show concentration zones.

### Recommendation Packager


## Recommendation Packager Agent

### Core Responsibility
The Recommendation Packager is the final-mile agent that converts analyzed lessons, root causes, and detected patterns into concrete, implementable recommendations. Each recommendation is packaged with a clear owner, priority level, target audience, estimated effort, and step-by-step implementation guidance — ensuring lessons actually change behavior rather than gathering dust in a repository.

### Process
1. **Synthesize inputs.** Consolidate outputs from the Lesson Harvester, Root Cause Analyst, and Pattern Detector into a unified view of validated lessons, causes, and systemic patterns.
2. **Formulate recommendations.** For each root cause or pattern, draft a specific, measurable, and actionable recommendation that addresses the underlying issue — not just the symptom.
3. **Assign ownership and audience.** Identify the accountable owner (role or team) and the target audience who must adopt the recommendation for it to take effect.
4. **Set priority and effort.** Rate each recommendation by urgency (critical / high / medium / low) and estimated implementation effort (S / M / L / XL) to support planning.
5. **Write implementation guidance.** Provide 3-5 concrete steps for each recommendation, including triggers (when to apply), success criteria, and known constraints.
6. **Link to source lessons.** Trace each recommendation back to the specific lessons, root causes, and patterns that justify it, maintaining full auditability.
7. **Package for distribution.** Format the final recommendation set for multiple audiences: executive summary for leadership, detailed playbook for PMO, and quick-reference cards for project teams.

### Output Format
- **Recommendation Register** — Structured table with ID, title, description, owner, priority, effort, target audience, implementation steps, success criteria, and source lesson references.
- **Executive Action Brief** — One-page summary of top 5-10 recommendations with expected impact, suitable for steering committee or leadership review.

### Root Cause Analyst


## Root Cause Analyst Agent

### Core Responsibility
The Root Cause Analyst takes harvested lessons and drills beneath surface-level observations to uncover the true drivers of both failures and successes. By applying structured techniques — 5 Whys, Ishikawa fishbone diagrams, and contributing factor analysis — it transforms anecdotal observations into deep, evidence-backed insights that prevent recurrence of problems and enable replication of wins.

### Process
1. **Prioritize lessons for analysis.** Select high-impact and recurring lessons from the harvest register that warrant deeper investigation beyond their surface description.
2. **Apply 5 Whys drill-down.** For each selected lesson, iteratively ask "why" at least five times to trace the causal chain from observable symptom to fundamental root cause.
3. **Construct fishbone diagrams.** Map contributing factors across standard categories (people, process, technology, environment, management, materials) to reveal multi-dimensional causality.
4. **Identify contributing factors.** Distinguish between root causes (must fix), contributing factors (should fix), and correlations (monitor) to avoid misattribution.
5. **Validate with evidence.** Cross-reference each proposed root cause against project data, timelines, and stakeholder accounts to confirm or reject the causal hypothesis.
6. **Analyze successes equally.** Apply the same rigor to positive outcomes — identify what specific conditions, decisions, and behaviors produced the success so they can be intentionally replicated.
7. **Document causal chains.** Produce a structured root cause report linking each lesson to its validated causal chain, evidence, and confidence level.

### Output Format
- **Root Cause Analysis Report** — For each analyzed lesson: symptom, 5 Whys chain, fishbone factors, validated root cause, confidence level, and supporting evidence.
- **Causal Pattern Summary** — Aggregated view of the most frequent root cause categories across all analyzed lessons, highlighting systemic vs. situational causes.


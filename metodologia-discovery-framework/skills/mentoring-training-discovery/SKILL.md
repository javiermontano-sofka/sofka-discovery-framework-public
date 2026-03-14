---
name: mentoring-training-discovery
description: >
  Comprehensive mentoring and training capability discovery producing a 6-section assessment covering
  capability gaps, learning paths, knowledge transfer, delivery models, measurement frameworks,
  and training roadmaps. Use when the user asks to "assess training needs", "evaluate learning maturity",
  "design training program", "capability gap analysis", "knowledge transfer plan", "upskilling strategy",
  "reskilling assessment", "learning path design", or mentions "training discovery", "talent development".
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Mentoring & Training Discovery — Capability Development Assessment

Generates a 6-section assessment: Capability Assessment, Learning Path Design, Knowledge Transfer Planning, Training Delivery Model, Measurement Framework, and Training Roadmap. Uses SFIA framework or organizational competency models as the baseline for role-skill mapping, and integrates with organizational learning platform capabilities.

## Principio Rector

> *La unica ventaja competitiva sostenible es la velocidad a la que una organizacion aprende y transforma ese aprendizaje en capacidad operativa.*

1. **El conocimiento que no se transfiere, se pierde.** Cada experto que se va sin transferir su conocimiento destruye valor organizacional. El discovery de training no es sobre cursos — es sobre construir resiliencia de conocimiento.
2. **La capacitacion sin contexto es ruido.** Un curso generico rara vez cierra una brecha especifica. Los caminos de aprendizaje deben nacer del gap analysis, no del catalogo de cursos disponibles.
3. **Medir la satisfaccion no es medir el impacto.** "El curso estuvo bueno" no demuestra que la organizacion mejoro. El framework de medicion debe llegar hasta el impacto en resultados de negocio (Kirkpatrick niveles 3 y 4).

## Inputs

- `$1` — Path to organizational artifacts (skills matrix, role definitions, training records, performance data)
- `$2` — Analysis depth: `full` (default), `executive` (sections 1, 5, 6 only)

Parse from `$ARGUMENTS`.

**Parameters:**
- `{MODO}`: `piloto-auto` (default) | `desatendido` | `supervisado` | `paso-a-paso`
  - **piloto-auto**: Autonomo para inventario y gap analysis, HITL para priorizacion y estrategia de delivery.
  - **desatendido**: Cero interrupciones. Supuestos documentados.
  - **supervisado**: Autonomo con reportes al completar cada seccion.
  - **paso-a-paso**: Confirma antes de cada seccion.
- `{FORMATO}`: `markdown` (default) | `html` | `dual`
- `{VARIANTE}`: `ejecutiva` (~40%) | `tecnica` (full, default)

## When to Use

- Before launching a large-scale upskilling or reskilling initiative
- During technology transformation requiring workforce capability shifts (cloud migration, AI adoption, DevOps transition)
- When onboarding rates are slow and time-to-productivity is high
- When key-person dependencies create organizational risk
- Post-merger integration requiring capability harmonization
- Annual learning strategy planning cycle

## When NOT to Use

- For individual performance coaching (requires 1:1 interaction)
- When the problem is motivation or culture, not capability (different intervention)
- For compliance-only training needs (check-the-box training doesn't need discovery)
- When headcount, not capability, is the constraint

## Input Requirements

**Mandatory:**
- Current role definitions or job descriptions for roles in scope
- Skills inventory or self-assessment data (even partial)
- Organizational structure (teams, reporting lines, headcount)

**Recommended:**
- SFIA framework mapping or organizational competency model
- Training history (courses completed, certifications held, spend per role)
- Performance review data (anonymized, aggregated by role)
- Attrition data and exit interview themes
- Current learning platform capabilities and content catalog
- Industry benchmarks for target roles

## S1: Capability Assessment

Map current vs required capabilities using SFIA framework or organizational competency model:

**Role-skill matrix construction:**

| Role | Skill Category | Current Level | Target Level | Gap | Priority |
|---|---|---|---|---|---|
| — | Technical | 1-7 (SFIA) | 1-7 (SFIA) | delta | H/M/L |
| — | Behavioral | 1-5 | 1-5 | delta | H/M/L |
| — | Domain | 1-5 | 1-5 | delta | H/M/L |

**Gap analysis dimensions:**
- **Breadth gaps**: Skills the organization doesn't have at all (zero coverage)
- **Depth gaps**: Skills present but at insufficient proficiency level
- **Distribution gaps**: Skills concentrated in too few individuals (bus factor)
- **Future gaps**: Skills not needed today but required within 12-18 months

**Conditional logic:**
- IF >30% of critical roles have breadth gaps: flag CRITICAL — organization lacks foundational capabilities
- IF bus factor = 1 for any critical skill: escalate to knowledge transfer priority in S3
- IF >50% of gaps are future-oriented: focus on anticipatory learning paths, not remediation
- IF no skills inventory exists: conduct rapid self-assessment (validated by manager calibration)
- IF SFIA framework not adopted: map roles to closest SFIA profiles, document mapping assumptions

## S2: Learning Path Design

Design structured learning journeys per role-gap combination:

**Learning path architecture:**
- **Foundation tier**: Prerequisites, baseline knowledge (self-paced, asynchronous)
- **Core tier**: Essential skills for role competence (blended — instructor + practice)
- **Advanced tier**: Expertise and specialization (mentoring, project-based, certification)
- **Mastery tier**: Teaching others, contributing to organizational knowledge (communities of practice)

**Per learning path:**
- Target audience (role, current level, cohort size)
- Learning objectives mapped to capability gaps from S1
- Content sources: internal expertise, external platforms (Coursera, Pluralsight, Udemy Business, O'Reilly), vendor training, conferences
- Delivery format per module (see S4 for delivery model)
- Duration estimate (calendar weeks, effort hours)
- Prerequisites and sequencing constraints
- Certification or validation milestones

**Conditional logic:**
- IF gap is primarily technical: emphasize hands-on labs, coding katas, project-based learning
- IF gap is behavioral/leadership: emphasize coaching, mentoring, 360-feedback loops
- IF gap is domain knowledge: emphasize immersion, shadowing, case studies
- IF cohort size < 5: individual mentoring more efficient than group training
- IF cohort size > 30: standardized content + cohort-based facilitation

## S3: Knowledge Transfer Planning

Design systematic knowledge transfer to reduce key-person dependencies:

**Knowledge mapping:**
- Identify critical knowledge holders (from S1 bus factor analysis)
- Classify knowledge type: explicit (documentable) vs tacit (experience-based)
- Assess transfer urgency: attrition risk x knowledge criticality matrix

**Transfer methods by knowledge type:**

| Knowledge Type | Transfer Method | Timeline | Effort |
|---|---|---|---|
| Explicit, structured | Documentation + knowledge base | 2-4 weeks | Low |
| Explicit, procedural | Runbooks + video walkthroughs | 3-6 weeks | Medium |
| Tacit, technical | Pair programming + code reviews | 2-3 months | High |
| Tacit, relational | Shadowing + mentoring | 3-6 months | High |
| Tacit, decisional | Decision journals + case studies | 2-4 months | Medium |

**Knowledge transfer plan per critical holder:**
- Knowledge inventory (what they know that others don't)
- Transfer recipients (primary + backup)
- Transfer method and timeline
- Validation criteria (how we know the transfer succeeded)
- Contingency if holder leaves before transfer completes

**Conditional logic:**
- IF attrition risk is HIGH for knowledge holder: compress transfer timeline, prioritize tacit knowledge
- IF knowledge is in one person only: initiate immediate documentation sprint + shadowing
- IF knowledge spans multiple domains: assign dedicated transfer coordinator
- IF no documentation culture exists: start with decision journals (lowest friction entry point)

## S4: Training Delivery Model

Design the delivery infrastructure for learning programs:

**Delivery format assessment:**

| Format | Best For | Constraints | Scale |
|---|---|---|---|
| Instructor-led (ILT) | Complex topics, behavioral skills | Scheduling, facilitator availability | Low (10-25) |
| Virtual instructor-led (VILT) | Distributed teams, technical topics | Engagement risk, timezone coordination | Medium (15-40) |
| Self-paced (e-learning) | Foundational knowledge, compliance | Completion rates, motivation | High (unlimited) |
| Blended | Skill transformation programs | Design complexity, coordination | Medium (20-50) |
| On-the-job (OJT) | Tacit knowledge, tool mastery | Mentor availability, production risk | Low (1-5) |
| Communities of practice | Knowledge sharing, innovation | Facilitation, sustainability | Medium (10-30) |
| Hackathons / labs | Applied skills, team building | Preparation, time investment | Medium (15-50) |

**Organizational learning platform integration:**
- Current platform capabilities assessment (LMS, LXP, content authoring)
- Platform gaps vs learning path requirements
- Content hosting and tracking requirements
- Integration with HR systems (completion tracking, certification management)
- Recommendation: build vs buy vs partner for content and platform

**Facilitator capacity planning:**
- Internal subject matter experts available for training delivery
- Train-the-trainer needs
- External facilitator requirements and budget implications
- Mentoring pool size vs demand

**Conditional logic:**
- IF organization is fully remote: VILT + self-paced primary, ILT for critical workshops only
- IF learning platform is absent or basic: recommend LXP investment before scaling programs
- IF internal SME capacity is < 20% of need: blend external content with internal context sessions
- IF budget is constrained: prioritize OJT + communities of practice (lowest cost, highest tacit transfer)
- IF multiple locations/languages: assess localization needs and cultural adaptation

## S5: Measurement Framework

Design multi-level measurement using Kirkpatrick's model extended with ROI:

**Level 1 — Reaction:**
- Post-training satisfaction surveys (NPS, CSAT)
- Engagement metrics (completion rate, time-in-module, drop-off points)
- Baseline target: >4.0/5.0 satisfaction, >80% completion

**Level 2 — Learning:**
- Pre/post knowledge assessments (scored)
- Skills demonstration (practical exercises, certifications)
- Peer evaluation calibration
- Baseline target: >70% score improvement, >60% certification pass rate

**Level 3 — Behavior:**
- On-the-job application tracking (30/60/90 day post-training)
- Manager observation surveys
- Peer feedback on new behaviors
- Metric proxies: code review quality, defect rates, delivery velocity, customer satisfaction
- Baseline target: >50% demonstrating new behaviors at 90 days

**Level 4 — Results:**
- Business impact correlation (productivity, quality, cycle time, retention)
- Time-to-productivity for new hires
- Internal mobility rate (role transitions enabled by training)
- Key-person dependency reduction (bus factor improvement)
- Baseline target: measurable improvement in at least 2 business metrics within 6 months

**Level 5 — ROI (Phillips extension):**
- Training investment vs business impact value
- Cost per capability point gained
- Comparison with alternative interventions (hiring, outsourcing, tooling)

**Conditional logic:**
- IF organization has no measurement practice: start with Level 1+2 only, build maturity over 12 months
- IF leadership demands ROI proof: implement Level 4 tracking from day one with control groups
- IF data infrastructure is weak: use proxy metrics and qualitative assessment, flag measurement debt
- IF training is compliance-driven: Level 1+2 sufficient, focus on completion and certification rates

## S6: Training Roadmap

Synthesize S1-S5 into a phased implementation plan:

**Phase 0 — Foundation (Month 1-2):**
- Complete capability gap assessment (S1) if not finalized
- Establish measurement baseline (S5 Level 1+2 instrumentation)
- Identify and engage knowledge transfer priorities (S3 urgent items)
- Quick wins: address CRITICAL gaps with existing resources

**Phase 1 — Critical Gaps (Month 2-4):**
- Launch learning paths for highest-priority capability gaps
- Initiate knowledge transfer for bus-factor-1 risks
- Deploy or configure learning platform
- Establish communities of practice for top 3 skill domains

**Phase 2 — Systematic Build (Month 4-8):**
- Roll out complete learning path catalog
- Scale knowledge transfer program
- Train-the-trainer program for internal facilitators
- Implement Level 3 measurement (behavior change tracking)

**Phase 3 — Optimization (Month 8-12):**
- Analyze Level 3+4 measurement data
- Iterate learning paths based on completion and impact data
- Expand to future-gap skills (anticipatory training)
- Formalize mentoring program with matching and tracking

**Phase 4 — Continuous Learning Culture (Month 12-18):**
- Self-sustaining communities of practice
- Learning path self-service for career development
- Level 5 ROI reporting to leadership
- Integration with talent management and succession planning

**Per phase:**
- Initiatives with owners and timelines
- Effort estimate (person-months for design, delivery, administration)
- Dependencies and prerequisites
- Success metrics with targets
- Risk if deferred

## Workarounds When Inputs Missing

| Missing Input | Impact | Workaround |
|---|---|---|
| No skills inventory | Cannot quantify gaps | Rapid self-assessment survey + manager calibration session |
| No role definitions | Cannot set target levels | Map to SFIA framework profiles, validate with stakeholders |
| No training history | Cannot assess current investment | Interview HR/L&D for qualitative summary, flag data gap |
| No performance data | Cannot correlate training to outcomes | Use delivery metrics as proxies (velocity, quality, cycle time) |
| No attrition data | Cannot assess knowledge transfer urgency | Estimate from industry benchmarks + manager risk assessment |
| No learning platform | Cannot plan delivery infrastructure | Assess lightweight options (Google Classroom, Notion, open-source LMS) |

## Edge Cases

- **Startup (<50 people):** Formal training programs are overhead. Focus on mentoring pairs, documentation habits, and communities of practice. Keep infrastructure minimal.
- **Post-acquisition integration:** Two competency models must be harmonized. Map both to SFIA as neutral reference, identify complementary strengths.
- **Technology pivot (e.g., monolith to cloud-native):** Treat as mass reskilling event. 60%+ of team may need new learning paths simultaneously. Phase by cohort to maintain delivery capacity.
- **Distributed/remote teams across timezones:** VILT windows are narrow. Maximize asynchronous content with synchronous cohort touchpoints for accountability.
- **Highly regulated industry:** Compliance training is mandatory but insufficient. Layer capability training on top, using compliance as foundation tier.
- **Union or works-council environment:** Training programs may require consultation/negotiation. Factor governance lead time into roadmap.
- **Contractor-heavy workforce:** Knowledge transfer to contractors is investment in someone else's asset. Focus transfers on permanent staff; use contractors as trainers where expertise is needed.
- **No L&D function exists:** Someone must own this. Recommend minimum viable L&D: 0.5-1 FTE dedicated to learning coordination per 100 technical staff.

## Validation Gate

- [ ] Capability gaps quantified per role with current vs target proficiency levels
- [ ] Learning paths designed per gap cluster with content sources and delivery formats
- [ ] Knowledge transfer plan addresses all bus-factor-1 risks with timelines
- [ ] Delivery model accounts for organizational constraints (remote, budget, platform)
- [ ] Measurement framework covers at least Kirkpatrick Levels 1-3 with baseline targets
- [ ] Roadmap phased with effort estimates, dependencies, and success metrics
- [ ] Every roadmap initiative traces to evidence in S1-S5
- [ ] Organizational learning platform integration assessed with gap analysis
- [ ] Edge cases and assumptions explicitly documented
- [ ] Stakeholder roles identified for program governance (sponsor, L&D lead, facilitators)

## Output Artifact

**Primary:** `Mentoring_Training_Discovery_{project}.md` (o `.html` si `{FORMATO}=html|dual`) — 6-section capability development assessment with gap analysis, learning paths, and phased training roadmap.

**Secondary:** `Training_Executive_Summary_{project}.md` — S1 gap highlights + S6 roadmap summary for leadership audience.

**Diagramas incluidos:**
- Heatmap: capability gap matrix (roles x skills)
- Sankey diagram: knowledge flow from holders to recipients
- Timeline: phased training roadmap with milestones
- Radar chart: measurement framework coverage (Kirkpatrick levels)

---
**Comunidad MetodologIA** | **Licencia:** GPL-3.0 | **Ultima actualizacion:** 14 de marzo de 2026

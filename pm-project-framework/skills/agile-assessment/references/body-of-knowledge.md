# Body of Knowledge — Agile Maturity Assessment

> Frameworks, rubrics, and practitioner sources for measuring agile adoption maturity across teams and organizations.

---

## 1. Agile Maturity Models

### Agile Fluency Model (Diana Larsen & James Shore, 2012/2019)

- **Relevance:** Most nuanced maturity model. Defines 4 zones: Focusing (team-level value), Delivering (technical excellence), Optimizing (market impact), Strengthening (organizational agility). Each zone requires specific investments and yields different benefits.
- **Key insight:** Fluency is not a ladder — organizations choose their target zone based on investment willingness. Most teams benefit from Zone 2 (Delivering); Zone 4 requires entire org transformation.
- **Use in skill:** Map assessment dimensions to fluency zones. Score teams by zone achievement, not by ceremony compliance.
- **Source:** Larsen, D. & Shore, J. (2019). *The Agile Fluency Model*, agilefluency.org.

### Scrum.org Scrum Maturity Model

- **Relevance:** Scrum-specific model assessing 5 areas: Sprint Execution, Product Backlog Management, Team Dynamics, Technical Practices, Organizational Support. Each area scored 1-5 with behavioral anchors.
- **Use in skill:** When `{TIPO_PROYECTO}` is Agile with Scrum framework, use Scrum-specific rubrics for practices dimension.
- **Source:** Scrum.org (2023). *Evidence-Based Management Guide*.

### Sidky Agile Measurement Index (SAMI)

- **Relevance:** Academic model that measures agile adoption readiness and maturity simultaneously. Covers 5 levels (Collaborative, Evolutionary, Effective, Adaptive, Encompassing) across 4 agile principles.
- **Use in skill:** When rigorous academic framing is needed for executive-level assessments or consulting engagements.
- **Source:** Sidky, A., Arthur, J., Bohner, S. (2007). "A Disciplined Approach to Adopting Agile Practices", *Innovations in Systems and Software Engineering*.

---

## 2. Assessment Dimensions

### Six-Dimension Framework (PMO-APEX Standard)

| Dimension | What It Measures | Behavioral Indicators (Level 3) |
|-----------|-----------------|-------------------------------|
| Mindset & Culture | Empiricism, safety, experimentation | Teams run experiments; failures discussed openly; retrospectives produce action |
| Practices & Processes | Ceremony quality, artifact usage | Backlogs refined weekly; DoD enforced; WIP limits respected |
| Team Structure | Cross-functionality, autonomy, sizing | Teams own end-to-end delivery; 5-9 members; minimal handoffs |
| Tooling & Automation | CI/CD, test automation, metrics visibility | Automated builds; test coverage >70%; dashboards visible to all |
| Leadership Support | Servant leadership, impediment removal | Leaders attend reviews (not dailys); budget for training; shield teams from disruption |
| Delivery Outcomes | Predictability, quality, throughput | Velocity stable ±15%; defect escape rate <5%; cycle time improving |

### Maturity Rubric (1-5 Scale)

| Level | Label | Description |
|-------|-------|-------------|
| 1 | Ad Hoc | No consistent agile practices; waterfall with agile terminology |
| 2 | Emerging | Basic ceremonies in place; inconsistent execution; limited metrics |
| 3 | Practicing | Consistent ceremonies; measurable outcomes; team self-organization emerging |
| 4 | Optimizing | Data-driven improvement; cross-team coordination; technical excellence |
| 5 | Leading | Agile culture embedded; continuous experimentation; organizational agility |

---

## 3. Agile Anti-Patterns Catalog

| Anti-Pattern | Symptoms | Root Cause | Remediation |
|-------------|----------|------------|-------------|
| Zombie Scrum | All ceremonies, no adaptation | No product owner authority; absent stakeholders | Empower PO; require stakeholder sprint reviews |
| Cargo Cult Agile | Mimics form without understanding purpose | Top-down mandate without training | Invest in coaching; explain WHY before WHAT |
| Agile Theater | Reports agile but delivers waterfall | Management tracks Gantt; teams have no autonomy | Align management metrics to flow metrics |
| Sprint Stuffing | Sprints consistently overcommitted | No velocity tracking; external pressure | Enforce capacity-based planning; protect team |
| Dark Scrum | Scrum used to micromanage | Managers attend dailys as status meetings | Coach servant leadership; restructure dailys |
| Hardening Sprint | Dedicated "testing sprint" after development | No CI/CD; no DoD enforcement | Implement CI/CD; enforce DoD per sprint |
| Feature Factory | Shipping features without measuring outcomes | No product strategy; output over outcomes | Implement hypothesis-driven delivery |

---

## 4. Data Collection Methods

| Method | When to Use | Strengths | Limitations |
|--------|------------|-----------|-------------|
| Structured Interviews | Leadership assessment, cultural deep-dive | Rich qualitative data; context | Time-intensive; interviewer bias |
| Survey (Likert) | Baseline across many teams | Scalable; anonymous | Self-report bias; inflated scores |
| Artifact Review | Practices assessment | Objective evidence | May miss informal practices |
| Observation | Team dynamics, ceremony quality | Ground truth; behavioral data | Hawthorne effect; observer bias |
| Metric Analysis | Delivery outcomes | Quantitative; trend-capable | Metrics can be gamed |
| Retrospective Mining | Historical improvement patterns | Longitudinal view | Depends on retro documentation quality |

---

## 5. Industry Benchmarks

### State of Agile Report (Digital.ai, annual)

- 70% of organizations use Scrum or Scrum variants
- Top 3 agile benefits: managing changing priorities (64%), team morale (61%), delivery speed (57%)
- Top 3 challenges: inconsistent practices (46%), organizational culture (43%), inadequate management support (42%)
- Average agile adoption tenure: 3-5 years for most respondents

### DORA Metrics (Google Cloud DevOps Research)

| Metric | Elite | High | Medium | Low |
|--------|-------|------|--------|-----|
| Deployment Frequency | On-demand (multiple/day) | Weekly to monthly | Monthly to 6-monthly | >6 months |
| Lead Time for Changes | <1 hour | 1 day to 1 week | 1 week to 1 month | >1 month |
| Change Failure Rate | <5% | 5-10% | 10-15% | >15% |
| Mean Time to Recover | <1 hour | <1 day | 1 day to 1 week | >1 week |

Use DORA metrics to anchor the Tooling & Automation and Delivery Outcomes dimensions.

---

*PMO-APEX v1.0 — Body of Knowledge · Agile Maturity Assessment*

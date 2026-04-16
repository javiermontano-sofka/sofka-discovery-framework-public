# Body of Knowledge — Skills Gap Analysis & Training Plan

> Academic, industrial, and practitioner sources for competency assessment, skills inventory, gap analysis, and workforce capability planning in project management.

---

## 1. Foundational Frameworks

### PMBOK 7th Edition — Team Performance Domain

- **Relevance:** PMI emphasizes that project success depends on team capability. The Team performance domain covers leadership, team development, and the conditions for high-performing teams. Skills gap analysis is a prerequisite for team development planning.
- **Key concepts:** Servant leadership, team charter, distributed teams, emotional intelligence, conflict management. Resource management includes capability assessment and development.
- **Use in skill:** The 10-step protocol maps to PMI's approach: assess current state, identify gaps, plan development, track progress.
- **Source:** PMI (2021). *A Guide to the Project Management Body of Knowledge (PMBOK Guide) — 7th Edition*.

### SFIA Framework (Skills Framework for the Information Age)

- **Relevance:** Industry-standard framework defining 121 skills across 6 categories with 7 levels of responsibility. Used globally for IT and digital skills assessment, benchmarking, and workforce planning.
- **Key principles:** Skills described as observable behaviors at each level. Separation of skill (what you can do) from knowledge (what you know) from experience (what you've done).
- **Use in skill:** SFIA provides the canonical skill taxonomy for technology project teams. Proficiency levels 1-7 map to the 1-5 scale used in this skill with calibration.
- **Source:** SFIA Foundation (2025). *SFIA 9 — Skills Framework for the Information Age*.

### Competency-Based HRM (Spencer & Spencer)

- **Relevance:** Foundational model distinguishing between threshold competencies (minimum to perform) and differentiating competencies (what distinguishes high performers). The iceberg model shows that skills and knowledge are visible, but motives and traits are hidden.
- **Key concepts:** Behavioral Event Interviews (BEI), competency clusters, job competency models, assessment center methodology.
- **Use in skill:** The distinction between threshold and differentiating competencies informs gap severity rating: threshold gaps are Critical (blocks delivery), differentiating gaps are Medium (workaround exists).
- **Source:** Spencer, L.M. & Spencer, S.M. (1993). *Competence at Work: Models for Superior Performance*.

---

## 2. Skills Assessment Techniques

### Self-Assessment with Calibration

- **Description:** Team members rate their own proficiency per skill on a defined scale. Most efficient method but prone to Dunning-Kruger effect (low performers overrate, high performers underrate).
- **Best practice:** Always supplement with at least one verification method: peer review, practical demonstration, or certification evidence. Calibrate self-assessments by comparing against objective measures.
- **When to use:** Initial inventory baseline. Always combine with verification.

### Peer Assessment (360-Degree)

- **Description:** Colleagues who work directly with the individual rate their skill proficiency. Provides multiple perspectives and reduces individual bias.
- **Best practice:** Minimum 3 raters per individual. Anonymous to encourage honesty. Weight peer assessments by proximity of work collaboration.
- **When to use:** When self-assessment variance is high or team trust is sufficient for honest feedback.

### Practical Demonstration

- **Description:** Skills verified through hands-on exercises: coding challenges, case study analysis, live troubleshooting, design reviews. Most accurate but most resource-intensive.
- **Best practice:** Use for Critical gaps only. Design exercises that mirror actual project work, not abstract tests.
- **When to use:** When gap is Critical and self-assessment is uncertain. Before making hiring decisions.

### Certification Mapping

- **Description:** Map team certifications against project requirements. Certifications provide standardized evidence of knowledge (though not necessarily applied skill).
- **Best practice:** Certifications verify knowledge, not proficiency. A PMP certification confirms PM knowledge but not PM execution capability. Use as one data point, not sole evidence.
- **When to use:** Regulated industries where specific certifications are contractually required.

### Training Needs Analysis (TNA)

- **Description:** Systematic process to identify what training is needed, for whom, and with what priority. TNA bridges gap analysis and training plan by matching gaps to learning interventions.
- **Key models:** ADDIE (Analyze, Design, Develop, Implement, Evaluate), Kirkpatrick's 4 levels (Reaction, Learning, Behavior, Results).
- **When to use:** After gap identification, before training plan design.

---

## 3. Gap Classification Framework

### Severity Matrix

| Severity | Definition | Timeline Impact | Closure Strategy |
|----------|-----------|----------------|-----------------|
| **Critical** | Skill required for project-critical deliverable; no workaround | Blocks delivery if unresolved | Hire or outsource (cannot wait for training) |
| **High** | Skill needed for quality delivery; workaround exists but costly | Slows delivery, increases risk | Training with deadline aligned to project need |
| **Medium** | Skill improves efficiency; alternative approaches available | Minor quality or speed impact | Mentoring, pair programming, self-study |
| **Low** | Nice-to-have skill; minimal project impact | No measurable impact | Opportunistic learning, conference attendance |

### Closure Strategy Decision Tree

1. Can the gap be closed by training within the project timeline? → **Train**
2. Can an internal transfer fill the gap? → **Reassign**
3. Is the gap temporary (project-specific)? → **Augment** (staff augmentation)
4. Is the gap permanent and strategic? → **Hire**
5. Is the skill available in the market but scarce? → **Outsource** with KT plan

---

## 4. Training Plan Design Principles

### Just-in-Time Training

- Train skills when they will be immediately applied. Training 6 months before use yields ~20% retention; training 1 week before use yields ~80% retention.
- Align training calendar with project schedule: if database migration starts Sprint 5, database training completes Sprint 4.

### 70-20-10 Model

- 70% learning through experience (project assignments, stretch goals)
- 20% learning through others (mentoring, pair programming, code review)
- 10% learning through formal training (courses, certifications, workshops)
- Training plans that rely 100% on formal courses miss 90% of effective learning.

### Measurement (Kirkpatrick Model)

| Level | What | How | When |
|-------|------|-----|------|
| 1 — Reaction | Did they like the training? | Survey | Immediately |
| 2 — Learning | Did they learn the skill? | Assessment, demo | Post-training |
| 3 — Behavior | Are they applying the skill? | Observation, peer feedback | 4-8 weeks |
| 4 — Results | Did project performance improve? | Metrics (velocity, quality) | 1-3 months |

---

## 5. Key-Person Dependency Analysis

### Bus Factor Assessment

- **Definition:** The minimum number of people who must be "hit by a bus" before a critical skill is lost. Bus factor of 1 = single point of failure.
- **Risk formula:** Skills with bus factor = 1 AND severity = Critical → immediate cross-training required.
- **Mitigation strategies:** Pair programming, knowledge documentation, cross-training rotations, shadowing programs.

### Knowledge Concentration Map

| Skill | Proficiency ≥4 | Bus Factor | Action |
|-------|----------------|-----------|--------|
| Example: Kubernetes admin | 1 person | 1 | Cross-train 1 additional person before Sprint 4 |
| Example: Domain modeling | 3 people | 3 | Acceptable — monitor |

---

*PMO-APEX v1.0 — Body of Knowledge · Skills Gap Analysis & Training Plan*

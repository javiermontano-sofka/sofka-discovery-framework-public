# Use Case Prompts — Skills Gap Analysis & Training Plan

> Ready-to-use prompts for the most frequent skills assessment scenarios.
> Each prompt includes context for when to use it and variable parameters.

---

## 1. New Project Skills Assessment (Standard)

**When:** Project initiation, after team assignment and technology stack definition.

```
Conduct a skills gap analysis for {PROJECT_NAME}.

Context:
- Project type: {TIPO_PROYECTO} (Agile|Waterfall|SAFe|Kanban|Hybrid)
- Technology stack: {TECH_STACK}
- Team size: {TEAM_SIZE}
- Project duration: {DURATION}
- Key deliverables requiring specialized skills: {DELIVERABLES}
- Training budget: {BUDGET} (FTE-days, NOT currency)

Deliver:
1. Skills inventory matrix (person x skill x proficiency 1-5)
2. Gap analysis with severity ratings (Critical/High/Medium/Low)
3. Closure strategy per gap (train, hire, augment, mentor)
4. Training plan with timeline aligned to project schedule
5. Key-person dependency analysis (bus factor)

Parameters:
- {MODO}: piloto-auto
- {FORMATO}: markdown
```

---

## 2. Cloud Migration Skills Readiness

**When:** Organization migrating to cloud needs to assess team readiness.

```
Assess cloud skills readiness for {PROJECT_NAME} migration to {CLOUD_PLATFORM}.

Context:
- Current infrastructure: {CURRENT_INFRA} (on-premise, hybrid, legacy)
- Target platform: {CLOUD_PLATFORM} (AWS|Azure|GCP|multi-cloud)
- Team composition: {TEAM_COMPOSITION}
- Certification requirements: {CERTIFICATIONS}
- Migration timeline: {TIMELINE}

Deliver:
1. Cloud skills matrix (IaC, containers, networking, security, observability)
2. Certification gap analysis with exam readiness timeline
3. Training path per team member (courses, labs, certifications)
4. Recommended augmentation for skills unavailable through training
5. Risk assessment for skills-dependent milestones

Parameters:
- {TIPO_PROYECTO}: Cloud-Migration
- {MODO}: supervisado
```

---

## 3. Agile Transformation Skills Assessment

**When:** Organization transitioning to agile needs capability assessment.

```
Assess agile skills readiness for {ORG_NAME} transformation.

Context:
- Current methodology: {CURRENT} (waterfall, ad-hoc, partial agile)
- Target state: {TARGET} (Scrum, SAFe, Kanban, hybrid)
- Teams to transform: {TEAM_COUNT}
- Key roles to assess: {ROLES} (Scrum Masters, Product Owners, developers, QA)
- Timeline for first sprint: {FIRST_SPRINT}

Deliver:
1. Agile competency matrix (ceremonies, artifacts, principles, coaching)
2. Role-specific gap analysis (SM, PO, Dev, QA)
3. Coaching plan for agile leadership skills
4. Training roadmap by transformation phase
5. Recommended external coaching support needs

Parameters:
- {TIPO_PROYECTO}: Agile-Transformation
- {MODO}: supervisado
```

---

## 4. Post-Hiring Skills Verification

**When:** New team members onboarded; need to verify actual vs. claimed skills.

```
Verify skills for newly onboarded team members on {PROJECT_NAME}.

Context:
- New members: {NEW_MEMBERS} (count and roles)
- Claimed skills: {CLAIMED_SKILLS} (from resumes/interviews)
- Project-critical skills: {CRITICAL_SKILLS}
- Verification methods available: {METHODS} (pair programming, code review, case study)

Deliver:
1. Verification assessment per new member
2. Calibrated proficiency ratings (verified vs. claimed)
3. Onboarding training plan for identified gaps
4. Buddy/mentor assignments for skill development
5. 30-60-90 day proficiency targets

Parameters:
- {MODO}: supervisado
- {FORMATO}: markdown
```

---

## 5. Annual Skills Refresh

**When:** Quarterly or annual refresh of team skills inventory.

```
Refresh skills inventory for {PROJECT_NAME} / {TEAM_NAME}.

Context:
- Previous assessment date: {LAST_ASSESSMENT}
- Skills gained since last assessment: {NEW_SKILLS}
- Team changes: {CHANGES} (new members, departures, role changes)
- Upcoming project needs: {UPCOMING_NEEDS}

Deliver:
1. Updated skills inventory matrix
2. Delta analysis (improvements, regressions, new gaps)
3. Updated training plan for next quarter
4. Skills obsolescence risk assessment
5. Key-person dependency changes

Parameters:
- {MODO}: piloto-auto
- {FORMATO}: markdown
```

---

*PMO-APEX v1.0 — Use Case Prompts · Skills Gap Analysis & Training Plan*

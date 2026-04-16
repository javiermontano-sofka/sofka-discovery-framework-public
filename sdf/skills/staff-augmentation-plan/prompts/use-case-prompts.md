# Use Case Prompts — Staff Augmentation Planning

> Ready-to-use prompts for the most frequent augmentation scenarios.

---

## 1. Full Augmentation Plan (Standard)

**When:** Skills gap analysis reveals gaps requiring external talent.

```
Create a staff augmentation plan for {PROJECT_NAME}.

Context:
- Skills gaps: {GAPS} (from skills-gap-analysis output)
- Budget: {BUDGET} (FTE-months)
- Timeline: {TIMELINE}
- Preferred model: {MODEL} (onsite|remote|nearshore|offshore|hybrid)
- Existing vendor relationships: {VENDORS}

Deliver:
1. Role specifications with technical and soft skill requirements
2. Sourcing strategy with model justification
3. Integration and onboarding plan (Day-1 checklist)
4. Knowledge transfer schedule with milestones
5. Exit criteria and transition plan

Parameters:
- {MODO}: piloto-auto
- {FORMATO}: markdown
```

---

## 2. Emergency Augmentation (Recovery Project)

**When:** Troubled project needs immediate capacity injection.

```
Plan emergency staff augmentation for troubled project {PROJECT_NAME}.

Context:
- Crisis description: {CRISIS}
- Skills needed immediately: {SKILLS}
- Timeline: {TIMELINE} (days, not weeks)
- Current team capacity: {CAPACITY}

Deliver:
1. Emergency role specifications (minimum viable requirements)
2. Rapid onboarding plan (48-hour integration)
3. Crisis context briefing template
4. Performance checkpoints at Day 5, Day 15, Day 30
5. Exit criteria aligned to recovery milestones

Parameters:
- {TIPO_PROYECTO}: Recovery
- {MODO}: supervisado
```

---

## 3. Nearshore Team Integration

**When:** Augmenting with a nearshore team across timezones.

```
Design nearshore team integration for {PROJECT_NAME}.

Context:
- Internal team location: {LOCATION}
- Nearshore team location: {NEARSHORE_LOCATION}
- Timezone overlap: {OVERLAP} hours
- Team size: {INTERNAL} internal + {NEARSHORE} nearshore
- Communication tools: {TOOLS}

Deliver:
1. Communication protocol (async-first, sync ceremonies)
2. Working hours overlap optimization
3. Sprint ceremony schedule accommodating both timezones
4. Cultural integration practices
5. Escalation protocol for cross-timezone issues

Parameters:
- {MODO}: piloto-auto
- {FORMATO}: markdown
```

---

## 4. Augmentation Exit Planning

**When:** Augmented staff engagement ending; need transition plan.

```
Create augmentation exit plan for {PROJECT_NAME}.

Context:
- Augmented staff: {STAFF} (count, roles, duration served)
- Internal replacements: {REPLACEMENTS} (hired, in training, TBD)
- Knowledge areas at risk: {KNOWLEDGE_AREAS}
- Exit timeline: {TIMELINE}

Deliver:
1. Knowledge transfer checklist per augmented person
2. Documentation requirements before departure
3. Ramp-down sequence (who leaves first)
4. Velocity impact projection
5. Access revocation checklist

Parameters:
- {MODO}: supervisado
- {FORMATO}: markdown
```

---

*PMO-APEX v1.0 — Use Case Prompts · Staff Augmentation Planning*

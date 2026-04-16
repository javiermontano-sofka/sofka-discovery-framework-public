# Body of Knowledge — Staff Augmentation Planning

> Academic, industrial, and practitioner sources for staff augmentation strategy, external talent integration, knowledge transfer, and vendor staffing governance.

---

## 1. Foundational Frameworks

### PMBOK 7th Edition — Team Performance Domain

- **Relevance:** PMI addresses resource acquisition including internal and external resources. The Team performance domain covers virtual teams, distributed teams, and the integration of external resources into project delivery.
- **Key concepts:** Resource management plan, team charter, virtual team management, conflict resolution for blended teams.
- **Use in skill:** The governance model and integration plan derive from PMI's resource management principles.
- **Source:** PMI (2021). *PMBOK Guide — 7th Edition*.

### ISO 37500:2014 — Guidance on Outsourcing

- **Relevance:** International standard for outsourcing governance including staff augmentation as a sourcing model. Covers lifecycle from decision to exit: initiation, evaluation, contracting, transition, management, completion.
- **Key principles:** Strategic alignment of outsourcing decisions, risk management of external dependencies, performance management, knowledge transfer, and intellectual property protection.
- **Use in skill:** ISO 37500's lifecycle model maps directly to the 10-step protocol. Exit criteria and KT requirements derive from this standard.
- **Source:** ISO (2014). *ISO 37500:2014 — Guidance on Outsourcing*.

### Augmentation Models Taxonomy

- **Relevance:** Staff augmentation exists on a spectrum from individual contractor placement to managed team augmentation. Understanding the model taxonomy prevents mismatched expectations.

| Model | Description | Best For | Risk Level |
|-------|------------|----------|------------|
| **Individual Augmentation** | Single contractors filling specific roles | Specialized skills, short duration | Medium — single point of failure |
| **Team Augmentation** | Cohesive team provided by vendor | Scaling capacity, parallel workstreams | Low — team redundancy |
| **Managed Augmentation** | Vendor manages augmented team with own PM | Offloading management overhead | High — reduced control |
| **Hybrid Augmentation** | Mix of individual and team, internal PM | Complex projects, multiple skill needs | Medium — requires strong integration |

---

## 2. Integration Patterns

### Day-One Integration Checklist

| Category | Item | Owner | Timeline |
|----------|------|-------|----------|
| Access | Development environment, VPN, repositories | IT + PM | Day 0 |
| Communication | Slack/Teams channels, email, calendar | PM | Day 0 |
| Process | Sprint board access, definition of done, coding standards | Tech Lead | Day 1 |
| Domain | Business context briefing, architecture overview | BA + Architect | Day 1-2 |
| Social | Team introduction, buddy assignment, virtual coffee | PM | Day 1 |
| Governance | Reporting cadence, escalation path, feedback mechanism | PM | Day 1 |

### Integration Success Metrics

| Metric | Target | Measurement | Cadence |
|--------|--------|------------|---------|
| Time to first commit | ≤5 business days | Git history | One-time |
| Sprint velocity contribution | ≥70% of internal member by Sprint 2 | Sprint metrics | Per sprint |
| Code review pass rate | ≥80% first submission | PR metrics | Weekly |
| Communication responsiveness | ≤4 hours for async messages | Communication tools | Weekly |
| Knowledge documentation | ≥1 document per sprint | Wiki/confluence | Per sprint |

---

## 3. Knowledge Transfer Framework

### KT Anti-Patterns

| Anti-Pattern | Symptom | Consequence | Prevention |
|-------------|---------|-------------|------------|
| **Brain dump** | One massive KT session | Overwhelming, low retention | Spaced KT sessions over 2-4 weeks |
| **Tribal knowledge** | "Ask Carlos, he knows" | Person-dependent, not documented | Mandate written documentation per feature |
| **Shadow system** | Augmented staff create parallel docs | Inconsistent knowledge base | Single documentation platform enforced |
| **Knowledge hoarding** | Augmented staff don't share to protect job | Vendor lock-in by person | KT as explicit deliverable in contract |

### KT Success Criteria

- Internal team member can independently modify the code/system that augmented staff built
- Documentation exists for every major component built by augmented staff
- No single augmented person is the only one who understands a critical system
- Internal team velocity does not drop >15% when augmented staff depart

---

## 4. IP Protection Framework

### Classification Matrix

| Content Type | Risk Level | Protection Mechanism |
|-------------|-----------|---------------------|
| Source code | High | NDA + IP assignment + repository access controls |
| Architecture decisions | Medium | NDA + documentation in company-owned systems |
| Business logic | High | NDA + access restricted to need-to-know |
| Customer data | Critical | DPA + data classification + access audit trails |
| Tooling/scripts | Low | Company-owned repositories, no personal repos |

### Contractual Safeguards

1. **NDA:** Signed before any access granted. Survival period ≥2 years post-engagement.
2. **IP Assignment:** All work product created during engagement belongs to client.
3. **Non-Compete (where legal):** Augmented staff cannot work for direct competitor during and 6 months after engagement.
4. **Audit Rights:** Client retains right to audit vendor compliance with IP protection.
5. **Exit Obligations:** Complete KT, documentation handover, and access revocation upon exit.

---

## 5. Exit Planning

### Exit Trigger Conditions

| Trigger | Action | Timeline |
|---------|--------|----------|
| Gap closed by internal hire | Begin KT transition, 4-week overlap | Planned |
| Project completion | Full KT + documentation handover | 2-4 weeks before end |
| Performance issues | Vendor replacement or scope reduction | Immediate with vendor |
| Budget constraint | Prioritized ramp-down (least critical first) | 2-week notice |
| Strategic decision | Full team transition plan | 4-6 weeks |

### Ramp-Down Protocol

1. Identify augmented staff in order of replaceability (most replaceable first)
2. Accelerate KT for departing staff (increase pair programming to 50% of time)
3. Verify internal team can independently perform tasks
4. Revoke access on last day (no delayed access revocation)
5. Conduct exit retrospective within 1 week of departure

---

*PMO-APEX v1.0 — Body of Knowledge · Staff Augmentation Planning*

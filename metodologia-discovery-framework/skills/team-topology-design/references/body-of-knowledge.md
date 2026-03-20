# Body of Knowledge — Team Topology Design

> Academic, industrial, and practitioner sources for Team Topologies framework, Conway's Law application, and cognitive load-driven team design.

---

## 1. Foundational Frameworks

### Team Topologies (Skelton & Pais)

- **Relevance:** The definitive framework for modern team organization. Four fundamental team types and three interaction modes provide a vocabulary for team structure design that explicitly works with Conway's Law.
- **Four team types:** Stream-aligned (delivers business value), Platform (enables stream-aligned teams), Enabling (coaches other teams), Complicated-subsystem (deep specialist knowledge).
- **Three interaction modes:** Collaboration (high-bandwidth, temporary), X-as-a-Service (low-bandwidth, permanent), Facilitating (helping other teams grow).
- **Source:** Skelton, M. & Pais, M. (2019). *Team Topologies: Organizing Business and Technology Teams for Fast Flow*.

### Conway's Law and the Inverse Conway Maneuver

- **Relevance:** "Organizations produce designs which are copies of their communication structures." The Inverse Conway Maneuver intentionally designs team structure to produce the desired architecture.
- **Key insight:** If you want microservices, organize teams around service boundaries. If you want a modular monolith, organize teams around module boundaries. Architecture follows team structure, not the other way around.
- **Source:** Conway, M. (1968). *How Do Committees Invent?*; ThoughtWorks (2024). *Technology Radar — Team Topologies*.

### Cognitive Load Theory (Applied to Teams)

- **Relevance:** Teams have limited cognitive capacity. When a team must understand too many domains, technologies, or dependencies, their delivery speed and quality decrease. Cognitive load is the primary constraint for team boundary design.
- **Three types:** Intrinsic (inherent domain complexity), Extraneous (unnecessary complexity from poor tooling/process), Germane (learning investment). Minimize extraneous, manage intrinsic, invest in germane.
- **Source:** Sweller, J. (1988). *Cognitive Load Theory*; Skelton & Pais application to software teams.

---

## 2. Team Type Design Rules

### Stream-Aligned Teams

| Attribute | Guideline |
|-----------|-----------|
| Purpose | Deliver value in a single business domain or value stream |
| Size | 5-9 people (two-pizza team) |
| Composition | Cross-functional: front-end, back-end, QA, UX, ops as needed |
| Ownership | Owns the full lifecycle of their services/features |
| Dependencies | Minimal; consumes platform services via X-as-a-Service |
| Success metric | Lead time from idea to production |

### Platform Teams

| Attribute | Guideline |
|-----------|-----------|
| Purpose | Reduce cognitive load of stream-aligned teams by providing self-service capabilities |
| Size | 5-9 people; may have sub-teams for large platforms |
| Composition | Infrastructure, DevOps, SRE, developer experience specialists |
| Ownership | Owns the Internal Developer Platform (IDP) |
| Interaction | X-as-a-Service with stream-aligned teams; Collaboration during platform evolution |
| Success metric | Self-service adoption rate; time saved for stream-aligned teams |

### Enabling Teams

| Attribute | Guideline |
|-----------|-----------|
| Purpose | Help other teams adopt new capabilities (temporary engagement) |
| Size | 3-5 people; small, focused |
| Composition | Specialists in the capability being enabled (DevOps, security, observability) |
| Interaction | Facilitating mode; time-boxed engagements (weeks, not months) |
| Exit criteria | Receiving team is self-sufficient in the new capability |
| Anti-pattern | Becoming permanent dependency instead of building team capability |

### Complicated-Subsystem Teams

| Attribute | Guideline |
|-----------|-----------|
| Purpose | Own components requiring deep specialist knowledge (ML models, video codecs, cryptography) |
| Size | 3-7 people; specialist-heavy |
| Composition | Domain specialists with deep expertise |
| Interaction | X-as-a-Service with stream-aligned teams |
| Justification | Only when the cognitive load of the subsystem would overwhelm a stream-aligned team |

---

## 3. Interaction Mode Design

### Collaboration Mode

- **When:** Two teams need to discover together (new features, new integrations)
- **Duration:** Time-boxed (1-3 sprints); should not be permanent
- **Cost:** High bandwidth, high coordination overhead
- **Evolves to:** X-as-a-Service once the interface stabilizes

### X-as-a-Service Mode

- **When:** Interface between teams is stable and well-defined
- **Duration:** Permanent (until architectural change)
- **Cost:** Low bandwidth; API contract replaces coordination
- **Anti-pattern:** X-as-a-Service without self-service (requires tickets/requests)

### Facilitating Mode

- **When:** One team helps another adopt a new capability
- **Duration:** Time-boxed (2-8 weeks)
- **Cost:** Moderate; enabling team invests time in building other team's capability
- **Evolves to:** Receiving team is independent; enabling team moves on

---

## 4. Cognitive Load Assessment

### Assessment Dimensions

| Dimension | Low Load | Medium Load | High Load |
|-----------|----------|-------------|-----------|
| Business domains | 1 domain | 2 domains | 3+ domains |
| Services owned | 1-3 services | 4-6 services | 7+ services |
| Technologies | 1-2 tech stacks | 3-4 tech stacks | 5+ tech stacks |
| Cross-team dependencies | 0-1 | 2-3 | 4+ |
| On-call responsibilities | None or 1 service | 2-3 services | 4+ services |

**High load on 3+ dimensions = team is overloaded. Restructure boundaries.**

---

*PMO-APEX v1.0 — Body of Knowledge · Team Topology Design*

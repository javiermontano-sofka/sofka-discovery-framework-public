# Use Case Prompts — Spotify Model

> Ready-to-use prompts for Spotify-inspired organizational design scenarios.

---

## 1. Full Spotify Model Design (Greenfield)

**When:** Organization starting from scratch or restructuring engineering teams.

```
Design a Spotify-inspired organizational model for {ORG_NAME}.

Context:
- Total engineering/product people: {PEOPLE_COUNT}
- Product portfolio: {PRODUCTS}
- Current structure: {CURRENT} (functional silos, project-based, ad-hoc)
- Autonomy level desired: {AUTONOMY} (high, medium, pilot)
- Key coordination pain points: {PAIN_POINTS}

Deliver:
1. Squad design (missions, composition, boundaries) for all teams
2. Tribe grouping with tribe lead role descriptions
3. Chapter structure with chapter lead responsibilities
4. Guild recommendations (cross-cutting communities)
5. Transition roadmap from current structure (3-6 month phases)

Parameters:
- {MODO}: supervisado
- {FORMATO}: markdown
```

---

## 2. Squad Health Check Implementation

**When:** Squads are formed and need a health monitoring framework.

```
Implement a squad health check framework for {ORG_NAME}.

Context:
- Number of squads: {SQUAD_COUNT}
- Current health indicators: {CURRENT_INDICATORS} (if any)
- Cadence desired: {CADENCE} (monthly, quarterly)
- Aggregation level: {LEVEL} (squad, tribe, organization)

Deliver:
1. Health check dimensions (8-12 indicators) with traffic-light definitions
2. Facilitation guide for health check sessions
3. Aggregation dashboard (tribe-level and org-level views)
4. Action planning template for amber/red dimensions
5. Trend tracking mechanism over time

Parameters:
- {MODO}: piloto-auto
- {FORMATO}: markdown
```

---

## 3. Chapter & Guild Design Only

**When:** Squads and tribes exist; need to add functional and cross-cutting structures.

```
Design chapters and guilds for existing squad/tribe structure at {ORG_NAME}.

Context:
- Functional disciplines: {DISCIPLINES} (engineering, design, QA, data, security)
- Current knowledge sharing: {CURRENT_KS} (ad-hoc, none, formal)
- Cross-cutting concerns: {CONCERNS} (DevOps, accessibility, security, performance)
- Chapter lead candidates: {CANDIDATES} (senior ICs, managers, TBD)

Deliver:
1. Chapter definitions with scope and cadence
2. Chapter lead role description and selection criteria
3. Guild proposals with scope, membership model, and success criteria
4. Knowledge sharing calendar (chapters + guilds combined)
5. Governance model: what chapters decide vs. what guilds advise

Parameters:
- {MODO}: piloto-auto
- {FORMATO}: markdown
```

---

## 4. Spotify-to-Team-Topologies Migration

**When:** Organization wants to evolve existing Spotify model toward Team Topologies.

```
Assess and migrate Spotify model at {ORG_NAME} toward Team Topologies.

Context:
- Current squads: {SQUADS} (count and missions)
- Current tribes: {TRIBES} (count and scope)
- Pain points with current model: {PAIN_POINTS}
- Platform needs: {PLATFORM_NEEDS}

Deliver:
1. Current state assessment (anti-patterns, health check results)
2. Team type reclassification (stream-aligned, platform, enabling, complicated-subsystem)
3. Interaction mode design per team pair
4. Cognitive load assessment per team
5. Migration roadmap with minimal disruption

Parameters:
- {TIPO_PROYECTO}: Agile-Transformation
- {MODO}: supervisado
```

---

*PMO-APEX v1.0 — Use Case Prompts · Spotify Model*

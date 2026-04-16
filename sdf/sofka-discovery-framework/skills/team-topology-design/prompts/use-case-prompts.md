# Use Case Prompts — Team Topology Design

> Ready-to-use prompts for team structure design scenarios.

---

## 1. Full Team Topology Design

**When:** Designing team structure for new organization or restructuring existing one.

```
Design team topology for {ORG_NAME}.

Context:
- Total team members: {PEOPLE_COUNT}
- Product/service count: {PRODUCTS}
- Current architecture: {ARCHITECTURE} (monolith, microservices, hybrid)
- Current pain points: {PAIN_POINTS}
- Platform needs: {PLATFORM_NEEDS}

Deliver:
1. Team classification (stream-aligned, platform, enabling, complicated-subsystem)
2. Interaction mode matrix per team pair
3. Cognitive load assessment per team
4. Team topology map (Mermaid)
5. Transition roadmap from current to target structure

Parameters:
- {MODO}: supervisado
- {FORMATO}: markdown
```

---

## 2. Cognitive Load Assessment Only

**When:** Existing teams showing performance decline; need to check overload.

```
Assess cognitive load for teams at {ORG_NAME}.

Context:
- Teams: {TEAM_LIST} (names, sizes, responsibilities)
- Services per team: {SERVICES}
- Technologies per team: {TECH_STACKS}
- Cross-team dependencies: {DEPENDENCIES}

Deliver:
1. Cognitive load score per team (Low/Medium/High per dimension)
2. Overloaded teams identified with root cause
3. Boundary adjustment recommendations
4. Dependency reduction opportunities
5. Expected improvement from recommended changes

Parameters:
- {MODO}: piloto-auto
- {FORMATO}: markdown
```

---

## 3. Platform Team Design

**When:** Organization needs to establish an Internal Developer Platform.

```
Design platform team structure for {ORG_NAME}.

Context:
- Stream-aligned teams served: {TEAM_COUNT}
- Current platform capabilities: {CURRENT_PLATFORM}
- Developer pain points: {PAIN_POINTS}
- Platform investment budget: {BUDGET} (FTE-months)

Deliver:
1. Platform team composition and scope
2. Platform services catalog (prioritized)
3. Self-service vs. ticket-based service classification
4. Platform team success metrics
5. Roadmap for platform capability rollout

Parameters:
- {MODO}: supervisado
- {FORMATO}: markdown
```

---

*PMO-APEX v1.0 — Use Case Prompts · Team Topology Design*

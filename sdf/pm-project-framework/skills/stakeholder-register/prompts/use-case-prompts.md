# Use Case Prompts — Stakeholder Register & Analysis

> Ready-to-use prompts for stakeholder analysis scenarios.

---

## 1. New Project Stakeholder Analysis (Standard)

**When:** Project initiation, charter approved, team forming.

```
Create a stakeholder register and analysis for {PROJECT_NAME}.

Context:
- Project type: {TIPO_PROYECTO}
- Industry: {INDUSTRY}
- Sponsor: {SPONSOR}
- Organizational scope: {SCOPE} (single department, cross-functional, enterprise)
- Known stakeholders: {KNOWN_STAKEHOLDERS}

Deliver:
1. Stakeholder register with ≥15 stakeholders identified
2. Power/Interest matrix (Mermaid quadrant chart)
3. Engagement gap analysis (current vs desired)
4. Management strategy per quadrant
5. Communication preferences per stakeholder

Parameters:
- {MODO}: piloto-auto
- {FORMATO}: markdown
```

---

## 2. Transformation Stakeholder Mapping

**When:** Large-scale change affecting multiple departments.

```
Map stakeholders for organizational transformation {TRANSFORMATION_NAME}.

Context:
- Transformation scope: {SCOPE}
- Departments affected: {DEPARTMENTS}
- Executive sponsor: {SPONSOR}
- Known resistance: {RESISTANCE}
- Change champions identified: {CHAMPIONS}

Deliver:
1. Multi-level stakeholder map (executive, management, operational, external)
2. Resistance mapping with intervention strategies
3. Change champion network design
4. Coalition analysis (support vs opposition clusters)
5. Communication cascade plan (top-down and bottom-up)

Parameters:
- {TIPO_PROYECTO}: Transformation
- {MODO}: supervisado
```

---

## 3. Stakeholder Register Refresh

**When:** Quarterly refresh or after significant project event.

```
Refresh stakeholder register for {PROJECT_NAME}.

Context:
- Previous register: {REGISTER_PATH}
- Changes since last refresh: {CHANGES}
- New stakeholders identified: {NEW_STAKEHOLDERS}
- Engagement level changes observed: {ENGAGEMENT_CHANGES}

Deliver:
1. Updated register with change tracking
2. Engagement trend analysis (improving/stable/declining per stakeholder)
3. New strategy adjustments for changed positions
4. Risk assessment for declining engagement
5. Escalation recommendations for critical changes

Parameters:
- {MODO}: piloto-auto
- {FORMATO}: markdown
```

---

## 4. SAFe Multi-Level Stakeholder Analysis

**When:** SAFe implementation with team, ART, solution, and portfolio stakeholders.

```
Create multi-level stakeholder analysis for SAFe implementation at {ORG_NAME}.

Context:
- ARTs: {ART_COUNT}
- Portfolio level sponsors: {SPONSORS}
- Business Owners: {BOS}
- Solution context: {SOLUTION}

Deliver:
1. Stakeholder register per SAFe level (team, ART, solution, portfolio)
2. Business Owner engagement assessment
3. PI Planning stakeholder participation plan
4. Cross-ART stakeholder dependencies
5. Governance stakeholder alignment matrix

Parameters:
- {TIPO_PROYECTO}: SAFe
- {MODO}: supervisado
```

---

*PMO-APEX v1.0 — Use Case Prompts · Stakeholder Register & Analysis*

# Methodology Playbook — Use Case Prompts

> PMO-APEX Skill Prompts | 4 Contextualized Use Cases | Last updated: 2026-03-17

---

## Use Case 1: Scrum Playbook for New Team

```
/pm:methodology-playbook $PROJECT_NAME --methodology=scrum --include=all

Crear playbook Scrum para equipo nuevo de {N} personas. Sprint: {N} semanas.
PO: {NOMBRE}. SM: {NOMBRE}. Distribución: {COLOCADO/REMOTO/HIBRIDO}.

Requiero:
1. Catálogo de 5 ceremonias con agenda detallada por ceremonia [SCHEDULE]
2. DoD por tipo (story, feature, sprint) con criterios medibles [PLAN]
3. Cadence calendar visual importable a Google Calendar [SCHEDULE]
4. Role-ceremony matrix con nombres asignados [STAKEHOLDER]
5. Reglas de adaptación basadas en retro feedback [PLAN]
```

## Use Case 2: Hybrid Playbook (Agile + Governance)

```
/pm:methodology-playbook $PROJECT_NAME --methodology=hybrid --include=all

Playbook híbrido: Scrum para delivery + phase gates para governance.
Equipo: {N} personas. Sprints de {N} semanas. Gates trimestrales.
Regulatory: {DESCRIPCION}.

Requiero:
1. Ceremonias Scrum + ceremonias de governance integradas [SCHEDULE]
2. DoD que incluya criterios regulatorios [PLAN]
3. Calendario unificado sin conflictos entre cadencias [SCHEDULE]
4. Mapping de artefactos Scrum a documentos de governance [PLAN]
```

## Use Case 3: Kanban Playbook for Operations

```
/pm:methodology-playbook $PROJECT_NAME --methodology=kanban --include=all

Playbook Kanban para equipo de operaciones. Equipo: {N} personas.
Trabajo: continuo sin sprints. Service classes: {N}.

Requiero:
1. Cadencias Kanban (7 cadences de Anderson) con frecuencia y agenda [SCHEDULE]
2. WIP policies por columna [PLAN]
3. Flow review cadence con métricas a revisar [METRIC]
4. Escalation protocols para blockers y SLE violations [PLAN]
```

## Use Case 4: SAFe ART Playbook

```
/pm:methodology-playbook $PROJECT_NAME --methodology=safe --team-count=6

Playbook SAFe para ART de {N} equipos. PI cadence: {N} semanas.
RTE: {NOMBRE}. Product Management: {NOMBRE}.

Requiero:
1. PI-level ceremonies (PI Planning, System Demo, I&A) [SCHEDULE]
2. Team-level ceremonies dentro del PI cadence [SCHEDULE]
3. Cross-team sync cadences [SCHEDULE]
4. Multi-level DoD (story, feature, capability, PI) [PLAN]
5. Innovation and Planning sprint design [PLAN]
```

---

*PMO-APEX v1.0 — Use Case Prompts: Methodology Playbook*

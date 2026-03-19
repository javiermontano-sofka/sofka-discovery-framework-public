# Playbook Metodológico — Acme Corp ERP Modernization

> **Proyecto**: Acme Corp ERP | **Fecha**: 2026-03-17 | **Estado**: {WIP}
> **Metodología**: Hybrid (Scrum + Waterfall Governance) | **Equipo**: 12 personas

---

## TL;DR
Playbook operativo para metodología híbrida: sprints de 2 semanas con Scrum para delivery y phase gates trimestrales para governance regulatorio (SOX). 7 ceremonias definidas con agendas, 3 niveles de DoD, y cadence calendar que consume 18% de capacidad del equipo. [PLAN]

---

## Catálogo de Ceremonias

| Ceremonia | Frecuencia | Duración | Facilitador | Participantes |
|-----------|:---:|:---:|---|---|
| Sprint Planning | Bi-semanal | 2h | Scrum Master | Equipo completo + PO [SCHEDULE] |
| Daily Standup | Diaria | 15 min | Scrum Master | Equipo de desarrollo [SCHEDULE] |
| Sprint Review | Bi-semanal | 1h | PO | Equipo + stakeholders [SCHEDULE] |
| Sprint Retrospective | Bi-semanal | 1h | Scrum Master | Equipo completo [SCHEDULE] |
| Backlog Refinement | Semanal | 1h | PO + SM | Equipo de desarrollo [SCHEDULE] |
| Phase Gate Review | Trimestral | 3h | PM | Steering Committee [SCHEDULE] |
| Steering Committee | Mensual | 1h | PM | Sponsor + governance [SCHEDULE] |

**Meeting Load**: 8.5h/semana = 18% de capacidad (target: max 20%) [METRIC]

---

## Definition of Done

### Nivel Story
- [ ] Código implementado y revisado (PR aprobado) [PLAN]
- [ ] Tests unitarios escritos y pasando (cobertura >80%) [METRIC]
- [ ] Documentación técnica actualizada [PLAN]
- [ ] Criterios de aceptación verificados por PO [PLAN]

### Nivel Sprint
- [ ] Todas las stories comprometidas Done [PLAN]
- [ ] Incremento integrado y desplegable [PLAN]
- [ ] No hay defectos críticos abiertos [METRIC]
- [ ] Demo preparada para Sprint Review [PLAN]

### Nivel Release (Phase Gate)
- [ ] UAT completado con sign-off [STAKEHOLDER]
- [ ] Checklist SOX compliance verificado [DOC]
- [ ] Performance tests pasando SLAs [METRIC]
- [ ] Documentación regulatoria completa [DOC]
- [ ] Rollback plan documentado y probado [PLAN]

---

*PMO-APEX v1.0 — Sample Output: Methodology Playbook*
*Sofka, your technology partner.*

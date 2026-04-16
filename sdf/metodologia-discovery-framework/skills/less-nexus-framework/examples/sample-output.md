# Diseño de Escalamiento Multi-Equipo — Acme Corp

> **Proyecto**: Acme Corp Platform Consolidation | **Fecha**: 2026-03-17 | **Estado**: {WIP}
> **Framework**: LeSS (Large-Scale Scrum) | **Equipos**: 4 Scrum Teams

---

## TL;DR
Diseño de escalamiento LeSS para 4 equipos Scrum trabajando en la plataforma unificada de Acme Corp. Product Backlog único con un Product Owner, coordinación cross-equipo mediante Overall Sprint Planning y Overall Retrospective. Dependencias arquitectónicas gestionadas mediante Communities of Practice. [PLAN]

---

## Selección de Framework

| Criterio | LeSS | Nexus | Decisión |
|----------|:---:|:---:|---|
| Número de equipos | 2-8 | 3-9 | Ambos viables [PLAN] |
| Overhead de coordinación | Mínimo | Nexus Integration Team adicional | LeSS preferido [PLAN] |
| Product Owner model | 1 PO, sin intermediarios | 1 PO + NIT | LeSS más simple [PLAN] |
| Madurez Scrum del equipo | Requiere alta | Moderada suficiente | Equipos maduros: LeSS viable [METRIC] |
| **Recomendación** | **LeSS** | — | Menor overhead para 4 equipos maduros [DECISION] |

---

## Estructura del Product Backlog Unificado

| Área del Producto | Equipo Primario | Equipo Secundario | Items Estimados |
|-------------------|:---:|:---:|:---:|
| Payments Engine | Alpha | Beta | 45 PBIs [METRIC] |
| User Portal | Beta | Gamma | 62 PBIs [METRIC] |
| API Gateway | Gamma | Alpha | 38 PBIs [METRIC] |
| Data Analytics | Delta | — | 28 PBIs [METRIC] |

> **Nota**: Equipos secundarios pueden tomar PBIs del área cuando su primario tiene capacidad limitada. Esto promueve feature teams sobre component teams. [PLAN]

---

## Calendario de Eventos Cross-Equipo

| Evento | Frecuencia | Duración | Participantes |
|--------|:---:|:---:|---|
| Overall Sprint Planning Part 1 | Cada sprint (2 sem) | 60 min | PO + 2 rep/equipo [SCHEDULE] |
| Sprint Planning Part 2 | Cada sprint | 90 min | Por equipo, independiente [SCHEDULE] |
| Overall Retrospective | Cada sprint | 90 min | 2 rep/equipo + SM + PO [SCHEDULE] |
| Cross-team Refinement | Semanal | 60 min | Equipos con dependencias [SCHEDULE] |
| Sprint Review (unificado) | Cada sprint | 120 min | Todos + stakeholders [SCHEDULE] |

---

## Matriz de Dependencias

| Dependencia | Equipos | Severidad | Estrategia de Resolución |
|-------------|:---:|:---:|---|
| API contracts | Alpha-Gamma | Alta | Contract-first development; API spec before implementation [PLAN] |
| Shared data model | Beta-Delta | Media | Community of Practice: Data Architecture [PLAN] |
| Auth module | Alpha-Beta | Media | Shared library; pair programming cross-equipo [PLAN] |

---

## Métricas de Escalamiento

| Métrica | Baseline | Target (3 meses) | Medición |
|---------|:---:|:---:|---|
| Integration defects/sprint | N/A (nuevo) | < 3 | Jira defect tracking [METRIC] |
| Cross-team dependency resolution | N/A | < 48h | Dependency board aging [METRIC] |
| Combined velocity | 120 SP/sprint | Estable +/-10% | Sprint velocity chart [METRIC] |
| Sprint goal achievement | N/A | > 80% | Sprint review [METRIC] |

---

*PMO-APEX v1.0 — Sample Output: LeSS/Nexus Framework*
*Sofka, your technology partner.*

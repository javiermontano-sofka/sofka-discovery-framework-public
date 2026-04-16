# PoC Results Report — Jira vs. Azure DevOps — Acme Corp

> **Proyecto**: Acme Corp — PM Tool Selection
> **Tipo PoC**: Tool Evaluation
> **Fecha**: 2026-03-17
> **Status**: {WIP}

---

## TL;DR

PoC de 3 semanas evaluando Jira vs. Azure DevOps para equipos Scrum de Acme Corp. Jira scored 4.1/5.0 vs. Azure DevOps 3.6/5.0. Recomendación: GO para Jira con 3 scale-up risks documentados. El diferenciador principal fue usabilidad para el equipo y ecosistema de plugins [METRIC].

## Hipótesis

"Jira soporta mejor los workflows Scrum de nuestros equipos que Azure DevOps, medido por usabilidad, configurabilidad, reporting, y integración con herramientas existentes" [PLAN].

## Evaluation Matrix

| Criterio | Peso | Jira | Azure DevOps | Evidencia |
|----------|------|------|-------------|-----------|
| Usabilidad (equipo) | 30% | 4.5/5.0 | 3.2/5.0 | Survey de 6 usuarios piloto [METRIC] |
| Configurabilidad Scrum | 25% | 4.0/5.0 | 4.2/5.0 | Workflows creados y evaluados [METRIC] |
| Reporting y Dashboards | 20% | 3.8/5.0 | 3.5/5.0 | 3 dashboards creados por tool [METRIC] |
| Integración (Slack, Git) | 15% | 4.5/5.0 | 3.8/5.0 | Integrations testadas [METRIC] |
| Costo (TCO 3 años) | 10% | 3.5/5.0 | 3.8/5.0 | Cotización enterprise comparada [METRIC] |
| **Score Ponderado** | **100%** | **4.1/5.0** | **3.6/5.0** | [METRIC] |

## Variable Control

- Mismo equipo (6 personas) evaluó ambas herramientas [PLAN]
- Mismo periodo (1.5 semanas por herramienta) [SCHEDULE]
- Mismos datos de prueba (backlog de 45 user stories) [PLAN]
- Mismos criterios comunicados antes de la evaluación [PLAN]

## Scale-Up Risks

| # | Riesgo | Probabilidad | Impacto | Mitigación |
|---|--------|-------------|---------|------------|
| 1 | Migración de datos desde tools existentes | Alta | Medio | Contratar migration specialist [PLAN] |
| 2 | Resistencia de equipos que prefieren Azure DevOps | Media | Medio | Training y champions program [STAKEHOLDER] |
| 3 | Costo de plugins enterprise mayor al estimado | Media | Bajo | Negociar bundle antes de commit [SUPUESTO] |

## Recomendación

GO para Jira — Score superior en 4 de 5 criterios. Scale-up risks mitigables. Inversión estimada de scale-up: 8 FTE-semanas (migration + training + configuration) [DECISION].

---

*Generado por PMO-APEX PoC Lab · Acme Corp · {WIP}*

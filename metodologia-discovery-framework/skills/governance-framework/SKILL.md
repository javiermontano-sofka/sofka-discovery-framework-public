---
name: metodologia-governance-framework
description: >
  IT governance design with COBIT and ITIL alignment, decision rights definition, policy framework
  creation, and audit readiness assessment. Use when the user asks to "design governance framework",
  "define decision rights", "create policy framework", or mentions COBIT, ITIL, RACI matrix,
  or audit readiness.
author: Javier Montaño · Comunidad MetodologIA
version: 1.0.0
tags:
  - governance
  - cobit
  - itil
  - policy
  - audit
  - compliance
  - moat
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
  - WebFetch
---

# Framework de Gobernanza TI

Diseno de framework de gobernanza de TI con alineacion a COBIT/ITIL,
definicion de derechos de decision, catalogo de politicas y evaluacion de audit readiness.

## TL;DR

- Evalua madurez de gobernanza actual contra frameworks de referencia (COBIT, ITIL)
- Define estructura de decision rights con RACI matrix por dominio
- Disena catalogo de politicas de TI con ciclo de vida y enforcement
- Evalua readiness para auditorias internas y externas
- Genera charter de gobernanza con modelo operativo completo

## Inputs

Parse `$1` como **nombre de la organizacion**, `$2` como **scope de gobernanza**.

**Parameters:**
- `{MODO}`: `piloto-auto` (default) | `desatendido` | `supervisado` | `paso-a-paso`
- `{FORMATO}`: `markdown` (default) | `html` | `dual`
- `{VARIANTE}`: `ejecutiva` (~40%) | `tecnica` (full, default)

## Entregables

1. **Charter de Gobernanza** — Principios, estructura, roles, cadencia de reuniones
2. **RACI Matrix** — Derechos de decision por dominio y nivel organizacional
3. **Catalogo de Politicas** — Inventario de politicas requeridas con prioridad y estado
4. **Assessment de Audit Readiness** — Gaps contra requisitos de auditoria comunes
5. **Modelo Operativo** — Procesos de gobernanza, escalation paths, metricas

## Proceso

1. **Assessment de Madurez** — Evaluar gobernanza actual contra dominios COBIT:
   | Dominio | Descripcion | Nivel Actual | Nivel Target |
   |---|---|---|---|
   | APO (Align, Plan, Organize) | Estrategia y planificacion de TI | 1-5 | 1-5 |
   | BAI (Build, Acquire, Implement) | Gestion de cambios y proyectos | 1-5 | 1-5 |
   | DSS (Deliver, Service, Support) | Operaciones y soporte | 1-5 | 1-5 |
   | MEA (Monitor, Evaluate, Assess) | Monitoreo y compliance | 1-5 | 1-5 |
2. **Definicion de Decision Rights** — Mapear decisiones clave a roles con RACI:
   - Arquitectura: quien aprueba cambios arquitectonicos
   - Seguridad: quien define y enforza politicas
   - Data: quien gobierna calidad, acceso, retencion
   - Inversiones: quien aprueba gasto en tecnologia
3. **Diseno de Catalogo de Politicas** — Identificar politicas requeridas por dominio, priorizar, definir templates
4. **Evaluacion de Audit Readiness** — Verificar evidencia, controles, trazabilidad contra estandares (ISO 27001, SOC 2, etc.)
5. **Modelo Operativo** — Definir cadencia de gobernanza, comites, escalation, KPIs
6. **Roadmap de Implementacion** — Plan de implementacion progresiva por trimestre

## Criterios de Calidad

- [ ] Assessment de madurez con scoring por dominio COBIT
- [ ] RACI matrix completa para decisiones clave de TI
- [ ] Catalogo de politicas con priorizacion y templates
- [ ] Gaps de audit readiness documentados con remediacion
- [ ] Modelo operativo con cadencia, roles y metricas definidas
- [ ] Roadmap de implementacion realista con quick wins
- [ ] Diagrama Mermaid de estructura de gobernanza

## Output Artifact

**Primary:** `Governance_Framework_{org}.md` — Charter, RACI, catalogo de politicas, modelo operativo.

### Diagramas (Mermaid)
- Org chart: estructura de comites de gobernanza
- Flowchart: proceso de escalation y decision
- Gantt: roadmap de implementacion

---
**Autor:** Javier Montaño · Comunidad MetodologIA | **Version:** 1.0.0

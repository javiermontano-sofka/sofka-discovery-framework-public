---
name: metodologia-documentation-architecture
description: >
  Doc-as-code strategy design, documentation taxonomy, content governance, and knowledge base
  architecture. Use when the user asks to "design documentation strategy", "build knowledge base",
  "create doc-as-code pipeline", or mentions documentation governance, content taxonomy, or
  technical writing standards.
author: Javier Montaño · Comunidad MetodologIA
version: 1.0.0
tags:
  - documentation
  - doc-as-code
  - knowledge-management
  - governance
  - content-strategy
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

# Arquitectura de Documentacion

Diseno de estrategia doc-as-code, taxonomia de contenido, modelo de gobernanza
y arquitectura de base de conocimiento para organizaciones de tecnologia.

## TL;DR

- Evalua estado actual de documentacion y detecta gaps criticos
- Disena taxonomia de documentacion alineada con Diataxis framework (tutorials, how-to, reference, explanation)
- Define pipeline doc-as-code integrado con CI/CD existente
- Establece modelo de gobernanza con roles, review cycles y metricas de salud
- Produce mapa de documentacion completo con ownership y prioridades

## Inputs

Parse `$1` como **nombre del proyecto/organizacion**, `$2` como **scope de documentacion**.

**Parameters:**
- `{MODO}`: `piloto-auto` (default) | `desatendido` | `supervisado` | `paso-a-paso`
- `{FORMATO}`: `markdown` (default) | `html` | `dual`
- `{VARIANTE}`: `ejecutiva` (~40%) | `tecnica` (full, default)

## Entregables

1. **Mapa de Documentacion** — Inventario de docs existentes, gaps, prioridades
2. **Guia de Estilo** — Estandares de escritura, templates, convenciones
3. **Modelo de Gobernanza** — Roles, review cycles, metricas de salud, escalation
4. **Taxonomia de Contenido** — Clasificacion Diataxis adaptada al contexto
5. **Pipeline Doc-as-Code** — Arquitectura tecnica de generacion, validacion y publicacion

## Proceso

1. **Auditoria de Estado Actual** — Inventariar documentacion existente, evaluar cobertura, frescura y accesibilidad
2. **Analisis de Gaps** — Identificar documentacion faltante critica por audiencia:
   | Audiencia | Necesita | Formato Preferido |
   |---|---|---|
   | Developers | API refs, architecture decisions, runbooks | Markdown en repo |
   | Ops/SRE | Runbooks, troubleshooting, infra docs | Wiki + automation |
   | Product | Specs, user stories, release notes | Confluence/Notion |
   | Nuevos miembros | Onboarding guides, architecture overview | Structured tutorials |
3. **Diseno de Taxonomia** — Aplicar Diataxis framework:
   - Tutorials (learning-oriented): guias paso a paso para aprender
   - How-to guides (task-oriented): recetas para resolver problemas
   - Reference (information-oriented): descripcion tecnica precisa
   - Explanation (understanding-oriented): discusion y contexto
4. **Definicion de Guia de Estilo** — Templates, convenciones de naming, estructura de archivos, tone of voice
5. **Pipeline Doc-as-Code** — Linting (markdownlint, vale), build (MkDocs, Docusaurus), deploy, link checking
6. **Modelo de Gobernanza** — Ownership por area, review cadence, freshness metrics, retirement policy

## Criterios de Calidad

- [ ] Inventario completo de documentacion existente con scoring de frescura
- [ ] Gaps criticos identificados y priorizados por impacto
- [ ] Taxonomia Diataxis aplicada con ejemplos por categoria
- [ ] Guia de estilo con templates reutilizables
- [ ] Pipeline doc-as-code disenado con herramientas especificas
- [ ] Modelo de gobernanza con roles, cadencia y metricas
- [ ] Diagrama Mermaid de flujo de documentacion

## Output Artifact

**Primary:** `Documentation_Architecture_{project}.md` — Mapa, taxonomia, gobernanza, pipeline.

### Diagramas (Mermaid)
- Flowchart: pipeline doc-as-code
- Mind map: taxonomia de documentacion
- GANTT: plan de implementacion

---
**Autor:** Javier Montaño · Comunidad MetodologIA | **Version:** 1.0.0

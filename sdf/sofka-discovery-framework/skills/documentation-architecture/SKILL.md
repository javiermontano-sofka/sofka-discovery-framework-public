---
name: metodologia-documentation-architecture
description: >
  Doc-as-code strategy design, documentation taxonomy, content governance, and knowledge base
  architecture. Use when the user asks to "design documentation strategy", "build knowledge base",
  "create doc-as-code pipeline", or mentions documentation governance, content taxonomy, or
  technical writing standards.
author: Javier Montaño · Comunidad MetodologIA
argument-hint: "<proyecto-u-organizacion> [scope-de-documentacion]"
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

## Supuestos y Limites

- Asume acceso al repositorio y herramientas de documentacion existentes para auditoria
- No produce la documentacion en si — disena la arquitectura, taxonomia y gobernanza para que el equipo la ejecute
- Recomendaciones de tooling (MkDocs, Docusaurus, Vale) son sugerencias; la seleccion final depende del stack del equipo
- Freshness scoring es estimado si no existe metadata de ultima actualizacion en los documentos

## Casos Borde

| Escenario | Estrategia de Manejo |
|---|---|
| Organizacion sin documentacion formal (solo conocimiento tribal) | Priorizar onboarding guide y architecture overview como quick wins; usar entrevistas como fuente primaria [INFERENCIA] |
| Documentacion dispersa en +5 plataformas (Confluence, Notion, Google Docs, README, Wiki) | Mapear todas las fuentes en inventario unificado; recomendar consolidacion progresiva con redirects |
| Equipo que resiste escribir documentacion | Proponer docs-as-code integrado en PR workflow (templates obligatorios); minimizar friction con snippets y automation |
| Documentacion regulada (compliance, auditoria) | Separar docs regulados de docs tecnicos; aplicar versionamiento estricto y approval workflow |

## Decisiones y Trade-offs

| Decision | Habilita | Restringe | Justificacion |
|---|---|---|---|
| Diataxis como framework de taxonomia | Estructura clara por tipo de contenido y audiencia | Requiere training para que el equipo clasifique correctamente | Es el framework mas adoptado para docs tecnicas; separa preocupaciones de forma natural |
| Doc-as-code como approach default | Docs viven junto al codigo, revisados en PR | Requiere tooling de build y deploy | Reduce drift entre codigo y documentacion; aprovecha workflows existentes |
| Gobernanza con ownership explicito | Cada doc tiene responsable de freshness | Overhead de asignacion y tracking | Sin ownership, la documentacion decae en meses |

## Knowledge Graph

```mermaid
graph TD
    subgraph Core["Documentation Architecture"]
        A[Auditoria de Estado] --> B[Taxonomia Diataxis]
        B --> C[Guia de Estilo]
        A --> D[Gap Analysis]
        C --> E[Pipeline Doc-as-Code]
        D --> F[Modelo de Gobernanza]
    end
    subgraph Inputs["Inputs"]
        G[Docs Existentes] --> A
        H[Audiencias Target] --> B
        I[Stack Tecnico] --> E
    end
    subgraph Outputs["Outputs"]
        A --> J[Mapa de Documentacion]
        C --> K[Templates y Guia de Estilo]
        F --> L[Governance Model]
    end
    subgraph Related["Related Skills"]
        M[developer-experience] -.-> D
        N[governance-framework] -.-> F
        O[maturity-assessment] -.-> A
    end
```

## Output Templates

**Formato 1 — Markdown (default)**
- Filename: `Documentation_Architecture_{project}_{WIP|Aprobado}.md`
- Estructura: Inventario > Gap Analysis > Taxonomia Diataxis > Guia de Estilo > Pipeline Design > Modelo de Gobernanza > Roadmap
- Incluye diagramas Mermaid de pipeline y taxonomia

**Formato 2 — XLSX (inventario y tracking)**
- Filename: `Doc_Inventory_{project}_{WIP|Aprobado}.xlsx`
- Estructura: Sheet 1 (Inventario con scoring de freshness) > Sheet 2 (Gap Matrix por audiencia) > Sheet 3 (Ownership y review schedule)
- Optimizado para tracking operativo y reporting de gobernanza

**Formato 3 — HTML (bajo demanda)**
- Filename: `Documentation_Architecture_{project}_{WIP|Aprobado}.html`
- Estructura: HTML self-contained branded (Design System MetodologIA v5). Light-First Technical. Incluye diagrama de pipeline doc-as-code (Mermaid CDN), taxonomía Diataxis visual y mapa de ownership con indicadores de freshness. WCAG AA, responsive, print-ready.

**Formato 4 — DOCX (circulación formal)**
- Filename: `{fase}_{entregable}_{cliente}_{WIP}.docx`
- Generado via python-docx con Metodología Design System v5. Portada con metadata del engagement, TOC automático, encabezados/pies de página con marca. Tablas con zebra striping, tipografía Poppins en headings (navy), Montserrat en cuerpo, acentos dorados. Para circulación formal y auditoría.

**Formato 5 — PPTX (presentación ejecutiva)**
- Filename: `{fase}_{entregable}_{cliente}_{WIP}.pptx`
- Generado via python-pptx con MetodologIA Design System v5. Slide master con gradiente navy, títulos Poppins, cuerpo Montserrat, acentos dorados. Máx 20 slides ejecutivo / 30 técnico. Notas del orador con referencias de evidencia. Secciones: Estado Actual de Documentación, Gap Analysis por Audiencia, Taxonomía Diataxis, Pipeline Doc-as-Code, Modelo de Gobernanza y Roadmap.

## Evaluacion

| Dimension | Peso | Criterio |
|-----------|------|----------|
| Trigger Accuracy | 10% | Activa triggers correctos ante keywords de documentacion, doc-as-code, knowledge base |
| Completeness | 25% | Cubre inventario, gaps, taxonomia, guia de estilo, pipeline y gobernanza |
| Clarity | 20% | Templates son reutilizables directamente; pipeline tiene pasos especificos de tooling |
| Robustness | 20% | Maneja organizaciones sin docs, docs dispersas, resistencia a documentar |
| Efficiency | 10% | Proceso no duplica esfuerzo entre auditoria y gap analysis |
| Value Density | 15% | Gobernanza es accionable con roles, cadencia y metricas concretas |

**Umbral minimo**: 7/10 en cada dimension para considerar el skill production-ready.

## Cross-References

- **metodologia-developer-experience:** Documentacion como dimension clave de DX y onboarding
- **metodologia-governance-framework:** Gobernanza de docs alineada con governance general de TI
- **metodologia-maturity-assessment:** Documentacion como capacidad evaluable en assessment de madurez

---
**Autor:** Javier Montaño · Comunidad MetodologIA | **Version:** 1.0.0

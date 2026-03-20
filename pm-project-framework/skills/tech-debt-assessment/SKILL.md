---
name: metodologia-tech-debt-assessment
description: >
  Technical debt quantification, debt quadrant classification (reckless/prudent x deliberate/inadvertent),
  remediation prioritization, and paydown roadmap generation. Use when the user asks to "assess technical debt",
  "quantify debt", "classify tech debt", "prioritize remediation", or mentions debt inventory, impact scoring,
  or paydown planning.
author: Javier Montaño · Comunidad MetodologIA
argument-hint: "<proyecto> [repositorio-o-sistema]"
version: 1.0.0
tags:
  - tech-debt
  - code-quality
  - remediation
  - architecture
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

# Evaluacion de Deuda Tecnica

Cuantificacion, clasificacion y priorizacion de deuda tecnica en sistemas de software,
con generacion de roadmap de remediacion basado en impacto de negocio.

## TL;DR

- Inventaria y clasifica deuda tecnica usando el cuadrante de Martin Fowler (reckless/prudent x deliberate/inadvertent)
- Cuantifica impacto en velocidad de desarrollo, riesgo operacional y costo de oportunidad
- Prioriza remediation usando scoring de impacto vs esfuerzo
- Genera roadmap de paydown alineado con ciclos de delivery
- Produce inventario completo con evidencia trazable por cada item de deuda

## Inputs

Parse `$1` como **nombre del proyecto**, `$2` como **repositorio o sistema a evaluar**.

**Parameters:**
- `{MODO}`: `piloto-auto` (default) | `desatendido` | `supervisado` | `paso-a-paso`
- `{FORMATO}`: `markdown` (default) | `html` | `dual`
- `{VARIANTE}`: `ejecutiva` (~40%) | `tecnica` (full, default)
- `{PROFUNDIDAD}`: `ejecutivo` | `tecnico` (default) | `exhaustivo`

## Entregables

1. **Inventario de Deuda Tecnica** — Catalogo completo con clasificacion por cuadrante
2. **Scoring de Impacto** — Matriz de impacto en velocidad, riesgo y costo
3. **Roadmap de Paydown** — Plan de remediacion priorizado por sprints/trimestres
4. **Mapa de Dependencias de Deuda** — Diagrama Mermaid de relaciones entre items de deuda
5. **Reporte Ejecutivo** — Resumen para stakeholders no tecnicos

## Proceso

1. **Inventario y Extraccion** — Escanear codebase, configuraciones, pipelines e infraestructura para identificar deuda tecnica existente
2. **Clasificacion por Cuadrante** — Categorizar cada item en el cuadrante Fowler:
   - Deliberada/Prudente: "Sabemos que esto es un shortcut, lo pagaremos despues"
   - Deliberada/Reckless: "No tenemos tiempo para disenar bien"
   - Inadvertida/Prudente: "Ahora sabemos como debimos haberlo hecho"
   - Inadvertida/Reckless: "Que es arquitectura en capas?"
3. **Cuantificacion de Impacto** — Evaluar cada item contra:
   - Impacto en velocidad de desarrollo (drag coefficient)
   - Riesgo operacional (probabilidad x severidad de incidente)
   - Costo de oportunidad (features no construidas por friction)
4. **Priorizacion** — Aplicar scoring de impacto vs esfuerzo, identificar quick wins y deuda critica
5. **Roadmap de Paydown** — Disenar plan de remediacion con:
   - Quick wins (alto impacto, bajo esfuerzo) para primeros sprints
   - Remediacion estrategica para trimestres siguientes
   - Guardrails para prevenir acumulacion de nueva deuda
6. **Validacion** — Verificar completitud del inventario y viabilidad del roadmap

## Criterios de Calidad

- [ ] Todo item de deuda tiene evidencia trazable [CODIGO], [CONFIG], [DOC], [INFERENCIA]
- [ ] Clasificacion por cuadrante justificada para cada item
- [ ] Scoring de impacto con criterios explicitos y reproducibles
- [ ] Roadmap alineado con capacidad real del equipo
- [ ] Quick wins identificados con ROI estimado
- [ ] Metricas de exito definidas para medir progreso de paydown
- [ ] Guardrails de prevencion documentados

## Supuestos y Limites

- Inventario depende de acceso al codebase, configuraciones y documentacion del sistema
- Cuantificacion de impacto en velocidad es estimada salvo que existan metricas de developer productivity
- Clasificacion por cuadrante Fowler es interpretativa — requiere contexto historico del equipo
- No reemplaza code review o static analysis — los complementa con perspectiva estrategica

## Casos Borde

| Escenario | Estrategia de Manejo |
|---|---|
| Sistema legacy sin documentacion ni conocimiento tribal disponible | Usar analisis estatico como fuente primaria; marcar inferencias como [INFERENCIA]; priorizar deuda que bloquea evolucion |
| Deuda tecnica deliberada reciente (decision consciente hace <3 meses) | Documentar pero no priorizar remediacion inmediata; verificar que existe ticket de paydown asociado |
| Equipo que normalizo la deuda ("siempre ha sido asi") | Cuantificar impacto en metricas concretas (deploy frequency, lead time, incident rate) para hacer visible el costo |
| Codebase con +100 items de deuda identificados | Aplicar Pareto agresivo: scoring de impacto para identificar el 20% que genera 80% del drag |

## Decisiones y Trade-offs

| Decision | Habilita | Restringe | Cuando Usar |
|---|---|---|---|
| Inventario exhaustivo | Visibilidad completa | 3-5 dias de esfuerzo | Sistemas legacy criticos |
| Scan automatizado | Velocidad de assessment | Pierde deuda arquitectonica y de proceso | Evaluacion rapida o triaje inicial |
| Focus en quick wins | Impacto inmediato, genera momentum | Ignora deuda estructural profunda | Equipos con poca capacidad o buy-in inicial |
| Paydown incremental | No detiene delivery existente | Remediacion mas lenta | Equipos en produccion activa con SLAs estrictos |

## Knowledge Graph

```mermaid
graph TD
    subgraph Core["Tech Debt Assessment"]
        A[Inventario y Extraccion] --> B[Clasificacion Fowler]
        B --> C[Cuantificacion de Impacto]
        C --> D[Priorizacion]
        D --> E[Roadmap de Paydown]
    end
    subgraph Inputs["Inputs"]
        F[Codebase y Config] --> A
        G[Pipeline Metrics] --> C
        H[Capacidad del Equipo] --> E
    end
    subgraph Outputs["Outputs"]
        A --> I[Inventario de Deuda]
        C --> J[Scoring de Impacto]
        E --> K[Paydown Roadmap]
        D --> L[Quick Wins Catalog]
    end
    subgraph Related["Related Skills"]
        M[dependency-analysis] -.-> A
        N[maturity-assessment] -.-> C
        O[software-architecture] -.-> B
    end
```

## Output Templates

**Formato 1 — Markdown (default)**
- Filename: `Tech_Debt_Assessment_{project}_{WIP|Aprobado}.md`
- Estructura: Inventario > Clasificacion por Cuadrante > Scoring de Impacto > Quick Wins > Roadmap de Paydown > Guardrails de Prevencion
- Incluye diagramas Mermaid de cuadrante Fowler y roadmap

**Formato 2 — XLSX (inventario y tracking)**
- Filename: `Tech_Debt_Inventory_{project}_{WIP|Aprobado}.xlsx`
- Estructura: Sheet 1 (Inventario con cuadrante, impacto, esfuerzo, evidencia) > Sheet 2 (Roadmap de paydown por sprint) > Sheet 3 (Metricas de progreso)
- Optimizado para tracking operativo de remediacion y reporting a stakeholders

**Formato 3 — HTML (bajo demanda)**
- Filename: `Tech_Debt_Assessment_{project}_{WIP|Aprobado}.html`
- Estructura: HTML self-contained branded (Design System MetodologIA v5). Light-First Technical. Incluye cuadrante Fowler interactivo, heatmap de impacto vs esfuerzo, y roadmap de paydown por sprint con indicadores de quick wins. WCAG AA, responsive.

**Formato 4 — DOCX (bajo demanda)**
- Filename: `{fase}_{entregable}_{cliente}_{WIP}.docx`
- Generado con python-docx, Design System MetodologIA v5. Portada con logo y metadata del proyecto, TOC automático, encabezados/pies de página con marca. Tablas con zebra striping. Tipografía: Poppins para encabezados (navy), Montserrat para cuerpo, acentos gold.

**Formato 5 — PPTX (bajo demanda)**
- Filename: `{fase}_tech_debt_assessment_{cliente}_{WIP}.pptx`
- Generado con python-pptx y MetodologIA Design System v5. Slide master con gradiente navy, títulos Poppins, cuerpo Montserrat, acentos dorados. Máximo 20 slides (ejecutiva). Speaker notes con referencias de evidencia. Slides: Portada, Resumen ejecutivo, Cuadrante Fowler (clasificación visual), Scoring de Impacto (heatmap impacto vs esfuerzo), Quick Wins catalog, Roadmap de Paydown por trimestre, Guardrails de prevención, próximos pasos.

## Evaluacion

| Dimension | Peso | Criterio |
|-----------|------|----------|
| Trigger Accuracy | 10% | Activa triggers correctos ante keywords de deuda tecnica, remediacion, code quality |
| Completeness | 25% | Cubre inventario, clasificacion, scoring, roadmap y guardrails de prevencion |
| Clarity | 20% | Cada item de deuda tiene evidencia trazable y clasificacion justificada |
| Robustness | 20% | Maneja legacy sin docs, deuda normalizada, inventarios masivos |
| Efficiency | 10% | Proceso combina scan automatizado con revision manual sin redundancia |
| Value Density | 15% | Quick wins tienen ROI estimado; roadmap alineado con capacidad real del equipo |

**Umbral minimo**: 7/10 en cada dimension para considerar el skill production-ready.

## Cross-References

- **metodologia-dependency-analysis:** Dependencias desactualizadas como categoria de deuda tecnica
- **metodologia-maturity-assessment:** Deuda tecnica como indicador de madurez en desarrollo
- **metodologia-software-architecture:** Deuda arquitectonica como subcategoria critica del inventario

---
**Autor:** Javier Montaño · Comunidad MetodologIA | **Version:** 1.0.0

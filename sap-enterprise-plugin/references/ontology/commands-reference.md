# Commands Reference — SAP Enterprise Plugin v4.0

> **Total comandos**: 29

## Comandos principales

| Comando | Descripción |
|---------|-------------|
| `/sap:adopcion` | Planificación de adopción SAP — roadmap completo de transformación, change management, governance |
| `/sap:ajuste-estandar` | Análisis Fit-to-Standard (Ajuste al Estándar) — workshop completo con scoring y clasificación |
| `/sap:assess` | Assessment de landscape SAP — maturity scoring, Clean Core readiness, module coverage audit |
| `/sap:auditar` | Auditar plan SAP existente — gap analysis del plan, riesgos, inconsistencias, recomendaciones |
| `/sap:clean-core` | Clean Core Blueprint — estrategia de extensibilidad, A-D levels, portfolio de extensiones |
| `/sap:comite` | Comité de expertos simplificado (5/7/9 agentes impar) con pipeline ToT de 4 fases |
| `/sap:consulta` | Consulta simple SAP — 1-3 agentes, respuesta directa sin ToT completo |
| `/sap:diagrama-funcional` | Diagrama funcional SAP — proceso de negocio, flujo de información, stakeholders, Mermaid |
| `/sap:diagrama-tecnico` | Diagrama técnico SAP — arquitectura sistema, CDS, RAP, integraciones, Mermaid + C4 |
| `/sap:discovery` | Pipeline completo de SAP discovery — landscape assessment, fit-to-standard, gap analysis, solution design, roadmap |
| `/sap:fit-to-standard` | Workshop Fit-to-Standard SAP — presentar best practice, comparar AS-IS, puntuar gaps, clasificar remediación |
| `/sap:gap-analysis` | Análisis y clasificación de gaps SAP — taxonomía 7 clases, dependency mapping, blocking gaps, ADRs |
| `/sap:generate-abap` | Genera código ABAP Cloud (CDS, RAP, OData) siguiendo Clean Core Level A. SIEMPRE finaliza con QA. |
| `/sap:investigar` | Deep research SAP — comité + búsqueda web + NotebookLM research si disponible |
| `/sap:mapa-integracion` | Mapa de Integración SAP — landscape completo CPI + APIs + Event Mesh + Communication Arrangements |
| `/sap:menu` | Paleta interactiva de comandos SAP Enterprise Plugin v3.0 |
| `/sap:migration-plan` | Plan de migración de datos SAP — Strangler Fig, Migration Cockpit, data quality, wave planning, cutover |
| `/sap:module-config` | Configuración detallada por módulo SAP (CO, SD, PS, FI, MM, HCM) con template determinístico |
| `/sap:notebook-audio` | Generar audio overview (podcast deep-dive) del notebook NotebookLM |
| `/sap:notebook-create` | Crear notebook NotebookLM para proyecto SAP — base para deep research y knowledge base |
| `/sap:notebook-query` | Consultar knowledge base NotebookLM — pregunta a las fuentes importadas del notebook |
| `/sap:notebook-research` | Deep research automatizado: lanza research_start en NotebookLM, espera completación, e importa sources |
| `/sap:plan-evolucion` | Plan de evolución SAP — roadmap innovación + adopción de features nuevos S/4HANA |
| `/sap:plan-implementacion` | Plan de implementación SAP — proyecto nuevo (greenfield/brownfield) end-to-end |
| `/sap:plan-mantenimiento` | Plan de mantenimiento SAP (AMS) — soporte post go-live, SLAs, mejora continua |
| `/sap:plan-personalizacion` | Plan de personalización SAP — extensiones Clean Core, custom fields, ABAP Cloud, BTP side-by-side |
| `/sap:render-html` | Render markdown deliverable to Sofka DS v5 brand HTML |
| `/sap:sap` | Alias → /sap:discovery. Pipeline completo SAP discovery. |
| `/sap:solution-design` | Arquitectura SAP target-state Clean Core — landscape, extension strategy, integration topology, NFRs |

## Flags comunes

- `--auto` / `--hitos` / `--paso-a-paso` → HITL mode
- `--adjuntos path1,path2,...` → activa FASE 0 vía `@attachment-processor`
- `--html` → genera render brand al cerrar (alias de pipe a `/sap:render-html`)

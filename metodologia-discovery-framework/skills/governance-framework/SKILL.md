---
name: metodologia-governance-framework
description: >
  IT governance design with COBIT and ITIL alignment, decision rights definition, policy framework
  creation, and audit readiness assessment. Use when the user asks to "design governance framework",
  "define decision rights", "create policy framework", or mentions COBIT, ITIL, RACI matrix,
  or audit readiness.
author: Javier Montaño · Comunidad MetodologIA
argument-hint: "<organizacion> [scope-de-gobernanza]"
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

## Supuestos y Limites

- Asume sponsor ejecutivo con autoridad para definir decision rights
- No reemplaza asesoria legal o de compliance — complementa con estructura operativa
- Niveles de madurez COBIT son evaluaciones cualitativas salvo que existan auditorias previas
- Politicas disenadas son templates; requieren revision legal antes de enforcement formal

## Casos Borde

| Escenario | Estrategia de Manejo |
|---|---|
| Organizacion sin gobernanza formal (startup en crecimiento) | Disenar governance lite: 3-5 politicas criticas, RACI minimo, reunion mensual; escalar progresivamente |
| Gobernanza existente pero no enforced | Diagnosticar root cause (falta de ownership, complejidad excesiva); simplificar antes de agregar |
| Multiples marcos regulatorios simultaneos (SOC 2 + ISO 27001 + GDPR) | Mapear controles comunes (common controls framework) para evitar duplicacion de esfuerzo |
| Resistencia organizacional a gobernanza formal | Enmarcar como enablement (acelerar decisiones) no como control; empezar con quick wins visibles |

## Decisiones y Trade-offs

| Decision | Habilita | Restringe | Justificacion |
|---|---|---|---|
| COBIT como framework de referencia default | Cobertura integral de dominios de TI | Puede ser excesivo para organizaciones pequenas | Es el framework mas completo; se adapta seleccionando dominios relevantes |
| RACI como modelo de decision rights | Claridad de roles sin ambiguedad | Requiere mantenimiento cuando cambian roles | Es el modelo mas entendido; alternativas (DACI, RAPID) se usan cuando RACI no es suficiente |
| Implementacion progresiva por trimestre | Reduce resistencia al cambio | Beneficios completos tardan 9-12 meses | Evita big-bang que fracasa por sobrecarga; permite ajustes basados en feedback |

## Knowledge Graph

```mermaid
graph TD
    subgraph Core["Governance Framework"]
        A[Assessment de Madurez] --> B[Decision Rights RACI]
        A --> C[Catalogo de Politicas]
        B --> D[Modelo Operativo]
        C --> D
        D --> E[Audit Readiness]
    end
    subgraph Inputs["Inputs"]
        F[Estructura Organizacional] --> B
        G[Marcos Regulatorios] --> C
        H[Practicas Actuales] --> A
    end
    subgraph Outputs["Outputs"]
        B --> I[RACI Matrix]
        D --> J[Governance Charter]
        E --> K[Gap Analysis de Auditoria]
    end
    subgraph Related["Related Skills"]
        L[maturity-assessment] -.-> A
        M[compliance-assessment] -.-> E
        N[change-management] -.-> D
    end
```

## Output Templates

**Formato 1 — Markdown (default)**
- Filename: `Governance_Framework_{org}_{WIP|Aprobado}.md`
- Estructura: Charter > Assessment COBIT > RACI Matrix > Catalogo de Politicas > Modelo Operativo > Audit Readiness > Roadmap
- Incluye diagramas Mermaid de estructura de comites y flujo de escalation

**Formato 2 — XLSX (RACI y tracking operativo)**
- Filename: `Governance_RACI_{org}_{WIP|Aprobado}.xlsx`
- Estructura: Sheet 1 (RACI Matrix por dominio) > Sheet 2 (Catalogo de Politicas con status) > Sheet 3 (Audit checklist con evidencia)
- Optimizado para uso operativo y seguimiento de implementacion

**Formato 3 — HTML (bajo demanda)**
- Filename: `Governance_Framework_{org}_{WIP}.html`
- Estructura: HTML self-contained branded (Design System MetodologIA v5). Dark-First Executive page con COBIT maturity radar, RACI matrix navegable, y roadmap de implementacion con quick wins destacados. WCAG AA, responsive, print-ready.

**Formato 4 — DOCX (bajo demanda)**
- Filename: `Governance_Framework_{org}_{WIP}.docx`
- Generado con python-docx bajo MetodologIA Design System v5: portada, TOC automático, encabezados/pies de página con marca, tablas zebra, tipografía Poppins (headings navy), Montserrat (body), acentos dorados

**Formato 5 — PPTX (bajo demanda)**
- Filename: `{fase}_{entregable}_{cliente}_{WIP}.pptx`
- Generado con python-pptx bajo MetodologIA Design System v5. Slide master con degradado navy, títulos Poppins, cuerpo Montserrat, acentos dorados. Máx 20 slides variante ejecutiva / 30 variante técnica. Notas de orador con referencias de evidencia ([CODIGO], [DOC], [INFERENCIA], [SUPUESTO]).

## Evaluacion

| Dimension | Peso | Criterio |
|-----------|------|----------|
| Trigger Accuracy | 10% | Activa triggers correctos ante keywords de gobernanza, COBIT, ITIL, RACI, auditoria |
| Completeness | 25% | Cubre assessment, decision rights, politicas, modelo operativo y audit readiness |
| Clarity | 20% | RACI matrix no tiene ambiguedad en roles; politicas tienen scope y enforcement claros |
| Robustness | 20% | Maneja startups sin gobernanza, multiples marcos regulatorios, resistencia organizacional |
| Efficiency | 10% | Proceso escala con variante ejecutiva; no duplica evaluaciones entre dominios COBIT |
| Value Density | 15% | Cada politica y decision right es accionable; roadmap tiene quick wins identificados |

**Umbral minimo**: 7/10 en cada dimension para considerar el skill production-ready.

## Cross-References

- **metodologia-maturity-assessment:** Evaluacion de madurez alimenta assessment de gobernanza
- **metodologia-compliance-assessment:** Audit readiness como extension de compliance
- **metodologia-change-management:** Implementacion de gobernanza requiere gestion de cambio

---
**Autor:** Javier Montaño · Comunidad MetodologIA | **Version:** 1.0.0

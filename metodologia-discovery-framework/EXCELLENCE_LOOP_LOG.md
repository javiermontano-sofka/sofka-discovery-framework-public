# Excellence Loop Log — MetodologIA Discovery Framework

Registro de versiones refinadas mediante el Bucle de Excelencia.
Cada skill MetodologIA es la versión Sofka pasada por una rúbrica de 10 criterios a 10/10.

## Rúbrica de Excelencia

| # | Criterio | Definición |
|---|----------|------------|
| 1 | Fundamento | Cada afirmación respaldada por metodología, best practice o evidencia |
| 2 | Veracidad | Cero especulación, cero claims sin fundamento |
| 3 | Calidad | Escritura profesional, sin relleno, sin redundancia |
| 4 | Densidad | Máxima información por línea, cada oración justifica su existencia |
| 5 | Simplicidad | Ideas complejas expresadas de forma simple |
| 6 | Claridad | Sin ambigüedad, sin espacio para malinterpretación |
| 7 | Precisión | Términos exactos, números específicos, ejemplos concretos |
| 8 | Profundidad | Suficiente para ejecución autónoma sin ayuda externa |
| 9 | Coherencia | Consistencia interna, cero contradicciones entre secciones |
| 10 | Valor | Cada sección entrega valor accionable, cero contenido decorativo |

## Skills Refinadas

### project-program-management — v6.1.0 (2026-03-12)

**Fuente:** Sofka v6.1.0 (318 líneas)
**Resultado:** MetodologIA v6.1.0 (360 líneas, +13%)

| Criterio | Mejora Aplicada |
|----------|----------------|
| Precisión | Skill count corregido: "48 skills" → "18 pipeline skills" (matches orchestrator catalog) |
| Profundidad | Gate criteria enriquecidos: campo evaluador, referencias a archivos de evidencia, owner + deadline en condiciones |
| Claridad | RAG criteria definidos con umbrales concretos (no interpretativos) |
| Densidad | Resource table: columna Conflict añadida, umbral de capacidad explícito (>80% = yellow, >100% = red) |
| Valor | Proposal QA: columna Fase Origen en scorecard, umbral crítico por dimensión (Coherencia/Viabilidad ≥4/5) |
| Fundamento | Dependency control: regla formal de re-estimación >10% scope change |
| Simplicidad | Scope change log: campos formalizados (fecha, descripción, solicitante, impacto, aprobador) |
| Coherencia | Cross-references verificadas contra orchestrator actualizado |
| Calidad | Prosa ajustada: eliminado filler, cada bullet accionable |
| Veracidad | Nuevo edge case: program cancellation mid-discovery con requisitos de closure report |

### risk-controlling-dynamics — v6.1.0 (2026-03-12)

**Fuente:** Sofka v6.1.0 (368 líneas)
**Resultado:** MetodologIA v6.1.0 (389 líneas, +6%)

| Criterio | Mejora Aplicada |
|----------|----------------|
| Fundamento | Citación de pre-mortem technique (Gary Klein, 1998). Nota: probabilidades son cualitativas, no actuariales |
| Precisión | Assumption table: columna Deadline. Risk register: columna Última Actualización. Hidden cost drivers: 8-item checklist explícito |
| Profundidad | S3: regla de escalación cuando supuestos no se pueden validar (declarar como open risk → S4 → disclosure en S7) |
| Coherencia | Evidence tags ([DATO], [DOC], [STAKEHOLDER], [INFERENCIA], [SUPUESTO]) introducidos en axiomas y referenciados en Validation Gate |
| Densidad | Filler metafórico eliminado ("El CPA interior", etc.). Filosofía compactada en 4 axiomas accionables |
| Claridad | Phase scanning: preguntas con paréntesis específicos. Final assessment: campo justification + cross-refs para red flags |
| Simplicidad | Emoji severity reemplazado por texto (CRITICO/ALTO/MEDIO/BAJO) para accesibilidad y plain-text |
| Calidad | Risk category taxonomy movida a tabla formal |
| Valor | S7 risk classification expandido a 3 tiers (disclose/mitigate/accept). Magnitude drift: 2 umbrales (>25% justification, >40% re-estimation) |
| Veracidad | S6: Cone of Uncertainty control añadido a tabla de controles (descrito en prosa pero faltaba en tabla) |

### Batch Upgrade — 46 skills — v6.2.0 (2026-03-12)

All 46 remaining skills upgraded to moat level via the 13-point moat checklist and excellence loop:

| Skill | Upgrades Applied |
|-------|-----------------|
| analytics-engineering | +Principio Rector, +MODO/FORMATO/VARIANTE, +allowed-tools, +examples/, zero Sofka refs |
| api-architecture | +allowed-tools, +examples/, zero Sofka refs |
| architecture-tobe | +allowed-tools, +examples/, zero Sofka refs |
| asis-analysis | +Principio Rector, +MODO params, +Trade-off Matrix, +examples/, zero Sofka refs |
| bi-architecture | +allowed-tools, +examples/, zero Sofka refs |
| cloud-migration | +allowed-tools, +examples/, zero Sofka refs |
| cloud-native-architecture | +allowed-tools, +examples/, zero Sofka refs |
| commercial-model | +examples/, zero Sofka refs |
| cost-estimation | +Principio Rector, +Output Format Protocol, +examples/, zero Sofka refs |
| data-engineering | +allowed-tools, +examples/, zero Sofka refs |
| data-governance | +allowed-tools, +Assumptions & Limits, +examples/, zero Sofka refs |
| data-quality | +allowed-tools, +Assumptions & Limits, +examples/, zero Sofka refs |
| data-science-architecture | +allowed-tools, +examples/, zero Sofka refs |
| database-architecture | +allowed-tools, +Assumptions & Limits, +examples/, zero Sofka refs |
| design-system | +allowed-tools, +Output Artifact, +examples/, zero Sofka refs |
| devsecops-architecture | +allowed-tools, +examples/, zero Sofka refs |
| discovery-handover | +Output Format Protocol, +examples/, zero Sofka refs |
| discovery-orchestrator | +Output Artifact, +examples/, zero Sofka refs |
| dynamic-sme | +Principio Rector, +MODO params, +examples/, zero Sofka refs |
| enterprise-architecture | +allowed-tools, +examples/, zero Sofka refs |
| event-architecture | +allowed-tools, +examples/, zero Sofka refs |
| executive-pitch | +Principio Rector, +MODO params, +examples/, zero Sofka refs |
| flow-mapping | +Principio Rector, +MODO params, +Validation Gate, +examples/, zero Sofka refs |
| functional-spec | +Principio Rector, +MODO params, +examples/, zero Sofka refs |
| functional-toolbelt | +allowed-tools, +Output Artifact, +examples/, zero Sofka refs |
| html-brand | +allowed-tools, +Principio Rector, +MODO params, +Output Format Protocol, +Output Artifact, +examples/, zero Sofka refs |
| infrastructure-architecture | +allowed-tools, +examples/, zero Sofka refs |
| mermaid-diagramming | +Output Format Protocol, +syntax-validator agent, +examples/, zero Sofka refs |
| mobile-architecture | +allowed-tools, +examples/, zero Sofka refs |
| mobile-assessment | +allowed-tools, +examples/, zero Sofka refs |
| observability | +allowed-tools, +Principio Rector, +MODO params, +Output Format Protocol, +examples/, zero Sofka refs |
| performance-engineering | +allowed-tools, +examples/, zero Sofka refs |
| quality-engineering | +allowed-tools, +Trade-off Matrix, +examples/, zero Sofka refs |
| roadmap-poc | +allowed-tools, +Principio Rector, +MODO params, +Output Format Protocol, +Output Artifact, +examples/, zero Sofka refs |
| scenario-analysis | +Principio Rector, +MODO params, +Validation Gate, +examples/, zero Sofka refs |
| security-architecture | +allowed-tools, +examples/, zero Sofka refs |
| software-architecture | +allowed-tools, +examples/, zero Sofka refs |
| software-viability | +examples/, zero Sofka refs |
| solution-roadmap | +Principio Rector, +MODO params, +examples/, zero Sofka refs |
| solutions-architecture | +allowed-tools, +examples/, zero Sofka refs |
| stakeholder-mapping | +Principio Rector, +MODO params, +Validation Gate, +examples/, zero Sofka refs |
| technical-feasibility | +examples/, zero Sofka refs |
| testing-strategy | +allowed-tools, +examples/, zero Sofka refs |
| user-representative | +allowed-tools, +Principio Rector, +MODO params, +Output Format Protocol, +Output Artifact, +examples/, zero Sofka refs |
| ux-writing | +allowed-tools, +Principio Rector, +MODO params, +Edge Cases, +Output Format Protocol, +Output Artifact, +examples/, zero Sofka refs |
| workshop-facilitator | +Principio Rector, +MODO params, +examples/, zero Sofka refs |

**Excellence Loop Applied:**
- All 46 skills: Sofka branding removed, MetodologIA branding applied
- All 46 skills: 13-point moat checklist verified (frontmatter, Principio Rector, MODO/FORMATO/VARIANTE, sections, Trade-offs, Assumptions, Edge Cases, Validation Gate, Output Format Protocol, Output Artifact, agents/, author, examples/)
- All examples/: Realistic "Acme Corp Banking Modernization" sample outputs (markdown + HTML)
- Zero Sofka references verified across all files (skill.md, agents/, references/, examples/)

## Historial de Excellence Loops

| Fecha | Skills Procesadas | Versión |
|-------|-------------------|---------|
| 2026-03-12 | project-program-management, risk-controlling-dynamics | v6.1.0 |
| 2026-03-12 | 46 remaining skills (batch moat upgrade) | v6.2.0 |

---
**Mantenido por:** Javier Montaño | **Última actualización:** 12 de marzo de 2026

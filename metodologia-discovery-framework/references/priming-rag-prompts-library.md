# Priming-RAG: Prompts Library
> MetodologIA Discovery Framework — Catalogo completo de 44 prompts en 6 categorias
> Procesado: 2026-03-14 | Version: v12.0.0
> Fuentes: `$SDF/prompts/flujos.md`, `$SDF/prompts/entregables.md`, `$SDF/prompts/assessments.md`, `$SDF/prompts/operaciones.md`, `$SDF/prompts/metaprompts.md`

---

## Fuentes procesadas

| Archivo | Ruta | Prompts |
|---------|------|---------|
| flujos.md | `$SDF/prompts/flujos.md` | 8 flujos de pipeline |
| entregables.md | `$SDF/prompts/entregables.md` | 17 prompts individuales (00-14 + 05b) |
| assessments.md | `$SDF/prompts/assessments.md` | 5 assessments deep-dive |
| operaciones.md | `$SDF/prompts/operaciones.md` | 5 operaciones sobre discoveries existentes |
| metaprompts.md | `$SDF/prompts/metaprompts.md` | 5 metaprompts generadores |
| versions/ | `$SDF/prompts/versions/v0/`, `v1/` | Archivo historico de versiones anteriores |

Total: **44 prompts** distribuidos en **6 categorias**.

---

## Valor para discovery y RAG

La biblioteca de prompts es el motor ejecutable de MAO. Cada prompt es autocontenido, copy-paste ready, y sigue el formato NL-HP (Natural Language Hyper-Parameterized). Conocer el catalogo permite seleccionar el prompt correcto, personalizar parametros, y predecir que entregable se producira en cada invocacion.

---

## Formato NL-HP Playbook (estandar MAO)

Todos los 44 prompts siguen esta estructura estandarizada:

```
## ROL               — Identidad, especialidad y panel del agente
## OBJETIVO          — Entregable medible con criterios de exito cuantificables
## PROTOCOLO         — Pasos numerados de ejecucion secuencial
## RESTRICCIONES     — Limites duros (NUNCA precios, NUNCA verde, evidencia trazable)
## CRITERIOS DE CALIDAD — Checklist de validacion con umbrales
## EDGE CASES        — Comportamiento ante repo vacio, monorepo, contexto minimo
===params            — Variables configurables: MODO, FORMATO, VARIANTE, PROFUNDIDAD, GATES
===inputs            — Entradas: {RUTA}, {CLIENTE}, {TIPO_SERVICIO}, {INDUSTRIA}
```

Los 7 Sabios Think Tank se activan como panel consultor silencioso en todos los flujos.

---

## Categoria 1: Flujos (8)

Pipelines completos que orquestan multiples entregables en secuencia.

| # | Titulo | Comando | Modo HITL | Entregables | Proposito | Params clave |
|---|--------|---------|-----------|-------------|-----------|--------------|
| 1 | **Autonomo Total** | `/mao:run-auto` (desatendido) | Desatendido | 16 | Pipeline completo sin pausas, overnight, gates auto-aprobados | GATES=auto-aprobar-todos, PROFUNDIDAD=exhaustivo |
| 2 | **Piloto Automatico** | `/mao:run-auto` | Piloto-auto | 16 | Pipeline estandar, balance autonomia/supervision, default | GATES=piloto-auto |
| 3 | **Express Go/No-Go** | `/mao:run-express` | Minimal | 5 | Brief + AS-IS + Scenarios + Roadmap + Pitch | PROFUNDIDAD=ejecutivo |
| 4 | **Intermedio Roadmap** | `/mao:run-guided` (8) | Mixto | 8 | Subconjunto balanceado con cocreacion en gates estrategicos | PROFUNDIDAD=intermedio |
| 5 | **Guiado Cocreado** | `/mao:run-guided` | Cocreado | 16 | Validacion humana en cada gate, maximo rigor | GATES=humano-requerido |
| 6 | **Con Adjuntos** | `/mao:run-auto` + adjuntos | Semi-auto | 16 | Procesa documentos adjuntos como input adicional al codebase | ADJUNTOS=true |
| 7 | **Express HTML** | `/mao:run-express` (html) | Minimal | 5 | Pipeline express con salida en HTML MetodologIA Design System v5 | FORMATO=html |
| 8 | **Por Tipo de Servicio** | `/mao:run-deep` | Exhaustivo | 16+ | Pipeline personalizado segun TIPO_SERVICIO, activa skills especificos | TIPO_SERVICIO={tipo} |

---

## Categoria 2: Entregables (17)

Prompts individuales que producen un entregable especifico del pipeline.

| # | Titulo | Comando | Rol principal | Proposito | Params clave |
|---|--------|---------|---------------|-----------|--------------|
| 00 | **Discovery Plan** | `/mao:generate-plan` | Arquitecto de Gobernanza | Plan con comite, alcance, cronograma G1-G3, registro de inputs | MODO, FORMATO |
| 00b | **Stakeholder Map** | `/mao:map-stakeholders` | Conductor + Analista | Mapa influencia-interes, estrategia de engagement por stakeholder | MODO, FORMATO |
| 01 | **Client Brief** | `/mao:generate-brief` | Conductor | Brief ejecutivo con semaforo 6D, contexto, dolor, restricciones | MODO, FORMATO, VARIANTE |
| 02 | **AS-IS Diagnosis** | `/mao:diagnose-asis` | Technical Architect | Diagnostico arquitectonico, deuda tecnica, semaforo multidimensional | MODO, FORMATO, VARIANTE |
| 03 | **Flow Mapping** | `/mao:trace-flows` | Domain Analyst | Flujos E2E en BPMN/Mermaid, cuellos de botella, happy/unhappy paths | MODO, FORMATO |
| 04 | **Scenarios TO-BE** | `/mao:evaluate-scenarios` | Technical Architect | >=3 escenarios con scoring comparativo, FTE-meses estimados | MODO, FORMATO, VARIANTE |
| 05 | **Feasibility** | `/mao:validate-feasibility` | Economics Researcher | 5 dimensiones: tecnica, economica, temporal, organizacional, riesgo | MODO, FORMATO |
| 05b | **Feasibility Extended** | `/mao:validate-feasibility` (ext) | Economics Researcher | Feasibility extendida con analisis build/buy/partner, sensitivity | VARIANTE=extendida |
| 06 | **Roadmap** | `/mao:chart-roadmap` | Delivery Manager | Fases con milestones, dependencias, ruta critica, quick wins | MODO, FORMATO |
| 07 | **Functional Spec** | `/mao:write-spec` | Domain Analyst | Epicas, HU, criterios de aceptacion, reglas de negocio | MODO, FORMATO |
| 08 | **Executive Pitch** | `/mao:craft-pitch` | Content Strategist | Value prop, escenario recomendado, call to action, ROI narrativo | MODO, FORMATO |
| 09 | **Handover Package** | `/mao:deliver-handover` | Delivery Manager | Indice, resumen ejecutivo, proximos pasos, paquete transferencia | MODO, FORMATO |
| 10 | **Findings Deck** | `/mao:present-findings` | Editorial Director | Hallazgos clave para presentacion a stakeholders | MODO, FORMATO |
| 11 | **Technical Report** | `/mao:report-tech` | Technical Architect | Reporte tecnico detallado para equipo de ingenieria, CTO | MODO, FORMATO, VARIANTE=tecnica |
| 12 | **Functional Report** | `/mao:report-func` | Domain Analyst | Reporte funcional para equipo de negocio y producto | MODO, FORMATO, VARIANTE=funcional |
| 13 | **Business Review** | `/mao:review-business` | Business Analyst | ROI proyectado, business case, review comercial para VP | MODO, FORMATO |
| 14 | **Oportunidades IA** | `/mao:discover-ai` | AI Strategist | Portfolio de oportunidades IA/GenAI, viabilidad, priorizacion | MODO, FORMATO |

---

## Categoria 3: Assessments (5)

Deep-dives independientes. Ejecutables standalone o como complemento del pipeline.

| # | Titulo | Comando | Rol | Proposito | Params clave |
|---|--------|---------|-----|-----------|--------------|
| 1 | **Architecture Deep-Dive** | `/mao:assess-architecture` | Arquitecto senior | C4 L1-L3 Mermaid, ISO 25010, deuda tecnica cuantificada, ADRs, TO-BE | RUTA, PROFUNDIDAD |
| 2 | **Data Landscape** | `/mao:assess-data` | Data Strategist | Madurez DAMA, governance, calidad, lineage, data catalog | RUTA, PROFUNDIDAD |
| 3 | **Cloud Readiness** | `/mao:assess-cloud` | Cloud Architect | 7Rs classification, cloud maturity, migracion, FinOps baseline | RUTA, PROFUNDIDAD |
| 4 | **Security Posture** | `/mao:assess-security` | Security Architect | Threat model STRIDE, security controls, compliance gaps, zero trust | RUTA, PROFUNDIDAD |
| 5 | **Change Readiness** | `/mao:assess-change` | Change Catalyst | ADKAR assessment, resistencia, sponsors, adoption strategy | RUTA, PROFUNDIDAD |

---

## Categoria 4: Operaciones (5)

Operan sobre discoveries existentes. Requieren output/ previo (parcial o completo).

| # | Titulo | Comando | Proposito | Params clave |
|---|--------|---------|-----------|--------------|
| 1 | **Rescue Stalled** | `/mao:rescue-stalled` | Triage forense + rescate de discovery estancado, reparacion de entregables | RUTA (discovery existente) |
| 2 | **Audit Quality** | `/mao:audit-quality` | Auditoria de calidad del pipeline completo, rubrica 10 criterios | RUTA (discovery existente) |
| 3 | **Improve Deliverables** | `/mao:improve-deliverables` | Mejora iterativa basada en feedback, gap analysis, enriquecimiento | RUTA, ENTREGABLE |
| 4 | **Simulate What-If** | `/mao:simulate-scenarios` | Simulacion what-if sobre escenarios de un discovery completado | RUTA, ESCENARIO |
| 5 | **Benchmark Maturity** | `/mao:benchmark-maturity` | Benchmark de madurez contra frameworks estandar del sector | RUTA, FRAMEWORK |

---

## Categoria 5: Service Discovery (4)

Variantes del pipeline preconfiguradas por tipo de servicio.

| # | Titulo | Comando | TIPO_SERVICIO | Proposito |
|---|--------|---------|---------------|-----------|
| 1 | **RPA** | `/mao:rpa-discovery` | RPA | Candidatos de automatizacion, process mining, ROI de RPA |
| 2 | **QA** | `/mao:qa-discovery` | QA | Estrategia de testing, test factory, cobertura, ISTQB |
| 3 | **AI Center** | `/mao:ai-discovery` | Data-AI | Centro de IA, portfolio use cases, AI readiness |
| 4 | **Transformacion Digital** | `/mao:transformation` | Digital-Transformation | Multi-workstream modernizacion integral |

---

## Categoria 6: Metaprompts (5)

Generadores de prompts. Producen prompts ejecutables, no entregables directos. El output siempre sigue formato NL-HP.

| # | Titulo | Comando | Proposito | Params clave |
|---|--------|---------|-----------|--------------|
| 1 | **Generator by Engagement** | `/mao:meta-engagement` | Prompt personalizado por {CLIENTE} + {INDUSTRIA} + {TIPO_SERVICIO} + {OBJETIVO} | CLIENTE, INDUSTRIA, TIPO_SERVICIO, OBJETIVO |
| 2 | **Custom Deliverable** | `/mao:meta-custom` | Prompt para entregable no estandar solicitado por el cliente | ENTREGABLE_DESC, AUDIENCIA |
| 3 | **Recovery** | `/mao:meta-recovery` | Prompt de recuperacion cuando el contexto se pierde mid-session | SESSION_CONTEXT, LAST_OUTPUT |
| 4 | **Multi-Discovery** | `/mao:meta-multi` | Prompt para discoveries paralelos de multiples sistemas/servicios | SISTEMAS[], PRIORIDADES |
| 5 | **By Service Type** | `/mao:meta-service` | Prompt optimizado para tipo de servicio con priming sectorial | TIPO_SERVICIO, SECTOR |

---

## Reglas de evidencia (universales)

| Tag | Significado | Ejemplo |
|-----|-------------|---------|
| [CODIGO] | Evidencia del codebase | Dependencia en package.json |
| [CONFIG] | Archivo de configuracion | DB en application.yml |
| [DOC] | Documentacion existente | Diagrama en wiki |
| [INFERENCIA] | Conclusion derivada de evidencia | Pattern inferido de estructura |
| [SUPUESTO] | Suposicion no verificada | Se asume PostgreSQL como DB |

---

## Restricciones universales (aplican a los 44 prompts)

1. **NUNCA precios finales** — Solo FTE-meses, story points, magnitudes de esfuerzo
2. **NUNCA verde para exito** — Usar gold (#22D3EE) [MetodologIA Brand]
3. **NUNCA mezclar branding** MetodologIA con MetodologIA en el mismo output
4. **Evidencia siempre trazable** — Cada afirmacion etiquetada con tag
5. **Excellence loop** en cada entregable — Minimo 7/10 en rubrica de 10 criterios
6. **Disclaimer de incertidumbre** obligatorio en entregables estrategicos

---

## Key takeaways

1. 44 prompts en 6 categorias: 8 flujos + 17 entregables + 5 assessments + 5 operaciones + 4 service + 5 metaprompts
2. Formato NL-HP estandarizado: ROL + OBJETIVO + PROTOCOLO + RESTRICCIONES + CRITERIOS + EDGE CASES + params + inputs
3. Cada prompt es autocontenido y copy-paste ready para Claude Code
4. Los metaprompts generan prompts custom sin modificar la biblioteca base
5. Restricciones universales (no precios, no verde, evidencia trazable) aplican a todos
6. Versionado historico en versions/v0 y versions/v1

---

## Keywords y hashtags

`#prompts` `#biblioteca` `#nlhp` `#playbook` `#flujos` `#entregables` `#assessments` `#operaciones` `#metaprompts` `#service-discovery` `#evidencia` `#trazabilidad` `#excellence-loop` `#restricciones`

---

## Query hooks

- "Que prompts hay disponibles?" -> 44 en 6 categorias
- "Como se estructura un prompt MAO?" -> Formato NL-HP Playbook
- "Cual es el prompt para diagnostico AS-IS?" -> Entregable 02, /mao:diagnose-asis
- "Que metaprompts existen?" -> 5: engagement, custom, recovery, multi, service-type
- "Como hago un discovery de RPA?" -> Service Discovery: /mao:rpa-discovery
- "Que restricciones aplican a todos?" -> No precios, no verde, evidencia trazable, excellence >=7/10

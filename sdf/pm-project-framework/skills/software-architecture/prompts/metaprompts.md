---
skill: software-architecture
title: Metaprompts — Software Architecture
version: 1.0.0
author: Javier Montaño
copyright: © Comunidad MetodologIA
---

# Metaprompts: Software Architecture

Meta-prompts for generating customized prompts for the `software-architecture` skill. Each metaprompt has a specific purpose, a template with placeholders, and a usage guide.

---

## Metaprompt 1: Prompt Generator for Architecture Analysis and Documentation

**Purpose:** Generate a complete, calibrated prompt for analyzing and documenting the internal architecture of any system, adapted to the system type, technology stack, and required depth.

**Template:**

```
Genera un prompt para el skill software-architecture que documente la arquitectura de:

SISTEMA: {{NOMBRE_SISTEMA}}

OBJETIVO DEL ANÁLISIS: {{OBJETIVO}}
Opciones: documentar-arquitectura-actual | diseñar-arquitectura-nueva | evaluar-para-refactoring | comunicar-a-stakeholders | auditar-deuda

TIPO DE SISTEMA: {{TIPO_SISTEMA}}
Opciones: greenfield | brownfield-monolito | brownfield-microservicios | sistema-legacy | sistema-hibrido

STACK TECNOLÓGICO: {{STACK}}
Ejemplo: "Java 17 + Spring Boot 3 + PostgreSQL + Kafka"
Ejemplo: ".NET 8 + Entity Framework + Azure Service Bus"
Ejemplo: "Python FastAPI + SQLAlchemy + Redis + Celery"

TAMAÑO DEL SISTEMA: {{TAMAÑO}}
Opciones: pequeño (<10 módulos) | mediano (10-30 módulos) | grande (>30 módulos)

SECCIONES REQUERIDAS: {{SECCIONES}}
Seleccionar: module-view | component-view | design-patterns | quality-attributes | adrs | debt-evolution | todas

AUDIENCIA: {{AUDIENCIA}}
Opciones: arquitectos | desarrolladores-senior | equipo-completo | ejecutivos | mixta

PROFUNDIDAD: {{PROFUNDIDAD}}
Opciones: ejecutivo (visión general) | técnico (estándar) | exhaustivo (cada componente)

El prompt generado debe incluir: instrucción al skill, contexto de análisis, criterios de validación específicos al tipo de sistema, y formato de output diferenciado por audiencia.
```

**Usage guide:**
1. `OBJETIVO` is the most determinant parameter: documentar-arquitectura-actual generates AS-IS analysis; diseñar-arquitectura-nueva generates prescriptions; evaluar-para-refactoring generates analysis + roadmap
2. `TIPO_SISTEMA` calibrates heuristics: greenfield generates design templates; brownfield-monolito generates existing coupling analysis
3. `STACK_TECNOLOGICO` allows the prompt to include ecosystem-specific conventions (e.g., Spring application context for Java, DI containers for .NET)
4. For `AUDIENCIA = ejecutivos`, the generated prompt eliminates implementation details and translates trade-offs to business impact

---

## Metaprompt 2: Prompt Generator for ADR of Specific Decision

**Purpose:** Generate a precise prompt for documenting any architectural decision as an ADR, adapted to the decision category and organizational context.

**Template:**

```
Genera un prompt para el skill software-architecture que produzca un ADR para:

SISTEMA: {{NOMBRE_SISTEMA}}

CATEGORÍA DE DECISIÓN: {{CATEGORIA}}
Opciones:
- patron-arquitectonico (Hexagonal vs. Clean vs. Layered vs. CQRS vs. Event Sourcing)
- seleccion-framework (elección de framework principal o librería crítica)
- estrategia-datos (modelo de persistencia, ORM vs. query builder, base de datos)
- modelo-integracion (sync REST vs. async messaging vs. event-driven)
- estrategia-escala (monolito vs. modular-monolith vs. microservicios)
- seguridad-arquitectonica (autenticación, autorización, supply chain)
- otro: {{DESCRIPCION_LIBRE}}

DECISIÓN A DOCUMENTAR: {{TITULO_DECISION}}
Ejemplo: "Adoptar CQRS para el módulo de reportes financieros"

CONTEXTO DE LA DECISIÓN:
- Problema que motiva: {{PROBLEMA}}
- Restricciones: {{RESTRICCIONES}}
- Alternativas ya consideradas: {{ALTERNATIVAS_PREVIAS}}
- Quien decide: {{DECISION_MAKER}}
- Urgencia: {{URGENCIA: alta / media / baja}}

STATUS INICIAL: {{STATUS}}
Opciones: proposed (aún en evaluación) | accepted (decisión tomada) | supersedes-adr-{{N}} (reemplaza decisión previa)

NIVEL DE DETALLE DEL ADR: {{DETALLE}}
Opciones: conciso (1-2 páginas) | completo (3-5 páginas con análisis profundo) | con-poc-guidance (incluye guía de PoC para validación)

El prompt generado debe incluir todas las secciones MADR requeridas, instrucciones para documentar las alternativas rechazadas con rigor, y criterios de revisión del ADR.
```

**Usage guide:**
1. `CATEGORIA` determines the analysis structure: patron-arquitectonico generates quality attribute comparisons; seleccion-framework includes license, maintenance, and lock-in criteria
2. `ALTERNATIVAS_PREVIAS` is crucial: if the team already evaluated options, the generated prompt includes them as a starting point and asks to complete the analysis, not restart it
3. `STATUS = proposed` generates an ADR with a "pending items for final decision" section; `accepted` generates the complete and closed ADR
4. `con-poc-guidance` is valuable for high-risk decisions: the prompt will include a minimal PoC design to validate the ADR before committing the entire team

---

## Metaprompt 3: Prompt Generator for Quality Attribute Evaluation

**Purpose:** Generate a customized prompt for evaluating one or more specific quality attributes of a system, adapted to real business metrics and regulatory context.

**Template:**

```
Genera un prompt para el skill software-architecture que evalúe quality attributes específicos de:

SISTEMA: {{NOMBRE_SISTEMA}}
INDUSTRIA / REGULACIÓN: {{INDUSTRIA}}
Ejemplo: "Fintech (PCI-DSS, SOX)", "Salud (HIPAA, HL7)", "Gobierno (datos sensibles)", "E-commerce", "Telecomunicaciones"

QUALITY ATTRIBUTES A EVALUAR: {{LISTA_QA}}
Seleccionar y especificar las métricas objetivo:
- Performance: latencia p95 ≤ {{MS}}ms bajo {{N}} usuarios concurrentes
- Availability: {{SLA}}% anual, recovery en menos de {{MIN}}min
- Modifiability: agregar nueva feature en ≤ {{DIAS}} días de un desarrollador
- Security: cumplimiento de {{ESTANDAR}} (PCI / ISO 27001 / SOC2 / etc.)
- Testability: suite completa en ≤ {{MIN_PIPELINE}} minutos de pipeline
- Deployability: despliegue en ≤ {{MIN_DEPLOY}} minutos con rollback automático

ESTADO ACTUAL CONOCIDO: {{ESTADO_ACTUAL}}
Ejemplo: "Performance actual p95 = 2s, objetivo es 200ms", "No hay tests unitarios del dominio"

DECISIONES ARQUITECTÓNICAS CUESTIONADAS: {{DECISIONES_CUESTIONADAS}}
Ejemplo: "Usando ORM para reportes pesados", "Sin cache layer", "Dominio acoplado a Spring annotations"

FORMATO DE EVALUACIÓN: {{FORMATO_EVAL}}
Opciones: gap-analysis-tabla | escenarios-atam-formales | recomendaciones-priorizadas | todos

El prompt generado debe incluir los escenarios ATAM con las métricas reales del cliente (no genéricas), la metodología de evaluación del gap actual, y las acciones arquitectónicas recomendadas para cerrar los gaps más críticos.
```

**Usage guide:**
1. Concrete metrics in `LISTA_QA` are essential: "performance" without a number is not evaluable. The metaprompt forces having metrics before generating the prompt
2. `INDUSTRIA` determines which quality attributes are mandatory: for fintech, security and availability are critical by regulation; for e-commerce, performance and deployability are critical by competition
3. `DECISIONES_CUESTIONADAS` focuses the analysis: the generated prompt will specifically evaluate those decisions against quality attributes, producing evidence to reconsider or confirm them
4. For `FORMATO_EVAL = todos`, the output includes formal scenarios, gap analysis, and action roadmap — ideal for executive architecture presentations

---

## Metaprompt 4: Prompt Generator for Architecture Evolution Plan

**Purpose:** Generate a prompt for designing the architecture evolution strategy of any system, calibrated to debt level, team velocity, and business constraints.

**Template:**

```
Genera un prompt para el skill software-architecture que produzca un plan de evolución arquitectónica para:

SISTEMA: {{NOMBRE_SISTEMA}}

ESTADO ACTUAL DE DEUDA: {{NIVEL_DEUDA}}
Opciones: bajo (código desorganizado pero funcional) | medio (acoplamiento significativo, tests escasos) | alto (cambios costosos, bugs frecuentes) | crítico (sistema frágil, equipo bloqueado)

ARQUITECTURA OBJETIVO: {{ARQUITECTURA_OBJETIVO}}
Opciones: modular-monolith | hexagonal | clean-architecture | cqrs | microservicios-parciales | refactoring-incremental-sin-reescritura

RESTRICCIONES DE NEGOCIO: {{RESTRICCIONES}}
Ejemplo: "No se puede parar la entrega de features durante la migración", "Presupuesto máximo de refactoring: 20% de la capacidad del equipo", "Deadline de auditoría en 6 meses"

TAMAÑO DEL EQUIPO Y VELOCIDAD: {{EQUIPO}}
Ejemplo: "5 desarrolladores, 2 sprints de 2 semanas, velocidad de ~20 story points"

RIESGOS CONOCIDOS EN LA MIGRACIÓN: {{RIESGOS_MIGRACION}}
Ejemplo: "El módulo de pagos no puede tener downtime", "El equipo tiene experiencia limitada con hexagonal"

HORIZONTE TEMPORAL: {{HORIZONTE}}
Opciones: corto (3 meses) | medio (6 meses) | largo (12+ meses)

ESTRATEGIA PREFERIDA: {{ESTRATEGIA}}
Opciones: strangler-fig (gradual por feature) | big-bang-por-modulo (módulo a módulo completo) | fitness-functions-first (corregir sin reestructurar) | equipo-define (el skill recomienda)

El prompt generado debe incluir: plan por fases con criterios de completación medibles, estrategia de parallel running, fitness functions para prevenir regresión, y métricas de éxito (velocity antes/después, defect rate, deployment frequency).
```

**Usage guide:**
1. `NIVEL_DEUDA = crítico` generates a plan with stabilization prioritized before evolution: first test coverage, then refactoring
2. `RESTRICCIONES_DE_NEGOCIO` is the hardest parameter to obtain but the most important: without it the plan may be technically correct but operationally impossible
3. For `ESTRATEGIA = equipo-define`, the generated prompt includes a preliminary analysis section where the skill evaluates which strategy is most appropriate given the client's parameters before producing the plan
4. The generated plan always includes pre and post success metrics: DORA metrics (deployment frequency, lead time, MTTR, change failure rate) and debt metrics (code coverage, cyclomatic complexity, coupling metrics)

---

## Metaprompt 5: Prompt Generator for Anti-Pattern Detection and Refactoring

**Purpose:** Generate a prompt for systematically identifying architectural anti-patterns in a codebase and producing a refactoring plan prioritized by impact on quality attributes.

**Template:**

```
Genera un prompt para el skill software-architecture enfocado en detección de anti-patrones y plan de refactoring para:

SISTEMA: {{NOMBRE_SISTEMA}}
CODEBASE: {{RUTA_CODEBASE}}
LENGUAJE / FRAMEWORK: {{STACK}}

ANTI-PATRONES A BUSCAR: {{ANTI_PATRONES}}
Seleccionar todos los relevantes:
- [ ] God Object / God Class (clase con demasiadas responsabilidades)
- [ ] Anemic Domain Model (dominio sin lógica, toda la lógica en services)
- [ ] Leaky Abstraction (capa inferior filtra detalles a la superior)
- [ ] Tight Coupling (cambio en A requiere cambio en B siempre)
- [ ] Circular Dependencies (A → B → C → A)
- [ ] Service Locator (dependency injection violada, lookup manual)
- [ ] Distributed Monolith (microservicios que no pueden desplegarse independientemente)
- [ ] Big Ball of Mud (sin estructura coherente, todo depende de todo)
- [ ] Shotgun Surgery (un cambio lógico requiere modificar N archivos dispersos)
- [ ] Feature Envy (método que usa más datos de otra clase que de la propia)

ENFOQUE DEL ANÁLISIS: {{ENFOQUE}}
Opciones: top-10-por-impacto | análisis-exhaustivo | solo-módulo:{{NOMBRE_MODULO}} | solo-patrones-que-bloquean-testing

CRITERIO DE PRIORIZACIÓN: {{CRITERIO}
Opciones: impacto-en-velocity | riesgo-de-regresion | bloqueo-de-features | ratio-impacto-esfuerzo

NIVEL DE DETALLE DEL REFACTORING: {{DETALLE_REFACTORING}}
Opciones: identificar-solo | identificar-con-estrategia | identificar-con-ejemplo-de-código | plan-completo-por-fases

El prompt generado debe incluir: metodología de detección específica al stack tecnológico, tabla de anti-patrones con impacto cuantificado en quality attributes, estrategia de refactoring por tipo de anti-patrón, y fitness functions para prevenir recurrencia en CI/CD.
```

**Usage guide:**
1. Select only the `ANTI_PATRONES` suspected to exist or reported by the client as pain points — an analysis of all in a large codebase consumes too much context
2. `SOLO-PATRONES-QUE-BLOQUEAN-TESTING` is the most pragmatic mode for teams that need to increase velocity quickly: first eliminate what prevents testing, then the rest
3. `NIVEL_DETALLE = identificar-con-ejemplo-de-código` generates the most value for the development team: they see exactly the problematic pattern and the correct pattern in the same context of their code
4. Combine with Metaprompt 4 (Evolution Plan) to convert detected anti-patterns into prioritized debt items in the architecture evolution roadmap

---
**Author:** Javier Montaño | **© Comunidad MetodologIA** | **Version:** 1.0.0 | **Date:** March 2026

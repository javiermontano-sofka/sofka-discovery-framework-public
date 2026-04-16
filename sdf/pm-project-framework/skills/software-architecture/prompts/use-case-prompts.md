---
skill: software-architecture
title: Use-Case Prompts — Software Architecture
version: 1.0.0
author: Javier Montaño
copyright: © Comunidad MetodologIA
---

# Use-Case Prompts: Software Architecture

Ready-to-use prompts for the `software-architecture` skill. Each prompt includes activation context, prompt text, and expected output format.

---

## Prompt 1: AS-IS Architecture Analysis of Existing System

**Context:** The current architecture of a system needs to be documented to understand its real structure before designing changes or evaluating debt.

**Prompt:**
```
/mao:asis [NOMBRE_SISTEMA]

Analiza la arquitectura interna del sistema [NOMBRE_SISTEMA] en [RUTA_CODEBASE].

Produce:
1. Module View: mapa de módulos con responsabilidades, dependencias, y violaciones de capas detectadas
2. Component View: componentes de los 3 módulos más críticos con sus interfaces y patrones aplicados
3. Design Patterns: patrones arquitectónicos identificados, patrones de diseño en uso, y anti-patrones detectados con ubicación en el código
4. Deuda técnica inicial: top-5 síntomas con impacto en quality attributes

Para cada módulo: listar dependencias, identificar si la dirección respeta la separación de capas, y marcar violaciones.

{MODO}=piloto-auto {FORMATO}=markdown
```

**Expected output:** AS-IS architecture document with module view Mermaid diagram, component table, catalog of patterns found, and initial debt list.

---

## Prompt 2: Hexagonal Architecture Design for New System

**Context:** A new service is being designed or an existing one is being refactored toward Hexagonal Architecture to maximize testability and infrastructure independence.

**Prompt:**
```
/mao:asis [NOMBRE_SISTEMA]

Diseña la arquitectura Hexagonal (Ports & Adapters) para el sistema [NOMBRE_SISTEMA].

Requisitos de diseño:
- Dominio: [DESCRIPCIÓN_DEL_DOMINIO]
- Integraciones externas: [LISTA_INTEGRACIONES]
- Quality attributes prioritarios: [TESTABILITY / MODIFIABILITY / PERFORMANCE]

Entrega:
1. Mapa de módulos con separación domain / application / infrastructure
2. Definición de puertos primarios (driving) y secundarios (driven) con sus contratos
3. Adaptadores a implementar por cada integración externa
4. Dependency injection strategy para mantener el dominio libre de infraestructura
5. Estrategia de testing: unit tests del dominio sin mocks de infraestructura, integration tests de adaptadores
6. ADR-001: Justificación de Hexagonal sobre alternativas (Layered, Clean Architecture)

{MODO}=supervisado {FORMATO}=markdown
```

**Expected output:** Hexagonal architecture Mermaid diagram, port table with contracts, adapter list, testing strategy, pattern decision ADR.

---

## Prompt 3: CQRS Feasibility Evaluation for High-Read-Demand System

**Context:** A system has read performance issues or needs optimized query models different from the write model.

**Prompt:**
```
/mao:asis [NOMBRE_SISTEMA]

Evalúa la aplicabilidad de CQRS para el sistema [NOMBRE_SISTEMA].

Contexto de la evaluación:
- Ratio lectura/escritura estimado: [RATIO]
- Volumen de transacciones: [TRANSACCIONES_POR_DIA]
- Complejidad del modelo de datos: [SIMPLE / MEDIA / COMPLEJA]
- Requisitos de reporting: [DESCRIPCIÓN]

Análisis requerido:
1. Beneficios específicos de CQRS para este sistema (no genéricos)
2. Costos reales: código adicional, consistencia eventual, complejidad operacional
3. Alternativas evaluadas: Read Replicas sin CQRS, Caching Layer, índices optimizados
4. Quality Attribute Scenarios que se habilitan vs. que se degradan
5. Recomendación con umbral: ¿cuándo CQRS se justifica vs. cuándo es over-engineering?
6. ADR con decisión final y alternativas rechazadas

{MODO}=supervisado {FORMATO}=markdown
```

**Expected output:** Comparative trade-off analysis, quality attribute scenarios with metrics, decision ADR with context, rejected alternatives documented.

---

## Prompt 4: ADR Documentation for Critical Architectural Decision

**Context:** The team made or needs to make a significant architectural decision (pattern choice, framework, data strategy, integration model) and must document it formally.

**Prompt:**
```
/mao:asis [NOMBRE_SISTEMA]

Genera el Architecture Decision Record para la siguiente decisión:

TÍTULO: [TÍTULO_DE_LA_DECISIÓN]
Ejemplo: "Adoptar Event Sourcing para el módulo de auditoría", "Migrar de ORM a Query Builder para reportes"

CONTEXTO:
- Problema que motiva la decisión: [DESCRIPCIÓN_DEL_PROBLEMA]
- Restricciones existentes: [LISTA_RESTRICCIONES]
- Requisitos de quality attributes: [REQUISITOS]
- Fecha de la decisión: [FECHA]

DECISIÓN PROPUESTA: [DESCRIPCIÓN_DE_LA_DECISIÓN]

ALTERNATIVAS EVALUADAS:
1. [ALTERNATIVA_1]: [DESCRIPCIÓN]
2. [ALTERNATIVA_2]: [DESCRIPCIÓN]
3. [ALTERNATIVA_3]: [DESCRIPCIÓN]

El ADR debe incluir: status, contexto completo, decisión con justificación, consecuencias positivas/negativas/neutras, por qué se rechazaron las alternativas, y referencias a otros ADRs relacionados.

{MODO}=paso-a-paso {FORMATO}=markdown
```

**Expected output:** Complete ADR in MADR format, with all sections documented, ready to be committed to the repository.

---

## Prompt 5: Quality Attribute Analysis with ATAM Scenarios

**Context:** The current or proposed architecture needs to be evaluated against measurable quality attributes, using ATAM-style stimulus-response-measure scenarios.

**Prompt:**
```
/mao:asis [NOMBRE_SISTEMA]

Genera el análisis de Quality Attributes con escenarios ATAM para [NOMBRE_SISTEMA].

Quality attributes a analizar:
- Performance: [EXPECTATIVAS_DE_LATENCIA_Y_THROUGHPUT]
- Modifiability: [TIPOS_DE_CAMBIOS_FRECUENTES]
- Availability: [SLA_OBJETIVO]
- Security: [REQUISITOS_REGULATORIOS_O_DE_NEGOCIO]
- Testability: [VELOCIDAD_DE_PIPELINE_OBJETIVO]
- Deployability: [FRECUENCIA_Y_VENTANA_DE_DESPLIEGUE]

Por cada quality attribute:
1. Escenario en formato ATAM: Estímulo → Fuente → Entorno → Artefacto → Respuesta → Medida
2. Estado actual vs. objetivo (gap analysis)
3. Decisiones arquitectónicas que habilitan o degradan el atributo
4. Riesgo si el gap no se cierra (impacto en negocio)

{MODO}=piloto-auto {FORMATO}=markdown
```

**Expected output:** ATAM scenario table by quality attribute, gap analysis with traffic lights, linked architectural decisions, and business risks per gap.

---

## Prompt 6: Architectural Technical Debt Inventory and Remediation Plan

**Context:** The system has accumulated visible architectural debt that slows delivery. A prioritized inventory and a realistic remediation plan are needed.

**Prompt:**
```
/mao:asis [NOMBRE_SISTEMA]

Produce el inventario completo de deuda técnica arquitectónica y el plan de evolución para [NOMBRE_SISTEMA].

Codebase: [RUTA_CODEBASE] | Análisis AS-IS previo: [RUTA_ANALISIS]

Por cada ítem de deuda:
- Síntoma observable (qué falla o genera fricción)
- Causa raíz arquitectónica (por qué existe)
- Quality attributes afectados (modifiability, testability, performance)
- Impacto en velocidad de entrega del equipo (Alto/Medio/Bajo)
- Esfuerzo de remediación (FTE-semanas estimadas)
- Riesgo si no se remedia (compounding, bloqueo de funcionalidades)
- Estrategia de remediación recomendada

Plan de evolución:
- Priorización por ratio impacto/esfuerzo
- Enfoque por fases (no bloquea entrega de features)
- Estrategia de parallel running para cambios de mayor impacto
- Fitness functions recomendadas para prevenir recurrencia

{MODO}=piloto-auto {FORMATO}=markdown
```

**Expected output:** Debt table prioritized by impact/effort ratio, phased remediation strategy with Mermaid Gantt, fitness function recommendations.

---

## Prompt 7: Module Architecture Design for New System (Greenfield)

**Context:** A new system is being designed from scratch and the module structure, layer organization, and dependency conventions need to be defined before coding begins.

**Prompt:**
```
/mao:asis [NOMBRE_SISTEMA]

Diseña la arquitectura de módulos para el nuevo sistema [NOMBRE_SISTEMA].

Contexto del sistema:
- Dominio de negocio: [DESCRIPCIÓN_DEL_DOMINIO]
- Bounded contexts identificados: [LISTA_DE_CONTEXTOS]
- Stack tecnológico: [LENGUAJE_Y_FRAMEWORKS]
- Tamaño estimado del equipo: [N_DESARROLLADORES]
- Escala inicial estimada: [USUARIOS_CONCURRENTES / TRANSACCIONES_DIA]
- Restricciones conocidas: [RESTRICCIONES]

Entrega:
1. Modelo de módulos con responsabilidades y justificación de granularidad
2. Mapa de capas y reglas de dependencia (qué puede llamar a qué)
3. Módulos compartidos / libraries y estrategia de exposición (fachadas)
4. Estructura de directorios recomendada con nomenclatura
5. Reglas de dependencia expresadas como fitness functions (ArchUnit / Dependency-Cruiser)
6. Convenciones de naming para componentes (controllers, services, repositories, gateways)

{MODO}=supervisado {FORMATO}=markdown
```

**Expected output:** Module Mermaid diagram with layers, module table with responsibilities, formalized dependency rules, fitness function examples.

---

## Prompt 8: Monolith to Modular Monolith Migration Plan

**Context:** The system is a monolith with high internal coupling. A plan is needed to reorganize it with clear module boundaries without rewriting everything or interrupting deliveries.

**Prompt:**
```
/mao:asis [NOMBRE_SISTEMA]

Diseña el plan de migración hacia Modular Monolith para [NOMBRE_SISTEMA].

Estado actual: monolito con [NIVEL_ACOPLAMIENTO: alto/medio] acoplamiento interno
Codebase: [RUTA_CODEBASE] | Lenguaje: [LENGUAJE]
Equipo: [N_DESARROLLADORES] desarrolladores

Análisis previo:
1. Identificar módulos candidatos desde bounded contexts DDD del sistema
2. Mapear el acoplamiento actual entre las áreas candidatas a módulos
3. Identificar shared state / base de datos compartida y estrategia de separación

Plan de migración por fases:
- Fase 0: Establecer fronteras lógicas sin mover código (namespaces / packages)
- Fase 1: Mover código a módulos, eliminar dependencias directas, introducir interfaces
- Fase 2: Implementar fitness functions que validan las fronteras en CI/CD
- Fase N: Evaluación de extracción a microservicio para módulos con necesidad demostrada de escala independiente

Criterios de "listo para extraer a microservicio": métricas medibles, no intuición.

{MODO}=supervisado {FORMATO}=markdown
```

**Expected output:** Target module map, phased migration plan with completion criteria per phase, fitness function rules, measurable criteria for future extraction.

---

## Prompt 9: Executive Variant — Architecture and Debt Summary for CTO

**Context:** The CTO or VP of Engineering needs to understand the system's architecture, key decisions, and technical debt status in a 30-minute session, without implementation detail.

**Prompt:**
```
/mao:asis [NOMBRE_SISTEMA]

Produce la variante ejecutiva del análisis de arquitectura para [NOMBRE_SISTEMA].

Audiencia: CTO / VP Ingeniería / Director Técnico
Tiempo de lectura objetivo: 20-30 minutos

Entrega únicamente:
1. Module View ejecutivo: diagrama de alto nivel con módulos, capas, y flujo de dependencias (sin detalle de componentes)
2. Patrones arquitectónicos aplicados: top-3 patrones con justificación de negocio (no técnica)
3. Top-5 ADRs vigentes: una línea por cada decisión, por qué fue tomada, impacto en el negocio
4. Deuda técnica: top-5 ítems con impacto en velocidad de entrega y riesgo de negocio (sin detalle técnico)
5. Recomendaciones de evolución: 3-5 acciones priorizadas con esfuerzo estimado en FTE-semanas y beneficio de negocio

{MODO}=desatendido {VARIANTE}=ejecutiva {FORMATO}=markdown
```

**Expected output:** Executive document of 8-12 pages: simplified architecture diagram, pattern table with business justification, ADRs in executive language, debt with velocity impact, action roadmap.

---
**Author:** Javier Montaño | **© Comunidad MetodologIA** | **Version:** 1.0.0 | **Date:** March 2026

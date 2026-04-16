---
skill: functional-spec
title: Body of Knowledge — Especificación Funcional
framework: MetodologIA Discovery Framework
author: Javier Montaño
copyright: © Comunidad MetodologIA
updated: 2026-03-13
---

# Body of Knowledge: Especificación Funcional

## 1. Fundamentos Teóricos

La especificación funcional es el documento contractual que media entre el dominio del negocio y el dominio tecnológico. Su propósito central es describir el **comportamiento observable del sistema** sin prescribir la implementación, estableciendo así un límite epistémico explícito: el QUÉ es responsabilidad de la especificación, el CÓMO es responsabilidad de la arquitectura y el desarrollo.

**Principios fundacionales:**
- **Completitud funcional**: Todo comportamiento del sistema debe estar cubierto por al menos un caso de uso. Lo que no está especificado no existe en el contrato.
- **Trazabilidad bidireccional**: Cada requisito debe poder rastrearse hacia una necesidad de negocio (upstream) y hacia un criterio de aceptación verificable (downstream).
- **Precisión sin sobrespecificación**: Una regla ambigua genera interpretaciones divergentes; una regla demasiado técnica viola la separación QUÉ/CÓMO.
- **Vivacidad del documento**: La spec es un artefacto vivo que cambia con el negocio, no un contrato estático grabado en piedra.

La tradición de las ciencias de la computación ubica la especificación formal en la intersección de la teoría de autómatas (máquinas de estado), la lógica de predicados (precondiciones y postcondiciones al estilo de Hoare), y la ingeniería de requisitos (disciplina que estudia cómo capturar, documentar y validar necesidades).

---

## 2. Marcos de Referencia Clave

### 2.1 IEEE 830 / IEEE 29148 — Especificación de Requisitos de Software (SRS)
El estándar IEEE 830 (1998) y su sucesor IEEE 29148 (2018) definen la estructura canónica de una SRS: introducción, descripción general, requisitos específicos (funcionales, no funcionales, de interfaz). Aporta el vocabulario de **funciones del sistema**, **interfaces externas**, **restricciones de diseño**, y **atributos de calidad**. La especificación funcional del MetodologIA Framework es compatible con esta estructura pero la extiende con elementos de discovery (módulos MVP, complejidad/riesgo).

### 2.2 Casos de Uso — Alistair Cockburn
Alistair Cockburn sistematizó los casos de uso como la unidad narrativa fundamental para capturar objetivos de actores. Su libro *Writing Effective Use Cases* (2000) introduce el **nivel de meta** (sea-level = objetivo de usuario, kite-level = objetivo corporativo, fish-level = sub-función), la distinción entre **flujo principal**, **extensiones** y **variantes**, y el formato de tabla estructurada que el MetodologIA Framework adopta como formato Cockburn. Cockburn también introduce el concepto de **stakeholder interests** — cada caso de uso debe ser evaluado desde los intereses de todos los stakeholders, no solo del actor primario.

### 2.3 User Stories + Criterios de Aceptación — Kent Beck / Mike Cohn
En el espectro ágil, los User Stories (Beck, XP, 1999; Cohn, *User Stories Applied*, 2004) son una alternativa ligera al formato Cockburn. El template `Como [rol], quiero [acción], para [beneficio]` captura la perspectiva del usuario con mínima fricción. Los **criterios de aceptación** en formato Gherkin (`Given/When/Then`) conectan la historia con la prueba automatizada, cerrando el ciclo especificación-validación. El MetodologIA Framework adopta criterios de aceptación per-módulo como sección obligatoria.

### 2.4 Reglas de Negocio — Ronald Ross / BRMS
Ronald Ross (*Principles of the Business Rule Approach*, 2003) distingue entre **términos** (vocabulario del negocio), **hechos** (relaciones entre términos) y **reglas** (constrains sobre hechos). Las Business Rule Management Systems (BRMS) como Drools o IBM ODM separan las reglas del código, haciéndolas mantenibles por el negocio. El MetodologIA Framework captura la severidad (CRITICAL, HIGH, MEDIUM, LOW), la lógica de validación, y el estado (VALIDATED / UNVALIDATED) para cada regla.

### 2.5 Domain-Driven Design — Eric Evans
Eric Evans (*Domain-Driven Design*, 2003) aporta el **Ubiquitous Language** — el lenguaje compartido entre negocio y tecnología que debe impregnar la especificación. Los **Bounded Contexts**, **Aggregates**, **Entities** y **Value Objects** se reflejan en el modelo de datos de la spec. El concepto de **invariants** (reglas que nunca deben violarse dentro de un aggregate) tiene correspondencia directa con las business rules de severidad CRITICAL.

### 2.6 Metodología RUP — Caso de Uso como Arquitectura
El Rational Unified Process (Kruchten, 2000) posiciona los casos de uso como el vector de arquitectura: los **architecturally significant use cases** son los que determinan las decisiones estructurales del sistema. Esta perspectiva justifica la presencia de la matriz de complejidad/riesgo en la spec — priorizar los use cases de alto riesgo técnico es tanto una decisión de especificación como una decisión de arquitectura.

---

## 3. Obras Seminales

| Obra | Autor(es) | Año | Aporte Central |
|------|-----------|-----|---------------|
| *Writing Effective Use Cases* | Alistair Cockburn | 2000 | Formato estructurado de casos de uso, niveles de meta, flujos |
| *User Stories Applied* | Mike Cohn | 2004 | User stories ágiles, criterios de aceptación, épicas |
| *Domain-Driven Design* | Eric Evans | 2003 | Ubiquitous Language, Bounded Contexts, invariants |
| *Principles of the Business Rule Approach* | Ronald G. Ross | 2003 | Taxonomía de reglas, separación regla/proceso |
| *Requirements Engineering* | Ian Sommerville | 2011 | Elicitación, análisis, validación, gestión de requisitos |
| *Agile Estimating and Planning* | Mike Cohn | 2005 | Story points, planning poker, estimación de backlog |
| *IEEE 29148: Systems and Software Engineering — Life Cycle Processes — Requirements Engineering* | IEEE | 2018 | Estándar moderno de SRS |
| *Software Requirements* | Karl Wiegers, Joy Beatty | 2013 | Técnicas de elicitación, documento de requisitos, trazabilidad |
| *Behavior-Driven Development* | Dan North | 2006 | Gherkin, Given/When/Then, especificación ejecutable |

---

## 4. Metodologías de Elicitación de Requisitos

### 4.1 Entrevistas Estructuradas y Semi-estructuradas
La entrevista con stakeholders es la técnica más efectiva para capturar requisitos tácitos. El MetodologIA Discovery Framework los recoge durante Phase 0 (Stakeholder Map) y Phase 1 (AS-IS Analysis), alimentando directamente la especificación funcional de Phase 5a.

### 4.2 Event Storming (Alberto Brandolini)
Técnica de modelado colaborativo que parte de los **Domain Events** para descubrir bounded contexts, comandos, políticas y modelos de lectura. Produce una vista visual del sistema que mapea directamente a casos de uso y reglas de negocio. Altamente efectiva para sistemas de alta complejidad de dominio.

### 4.3 Impact Mapping (Gojko Adzic)
Conecta objetivos de negocio con actores, impactos y entregables. Ayuda a priorizar qué casos de uso maximizan el impacto en los objetivos estratégicos, informando la selección del MVP scope (Section 5 de la spec).

### 4.4 Job Stories (Intercom)
Alternativa a User Stories que enfatiza el contexto situacional: `Cuando [situación], quiero [motivación], para [resultado esperado]`. Útil para casos de uso donde el contexto determina el comportamiento del sistema.

### 4.5 Análisis de Flujo de Valor (VSM)
Identifica los pasos del proceso de negocio que generan valor y los que generan desperdicio. Los flows de la Phase 2 del MetodologIA Framework (Mapeo de Flujos) alimentan directamente los flujos principales y alternativos de los casos de uso.

---

## 5. Herramientas y Notaciones

| Herramienta | Categoría | Uso en Spec Funcional |
|-------------|-----------|----------------------|
| Mermaid / PlantUML | Diagramación | ER, sequence, flowchart para flujos de use case y modelo de datos |
| Gherkin (Cucumber/Behave) | Especificación ejecutable | Criterios de aceptación en formato Given/When/Then |
| OpenAPI / AsyncAPI | Contratos de API | Integration specs (Section 8) |
| BPMN 2.0 | Modelado de procesos | Flujos alternativos y excepciones de alta complejidad |
| Decision Tables / DMN | Reglas de negocio complejas | Tablas de decisión para business rules con múltiples condiciones |
| IEEE 29148 Template | Estructura de documento | Base para organización de la spec |
| Confluence / Notion | Repositorio vivo | Spec colaborativa con links bidireccionales |
| Jira / Linear | Trazabilidad | Vincular user stories → use cases → criterios de aceptación |

---

## 6. Patrones y Anti-Patrones

### Patrones Probados

**Patrón: Spec-by-Example**
Acompañar cada caso de uso con un ejemplo concreto de datos de entrada y salida esperada. Elimina la ambigüedad y facilita el diseño de pruebas. Técnica popularizada por Gojko Adzic en *Specification by Example* (2011).

**Patrón: Business Rule Externalización**
Extraer las reglas de negocio del cuerpo de los casos de uso y documentarlas en un catálogo separado con IDs únicos. Permite la reutilización y el mantenimiento independiente.

**Patrón: Scope Fence**
Documentar explícitamente qué está OUT del MVP con la justificación de cada exclusión. Previene el scope creep al convertir cada solicitud de cambio en una negociación contra la lista de exclusiones.

**Patrón: UNVALIDATED Flag**
Marcar toda regla de negocio no validada por un stakeholder como UNVALIDATED con un flag de riesgo. Convierte la falta de validación en un artefacto visible, no en un silencio peligroso.

### Anti-Patrones Comunes

**Anti-patrón: Spec-as-Code**
Escribir cómo el sistema debe implementarse en lugar de qué debe hacer. Viola la separación QUÉ/CÓMO y acopla la spec a decisiones técnicas que pueden cambiar.

**Anti-patrón: Happy Path Only**
Documentar solo el flujo principal exitoso, omitiendo alternativas y excepciones. El 80% de los defectos de producción ocurren en los flujos alternativos no especificados.

**Anti-patrón: Monolith Use Case**
Un único caso de uso con más de 10 flujos alternativos y múltiples actores. Señal de que el dominio debe descomponerse en sub-casos de uso o sub-módulos.

**Anti-patrón: Implicit Business Rules**
Reglas de negocio que viven solo en el código o en la cabeza del desarrollador. Fuente de deuda técnica y de retrabajo cuando el negocio cambia.

---

## 7. Gestión de Calidad de la Especificación

### Atributos de Calidad de una Spec Funcional (IEEE 29148)

| Atributo | Definición | Indicador de Violación |
|----------|-----------|----------------------|
| **Correcto** | Refleja fielmente las necesidades del negocio | Diferencias entre spec y comportamiento esperado por stakeholder |
| **Completo** | Cubre todos los comportamientos del sistema | Casos de uso sin flujos de excepción, módulos sin use cases |
| **No ambiguo** | Una sola interpretación posible | Palabras como "rápido", "grande", "generalmente" sin cuantificar |
| **Consistente** | Sin contradicciones entre requisitos | Business rules que se contradicen entre sí |
| **Verificable** | Criterios de aceptación comprobables | "El sistema debe ser amigable" — no verificable |
| **Trazable** | Cada requisito linked a una necesidad y a una prueba | Use cases sin business rule IDs; reglas sin módulo |
| **Priorizado** | Distingue must-have de nice-to-have | Todos los use cases marcados como "High" priority |

### Técnicas de Inspección

- **Revisión basada en perspectivas (PBR)**: Revisor asume rol de usuario, desarrollador, o tester para detectar gaps desde distintos ángulos.
- **Walkthrough**: Autor guía a stakeholders a través de la spec para detectar malentendidos en tiempo real.
- **Checklists de calidad**: Lista estandarizada de preguntas para cada sección (¿tiene el caso de uso precondiciones? ¿tiene al menos 2 flujos alternativos?).

---

## 8. Cross-Referencias con Otras Fases del MetodologIA Framework

| Fase del Framework | Relación con Functional Spec |
|-------------------|------------------------------|
| **Phase 1 — AS-IS Analysis** | Provee el inventario de sistemas existentes que alimenta las integration specs (Section 8) y el contexto de los flujos actuales para diseñar los flujos de los use cases |
| **Phase 2 — Mapeo de Flujos (DDD)** | Los flujos E2E y Domain Events se traducen directamente a flujos principales y alternativos de los casos de uso |
| **Phase 3 — Escenarios (ToT)** | El escenario aprobado delimita el scope del MVP (Section 5) y determina qué módulos entran en la spec |
| **Phase 4 — Solution Roadmap** | La matriz de complejidad/riesgo (Section 4) debe ser consistente con las estimaciones del roadmap; los prereq items de la Phase 4 alimentan la sección de integraciones |
| **Phase 5b — Pitch Ejecutivo** | La spec funcional es la evidencia técnica que respalda las afirmaciones del pitch; comparten los módulos MVP y el scope definition |
| **Phase 6 — Discovery Handover** | El handover referencia la spec para el plan de 90 días (Sprint 1-3 implementa módulo MVP #1) y para los use cases críticos que valida Sprint 1-3 |
| **skill: discovery-handover** | Consume los módulos, use cases y business rules de la spec para construir el plan operativo de ejecución |
| **skill: asis-analysis** | Provee el input de sistemas actuales, integraciones y pain points que se reflejan en los flujos de excepción y las reglas de negocio |
| **skill: scenarios** | El escenario seleccionado define el perímetro del MVP que la spec documenta en detalle |

---

**Autor:** Javier Montaño | **Framework:** MetodologIA Discovery Framework | **© Comunidad MetodologIA**

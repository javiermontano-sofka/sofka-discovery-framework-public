---
name: testing-strategy-body-of-knowledge
description: Cuerpo de conocimiento canónico para la skill de Testing Strategy — fuentes, frameworks, estándares y literatura de referencia.
fecha: 13 de marzo de 2026
autor: Javier Montaño
copyright: © Comunidad MetodologIA
---

# Body of Knowledge: Testing Strategy

## TL;DR

- **5 fuentes primarias** que definen el estado del arte en estrategia de testing.
- Cubre desde TDD/BDD hasta contract testing, property-based testing y mutation testing.
- Incluye frameworks de certificación (ISTQB), prácticas de entrega continua y patrones avanzados.
- Cada fuente se conecta con secciones específicas del SKILL.md para trazabilidad directa.

---

## 1. Growing Object-Oriented Software, Guided by Tests

| Campo | Valor |
|-------|-------|
| **Autores** | Steve Freeman, Nat Pryce |
| **Año** | 2009 |
| **Editorial** | Addison-Wesley |
| **ISBN** | 978-0321503626 |

### Contribución al Skill

Este libro establece la filosofía fundamental de TDD outside-in: los tests guían el diseño, no lo verifican después. El concepto de "walking skeleton" (un sistema end-to-end mínimo que compila y pasa tests) es la base para la sección S1 (Test Shape Selection) y la decisión de test-first vs. test-after.

### Conceptos clave aplicados

- **Test-driven development outside-in:** Escribir el test de aceptación primero, luego bajar a unit tests. Diseño emergente guiado por necesidades reales.
- **Mock objects como herramienta de diseño:** Los mocks no son stubs — revelan interfaces faltantes. Si un mock es complejo, el diseño está acoplado.
- **Walking skeleton:** Infraestructura E2E mínima desde el día 1. Valida que el pipeline funciona antes de agregar funcionalidad.
- **Tell, don't ask:** Tests que verifican comportamiento (mensajes enviados), no estado interno. Reduce fragilidad.

### Conexión con secciones SKILL.md

- S1: Fundamenta la decisión TDD para lógica de negocio compleja
- S2: Patrón de walking skeleton para setup de infraestructura de test
- S6: Base teórica para mutation testing (tests que no pueden fallar no protegen)

---

## 2. xUnit Test Patterns: Refactoring Test Code

| Campo | Valor |
|-------|-------|
| **Autor** | Gerard Meszaros |
| **Año** | 2007 |
| **Editorial** | Addison-Wesley |
| **ISBN** | 978-0131495050 |

### Contribución al Skill

La referencia definitiva para patrones y anti-patrones en código de test. Define el vocabulario canónico (test double, test fixture, test smell) que usa toda la industria. Fundamental para S2 (Test Automation Framework) y S5 (Test Data Management).

### Conceptos clave aplicados

- **Test doubles taxonomy:** Dummy, stub, spy, mock, fake — cada uno con propósito distinto. Usar el correcto reduce fragilidad.
- **Fixture management:** Setup/teardown, fresh fixture (ideal), shared fixture (peligroso). Base para la política de aislamiento de datos en S5.
- **Test smells:** Fragile test, obscure test, slow test, erratic test. El catálogo de smells alimenta la gestión de flaky tests en S6.
- **Four-phase test:** Setup, exercise, verify, teardown. Estructura canónica para legibilidad.
- **Testcase superclass pattern:** Reutilización de setup sin shared mutable state.

### Conexión con secciones SKILL.md

- S2: Patrones de Page Object Model y test data factories derivan directamente de fixture patterns
- S5: Estrategia de datos basada en fresh fixture vs. shared fixture
- S6: Flaky test management usa la taxonomía de test smells

---

## 3. ISTQB — International Software Testing Qualifications Board

| Campo | Valor |
|-------|-------|
| **Organización** | ISTQB |
| **Syllabus** | Foundation Level v4.0 (2023), Advanced Test Analyst, Advanced Test Manager |
| **URL** | https://www.istqb.org |

### Contribución al Skill

ISTQB proporciona el vocabulario estándar de la industria para niveles de testing, técnicas de diseño de tests y gestión del proceso de calidad. Su modelo de niveles (unit, integration, system, acceptance) complementa el enfoque pragmático de test pyramid/trophy.

### Conceptos clave aplicados

- **Niveles de testing:** Component (unit), component integration, system, system integration, acceptance. Mapeo directo a capas de la pirámide.
- **Técnicas de diseño de tests:** Equivalence partitioning, boundary value analysis, decision tables, state transition. Fundamentan test case design en S2.
- **Tipos de testing:** Functional, non-functional, structural, change-related. Marco para clasificación en S1.
- **Test process:** Planning, monitoring, analysis, design, implementation, execution, completion. Estructura de gestión para quality gates en S6.
- **Risk-based testing:** Priorización basada en riesgo de negocio x probabilidad de fallo. Alimenta ROI-based prioritization en S1.

### Conexión con secciones SKILL.md

- S1: Risk-based testing para priorización ROI
- S2: Técnicas de diseño de test cases
- S6: Quality gates y proceso de gestión de testing

---

## 4. Continuous Delivery: Reliable Software Releases through Build, Test, and Deploy Automation

| Campo | Valor |
|-------|-------|
| **Autores** | Jez Humble, David Farley |
| **Año** | 2010 |
| **Editorial** | Addison-Wesley |
| **ISBN** | 978-0321601919 |

### Contribución al Skill

Define el deployment pipeline y cómo el testing se integra en cada etapa. El concepto de "keep the build green" y la automatización progresiva de tests son la base de S2 (CI Integration) y la filosofía shift-left de S1.

### Conceptos clave aplicados

- **Deployment pipeline:** Commit stage (unit), acceptance stage (integration + E2E), production stage. Mapeo directo a CI trigger mapping en S2.
- **Commit tests:** <10 minutos, corren en cada push. El presupuesto de velocidad para unit tests.
- **Acceptance tests:** Tests funcionales automatizados que validan comportamiento del sistema. Base para E2E strategy.
- **Configuration as code:** Infraestructura de test reproducible. Conecta con Testcontainers y ephemeral environments en S5.
- **Feature toggles para testing:** Decouple deployment de release. Permite testing en producción de forma segura.
- **Blue-green deployments:** Verificación en producción con rollback instantáneo. Base para chaos testing en S4.

### Conexión con secciones SKILL.md

- S1: Shift-left strategy y deployment pipeline stages
- S2: CI trigger mapping (unit on push, integration on PR, E2E on merge)
- S4: Performance testing en CI y chaos engineering
- S5: Ephemeral environments per PR

---

## 5. BDD in Action: Behavior-Driven Development for the Whole Software Lifecycle

| Campo | Valor |
|-------|-------|
| **Autor** | John Ferguson Smart |
| **Año** | 2014 (1st ed.), 2023 (2nd ed.) |
| **Editorial** | Manning |
| **ISBN** | 978-1617291654 |

### Contribución al Skill

Extiende TDD al nivel de negocio: los tests expresan comportamiento en lenguaje natural (Gherkin). BDD no es solo una herramienta — es un proceso de descubrimiento que conecta stakeholders con developers a través de especificaciones ejecutables.

### Conceptos clave aplicados

- **Discovery workshops:** Conversaciones estructuradas entre negocio y desarrollo. "Example mapping" para descubrir reglas, ejemplos y preguntas.
- **Living documentation:** Los tests BDD son la especificación actualizada del sistema. Eliminan documentación duplicada.
- **Given-When-Then:** Estructura que fuerza claridad en precondiciones, acciones y resultados esperados.
- **Screenplay pattern:** Evolución del Page Object Model. Actors perform tasks using abilities. Mejor composición y legibilidad para E2E.
- **Serenity BDD:** Framework que genera reportes de living documentation desde tests automatizados.

### Conexión con secciones SKILL.md

- S1: BDD como metodología para test-first en acceptance testing
- S2: Screenplay pattern como alternativa avanzada a Page Object Model
- S3: BDD scenarios como contratos de comportamiento entre equipos

---

## Fuentes Complementarias

| Fuente | Autor(es) | Relevancia |
|--------|-----------|------------|
| *Test-Driven Development by Example* | Kent Beck (2002) | TDD canónico — red-green-refactor, baby steps |
| *Working Effectively with Legacy Code* | Michael Feathers (2004) | Characterization tests, seams para testability |
| *The Art of Unit Testing* | Roy Osherove (3rd ed. 2024) | Unit testing patterns modernos, mocking strategies |
| *Pact Documentation* | Pact Foundation | Contract testing consumer-driven — referencia técnica |
| *Testing Library docs* | Kent C. Dodds | Testing Trophy, "test as user does" philosophy |
| *Chaos Engineering* | Casey Rosenthal et al. (2020) | Principios de chaos engineering, Game Days |
| *Software Engineering at Google* | Winters, Manshreck, Wright (2020) | Test infrastructure a escala, flaky test management |

---

## Mapa de Cobertura: Fuentes → Secciones SKILL.md

| Sección | Fuentes Primarias | Fuentes Complementarias |
|---------|-------------------|------------------------|
| S1: Test Shape Selection | Freeman/Pryce, ISTQB, Humble/Farley | Beck, Testing Library |
| S2: Test Automation Framework | Meszaros, Smart, Humble/Farley | Osherove, Google SWE |
| S3: Contract & API Testing | Smart, Humble/Farley | Pact Foundation |
| S4: Performance & Chaos Testing | Humble/Farley | Rosenthal |
| S5: Test Data Management | Meszaros, Humble/Farley | Feathers |
| S6: Advanced Techniques & Quality | Freeman/Pryce, ISTQB, Meszaros | Google SWE, Beck |

---

**Autor:** Javier Montaño | **Fecha:** 13 de marzo de 2026 | **© Comunidad MetodologIA**

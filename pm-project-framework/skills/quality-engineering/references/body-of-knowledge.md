# Body of Knowledge — Quality Engineering

Corpus de conocimiento curado que fundamenta las decisiones de estrategia de calidad, automatización y quality gates. Cada fuente está clasificada por dominio, relevancia y aplicabilidad dentro del framework de 6 secciones del skill.

---

## Fuentes Primarias

### Libros Fundamentales

| # | Fuente | Autor(es) | Año | Dominio | Secciones Relacionadas |
|---|--------|-----------|-----|---------|----------------------|
| 1 | **Continuous Delivery: Reliable Software Releases through Build, Test, and Deployment Automation** | Jez Humble, David Farley | 2010 (clásico vigente) | CI/CD, deployment pipeline, test automation | S3, S4, S6 |
| 2 | **Accelerate: The Science of Lean Software and DevOps** | Nicole Forsgren, Jez Humble, Gene Kim | 2018 | DORA metrics, high-performance teams | S1, S5 |
| 3 | **Software Engineering at Google: Lessons Learned from Programming Over Time** | Titus Winters, Tom Manshreck, Hyrum Wright | 2020 | Testing at scale, code review, CI | S2, S3, S4 |
| 4 | **Agile Testing: A Practical Guide for Testers and Agile Teams** | Lisa Crispin, Janet Gregory | 2009 (2nd ed. 2014) | Test strategy, agile quality practices | S1, S2 |
| 5 | **The Art of Software Testing** | Glenford J. Myers, Corey Sandler, Tom Badgett | 2012 (3rd ed.) | Fundamentos de testing, técnicas | S2 |

### Estándares y Frameworks

| # | Fuente | Organización | Relevancia |
|---|--------|-------------|-----------|
| 6 | **ISO/IEC 25010:2023 — Product Quality Model** | ISO/IEC | 8 características de calidad de producto: functional suitability, performance efficiency, compatibility, usability, reliability, security, maintainability, portability |
| 7 | **ISTQB Foundation Level Syllabus v4.0** | ISTQB | Vocabulario estándar de testing, niveles de prueba, técnicas, gestión de defectos |
| 8 | **ISTQB Advanced Level — Test Automation Engineer** | ISTQB | Arquitectura de automatización, patrones, mantenibilidad, reporting |
| 9 | **DORA State of DevOps Report (2024)** | Google / DORA | 4 métricas clave (deployment frequency, lead time, MTTR, change failure rate), benchmarks por categoría |
| 10 | **Site Reliability Engineering (SRE Book)** | Google (Betsy Beyer et al.) | SLOs, SLIs, error budgets, monitoring, incident management |

### Documentación de Herramientas

| # | Herramienta | Tipo | Uso en el Skill |
|---|-----------|------|----------------|
| 11 | **Pact Documentation** | OSS — Contract testing | S2: consumer-driven contract testing para microservicios |
| 12 | **Testcontainers Documentation** | OSS — Test infrastructure | S3: integration tests con contenedores reales (DB, message brokers) |
| 13 | **SonarQube Documentation** | OSS/Comercial — Static analysis | S3: quality gates en CI, coverage, code smells, security |
| 14 | **Playwright Documentation** | OSS — E2E testing | S3: automatización E2E cross-browser, API testing |
| 15 | **k6 / Grafana Documentation** | OSS — Performance testing | S3: load testing, stress testing, performance baselines |
| 16 | **Cypress Documentation** | OSS — E2E testing | S3: testing E2E con developer experience superior |
| 17 | **WireMock Documentation** | OSS — Service virtualization | S3: mocking de servicios externos, testing en aislamiento |

---

## Mapping: Fuentes → Secciones del Skill

| Sección | Fuentes Clave | Conceptos Fundamentales |
|---------|---------------|------------------------|
| **S1: Quality Maturity Assessment** | Accelerate, DORA Report, ISTQB Syllabus | Modelo de 5 niveles, benchmarks DORA, dimensiones de madurez |
| **S2: Test Strategy** | Agile Testing, SE at Google, ISO 25010 | Pyramid vs diamond, test types, test data strategy, ownership |
| **S3: Automation Architecture** | Continuous Delivery, ISTQB Test Automation, Testcontainers, Pact | Framework selection, design patterns, CI/CD stages, contract testing |
| **S4: Quality Gates** | Continuous Delivery, SRE Book | Gate enforcement, pass criteria, timeout policies, bypass audit |
| **S5: Quality Metrics** | Accelerate, DORA Report, SRE Book | Leading/lagging indicators, DORA metrics, dashboard design, SLOs |
| **S6: Implementation Plan** | Agile Testing, Accelerate | Fases de implementación, quick wins, criterios de éxito |

---

## Frameworks Conceptuales Adoptados

### 1. Test Pyramid / Diamond (Architecture-Driven Shape)

Adoptado en S2. La forma de la distribución de tests depende de la arquitectura:
- **Monolito → Pyramid:** Unit-heavy (55%), menos E2E
- **Microservicios → Diamond:** Integration-heavy (40%), contract testing (30%)

Fuente: Martin Fowler (Test Pyramid), adaptado por el skill con porcentajes específicos por arquitectura.

### 2. DORA Metrics (Accelerate)

Adoptado en S1 y S5 como benchmark de referencia:
- Deployment Frequency, Lead Time for Changes, Mean Time to Recovery, Change Failure Rate
- Categorías: Elite, High, Medium, Low

### 3. SLO/SLI Framework (Google SRE)

Adoptado en S4 y S5 para vincular calidad con objetivos de confiabilidad:
- SLIs definen qué medir
- SLOs definen el target
- Error budgets definen cuánto fallo es aceptable

### 4. Shift-Left Model

Principio transversal: cada defecto encontrado post-merge cuesta 10-100x más. Pre-commit hooks, developer-owned tests, PR gates como inversión.

### 5. Quality Gate Pipeline (Continuous Delivery)

5 stages adoptados en S3 y S4: commit gate → PR gate → nightly gate → release gate → production gate. Cada gate con criterios medibles, timeout y escalation.

---

## Criterios de Selección de Fuentes

Cada fuente incluida cumple al menos 3 de estos 5 criterios:

1. **Autoridad reconocida** — autor o organización referente en el dominio
2. **Aplicabilidad práctica** — contiene patrones, checklists o frameworks implementables
3. **Vigencia** — principios vigentes aunque el libro no sea reciente (Continuous Delivery sigue siendo referencia)
4. **Relevancia para el skill** — mapea directamente a una o más secciones del skill
5. **Complementariedad** — cubre un ángulo no cubierto por otras fuentes

---

## Lecturas Complementarias

| Fuente | Tema | Nivel |
|--------|------|-------|
| **Testing Strategies in a Microservice Architecture** (Toby Clemson, Martin Fowler blog) | Contract testing, test shapes para microservicios | Técnico |
| **Test Pyramid Revisited** (Ham Vocke, Martin Fowler blog) | Actualización del concepto de test pyramid | Introductorio |
| **Chaos Engineering** (Casey Rosenthal, Nora Jones) | Resiliencia, fault injection, game days | Avanzado |
| **OWASP Testing Guide v4.2** | Security testing methodology | Técnico |
| **Performance Testing Guidance for Web Applications** (Microsoft) | Load testing, capacity planning | Técnico |

---

**Autor:** Javier Montaño | **Fecha:** 13 de marzo de 2026 | **Versión:** 1.0
**Licencia:** Todos los derechos reservados, Comunidad MetodologIA

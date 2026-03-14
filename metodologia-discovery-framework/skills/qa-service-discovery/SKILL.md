---
name: qa-service-discovery
description: >
  QA-as-a-Service discovery — quality maturity assessment (TMMi), test coverage analysis, tool landscape
  evaluation, independent testing alignment (PDCA + ISTQB), team composition modeling, test factory design,
  and QA transformation roadmap.
  Use when the user asks to "assess QA maturity", "evaluate testing practices", "QA service discovery",
  "test factory design", "TMMi assessment", "QA transformation", "testing maturity evaluation",
  "independent testing model", "QA team composition", "test automation assessment", "quality engineering assessment",
  or mentions "independent testing", "QA-as-a-Service", "test industrialization", "ISTQB".
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# QA Service Discovery — Quality Maturity Assessment & Transformation Roadmap

Genera un assessment de 7 secciones para servicios de QA: evaluacion de madurez de calidad (TMMi), analisis de cobertura de testing, evaluacion del landscape de herramientas, alineacion con modelo de testing independiente (basado en PDCA + ISTQB Test Process), modelado de composicion de equipo, diseno de test factory, y roadmap de transformacion de QA. Orientado a construir servicios de calidad que prevengan defectos, no solo los detecten.

## Principio Rector

> *La calidad no se inspecciona al final — se construye desde el principio. Un servicio de QA que solo encuentra bugs es un servicio incompleto; el verdadero valor esta en prevenirlos.*

1. **Shift-left no es un eslogan — es una estrategia medible.** Cada defecto encontrado en produccion costo 100x mas que uno encontrado en requerimientos (Boehm, 1981; NIST 2002). El assessment mide donde se encuentran los defectos en el ciclo de vida y cuanto se puede mover hacia la izquierda.
2. **La automatizacion de tests sin estrategia es un costo, no una inversion.** Tests automatizados fragiles, lentos o irrelevantes consumen mas de lo que aportan. El assessment evalua no solo el ratio de automatizacion sino la calidad y mantenibilidad del suite automatizado.
3. **El testing independiente es un habilitador, no un obstaculo.** La separacion de responsabilidades entre desarrollo y QA no crea friction — crea accountability. Un modelo de testing independiente correctamente implementado acelera releases, no los frena.

## Inputs

- `$1` — Path to QA documentation or project workspace (default: current working directory)
- `$2` — Analysis depth: `full` (default), `executive` (S1, S2, S7 only)

Parse from `$ARGUMENTS`.

**Parameters:**
- `{MODO}`: `piloto-auto` (default) | `desatendido` | `supervisado` | `paso-a-paso`
  - **piloto-auto**: Auto para analisis de cobertura y herramientas, HITL para evaluacion de madurez y decisiones de equipo.
  - **desatendido**: Cero interrupciones. Analisis completo automatizado. Supuestos documentados.
  - **supervisado**: Autonomo con reportes al completar cada seccion.
  - **paso-a-paso**: Confirma antes de cada seccion del analisis.
- `{FORMATO}`: `markdown` (default) | `html` | `dual`
- `{VARIANTE}`: `ejecutiva` (~40% — S1, S2, S7 only) | `tecnica` (full, default)
- `{TIPO_SERVICIO}`: `QA` (fixed for this skill)

If reference materials exist, load them:

```
Read ${CLAUDE_SKILL_DIR}/references/
```

## Input Requirements

**Mandatory:**
- Documentacion de procesos de QA (test plans, test strategies)
- Inventario de herramientas de testing actuales
- Metricas de defectos (detection rate, escape rate, density)
- Estructura del equipo de QA actual

**Recommended:**
- Test automation suite (acceso a repositorio de tests)
- CI/CD pipeline configuration
- Historico de releases y defectos (12+ meses)
- Resultados de auditorias de calidad previas
- Certificaciones del equipo (ISTQB, etc.)

## Assumptions & Limits

**Assumptions:**
- Existe un proceso de testing definido (aunque sea informal)
- Hay acceso a metricas basicas de defectos
- El equipo de QA es identificable (roles dedicados o compartidos)
- La organizacion busca mejorar su capacidad de quality engineering

**Cannot do:**
- Ejecutar tests en el ambiente del cliente (requiere acceso a infraestructura)
- Evaluar performance de herramientas en uso (requiere benchmarking en vivo)
- Realizar auditorias formales de certificacion TMMi (requiere assessor certificado por TMMi Foundation)
- Entrevistar individualmente a cada miembro del equipo

## Workarounds When Inputs Missing

| Missing Input | Impact | Workaround |
|---|---|---|
| No test plans | Cannot assess test strategy maturity | Inferir de codigo de tests y CI/CD config; flag como [INFERENCIA] |
| No defect metrics | Cannot quantify quality baseline | Analisis de code quality como proxy; recomendar implementacion de metricas |
| No tool inventory | Cannot evaluate tool landscape | Detectar de CI/CD pipelines y repositorios; flag como [INFERENCIA] |
| No team structure | Cannot model composition | Inferir de commits, PR reviews, tool access; flag como [SUPUESTO] |
| No automation suite | Cannot assess automation maturity | Flag como gap critico; recomendar estrategia de automatizacion |

## Edge Cases

- **No hay equipo de QA dedicado:** Evaluar testing como responsabilidad distribuida en desarrollo. Flag como riesgo y oportunidad.
- **Solo testing manual:** Calcular costo de oportunidad. Priorizar automatizacion por riesgo de regresion.
- **Multiples equipos de QA (por producto):** Evaluar consistencia entre equipos. Identificar oportunidades de estandarizacion.
- **Outsourcing de QA existente:** Evaluar vendor actual con criterios objetivos. Analizar gaps y opciones de transicion.
- **Regulacion especifica (pharma, fintech):** Elevar requisitos de documentacion, trazabilidad y validacion. Mapear compliance requirements.
- **>500 test cases sin mantenimiento:** Flag deuda de tests. Evaluar relevancia vs costo de mantenimiento. Recomendar rationalizacion.

## Trade-off Matrix

| Decision | Enables | Constrains | When to Use |
|---|---|---|---|
| **Full 7-section analysis** | Maximum depth, complete transformation plan | 5-7 dias, alto consumo de tokens | QA transformation programs, test factory setup |
| **Executive variant** (S1+S2+S7) | Quick maturity snapshot, decision-ready | No incluye herramientas, equipo ni factory design | Business case para QA investment |
| **TMMi-focused** (S1 deep) | Certification roadmap | Menor profundidad en cobertura y herramientas | Organizaciones buscando certificacion TMMi |
| **Automation-focused** (S2+S3 deep) | Automation strategy and tool selection | Menos contexto de madurez organizacional | Kick-off de programa de test automation |

## 7-Section Framework

### S1: Quality Maturity Model Assessment (TMMi)

Evaluacion contra los 5 niveles de TMMi (Test Maturity Model integration), framework publico de la TMMi Foundation.

**Niveles TMMi:**

| Nivel | Nombre | Caracteristicas |
|---|---|---|
| L1 | Initial | Testing ad-hoc, no proceso definido, dependiente de individuos |
| L2 | Managed | Testing planificado por proyecto, test plans basicos, defect tracking |
| L3 | Defined | Proceso de testing organizacional, test design techniques, peer reviews |
| L4 | Measured | Metricas de calidad cuantitativas, statistical process control, product quality evaluation |
| L5 | Optimization | Mejora continua basada en datos, defect prevention, quality control |

**Assessment por area de proceso (TMMi Foundation):**
- Test Policy & Strategy
- Test Planning
- Test Monitoring & Control
- Test Design & Execution
- Test Environment
- Non-functional Testing
- Peer Reviews

**Entregable:** Nivel actual con evidencia por area de proceso. Gap analysis hacia nivel objetivo.

### S2: Test Coverage Analysis

Analisis de cobertura de testing por multiples dimensiones.

**Cobertura por tipo:**

| Tipo | Cobertura Actual | Target | Gap |
|---|---|---|---|
| Functional | ...% | ...% | ... |
| Non-functional | ...% | ...% | ... |
| Regression | ...% | ...% | ... |
| Performance | ...% | ...% | ... |
| Security | ...% | ...% | ... |

**Cobertura por capa (piramide de testing):**

| Capa | Tests | Automatizados | Manual | Ratio |
|---|---|---|---|---|
| Unit | ... | ... | ... | ...% |
| Integration | ... | ... | ... | ...% |
| API | ... | ... | ... | ...% |
| E2E | ... | ... | ... | ...% |

**Cobertura por nivel de riesgo:**
- Critico: ...% cobertura
- Alto: ...% cobertura
- Medio: ...% cobertura
- Bajo: ...% cobertura

**Automation ratio:** % de tests automatizados vs total. Trend analysis si hay historico.

### S3: Tool Landscape Assessment

Evaluacion de herramientas actuales vs recomendadas (todas open-source o de amplia adopcion).

**Categorias de herramientas:**

| Categoria | Herramienta Actual | Madurez (1-5) | Adopcion (%) | Recomendacion |
|---|---|---|---|---|
| Test Management | ... | ... | ... | TestRail, Zephyr, Xray, qTest |
| Automation Framework | ... | ... | ... | Selenium, Cypress, Playwright, Appium |
| CI/CD Integration | ... | ... | ... | Jenkins, GitHub Actions, GitLab CI |
| Performance Testing | ... | ... | ... | JMeter, Gatling, k6, Locust |
| Security Testing | ... | ... | ... | OWASP ZAP, SonarQube, Trivy |
| API Testing | ... | ... | ... | Postman, RestAssured, Karate |
| Mobile Testing | ... | ... | ... | Appium, Detox, XCUITest, Espresso |
| Accessibility Testing | ... | ... | ... | axe-core, pa11y, Lighthouse |

**Criterios de evaluacion:**
- Madurez del producto (estabilidad, roadmap, comunidad open-source)
- Integracion con stack existente
- Curva de aprendizaje
- Costo de propiedad (licencias vs open-source, infraestructura, mantenimiento)
- Soporte y ecosistema

### S4: Independent Testing Model Alignment (PDCA + ISTQB Test Process)

Evaluacion de readiness para testing independiente, basado en estandares publicos ISTQB (ISO/IEC/IEEE 29119) y ciclo PDCA.

**Niveles de independencia (ISTQB Foundation Syllabus):**

| Nivel | Descripcion | Aplica cuando |
|---|---|---|
| L0 | Mismo desarrollador testea su codigo | Solo unit testing, nunca aceptable para otros niveles |
| L1 | Otro miembro del equipo de desarrollo | Peer review, pair testing. Aceptable para integration |
| L2 | Equipo de QA dentro de la misma organizacion | Modelo interno. Riesgo de presion de timelines |
| L3 | Equipo de QA externo independiente | Independencia total. Reporte directo a governance |
| L4 | Auditor externo | Solo para compliance. No para testing operativo |

**Dimensiones de evaluacion:**

| Dimension | Score (1-5) | Evidencia |
|---|---|---|
| Separacion de concerns (dev vs QA) | ... | ... |
| Governance model | ... | ... |
| Communication protocols | ... | ... |
| Defect management process | ... | ... |
| Test artifact independence | ... | ... |
| Reporting & metrics | ... | ... |

**Modelo de interaccion de testing independiente (basado en ISTQB + PDCA):**
- **Plan:** Estrategia de test definida por QA, aprobada por stakeholders
- **Do:** Ejecucion independiente con comunicacion fluida con desarrollo
- **Check:** Metricas de calidad, defect triage conjunto, release decision basada en exit criteria
- **Act:** Retrospectivas, ajuste de estrategia, mejora de procesos

**Readiness score:** Promedio ponderado de dimensiones. >3.5 = ready for independent testing. <3.5 = requiere preparacion previa.

### S5: QA Team Composition Model

Modelado de perfiles necesarios y analisis de gaps.

**Perfiles requeridos (basado en ISTQB career paths):**

| Perfil | Cantidad | Seniority | Certificaciones | Rol |
|---|---|---|---|---|
| Test Analyst | ... | Jr/Mid/Sr | ISTQB FL/AL-TA | Diseno y ejecucion de tests funcionales |
| Automation Engineer | ... | Mid/Sr | ISTQB TAE | Desarrollo y mantenimiento de framework de automatizacion |
| Performance Tester | ... | Sr | ISTQB CT-PT | Diseno y ejecucion de tests de performance |
| Security Tester | ... | Sr | ISTQB CT-SEC / CEH | Testing de seguridad y vulnerability assessment |
| Test Manager | ... | Sr/Lead | ISTQB AL-TM | Gestion del equipo, planning, reporting |
| Quality Coach | ... | Lead | Multiple | Transformacion de calidad, coaching, mejora continua |

**Mapeo de certificaciones ISTQB (publico, administrado por ISTQB Foundation):**
- **Foundation Level:** CTFL (baseline para todos), CTFL-AT (Agile Tester)
- **Advanced Level:** CTAL-TA (Test Analyst), CTAL-TM (Test Manager), CTAL-TTA (Technical Test Analyst)
- **Specialist:** CT-TAE (Test Automation Engineer), CT-PT (Performance Testing), CT-SEC (Security Testing), CT-AI (AI Testing)
- **Expert Level:** CTEL-TM, CTEL-ITP, CTEL-TA

**Modelo de allocation:** FTE distribution por tipo de testing y fase del proyecto.

### S6: Test Factory Design

Diseno del modelo de test factory para industrializacion del testing.

**Componentes del Test Factory:**

1. **Procesos estandarizados (basados en ISO/IEC/IEEE 29119)**
   - Test strategy template
   - Test plan template
   - Test case design standards (equivalence partitioning, boundary value, decision table)
   - Defect lifecycle management
   - Release qualification checklist

2. **Governance**
   - Quality gates por fase
   - Entry/exit criteria (ISTQB standard)
   - Escalation matrix
   - Review board (periodicidad, participantes, scope)

3. **Metrics Dashboard**
   - Test execution progress
   - Defect density & trend
   - Automation ratio evolution
   - Test coverage by risk
   - Escape rate (defectos en produccion post-release)
   - Cost of quality (prevention vs detection vs failure — modelo PAF)

4. **Frameworks estandarizados (open-source)**
   - Automation framework architecture (Page Object, Screenplay pattern)
   - Data management strategy (test data, environments)
   - Reporting templates

5. **Knowledge Base**
   - Lessons learned repository
   - Reusable test assets
   - Best practices documentation
   - Onboarding guide para nuevos testers

6. **Mejora continua (PDCA)**
   - Retrospectivas de calidad (periodicidad)
   - Innovation time (exploratory testing, new tools evaluation)
   - Benchmarking interno y externo

### S7: QA Transformation Roadmap

Hoja de ruta de transformacion de QA en 3 horizontes.

**Horizonte 1 — Quick Wins (0-3 meses):**
- Establecer metricas baseline (defect density, escape rate, coverage)
- Implementar defect management process
- Quick automation wins (smoke tests, regression critica)
- Estandarizar test plans y templates

**Horizonte 2 — Medium-term (3-9 meses):**
- Implementar automation framework (Selenium/Cypress/Playwright)
- Shift-left initiatives (unit test coaching, static analysis con SonarQube)
- Performance testing baseline (JMeter/k6)
- Modelo de testing independiente operativo
- Training y certificacion ISTQB

**Horizonte 3 — Strategic (9-18 meses):**
- Test Factory operativo y maduro
- TMMi nivel objetivo alcanzado
- AI-augmented testing (test generation, visual testing, self-healing)
- QA as enabler de continuous delivery
- Quality engineering culture (calidad como responsabilidad de todos)

**Indicadores de magnitud de inversion (NOT prices):**
- FTE-meses por horizonte
- Licencias requeridas (cantidad, tipo — priorizar open-source)
- Infraestructura de testing (ambientes, datos)
- Capacitacion (horas-persona, certificaciones ISTQB)

> **Disclaimer obligatorio:** Las magnitudes presentadas son estimaciones basadas en drivers identificados. Los valores finales dependen de negociacion comercial, condiciones de mercado y contexto especifico de la organizacion.

## Escalation to Human Architect

- Requisitos regulatorios especificos del sector (pharma validation, fintech compliance)
- Conflictos organizacionales entre desarrollo y QA
- Decisiones de outsourcing vs insourcing de QA
- Evaluacion de herramientas con licenciamiento complejo
- Integracion con procesos de seguridad corporativos
- Transicion de vendor de QA existente

## Validation Gate

- [ ] Nivel TMMi actual identificado con evidencia por area de proceso
- [ ] Cobertura de testing analizada por tipo, capa y nivel de riesgo
- [ ] Landscape de herramientas evaluado con scores de madurez y adopcion (incluye open-source)
- [ ] Alineacion de testing independiente evaluada con readiness score (PDCA + ISTQB)
- [ ] Modelo de composicion de equipo con perfiles, certificaciones ISTQB y allocation
- [ ] Test factory disenado con procesos (ISO 29119), governance, metricas y frameworks
- [ ] Roadmap en 3 horizontes con milestones de madurez por fase
- [ ] Magnitudes de inversion documentadas (NUNCA precios) con disclaimer
- [ ] Evidencia tagueada con [CODIGO], [CONFIG], [DOC], [INFERENCIA], [SUPUESTO]
- [ ] Cross-references entre secciones (TMMi S1 informa roadmap S7)

## Output Artifact

**Primary:** `QA_Service_Discovery_{project}.md` — Assessment completo de 7 secciones con evaluacion de madurez TMMi, analisis de cobertura, landscape de herramientas, alineacion de testing independiente, composicion de equipo, diseno de test factory, y roadmap de transformacion de QA.

**Diagramas incluidos:**
- Radar chart de madurez TMMi por area de proceso
- Heatmap de cobertura por tipo y capa
- Modelo de interaccion de testing independiente (flowchart)
- Roadmap de transformacion (gantt)

---
**Comunidad MetodologIA** | **Licencia:** GPL-3.0 | **Ultima actualizacion:** 14 de marzo de 2026

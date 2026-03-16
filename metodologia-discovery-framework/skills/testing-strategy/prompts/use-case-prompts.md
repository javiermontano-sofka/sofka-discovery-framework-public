---
name: testing-strategy-use-case-prompts
description: Prompts de casos de uso para la skill de Testing Strategy — escenarios concretos para invocación directa.
fecha: 13 de marzo de 2026
autor: Javier Montaño
copyright: © Comunidad MetodologIA
---

# Use-Case Prompts: Testing Strategy

Prompts listos para usar en escenarios frecuentes de consultoría. Cada prompt está diseñado para activar la skill con contexto suficiente y producir entregables accionables.

---

## UC-01: Diseño de Estrategia de Testing para Proyecto Nuevo

### Contexto

Proyecto greenfield que necesita definir su arquitectura de testing desde cero. El equipo tiene experiencia variable y necesita una guía completa.

### Prompt

```
/mao:testing-strategy {PROYECTO}

Contexto: Proyecto greenfield — {DESCRIPCIÓN_BREVE}.
Stack: {LENGUAJE/FRAMEWORK} con {BASE_DE_DATOS}.
Arquitectura: {MONOLITO|MICROSERVICIOS|MODULAR_MONOLITH}.
Equipo: {N} developers, experiencia en testing: {BÁSICA|INTERMEDIA|AVANZADA}.
CI/CD: {HERRAMIENTA_CI}.
Timeline: MVP en {N} meses.

Necesito:
1. Selección de forma de pirámide (pyramid/trophy/honeycomb) justificada para esta arquitectura
2. Framework de automatización alineado con el stack y nivel del equipo
3. Coverage targets y quality gates para el MVP
4. Plan de adopción progresiva (qué primero, qué después)

{VARIANTE}=técnica
{MODO_OPERACIONAL}=arquitectura-testing
```

### Variaciones

- Agregar `{VARIANTE}=ejecutiva` para resumen de dirección técnica sin detalle de implementación
- Agregar `{MODO_OPERACIONAL}=integral` si también se necesitan métricas y quality gates detallados

---

## UC-02: Assessment de Test Pyramid Existente

### Contexto

Sistema en producción con suite de tests existente. Se necesita evaluar la salud del suite, identificar gaps y proponer mejoras.

### Prompt

```
/mao:testing-strategy {SISTEMA}

Contexto: Sistema en producción con {N_AÑOS} años.
Test suite actual:
- Unit tests: {N} tests, {FRAMEWORK}
- Integration tests: {N} tests, {FRAMEWORK}
- E2E tests: {N} tests, {FRAMEWORK}
- Coverage reportado: {X}% line coverage
- CI time: {X} minutos
- Flaky test rate: {X}%

Problemas reportados:
- {PROBLEMA_1}
- {PROBLEMA_2}
- {PROBLEMA_3}

Necesito:
1. Diagnóstico de la forma actual vs. forma ideal para este tipo de sistema
2. Gap analysis: qué niveles están sub-representados o sobre-representados
3. Plan de remediación priorizado por ROI
4. Estrategia para reducir flaky tests
5. Recomendaciones para reducir CI time sin perder confianza

{MODO_OPERACIONAL}=metricas-calidad
```

---

## UC-03: Setup de Contract Testing para Microservicios

### Contexto

Arquitectura de microservicios donde los deployments independientes causan fallos de integración en producción. Se necesita implementar contract testing.

### Prompt

```
/mao:testing-strategy {PLATAFORMA}

Contexto: Plataforma de microservicios — {N} servicios, {N} equipos.
Comunicación: {REST|gRPC|GraphQL|EVENTOS|MIXTO}.
Problema actual: Fallos de integración en producción — {FRECUENCIA}.
CI/CD: {HERRAMIENTA}.
API specs: {OPENAPI_EXISTENTE|SIN_SPEC|PARCIAL}.

Necesito:
1. Decisión: consumer-driven (Pact) vs. bi-directional vs. schema-first (Specmatic)
2. Workflow de contract testing integrado en CI/CD
3. Pact Broker / schema registry setup
4. can-i-deploy gates antes de producción
5. Plan de rollout: qué servicios primero, cómo onboardear equipos
6. Si hay eventos: contract testing para mensajes async

{VARIANTE}=técnica
{MODO_OPERACIONAL}=integral
```

### Nota

Para plataformas con comunicación mixta (REST + eventos), el prompt activará tanto S3 (Contract & API Testing) como las secciones de event contracts.

---

## UC-04: Diseño de Automatización E2E

### Contexto

Aplicación web/mobile que necesita automatización E2E para critical user journeys. El equipo quiere reemplazar testing manual con suites automatizadas.

### Prompt

```
/mao:testing-strategy {APLICACIÓN}

Contexto: {WEB_APP|MOBILE_APP|AMBAS} con {N} critical user journeys.
Stack frontend: {FRAMEWORK_FE}.
Stack mobile: {iOS|ANDROID|CROSS_PLATFORM} (si aplica).
Testing manual actual: {N} test cases, {N} horas por release.
Releases: cada {FRECUENCIA}.
Browsers requeridos: {LISTA}.

Necesito:
1. Selección de framework E2E: Playwright vs. Cypress vs. Detox/Appium
2. Patrón de organización: Page Object Model vs. Screenplay
3. Selección de critical journeys a automatizar primero (por ROI)
4. Estrategia de test data para E2E (factories, seeding, cleanup)
5. Paralelización y ejecución en CI
6. Visual regression testing integrado
7. Presupuesto de mantenimiento: horas/sprint para E2E maintenance

{MODO_OPERACIONAL}=arquitectura-testing
```

---

## UC-05: Estrategia de Test Data

### Contexto

Los tests fallan intermitentemente por dependencias de datos compartidos. El equipo necesita una estrategia de datos que garantice aislamiento y reproducibilidad.

### Prompt

```
/mao:testing-strategy {SISTEMA}

Contexto: Sistema con {BASE_DE_DATOS} y {N} environments.
Problemas de datos:
- Tests dependen de datos compartidos en staging
- Datos de producción usados en testing (riesgo PII/compliance)
- No hay factories ni seeders estandarizados
- Setup de datos consume {X}% del tiempo de escritura de tests

Necesito:
1. Estrategia de datos por nivel de test (unit, integration, E2E, performance)
2. Test data factories: patrón builder para fixtures
3. Anonimización: pipeline para datos de producción scrubbed
4. Testcontainers: DB real en contenedor para integration tests
5. Ephemeral environments: un environment por PR
6. Compliance: política de datos en non-production environments
7. Seed/reset patterns: cómo inicializar y limpiar entre runs

{MODO_OPERACIONAL}=arquitectura-testing
```

---

## UC-06: Quality Gates y Métricas de Testing

### Contexto

La organización quiere establecer quality gates medibles y dashboards de salud del testing. Necesitan justificar la inversión en testing con métricas tangibles.

### Prompt

```
/mao:testing-strategy {ORGANIZACIÓN}

Contexto: {N} equipos, {N} repositorios.
Situación actual:
- Coverage: {INCONSISTENTE|NO_MEDIDO|X%}
- Quality gates: {NINGUNO|BÁSICOS|AVANZADOS}
- Flaky tests: {IGNORADOS|GESTIONADOS|POLÍTICA_DEFINIDA}
- Mutation testing: {NO|PILOTO|PRODUCCIÓN}

Necesito:
1. Quality gates para PR merge (coverage threshold, flaky policy, security scan)
2. Métricas leading (predicen calidad) vs. lagging (miden resultados)
3. Flaky test management: detección, quarantine, fix-or-delete policy
4. Mutation testing: setup para módulos críticos de negocio
5. Dashboard de salud del testing: qué métricas, qué herramientas, qué alertas
6. ROI de testing: cómo justificar inversión ante management

{VARIANTE}=técnica
{MODO_OPERACIONAL}=metricas-calidad
```

---

## UC-07: Testing para Sistema Legacy sin Tests

### Contexto

Sistema legacy en producción sin test suite. Cada cambio es riesgoso. Se necesita una estrategia para agregar tests de forma incremental sin reescribir todo.

### Prompt

```
/mao:testing-strategy {SISTEMA_LEGACY}

Contexto: Sistema de {N} años en {LENGUAJE}, {KLOC}K líneas de código.
Estado actual:
- Tests existentes: {NINGUNO|MÍNIMOS}
- Deployments: {MANUALES|SEMI_AUTO|CI_BÁSICO}
- Incidentes por deployment: ~{N} por mes
- Equipo: {N} developers, experiencia testing: {BÁSICA|INTERMEDIA}

Restricciones:
- No se puede reescribir el sistema
- Cambios deben ser incrementales
- Budget limitado para tooling

Necesito:
1. Estrategia de characterization tests (capturar comportamiento actual)
2. Selección de "seams" (puntos de entrada para testability sin refactor)
3. Integration tests alrededor de critical paths primero
4. Unit tests solo para código nuevo o refactoreado
5. Plan de 3-6 meses con milestones medibles
6. Coverage targets realistas para un legacy (NO apuntar a 80%)

{VARIANTE}=técnica
{MODO_OPERACIONAL}=integral
```

---

## Índice Rápido: Prompt por Necesidad

| Necesidad | Prompt | Secciones SKILL.md |
|-----------|--------|-------------------|
| Arquitectura de testing desde cero | UC-01 | S1, S2 |
| Evaluar suite existente | UC-02 | S1, S6 |
| Contract testing para microservicios | UC-03 | S3 |
| Automatización E2E | UC-04 | S2, S6 |
| Gestión de datos de test | UC-05 | S5 |
| Quality gates y métricas | UC-06 | S6 |
| Testing en legacy | UC-07 | S1, S2, S6 |

---

**Autor:** Javier Montaño | **Fecha:** 13 de marzo de 2026 | **© Comunidad MetodologIA**

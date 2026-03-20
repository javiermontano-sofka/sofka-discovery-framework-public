---
name: testing-strategy-metaprompts
description: Metaprompts para la skill de Testing Strategy — estrategias de razonamiento para mejorar la calidad de los entregables generados.
fecha: 13 de marzo de 2026
autor: Javier Montaño
copyright: © Comunidad MetodologIA
---

# Metaprompts: Testing Strategy

Estrategias de razonamiento que el skill usa internamente para producir entregables de mayor calidad. Cada metaprompt define un patrón de pensamiento aplicable a decisiones específicas dentro de la estrategia de testing.

---

## MP-01: Test Shape Selection por Análisis de Riesgo

### Propósito

Seleccionar la forma óptima de la pirámide de testing (pyramid, trophy, honeycomb, diamond) basándose en el perfil de riesgo del sistema, no en dogma de la industria.

### Estrategia

```
Dado un sistema {SISTEMA} con arquitectura {ARQUITECTURA}:

1. CLASIFICAR el tipo de sistema:
   - ¿Dónde vive la complejidad? (lógica de negocio pura, integración entre servicios, UI/UX, datos)
   - ¿Cuántas boundaries externas tiene? (APIs, DBs, message brokers, third-party services)
   - ¿Cuál es la tasa de cambio por capa? (UI cambia diario, business rules mensual, infra trimestral)

2. MAPEAR riesgo a nivel de test:
   - Riesgo en lógica pura → unit tests dominan (pyramid)
   - Riesgo en integración de componentes → integration tests dominan (trophy)
   - Riesgo en boundaries de servicios → integration tests + contracts (honeycomb)
   - Riesgo en journeys de usuario → E2E tests + integration (diamond)

3. CALCULAR ROI por nivel:
   - Costo de escritura × frecuencia de mantenimiento × tiempo de ejecución
   - vs. Probabilidad de defecto detectado × costo del defecto en producción
   - El nivel con mejor ratio ROI recibe el mayor % de inversión

4. VALIDAR contra anti-patrones:
   - ¿Estoy eligiendo pyramid solo porque es "lo estándar"? → Verificar si el sistema es realmente logic-heavy
   - ¿Estoy eligiendo trophy solo porque Kent C. Dodds lo dijo? → Verificar si tengo componentes frontend significativos
   - ¿Mi honeycomb tiene tests de integración que en realidad son E2E disfrazados? → Verificar isolation

5. PRODUCIR: Forma seleccionada + ratios + justificación basada en riesgo, no en autoridad.
```

### Cuándo usar

Siempre al generar S1 (Test Shape Selection). Es la decisión fundacional que determina la distribución de esfuerzo en toda la estrategia.

---

## MP-02: Contract Testing Decision Framework

### Propósito

Decidir el enfoque de contract testing más pragmático para el contexto organizacional, considerando madurez del equipo, stack técnico y coordinación multi-equipo.

### Estrategia

```
Dado una plataforma {PLATAFORMA} con {N} servicios y {N} equipos:

1. EVALUAR precondiciones:
   - ¿Hay API specs (OpenAPI/AsyncAPI) existentes y actualizadas?
     → SÍ: bi-directional o schema-first son viables
     → NO: consumer-driven (Pact) es el camino, porque genera la spec desde tests
   - ¿Los equipos de providers pueden/quieren escribir tests de verificación?
     → SÍ: consumer-driven funciona bien
     → NO: bi-directional reduce la carga del provider
   - ¿Hay comunicación async (eventos, mensajes)?
     → SÍ: necesitas schema registry además de contract testing HTTP

2. SELECCIONAR enfoque por caso:
   - Pocos servicios (<5), equipo pequeño → consumer-driven (Pact) con broker centralizado
   - Muchos servicios (>10), specs existentes → bi-directional (Pact + OpenAPI)
   - API pública → schema-first (Specmatic/Prism), provider-driven
   - Event-driven → schema registry (Confluent/AWS Glue) con compatibility modes

3. DISEÑAR rollout progresivo:
   - Fase 1: 2-3 servicios con mayor tasa de fallos de integración (quick win)
   - Fase 2: Servicios con múltiples consumidores (mayor ROI)
   - Fase 3: Todos los servicios con contratos + can-i-deploy gate
   - NUNCA empezar con "todos los servicios al mismo tiempo"

4. DEFINIR governance:
   - ¿Quién es dueño del Pact Broker / schema registry?
   - ¿Quién resuelve breaking changes? (provider adapta vs. consumer migra)
   - ¿Cómo se versiona? (semantic versioning de contratos)

5. PRODUCIR: Enfoque seleccionado + workflow CI + plan de rollout + governance.
```

### Cuándo usar

Al generar S3 (Contract & API Testing) o cuando el contexto incluye microservicios, multi-equipo o fallos de integración en producción.

---

## MP-03: Flaky Test Triage y Remediación

### Propósito

Diagnosticar la causa raíz de tests flaky y producir una estrategia de remediación priorizada que reduzca el flaky rate sin perder cobertura.

### Estrategia

```
Dado un test suite con flaky rate de {X}%:

1. CLASIFICAR cada flaky test por causa raíz:
   | Categoría | Síntoma | Causa probable | Remediación |
   |-----------|---------|----------------|-------------|
   | Timing | Falla intermitentemente, pasa en retry | Race condition, async sin await, sleep hardcodeado | Await explícito, polling con timeout, eliminar sleep |
   | Data | Falla cuando otros tests corren antes | Shared mutable state, DB no limpiada | Fresh fixture, transaction rollback, aislamiento |
   | Environment | Falla en CI, pasa local (o viceversa) | Diferencia de config, DNS, timezone, locale | Containerización, config explícita, timezone UTC |
   | Order | Falla solo en cierto orden de ejecución | Test depende del side-effect de otro test | Hacer cada test independiente, randomizar orden |
   | Resource | Falla bajo carga de CI | Memory, CPU, file handles exhausted | Resource cleanup, pool limits, CI sizing |

2. PRIORIZAR por impacto:
   - Flaky test que bloquea deploy de critical path → fix inmediato
   - Flaky test en feature no-crítica → quarantine + ticket
   - Flaky test que nadie mantiene hace 6+ meses → candidato a eliminación

3. DEFINIR política:
   - Quarantine automático después de 2 flakes en 7 días
   - Fix dentro del sprint (SLA de 2 semanas)
   - Delete si no se arregla después de 2 sprints
   - Alerta a tech lead cuando flaky rate > 2%

4. IMPLEMENTAR detección:
   - Rerun-on-failure en CI (detecta, no oculta)
   - Dashboard con flaky rate por suite, por equipo, por semana
   - Ownership: el equipo que escribió el test lo mantiene

5. PRODUCIR: Clasificación de flakies actuales + política + herramienta de detección + SLA.
```

### Cuándo usar

Al generar S6 (Quality Metrics) cuando el contexto reporta problemas de flaky tests o CI pass rate bajo. También útil como análisis standalone invocado con `{MODO_OPERACIONAL}=metricas-calidad`.

---

## MP-04: Test Automation ROI Calculator

### Propósito

Justificar la inversión en automatización de testing con métricas tangibles que resuenen con stakeholders de negocio.

### Estrategia

```
Dado un escenario de testing actual (manual o parcialmente automatizado):

1. MEDIR estado actual:
   - Horas de testing manual por release: {H_MANUAL}
   - Frecuencia de releases: {FREQ}
   - Costo/hora del equipo de QA: {COSTO_HORA}
   - Defectos escapados a producción por release: {DEFECTOS}
   - Costo promedio de un defecto en producción: {COSTO_DEFECTO}
   - Tiempo de rollback/hotfix: {HORAS_FIX}

2. PROYECTAR con automatización:
   - Inversión inicial: {HORAS_SETUP} horas para framework + primeros tests
   - Mantenimiento mensual: 15-20% del tiempo de desarrollo
   - Reducción de testing manual: 60-80% para regression, 0% para exploratory
   - Reducción de defectos escapados: 40-60% con buena cobertura
   - Aumento de frecuencia de release: de {FREQ_ACTUAL} a {FREQ_OBJETIVO}

3. CALCULAR:
   - Costo anual actual = (H_MANUAL × FREQ × COSTO_HORA) + (DEFECTOS × FREQ × COSTO_DEFECTO)
   - Costo anual con automatización = INVERSIÓN_INICIAL + MANTENIMIENTO_ANUAL + DEFECTOS_RESIDUALES
   - ROI = (Costo actual - Costo con automatización) / Inversión inicial
   - Payback period: meses hasta que la inversión se recupera

4. COMUNICAR en lenguaje de negocio:
   - "Reducimos el tiempo de validación por release de {X} días a {Y} horas"
   - "Detectamos {X}% más defectos antes de producción"
   - "Habilitamos releases {X}x más frecuentes con la misma confianza"
   - NUNCA: "Aumentamos el coverage de 40% a 80%" (no resuena con negocio)

5. PRODUCIR: Business case con magnitudes (NUNCA precios), payback estimado, quick wins vs. inversión a largo plazo.
```

### Cuándo usar

Cuando el cliente necesita justificar la inversión en testing ante management. Complementa S6 (Quality Metrics) con la perspectiva de negocio. Especialmente útil con `{VARIANTE}=ejecutiva`.

---

## MP-05: Shift-Left Assessment

### Propósito

Evaluar en qué etapa del ciclo de desarrollo se detectan la mayoría de defectos y diseñar una estrategia para desplazar la detección hacia la izquierda (más temprano = más barato).

### Estrategia

```
Dado el proceso de desarrollo actual de {EQUIPO}:

1. MAPEAR dónde se detectan defectos hoy:
   | Etapa | % defectos detectados | Costo relativo de fix |
   |-------|----------------------|----------------------|
   | IDE / pre-commit | {X}% | 1x |
   | PR review / CI | {X}% | 5x |
   | Staging / QA manual | {X}% | 10x |
   | Producción | {X}% | 50-100x |

2. IDENTIFICAR oportunidades shift-left:
   - ¿Hay linting y type checking? → Si no, es el quick win más barato
   - ¿Los unit tests corren pre-commit o solo en CI? → Pre-commit = feedback inmediato
   - ¿Hay static analysis (SonarQube, ESLint rules)? → Catch bugs without running code
   - ¿Los developers escriben tests o solo QA? → Developer testing es shift-left fundamental
   - ¿Hay pair programming / mob programming? → Defectos detectados en tiempo real

3. DISEÑAR pipeline shift-left:
   - Nivel 0 (IDE): Type checking, linting, AI suggestions
   - Nivel 1 (Pre-commit): Unit tests del módulo cambiado, format check
   - Nivel 2 (PR): Integration tests, coverage gate, security scan
   - Nivel 3 (Merge): E2E critical journeys, contract verification, visual regression
   - Nivel 4 (Release): Load test benchmark, can-i-deploy, smoke tests

4. CALCULAR impacto:
   - Si muevo 20% de defectos de "producción" a "PR review":
     20% × DEFECTOS_PROD × (COSTO_PROD - COSTO_PR) = AHORRO_ANUAL
   - Inversión: tooling + training + process change

5. PRODUCIR: Mapa actual vs. deseado + pipeline shift-left + quick wins + plan de adopción.
```

### Cuándo usar

Al generar S1 (Test Shape Selection) cuando se evalúa la estrategia shift-left. También útil como diagnóstico independiente para organizaciones que detectan defectos tarde en el ciclo.

---

## Índice: Metaprompt por Decisión

| Decisión | Metaprompt | Sección SKILL.md |
|----------|------------|-----------------|
| Forma de pirámide | MP-01 | S1 |
| Enfoque de contract testing | MP-02 | S3 |
| Remediación de flaky tests | MP-03 | S6 |
| Justificación de inversión | MP-04 | S6 (ejecutiva) |
| Estrategia shift-left | MP-05 | S1, S2 |

---

**Autor:** Javier Montaño | **Fecha:** 13 de marzo de 2026 | **© Comunidad MetodologIA**

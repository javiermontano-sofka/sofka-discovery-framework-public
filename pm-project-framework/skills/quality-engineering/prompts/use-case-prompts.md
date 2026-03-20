# Use-Case Prompts — Quality Engineering

Prompts especializados para escenarios frecuentes de quality engineering. Cada prompt activa el skill con contexto específico del caso de uso.

---

## Prompt 1: Diseño de Quality Strategy

**Escenario:** Proyecto nuevo o rediseño de la estrategia de calidad completa. El equipo necesita una visión integral de cómo gestionar la calidad.

**Prompt:**
```
Diseña la estrategia de calidad completa para {NOMBRE_SISTEMA}.

Contexto:
- Arquitectura: {MONOLITO | MICROSERVICIOS | HÍBRIDO | EVENT-DRIVEN}
- Equipo: {N} developers, {M} QA engineers, {P} DevOps
- Stack tecnológico: {LENGUAJES}, {FRAMEWORKS}, {CI/CD_TOOL}
- Estado actual: {DESCRIPCIÓN_ESTADO_CALIDAD}
- Deployment frequency: {FRECUENCIA}
- Regulación: {INDUSTRIA} — {REQUISITOS_COMPLIANCE}

Genera:
1. Maturity assessment actual (modelo 5 niveles, 6 dimensiones)
2. Test strategy con forma adecuada (pyramid/diamond) y distribución de test types
3. Test data strategy (synthetic generation, masking si aplica)
4. Quality gates para cada stage del pipeline
5. Métricas leading + lagging con targets
6. Plan de implementación en 4 fases (12 semanas)

{MODO_OPERACIONAL}=integral
{VARIANTE}=técnica
```

---

## Prompt 2: Selección de Automation Framework

**Escenario:** El equipo necesita seleccionar e implementar un framework de automatización de tests alineado con su stack y capacidades.

**Prompt:**
```
Evalúa y recomienda el framework de automatización de tests para {NOMBRE_SISTEMA}.

Contexto:
- Lenguaje principal: {LENGUAJE}
- Frontend: {FRAMEWORK_UI} (si aplica)
- Backend: {FRAMEWORK_BACKEND}
- APIs: {REST | GRAPHQL | GRPC}
- Base de datos: {DB_TYPE}
- CI/CD: {TOOL}
- Experiencia del equipo en testing: {BÁSICA | INTERMEDIA | AVANZADA}
- Tests existentes: {CANTIDAD} tests, {COVERAGE}% coverage

Genera:
1. Evaluación comparativa de frameworks (mínimo 3 opciones) con scoring
2. Recomendación justificada con trade-offs documentados
3. Design patterns a adoptar (Page Object, Screenplay, Factory, Golden Master, Testcontainers)
4. Estructura de repositorio de tests recomendada
5. Configuración de CI/CD con stages y timeouts
6. Ramp-up plan para el equipo (4-6 semanas)
7. Test data management strategy

{MODO_OPERACIONAL}=arquitectura-automatizacion
{VARIANTE}=técnica
```

---

## Prompt 3: Definición de SLOs y Quality Metrics

**Escenario:** El equipo necesita definir objetivos de calidad medibles vinculados a SLOs de negocio y dashboards de seguimiento.

**Prompt:**
```
Define los SLOs y métricas de calidad para {NOMBRE_SISTEMA}.

Contexto:
- Tipo de sistema: {WEB_APP | API | MOBILE | PLATAFORMA | MICROSERVICIOS}
- Usuarios concurrentes: {N} (pico: {PICO})
- SLAs contractuales: disponibilidad {X}%, latencia p99 < {Y}ms
- Incidentes últimos 6 meses: {N} (críticos: {M})
- MTTR actual: {MINUTOS}
- Deployment frequency actual: {FRECUENCIA}
- Herramientas de monitoring: {TOOLS}

Genera:
1. Definición de SLIs por servicio/componente crítico
2. SLO targets con justificación (basados en DORA benchmarks + contexto)
3. Error budgets calculados y política de consumo
4. Leading indicators (code review catch rate, build stability, flaky rate, coverage)
5. Lagging indicators (escaped defects, incidents, MTTR, regression rate)
6. Dashboard design: 4 paneles con métricas específicas
7. Alerting rules y escalation paths

{MODO_OPERACIONAL}=estrategia-calidad
{VARIANTE}=técnica
```

---

## Prompt 4: Diseño de Quality Gates

**Escenario:** El equipo tiene CI/CD pero sin quality gates formales o con gates inconsistentes. Necesita gates robustos en cada stage.

**Prompt:**
```
Diseña los quality gates para el pipeline de {NOMBRE_SISTEMA}.

Contexto:
- Pipeline actual: {DESCRIPCIÓN_PIPELINE}
- Branching strategy: {GITFLOW | TRUNK-BASED | GITHUB_FLOW}
- Deployment target: {KUBERNETES | SERVERLESS | VM | CONTAINER}
- CI/CD tool: {TOOL}
- Build time actual: {MINUTOS}
- Tests existentes: unit ({N}), integration ({M}), E2E ({P})
- Security scanning: {SÍ | NO} — herramientas: {TOOLS}
- Performance testing: {SÍ | NO}

Genera:
1. 5 gates definidos (commit, PR, nightly, release, production) con:
   - Tests que ejecuta cada gate
   - Pass criteria cuantificables
   - Timeout por gate
   - Acción en caso de fallo
   - Escalation path
2. Bypass policy (quién puede, cuándo, audit trail)
3. Flaky test management policy
4. Pipeline YAML esqueleto para {CI/CD_TOOL}
5. Métricas de gate health (pass rate, execution time, false positive rate)

{MODO_OPERACIONAL}=arquitectura-automatizacion
{VARIANTE}=técnica
```

---

## Prompt 5: Estrategia de Test Environment

**Escenario:** El equipo tiene problemas con ambientes de test inconsistentes que causan falsos positivos y bloqueos de pipeline.

**Prompt:**
```
Diseña la estrategia de ambientes de test para {NOMBRE_SISTEMA}.

Contexto:
- Ambientes actuales: {LISTA_AMBIENTES}
- Problemas: {INCONSISTENCIAS, DATOS_OBSOLETOS, DISPONIBILIDAD}
- Infraestructura: {CLOUD_PROVIDER}, {KUBERNETES | VMS | SERVERLESS}
- Dependencias externas: {N} servicios de terceros
- Datos sensibles: {SÍ | NO} — regulación: {TIPO}
- Presupuesto para ambientes: {RANGO}

Genera:
1. Mapa de ambientes recomendado (dev, test, staging, pre-prod, prod)
2. Estrategia de datos por ambiente (synthetic, masked, subset, full copy)
3. Service virtualization para dependencias externas (WireMock, sandbox APIs)
4. Estrategia de provisión y teardown (ephemeral vs persistent)
5. Isolation strategy (namespace, cluster, account level)
6. Refresh policy (frecuencia, automatización, validación post-refresh)
7. Cost optimization (ambientes on-demand, schedule-based scaling)

{MODO_OPERACIONAL}=arquitectura-automatizacion
{VARIANTE}=técnica
```

---

## Prompt 6: Evaluación de Madurez de Calidad

**Escenario:** El cliente quiere entender su nivel de madurez de calidad actual y recibir un roadmap de mejora priorizado.

**Prompt:**
```
Evalúa la madurez de calidad de {NOMBRE_SISTEMA} y genera roadmap de mejora.

Contexto:
- Organización: {TAMAÑO_EQUIPO} personas en {N} equipos
- Años del producto: {N}
- Deployment frequency: {FRECUENCIA}
- Incidentes/mes: {N} (MTTR promedio: {MINUTOS})
- Test coverage: {PORCENTAJE}%
- Automation level: {DESCRIPCIÓN}
- Quality gates: {DESCRIPCIÓN}
- Herramientas actuales: {LISTA}
- Presupuesto para mejora: {RANGO}

Genera:
1. Scorecard de madurez (modelo 5 niveles, 6 dimensiones, 0-100% cada una)
2. Comparación con benchmarks DORA (categoría actual vs target)
3. Gap analysis detallado por dimensión
4. Quick wins (implementables en 2-4 semanas, alto impacto, bajo esfuerzo)
5. Roadmap de mejora en 4 fases (12 meses) con esfuerzo en FTE-semanas
6. ROI estimado por fase (reducción de incidentes, ahorro de tiempo, developer experience)

{MODO_OPERACIONAL}=estrategia-calidad
{VARIANTE}=técnica
```

---

## Prompt 7: Testing para Microservicios con Contratos

**Escenario:** Migración a microservicios donde los tests E2E entre servicios son lentos e inestables. Se necesita contract testing.

**Prompt:**
```
Diseña la estrategia de contract testing para {NOMBRE_SISTEMA}.

Contexto:
- Número de microservicios: {N}
- Comunicación entre servicios: {REST | GRPC | EVENTOS | MIXTO}
- Message broker: {KAFKA | RABBITMQ | SQS | NONE}
- Tests E2E actuales: {N} tests, {MINUTOS} de ejecución, {FLAKY_RATE}% flaky
- Equipos independientes: {N} (cada uno owns {M} servicios)
- CI/CD: {TOOL}
- Schema registry: {SÍ | NO}

Genera:
1. Evaluación de contract testing tools (Pact vs Specmatic vs schema validation)
2. Consumer-driven contract testing workflow (consumer writes, provider verifies)
3. Event/message contract testing strategy (si aplica)
4. Integración con CI/CD: en qué gate ejecutar, pass criteria
5. Governance de contratos: ownership, breaking change policy, versioning
6. Reducción esperada de tests E2E y mejora de estabilidad
7. Plan de migración de E2E → contract tests (8 semanas)

{MODO_OPERACIONAL}=arquitectura-automatizacion
{VARIANTE}=técnica
```

---

## Uso de los Prompts

1. **Seleccionar el prompt** más cercano al escenario del cliente
2. **Completar las variables** entre llaves con datos del proyecto
3. **Ajustar parámetros** ({MODO}, {FORMATO}, {VARIANTE}) según necesidad
4. **Combinar prompts** si el alcance cubre múltiples escenarios (ej: P1 + P4 para strategy + gates)

---

**Autor:** Javier Montaño | **Fecha:** 13 de marzo de 2026 | **Versión:** 1.0
**Licencia:** Todos los derechos reservados, Comunidad MetodologIA

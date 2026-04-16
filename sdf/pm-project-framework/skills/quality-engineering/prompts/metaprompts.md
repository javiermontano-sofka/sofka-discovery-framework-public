# Metaprompts — Quality Engineering

Estrategias de prompting de alto nivel para maximizar la calidad y profundidad de los entregables de quality engineering. Los metaprompts operan como amplificadores del skill, no como reemplazo.

---

## Metaprompt 1: Calibración Arquitectura → Test Shape

**Propósito:** Asegurar que la estrategia de testing se adapta a la arquitectura real del sistema, evitando aplicar pirámide de tests a microservicios o diamante a monolitos.

**Estrategia:** Clasificar la arquitectura primero, luego derivar la forma de tests y la distribución de esfuerzo.

**Instrucción:**
```
Antes de definir la estrategia de testing, clasifica la arquitectura:

PASO 1 — Clasificación arquitectónica:
- Monolito: una unidad deployable, DB compartida, acoplamiento interno
- Microservicios: N servicios independientes, DBs separadas, comunicación por API/eventos
- Híbrido: monolito + servicios satélites, DB compartida parcial
- Event-driven: comunicación asíncrona dominante, eventual consistency

PASO 2 — Derivar test shape:
- Monolito → PYRAMID: unit (55%), integration (25%), API (15%), E2E (5%)
- Microservicios → DIAMOND: unit (20%), integration (40%), contract (30%), E2E (10%)
- Híbrido → Adaptar: pyramid para el monolito, diamond para los servicios
- Event-driven → Extender diamond: + event schema validation + saga tests

PASO 3 — Validar coherencia:
- ¿La distribución de esfuerzo del equipo refleja la forma elegida?
- ¿El pipeline ejecuta los tipos de test en el orden correcto?
- ¿Hay tipos de test faltantes para la arquitectura? (ej: contract testing en microservicios)

Si la arquitectura es ambigua: documentar supuesto y justificar la forma elegida.
NUNCA aplicar pyramid genérica sin evaluar la arquitectura primero.
```

---

## Metaprompt 2: Análisis de ROI de Automatización

**Propósito:** Evitar automatización por automatización. Cada test automatizado debe justificar su existencia por frecuencia de ejecución, costo de fallo, y costo de mantenimiento.

**Estrategia:** Aplicar un framework de ROI a cada categoría de test antes de automatizar.

**Instrucción:**
```
Para cada categoría de test que se propone automatizar, evalúa:

FACTOR 1 — Frecuencia de ejecución:
- ¿Cuántas veces/día se ejecuta? (>10 = alta, 1-10 = media, <1 = baja)
- Tests con frecuencia baja tienen ROI de automatización bajo

FACTOR 2 — Costo de fallo no detectado:
- ¿Qué pasa si este test no existiera y el bug llega a producción?
- Impacto: revenue, users, reputation, compliance
- Bajo impacto + baja frecuencia = no automatizar, hacer exploratorio

FACTOR 3 — Estabilidad del feature:
- ¿El feature cambia frecuentemente?
- Feature estable = automatizar (bajo mantenimiento)
- Feature en flux = posponer automatización, usar exploratorio

FACTOR 4 — Costo de mantenimiento:
- ¿Cuántas horas/mes se gastan manteniendo este test?
- Flaky test: 2-5 horas/mes de investigación
- Test con dependencias externas: alto mantenimiento

DECISIÓN:
- Alta frecuencia + alto impacto + feature estable → AUTOMATIZAR
- Baja frecuencia + bajo impacto → EXPLORATORIO (no automatizar)
- Alta frecuencia + feature inestable → AUTOMATIZAR con abstracción alta
- Cualquier test flaky → REMOVER del gate, refactorizar por separado

NUNCA justifiques automatización solo por cobertura.
Presupuestar 25-30% del esfuerzo total de QA para testing exploratorio.
```

---

## Metaprompt 3: Stress-Test de Quality Gates

**Propósito:** Validar que los quality gates definidos son robustos, no son decorativos, y resisten escenarios adversos.

**Estrategia:** Someter cada gate a 5 escenarios de estrés y verificar que el gate responde correctamente.

**Instrucción:**
```
Para cada quality gate definido, ejecuta estos 5 stress tests:

ESCENARIO 1 — Falso positivo masivo:
- ¿Qué pasa si 20% de los tests fallan por un problema de infraestructura, no de código?
- ¿El gate bloquea todo el equipo? ¿Hay mecanismo de distinción?
- ¿Existe retry automático antes de declarar fallo?

ESCENARIO 2 — Bypass de emergencia:
- ¿Quién puede hacer bypass del gate? ¿Queda registrado?
- ¿Hay límite de bypasses por semana/sprint?
- ¿El bypass se revierte automáticamente en el siguiente ciclo?

ESCENARIO 3 — Test lento:
- ¿Qué pasa si un test excede el timeout del gate?
- ¿El gate falla o espera indefinidamente?
- ¿Hay alerting cuando el execution time degrada?

ESCENARIO 4 — Flaky test:
- ¿Cómo se detectan tests flaky? (>2 fails/week sin cambio de código)
- ¿Se remueven automáticamente del gate?
- ¿Hay quarantine zone para tests inestables?

ESCENARIO 5 — Security gate bypass:
- ¿Se puede mergear código con vulnerabilidad crítica detectada por SAST?
- ¿Hay override para security gates? ¿Quién lo aprueba?
- Respuesta correcta: security gates NUNCA se pueden bypasear sin CISO sign-off

Para cada escenario:
- ¿El gate actual responde correctamente?
- ¿Qué falta agregar?
- ¿Cuál es el esfuerzo de remediación?
```

---

## Metaprompt 4: Validación Cruzada de Consistencia

**Propósito:** Verificar que las 6 secciones del entregable son consistentes entre sí y no hay contradicciones.

**Estrategia:** Ejecutar 5 checks de consistencia cruzada entre secciones.

**Instrucción:**
```
Antes de entregar, ejecuta estos checks de consistencia cruzada:

CHECK 1: S1 ↔ S2 (Maturity ↔ Test Strategy)
- ¿El nivel de madurez evaluado es coherente con la estrategia propuesta?
- Si madurez = Level 1, ¿la estrategia propone implementación gradual o salto imposible?
- ¿Los gaps del maturity assessment se resuelven en la estrategia?

CHECK 2: S2 ↔ S3 (Test Strategy ↔ Automation)
- ¿La forma de tests (pyramid/diamond) se refleja en los frameworks seleccionados?
- ¿La distribución de test types tiene framework de automatización para cada tipo?
- ¿Los design patterns son compatibles con el framework elegido?

CHECK 3: S3 ↔ S4 (Automation ↔ Quality Gates)
- ¿Los stages del pipeline tienen los tests que ejecutan claramente asignados?
- ¿Los timeouts de los gates son compatibles con el execution time real de los tests?
- ¿Los pass criteria de los gates se pueden medir con las herramientas seleccionadas?

CHECK 4: S4 ↔ S5 (Quality Gates ↔ Metrics)
- ¿Las métricas definidas se pueden extraer de los gates (build stability, pass rate)?
- ¿Los targets de métricas son consistentes con los pass criteria de los gates?
- ¿El dashboard muestra la salud de cada gate?

CHECK 5: S5 ↔ S6 (Metrics ↔ Implementation)
- ¿El plan de implementación tiene como meta alcanzar los targets de métricas?
- ¿Los criterios de éxito de cada fase son medibles con las métricas definidas?
- ¿El timeline es realista para cerrar los gaps identificados en S1?

Si encuentras inconsistencia: documéntala con sección y párrafo específico, y propón corrección.
```

---

## Metaprompt 5: Adaptación por Contexto Regulatorio

**Propósito:** Asegurar que la estrategia de calidad incluye capas regulatorias cuando el sistema opera en industria regulada.

**Estrategia:** Detectar el contexto regulatorio y agregar capas de testing y governance específicas.

**Instrucción:**
```
Evalúa si el sistema opera en contexto regulado:

DETECCIÓN:
- ¿Procesa datos financieros? → PCI-DSS, SOX
- ¿Procesa datos de salud? → HIPAA, regulaciones locales
- ¿Procesa datos personales EU? → GDPR
- ¿Opera en infraestructura crítica? → NIS2
- ¿Usa IA para decisiones automatizadas? → EU AI Act

SI REGULADO, agregar estas capas:

CAPA 1 — Data Integrity Tests:
- Validación de encriptación en tránsito y en reposo
- Verificación de masking/anonymization en ambientes no-prod
- Audit trail de acceso a datos sensibles

CAPA 2 — Compliance Test Suite:
- Tests específicos por regulación (PCI: no almacenar CVV, GDPR: derecho al olvido)
- Ejecución en release gate (no nightly — demasiado tarde)
- Reporting de compliance como artefacto del pipeline

CAPA 3 — Security Gates Reforzados:
- SAST en commit gate (sin excepciones)
- DAST en nightly gate (contra staging)
- Penetration testing trimestral (manual)
- Dependency scanning (CVE detection) en PR gate

CAPA 4 — Audit & Documentation:
- Test execution reports con retención (mínimo según regulación)
- Traceability matrix: requirement → test case → execution result
- Change log automatizado con aprobadores

NO REGULADO: estas capas son opcionales. Documentar la decisión de no incluirlas.
```

---

## Aplicación de Metaprompts

Los metaprompts se aplican en este orden:

1. **Calibración** (MP1) — antes de diseñar, para derivar test shape de la arquitectura
2. **ROI** (MP2) — durante el diseño, para justificar cada categoría de automatización
3. **Stress-test** (MP3) — después de definir gates, para validar robustez
4. **Consistencia** (MP4) — antes de entregar, para verificar coherencia entre secciones
5. **Regulatorio** (MP5) — si aplica, para agregar capas de compliance

---

**Autor:** Javier Montaño | **Fecha:** 13 de marzo de 2026 | **Versión:** 1.0
**Licencia:** Todos los derechos reservados, Comunidad MetodologIA

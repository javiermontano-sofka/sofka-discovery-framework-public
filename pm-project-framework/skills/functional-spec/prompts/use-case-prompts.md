---
skill: functional-spec
title: Use-Case Prompts — Especificación Funcional
framework: MetodologIA Discovery Framework
author: Javier Montaño
copyright: © Comunidad MetodologIA
updated: 2026-03-13
---

# Use-Case Prompts: Especificación Funcional

Prompts listos para usar con el skill `functional-spec`. Copiar el texto del prompt, ajustar los placeholders entre corchetes `[...]`, y ejecutar.

---

## Prompt 1: Spec Funcional Completa — Proyecto Nuevo

**Nombre:** Spec técnica completa desde cero
**Contexto:** Se tiene el escenario aprobado de Phase 3 y el roadmap de Phase 4. Se necesita la spec completa para iniciar la implementación.

**Prompt:**
```
Ejecuta el skill functional-spec en modo técnico completo.

Contexto del proyecto:
- Nombre del proyecto: [NOMBRE_PROYECTO]
- Escenario aprobado: [NOMBRE_ESCENARIO] — [DESCRIPCIÓN_BREVE]
- Módulos MVP objetivo: [3/4/5] módulos
- Dominio de negocio: [INDUSTRIA / SECTOR]
- Restricciones clave: [RESTRICCIONES_TÉCNICAS_O_NEGOCIO]

Entregables disponibles de fases anteriores:
- AS-IS Analysis: [RUTA_ARCHIVO o "adjunto"]
- Mapeo de Flujos: [RUTA_ARCHIVO o "adjunto"]
- Solution Roadmap: [RUTA_ARCHIVO o "adjunto"]

Formato: {FORMATO}=markdown
Profundidad: {VARIANTE}=técnica (8 secciones completas)
Modo: {MODO}=piloto-auto

Genera la especificación funcional completa con:
- Inventario de módulos MVP (Section 1)
- Mínimo 8 casos de uso en formato Cockburn (Section 2)
- Mínimo 6 business rules con severidad y estado de validación (Section 3)
- Matriz complejidad/riesgo 3x3 (Section 4)
- Scope IN/OUT explícito (Section 5)
- Criterios de aceptación por módulo (Section 6)
- Modelo de datos con entidades y relaciones (Section 7)
- Especificaciones de integración con SLAs (Section 8)

Output: 05_Especificacion_Funcional_Deep.md
```

**Output esperado:** Documento markdown completo de 40-80 páginas con las 8 secciones, diagramas Mermaid (ER, flowcharts de use cases, mapa de módulos), y todos los IDs bidireccionales.

---

## Prompt 2: Spec Ejecutiva — MVP Rápido

**Nombre:** Spec ejecutiva para revisión de steering committee
**Contexto:** El steering committee necesita revisar el alcance funcional antes de aprobar el presupuesto. Se necesita una versión compacta que cubra módulos, scope y riesgos.

**Prompt:**
```
Ejecuta el skill functional-spec en variante ejecutiva.

Proyecto: [NOMBRE_PROYECTO]
Audiencia: Steering Committee — [NOMBRES_O_ROLES]
Fecha de presentación: [FECHA]

Enfoque ejecutivo — incluir solo:
- S1: Inventario de módulos MVP con complejidad/riesgo
- S4: Matriz complejidad/riesgo (posicionamiento de features)
- S5: Scope definition (IN/OUT explícito)

Contexto disponible:
[PEGAR_RESUMEN_DE_ESCENARIO_APROBADO_O_ROADMAP]

Formato: {FORMATO}=markdown
Modo: {VARIANTE}=ejecutiva
```

**Output esperado:** Documento de 8-12 páginas con tabla de módulos, matriz 3x3 visual, y listas IN/OUT con justificaciones. Apto para lectura en 10 minutos.

---

## Prompt 3: Caso de Uso Individual — Detalle Cockburn

**Nombre:** Caso de uso detallado en formato Cockburn
**Contexto:** Un caso de uso específico requiere documentación exhaustiva porque es el flujo más crítico del MVP. Se necesita el formato Cockburn completo con todos los flujos.

**Prompt:**
```
Genera un caso de uso detallado en formato Cockburn para el siguiente escenario:

Módulo: [NOMBRE_MÓDULO]
Nombre del caso de uso: [VERBO + SUSTANTIVO — ej: "Procesar Solicitud de Crédito"]
Actor primario: [ROL_DEL_USUARIO]
Actores secundarios: [SISTEMAS_O_ROLES_ADICIONALES]

Contexto del flujo:
[DESCRIPCIÓN_DEL_PROCESO_EN_LENGUAJE_NATURAL — 3-5 párrafos o puntos]

Business rules relacionadas que conozco:
- [REGLA_1]
- [REGLA_2]

Generar con:
- Precondiciones (mínimo 2)
- Flujo principal (mínimo 7 pasos numerados)
- Flujos alternativos (mínimo 3 — incluyendo validaciones fallidas)
- Flujos de excepción (mínimo 2 — incluyendo timeout y sistema externo no disponible)
- Postcondiciones (éxito y fallo)
- Business rules referenciadas con ID
- Diagrama de flujo Mermaid del happy path + 1 alternativa
```

**Output esperado:** Tabla estructurada completa del caso de uso, diagrama flowchart Mermaid, y sección de business rules referenciadas con IDs.

---

## Prompt 4: Catálogo de Business Rules

**Nombre:** Generación de catálogo completo de reglas de negocio
**Contexto:** El analista ha recopilado las reglas del negocio en entrevistas y documentos. Se necesita estructurar el catálogo formal con severidades y lógica de validación.

**Prompt:**
```
Genera el catálogo de business rules (Section 3) para el proyecto [NOMBRE_PROYECTO].

Reglas identificadas en entrevistas (formatear y completar):
[PEGAR_NOTAS_DE_ENTREVISTAS_O_DOCUMENTOS_CON_REGLAS_EN_LENGUAJE_NATURAL]

Módulos del MVP:
- [MÓDULO_1]
- [MÓDULO_2]
- [MÓDULO_3]

Para cada regla generar:
- ID único (BR-XXX)
- Nombre descriptivo
- Descripción en lenguaje de negocio
- Lógica de validación (pseudocódigo o condición formal)
- Severidad: CRITICAL / HIGH / MEDIUM / LOW con justificación
- Módulo(s) afectado(s)
- Estado: VALIDATED / UNVALIDATED
- Use cases relacionados (IDs)

Identificar y flaggear:
- Reglas que se contradicen entre sí
- Reglas con lógica ambigua que requiere clarificación
- Reglas que deben tener prueba automática (CRITICAL)

Formato de salida: tabla markdown + sección de conflictos detectados
```

**Output esperado:** Tabla completa de business rules en formato spec, sección de conflictos identificados, y lista de reglas UNVALIDATED que requieren validación con stakeholder.

---

## Prompt 5: Matriz Complejidad/Riesgo

**Nombre:** Posicionamiento de features en matriz 3x3
**Contexto:** El equipo de discovery tiene el listado de features del MVP pero necesita priorizar para el roadmap de implementación. La matriz ayuda a identificar quick wins y spikes necesarios.

**Prompt:**
```
Genera la matriz de complejidad y riesgo (Section 4) para los siguientes features del MVP de [NOMBRE_PROYECTO]:

Features a posicionar:
[LISTAR_FEATURES — uno por línea, con descripción breve]

Contexto de complejidad (para calibrar el eje X):
- Stack tecnológico: [TECNOLOGÍAS]
- Capacidad del equipo: [SENIOR/MID/JUNIOR mix]
- Deuda técnica existente: [ALTA/MEDIA/BAJA]

Contexto de riesgo (para calibrar el eje Y):
- Riesgos de negocio identificados: [LISTAR]
- Dependencias externas críticas: [LISTAR]
- Requisitos regulatorios: [LISTAR_O_"ninguno"]

Generar:
- Tabla de posicionamiento (feature → complejidad → riesgo → cuadrante → rationale)
- Diagrama Mermaid de la matriz 3x3 con features posicionados
- Lista ordenada de quick wins (bajo/bajo) para implementar primero
- Lista de spikes requeridos (alto/alto) con objetivo de cada spike
- Recomendación de secuencia de implementación para los primeros 3 sprints
```

**Output esperado:** Tabla de posicionamiento, diagrama de matriz Mermaid, lista de quick wins ordenada, lista de spikes con descripción, y secuencia de implementación recomendada.

---

## Prompt 6: Modelo de Datos y Especificación de Integración

**Nombre:** Modelo de datos + specs de integración
**Contexto:** El equipo de arquitectura necesita las entidades del modelo de datos y los contratos de las integraciones externas antes de comenzar el diseño técnico detallado.

**Prompt:**
```
Genera las secciones de modelo de datos (Section 7) y especificaciones de integración (Section 8) para [NOMBRE_PROYECTO].

Entidades identificadas en análisis (completar y formalizar):
[LISTAR_ENTIDADES_CON_DESCRIPCIÓN_BÁSICA]

Sistemas externos con integración requerida:
[LISTAR_SISTEMAS_CON_TIPO_DE_INTEGRACIÓN — REST/SOAP/mensaje/evento/batch]

Para el modelo de datos (Section 7):
- Por entidad: campos (nombre, tipo, constraints), relaciones (belongs-to, has-many), lifecycle (cuándo se crea/actualiza/elimina)
- Mapeo entidad → business rules que la afectan
- Diagrama ER en Mermaid

Para las integraciones (Section 8):
- Por sistema externo: endpoint/mecanismo, payload de request/response (estructura), SLA esperado (latencia P99, disponibilidad)
- Modos de falla identificados
- Comportamiento de fallback cuando el sistema externo no está disponible
- Política de retry y circuit breaker recomendada

Restricciones a considerar:
- [RESTRICCIONES_TÉCNICAS_O_REGULATORIAS_SOBRE_LOS_DATOS]
```

**Output esperado:** Secciones 7 y 8 completas en formato spec, diagrama ER Mermaid, y tabla de contratos de integración con SLAs y modos de falla.

---

## Prompt 7: Criterios de Aceptación por Módulo

**Nombre:** Criterios de aceptación completos con Gherkin
**Contexto:** El equipo de QA necesita los criterios de aceptación en formato verificable para cada módulo del MVP antes de comenzar el diseño de pruebas.

**Prompt:**
```
Genera los criterios de aceptación por módulo (Section 6) para [NOMBRE_PROYECTO].

Módulos del MVP:
- [MÓDULO_1]: [DESCRIPCIÓN_BREVE] — Use cases: [UC-001, UC-002, ...]
- [MÓDULO_2]: [DESCRIPCIÓN_BREVE] — Use cases: [UC-003, UC-004, ...]
- [MÓDULO_3]: [DESCRIPCIÓN_BREVE] — Use cases: [UC-005, UC-006, ...]

Business rules CRITICAL a incluir en criterios: [BR-001, BR-002, ...]

Para cada módulo generar:
Criterios funcionales:
- [ ] Casos de uso completados (lista con IDs)
- [ ] Business rules validadas (lista con IDs)
- [ ] Flujos alternativos y de excepción verificados
- [ ] Consistencia de datos entre módulos

Criterios no funcionales:
- [ ] Tiempo de respuesta: [TARGET_EN_MS] en P95 con [CARGA] usuarios concurrentes
- [ ] Load testing: [TARGET] transacciones/segundo sostenidas por [DURACIÓN]
- [ ] Sin single point of failure en flujos críticos
- [ ] Audit trail completo para acciones de [LISTA_DE_ACCIONES]

Criterios de seguridad:
- [ ] Autenticación y autorización por rol verificadas
- [ ] Datos PII encriptados en tránsito y en reposo
- [ ] [OTROS_REQUISITOS_DE_SEGURIDAD]

Criterios de calidad:
- [ ] Code review sin defectos críticos
- [ ] Cobertura unit tests > 80%
- [ ] Cobertura integration tests > 70%

Incluir también:
- 2-3 escenarios Gherkin (Given/When/Then) para business rules CRITICAL de cada módulo
- Lista de sign-offs requeridos (business owner, QA lead, tech lead)
```

**Output esperado:** Sección 6 completa con checklists por módulo, escenarios Gherkin para reglas críticas, y lista de firmas requeridas.

---

## Prompt 8: Revisión y Gap Analysis de Spec Existente

**Nombre:** Auditoría de especificación funcional existente
**Contexto:** El equipo tiene una especificación funcional de un proyecto en curso que necesita revisión de calidad antes de iniciar la siguiente fase de implementación.

**Prompt:**
```
Realiza una auditoría de calidad de la siguiente especificación funcional y genera un gap analysis:

[ADJUNTAR_SPEC_FUNCIONAL_EXISTENTE o PEGAR_CONTENIDO]

Evaluar contra los criterios de calidad IEEE 29148:
1. Correcto: ¿Refleja las necesidades del negocio sin contradicciones?
2. Completo: ¿Todos los módulos tienen use cases? ¿Todos los use cases tienen flujos de excepción?
3. No ambiguo: ¿Existen términos sin definir o condiciones sin cuantificar?
4. Consistente: ¿Hay business rules que se contradicen?
5. Verificable: ¿Los criterios de aceptación son medibles?
6. Trazable: ¿Todos los use cases están linked a business rules y entidades?
7. Priorizado: ¿La priorización de use cases es explícita y justificada?

Validar la estructura:
- [ ] ¿Tiene las 8 secciones o justificación para las faltantes?
- [ ] ¿Están los IDs bidireccionales (UC ↔ BR ↔ ENT ↔ MOD)?
- [ ] ¿Las business rules CRITICAL tienen criterios de aceptación automatizables?
- [ ] ¿El scope OUT es explícito con justificaciones?
- [ ] ¿Las integraciones externas tienen SLAs y modos de falla?

Generar:
- Scorecard de calidad (1-10 por dimensión)
- Lista de gaps críticos (bloquean implementación)
- Lista de gaps importantes (generan riesgo)
- Lista de mejoras opcionales (calidad)
- Versión mejorada de las secciones con más gaps (si el scope lo permite)
```

**Output esperado:** Scorecard de calidad por dimensión, lista priorizada de gaps con impacto, y secciones mejoradas para los gaps más críticos.

---

## Prompt 9: Spec Funcional — Integración de Sistemas Legados

**Nombre:** Spec con énfasis en integración de legado
**Contexto:** El proyecto involucra integración con sistemas legados complejos (SAP, mainframe, APIs sin documentar). La spec necesita documentar los riesgos y contratos de integración con especial cuidado.

**Prompt:**
```
Genera una especificación funcional con énfasis en integración de sistemas legados para [NOMBRE_PROYECTO].

Sistemas legados a integrar:
- [SISTEMA_1]: [TECNOLOGÍA, ANTIGÜEDAD, ESTADO_DE_DOCUMENTACIÓN]
- [SISTEMA_2]: [TECNOLOGÍA, ANTIGÜEDAD, ESTADO_DE_DOCUMENTACIÓN]

Contexto del dominio:
[DESCRIPCIÓN_DEL_NEGOCIO_Y_FLUJOS_PRINCIPALES]

Módulos MVP que interactúan con legado:
- [MÓDULO] ↔ [SISTEMA_LEGADO]: [TIPO_DE_INTEGRACIÓN — sync/async/batch]

Para las integraciones con legado (Section 8 extendida):
- Documentar incertidumbres de API (endpoints no confirmados → marcar como UNVALIDATED)
- Definir estrategia de fallback para cada integración (degraded mode)
- Identificar si se requiere spike técnico antes de comprometer timeline
- Circuit breaker patterns recomendados por tipo de integración
- Strategy para testing de integración (mocks, stubs, contract testing)

Para los casos de uso (Section 2):
- Incluir flujos de excepción específicos para cada punto de integración con legado
- Documentar SLA esperado vs. SLA real conocido del sistema legado
- Identificar use cases que deben tener modo offline/degradado

Business rules de integración a generar:
- ¿Qué hace el sistema cuando el legado no responde?
- ¿Qué datos son master en el legado vs. en el nuevo sistema?
- ¿Hay transformaciones de datos requeridas?
```

**Output esperado:** Spec completa con secciones extendidas de integración, mapa de incertidumbres marcadas como UNVALIDATED, y lista de spikes técnicos recomendados antes de comprometer el timeline.

---

## Prompt 10: Spec para Sistema de IA / Agente

**Nombre:** Especificación funcional para sistemas con componentes de IA
**Contexto:** El MVP incluye componentes de inteligencia artificial (clasificación, recomendación, generación, agentes). La spec debe cubrir los comportamientos no determinísticos y los criterios de calidad del modelo.

**Prompt:**
```
Genera una especificación funcional para [NOMBRE_PROYECTO] que incluye componentes de IA.

Componentes de IA en el MVP:
- [COMPONENTE_1]: [TIPO — clasificación/recomendación/generación/agente] — [DESCRIPCIÓN]
- [COMPONENTE_2]: [TIPO] — [DESCRIPCIÓN]

Para los casos de uso con componentes de IA (Section 2 extendida):
- Documentar el comportamiento esperado del componente de IA (no cómo funciona, sino QUÉ produce)
- Definir el rango de outputs aceptables (ej: "clasificación con confianza ≥ 0.85")
- Documentar el flujo alternativo cuando el modelo produce output de baja confianza
- Definir el flujo de excepción cuando el componente de IA no está disponible

Para las business rules con IA (Section 3):
- Reglas sobre umbral de confianza mínima aceptable
- Reglas sobre qué decisiones NO puede tomar el componente de IA (human-in-the-loop obligatorio)
- Reglas de fairness / sesgo (si aplica para el dominio)
- Reglas de auditoría y explicabilidad (¿el sistema debe poder explicar su decisión?)

Para criterios de aceptación con IA (Section 6):
- Métricas de calidad del modelo: [precision/recall/F1/BLEU/ROUGE — según el tipo]
- Targets mínimos aceptables: [DEFINIR CON EL CLIENTE]
- Criterios de degradación aceptable vs. criterios de falla del componente
- Protocolo de monitoreo y drift detection post-producción

Restricciones éticas y regulatorias:
[LISTAR_RESTRICCIONES_APLICA — GDPR, AI Act, regulación sectorial]
```

**Output esperado:** Spec completa con secciones extendidas para comportamientos de IA, business rules de gobernanza de IA, y criterios de aceptación con métricas cuantitativas del modelo.

---

**Autor:** Javier Montaño | **Framework:** MetodologIA Discovery Framework | **© Comunidad MetodologIA**

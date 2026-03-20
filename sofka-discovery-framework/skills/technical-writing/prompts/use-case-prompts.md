# Use Case Prompts — Technical Writing: Documentation Precision & Progressive Disclosure

> Prompts listos para usar en los casos de uso más frecuentes de esta skill.
> Cada prompt incluye contexto de cuándo usarlo y parámetros variables.

---

## 1. Análisis AS-IS Exhaustivo (10 Secciones)

**Cuándo:** Discovery Phase 1 completada. Se tiene acceso al codebase, infraestructura, y stakeholders. Se necesita el análisis AS-IS con calidad de producción.

```
Redactar el 03_Analisis_AS-IS para el proyecto {NOMBRE_PROYECTO}.

Contexto del sistema:
- Tecnología principal: {TECH_STACK}
- Antigüedad del sistema: {AÑOS} años
- Tamaño del equipo: {NUM_PERSONAS} personas
- Documentación existente: {ESTADO_DOCS} (actualizada/parcial/inexistente)

Estructura requerida (10 secciones):
1. Arquitectura del sistema actual
2. Análisis de base de datos
3. Acoplamiento entre módulos/componentes
4. Rendimiento y capacidad
5. Equipo y conocimiento
6. Deuda técnica
7. Seguridad
8. Integraciones externas
9. Procesos de desarrollo y operaciones
10. Resumen de hallazgos y riesgos

Parámetros:
- {PROFUNDIDAD}: exhaustivo
- {FORMATO}: markdown
- {VARIANTE}: técnica

OBLIGATORIO:
- TL;DR global (3-5 bullets) + TL;DR por sección
- Evidence tags en CADA claim cuantitativo: [CÓDIGO], [CONFIG], [DOC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]
- Tabla Finding → Evidence → Impact → Source en cada sección
- Callouts: 💡 Insight, ⚠️ Risk, ⚖️ Trade-off, 🔍 Evidence
- Cross-references a otros entregables del discovery
- Mínimo 2 diagramas Mermaid con texto de accesibilidad
- Cero filler: cada frase aporta información nueva
- Esfuerzo en FTE-meses, NUNCA precios
```

---

## 2. Brief Técnico Ejecutivo (3 Páginas)

**Cuándo:** El CTO o VP de tecnología necesita un resumen ejecutivo del discovery. Máximo 3 páginas, decisiones accionables.

```
Redactar el 02_Brief_Tecnico para el proyecto {NOMBRE_PROYECTO}.

Resumen del discovery:
{RESUMEN_HALLAZGOS_PRINCIPALES}

Audiencia: {AUDIENCIA} (CTO / VP Engineering / Comité directivo)
Objetivo: {OBJETIVO} (decisión de inversión / aprobación de roadmap / priorización)

Parámetros:
- {PROFUNDIDAD}: ejecutivo
- {FORMATO}: markdown
- Máximo: 3 páginas efectivas

Estructura:
1. Situación actual (1 párrafo + tabla de hallazgos top 5)
2. Riesgos principales (tabla con impacto y urgencia)
3. Escenarios propuestos (resumen de 2-3 líneas cada uno)
4. Recomendación (1 párrafo con justificación)
5. Próximos pasos (lista numerada, con responsable y timeline)

OBLIGATORIO:
- Pirámide invertida: conclusión en el primer párrafo
- Lenguaje Plain Language: comprensible sin background técnico profundo
- Cada dato con evidence tag
- Esfuerzo en magnitudes (FTE-meses), NUNCA precios
- 1 diagrama Mermaid máximo (contexto o timeline)
```

---

## 3. Especificación Funcional (Use Cases + Business Rules)

**Cuándo:** Post-discovery, se necesita documentar la especificación funcional de un módulo o flujo con rigor suficiente para que un equipo de desarrollo implemente sin ambigüedad.

```
Redactar la sección de {MÓDULO_O_FLUJO} en el 07_Especificacion_Funcional del proyecto {NOMBRE_PROYECTO}.

Contexto del módulo:
- Nombre: {NOMBRE_MÓDULO}
- Actores: {LISTA_ACTORES}
- Flujos principales: {LISTA_FLUJOS}
- Reglas de negocio conocidas: {NUM_REGLAS}

Parámetros:
- {PROFUNDIDAD}: exhaustivo
- {FORMATO}: markdown

Estructura por use case:
1. Identificador y nombre (UC-{NUM}: {NOMBRE})
2. Actores primarios y secundarios
3. Precondiciones
4. Flujo principal (numerado, paso a paso)
5. Flujos alternativos (numerados, referenciando paso del flujo principal)
6. Postcondiciones
7. Reglas de negocio (RN-{NUM}: definición + ejemplo + fuente)
8. Criterios de aceptación (Given/When/Then)

OBLIGATORIO:
- Terminología como contrato: definir cada término técnico en primer uso
- Reglas de negocio con fuente: [CÓDIGO], [STAKEHOLDER], [DOC]
- 1 diagrama de secuencia Mermaid por flujo principal
- 1 diagrama de estado Mermaid si el flujo tiene estados
- Cross-reference al AS-IS donde se documentó el comportamiento actual
```

---

## 4. Documento de Handover Operaciones (Plan 90 Días)

**Cuándo:** El discovery está completo y se necesita documentar la transición al equipo de implementación con plan detallado de 90 días.

```
Redactar el 09_Handover_Operaciones para el proyecto {NOMBRE_PROYECTO}.

Contexto de transición:
- Equipo que entrega: {EQUIPO_DISCOVERY}
- Equipo que recibe: {EQUIPO_IMPLEMENTACIÓN}
- Escenario aprobado: {ESCENARIO} (del 05_Escenarios_ToT)
- Timeline de implementación: {MESES} meses
- Riesgos principales del discovery: {TOP_3_RIESGOS}

Parámetros:
- {PROFUNDIDAD}: técnico
- {FORMATO}: markdown

Estructura:
1. TL;DR: decisiones tomadas, escenario aprobado, timeline
2. Plan de 90 días (3 fases de 30 días cada una)
3. RACI de transición
4. Riesgos y mitigaciones (del risk register del discovery)
5. Dependencias y prerequisitos
6. Criterios de éxito por fase
7. Escalation path

OBLIGATORIO:
- Cada tarea con responsable, estimación (FTE-meses), y criterio de completitud
- Diagrama Gantt Mermaid con las 3 fases
- Cross-references a todos los entregables del discovery
- Lista explícita de supuestos [SUPUESTO] y su path de validación
```

---

## 5. Revisión de Calidad de Entregable Existente

**Cuándo:** Se tiene un borrador de entregable que necesita revisión contra los estándares de technical writing.

```
Revisar el siguiente entregable contra los estándares de technical writing del discovery framework:

{CONTENIDO_DEL_ENTREGABLE}

Aplicar el Validation Gate completo:
1. ¿TL;DR presente? (3-5 bullets al inicio)
2. ¿Evidence tags en todos los claims? ([CÓDIGO], [CONFIG], [DOC], [INFERENCIA], [SUPUESTO])
3. ¿Heading hierarchy válida? (h1→h2→h3, sin saltos)
4. ¿Todas las tablas tienen headers?
5. ¿Cross-references válidos?
6. ¿Cero filler? (buscar: "cabe señalar", "es importante destacar", "como se puede observar")
7. ¿Terminología consistente? (mismo término = mismo significado en todo el doc)
8. ¿Diagramas Mermaid presentes? (mínimo 1)

Output requerido:
- Tabla de compliance por criterio (✅/❌ con evidencia)
- Lista priorizada de correcciones (blocker / warning)
- Score de calidad (0-10)
- Versión corregida de las secciones que no pasan el gate
```

---

## 6. Documentación de Hallazgos Técnicos

**Cuándo:** Se tienen hallazgos técnicos de un deep-dive (código, infraestructura, seguridad) que necesitan documentarse con rigor para el 11_Hallazgos_Tecnicos.

```
Documentar los hallazgos técnicos del deep-dive de {ÁREA} para el proyecto {NOMBRE_PROYECTO}.

Hallazgos raw:
{LISTA_HALLAZGOS}

Parámetros:
- {PROFUNDIDAD}: exhaustivo
- {FORMATO}: markdown

Por cada hallazgo:
1. Título descriptivo (no genérico: "Query sin índice en tabla de 12M registros" NO "Problema de rendimiento")
2. Descripción técnica densa (qué se encontró, dónde, cómo se verificó)
3. Evidencia con tags ([CÓDIGO] con ruta de archivo, [CONFIG] con parámetro, etc.)
4. Impacto (🟢/🟡/🔴 con justificación cuantitativa)
5. Recomendación (qué hacer, esfuerzo estimado en FTE-meses)
6. Prioridad (crítica / alta / media / baja)

OBLIGATORIO:
- Hallazgos ordenados por impacto (🔴 primero)
- Tabla resumen al inicio (Finding → Impact → Priority → Effort)
- Cero opinión sin evidencia: cada recomendación justificada por el hallazgo
- Terminología consistente con el 03_Analisis_AS-IS
```

---

## 7. Tabla de Reglas de Negocio Extraídas

**Cuándo:** Se extraen reglas de negocio de código, stored procedures, o entrevistas con stakeholders y se necesita documentarlas de forma auditable.

```
Documentar las reglas de negocio extraídas de {FUENTE} para el módulo {MÓDULO} del proyecto {NOMBRE_PROYECTO}.

Reglas identificadas:
{LISTA_REGLAS}

Formato por regla:
| ID | Nombre | Definición | Ejemplo | Fuente | Confianza | Validado |
|---|---|---|---|---|---|---|
| RN-{NUM} | {Nombre corto} | {Definición precisa, sin ambigüedad} | {Ejemplo con datos reales/ficticios} | [TAG] + ubicación | Alta/Media/Baja | ✅/❌ |

OBLIGATORIO:
- Cada regla con ID único y persistente (RN-001, RN-002...)
- Definición sin ambigüedad: otra persona debe poder implementarla sin preguntar
- Source tag obligatorio: [CÓDIGO] con ruta, [STAKEHOLDER] con nombre, [DOC] con documento
- Confianza baja requiere path de validación explícito
- Cross-reference a stored procedure o clase donde se encontró
```

---

## 8. Conversión de Análisis Raw a Prosa de Calidad

**Cuándo:** Se tiene análisis técnico en formato raw (bullets, notas, datos sueltos) que necesita transformarse en prosa técnica de calidad enterprise.

```
Transformar el siguiente análisis raw en prosa técnica de calidad para el entregable {ENTREGABLE}:

{CONTENIDO_RAW}

Reglas de transformación:
1. Aplicar progressive disclosure: TL;DR primero, detalle después
2. Convertir bullets en párrafos densos donde corresponda
3. Agregar evidence tags a cada claim (pedir fuente si no está clara)
4. Construir tablas Finding → Evidence → Impact → Source para hallazgos
5. Insertar callouts donde corresponda (💡 Insight después de datos, ⚠️ Risk en hallazgos críticos)
6. Eliminar TODO el filler: "cabe señalar", "es importante", "como se mencionó"
7. Garantizar terminología consistente con el glosario del discovery
8. Agregar cross-references a entregables relacionados

Output: sección completa lista para insertar en el entregable, cumpliendo todos los criterios del Validation Gate.
```

---

**Autor:** Javier Montaño | **Última actualización:** 13 de marzo de 2026
**© Comunidad MetodologIA — Todos los derechos reservados**

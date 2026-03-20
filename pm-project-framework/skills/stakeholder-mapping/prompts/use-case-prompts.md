---
skill: stakeholder-mapping
title: Use-Case Prompts — Stakeholder Mapping
version: 1.0
author: Javier Montaño
copyright: © Comunidad MetodologIA
updated: 2026-03-13
---

# Use-Case Prompts: Stakeholder Mapping

Prompts listos para usar en escenarios reales de discovery y gestión de stakeholders. Cada prompt está diseñado para invocarse directamente en una sesión de trabajo con el MetodologIA Discovery Framework.

---

## Prompt 1: Mapa Inicial desde Descripción de Proyecto

**Nombre:** Identificación rápida de stakeholders desde descripción narrativa

**Contexto de uso:** Al inicio de un engagement cuando el cliente ha descrito el proyecto en lenguaje natural pero no ha identificado formalmente a los stakeholders involucrados.

**Prompt:**
```
Analiza la siguiente descripción de proyecto y genera un mapa inicial de stakeholders:

Proyecto: [NOMBRE DEL PROYECTO]
Descripción: [DESCRIPCIÓN NARRATIVA DEL PROYECTO — 1 a 5 párrafos]
Industria: [INDUSTRIA]
Tamaño de organización: [PYMES / MEDIANA / GRANDE / CORPORATIVO]

A partir de esta información:
1. Identifica todos los stakeholders probables organizados por categoría (sponsors, tomadores de decisión, implementadores, usuarios finales, partes afectadas, externos/reguladores)
2. Para cada stakeholder: nombre/rol, categoría, nivel probable de poder (Alto/Medio/Bajo), nivel probable de interés (Alto/Medio/Bajo), y actitud inicial estimada (+/-/?)
3. Lista 5 stakeholders ocultos a verificar usando el método de veto scan y rastro de decisiones
4. Genera las preguntas de descubrimiento para validar este mapa en la primera sesión con el cliente

Formato de salida: Markdown con tabla de stakeholders + lista de preguntas de validación.
```

**Salida esperada:** Tabla de stakeholders con 8-15 roles identificados, clasificados por cuadrante preliminar, con 5 preguntas de validación para la primera entrevista.

---

## Prompt 2: Construcción de Matriz Influencia-Interés con Datos Reales

**Nombre:** Matriz poder-interés con estrategia de engagement por cuadrante

**Contexto de uso:** Cuando ya se han identificado los stakeholders y se cuenta con información suficiente para posicionarlos en la matriz y diseñar estrategias de engagement.

**Prompt:**
```
Con base en los siguientes stakeholders identificados para el proyecto [NOMBRE DEL PROYECTO], construye la matriz de influencia-interés completa:

Lista de stakeholders:
[STAKEHOLDER 1]: Rol=[ROL], Poder=[ALTO/MEDIO/BAJO], Interés=[ALTO/MEDIO/BAJO], Actitud=[+/-/?], Contexto=[BREVE DESCRIPCIÓN]
[STAKEHOLDER 2]: ...
[continúa la lista]

Para cada cuadrante, genera:
1. Lista de stakeholders asignados con justificación del posicionamiento
2. Estrategia de engagement específica (qué comunicar, con qué frecuencia, a través de qué canal)
3. Para actitud negativa (-): plan de manejo con 3 acciones concretas
4. Coalición mínima ganadora: identifica el conjunto mínimo de stakeholders cuyo apoyo garantiza viabilidad del proyecto
5. Stakeholders en riesgo de cambio de cuadrante durante el proyecto (con trigger identificado)

Incluye diagrama Mermaid del quadrant chart.
```

**Salida esperada:** Matriz completa con estrategias por cuadrante, plan de manejo para stakeholders negativos, coalición mínima identificada, y diagrama Mermaid.

---

## Prompt 3: Generación de Matriz RACI para Entregables de Discovery

**Nombre:** RACI completo para el pipeline de discovery de MetodologIA

**Contexto de uso:** Al planificar el proceso de discovery, cuando se necesita asignar responsabilidades claras a los stakeholders del cliente para cada entregable del framework.

**Prompt:**
```
Genera una matriz RACI para el proyecto de discovery [NOMBRE DEL PROYECTO] con los siguientes participantes del lado del cliente:

Stakeholders cliente: [LISTA DE ROLES CON NOMBRES SI DISPONIBLES]
Stakeholders MetodologIA: [LISTA DEL EQUIPO METODOLOGIA]

Los entregables del discovery son:
- 00_Plan de Discovery (gobernanza del proceso)
- 01_Mapa de Stakeholders (este documento)
- 02_Brief Técnico Ejecutivo
- 03_Análisis AS-IS
- 04_Mapeo de Flujos
- 05_Escenarios de Solución (Tree-of-Thought)
- 06_Roadmap de Solución
- 07_Especificación Funcional
- 08_Pitch Ejecutivo

Para cada entregable, asigna R (Responsable), A (Accountable — ÚNICO por entregable), C (Consultado), I (Informado).
Incluye:
1. Tabla RACI completa
2. Validación de regla de "A único" por entregable
3. Protocolo de escalamiento con criterios de trigger y tiempos máximos de resolución
4. Proceso de resolución de conflictos cuando dos stakeholders tienen posiciones opuestas

Formato: tabla Markdown + sección de protocolo de escalamiento.
```

**Salida esperada:** Tabla RACI completa para 9 entregables, validación de unicidad del Accountable, y protocolo de escalamiento de 4-5 pasos.

---

## Prompt 4: Plan de Comunicación Personalizado por Segmento

**Nombre:** Plan de comunicación segmentado por audiencia

**Contexto de uso:** Una vez completada la matriz de influencia-interés, para diseñar la estrategia de comunicación del proyecto adaptada a cada grupo de stakeholders.

**Prompt:**
```
Diseña el plan de comunicación para el proyecto [NOMBRE DEL PROYECTO] con duración estimada de [DURACIÓN] semanas/meses.

Grupos de stakeholders identificados:
- [GRUPO 1 — ej: C-Suite / Sponsors]: [NOMBRES/ROLES]
- [GRUPO 2 — ej: Líderes de Área]: [NOMBRES/ROLES]
- [GRUPO 3 — ej: Equipo Técnico]: [NOMBRES/ROLES]
- [GRUPO 4 — ej: Usuarios Finales]: [NOMBRES/ROLES]

Para cada grupo genera:
1. Objetivo de comunicación (qué necesitan saber/sentir/hacer)
2. Canal principal y canal de respaldo
3. Frecuencia y formato (reunión, reporte, dashboard, email, town hall)
4. Dueño de la comunicación (rol de MetodologIA o del cliente)
5. Mensaje clave adaptado al vocabulario y preocupaciones del grupo
6. Mecanismo de retroalimentación (cómo responden, hacen preguntas, escalan)

Incluye también:
- Calendario de cadencia de los primeros 60 días
- Protocolo de comunicación de crisis con plantilla de holding statement
- Indicadores de que la comunicación está funcionando (engagement metrics)

Formato: tabla de plan de comunicación + calendario visual en texto + protocolo de crisis.
```

**Salida esperada:** Matriz de comunicación completa, calendario de primeros 60 días, y protocolo de crisis con plantilla.

---

## Prompt 5: Evaluación de Change Readiness por Departamento

**Nombre:** Assessment de readiness de cambio con arquetipos de resistencia

**Contexto de uso:** Antes de diseñar el plan de implementación, para evaluar la capacidad de absorción del cambio en cada área del cliente.

**Prompt:**
```
Realiza un assessment de change readiness para el proyecto [NOMBRE DEL PROYECTO] que implementará [BREVE DESCRIPCIÓN DEL CAMBIO].

Departamentos/áreas en scope: [LISTA DE ÁREAS]

Para cada área, evalúa:
1. Posición en la curva de adopción (innovadores, early adopters, mayoría temprana, mayoría tardía, rezagados)
2. Arquetipo(s) de resistencia predominante(s): Escéptico / Bloqueador / Resistente Pasivo / Saboteador / Doliente
3. Gatillo de resistencia principal (qué están protegiendo: control, estatus, recursos, certeza, identidad)
4. Intervención recomendada para el arquetipo identificado
5. Puntuación de readiness (1-5) con justificación

Adicionalmente:
- Identifica 3 champions naturales con plan de activación específico
- Calcula la capacidad de cambio de la organización (cuántos cambios simultáneos puede absorber)
- Genera el plan de training básico para cerrar las brechas de conocimiento identificadas
- Señala el riesgo de fatiga de cambio si el proyecto se superpone con otras iniciativas en curso

Formato: tabla de readiness + narrativa de riesgos + plan de activación de champions.
```

**Salida esperada:** Tabla de readiness por área (puntuación 1-5), arquetipos de resistencia con intervenciones, lista de champions con plan de activación, y evaluación de capacidad de cambio organizacional.

---

## Prompt 6: Detección de Stakeholders Ocultos e Influenciadores Informales

**Nombre:** Mapeo de red informal y detección de poder no declarado

**Contexto de uso:** Cuando el organigrama formal no parece reflejar la realidad política del cliente, o cuando proyectos anteriores fallaron por razones que no quedaron documentadas.

**Prompt:**
```
Ayúdame a detectar stakeholders ocultos e influenciadores informales en el proyecto [NOMBRE DEL PROYECTO] en la empresa [NOMBRE/TIPO DE EMPRESA] de la industria [INDUSTRIA].

Contexto disponible:
- Organigrama formal: [DESCRIPCIÓN O ADJUNTO]
- Iniciativas similares pasadas en la organización: [DESCRIPCIÓN DE RESULTADOS]
- Comentarios relevantes recogidos en entrevistas: [CITAS O RESUMEN]

Aplica las siguientes técnicas de detección:
1. **Arqueología de reuniones:** ¿Qué roles deberían aparecer en reuniones de proyectos similares que no están en el mapa actual?
2. **Rastro de decisiones:** ¿Quién típicamente aprueba/bloquea decisiones de [TIPO DE DECISIÓN] en esta industria?
3. **Análisis de agujeros estructurales:** ¿Quién conecta grupos que de otro modo no se comunicarían?
4. **Veto scan:** Para cada entregable del proyecto, ¿quién podría bloquearlo si no está involucrado?
5. **Rastro presupuestario:** ¿Quién controla el gasto discrecional que afecta este proyecto?

Genera:
- Lista de 5-8 stakeholders ocultos candidatos con rol probable y técnica de detección
- Preguntas específicas para revelar cada stakeholder en las próximas entrevistas
- Riesgo de cada stakeholder oculto si no es incorporado al mapa

Formato: tabla de stakeholders ocultos + guía de preguntas de entrevista.
```

**Salida esperada:** Lista priorizada de stakeholders ocultos, técnica que los reveló, riesgo de omisión, y preguntas de entrevista para confirmar su existencia e influencia.

---

## Prompt 7: Dashboard de Monitoreo de Engagement

**Nombre:** Panel de salud de stakeholders para tracking continuo

**Contexto de uso:** Durante la ejecución del proyecto, para mantener un seguimiento estructurado del estado de relación con cada stakeholder clave.

**Prompt:**
```
Diseña un dashboard de monitoreo de engagement para el proyecto [NOMBRE DEL PROYECTO] con los siguientes stakeholders clave:

[LISTA DE STAKEHOLDERS CON ROL Y CUADRANTE EN LA MATRIZ]

Para el dashboard, incluye:
1. **Estado de relación:** Semáforo Verde/Amarillo/Rojo por stakeholder con criterios de clasificación explícitos
2. **Métricas de participación:** Asistencia a reuniones, tiempo de respuesta a comunicaciones, retroalimentación entregada vs. comprometida
3. **Indicadores de alerta temprana:** 5 señales que indican deterioro de la relación ANTES de que se vuelva crítica
4. **Log de issues activos:** Por stakeholder con status, propietario y fecha de resolución comprometida
5. **Tendencia de sentimiento:** Evolución semana a semana (posible con datos cualitativos de reuniones)

Genera también:
- Protocolo de acción cuando un stakeholder pasa a Rojo
- Cadencia de revisión del dashboard (frecuencia recomendada por rol)
- Template de nota de sesión para capturar señales de engagement después de cada reunión

Formato: estructura del dashboard en Markdown + protocolos de respuesta.
```

**Salida esperada:** Template completo del dashboard con semáforos, indicadores de alerta temprana, log de issues y protocolos de respuesta.

---

## Prompt 8: Mapa de Stakeholders para Reorganización o Post-Fusión

**Nombre:** Mapeo acelerado en entorno de cambio estructural

**Contexto de uso:** Cuando el cliente está en medio de una fusión, adquisición o reorganización donde el mapa de stakeholders es particularmente volátil e incierto.

**Prompt:**
```
El cliente [NOMBRE DE EMPRESA] está atravesando [FUSIÓN / ADQUISICIÓN / REORGANIZACIÓN].
El proyecto [NOMBRE DEL PROYECTO] se ejecutará durante este período de transición.

Contexto de la restructura:
- Descripción: [QUÉ ESTÁ CAMBIANDO]
- Timeline estimado: [CUÁNDO SE COMPLETA LA RESTRUCTURA]
- Impacto en roles: [QUIÉN PIERDE, GANA O CAMBIA PODER]

Genera un plan de mapeo de stakeholders adaptado a este contexto de incertidumbre:

1. **Mapa de estado actual** (con la estructura vigente)
2. **Mapa de estado objetivo** (con la estructura post-reorganización estimada)
3. **Vacíos de poder:** Roles o decisiones que quedarán temporalmente sin dueño claro durante la transición
4. **Stakeholders en riesgo de salida:** Personas cuya continuidad es incierta y cómo se mitiga la dependencia
5. **Stakeholders emergentes:** Nuevos actores con poder creciente durante y post-reorganización
6. **Frecuencia de actualización:** Plan de re-assessment semanal durante la transición con triggers de revisión extraordinaria
7. **Protocolo de onboarding:** Cómo incorporar nuevos stakeholders al proyecto cuando cambian los roles

Formato: dos mapas (antes/después) + análisis de vacíos de poder + plan de gestión de transición.
```

**Salida esperada:** Doble mapa (actual / objetivo), análisis de vacíos de poder, identificación de stakeholders en riesgo, y protocolo de re-assessment continuo.

---

## Prompt 9: Activación de Champions para Piloto o Go-Live

**Nombre:** Plan de activación de champions para impulsar adopción

**Contexto de uso:** En la fase de transición hacia implementación, cuando se necesita convertir a los early adopters identificados en el mapa en agentes activos de cambio.

**Prompt:**
```
El proyecto [NOMBRE DEL PROYECTO] está avanzando hacia [PILOTO / GO-LIVE / LANZAMIENTO GRADUAL].

Champions identificados durante el mapeo:
- [CHAMPION 1]: Rol=[ROL], Área=[ÁREA], Fortaleza=[POR QUÉ ES BUEN CHAMPION]
- [CHAMPION 2]: ...
- [continúa]

Genera un plan de activación de champions que incluya:
1. **Onboarding de champion:** Sesión de briefing, materiales de apoyo, mensajes clave que deben transmitir
2. **Rol específico durante el piloto:** Qué se espera concretamente de cada champion (actividades, frecuencia, métricas)
3. **Toolkit del champion:** Respuestas a las 5 objeciones más frecuentes en su área específica
4. **Reconocimiento y visibilidad:** Cómo se reconoce públicamente su rol (importante para motivación)
5. **Escalamiento al champion:** Qué problemas de adopción deben resolver ellos vs. escalar al equipo del proyecto
6. **Métricas de éxito del champion:** Cómo medimos que están siendo efectivos en su rol

También genera el mensaje de activación inicial que el sponsor ejecutivo debería comunicar para legitimar el rol de champions.

Formato: plan por champion + toolkit de objeciones + mensaje de activación del sponsor.
```

**Salida esperada:** Plan individualizado por champion con toolkit de objeciones, métricas de efectividad, y mensaje de activación del sponsor.

---

## Prompt 10: Recuperación de Proyecto con Desalineación de Stakeholders

**Nombre:** Diagnóstico y plan de recuperación de alineación stakeholder

**Contexto de uso:** Cuando un proyecto en ejecución está experimentando resistencia activa, silencios preocupantes, o pérdida de apoyo de stakeholders que antes eran favorables.

**Prompt:**
```
El proyecto [NOMBRE DEL PROYECTO] está experimentando los siguientes problemas de alineación:

Síntomas observados:
- [SÍNTOMA 1 — ej: El gerente de operaciones dejó de asistir a las reuniones semanales]
- [SÍNTOMA 2 — ej: El CTO no ha aprobado el presupuesto comprometido desde hace 3 semanas]
- [SÍNTOMA 3 — ej: El equipo de TI está generando retrasos sistemáticos en la provisión de accesos]

Realiza un diagnóstico de alineación de stakeholders:
1. **Análisis de síntomas:** Mapea cada síntoma al stakeholder probable y al arquetipo de resistencia
2. **Hipótesis de causa raíz:** Para cada caso, genera 2-3 hipótesis de por qué se produjo la desalineación
3. **Plan de recuperación urgente (próximos 5 días):** Acciones específicas con dueño, stakeholder objetivo y resultado esperado
4. **Plan de re-alineación estructural (próximas 3 semanas):** Intervenciones que resuelven la causa raíz
5. **Cambios en el plan de comunicación:** Ajustes necesarios para prevenir recurrencia
6. **Escenarios de escalamiento:** Si las acciones anteriores no funcionan, qué sigue (incluyendo cuándo involucrar al sponsor ejecutivo)

Formato: análisis por síntoma + plan de acciones en tabla con prioridad/urgencia + trigger de escalamiento.
```

**Salida esperada:** Diagnóstico síntoma-causa-arquetipo, plan de acciones de 5 días con responsables, plan de re-alineación de 3 semanas, y árbol de decisión de escalamiento.

---
*© Comunidad MetodologIA. Autor: Javier Montaño. Uso interno y para clientes MetodologIA.*

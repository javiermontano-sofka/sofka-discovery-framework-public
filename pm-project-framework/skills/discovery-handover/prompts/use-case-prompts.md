---
skill: discovery-handover
title: Use-Case Prompts — Discovery Handover
framework: MetodologIA Discovery Framework
author: Javier Montaño
copyright: © Comunidad MetodologIA
updated: 2026-03-13
---

# Use-Case Prompts: Discovery Handover

Prompts listos para usar con el skill `discovery-handover`. Copiar el texto del prompt, ajustar los placeholders entre corchetes `[...]`, y ejecutar. Todos requieren que Gate 3 esté aprobado.

---

## Prompt 1: Paquete de Handover Completo — Operaciones + Comercial

**Nombre:** Handover completo (ambos receptores)
**Contexto:** El discovery concluyó con Gate 3 aprobado. El deal no está cerrado aún. Se necesita el paquete completo para activar tanto el equipo de ejecución como el proceso de cierre comercial.

**Prompt:**
```
Ejecuta el skill discovery-handover con paquete completo para ambos receptores.

Proyecto: [NOMBRE_PROYECTO]
Cliente: [NOMBRE_CLIENTE]
Gate 3 aprobado: [FECHA]

Entregables disponibles:
- Stakeholder Map: [RUTA o "adjunto"]
- AS-IS Analysis: [RUTA o "adjunto"]
- Mapeo de Flujos: [RUTA o "adjunto"]
- Escenarios ToT: [RUTA o "adjunto"]
- Solution Roadmap: [RUTA o "adjunto"]
- Especificación Funcional: [RUTA o "adjunto"]
- Pitch Ejecutivo: [RUTA o "adjunto"]

Receptor: Ambos (Operaciones + Comercial)
Escenario aprobado: [NOMBRE_ESCENARIO] — Score: [X/100]
Inversión aprobada: [RANGO_PRESUPUESTAL]
Timeline aprobado: [DURACIÓN_EN_MESES] meses
Top 3 riesgos activos: [RIESGO_1] / [RIESGO_2] / [RIESGO_3]

Formato: {FORMATO}=markdown
Variante: {VARIANTE}=técnica (8 secciones completas)
Modo: {MODO}=piloto-auto

Output: 09_Handover_Operaciones_[NOMBRE_PROYECTO].md
```

**Output esperado:** Documento completo de 30-50 páginas con las 8 secciones, diagramas Mermaid (governance flow, 90-day Gantt, stakeholder transition), todas las tablas con datos reales, y owners asignados.

---

## Prompt 2: Paquete Comercial Solo — Pre-Cierre

**Nombre:** Activación comercial para cierre del deal
**Contexto:** El equipo comercial necesita la propuesta derivada del discovery para iniciar negociaciones. El equipo de ejecución no está aún activo.

**Prompt:**
```
Ejecuta el skill discovery-handover con enfoque exclusivo en activación comercial.

Proyecto: [NOMBRE_PROYECTO]
Cliente: [NOMBRE_CLIENTE] — Sponsor: [NOMBRE_SPONSOR]
Fecha objetivo de cierre comercial: [FECHA]

Input principal:
- Pitch Ejecutivo: [RUTA o PEGAR_CONTENIDO]
- Solution Roadmap (sección de pricing): [RUTA o PEGAR_SECCIÓN]

Receptor: Comercial
Generar únicamente:
- S1: Resumen Ejecutivo de Transición (máximo 1 página)
- S2: Paquete de Activación Comercial completo (S2.1 a S2.4)

S3-S7: marcar como "pendiente post-cierre"

Contexto de negociación:
- Competidores identificados: [LISTAR o "no identificados"]
- Objeciones conocidas del sponsor: [LISTAR o "no identificadas"]
- Modelo de facturación preferido del cliente: [por fase / mensual / hitos / "por definir"]
- Urgencia del cliente: [ALTA / MEDIA / BAJA] — [JUSTIFICACIÓN]

Formato: {FORMATO}=markdown
```

**Output esperado:** S1 + S2 completo con narrativa de propuesta, estructura de pricing con 5 fases, condiciones comerciales, y cronograma de 4 semanas para el cierre.

---

## Prompt 3: Plan de 90 Días — Kickoff de Ejecución

**Nombre:** Plan operativo de 90 días para el equipo de ejecución
**Contexto:** El deal está cerrado. El equipo de ejecución ya está asignado. Se necesita el plan operativo detallado para los primeros 90 días.

**Prompt:**
```
Ejecuta el skill discovery-handover con enfoque en el plan operativo de ejecución.

Proyecto: [NOMBRE_PROYECTO]
Fecha de inicio: [FECHA_INICIO_SPRINT_0]
Equipo de ejecución:
- Delivery Manager / PM: [NOMBRE]
- Tech Lead: [NOMBRE]
- Product Owner: [NOMBRE]
- Developers: [CANTIDAD y SENIORITY]
- QA: [NOMBRE o CANTIDAD]
- DevOps: [NOMBRE]

Input principal:
- Solution Roadmap Phase 1 (Foundation): [RUTA o PEGAR_CONTENIDO]
- Especificación Funcional: [RUTA o PEGAR_CONTENIDO_DE_MODULES_Y_USE_CASES]
- Risk Register del Roadmap: [RUTA o PEGAR_CONTENIDO]

Generar:
- S3: Checklist de Readiness completo con owners y fechas absolutas
- S4: Plan de 90 días con:
  - Sprint 0 (Semanas 1-2): tareas día por día
  - Sprints 1-3 (Semanas 3-8): Foundation execution — módulos y use cases
  - Sprints 4-6 (Semanas 9-14): Foundation completion — integración y performance
  - Métricas de seguimiento con targets numéricos
- S5: Protocolo de gobernanza completo con escalation path

Usar fechas absolutas (formato YYYY-MM-DD), no "Semana X".
Fecha de inicio del Sprint 0: [FECHA_INICIO]
```

**Output esperado:** S3 + S4 + S5 completos con Gantt chart Mermaid del primer mes, tablas de readiness con fechas absolutas, escalation path documentado, y métricas de seguimiento configuradas.

---

## Prompt 4: Tracker de Supuestos y Riesgos Heredados

**Nombre:** Operacionalizar el risk register del discovery para ejecución
**Contexto:** El equipo de ejecución necesita un tracker operativo de los supuestos y riesgos del discovery, con owners claros y early warning indicators.

**Prompt:**
```
Genera el Tracker de Validación de Supuestos y Riesgos (S6) del handover para [NOMBRE_PROYECTO].

Supuestos del discovery que requieren validación en ejecución:
[PEGAR_ESTIMATION_PIVOTS_Y_SUPUESTOS_DEL_ROADMAP — o pegar el Risk Register completo]

Riesgos activos del discovery:
[PEGAR_RISK_REGISTER_DEL_PHASE_4]

Para los supuestos críticos (S6.1):
- Validación propuesta (PoC / spike / vendor evaluation / análisis de datos)
- Deadline de validación (fecha absoluta en los primeros 30 días)
- Owner en el equipo de ejecución (rol + nombre si disponible)
- Qué pasa si el supuesto se invalida (escenario alternativo a activar)

Para los riesgos heredados (S6.2):
- Probabilidad actual (Alta/Media/Baja) calibrada para la fase de ejecución
- Impacto si se materializa
- Mitigación activa (acción concreta, no solo monitoreo)
- Early warning indicator: métrica o evento específico que señala materialización
- Owner en el equipo de ejecución

Para los kill criteria (S6.3):
- Definir 4-6 kill criteria con umbrales numéricos específicos
- Acción clara cuando se alcanza el umbral
- Decision maker identificado (no "el equipo")

Contexto del proyecto para calibrar thresholds:
- Budget total: [RANGO]
- Timeline Foundation: [MESES]
- Tamaño del equipo: [FTE]
- Industria: [SECTOR]
```

**Output esperado:** S6 completo con tablas de supuestos, riesgos y kill criteria listos para operar. Todos los campos con valores reales, sin placeholders.

---

## Prompt 5: Transición de Stakeholders — Nuevo Equipo de Governance

**Nombre:** Mapeo de stakeholders para la fase de ejecución
**Contexto:** El equipo de discovery ha mapeado los stakeholders del cliente. Ahora se necesita redefinir su involucramiento para la fase de ejecución, con nuevas ceremonias y frecuencias de comunicación.

**Prompt:**
```
Genera la Matriz de Transición de Stakeholders (S7) y el Protocolo de Governance (S5) para [NOMBRE_PROYECTO].

Stakeholder map del discovery (Phase 0):
[PEGAR_TABLA_DE_STAKEHOLDERS_O_CONTENIDO_DE_01_STAKEHOLDER_MAP]

Roles del equipo de discovery a transitionar:
- Discovery Conductor: [NOMBRE] → rol en ejecución: [ROL o "sale del proyecto"]
- Technical Architect: [NOMBRE] → continuidad: [SÍ/NO]
- Domain Analyst: [NOMBRE] → continuidad: [SÍ/NO]
- Delivery Manager: [NOMBRE] → continuidad: [SÍ/NO]

Equipo de ejecución confirmado:
[LISTAR_ROLES_Y_NOMBRES]

Para la Matriz de Transición (S7):
- Transformar cada stakeholder del discovery a su nuevo rol en ejecución
- Definir el "Engagement Shift": de qué nivel de involucramiento a cuál
- Establecer el canal y frecuencia de comunicación para cada stakeholder
- Identificar stakeholders resistentes y plan de activación como early adopters

Para el Protocolo de Governance (S5):
- Transición de roles discovery → ejecución con nombres reales
- Estructura de ceremonias calibrada para el tamaño del equipo ([FTE] FTE)
- Escalation path: 4 niveles con tiempos de resolución
- Canales de comunicación: Slack/Teams, JIRA/Linear, reporting dashboard

¿El equipo es mayor a 5 FTE? [SÍ/NO] — calibrar governance (completa si >5, ligera si ≤5)
¿El budget es mayor a $500K? [SÍ/NO] — calibrar frecuencia de financial tracking
```

**Output esperado:** S5 + S7 completos con diagrama de escalation path Mermaid, tabla de transición de stakeholders, estructura de ceremonias con participantes y propósitos definidos.

---

## Prompt 6: Resumen Ejecutivo de Transición — Para Steering Committee

**Nombre:** Executive summary de cierre del discovery para steering
**Contexto:** El Steering Committee necesita un resumen del estado del discovery y los próximos pasos antes de aprobar el inicio de ejecución.

**Prompt:**
```
Genera el Resumen Ejecutivo de Transición (S1) del handover para presentar al Steering Committee de [NOMBRE_PROYECTO].

Audiencia: [LISTAR_NOMBRES_Y_ROLES_DEL_STEERING_COMMITTEE]
Fecha de presentación: [FECHA]
Tiempo disponible: [MINUTOS] minutos de presentación

Estado del discovery:
- Fases completadas: [LISTAR]
- Gates aprobados: [G1/G2/G3 con fechas]
- Fecha de cierre del discovery: [FECHA]

Escenario aprobado:
- Nombre: [NOMBRE_ESCENARIO]
- Score Gate 3: [X/100]
- Rationale de selección: [2-3 bullets del criterio de selección]

Inversión aprobada:
- Rango presupuestal: [DE $X A $Y]
- Timeline total: [MESES] meses
- Phase Foundation (primeros 90 días): [INVERSIÓN]

Top 5 próximos pasos (primeras 2 semanas):
[LISTAR_O_PEGAR_DE_LOS_ENTREGABLES_DEL_DISCOVERY]

Top 3 riesgos críticos activos:
[PEGAR_TOP_RIESGOS_DEL_RISK_REGISTER]

Formato: máximo 1 página de texto + 1 tabla de próximos pasos.
Tono: ejecutivo, directo, sin jerga técnica.
```

**Output esperado:** S1 de máximo 2 páginas en formato ejecutivo con tabla de próximos pasos (5 acciones con owner y fecha), tabla de riesgos activos, y resumen del escenario aprobado.

---

## Prompt 7: Handover Express — Quick Reference Pipeline

**Nombre:** Handover simplificado para pipelines cortos
**Contexto:** Se ejecutó el Quick Reference Pipeline (Fases 1→3→5b) sin la fase completa de discovery. Se necesita un handover simplificado coherente con el alcance reducido del análisis.

**Prompt:**
```
Ejecuta el skill discovery-handover en variante simplificada para Quick Reference Pipeline.

Proyecto: [NOMBRE_PROYECTO]
Fases completadas: Phase 1 (AS-IS), Phase 3 (Escenarios), Phase 5b (Pitch)
Fases NO completadas: Phase 0, Phase 2, Phase 4, Phase 5a

Entregables disponibles:
- AS-IS Analysis: [RUTA o ADJUNTO]
- Escenarios ToT: [RUTA o ADJUNTO]
- Pitch Ejecutivo: [RUTA o ADJUNTO]

Generar solo:
- S1: Resumen Ejecutivo (con advertencia explícita del scope reducido del discovery)
- S2: Paquete Comercial (si receptor incluye Comercial)
- S6: Tracker de Supuestos (especialmente crítico dado el análisis reducido — más supuestos UNVALIDATED)

Omitir S3 (no hay roadmap de infraestructura), S4 (sin spec funcional para el plan de sprints), S5 (governance a definir post-cierre), S7 (sin stakeholder map formal).

En el S6, marcar como supuestos críticos:
- TODO lo que normalmente se validaría en Phase 2 (flujos)
- TODO lo que normalmente se validaría en Phase 4 (estimaciones)
- TODO lo que normalmente se validaría en Phase 5a (spec funcional)

Generar lista de recomendaciones: qué fases de discovery se deben completar en la siguiente iteración para reducir los supuestos críticos.
```

**Output esperado:** S1 + S2 + S6 simplificados, con disclaimer explícito del scope reducido, lista extendida de supuestos críticos, y recomendaciones para completar el discovery en fases futuras.

---

## Prompt 8: Revisión y Mejora de Handover Existente

**Nombre:** Auditoría y mejora de un handover ya generado
**Contexto:** El equipo tiene un handover de un proyecto que está por comenzar la ejecución pero quiere asegurar su calidad antes del kickoff.

**Prompt:**
```
Realiza una auditoría de calidad del siguiente handover y genera las mejoras necesarias.

[ADJUNTAR_HANDOVER_EXISTENTE o PEGAR_CONTENIDO]

Validar contra los 10 criterios del Validation Gate del skill:
1. ¿Todas las tablas tienen datos reales (no placeholders)?
2. ¿Todos los owners están asignados por nombre?
3. ¿Las fechas son absolutas (YYYY-MM-DD), no relativas ("Semana X")?
4. ¿Los riesgos tienen early warning indicators cuantificables?
5. ¿Los kill criteria tienen umbrales numéricos?
6. ¿La estructura de pricing es completa (si el receptor incluye Comercial)?
7. ¿El plan de 90 días está alineado con el Phase 1 Foundation del roadmap?
8. ¿El RACI de ejecución es diferente al RACI de discovery?
9. ¿El escalation path está documentado con tiempos de resolución?
10. ¿La estructura de ceremonias está definida con participantes?

Para cada criterio: CUMPLE / NO CUMPLE / PARCIAL + descripción del gap.

Generar:
- Scorecard de calidad (puntuación 0-10 por criterio)
- Lista de gaps críticos (impiden un kickoff exitoso)
- Lista de mejoras importantes (generan riesgo si no se atienden)
- Versión mejorada de las secciones con más gaps
```

**Output esperado:** Scorecard por criterio, lista de gaps con impacto, y secciones mejoradas para los 2-3 criterios con mayor deficiencia.

---

**Autor:** Javier Montaño | **Framework:** MetodologIA Discovery Framework | **© Comunidad MetodologIA**

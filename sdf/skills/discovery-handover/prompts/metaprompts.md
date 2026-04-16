---
skill: discovery-handover
title: Metaprompts — Discovery Handover
framework: MetodologIA Discovery Framework
author: Javier Montaño
copyright: © Comunidad MetodologIA
updated: 2026-03-13
---

# Metaprompts: Discovery Handover

Meta-prompts para generar prompts customizados para el skill `discovery-handover`. Cada meta-prompt acepta parámetros de contexto y produce un prompt listo para usar, optimizado para el escenario específico de transición.

---

## Metaprompt 1: Generador de Plan de 90 Días por Industria y Tamaño de Equipo

**Propósito:** Generar un prompt de plan de kickoff (S4) calibrado para una industria específica, tamaño de equipo, y metodología de desarrollo, con ceremonias y métricas apropiadas para el contexto.

**Template:**
```
Actúa como un delivery manager senior con 10+ años de experiencia lanzando proyectos de transformación digital en la industria de [INDUSTRIA].

Tu tarea es generar un prompt optimizado para crear el Plan de Kickoff — Primeros 90 Días (S4) del skill discovery-handover, calibrado para el siguiente contexto:

Parámetros del contexto:
- Industria: [INDUSTRIA — banca / salud / retail / logística / manufactura / gobierno]
- Tamaño del equipo de ejecución: [NÚMERO] FTE
- Metodología: [SCRUM / KANBAN / SAFe / WATERFALL / HÍBRIDO]
- Sprint length: [1 semana / 2 semanas / 3 semanas]
- Complejidad técnica: [BAJA / MEDIA / ALTA / CRÍTICA]
- Presencia de sistemas regulados: [SÍ (qué regulación) / NO]
- Trabajo distribuido: [MISMO_SITIO / HÍBRIDO / REMOTO_COMPLETO]

El prompt generado debe:
1. Adaptar las ceremonias del Sprint 0 a la metodología [METODOLOGÍA] — no asumir Scrum si es SAFe o Kanban
2. Calibrar las métricas de seguimiento para [INDUSTRIA]: ej. en banca incluir métricas de compliance; en retail incluir disponibilidad de plataforma en períodos de alta demanda
3. Incluir actividades específicas de [INDUSTRIA] en Sprint 0: ej. en salud incluir revisión de requisitos HIPAA; en banca incluir revisión de circular regulatoria
4. Ajustar el ritmo de governance para [TAMAÑO_EQUIPO]: ceremonias ligeras si ≤5 FTE, completas si >5 FTE
5. Incluir actividades de sincronización para equipos [TIPO_TRABAJO]
6. Agregar sprint 0 activities de setup de ambientes regulados si [SISTEMAS_REGULADOS=SÍ]

Generar el prompt completo, listo para usar, con todos los parámetros de industria ya aplicados.
```

**Guía de uso:**
- Especificar metodología exacta para calibrar ceremonias (Scrum≠SAFe≠Kanban)
- Para equipos remotos, el prompt generado incluirá actividades de sincronización asíncrona en Sprint 0
- Para sistemas regulados, generará actividades de compliance review en el plan
- Combinar con el output del skill `roadmap` (Phase 4, Foundation) para máxima alineación

---

## Metaprompt 2: Generador de Narrativa Comercial por Tipo de Valor

**Propósito:** Generar la narrativa de propuesta (S2.1) del paquete comercial optimizada para el tipo de valor que el proyecto entrega, el perfil del sponsor, y la situación competitiva del deal.

**Template:**
```
Eres un consultant de ventas consultivas con especialización en transformación digital, experto en adaptar narrativas técnicas a audiencias ejecutivas.

Tu tarea es generar un prompt optimizado para el Paquete de Activación Comercial (S2) del skill discovery-handover, calibrado para:

Perfil del deal:
- Tipo de valor primario: [REDUCCIÓN_DE_COSTOS / INCREMENTO_DE_REVENUE / REDUCCIÓN_DE_RIESGO / MODERNIZACIÓN / MIX]
- Perfil del sponsor: [CFO / CTO / CEO / COO / CIO / CDTO]
- Urgencia del cliente: [ALTA (crisis/regulación) / MEDIA (iniciativa estratégica) / BAJA (mejora continua)]
- Situación competitiva: [COMPETITIVO (hay otras propuestas) / SOLE_SOURCE (única propuesta) / RECOMPETENCIA (renovación)]
- Tamaño del deal: [<$200K / $200K-$500K / $500K-$2M / >$2M]
- Objeción principal conocida: [PRECIO / ROI_INCIERTO / CAPACIDAD_EQUIPO / TIMING / NINGUNA_CONOCIDA]

El prompt generado debe:
1. Construir la narrativa de propuesta (S2.1) desde la perspectiva del [PERFIL_SPONSOR] — su lenguaje, sus KPIs, sus preocupaciones
2. Posicionar los 4 pilares de valor (Cost, Revenue, Risk, Modernization) con énfasis en [TIPO_DE_VALOR_PRIMARIO]
3. Estructurar los diferenciadores para el contexto [SITUACIÓN_COMPETITIVA]:
   - Si COMPETITIVO: énfasis en diferenciadores únicos vs. competidores
   - Si SOLE_SOURCE: énfasis en velocidad y continuidad del discovery
   - Si RECOMPETENCIA: énfasis en aprendizajes y mejoras sobre el período anterior
4. Abordar proactivamente la objeción principal [OBJECIÓN_PRINCIPAL]
5. Calibrar el nivel de detalle del modelo financiero para [PERFIL_SPONSOR]:
   - CFO: NPV, IRR, payback, sensitivity analysis
   - CTO: ROI técnico, reducción de deuda técnica, time-to-market
   - CEO: market positioning, competitive advantage, strategic value

Generar el prompt completo con la estructura narrativa ya calibrada para este contexto específico.
```

**Guía de uso:**
- Usar cuando el sponsor tiene un perfil muy definido y la narrativa genérica no es suficiente
- Para deals competitivos, especificar qué se conoce del competidor principal
- El prompt generado alimenta directamente la S2.1 del handover
- Combinar con el output del skill `pitch` (Phase 5b) como fuente de los datos financieros

---

## Metaprompt 3: Generador de Kill Criteria por Tipo de Proyecto

**Propósito:** Generar los kill criteria (S6.3) y los early warning indicators (S6.2) calibrados para el tipo de proyecto, su nivel de riesgo, y las condiciones contractuales con el cliente.

**Template:**
```
Eres un risk controller con expertise en program governance de proyectos de transformación digital de alto riesgo.

Tu tarea es generar un prompt para crear el Tracker de Validación de Supuestos y Riesgos (S6) del skill discovery-handover, con kill criteria y early warning indicators calibrados para:

Perfil de riesgo del proyecto:
- Tipo de proyecto: [NUEVA_PLATAFORMA / MIGRACIÓN / INTEGRACIÓN / MODERNIZACIÓN / TRANSFORMACIÓN_ORGANIZACIONAL]
- Budget total: [MONTO O RANGO]
- Timeline: [MESES]
- Nivel de deuda técnica del sistema origen: [ALTA / MEDIA / BAJA / N_A]
- Dependencias externas críticas: [NÚMERO Y TIPO — proveedores / APIs / reguladores / etc.]
- Experiencia del equipo con la tecnología objetivo: [ALTA / MEDIA / BAJA]
- Riesgo de cambio organizacional: [ALTO / MEDIO / BAJO]
- Modelo de contrato: [TIEMPO_Y_MATERIAL / PRECIO_FIJO / OUTPUT_BASED / HÍBRIDO]

Para los kill criteria (S6.3), generar umbrales calibrados para [TIPO_PROYECTO] y [MODELO_CONTRATO]:
- Budget overrun threshold (más estricto para PRECIO_FIJO que para T&M)
- Timeline overrun threshold (calibrado para el riesgo de cada tipo de proyecto)
- Quality failure threshold (calibrado para el impacto del tipo de sistema)
- Team attrition threshold (calibrado para el tamaño del equipo)
- Supuesto technical threshold específico para [TIPO_PROYECTO]

Para los early warning indicators (S6.2), generar indicadores para:
- Los tipos de riesgo más comunes en proyectos [TIPO_PROYECTO]
- Las dependencias externas del tipo [TIPO_DEPENDENCIAS]
- El perfil de equipo con experiencia [NIVEL] en la tecnología objetivo

Para cada kill criterion e early warning indicator:
- Fuente del dato (de dónde se mide)
- Frecuencia de medición (diaria / semanal / por sprint / mensual)
- Responsable de reportar el indicador
- Acción inmediata cuando se alcanza el threshold

Generar el prompt completo listo para crear el S6 del handover.
```

**Guía de uso:**
- Especificar el modelo de contrato — los thresholds de kill criteria son mucho más estrictos en precio fijo
- Para proyectos de alta deuda técnica, el prompt generará early warnings específicos de deuda (acumulación de workarounds, degradación de performance)
- Para dependencias externas críticas, generará indicadores de health del proveedor/API
- Combinar con el Risk Register del skill `roadmap` (Phase 4) como input del S6

---

## Metaprompt 4: Generador de Protocolo de Governance por Escala y Contexto Cultural

**Propósito:** Generar el Protocolo de Transición de Governance (S5) calibrado para el tamaño del programa, la madurez organizacional del cliente, y las condiciones de trabajo (presencial/remoto/híbrido).

**Template:**
```
Eres un program director con expertise en diseño de estructuras de governance para programas de transformación digital en empresas latinoamericanas y norteamericanas.

Tu tarea es generar un prompt para crear el Protocolo de Transición de Gobernanza (S5) del skill discovery-handover, calibrado para:

Contexto organizacional:
- Tamaño del programa: [PEQUEÑO (≤5 FTE) / MEDIANO (6-15 FTE) / GRANDE (>15 FTE)]
- Madurez de gestión ágil del cliente: [BAJA (waterfall culture) / MEDIA (agile aware) / ALTA (agile native)]
- Número de stakeholders en el steering committee: [NÚMERO]
- Modalidad de trabajo: [PRESENCIAL / HÍBRIDO / REMOTO_COMPLETO]
- Zonas horarias del equipo: [LISTAR — ej: COL, MEX, USA_EST]
- Cultura organizacional del cliente: [JERÁRQUICA / COLABORATIVA / MIXTA]
- ¿Existe PMO en el cliente? [SÍ / NO / PMO_LIGERO]

Para la estructura de ceremonias (S5.2), calibrar para [TAMAÑO_PROGRAMA] y [MADUREZ_ÁGIL]:
- Si PEQUEÑO + BAJA_MADUREZ: governance mínima (standup ligero + steering mensual)
- Si MEDIANO + MEDIA_MADUREZ: Scrum completo + steering quincenal
- Si GRANDE + ALTA_MADUREZ: SAFe-inspired con múltiples equipos + steering mensual + SoS

Para el escalation path (S5.3), calibrar para [CULTURA_ORGANIZACIONAL]:
- Si JERÁRQUICA: escalation path más formal con tiempos más cortos por nivel
- Si COLABORATIVA: escalation path con mayor énfasis en resolución en equipo antes de escalar
- Si MIXTA: híbrido con claridad sobre cuándo escalar vs. cuándo resolver internamente

Para equipos remotos / híbridos, incluir:
- Estrategia de async communication (cuándo async, cuándo sync)
- Overlap hours obligatorias (overlap de zonas horarias)
- Herramientas de async collaboration (Loom, Notion, ADRs, etc.)
- Ceremonias que DEBEN ser síncronas vs. las que pueden ser asíncronas

Si PMO existe: incluir punto de integración del PMO del cliente en el governance del proyecto.

Generar el prompt completo listo para crear el S5 del handover.
```

**Guía de uso:**
- Especificar la cultura del cliente es crítico — una governance diseñada para cultura colaborativa fracasa en cultura jerárquica y viceversa
- Para equipos con zonas horarias diversas, el prompt generará la estrategia de overlap específica
- Si el cliente tiene PMO, el prompt incluirá los puntos de integración para evitar conflictos de governance
- Aplicar después de tener el Stakeholder Map (Phase 0) para conocer la cultura real del cliente

---

## Metaprompt 5: Generador de Handover Post-Mortem — Aprendizajes para el Próximo Discovery

**Propósito:** Al terminar una fase de ejecución, generar un prompt para crear un post-mortem del handover que documente aprendizajes, ajuste la metodología de discovery, y alimente el repositorio de conocimiento de MetodologIA.

**Template:**
```
Eres un knowledge manager y metodólogo de discovery con responsabilidad de mejorar continuamente el MetodologIA Discovery Framework basado en la experiencia de proyectos reales.

Tu tarea es generar un prompt para crear un Post-Mortem del Discovery Handover al finalizar la fase Foundation de ejecución (90 días después del kickoff), evaluando la calidad del handover y extrayendo aprendizajes para el próximo discovery.

Contexto del proyecto:
- Nombre del proyecto: [NOMBRE]
- Fecha del handover: [FECHA]
- Fecha del post-mortem (T+90 días): [FECHA]
- Resultado de la fase Foundation: [EXITOSO / CON_INCIDENTES / FALLIDO]
- Budget vs. plan: [X% del plan usado]
- Timeline vs. plan: [X% del timeline cumplido]
- Supuestos invalidados: [NÚMERO de X totales]
- Kill criteria activados: [SÍ / NO — cuáles]

El prompt generado debe evaluar:

**Calidad del Discovery (¿el análisis fue correcto?):**
- ¿Cuántos supuestos del discovery se invalidaron durante Foundation?
- ¿Los flujos de la Phase 2 reflejaban la realidad del sistema?
- ¿Las estimaciones del roadmap (Phase 4) se mantuvieron?
- ¿La spec funcional (Phase 5a) fue suficiente para implementar sin re-discovery?

**Calidad del Handover (¿la transición fue efectiva?):**
- ¿El equipo de ejecución pudo operar desde el día 1 con los artefactos del handover?
- ¿Los kill criteria y early warnings dieron señales en tiempo?
- ¿La governance propuesta fue adoptada o fue ignorada?
- ¿El plan de 90 días fue realista?

**Aprendizajes para el Próximo Discovery:**
- Qué preguntas de discovery no se hicieron y debieron hacerse
- Qué artefactos del handover se usaron vs. cuáles no se consultaron nunca
- Qué riesgos no estaban en el risk register pero se materializaron
- Qué ajustar en la metodología del MetodologIA Framework para el próximo engagement

Formato output: documento de aprendizajes estructurado + lista de mejoras propuestas al MetodologIA Discovery Framework.
```

**Guía de uso:**
- Ejecutar al completar la fase Foundation (90 días) o al activar un kill criterion
- El output alimenta el repositorio de lecciones aprendidas del equipo de Discovery MetodologIA
- Las mejoras propuestas al framework deben ser revisadas por el equipo metodológico antes de incorporar
- Para proyectos con kill criterion activado, ejecutar el post-mortem con especial atención a los supuestos que fallaron — es el input más valioso para mejorar el discovery

---

**Autor:** Javier Montaño | **Framework:** MetodologIA Discovery Framework | **© Comunidad MetodologIA**

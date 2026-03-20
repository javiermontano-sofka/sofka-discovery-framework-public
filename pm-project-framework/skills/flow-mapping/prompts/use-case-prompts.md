---
skill: flow-mapping
title: Use-Case Prompts — Flow Mapping
version: 1.0.0
author: Javier Montaño
copyright: © Comunidad MetodologIA
---

# Use-Case Prompts: Flow Mapping

Prompts listos para usar directamente con el skill `flow-mapping`. Cada prompt tiene contexto de activación, texto del prompt, y formato de output esperado.

---

## Prompt 1: Taxonomía de Dominios DDD desde Codebase

**Contexto:** El equipo tiene el análisis AS-IS completado y necesita identificar los bounded contexts del sistema antes de mapear flujos.

**Prompt:**
```
/mao:flows

Analiza el codebase en [RUTA_PROYECTO] y produce la taxonomía de dominios DDD.

Para cada dominio identifica:
- Nombre y tipo (Core / Supporting / Generic)
- Propósito y responsabilidades principales
- Aggregates y entidades clave
- Justificación de la clasificación con evidencia del código
- Patrón de context mapping con dominios adyacentes

Mínimo 4 dominios. Usa los heurísticos de estructura de packages, ownership de tablas, y deployment units para inferir boundaries.

{MODO}=supervisado {FORMATO}=markdown
```

**Output esperado:** Grilla de domain cards clasificadas por tipo, mapa de interacción entre dominios con context mapping patterns, justificación basada en evidencia de código.

---

## Prompt 2: Mapeo de Flujo E2E Crítico con Trama Completa

**Contexto:** Se necesita documentar exhaustivamente el flujo de negocio más crítico del sistema (ej: proceso de pago, alta de cliente, liquidación de póliza).

**Prompt:**
```
/mao:flows

Documenta el flujo E2E: [NOMBRE_DEL_FLUJO].

Entrega la documentación completa según el estándar del skill:
1. Diagrama de secuencia ASCII con todos los participantes
2. Tabla de especificación de trama (Seq, Msg ID, Source, Destination, Protocol, Content, Sync/Async, SLA)
3. Narrativa paso a paso con precondiciones, postcondiciones y lógica de decisión
4. Escenarios de error con causa, handling, feedback al usuario, y recuperación
5. Dependencias de integración con protocolos, timeout/retry, y circuit breaker status

Sistema: [NOMBRE_SISTEMA] | Codebase: [RUTA]

{MODO}=piloto-auto {FORMATO}=markdown
```

**Output esperado:** 5-8 páginas por flujo: secuencia, trama, narrativa, errores, integraciones. Mermaid sequence diagram embebido.

---

## Prompt 3: Análisis de Flujos en Sistema Event-Driven

**Contexto:** El sistema usa Kafka, RabbitMQ, o AWS SNS/SQS. Se necesita mapear flujos asíncronos con sus eventos, productores, consumidores, y garantías de consistencia.

**Prompt:**
```
/mao:flows

El sistema es event-driven. Mapea los flujos asíncronos principales.

Para cada flujo event-driven:
- Identificar el evento disparador (producer, topic/exchange, schema)
- Trazar la cadena: producer → broker → consumer(s) → side effects
- Documentar ordering guarantees, at-least-once vs. exactly-once
- Documentar el SLA de consistencia eventual (máxima latencia aceptable)
- Identificar escenarios de mensaje duplicado o fuera de orden

Broker detectado / configurado: [KAFKA / RABBITMQ / OTRO]
Codebase: [RUTA]

{MODO}=piloto-auto {FORMATO}=markdown
```

**Output esperado:** Diagramas de flujo de eventos, tabla de contratos de mensajes, análisis de garantías de consistencia, puntos de idempotencia.

---

## Prompt 4: Matriz de Integración del Sistema

**Contexto:** Se necesita un mapa completo de todas las integraciones del sistema — qué se conecta con qué, cómo, y con qué criticidad.

**Prompt:**
```
/mao:flows

Genera la Matriz de Integración completa del sistema [NOMBRE_SISTEMA].

La matriz debe incluir:
- Todos los sistemas externos e internos que integra
- Por cada integración: tipo (sync REST / async AMQP / batch ETL / DB directa), protocolo, volumen estimado de transacciones
- Criticidad de cada integración (Alta / Media / Baja) con justificación
- Integraciones sin fallback explícito (riesgo)
- Integraciones con dependencias circulares

Codebase: [RUTA] | Configuración de integraciones: [RUTA_CONFIG]

{MODO}=desatendido {FORMATO}=markdown
```

**Output esperado:** Tabla de matriz con sistemas en filas y tipos de transacción en columnas, diagrama de grafo de dependencias Mermaid, resumen de riesgos por integración crítica.

---

## Prompt 5: Identificación de Top-10 Puntos de Falla Críticos

**Contexto:** Se necesita identificar los puntos donde el sistema tiene mayor probabilidad o impacto de fallo, para alimentar el análisis de riesgos y el roadmap.

**Prompt:**
```
/mao:flows

Analiza el sistema y produce el análisis de Puntos de Falla Críticos.

Para cada punto de falla (mínimo 10):
- FP-ID y descripción del modo de fallo
- Consecuencia de negocio si ocurre
- Flujos afectados y sistemas involucrados
- Probabilidad (Alta/Media/Baja) con justificación arquitectónica
- Impacto (Crítico/Alto/Medio)
- Mitigación actual (MTTR documentado, circuit breaker, fallback)
- Mejora recomendada

Incluir diagrama de fallo en cascada para los 3 puntos más críticos.

Sistema: [NOMBRE_SISTEMA] | Input AS-IS: [RUTA_ANALISIS_ASIS]

{MODO}=supervisado {FORMATO}=markdown
```

**Output esperado:** Tabla de failure points con scoring, diagrama Mermaid de cascada para top-3, roadmap de mitigación priorizado.

---

## Prompt 6: Grafo de Dependencias de Sistemas

**Contexto:** Se necesita entender el orden de dependencias entre sistemas para planear mantenimientos, migraciones, o estrategias de resiliencia.

**Prompt:**
```
/mao:flows

Genera el Grafo de Dependencias del sistema [NOMBRE_SISTEMA] y su ecosistema de integraciones.

El grafo debe mostrar:
- Todos los sistemas como nodos (internos y externos)
- Tipo de dependencia en cada arista: sync API / async event / data replication / batch / DB compartida
- Criticidad de cada nodo (color-coded: crítico / importante / periférico)
- Dependencias circulares detectadas (marcadas explícitamente)
- Single Points of Failure identificados
- Orden de recuperación recomendado ante fallo sistémico

Formato: diagrama Mermaid flowchart + tabla de dependencias con metadatos.

Codebase: [RUTA] | Configuración: [RUTA_CONFIG]

{MODO}=desatendido {FORMATO}=markdown
```

**Output esperado:** Diagrama Mermaid del grafo de dependencias, tabla de nodos con criticidad, tabla de aristas con tipo y SLA, análisis de SPOFs y recomendaciones.

---

## Prompt 7: Variante Ejecutiva — Integración y Riesgo

**Contexto:** El stakeholder ejecutivo necesita una visión de 30 minutos de los flujos de integración y los principales riesgos, sin entrar en detalle técnico de cada flujo.

**Prompt:**
```
/mao:flows

Produce la variante ejecutiva del análisis de flujos para [NOMBRE_SISTEMA].

Entrega únicamente:
1. Taxonomía de dominios DDD (S1): mapa visual con clasificación Core/Supporting/Generic
2. Matriz de Integración (S7): visión consolidada de todas las integraciones con criticidad
3. Top-10 Puntos de Falla Críticos (S8): tabla ejecutiva con probabilidad, impacto, y mejora recomendada

Nivel de detalle: ejecutivo (sin diagramas de secuencia detallados, sin tramas técnicas).
Audiencia: CTO / VP Arquitectura / Director de Tecnología.

{MODO}=desatendido {VARIANTE}=ejecutiva {FORMATO}=markdown
```

**Output esperado:** Documento de 8-12 páginas: domain map visual, matriz de integración con colores de criticidad, failure points con scoring ejecutivo.

---

## Prompt 8: Reverse Engineering de Flujos en Sistema Legacy sin Documentación

**Contexto:** El sistema no tiene documentación de flujos, los endpoints no tienen OpenAPI, y los contratos de integración son implícitos en el código.

**Prompt:**
```
/mao:flows

El sistema no tiene documentación de flujos. Ejecuta reverse engineering desde el código.

Estrategia de extracción:
1. Identificar todos los entry points: HTTP controllers, message consumers, cron jobs, webhooks
2. Trazar desde cada entry point hacia downstream: llamadas a services, repositories, integraciones externas
3. Inferir contratos de integración desde: HTTP clients, MQ producers/consumers, DB queries cross-schema
4. Documentar nivel de confianza por cada flujo (Alto / Medio / Bajo) con justificación

Para flujos con confianza Baja: documentar supuestos explícitos y recomendar validación con stakeholder.

Codebase: [RUTA] | Lenguaje/Framework detectado: [LENGUAJE]

{MODO}=supervisado {FORMATO}=markdown
```

**Output esperado:** 8-12 flujos extraídos con nivel de confianza por evidencia, lista de supuestos documentados, recomendaciones de validación para gaps de confianza baja.

---

## Prompt 9: Análisis de Flujos CQRS / Event Sourcing

**Contexto:** El sistema implementa CQRS o Event Sourcing. Los flujos de comando y consulta son separados y requieren análisis especializado.

**Prompt:**
```
/mao:flows

El sistema implementa CQRS / Event Sourcing. Mapea los flujos especializados.

Para flujos de comando:
- Trigger → command handler → aggregate → domain events → event store
- Proyecciones que se actualizan desde los eventos
- Sagas / process managers que orquestan flujos multi-aggregate

Para flujos de consulta:
- Read model actualizado (cómo y con qué latencia)
- Query handlers y sus dependencias de datos

Documentar:
- Estrategia de consistencia eventual y SLA aceptado
- Escenarios de replay de eventos (cuándo y qué impacto)
- Puntos de falla específicos de Event Sourcing (event schema evolution, snapshot strategy)

Codebase: [RUTA]

{MODO}=supervisado {FORMATO}=markdown
```

**Output esperado:** Flujos separados para commands y queries, diagrama de event flow con projections, análisis de consistencia eventual, puntos de falla específicos del patrón.

---

## Prompt 10: Validación de Flujos Documentados contra Código Actual

**Contexto:** Existen documentos de flujos anteriores (swimlanes, especificaciones) pero se sospecha que están desactualizados. Se necesita contrastar documentación con código real.

**Prompt:**
```
/mao:flows

Valida los flujos documentados previamente contra el código actual del sistema.

Proceso:
1. Leer documentación existente de flujos: [RUTA_DOCUMENTACION]
2. Analizar el código actual para cada flujo documentado: [RUTA_CODEBASE]
3. Identificar divergencias: pasos documentados que ya no existen en código, pasos en código no documentados, contratos de integración que cambiaron
4. Clasificar cada divergencia: Crítica (afecta SLA/negocio) / Importante (afecta precisión) / Menor (cosmética)
5. Producir flujos corregidos con cambios marcados (delta documentation)

Output: documento de gaps + flujos actualizados con cambios destacados.

{MODO}=piloto-auto {FORMATO}=markdown
```

**Output esperado:** Tabla de divergencias clasificadas por severidad, flujos actualizados con cambios marcados, recomendaciones de proceso para mantener documentación sincronizada.

---
**Autor:** Javier Montaño | **© Comunidad MetodologIA** | **Versión:** 1.0.0 | **Fecha:** Marzo 2026

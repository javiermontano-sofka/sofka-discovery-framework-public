# Metaprompts — Observability Architecture

> Estrategias de meta-nivel para maximizar la efectividad de esta skill.
> Los metaprompts no producen entregables — optimizan COMO se producen.

---

## 1. Three-Pillar Correlation Audit (Auditoria de Correlacion entre Pilares)

**Proposito:** Verificar que los tres pilares de observabilidad (logs, metricas, traces) estan realmente correlacionados, no simplemente coexistiendo como silos. La correlacion es lo que convierte monitoring en observabilidad.

```
Para cada servicio critico del diseno de observabilidad, valida la correlacion:

NIVEL 1 — Logs-to-Traces:
- Cada log line incluye traceId y spanId?
- Se puede navegar de un log de error al trace completo?
- El formato de correlation ID es consistente (W3C Trace Context)?
- Los logs de diferentes servicios en la misma transaccion comparten traceId?

NIVEL 2 — Metrics-to-Traces (Exemplars):
- Las metricas criticas (latency, error rate) tienen exemplars habilitados?
- Se puede hacer click en un spike de latencia y llegar al trace especifico?
- Prometheus tiene exemplar storage habilitado (--enable-feature=exemplar-storage)?
- Grafana tiene el data source de exemplars configurado?

NIVEL 3 — Traces-to-Logs:
- Desde un span en Tempo/Jaeger, se puede saltar a los logs de ese span?
- El link usa traceId + spanId + time window?
- La correlacion funciona cross-service (trace en servicio A, logs en servicio B)?

NIVEL 4 — Metrics-to-Logs:
- Los dashboards tienen links a log queries filtradas por servicio + time range?
- Las alertas incluyen link a logs relevantes en su runbook?
- Log-based metrics (derivadas de logs) complementan metricas de instrumentacion?

NIVEL 5 — Service Map Validation:
- El service map se auto-genera desde trace data?
- Muestra dependencias reales (no solo las documentadas)?
- Se revisa semanalmente para detectar dependencias inesperadas?

Para cada nivel, documentar:
- Estado: IMPLEMENTADO / PARCIAL / NO IMPLEMENTADO
- Gap: que falta para completar
- Esfuerzo estimado para cerrar el gap: bajo (<1 sprint) / medio (1-2 sprints) / alto (>2 sprints)

Si Nivel 1 (logs-traces) o Nivel 2 (metrics-traces) no estan implementados,
la arquitectura tiene observabilidad parcial — no completa. Es un gap critico.
```

---

## 2. Alert Fatigue Diagnostic (Diagnostico de Fatiga de Alertas)

**Proposito:** Evaluar sistematicamente si el framework de alerting esta generando valor o ruido. Aplicar antes de entregar S5 o al auditar un sistema existente.

```
Para el sistema de alerting, ejecuta este diagnostico:

PASO 1 — Inventario de alertas:
- Cuantas alert rules activas existen?
- Clasificar cada alerta: ACCIONABLE (requiere intervencion) / INFORMATIVA (nice to know) / RUIDO (nunca debio existir)
- Cuantas alertas se dispararon en los ultimos 30 dias?
- Cuantas resultaron en accion real (incident, fix, investigation)?

PASO 2 — Metricas de salud:
- Alert-to-incident ratio: {alertas con accion} / {total alertas} — target: >50%
- Pages-to-action ratio: {pages que requirieron accion} / {total pages} — target: >80%
- MTTA (Mean Time To Acknowledge): promedio de minutos desde alert hasta ack
- Repeat offenders: top 5 alertas mas frecuentes — son sintoma de un problema no resuelto?
- False positive rate: alertas que se dispararon incorrectamente — target: <20%

PASO 3 — Evaluacion de SLO alignment:
- Las alertas estan vinculadas a SLOs definidos?
- Usan burn rate multi-window o threshold estatico?
- Existe error budget policy (que pasa cuando se agota)?
- Hay alertas de CPU/memory que deberian ser burn rate?

PASO 4 — Runbook coverage:
- Que porcentaje de alertas tienen runbook vinculado?
- Los runbooks estan actualizados (revisados en <6 meses)?
- Los runbooks incluyen: diagnostico, causas probables, remediacion, escalation?
- Se actualiza el runbook despues de cada incidente?

PASO 5 — Prescripcion:
- ELIMINAR: alertas con <10% action rate en 90 dias
- CONSOLIDAR: alertas que siempre se disparan juntas (misma causa raiz)
- MIGRAR: alertas de threshold a SLO-based (burn rate)
- CREAR: runbooks para alertas sin runbook (o eliminar la alerta)
- SILENCIAR: alertas durante maintenance windows conocidas

Target final: <20 alert rules criticas, todas con runbook, >80% accionables.
```

---

## 3. Observability Cost-Value Analysis (Analisis Costo-Valor de Observabilidad)

**Proposito:** Evaluar si la inversion en observabilidad genera valor proporcional. Evitar tanto sub-inversion (blind spots) como sobre-inversion (telemetria que nadie mira).

```
Para cada componente del stack de observabilidad, evalua costo vs valor:

DIMENSION 1 — Volumen y costo de telemetria:
- Logs: GB/dia ingestados. Se miran los logs de DEBUG en produccion? Si no, eliminarlos.
- Metricas: numero de series temporales activas. Hay series que nadie consulta?
- Traces: traces/dia almacenados. El sampling rate es apropiado para el trafico?
- Cardinality: hay labels de alta cardinalidad inflando costos? (user IDs, request IDs como labels)

DIMENSION 2 — Dashboard usage:
- Cuantos dashboards existen?
- Cuantos se consultaron en los ultimos 30 dias?
- Los dashboards executive (SLO status) se revisan en weekly meetings?
- Hay dashboards duplicados o abandonados?

DIMENSION 3 — Valor de deteccion:
- MTTR antes vs despues de observabilidad — mejoro?
- Incidentes detectados por observabilidad vs reportados por usuarios — ratio?
- Tiempo de diagnostico: se puede llegar a root cause en <15 min con dashboards + traces + logs?

DIMENSION 4 — Optimizacion de costos:
- Retention: los datos hot (7d) son suficientes para diagnostico? Se puede reducir warm/cold?
- Sampling: se puede reducir sampling rate sin perder visibilidad de anomalias?
- Cardinality: eliminar labels no usadas reduce costos de metricas
- Storage tiering: mover datos old a object storage (cold tier)
- Log levels: reducir INFO logging en servicios de alto volumen

DIMENSION 5 — ROI assessment:
- Costo mensual de observabilidad (tooling + infra + ops time): {magnitud}
- Costo de un incidente P1 no detectado (downtime, reputacion, SLA penalty): {magnitud}
- La observabilidad ha prevenido o reducido incidentes? Cuantificar en horas ahorradas.

Resultado: tabla con componente | costo mensual (magnitud) | valor demostrado | accion (mantener / optimizar / eliminar)

NUNCA recomendar eliminar observabilidad de servicios criticos.
La pregunta no es "cuesta mucho?" sino "cuesta mas que no tenerla?"
```

---

## 4. Incident Response Readiness Test (Prueba de Preparacion para Incidentes)

**Proposito:** Simular mentalmente un incidente P1 para validar que la cadena observabilidad -> deteccion -> diagnostico -> resolucion funciona end-to-end.

```
Simula el siguiente escenario de incidente y valida cada paso:

ESCENARIO: A las 3:14 AM, el servicio {SERVICIO_CRITICO} empieza a devolver
HTTP 500 para el 15% de requests. El error rate sube gradualmente.

MINUTO 0 — Deteccion:
- Existe una alerta que detecte esto? (burn rate o threshold)
- En cuanto tiempo se dispara? (si es burn rate 14.4x con 1h window, tarda ~4 min con 15% errors)
- A quien notifica? (PagerDuty -> on-call primary)
- El on-call recibe la notificacion? (push notification, no solo email)

MINUTO 5 — Diagnostico:
- El on-call abre el dashboard de servicio. Ve RED metrics con anomalia?
- Puede identificar CUANDO empezo exactamente? (deploy marker? config change?)
- Puede navegar de la metrica de error rate a un trace de error (exemplar)?
- El trace muestra que span falla? (DB timeout? external API? null pointer?)
- Los logs del span fallido tienen detalle suficiente para diagnosticar?

MINUTO 10 — Correlacion:
- Se pueden ver otros servicios afectados? (service map)
- Es un problema localizado o cascading failure?
- Hay un deployment reciente correlacionado? (deploy marker en dashboard)
- La base de datos muestra degradacion? (USE metrics del DB)

MINUTO 15 — Accion:
- El runbook de la alerta tiene pasos claros?
- Se puede hacer rollback del ultimo deploy?
- Se puede activar circuit breaker o feature flag?
- Se actualiza la status page / stakeholders?

POST-INCIDENTE:
- Se crea post-mortem automaticamente con timeline?
- Los action items incluyen mejoras a observabilidad?
- Se ajustan alertas/runbooks basado en lo aprendido?

Para cada minuto, documentar:
- FUNCIONA: la cadena opera como se diseno
- GAP: falta algo (alerta, dashboard, trace, runbook)
- BLOCKER: sin esto, el incidente no se puede resolver en <30 min

Si hay algun BLOCKER, el diseno de observabilidad tiene un fallo critico.
Si hay >2 GAPs, el diseno necesita mejoras antes de entrega.
```

---

## 5. Cardinality and Cost Explosion Prevention (Prevencion de Explosion de Cardinalidad)

**Proposito:** Auditar metricas para detectar y prevenir cardinality explosion ANTES de que genere costos impredecibles o degradacion de queries.

```
Para cada metrica definida en el diseno, evalua el riesgo de cardinalidad:

PASO 1 — Inventario de labels:
Para cada metrica, listar todos los labels y su cardinalidad esperada:

| Metrica | Label | Valores posibles | Cardinalidad |
|---|---|---|---|
| http_request_duration | service | 20 servicios | 20 |
| http_request_duration | method | GET, POST, PUT, DELETE | 4 |
| http_request_duration | path | ??? | ??? |
| http_request_duration | status_code | 200, 201, 400, 404, 500 | 5 |

Series totales = producto de cardinalidades = 20 x 4 x ? x 5

PASO 2 — Detectar labels peligrosas:
- URL paths con IDs: /users/123 -> cardinalidad = numero de usuarios (PELIGRO)
  Solucion: normalizar a /users/{id}
- User IDs o request IDs como labels: cardinalidad = infinita (CRITICO)
  Solucion: remover label, usar trace correlation
- Timestamps como labels: NUNCA (cardinalidad = infinita)
- Enum labels sin bounded set: cardinalidad crece con features
  Solucion: allowlist de valores conocidos + "other" bucket

PASO 3 — Calcular series totales por servicio:
- Total series = suma(producto de cardinalidades de cada metrica)
- Target: <5,000 series activas por servicio
- Warning: 5,000-10,000 series
- Critico: >10,000 series (investigar inmediatamente)

PASO 4 — Protecciones:
- OTel View API: configurar limite de 2,000 unique series per metric
- Delta temporality para counters de alta cardinalidad
- Per-service observability budget enforcement
- Alertar cuando un servicio excede su budget de series

PASO 5 — Costo projection:
- Serie temporal activa cuesta ~{magnitud} en managed platforms (Datadog, New Relic)
- En Prometheus/Mimir: serie activa consume ~{magnitud} de memoria
- Cardinalidad x retention = costo de storage
- Proyectar costo a 3x y 10x servicios actuales

Si alguna metrica tiene cardinalidad unbounded, es un blocker.
Corregir ANTES de instrumentar — no despues cuando ya esta en produccion.
```

---

**Autor:** Javier Montaño | **Ultima actualizacion:** 13 de marzo de 2026
**© Comunidad MetodologIA — Todos los derechos reservados**

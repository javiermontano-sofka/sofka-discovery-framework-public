# Metaprompts — BI Architecture

> Meta-level strategies to maximize the effectiveness of this skill.
> Metaprompts don't produce deliverables — they optimize HOW they are produced.

---

## 1. Decision-First Design

**Purpose:** Ensure that every BI architecture starts with the DECISIONS it enables, not the available data. A dashboard that doesn't enable a decision is decoration. Avoid the mistake of designing dashboards "because the data is there".

```
Antes de diseñar CUALQUIER dashboard o metrica, responde estas preguntas:

1. DECISION QUE HABILITA
   - ¿Que decision toma el usuario con este dashboard?
   - ¿Quien toma esa decision? (nombre, rol, frecuencia)
   - ¿Que pasa si la decision se toma mal? (impacto)
   - SI no puedes identificar una decision concreta →
     CUESTIONAR si el dashboard es necesario.

2. METRICAS COMO SEÑALES
   - ¿Que metricas le dicen al decisor que algo necesita atencion?
   - ¿Cada metrica tiene un TARGET o benchmark para comparar?
   - ¿El usuario puede distinguir "normal" de "anomalo" en <5 segundos?
   - REGLA: Nunca mostrar una metrica sin contexto (target, prior period,
     o benchmark). Un numero aislado no es informacion.

3. ACCION RESULTANTE
   - ¿Que hace el usuario DESPUES de ver el dashboard?
   - ¿El dashboard le dice QUE hacer, o solo que algo paso?
   - ¿Puede actuar directamente desde el dashboard (links, drill-down)?
   - SI el usuario mira el dashboard y no sabe que hacer →
     el dashboard necesita rediseño, no mas datos.

4. AUDIENCIA CORRECTA
   - ¿Este dashboard es para executives, managers, analysts, u operaciones?
   - ¿El nivel de detalle coincide con la audiencia?
   - REGLA: Los executives necesitan 5-7 KPIs y tendencias.
     Los analistas necesitan drill-down y filtros.
     Las operaciones necesitan detalle y acciones.
     Un dashboard para todos es un dashboard para nadie.

5. VALIDACION
   - Antes de construir, pregunta al usuario: "Si te muestro X, Y, Z,
     ¿puedes tomar la decision D?"
   - SI la respuesta es "necesito mas datos" → iterar el diseño
   - SI la respuesta es "si, eso es exactamente lo que necesito" → construir

ANTI-PATRON: "Data Fishing Dashboard"
- 30 metricas, 15 filtros, 0 decisiones claras
- El usuario "explora" sin rumbo → fatiga analitica
- CORRECCION: Reducir a 5-7 metricas por vista, guiar con narrative
```

---

## 2. Semantic Layer First

**Purpose:** Ensure that the BI architecture starts with the semantic layer (metric definitions, dimensions, access controls), not with dashboards. Without a semantic layer, each dashboard is an island with its own definitions.

```
NUNCA diseñes un dashboard sin antes tener las metricas definidas
en un semantic layer (o al menos documentadas en un catalogo).

PASO 1 — INVENTARIO DE METRICAS
- ¿Que metricas existen hoy? ¿Donde estan definidas?
- ¿Hay metricas duplicadas? (e.g., "revenue" definido en 3 dashboards)
- ¿Hay metricas con diferentes definiciones del mismo concepto?
  (e.g., "active user" = daily login vs weekly login vs monthly login)
- REGLA: Si la misma metrica tiene 2+ definiciones → es un problema
  que el semantic layer debe resolver ANTES de construir dashboards.

PASO 2 — DEFINICION UNICA POR METRICA
Para cada metrica, establecer:
- Nombre: unico, descriptivo, sin ambiguedad
- Formula: SQL exacto o pseudocodigo
- Grain: nivel de detalle minimo (diario, por usuario, por transaccion)
- Dimensions: por que ejes se puede segmentar (region, producto, canal)
- Owner: equipo responsable de la definicion (no del dashboard)
- Source: que modelo(s) alimentan esta metrica
- Time grains: day, week, month, quarter, year

PASO 3 — ENFORCEMENT
- Las metricas SOLO pueden consumirse desde el semantic layer
- Los dashboards NO definen calculos locales para metricas gobernadas
- Si un dashboard necesita una metrica nueva → se agrega al semantic
  layer, no al dashboard
- Excepciones: calculos ad-hoc en zona exploratoria (labeled "not certified")

PASO 4 — VALIDACION CRUZADA
- Antes de publicar un dashboard:
  □ ¿Todas las metricas vienen del semantic layer?
  □ ¿Los nombres de metricas coinciden con el catalogo?
  □ ¿Los filtros usan las mismas dimensiones que el semantic layer?
  □ ¿El dashboard esta conectado al semantic layer, no a SQL directo?

ANTI-PATRON: "Dashboard-Defined Metrics"
- Cada dashboard tiene su propia version de "revenue"
- Resultado: ejecutivos ven numeros diferentes en diferentes dashboards
- CORRECCION: Centralizar definiciones en semantic layer. Migrar dashboards.
```

---

## 3. Performance Budget Enforcement

**Purpose:** Treat dashboard performance as a non-negotiable budget. Slow dashboards destroy adoption — users abandon after 3 seconds.

```
Aplica estos limites como REQUISITOS, no como sugerencias:

PRESUPUESTO DE RENDIMIENTO (no negociable)
| Metrica | Target | Alarma | Critico |
|---------|--------|--------|---------|
| Initial render | < 2s | > 3s | > 5s |
| Query execution | < 5s | > 10s | > 30s |
| Filter response | < 1s | > 2s | > 5s |
| Embed load time | < 2s | > 3s | > 5s |
| Data freshness (L1) | Daily 6AM | > 8AM | > 12PM |
| Data freshness (L3) | < 1 hora | > 2 horas | > 4 horas |

ESTRATEGIA DE OPTIMIZACION (cuando se excede el presupuesto):

1. MEDIR PRIMERO
   - ¿Cual es el render time actual de cada dashboard?
   - ¿Cuales queries son los mas lentos?
   - ¿Cuantas queries ejecuta un dashboard al cargar?
   - SI no puedes medir → instrumentar ANTES de optimizar.

2. REDUCIR QUERIES
   - ¿El dashboard ejecuta queries redundantes?
   - ¿Hay filtros que no afectan todos los charts? (lazy loading)
   - ¿Se puede consolidar charts que comparten la misma query?
   - REGLA: Un dashboard no deberia ejecutar >10 queries al cargar.

3. MATERIALIZAR
   - ¿Los queries mas lentos pueden usar materialized views?
   - ¿Hay aggregations que se repiten y pueden pre-computarse?
   - ¿El semantic layer tiene caching configurado?
   - REGLA: El 80% de los queries de dashboard deberian dar cache hit.

4. EXTRACT vs LIVE
   - ¿El dashboard necesita datos live? ¿O un extract scheduled es suficiente?
   - L1-L2 dashboards casi siempre pueden usar extracts (daily refresh)
   - Solo L3 operacional necesita live connection (y aun asi, con cache)

5. VALIDAR POST-OPTIMIZACION
   - Medir DESPUES de optimizar: ¿se cumplio el presupuesto?
   - Si no → escalar: warehouse sizing, clustering, partition pruning
   - Documentar la baseline para future regression detection

ANTI-PATRON: "Slow is Acceptable"
- "Es un poco lento pero los datos estan ahi"
- Resultado: los usuarios dejan de usar el dashboard y vuelven a Excel
- CORRECCION: Performance es un feature, no un nice-to-have
```

---

## 4. Governed Self-Service

**Purpose:** Enable self-service analytics without losing trust in data. The balance between freedom and governance is the critical success factor.

```
Diseña self-service con 3 zonas claras. NUNCA habilites self-service
sin zonas — es como dar las llaves del warehouse sin mapa.

ZONA 1: CERTIFIED (para todos los usuarios)
- Contenido: dashboards certificados, metricas del semantic layer
- Datos: curated marts, dimensiones conformadas
- Compute: shared warehouse con SLA de performance
- Governance: metricas locked, no se modifican sin aprobacion
- Label: etiqueta visible "CERTIFIED" en cada dashboard y metrica
- REGLA: Solo contenido certificado puede usarse para reportes ejecutivos
  y decisiones de negocio formales.

ZONA 2: EXPLORATORY (para analysts y power users)
- Contenido: dashboards no certificados, queries ad-hoc, experiments
- Datos: staging + marts, sandbox datasets
- Compute: dedicated warehouse con quotas (query timeout: 5 min,
  row limit: 1M, cost cap per user/day)
- Governance: labeled "EXPLORATORY — not for executive reporting"
- REGLA: Los hallazgos de la zona exploratoria se validan y certifican
  antes de usarse para decisiones. No se presentan en reuniones de board.

ZONA 3: RAW (solo para data engineers)
- Contenido: queries directos a raw data, profiling, debugging
- Datos: todas las fuentes, incluyendo raw
- Compute: isolated warehouse, full audit logging
- Governance: acceso restringido, justificacion requerida, PII protegido
- REGLA: Nunca habilitar raw access a business users. Ni siquiera
  a "power users avanzados".

MEDICION DE EXITO (quarterly):
□ % de usuarios activos vs licenciados (target: >70%)
□ % de queries en zona certificada vs exploratoria (target: >60% certified)
□ Tiempo promedio de request queue (target: reduccion >50% vs pre-self-service)
□ Incidentes de datos reportados por usuarios (target: <5/mes)
□ User satisfaction score (survey, target: >4/5)

ANTI-PATRON: "Free-for-All Self-Service"
- Todos acceden a todo, sin zonas, sin labels
- Resultado: reportes con datos incorrectos, perdida de confianza
- CORRECCION: Implementar zonas. Certificar contenido. Label everything.
```

---

## 5. Dashboard Lifecycle Management

**Purpose:** Prevent dashboard sprawl by managing the complete lifecycle: from request to archive. Dashboards that aren't managed accumulate, confuse, and degrade performance.

```
Gestiona dashboards como productos con lifecycle, no como archivos
que se crean y nunca se borran.

CICLO DE VIDA DE UN DASHBOARD:

1. REQUEST (Solicitud)
   □ ¿Quien lo solicita? ¿Para que decision?
   □ ¿Ya existe un dashboard que cubra esta necesidad? (buscar primero)
   □ ¿El tier es L1, L2, L3, o L4?
   □ ¿Las metricas necesarias estan en el semantic layer?
   → Si ya existe → reusa o extiende
   → Si no existe y las metricas no estan → agregar al semantic layer primero

2. BUILD (Construccion)
   □ Seguir template del tier correspondiente (L1/L2/L3)
   □ Usar metricas del semantic layer (no calculos locales)
   □ Aplicar visualization standards (colores, charts, accessibility)
   □ Performance test: cumple el presupuesto de rendimiento?

3. REVIEW (Revision)
   □ Peer review por otro miembro del equipo de analytics
   □ Stakeholder review: "¿esto habilita la decision que necesitas?"
   □ Data validation: los numeros coinciden con la fuente de verdad?
   □ Accessibility check: WCAG 2.1 AA compliance

4. PUBLISH (Publicacion)
   □ Asignar tier (L1/L2/L3/L4) y label (certified/exploratory)
   □ Asignar owner (equipo + contacto)
   □ Registrar en catalogo de dashboards
   □ Comunicar a los usuarios relevantes

5. MONITOR (Monitoreo)
   □ Track views/semana, usuarios unicos, query count
   □ Track performance (render time, query time)
   □ Track freshness (los datos se actualizan segun SLA?)

6. REVIEW QUARTERLY (Revision Trimestral)
   □ ¿El dashboard tiene >0 views en los ultimos 90 dias?
   □ ¿Los datos siguen siendo relevantes?
   □ ¿El owner sigue activo?
   □ ¿El dashboard cumple visualization standards actuales?

7. ARCHIVE (Archivo)
   □ Dashboards con 0 views en 90 dias → notificar owner
   □ Owner confirma: keep (justify) o archive
   □ Si no responde en 14 dias → archive automatico
   □ Archived = deshabilitado pero recuperable por 180 dias
   □ Despues de 180 dias → delete permanente

METRICAS DE GOVERNANCE:
- Total dashboards: crecimiento <10%/quarter (o algo esta mal)
- % dashboards con owner asignado: target 100%
- % dashboards archivados/quarter: target 5-15% (healthy churn)
- Dashboard-to-user ratio: <5 dashboards per user (o hay sprawl)
```

---

**Autor:** Javier Montaño | **Última actualización:** 13 de marzo de 2026

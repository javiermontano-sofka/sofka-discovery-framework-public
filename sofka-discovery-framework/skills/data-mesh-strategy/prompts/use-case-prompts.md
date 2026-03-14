# Use Case Prompts — Data Mesh Strategy

> Prompts listos para usar en los casos de uso mas frecuentes de esta skill.
> Cada prompt incluye contexto de cuando usarlo y parametros variables.

---

## 1. Readiness Assessment

**Cuando:** Primera evaluacion. El cliente quiere saber si data mesh es viable para su organizacion.

```
Ejecutar data mesh readiness assessment para {CLIENTE}.

Contexto organizacional:
- Industria: {INDUSTRIA}
- Tamano: {NUM_EMPLEADOS} empleados
- Equipos de ingenieria: {NUM_EQUIPOS}
- Dominios de negocio identificados: {NUM_DOMINIOS} ({LISTA_DOMINIOS})
- Data architecture actual: {CENTRALIZADA/DISTRIBUIDA/HIBRIDA}
- Data warehouse/lake: {TECNOLOGIA} (e.g., Snowflake, BigQuery, Databricks, Redshift)
- Data engineering team: {NUM_PERSONAS} personas
- Data catalog existente: {SI/NO} ({HERRAMIENTA})
- Data governance maturity: {BAJA/MEDIA/ALTA}

Parametros:
- {MODO}: piloto-auto
- {FORMATO}: markdown
- {MODO_OPERACIONAL}: readiness
- {VARIANTE}: tecnica

Entregar S1 (Readiness Assessment) con scoring 1-5 por principio, evidencia
observable, gaps criticos, y veredicto GO/NO-GO/GO-CONDICIONAL.
Si el veredicto es NO-GO, incluir alternativas recomendadas.
```

---

## 2. Single Domain Pilot Design

**Cuando:** La organizacion quiere probar data mesh con un dominio piloto antes de adopcion amplia.

```
Disenar piloto de data mesh para el dominio {DOMINIO} de {CLIENTE}.

Contexto del dominio:
- Dominio: {NOMBRE_DOMINIO}
- Bounded context: {DESCRIPCION}
- Entidades de datos clave: {LISTA_ENTIDADES}
- Equipo: {NUM_PERSONAS} personas (roles: {ROLES})
- Consumidores de datos del dominio: {LISTA_CONSUMIDORES}
- Plataforma actual: {TECNOLOGIA_ACTUAL}

Solo las secciones relevantes para piloto:
- S3 (Data Product Design) — specs detallados para 3-5 data products del dominio
- S4 (Platform Requirements) — minimo viable platform para el piloto
- S6 (Adoption Roadmap) — timeline de 3-6 meses para el piloto

Incluir:
- Data product specs con SLAs, quality dimensions, schema
- Criterios de exito del piloto
- Riesgos y mitigaciones del piloto
```

---

## 3. Full Data Mesh Strategy

**Cuando:** La organizacion ha decidido adoptar data mesh (readiness ya evaluada) y necesita la estrategia completa.

```
Generar estrategia completa de data mesh para {CLIENTE}.

Contexto:
- Resultado de readiness: {SCORE_READINESS} (GO condicional/GO)
- Numero de dominios: {NUM_DOMINIOS}
- Dominios identificados: {LISTA_DOMINIOS_CON_ENTIDADES}
- Data architecture AS-IS: {DESCRIPCION}
- Data engineering team actual: {NUM_PERSONAS}
- Budget disponible para platform: {MAGNITUD}
- Timeline esperado por liderazgo: {MESES} meses
- Executive sponsor: {ROL}

Parametros:
- {MODO}: piloto-auto
- {FORMATO}: markdown
- {MODO_OPERACIONAL}: estrategia
- {VARIANTE}: tecnica

Entregar las 7 secciones completas con foco en:
- Domain decomposition realista (no todas seran mesh)
- Data product catalog con specs
- Platform build-vs-buy analysis
- Federated governance model pragmatico
- Roadmap phased con entry/exit criteria
- Org change plan con timeline de transicion del equipo central
```

---

## 4. Data Product Design Workshop

**Cuando:** Un dominio necesita disenar sus data products. Ya existe la estrategia macro.

```
Facilitar diseño de data products para el dominio {DOMINIO} de {CLIENTE}.

Datos del dominio:
- Entidades operacionales: {LISTA_ENTIDADES}
- Sistemas source: {LISTA_SISTEMAS}
- Consumidores conocidos: {LISTA_CONSUMIDORES}
- SLAs de negocio: {DESCRIPCION_SLAS}
- Datos sensibles (PII, regulados): {SI/NO} ({CUALES})

Para cada data product identificado, generar:
1. Nombre (pattern: domain.entity.qualifier)
2. Tipo: table / stream / API
3. Owner (team + contact)
4. SLA: freshness, availability, quality minimum
5. Schema (columnas clave, tipos, PK)
6. Quality dimensions con thresholds
7. Access control (classification, consumers autorizados)
8. Data contract YAML spec

Entregar como catalogo con specs YAML listos para implementar.
```

---

## 5. Platform Evaluation

**Cuando:** La organizacion necesita evaluar herramientas para la self-serve data platform.

```
Evaluar opciones de plataforma self-serve para data mesh de {CLIENTE}.

Contexto tecnico:
- Cloud provider: {AWS/AZURE/GCP/MULTI}
- Data warehouse actual: {TECNOLOGIA}
- Data catalog actual: {HERRAMIENTA} / ninguno
- Orquestador actual: {AIRFLOW/DAGSTER/PREFECT/OTRO}
- Herramienta de transformacion: {DBT/SPARK/OTRO}
- Streaming: {KAFKA/KINESIS/PUBSUB/NINGUNO}
- Budget para herramientas: {MAGNITUD}/ano
- Tamano del equipo de platform: {NUM_PERSONAS}

Evaluar opciones para cada capability:
- Data Catalog & Discovery
- Schema Registry
- Data Quality Monitoring
- Lineage Tracking
- Access Management
- Cost Allocation

Para cada capability: 3 opciones (OSS, commercial, cloud-native)
con pros/cons/costo/esfuerzo/vendor-lock-in assessment.

Incluir recomendacion final con justificacion.
```

---

## 6. Governance Model Design

**Cuando:** La organizacion necesita disenar el modelo de governance federada para su mesh.

```
Disenar modelo de federated governance para data mesh de {CLIENTE}.

Contexto:
- Numero de dominios en mesh: {NUM_DOMINIOS}
- Datos regulados: {SI/NO} ({REGULACIONES}: GDPR, HIPAA, PCI, SOX)
- Data catalog existente: {HERRAMIENTA}
- Governance team actual: {NUM_PERSONAS} personas
- Madurez de governance actual: {BAJA/MEDIA/ALTA}
- Policy-as-code experience: {SI/NO}

Solo la seccion S5 (Federated Governance Model) en profundidad.

Entregar:
- Politicas globales (naming, schema, PII, quality, documentation, retention, access)
- Mecanismo de enforcement por politica (automatico, semi-automatico, manual)
- Division de responsabilidades global vs local
- Governance automation roadmap (de manual a policy-as-code)
- Exception handling process
- Governance metrics (% compliance, policy violations/month, time-to-resolve)
```

---

## 7. Mesh vs Centralized Decision

**Cuando:** El liderazgo necesita decidir entre mantener datos centralizados o adoptar data mesh (o hibrido).

```
Analizar decision data mesh vs modelo centralizado para {CLIENTE}.

Contexto:
- Tamano organizacion: {NUM_EMPLEADOS}
- Dominios: {NUM_DOMINIOS}
- Data team actual: {NUM_PERSONAS} (centralizado)
- Pain points actuales: {DESCRIPCION_PAIN_POINTS}
- Queue del data team: {TIEMPO_PROMEDIO}
- Data quality issues frecuentes: {SI/NO}
- Executive appetite for org change: {BAJO/MEDIO/ALTO}

Analizar 3 opciones:
1. **Centralized + improved** — Mantener modelo actual, invertir en tooling y procesos
2. **Selective mesh** — Descentralizar dominios maduros, mantener centralizados los demas
3. **Full mesh** — Descentralizar todos los dominios

Para cada opcion:
- Pros y contras
- Investment estimado (FTE-months)
- Timeline
- Risk level
- Prerequisites
- Expected outcomes a 12 meses

Incluir recomendacion con justificacion basada en el contexto.

Parametros:
- {FORMATO}: markdown
- {VARIANTE}: ejecutiva
```

---

**Autor:** Javier Montaño | **Última actualización:** 13 de marzo de 2026

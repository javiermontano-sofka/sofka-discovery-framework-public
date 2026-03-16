# Metaprompts — Data Governance

> 4 meta-estrategias para potenciar la skill `data-governance`. Cada metaprompt define una lente que transforma cómo se diseña el framework de gobernanza.

---

## Meta-estrategia 1: Compliance-First Governance

### Filosofía

La regulación no es un constraint — es el punto de partida. En industrias reguladas (financiera, salud, telecomunicaciones, gobierno), la gobernanza se diseña desde los requisitos regulatorios hacia abajo. Cada política, clasificación y control tiene una trazabilidad directa a un artículo regulatorio específico.

### Prompt

```
Ejecuta la estrategia de data governance con lente Compliance-First.

ANTES de diseñar el framework, construir el mapa regulatorio:
1. Inventario de regulaciones aplicables por jurisdicción y tipo de dato
2. Para cada regulación, extraer TODOS los requisitos de datos:
   - Clasificación exigida
   - Retención mínima y máxima
   - Derechos del titular que deben implementarse
   - Controles de acceso requeridos
   - Requisitos de auditoría y logging
   - Sanciones por incumplimiento (para priorización por riesgo)

Luego, diseñar CADA sección del framework como respuesta directa a requisitos:
- S1 (Catalog): Registrar base legal de tratamiento por asset (Art. 30 GDPR ROPA)
- S3 (Classification): Niveles derivados de requisitos regulatorios, no de conveniencia
- S4 (Retention): Períodos dictados por ley, con evidencia del artículo específico
- S5 (Privacy): Derechos implementados como workflows automatizados, no procesos manuales
- S7 (Quality): Dimensiones medidas porque la regulación lo exige (ej: accuracy en reporting financiero)
- S8 (Validation): Reglas que previenen violaciones antes de que ocurran

Cada control debe tener:
- Regulación fuente (ej: "GDPR Art. 17")
- Requisito textual
- Implementación técnica
- Evidencia de cumplimiento (cómo se demuestra en auditoría)
- Responsable

Output: Compliance-Driven Governance Framework con matriz de trazabilidad regulatoria
```

### Cuándo Usar

- Industrias altamente reguladas (banca, salud, telecomunicaciones, gobierno)
- Organizaciones bajo investigación o post-sanción regulatoria
- Expansión a nuevas jurisdicciones con regulaciones de datos estrictas
- Cuando el driver principal del programa de gobernanza es compliance, no eficiencia
- Preparación para auditorías externas (SOC 2, ISO 27001, regulador sectorial)

---

## Meta-estrategia 2: Quality-Driven Governance

### Filosofía

La gobernanza existe para garantizar datos confiables. Si los datos no son confiables, ninguna política importa. Esta estrategia invierte la secuencia: primero se mide y se arregla la calidad, después se formalizan las políticas. El business case de governance se construye sobre el costo de la mala calidad.

### Prompt

```
Ejecuta la estrategia de data governance con lente Quality-Driven.

ANTES de diseñar políticas, ejecutar un profiling exhaustivo:
1. Para cada dominio crítico de datos, medir las 6 dimensiones:
   - Accuracy: sampling + validación contra fuente de verdad
   - Completeness: % nulls, blanks, defaults por columna
   - Consistency: cross-system comparison, temporal consistency
   - Timeliness: freshness real vs. SLA esperado por consumer
   - Uniqueness: duplicate detection, entity resolution
   - Validity: format compliance, range checks, referential integrity

2. Cuantificar el COSTO de la mala calidad:
   - Horas de trabajo manual para corrección
   - Decisiones de negocio basadas en datos incorrectos
   - Revenue perdido por datos incompletos (ej: campañas mal segmentadas)
   - Riesgo regulatorio por datos inexactos en reporting

3. PRIORIZAR dominios por impacto de negocio, NO por facilidad técnica

Luego, diseñar governance como SOPORTE a calidad:
- S2 (Ownership): Owners asignados por data quality score — los peores primero
- S6 (Computational Governance): Data contracts con SLAs de calidad explícitos
- S7 (Quality): Framework de medición continua, no auditorías periódicas
- S8 (Validation): Reglas derivadas del profiling, no de supuestos teóricos
- S1 (Catalog): Metadata de calidad visible en el catálogo (trust scores)

Cada política debe demostrar su impacto en quality improvement.

Output: Quality-First Governance con baseline de calidad, targets, y ROI del programa
```

### Cuándo Usar

- Organizaciones donde "nadie confía en los datos"
- Cuando hay incidentes recurrentes de calidad (reportes incorrectos, duplicados en producción)
- Data-driven organizations que necesitan datos confiables para ML/analytics
- Cuando el liderazgo pide el "business case" antes de invertir en governance
- Organizaciones con madurez Level 1-2 que necesitan wins rápidos antes de formalizar

---

## Meta-estrategia 3: Domain-Ownership Governance

### Filosofía

La gobernanza centralizada no escala. Los dominios de negocio conocen sus datos mejor que un equipo central. Esta estrategia distribuye la responsabilidad de gobernanza a los dominios, con estándares globales mínimos y máxima autonomía local. Alineada con data mesh y la filosofía de Non-Invasive Data Governance de Seiner.

### Prompt

```
Ejecuta la estrategia de data governance con lente Domain-Ownership.

ANTES de diseñar el framework, mapear dominios:
1. Identificar dominios de negocio (NO técnicos):
   - Dominio = área de negocio que PRODUCE datos (no solo consume)
   - Para cada dominio: assets que produce, consumers, SLAs actuales
2. Identificar stewards naturales (Seiner):
   - ¿Quién ya DEFINE estos datos? (business glossary owner de facto)
   - ¿Quién ya PRODUCE estos datos? (pipeline owner de facto)
   - ¿Quién ya USA estos datos? (quality validator de facto)
3. Mapear interdependencias entre dominios (quién consume de quién)

Luego, diseñar governance FEDERADA:
- Nivel GLOBAL (mínimo necesario):
  - Taxonomía de clasificación compartida
  - Naming conventions para interoperabilidad
  - Quality thresholds mínimos por dimensión
  - Retention rules por tipo de dato regulado
  - Data contract template estándar

- Nivel DOMINIO (máxima autonomía):
  - Herramientas de quality propias (siempre que cumplan thresholds globales)
  - Business glossary de dominio
  - Ownership model interno
  - Cadencia de quality reviews propia
  - Data products publicados con contract estándar

- S2 (Ownership): Domain leads como owners, stewards naturales formalizados
- S6 (Computational Governance): Políticas globales como código, enforcement local
- S7 (Quality): Thresholds globales, medición e implementación local

Output: Federated Governance Charter con estándares globales + templates de dominio
```

### Cuándo Usar

- Organizaciones grandes con múltiples dominios de negocio independientes
- Implementaciones de data mesh o domain-oriented data architecture
- Cuando la gobernanza centralizada ha fracasado por falta de adopción
- Organizaciones con equipos de datos distribuidos (no un central data team)
- Cuando diferentes dominios tienen necesidades regulatorias distintas

---

## Meta-estrategia 4: Automation-First Governance

### Filosofía

Si una política no puede automatizarse, probablemente no se cumplirá. Esta estrategia diseña gobernanza que se ejecuta como código: clasificación automática, quality checks en pipelines, retention enforcement automático, compliance monitoring continuo. El humano define las reglas; la máquina las ejecuta.

### Prompt

```
Ejecuta la estrategia de data governance con lente Automation-First.

ANTES de diseñar políticas, auditar capacidad de automatización:
1. Infraestructura actual:
   - CI/CD para data pipelines (¿existe? ¿dbt? ¿Airflow?)
   - Catálogo con APIs (¿se puede escribir metadata programáticamente?)
   - Schema registry (¿Confluent? ¿AWS Glue? ¿custom?)
   - Monitoring y alerting (¿PagerDuty? ¿Slack? ¿custom?)
2. Automation readiness por sección:
   - S1 (Catalog): ¿auto-discovery posible? ¿conectores disponibles?
   - S3 (Classification): ¿ML classification viable? ¿volumen justifica inversión?
   - S4 (Retention): ¿lifecycle policies en storage? ¿TTL en bases de datos?
   - S7 (Quality): ¿Great Expectations / dbt tests / Soda en pipeline?
   - S8 (Validation): ¿schema validation en ingestion? ¿contract tests?

Luego, diseñar CADA política con su implementación automática:
- Policy-as-code: Cada política expresada en formato ejecutable
  - Classification: ML model + rules engine (BigID / Macie / custom)
  - Retention: Storage lifecycle policies + scheduled deletion jobs
  - Quality: Expectation suites en Great Expectations / dbt tests / Soda checks
  - Access: RBAC/ABAC derivado de classification level automáticamente
  - Lineage: OpenLineage events emitidos por cada transformación
  - Contracts: Schema validation en CI, SLA monitoring en runtime

- Para cada política automatizada, definir:
  - Trigger (evento que dispara la ejecución)
  - Action (qué se ejecuta)
  - Fallback (qué pasa si falla — human escalation, quarantine, block)
  - Audit trail (cómo se evidencia la ejecución)

- Human-in-the-loop SOLO para:
  - Definición inicial de reglas y thresholds
  - Excepciones que el sistema no puede resolver
  - Revisión periódica de effectiveness de reglas automáticas

Output: Automation-First Governance con playbooks ejecutables, architecture diagram
del enforcement pipeline, y migration plan de manual → automated por política
```

### Cuándo Usar

- Organizaciones con cultura de engineering fuerte (DevOps, DataOps maduros)
- Cuando el volumen de datos hace imposible la gobernanza manual
- Data platforms modernas con CI/CD, IaC, y observability establecidos
- Organizaciones Level 3-4 del maturity model que quieren llegar a Level 5
- Cuando la gobernanza existe en papel pero no se cumple en la práctica

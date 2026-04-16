# Use Case Prompts — Data Governance

> 8 prompts listos para usar con la skill `data-governance`. Copiar y adaptar según contexto del proyecto.

---

## Prompt 1: Full Governance Framework Design

```
Diseña el framework completo de data governance para {ORGANIZACIÓN}.

Contexto:
- Industria: {INDUSTRIA}
- Volumen de datos: {VOLUMEN ESTIMADO — TB/PB, fuentes, dominios}
- Regulaciones aplicables: {GDPR, CCPA, LGPD, SOX, HIPAA, etc.}
- Madurez actual: {NIVEL 1-5 o descripción cualitativa}
- Stack de datos: {DATA WAREHOUSE, LAKEHOUSE, HERRAMIENTAS ETL, BI}

Incluye las 8 secciones completas: catalog, ownership, classification, retention,
privacy compliance, computational governance, quality dimensions, validation & remediation.

Modo operacional: governance-full
Formato: markdown (con diagramas Mermaid para RACI, classification matrix, y maturity roadmap)
```

**Cuándo usar:** Diseño integral de programa de gobernanza desde cero o reestructuración completa. Requiere stakeholder map e inventario de fuentes como inputs ideales.

---

## Prompt 2: Data Quality Assessment

```
Ejecuta un assessment de calidad de datos para el dominio {DOMINIO} de {ORGANIZACIÓN}.

Modo operacional: quality-assessment
Fuentes a evaluar: {LISTA DE TABLAS/DATASETS O RUTA AL REPO}
Herramientas disponibles: {GREAT EXPECTATIONS / DBT TESTS / SODA / OTRAS}

Para cada dataset, evaluar las 6 dimensiones:
- Accuracy: ¿los valores representan la realidad?
- Completeness: ¿qué % de nulls, blanks, defaults?
- Consistency: ¿coherente entre sistemas y temporalmente?
- Timeliness: ¿freshness actual vs. SLA esperado?
- Uniqueness: ¿duplicados? ¿granularidad correcta?
- Validity: ¿formatos, rangos, dominios válidos?

Output: Quality Assessment Report con scores por dimensión, reglas de validación
propuestas, y plan de remediación priorizado por impacto de negocio.
```

**Cuándo usar:** Evaluación inicial de calidad para un dominio específico. También como diagnóstico periódico para dominios ya gobernados. Ideal antes de migración o integración.

---

## Prompt 3: Compliance Audit (GDPR)

```
Ejecuta una auditoría de compliance GDPR para {ORGANIZACIÓN}.

Modo operacional: compliance-audit
Jurisdicciones: {UE + otras aplicables}
Datos personales identificados: {LISTA CONOCIDA O "descubrir"}
Bases legales actuales: {CONSENTIMIENTO / INTERÉS LEGÍTIMO / CONTRATO / etc.}

Evaluar:
1. Inventario de tratamiento de datos personales (Art. 30 ROPA)
2. Bases legales por tratamiento (Art. 6)
3. Derechos del titular implementados (Arts. 15-22: acceso, rectificación,
   eliminación, portabilidad, oposición, limitación)
4. Data Protection Impact Assessment necesarios (Art. 35)
5. Data breach notification readiness (Arts. 33-34)
6. Transferencias internacionales (Arts. 44-49)
7. Data Protection Officer designado (Arts. 37-39)

Output: Compliance Audit Report con gap analysis, severity por hallazgo,
y plan de remediación con timeline y responsables.
```

**Cuándo usar:** Auditoría de compliance GDPR antes de un lanzamiento en UE, ante requerimiento regulatorio, o como revisión periódica. Adaptar artículos para CCPA, LGPD u otras regulaciones.

---

## Prompt 4: Data Catalog Implementation

```
Diseña la implementación de un data catalog para {ORGANIZACIÓN}.

Stack actual: {WAREHOUSE / LAKEHOUSE / BASES DE DATOS}
Herramientas de datos: {DBT / AIRFLOW / SPARK / etc.}
Volumen: {NÚMERO DE TABLAS / SCHEMAS / FUENTES}
Budget: {ENTERPRISE SaaS / OSS only / HYBRID}

Entregar:
1. Evaluación de plataformas (Atlan, Alation, DataHub, OpenMetadata)
   con scoring por criterio y recomendación
2. Diseño de taxonomía de metadata (técnica, de negocio, operacional)
3. Estrategia de auto-cataloging: conectores, crawl frequency, lineage depth
4. Business glossary: estructura, ownership de términos, proceso de aprobación
5. Adoption plan: onboarding de stewards, search training, KPIs de uso
6. Roadmap de implementación en 3 fases (foundation → scale → optimize)

Formato: markdown con diagrama de arquitectura del catalog en Mermaid
```

**Cuándo usar:** Cuando la organización necesita un catálogo de datos y no tiene uno, o cuando el catálogo actual no tiene adopción. Combinar con stakeholder-mapping para identificar stewards.

---

## Prompt 5: Data Lineage Mapping

```
Diseña el mapeo de data lineage para {DOMINIO / PIPELINE / SISTEMA}.

Fuentes: {ORIGEN DE DATOS — APIs, DBs, archivos, streams}
Transformaciones: {DBT / SPARK / SQL STORED PROCEDURES / ETL TOOL}
Destinos: {WAREHOUSE / DATA MARTS / APIs / DASHBOARDS}

Entregar:
1. Lineage map end-to-end (source → transform → target) a nivel tabla y columna
2. Clasificación de transformaciones (pass-through, aggregation, derivation, filter)
3. Impact analysis: qué se rompe si cambia la fuente X
4. Freshness chain: latencia acumulada por cada hop
5. Ownership chain: quién es responsable en cada punto del lineage
6. Herramienta de lineage recomendada (OpenLineage, Marquez, platform-native)

Formato: markdown con diagramas Mermaid de lineage (graph LR)
```

**Cuándo usar:** Antes de migración de pipelines, cuando se investiga un incidente de calidad, o como parte del data catalog. Esencial para impact analysis en cambios de schema.

---

## Prompt 6: Data Classification Strategy

```
Diseña la estrategia de clasificación de datos para {ORGANIZACIÓN}.

Regulaciones: {LISTA DE REGULACIONES APLICABLES}
Industria: {SECTOR — determina datos sensibles sectoriales}
Volumen: {NÚMERO DE ASSETS A CLASIFICAR}
Capacidad actual: {MANUAL / SEMI-AUTOMÁTICO / NINGUNA}

Entregar:
1. Taxonomía de clasificación: niveles (Public, Internal, Confidential, Restricted),
   definición de cada nivel, ejemplos por dominio
2. Mapeo regulatorio: qué regulación exige qué nivel para qué tipo de dato
3. Proceso de clasificación: quién clasifica, cuándo, workflow de aprobación
4. Automated classification: herramientas (BigID, Macie, Purview, DLP),
   criterios de selección, accuracy esperado
5. Handling rules por nivel: acceso, cifrado, retención, compartición, destrucción
6. Re-classification triggers: cambios regulatorios, nuevos usos, incidents

Formato: markdown con classification matrix (tabla) y decision tree (Mermaid flowchart)
```

**Cuándo usar:** Cuando no existe taxonomía de clasificación formal, o la existente no cubre datos nuevos (AI training data, datos de terceros). Prerequisito para retention y privacy policies.

---

## Prompt 7: Master Data Management (MDM) Strategy

```
Diseña la estrategia de Master Data Management para {ORGANIZACIÓN}.

Entidades maestras: {CLIENTES / PRODUCTOS / PROVEEDORES / EMPLEADOS / UBICACIONES}
Sistemas fuente: {LISTA DE SISTEMAS que contienen cada entidad}
Problemas actuales: {DUPLICADOS / INCONSISTENCIAS / CONFLICTOS DE VERSIÓN}
Volume: {REGISTROS POR ENTIDAD}

Entregar:
1. Assessment de madurez MDM actual por entidad
2. MDM style recomendado por entidad (registry, consolidation, coexistence, centralized)
3. Golden record rules: lógica de survivorship (qué fuente gana por atributo)
4. Match & merge strategy: criterios de matching, threshold de confianza, manual review
5. Data stewardship model: quién resuelve conflictos, workflow de excepción
6. Herramientas: Informatica MDM, Reltio, Tamr, Semarchy — scoring por criterio
7. Roadmap: quick wins (dedup) → foundation (golden record) → optimization (real-time sync)

Formato: markdown con entity relationship diagram y MDM architecture en Mermaid
```

**Cuándo usar:** Cuando hay múltiples sistemas con versiones conflictivas de la misma entidad. Síntomas: reportes con números diferentes, duplicados en CRM, inconsistencias entre ERP y BI.

---

## Prompt 8: Data Retention Policy Design

```
Diseña las políticas de retención de datos para {ORGANIZACIÓN}.

Regulaciones: {GDPR Art.5(1)(e) / CCPA / SOX / HIPAA / INDUSTRIA-ESPECÍFICAS}
Dominios de datos: {LISTA DE DOMINIOS — transacciones, logs, PII, financiero, etc.}
Infraestructura: {CLOUD PROVIDER / ON-PREM / HYBRID}
Volumen actual: {TB/PB y crecimiento mensual}

Entregar:
1. Retention schedule: tabla por tipo de dato con período mínimo, máximo,
   base legal, acción al vencimiento (archive, anonymize, delete)
2. Archival strategy: hot → warm → cold → archive tiers, automatización
3. Deletion procedures: soft delete vs. hard delete, verification, audit trail
4. Legal hold process: cómo suspender retención por litigio o investigación
5. PII-specific retention: minimización, pseudonymización, derecho al olvido
6. Cost optimization: impacto en storage costs por política de tiering
7. Monitoring: KPIs de cumplimiento, alertas de datos fuera de retención

Formato: markdown con retention schedule (tabla) y lifecycle diagram (Mermaid stateDiagram)
```

**Cuándo usar:** Obligatorio para compliance GDPR/CCPA. También cuando los costos de almacenamiento crecen sin control o cuando hay riesgo legal por retener datos más de lo necesario.

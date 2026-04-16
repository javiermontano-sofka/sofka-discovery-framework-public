# Body of Knowledge — Data Governance

> Base de conocimiento académica e industrial que fundamenta la skill `data-governance`.

---

## Fuentes Primarias

### 1. DAMA-DMBOK2 (Data Management Body of Knowledge, 2nd Edition)

- **Organismo:** DAMA International
- **Obra:** *DAMA-DMBOK: Data Management Body of Knowledge* (2nd ed., 2017)
- **Relevancia:** Marco fundacional de 11 áreas de conocimiento (Data Governance, Data Quality, Metadata, Master & Reference Data, Data Architecture, Data Modeling, Data Storage, Data Security, Data Integration, Documents & Content, Data Warehousing & BI). Posiciona Data Governance como el área central que orquesta las demás.
- **Aplicación en la skill:** S1 (Catalog) se alinea con el conocimiento de Metadata Management. S2 (Ownership) implementa el modelo de stewardship DAMA. S3 (Classification) sigue el framework de Data Security. S7 (Quality Dimensions) adopta las 6 dimensiones canónicas de DAMA. El Governance Maturity Model del SKILL.md se alinea con CMMI/DAMA.

### 2. ISO 8000 — Data Quality

- **Organismo:** ISO/TC 184
- **Norma:** ISO 8000 (series: 8000-1 through 8000-150+)
- **Relevancia:** Estándar internacional para calidad de datos. Define requisitos para datos maestros, datos transaccionales, y datos de producto. Establece un vocabulario común para dimensiones de calidad y procesos de medición.
- **Aplicación en la skill:** S7 (Quality Dimensions) usa ISO 8000 como referencia normativa para las 6 dimensiones. S8 (Validation) alinea reglas de validación con los requisitos de conformidad ISO 8000. Los quality scores del skill usan las métricas definidas en ISO 8000-8 (information quality).

### 3. ISO 27001 — Information Security Management

- **Organismo:** ISO/IEC JTC 1
- **Norma:** ISO/IEC 27001:2022
- **Relevancia:** Framework para sistemas de gestión de seguridad de la información. Define controles para clasificación de información, control de acceso, y protección de datos. Complementa la gobernanza de datos con la perspectiva de seguridad.
- **Aplicación en la skill:** S3 (Classification) se alinea con los niveles de clasificación ISO 27001 (Confidential, Internal, Public). S5 (Privacy) complementa los controles de acceso. La matriz de clasificación del skill mapea directamente a controles Annex A.

### 4. GDPR — General Data Protection Regulation

- **Organismo:** Parlamento Europeo y Consejo de la Unión Europea
- **Norma:** Regulation (EU) 2016/679, vigente desde mayo 2018
- **Relevancia:** Regulación más influyente globalmente en protección de datos personales. Define derechos del titular (acceso, rectificación, eliminación, portabilidad), obligaciones del controlador/procesador, bases legales de tratamiento, y requisitos de Data Protection Impact Assessment (DPIA).
- **Aplicación en la skill:** S5 (Privacy & Compliance) diseña políticas de privacidad alineadas a GDPR. S4 (Retention) implementa el principio de limitación de almacenamiento. S3 (Classification) identifica PII/PII sensible. S1 (Catalog) registra bases legales de tratamiento por activo.

### 5. CCPA — California Consumer Privacy Act

- **Organismo:** Estado de California, EE.UU.
- **Norma:** California Consumer Privacy Act (2018), enmendado por CPRA (2020), vigente desde enero 2023
- **Relevancia:** Principal regulación de privacidad en EE.UU. Define derechos del consumidor (know, delete, opt-out of sale, non-discrimination). A diferencia de GDPR, se centra en la "venta" de datos y aplica umbrales de ingresos/volumen.
- **Aplicación en la skill:** S5 (Privacy) mapea requisitos CCPA junto a GDPR para organizaciones con presencia en EE.UU. y UE. S3 (Classification) incluye categorías CCPA (personal information, sensitive personal information). S4 (Retention) implementa los requisitos de retención mínima.

### 6. Robert S. Seiner — Non-Invasive Data Governance

- **Autor:** Robert S. Seiner
- **Obra:** *Non-Invasive Data Governance: The Path of Least Resistance and Greatest Success* (2014, 2nd ed. 2022)
- **Relevancia:** Enfoque pragmático que formaliza la gobernanza ya existente informalmente en lugar de imponer estructuras nuevas. Identifica stewards "de facto" (quienes ya definen, producen y usan los datos) y los empodera sin burocracia adicional.
- **Aplicación en la skill:** S2 (Ownership) aplica el modelo de Seiner para identificar stewards naturales. S6 (Computational Governance) usa el principio de "menor resistencia" para diseñar políticas que se adopten. El approach "non-invasive" guía la recomendación de governance style en el Maturity Model.

### 7. John Ladley — Data Governance

- **Autor:** John Ladley
- **Obra:** *Data Governance: How to Design, Deploy, and Sustain an Effective Data Governance Program* (2012, 2nd ed. 2019)
- **Relevancia:** Guía práctica para diseñar programas de gobernanza. Enfatiza el business case, la estructura organizacional (Data Governance Council, Stewardship Working Groups), y la sostenibilidad a largo plazo. Incluye frameworks de madurez y métricas de programa.
- **Aplicación en la skill:** S2 (Ownership) usa el modelo organizacional de Ladley (DGC + DWG). El Governance Maturity Model incorpora los niveles de Ladley. S6 (Computational Governance) implementa la visión de Ladley de governance sostenible vía automatización.

### 8. Laura Sebastian-Coleman — Measuring Data Quality for Ongoing Improvement

- **Autora:** Laura Sebastian-Coleman
- **Obra:** *Measuring Data Quality for Ongoing Improvement* (Morgan Kaufmann, 2013)
- **Relevancia:** Referencia práctica para medir calidad de datos de forma continua. Define frameworks de medición, KPIs de calidad, y procesos de mejora iterativa. Conecta las dimensiones abstractas de calidad con métricas operacionales concretas.
- **Aplicación en la skill:** S7 (Quality Dimensions) usa los frameworks de medición de Sebastian-Coleman para operacionalizar las 6 dimensiones. S8 (Validation) implementa los patrones de monitoring continuo. Los quality scores y SLAs del skill se basan en sus guías de threshold setting.

---

## Fuentes Complementarias

| Fuente | Autor/Org | Año | Contribución |
|--------|-----------|-----|--------------|
| *Data Quality Assessment* | Arkady Maydanchik | 2007 | Taxonomía de reglas de validación y patrones de profiling |
| *Master Data Management and Data Governance* | Alex Berson & Larry Dubov | 2010 | MDM strategies: registry, consolidation, coexistence, centralized |
| *The Data Governance Imperative* | Steve Sarsfield | 2009 | Conexión entre governance y ROI empresarial |
| *Data Mesh: Delivering Data-Driven Value at Scale* | Zhamak Dehghani | 2022 | Federated computational governance, data products como unidad |
| *Data Contracts* | Andrew Jones | 2023 | Contratos formales entre productores y consumidores de datos |
| *COBIT 2019* | ISACA | 2019 | Controles de gobernanza IT aplicados a datos |
| *DCAM Framework* | EDM Council | 2023 | Capability assessment para data management en industrias reguladas |

---

## Herramientas de Referencia para Data Quality

| Herramienta | Tipo | Fortaleza | Caso de Uso |
|-------------|------|-----------|-------------|
| **Great Expectations** | OSS, Python | Expectativas declarativas, docs auto-generados | Validación en pipelines Python/Spark |
| **dbt tests** | OSS, SQL | Integrado con transformación, schema + custom tests | Quality gates en pipelines dbt |
| **Soda Core** | OSS, YAML/SQL | Checks declarativos, multi-datasource, Soda Cloud | Monitoring cross-platform, alertas |
| **Monte Carlo** | SaaS | Observabilidad ML-driven, detección de anomalías | Enterprise data observability |
| **Ataccama** | Enterprise | Profiling + governance + quality en uno | Organizaciones que necesitan suite integrada |

---

## Glosario

| Término | Definición |
|---------|------------|
| **Data Catalog** | Inventario centralizado de activos de datos con metadata técnica y de negocio, lineage y clasificación |
| **Data Steward** | Persona responsable de la calidad, definición y uso correcto de un dominio de datos |
| **Data Owner** | Ejecutivo accountable de un dominio de datos, con autoridad para aprobar políticas y acceso |
| **Data Classification** | Proceso de categorizar datos por nivel de sensibilidad (public, internal, confidential, restricted) |
| **Data Lineage** | Trazabilidad del origen, transformaciones y destino de un activo de datos |
| **Data Retention Policy** | Reglas que definen cuánto tiempo se conservan los datos y cuándo se archivan o eliminan |
| **Master Data Management (MDM)** | Disciplina para mantener una versión única y autoritativa de entidades de negocio clave |
| **Data Contract** | Acuerdo formal entre productor y consumidor que define schema, SLAs, quality expectations y ownership |
| **Data Product** | Activo de datos gestionado como producto: discoverable, addressable, trustworthy, self-describing |
| **PII (Personally Identifiable Information)** | Datos que pueden identificar directa o indirectamente a una persona natural |
| **DPIA (Data Protection Impact Assessment)** | Evaluación obligatoria bajo GDPR cuando el tratamiento presenta alto riesgo para los derechos del titular |
| **Accuracy** | Dimensión de calidad: grado en que los datos representan correctamente la realidad que modelan |
| **Completeness** | Dimensión de calidad: grado en que todos los valores esperados están presentes y no son nulos |
| **Consistency** | Dimensión de calidad: grado en que los datos son coherentes entre sistemas, tablas y momentos temporales |
| **Timeliness** | Dimensión de calidad: grado en que los datos están disponibles cuando se necesitan y reflejan el estado actual |
| **Uniqueness** | Dimensión de calidad: grado en que cada entidad aparece una sola vez sin duplicados |
| **Validity** | Dimensión de calidad: grado en que los datos cumplen con reglas de formato, rango y dominio definidas |
| **Data Profiling** | Análisis estadístico de datasets para descubrir patrones, anomalías, distribuciones y problemas de calidad |
| **Quarantine Pattern** | Patrón de arquitectura que aísla registros que fallan validación para revisión antes de ingestión |
| **Federated Computational Governance** | Modelo de gobernanza donde las políticas se definen centralmente pero se ejecutan como código en cada dominio |

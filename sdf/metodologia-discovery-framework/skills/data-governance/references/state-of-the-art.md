# State of the Art — Data Governance

> Tendencias 2024-2026 en gobernanza de datos, calidad de datos y compliance.

---

## Tendencia 1: Active Metadata Management

**Estado:** Early Majority adoptando

La metadata deja de ser un catálogo pasivo para convertirse en un sistema activo que automatiza acciones basadas en cambios de metadata. Las plataformas de "active metadata" integran catalogación, lineage, clasificación y quality monitoring en un solo plano de control.

**Plataformas líderes:**

| Plataforma | Fortaleza | Diferenciador |
|------------|-----------|---------------|
| **Atlan** | Active metadata, data mesh native | Playbooks que automatizan acciones sobre cambios de metadata |
| **Alation** | Governance + catalog enterprise | Behavioral analytics para medir adoption del catálogo |
| **Collibra** | Data intelligence, regulatory compliance | Workflow engine para aprobaciones y certificaciones |

**Principios clave:**
- Metadata como "sistema nervioso": cada cambio en un asset dispara acciones automáticas (clasificación, notificación, quality check)
- Lineage activo: no solo visualizar, sino actuar sobre impactos de cambios upstream
- Search + discovery potenciados con NLP/LLM: preguntas en lenguaje natural sobre el catálogo
- Integración bidireccional con herramientas del data stack (dbt, Airflow, Spark)

**Implicación para la skill:** S1 (Catalog) prioriza plataformas con active metadata. S6 (Computational Governance) implementa playbooks de automatización. S8 (Validation) conecta quality checks con eventos de metadata.

---

## Tendencia 2: Data Contracts

**Estado:** Early Adopters → Early Majority

Popularizados por Andrew Jones (*Data Contracts*, 2023), los contratos de datos formalizan el acuerdo entre productores y consumidores. Un data contract define schema, SLAs, quality expectations, ownership, y mecanismos de cambio.

**Elementos de un data contract:**
- **Schema:** Definición explícita de campos, tipos, nullable, constraints
- **SLAs:** Freshness (max delay), completeness (min fill rate), volume (expected range)
- **Quality expectations:** Reglas de validación por campo con severity y acción
- **Ownership:** Quién produce, quién consume, quién aprueba cambios
- **Change management:** Proceso de versioning (semver), deprecation, breaking changes
- **Enforcement:** Automated checks en CI/CD (schema registry, contract tests)

**Herramientas emergentes:**
- **Schemata** (OSS): Contract definition format + validation
- **DataHub contracts**: Built-in contract support en DataHub 0.12+
- **Bitol / Open Data Contract Standard (ODCS)**: Estándar abierto de contratos

**Implicación para la skill:** S6 (Computational Governance) incluye data contracts como pilar de governance federada. S7 (Quality) vincula quality dimensions a SLAs contractuales. S8 (Validation) implementa contract enforcement en pipelines.

---

## Tendencia 3: AI Governance y LLM Data Compliance

**Estado:** Innovators → Early Adopters

La explosión de LLMs y AI generativa crea nuevos desafíos de gobernanza:

**Desafíos clave:**
- **Training data governance:** ¿Qué datos se usaron para entrenar? ¿Hay PII? ¿Hay sesgos?
- **RAG data governance:** Los datos que alimentan Retrieval-Augmented Generation necesitan clasificación, lineage y access control
- **Output governance:** Los outputs de LLMs pueden contener datos sensibles, alucinaciones, o contenido regulado
- **Model cards & data sheets:** Documentación estandarizada del modelo y sus datos de entrenamiento
- **AI Act (EU):** Clasificación de riesgo de sistemas AI y requisitos de transparencia por categoría

**Frameworks emergentes:**
- **NIST AI RMF 1.0** (2023): Risk management framework para AI
- **EU AI Act** (2024): Regulación por niveles de riesgo (unacceptable, high, limited, minimal)
- **ISO/IEC 42001** (2023): Estándar de sistema de gestión de AI

**Implicación para la skill:** S3 (Classification) incluye categorías para datos de training AI. S5 (Privacy) extiende compliance a outputs de LLMs. S6 (Computational Governance) incorpora model registry como extensión del data catalog.

---

## Tendencia 4: Automated Data Classification con ML

**Estado:** Early Majority

La clasificación manual de datos no escala. Las organizaciones adoptan ML para detectar automáticamente PII, PHI, datos financieros y contenido sensible:

**Técnicas:**
- **NER (Named Entity Recognition):** Detecta nombres, direcciones, emails, SSN en texto libre
- **Pattern matching + ML:** Combinación de regex (formatos conocidos) con clasificadores para datos ambiguos
- **Column-level inference:** Clasificación basada en nombre de columna + distribución estadística de valores
- **Context-aware classification:** Usa metadata del catálogo (tabla, schema, pipeline) para mejorar precisión

**Plataformas con clasificación automática:**
- **BigID:** Líder en discovery + classification automatizada, ML-driven
- **OneTrust DataDiscovery:** Integrado con privacy management
- **AWS Macie:** Nativo para datos en S3
- **Google Cloud DLP:** Classification + de-identification en GCP
- **Microsoft Purview:** Classification + sensitivity labels en Azure/M365

**Implicación para la skill:** S3 (Classification) recomienda automated classification como estándar para Level 4+ del maturity model. S1 (Catalog) integra clasificación automática en el proceso de discovery.

---

## Tendencia 5: Data Mesh Governance (Federated Computational Governance)

**Estado:** Early Adopters → Early Majority

La gobernanza en un data mesh no es centralizada ni descentralizada — es federada y computacional:

**Principios:**
- **Federated:** Cada dominio define y opera su gobernanza local dentro de estándares globales
- **Computational:** Las políticas se expresan como código ejecutable, no como documentos PDF
- **Interoperable:** Estándares globales garantizan que datos de diferentes dominios puedan combinarse
- **Automated:** Enforcement automático en pipelines, no auditorías manuales periódicas

**Patrones de implementación:**
- **Policy-as-code:** Open Policy Agent (OPA), Rego policies, automated enforcement
- **Global standards:** Naming conventions, classification taxonomy, quality thresholds, retention rules
- **Domain autonomy:** Cada dominio elige herramientas pero cumple standards
- **Data product contracts:** Cada data product publica un contrato interoperable
- **Computational policies:** Tags de clasificación, quality checks, retention rules ejecutados automáticamente

**Implicación para la skill:** S6 (Computational Governance) es el corazón del skill para organizaciones Level 4+. S2 (Ownership) implementa el modelo de ownership por dominio. S7 (Quality) define quality thresholds globales que cada dominio implementa localmente.

---

## Tendencia 6: Privacy-Enhancing Technologies (PETs)

**Estado:** Early Adopters

Tecnologías que permiten usar datos sin exponer datos sensibles:

| Tecnología | Mecanismo | Caso de Uso |
|------------|-----------|-------------|
| **Differential Privacy** | Agrega ruido estadístico controlado a queries/outputs | Analytics sobre datos sensibles sin revelar individuos |
| **Synthetic Data** | Genera datos artificiales con las mismas propiedades estadísticas | Testing, desarrollo, ML training sin datos reales |
| **Homomorphic Encryption** | Permite computación sobre datos cifrados | Cloud computing sobre datos regulados |
| **Federated Learning** | Entrena modelos sin centralizar datos | ML cross-organizacional sin compartir datos raw |
| **Secure Multi-Party Computation** | Múltiples partes computan función conjunta sin revelar inputs | Benchmarking entre competidores, fraud detection |
| **Data Clean Rooms** | Entornos controlados para análisis conjunto | Marketing analytics, partnerships de datos |

**Plataformas emergentes:**
- **Gretel.ai:** Synthetic data generation
- **Mostly AI:** Synthetic data para enterprise
- **Duality Technologies:** Homomorphic encryption
- **Snowflake Data Clean Rooms:** Built-in en Snowflake

**Implicación para la skill:** S5 (Privacy) incluye PETs como alternativa a anonimización tradicional. S3 (Classification) evalúa qué datos son candidatos para PETs vs. restricción total. S7 (Quality) valida que datos sintéticos mantengan propiedades estadísticas del original.

---

## Horizonte 2026+

| Señal | Madurez | Impacto Potencial |
|-------|---------|-------------------|
| **Data-as-a-Product marketplaces** | Innovators | Monetización de datos con governance incorporada |
| **Sovereign cloud data governance** | Early Adopters | Residencia de datos por jurisdicción como política computacional |
| **LLM-powered data stewardship** | Innovators | AI que sugiere clasificación, owners, y políticas automáticamente |
| **Continuous compliance monitoring** | Early Adopters | Compliance como pipeline, no como auditoría periódica |
| **Blockchain-based data provenance** | Innovators | Lineage inmutable para datos regulados y auditados |

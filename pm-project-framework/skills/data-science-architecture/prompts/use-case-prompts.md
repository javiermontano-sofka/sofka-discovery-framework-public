# Use-Case Prompts — Data Science Architecture

Specialized prompts for frequent ML/AI system architecture scenarios. Each prompt activates the skill with use-case-specific context.

---

## Prompt 1: MLOps Maturity Assessment

**Scenario:** The client has ML models in production but without formalized processes. Needs to assess maturity level and define a roadmap.

**Prompt:**
```
Evalúa la madurez MLOps del sistema {NOMBRE_SISTEMA} usando el modelo de 4 niveles (Level 0-3).

Contexto:
- Equipo actual: {N} data scientists, {M} ML engineers
- Modelos en producción: {CANTIDAD}
- Herramientas actuales: {LISTA}
- Problemas reportados: {PROBLEMAS}

Genera:
1. Scorecard de madurez actual por dimensión (training, serving, monitoring, governance, feature management)
2. Gap analysis detallado entre estado actual y Level 2 (target 12 meses)
3. Roadmap de mejora en 3 fases con quick wins en primeras 4 semanas
4. Estimación de esfuerzo en FTE-meses por fase

{MODO_OPERACIONAL}=mlops
{VARIANTE}=técnica
```

---

## Prompt 2: Feature Store Design

**Scenario:** The team has multiple models reusing features with inconsistencies between training and serving. They need a centralized feature store.

**Prompt:**
```
Diseña la arquitectura de feature store para {NOMBRE_SISTEMA}.

Contexto:
- Modelos que compartirán features: {LISTA_MODELOS}
- Volumen de features: {N} features, {M} feature groups
- Requisitos de latencia: online serving < {X}ms, batch training: {Y} horas
- Stack actual: {CLOUD_PROVIDER}, {DATA_WAREHOUSE}, {STREAMING_PLATFORM}
- Presupuesto: {RANGO}

Genera:
1. Evaluación comparativa de feature stores (Feast vs Tecton vs Hopsworks) para este contexto
2. Arquitectura de feature pipelines (batch, streaming, on-demand)
3. Diseño de online/offline stores con tecnologías recomendadas
4. Estrategia de training-serving consistency (point-in-time correctness)
5. Feature registry con governance (ownership, documentación, lineage)
6. Plan de migración desde el estado actual

{MODO_OPERACIONAL}=feature-store
{VARIANTE}=técnica
```

---

## Prompt 3: Model Serving Architecture

**Scenario:** The client needs to bring models to production with specific latency, scalability, and reliability requirements.

**Prompt:**
```
Diseña la arquitectura de model serving para {NOMBRE_SISTEMA}.

Contexto:
- Modelos a servir: {LISTA} (tipo, tamaño, framework)
- SLA de latencia: p50 < {X}ms, p99 < {Y}ms
- Throughput esperado: {QPS} queries por segundo (pico: {PICO_QPS})
- Patrón de tráfico: {CONSTANTE | BURSTY | DIURNO}
- Infraestructura: {CLOUD_PROVIDER}, {KUBERNETES | SERVERLESS | BARE_METAL}
- Budget de serving mensual: {RANGO}

Genera:
1. Patrón de serving recomendado (real-time, batch, streaming, híbrido) con justificación
2. Infraestructura de serving (endpoints, scaling, load balancing)
3. Estrategia de deployment: A/B testing + canary deployment con criterios estadísticos
4. Shadow mode para validación pre-producción
5. Optimización de latencia (model compilation, quantization, caching, batching)
6. Fallback behavior por modelo y cost optimization (right-sizing GPU)

{MODO_OPERACIONAL}=integral
{VARIANTE}=técnica
```

---

## Prompt 4: Experiment Tracking Setup

**Scenario:** The data science team works in notebooks without formal tracking. Experiments are not reproducible and there is no model registry.

**Prompt:**
```
Diseña el framework de experiment tracking y model registry para {NOMBRE_SISTEMA}.

Contexto:
- Equipo: {N} data scientists, {M} notebooks activos
- Frameworks ML: {PYTORCH | TENSORFLOW | SKLEARN | XGBOOST}
- Entorno de desarrollo: {JUPYTER | COLAB | MAOMAKER_STUDIO | DATABRICKS}
- Modelos existentes: {N} en producción (sin versionamiento formal)
- Cloud: {PROVIDER}

Genera:
1. Evaluación de herramientas (MLflow vs W&B vs Vertex AI Experiments) para este contexto
2. Setup de experiment tracking: parámetros, métricas, artefactos, code snapshots
3. Model registry design: versionamiento, promotion workflow (staging → production)
4. Lineage tracking: data version → feature version → code version → model version
5. Framework de reproducibilidad: environment capture, seed management, deterministic training
6. Plan de adopción: migración desde notebooks actuales en 4 semanas

{MODO_OPERACIONAL}=integral
{VARIANTE}=técnica
```

---

## Prompt 5: End-to-End ML Pipeline Design

**Scenario:** Greenfield project that needs to design the complete ML pipeline from data ingestion to monitoring.

**Prompt:**
```
Diseña el pipeline ML end-to-end para {NOMBRE_SISTEMA}.

Contexto:
- Caso de uso ML: {DESCRIPCION}
- Datos: {VOLUMEN}, {FRECUENCIA_ACTUALIZACIÓN}, {FUENTES}
- Requisitos de negocio: {SLA_LATENCIA}, {FRECUENCIA_PREDICCIÓN}
- Equipo: {COMPOSICIÓN}
- Cloud: {PROVIDER}, presupuesto mensual: {RANGO}
- Regulación: {INDUSTRIA} — {REQUISITOS_COMPLIANCE}

Genera las 6 secciones completas:
1. S1: Topología del sistema ML (training path, serving path, data flow)
2. S2: Feature engineering y feature store
3. S3: Experiment tracking y model registry
4. S4: Arquitectura de model serving
5. S5: MLOps pipeline (CI/CD, retraining, testing)
6. S6: Governance y responsible AI

Incluye trade-off matrix y validation gate completada.

{MODO_OPERACIONAL}=integral
{VARIANTE}=técnica
```

---

## Prompt 6: Notebook-to-Production Migration

**Scenario:** The team has successful models in notebooks that need to be productionized. No existing MLOps infrastructure.

**Prompt:**
```
Diseña el plan de migración notebook-to-production para {NOMBRE_SISTEMA}.

Contexto:
- Notebooks a migrar: {N} ({LISTA_MODELOS})
- Estado actual: {DESCRIPCIÓN_ESTADO} (manual, sin tests, sin versioning)
- Modelos prioritarios: {TOP_3} por valor de negocio
- Equipo disponible: {N} ML engineers, {M} data scientists
- Timeline: {SEMANAS} semanas para primer modelo en producción
- Cloud: {PROVIDER}

Genera:
1. Evaluación de readiness por notebook (code quality, reproducibility, data dependencies)
2. Arquitectura target: modular code, containerización, CI/CD
3. Plan de migración incremental: notebook → scripts → pipeline → producción
4. Framework de testing para ML (unit tests, data validation, model validation)
5. Infraestructura mínima viable (experiment tracking, model registry, basic monitoring)
6. Resistencia esperada y estrategia de adopción por equipo

{MODO_OPERACIONAL}=mlops
{VARIANTE}=técnica
```

---

## Prompt 7: Responsible AI Architecture

**Scenario:** The ML system operates in a regulated industry (finance, health, government). Compliance with EU AI Act and responsible AI frameworks is required.

**Prompt:**
```
Diseña el framework de responsible AI para {NOMBRE_SISTEMA}.

Contexto:
- Industria: {INDUSTRIA}
- Regulaciones aplicables: {EU_AI_ACT | GDPR | HIPAA | PCI_DSS | SOX}
- Clasificación de riesgo: {ALTO | MEDIO | BAJO}
- Modelos afectados: {LISTA} con descripción de decisiones automatizadas
- Datos sensibles: {TIPOS_PII}
- Stakeholders de compliance: {ROLES}

Genera:
1. Clasificación de riesgo EU AI Act por modelo con justificación
2. Checklist de responsible AI completado (7 puntos del skill) por modelo
3. Bias detection framework: métricas, umbrales, subgrupos a monitorear
4. Explainability tooling: SHAP/LIME por tipo de modelo, global + local explanations
5. Audit trail architecture: decision logging, lineage, aprobaciones
6. Data privacy controls: PII handling, masking, differential privacy
7. Human-in-the-loop design: cuándo, cómo, escalation paths

{MODO_OPERACIONAL}=integral
{VARIANTE}=técnica
```

---

## How to Use These Prompts

1. **Select the prompt** closest to the client scenario
2. **Fill in the variables** in curly braces with project data
3. **Adjust parameters** ({MODO}, {FORMATO}, {VARIANTE}) as needed
4. **Combine prompts** if the scope covers multiple scenarios

---

**Author:** Javier Montaño | **Date:** March 13, 2026 | **Version:** 1.0
**License:** MIT, Comunidad MetodologIA

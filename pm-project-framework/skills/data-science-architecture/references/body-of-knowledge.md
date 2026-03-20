# Body of Knowledge — Data Science Architecture

Corpus de conocimiento curado que fundamenta las decisiones arquitectónicas de sistemas ML/AI. Cada fuente está clasificada por dominio, relevancia y aplicabilidad dentro del framework de 6 secciones del skill.

---

## Fuentes Primarias

### Libros Fundamentales

| # | Fuente | Autor(es) | Año | Dominio | Secciones Relacionadas |
|---|--------|-----------|-----|---------|----------------------|
| 1 | **Designing Machine Learning Systems** | Chip Huyen | 2022 | ML system design end-to-end | S1, S2, S4, S5 |
| 2 | **Machine Learning Engineering** | Andriy Burkov | 2020 | ML engineering practices | S1, S3, S5 |
| 3 | **Reliable Machine Learning** | Cathy Chen, Martin Gorner et al. | 2022 | ML reliability & operations | S4, S5, S6 |
| 4 | **Building Machine Learning Pipelines** | Hannes Hapke, Catherine Nelson | 2020 | Pipeline design & automation | S1, S5 |
| 5 | **Machine Learning Design Patterns** | Valliappa Lakshmanan, Sara Robinson, Michael Munn | 2020 | Patrones reutilizables para ML | S1, S2, S4 |

### Whitepapers y Guías de Referencia

| # | Fuente | Organización | Relevancia |
|---|--------|-------------|-----------|
| 6 | **MLOps: Continuous delivery and automation pipelines in machine learning** | Google Cloud | Niveles de madurez MLOps (0-2), arquitectura de referencia CI/CD para ML |
| 7 | **Hidden Technical Debt in Machine Learning Systems** | Google Research (Sculley et al., 2015) | Deuda técnica específica de ML: glue code, pipeline jungles, feedback loops |
| 8 | **Rules of Machine Learning: Best Practices for ML Engineering** | Martin Zinkevich (Google) | 43 reglas pragmáticas para ingeniería ML |
| 9 | **Responsible AI Practices** | Google AI | Framework de IA responsable: fairness, interpretabilidad, privacidad |
| 10 | **EU AI Act — Technical Documentation Requirements** | Comisión Europea | Requisitos regulatorios para sistemas de alto riesgo |

### Documentación de Plataformas

| # | Plataforma | Tipo | Uso en el Skill |
|---|-----------|------|----------------|
| 11 | **MLflow Documentation** | OSS — Experiment tracking, model registry | S3: experiment tracking, model versioning, registry workflows |
| 12 | **Kubeflow Documentation** | OSS — ML pipelines on Kubernetes | S5: pipeline orchestration, distributed training |
| 13 | **Feast Documentation** | OSS — Feature store | S2: feature store design, online/offline stores |
| 14 | **Tecton Documentation** | Enterprise feature platform | S2: real-time feature serving, feature management |
| 15 | **Weights & Biases Documentation** | SaaS — Experiment tracking | S3: experiment visualization, sweep search, collaboration |
| 16 | **Evidently AI Documentation** | OSS — ML monitoring | S4: drift detection, model monitoring, test suites |
| 17 | **Vertex AI Documentation** | GCP — Managed ML platform | S1-S6: end-to-end managed ML lifecycle |
| 18 | **SageMaker Documentation** | AWS — Managed ML platform | S1-S6: end-to-end managed ML lifecycle |

---

## Mapping: Fuentes → Secciones del Skill

| Sección | Fuentes Clave | Conceptos Fundamentales |
|---------|---------------|------------------------|
| **S1: ML System Topology** | Huyen (cap. 1-3), Google MLOps whitepaper, ML Design Patterns | Training vs serving paths, maturity levels, infrastructure mapping |
| **S2: Feature Engineering & Store** | Huyen (cap. 5), Feast docs, Tecton docs | Feature computation, online/offline stores, training-serving skew |
| **S3: Experiment Tracking** | Burkov (cap. 4-5), MLflow docs, W&B docs | Experiment logging, model registry, lineage, reproducibilidad |
| **S4: Model Serving** | Huyen (cap. 7), ML Design Patterns (cap. 6-8), Evidently docs | Serving patterns, A/B testing, canary, latency optimization |
| **S5: MLOps Pipeline** | Google MLOps whitepaper, Kubeflow docs, Building ML Pipelines | CI/CD for ML, retraining triggers, pipeline orchestration |
| **S6: Governance & Responsible AI** | Reliable ML (cap. 9-11), EU AI Act, Google RAI Practices | Bias detection, explainability, model cards, compliance |

---

## Frameworks Conceptuales Adoptados

### 1. Niveles de Madurez MLOps (Google)

Adoptado directamente en S1 para evaluar estado actual y definir roadmap:

- **Level 0**: Manual — notebooks, no reproducibilidad
- **Level 1**: Automatización de training pipeline, deployment manual
- **Level 2**: CI/CD completo para training y deployment, monitoring activo

### 2. Feature Store Architecture (Feast/Tecton)

Modelo de referencia para S2: separación offline/online store, materialización, point-in-time correctness.

### 3. Model Registry Workflow (MLflow)

Patrón staging → production → archived adoptado en S3 para governance de modelos.

### 4. Responsible AI Checklist (Google + EU AI Act)

7 puntos obligatorios en S6: model card, bias metrics, explainability, data audit, human override, audit trail, compliance mapping.

---

## Criterios de Selección de Fuentes

Cada fuente incluida cumple al menos 3 de estos 5 criterios:

1. **Autoridad reconocida** — autor o organización referente en el dominio
2. **Aplicabilidad práctica** — contiene patrones, checklists o frameworks implementables
3. **Actualidad** — publicado o actualizado en los últimos 5 años (2021+)
4. **Relevancia para el skill** — mapea directamente a una o más secciones del skill
5. **Complementariedad** — cubre un ángulo no cubierto por otras fuentes

---

## Lecturas Complementarias

| Fuente | Tema | Nivel |
|--------|------|-------|
| **Feature Store for ML** (Feast blog series) | Deep dive en feature stores | Técnico |
| **Made With ML** (Goku Mohandas) | MLOps course con código | Práctico |
| **Full Stack Deep Learning** (UC Berkeley) | ML systems course | Académico |
| **ML Engineering for Production** (Andrew Ng, Coursera) | MLOps especialización | Introductorio |
| **ONNX Runtime Documentation** | Model optimization & portability | Técnico |

---

**Autor:** Javier Montaño | **Fecha:** 13 de marzo de 2026 | **Versión:** 1.0
**Licencia:** Todos los derechos reservados, Comunidad MetodologIA

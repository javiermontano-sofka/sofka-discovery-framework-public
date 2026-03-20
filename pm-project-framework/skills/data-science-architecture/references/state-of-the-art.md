# State of the Art — Data Science Architecture

Tendencias emergentes, tecnologías en evolución y cambios de paradigma que impactan el diseño de sistemas ML/AI. Este documento se actualiza periódicamente para mantener el skill alineado con el estado del arte.

---

## Tendencias Clave (2025-2026)

### 1. LLMOps — Operacionalización de Modelos de Lenguaje

**Estado:** Adopción acelerada. Evolución de MLOps hacia operaciones específicas de LLMs.

**Impacto en el skill:**
- S1 (Topology): Nuevos componentes — prompt versioning, RAG pipelines, guardrails layer
- S4 (Serving): Latencia diferente (100ms-10s), costos por token, caching de respuestas
- S5 (MLOps): CI/CD incluye evaluación de prompts, not just modelo
- S6 (Governance): Hallucination detection, toxicity filtering, content safety

**Herramientas emergentes:**
| Herramienta | Función | Madurez |
|-------------|---------|---------|
| LangSmith | Tracing y evaluación de LLM apps | Producción |
| Arize Phoenix | Observabilidad LLM, embedding drift | Producción |
| Guardrails AI | Validación de outputs LLM | Producción |
| LMSYS Chatbot Arena | Evaluación comparativa de modelos | Investigación |
| vLLM / TGI | Serving optimizado de LLMs | Producción |

**Consideración arquitectónica:** LLMOps no reemplaza MLOps clásico — lo extiende. Modelos tabulares y de visión siguen necesitando pipelines tradicionales. La arquitectura debe soportar ambos paradigmas.

---

### 2. Foundation Model Fine-Tuning — Personalización Eficiente

**Estado:** Madurez creciente. Técnicas PEFT (Parameter-Efficient Fine-Tuning) democratizan la personalización.

**Impacto en el skill:**
- S1 (Topology): Distinción entre pre-training (pocos equipos) y fine-tuning (muchos equipos)
- S2 (Features): Embedding stores como extensión del feature store tradicional
- S3 (Experiment Tracking): Tracking de adaptadores LoRA, no modelos completos
- S5 (MLOps): Pipelines de fine-tuning con datasets curados, evaluation benchmarks

**Técnicas clave:**
- **LoRA / QLoRA:** Fine-tuning eficiente con <1% de parámetros modificados. Reduce costo de GPU 10-100x
- **RLHF / DPO / ORPO:** Alineación con preferencias humanas. DPO simplifica el proceso eliminando el reward model
- **Retrieval-Augmented Fine-Tuning (RAFT):** Combina RAG con fine-tuning para dominios especializados
- **Continued Pre-Training:** Adaptación a dominio con corpus específico antes de fine-tuning

**Consideración arquitectónica:** El model registry debe soportar adaptadores (LoRA weights) como artefactos independientes del modelo base. Versionamiento de base model + adapter = deployment unit.

---

### 3. Feature Platforms — Evolución del Feature Store

**Estado:** Consolidación. Feature stores evolucionan a plataformas completas de gestión de features.

**Impacto en el skill:**
- S2 (Features): Feature platforms incluyen compute, store, serve y discover en una sola plataforma
- S1 (Topology): Simplificación de la topología — menos componentes, más integración

**Evolución:**

| Generación | Capacidad | Ejemplo |
|-----------|-----------|---------|
| Gen 1 (2020) | Offline store + online store | Feast v0.x |
| Gen 2 (2022) | + Feature computation + Registry | Feast v0.30+, Tecton |
| Gen 3 (2024+) | + Real-time transforms + Embeddings + Streaming-first | Tecton, Feathr, Qdrant + Feast |

**Tendencia emergente:** Embedding stores como extensión del feature store. Vector databases (Pinecone, Weaviate, Qdrant) gestionan embeddings como features de primera clase para sistemas RAG y búsqueda semántica.

---

### 4. ML Observability — Monitoreo Proactivo

**Estado:** Adopción mainstream. De "nice to have" a requisito en producción.

**Impacto en el skill:**
- S4 (Serving): Monitoring integrado en serving, no como componente separado
- S5 (MLOps): Alertas de drift como triggers de retraining automatizado
- S6 (Governance): Observability como evidencia para auditoría y compliance

**Capacidades emergentes:**
- **Embedding drift detection:** Monitoreo de distribución de embeddings para modelos NLP/LLM
- **Slice-based monitoring:** Detección de degradación en subgrupos específicos (no solo agregados)
- **Root cause analysis automatizado:** Correlación automática drift → feature → data source
- **Synthetic monitoring:** Generación de inputs de prueba periódicos para validar comportamiento

**Stack de referencia:**
```
Producción:  Arize / WhyLabs (monitoring real-time)
CI/CD:       Evidently (test suites en pipeline)
Debugging:   Arize Phoenix (tracing LLM) + Evidently (reports)
Dashboards:  Grafana + custom metrics
```

---

### 5. Responsible AI Frameworks — Gobernanza Regulatoria

**Estado:** Regulación activa. EU AI Act en vigor, frameworks corporativos obligatorios.

**Impacto en el skill:**
- S6 (Governance): De checklist voluntario a requisito legal
- S3 (Experiment Tracking): Documentación obligatoria (model cards, data cards)
- S4 (Serving): Human-in-the-loop obligatorio para sistemas de alto riesgo

**Desarrollos clave:**
- **EU AI Act (2024-2026):** Clasificación de riesgo obligatoria. Sistemas de alto riesgo requieren: documentación técnica, evaluación de conformidad, registro en base de datos EU, monitoreo post-market
- **NIST AI RMF (2023+):** Framework de gestión de riesgos AI del gobierno de EE.UU.
- **ISO/IEC 42001 (2023):** Estándar internacional para sistemas de gestión de IA
- **Model cards v2:** Evolución hacia documentación estructurada y machine-readable

**Herramientas de compliance:**
| Herramienta | Función | Licencia |
|-------------|---------|---------|
| AI Fairness 360 (IBM) | Métricas de fairness, mitigación de bias | OSS |
| Responsible AI Toolbox (Microsoft) | Error analysis, fairness, interpretability | OSS |
| Google Model Cards Toolkit | Generación de model cards | OSS |
| Holistic AI | Auditoría y compliance AI | Comercial |

---

### 6. Tendencias Adicionales en Horizonte

| Tendencia | Horizonte | Impacto Potencial |
|-----------|-----------|-------------------|
| **Compound AI Systems** | 12-18 meses | Sistemas que combinan múltiples modelos + tools + retrieval. Arquitectura de orquestación diferente a modelo único |
| **Synthetic Data Generation** | Ahora | Generación de datos sintéticos para training cuando datos reales son escasos o sensibles. Distillation de LLMs |
| **Edge AI / On-Device ML** | Ahora | Modelos compactos (<50MB) para inferencia en dispositivos. Quantization, pruning, knowledge distillation |
| **Federated Learning** | 18-24 meses | Training distribuido preservando privacidad. Relevante para healthcare, finanzas |
| **Autonomous Agents** | 12-18 meses | Sistemas agentic que usan modelos como componentes de decisión. Requieren observabilidad y guardrails especializados |
| **GPU-as-a-Service optimization** | Ahora | MIG (Multi-Instance GPU), spot instances inteligentes, serverless GPU (Modal, RunPod) |

---

## Implicaciones para el Skill

### Actualizaciones Recomendadas

1. **S1 — Topology:** Agregar componentes LLMOps (prompt store, guardrails, RAG pipeline) como extensión opcional
2. **S2 — Features:** Incluir embedding stores y vector databases como categoría de feature store
3. **S3 — Experiment Tracking:** Soportar tracking de LoRA adapters y prompt evaluations
4. **S4 — Serving:** Documentar serving de LLMs (vLLM, TGI, caching, streaming responses)
5. **S5 — MLOps:** Extender CI/CD con prompt testing, evaluation benchmarks, guardrail validation
6. **S6 — Governance:** Mapear EU AI Act clasificación de riesgo como paso obligatorio

### Criterios de Inclusión

Una tendencia se incorpora al skill cuando:
- Tiene al menos 2 herramientas en producción (no solo investigación)
- Es relevante para >30% de proyectos enterprise de ML
- Tiene implicaciones arquitectónicas (no solo de implementación)

---

**Autor:** Javier Montaño | **Fecha:** 13 de marzo de 2026 | **Versión:** 1.0
**Licencia:** Todos los derechos reservados, Comunidad MetodologIA

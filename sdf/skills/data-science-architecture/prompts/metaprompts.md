# Metaprompts — Data Science Architecture

High-level prompting strategies to maximize the quality and depth of ML/AI architecture deliverables. Metaprompts operate as skill amplifiers, not replacements.

---

## Metaprompt 1: ML Architectural Trade-off Analysis

**Purpose:** Force explicit trade-off analysis for each ML system architectural decision, avoiding generic recommendations.

**Strategy:** For each architectural decision, generate a trade-off table with 4 dimensions: what it enables, what it constrains, when it applies, and when it does NOT apply.

**Instruction:**
```
Para cada decisión arquitectónica en el sistema ML, aplica esta estructura:

DECISIÓN: [nombre de la decisión]
├── HABILITA: [qué capacidad nueva otorga]
├── RESTRINGE: [qué limita o complica]
├── UMBRAL: [condición cuantificable para elegir esta opción]
├── ANTI-PATTERN: [cuándo esta decisión es incorrecta]
└── EVIDENCIA: [fuente que respalda — [CÓDIGO], [DOC], [INFERENCIA]]

Ejemplos de decisiones a evaluar:
- Centralizado vs federado (feature store, training, registry)
- Real-time vs batch vs streaming (serving, features)
- Managed vs self-hosted (MLflow, Kubeflow, cloud-native)
- Full retrain vs incremental update
- ONNX portabilidad vs framework-native performance

NO aceptes una decisión sin su anti-pattern documentado.
```

---

## Metaprompt 2: ML Architecture Stress-Test

**Purpose:** Validate the robustness of the proposed architecture by subjecting each component to failure and scale scenarios.

**Strategy:** Simulate 5 adverse scenarios and verify that the architecture has defined responses for each one.

**Instruction:**
```
Antes de finalizar la arquitectura ML, ejecuta estos 5 stress tests:

1. SCALE TEST: ¿Qué pasa si el volumen de datos de training se multiplica x10?
   → ¿Feature store escala? ¿Training pipeline soporta? ¿Costo se mantiene viable?

2. DRIFT STORM: ¿Qué pasa si 3 features críticas driftean simultáneamente?
   → ¿Monitoring detecta? ¿Retraining se dispara? ¿Hay fallback? ¿En cuánto tiempo?

3. MODEL FAILURE: ¿Qué pasa si el modelo en producción empieza a devolver predicciones degradadas?
   → ¿Rollback automático? ¿Shadow model disponible? ¿Alerta en cuántos minutos?

4. TEAM SCALE: ¿Qué pasa si el equipo pasa de 3 a 15 data scientists?
   → ¿Experiment tracking soporta concurrencia? ¿Feature store tiene governance? ¿Hay conflictos de modelo?

5. COMPLIANCE AUDIT: ¿Qué pasa si un regulador pide auditoría de decisiones de los últimos 6 meses?
   → ¿Audit trail completo? ¿Lineage trazable? ¿Model cards actualizados? ¿Bias metrics históricos?

Para cada test:
- Diagnóstico: ¿La arquitectura actual responde?
- Gap: ¿Qué falta?
- Remediación: ¿Qué componente agregar/modificar?
- Esfuerzo: ¿Cuánto cuesta cerrar el gap?
```

---

## Metaprompt 3: Team Maturity Calibration

**Purpose:** Adapt architectural recommendations to the team's actual maturity level, avoiding proposing solutions the team cannot operate.

**Strategy:** Evaluate team maturity across 4 dimensions and calibrate the complexity of each recommendation.

**Instruction:**
```
Antes de recomendar cualquier componente arquitectónico, evalúa la madurez del equipo:

DIMENSIÓN 1 — ML Engineering:
- Básico: Notebooks, scripts manuales, sin CI/CD
- Intermedio: Pipelines automatizados, containerización, basic testing
- Avanzado: MLOps maduro, feature stores, monitoring automatizado

DIMENSIÓN 2 — Infrastructure:
- Básico: Cloud console manual, sin IaC
- Intermedio: Terraform/CDK, CI/CD básico, ambientes separados
- Avanzado: GitOps, multi-region, auto-scaling, observabilidad

DIMENSIÓN 3 — Data Engineering:
- Básico: CSVs, queries manuales, sin pipelines
- Intermedio: Airflow/Dagster, data warehouse, basic quality
- Avanzado: Streaming, data mesh, governance formal

DIMENSIÓN 4 — Governance:
- Básico: Sin documentación, sin audit trail
- Intermedio: Documentación parcial, model cards básicos
- Avanzado: Compliance formal, bias monitoring, regulatory mapping

REGLA DE CALIBRACIÓN:
- Recomienda máximo 1 nivel por encima del estado actual en cada dimensión
- Si una dimensión está en "básico", NO propongas herramientas de nivel "avanzado"
- Documenta prerequisitos para adoptar cada componente recomendado
- Incluye ramp-up time estimado para cada herramienta nueva
```

---

## Metaprompt 4: Cross-Section Consistency Validation

**Purpose:** Verify that all 6 sections of the deliverable are consistent with each other and free of contradictions.

**Strategy:** Execute 6 cross-consistency checks between sections.

**Instruction:**
```
Antes de entregar, ejecuta estos checks de consistencia cruzada:

CHECK 1: S2 ↔ S4 (Feature Store ↔ Serving)
- ¿Las features del online store son las mismas que consume el modelo en serving?
- ¿La latencia del online store es compatible con el SLA de serving?
- ¿Hay training-serving skew potencial no mitigado?

CHECK 2: S3 ↔ S5 (Experiment Tracking ↔ MLOps)
- ¿El model registry tiene promotion workflow que el CI/CD respeta?
- ¿Los artefactos de experiment tracking son inputs del pipeline de deployment?
- ¿El lineage tracking cubre todo el pipeline end-to-end?

CHECK 3: S4 ↔ S5 (Serving ↔ MLOps)
- ¿El pipeline de deployment produce artefactos compatibles con la infraestructura de serving?
- ¿Los tests de modelo en CI/CD validan las mismas métricas que monitoring en producción?
- ¿El rollback automático está integrado en el pipeline?

CHECK 4: S1 ↔ S6 (Topology ↔ Governance)
- ¿El nivel de madurez MLOps es consistente con los controles de governance propuestos?
- ¿Los modelos de alto riesgo tienen controles proporcionados en la topología?

CHECK 5: S5 ↔ S6 (MLOps ↔ Governance)
- ¿Los retraining triggers respetan los gates de governance (bias check, approval)?
- ¿El audit trail captura todas las acciones del pipeline automatizado?

CHECK 6: Presupuesto Global
- ¿El costo total de infraestructura (feature store + serving + monitoring + training) es coherente?
- ¿Las optimizaciones de costo en S5 se reflejan en las estimaciones de S4?

Si encuentras inconsistencia: documéntala con sección y párrafo específico, y propón corrección.
```

---

## Metaprompt 5: Effective Mermaid Diagram Generation

**Purpose:** Ensure that Mermaid diagrams in the deliverable are informative, readable, and follow the framework standard.

**Strategy:** Apply quality rules to each generated diagram.

**Instruction:**
```
Para cada diagrama Mermaid en el entregable, verifica:

REGLA 1 — Densidad: Máximo 20 nodos. Si hay más, agrupa en subgraphs o divide en diagramas separados.
REGLA 2 — IDs descriptivos: Usar authService, featureStore, no n1, n2. El diagrama debe leerse sin la leyenda.
REGLA 3 — Edges etiquetados: Cada conexión tiene un label que describe la relación (datos, eventos, APIs).
REGLA 4 — Dirección correcta: TD para jerarquías y stacks, LR para flujos y pipelines.
REGLA 5 — Máximo 4 classDef: Usar colores MetodologIA (#6366F1, #1A1A2E, #22D3EE, #D97706).

DIAGRAMAS RECOMENDADOS POR SECCIÓN:
- S1 (Topology): flowchart LR — training path y serving path
- S2 (Features): flowchart TD — feature pipeline de fuente a online/offline store
- S3 (Experiment): flowchart LR — experiment → model registry → promotion
- S4 (Serving): flowchart LR — request → routing → model → response + monitoring
- S5 (MLOps): flowchart TD — CI/CD pipeline con gates
- S6 (Governance): flowchart TD — clasificación de riesgo → controles

Mínimo 2 diagramas por entregable completo. Máximo 4.
```

---

## Metaprompt Application Order

Metaprompts are applied in this order:

1. **Calibration** (MP3) — before designing, to calibrate complexity
2. **Trade-offs** (MP1) — during design, for each decision
3. **Stress-test** (MP2) — after design, to validate robustness
4. **Consistency** (MP4) — before delivery, to verify coherence
5. **Diagrams** (MP5) — when generating each diagram

---

**Author:** Javier Montaño | **Date:** March 13, 2026 | **Version:** 1.0
**License:** MIT, Comunidad MetodologIA

---
name: metodologia-ai-architecture-audit
description: >
  Audits existing AI system architectures against best practices — structural integrity, AI quality attributes,
  pattern adherence, anti-pattern detection, security compliance, and technical debt inventory. This skill should
  be used when the user asks to "audit AI architecture", "review ML system quality", "assess AI technical debt",
  "evaluate AI compliance", "detect AI anti-patterns", "review AI security posture", or mentions AI architecture
  review, AI system assessment, AI quality audit, drift monitoring audit, or AI governance review.
model: opus
context: fork
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# AI Architecture Audit: Systematic Assessment of AI-Enabled Systems

Auditar arquitecturas de sistemas de IA existentes contra mejores prácticas, identificando gaps en calidad,
seguridad, patrones, y deuda técnica. Produce un informe de auditoría con findings categorizados por severidad,
evidencia por cada hallazgo, y un roadmap de remediación priorizado por impacto y urgencia.

---

## Principio Rector

1. **Evidence-based, not opinion-based.** Cada finding debe tener evidencia adjunta — código, configuración, métricas, o entrevista. Un hallazgo sin evidencia es una opinión, no un resultado de auditoría.

2. **Severity drives priority, not sequence.** No auditar linealmente de arriba a abajo. Empezar por las dimensiones de mayor riesgo para el sistema específico (seguridad en regulados, quality attributes en producción, deuda en sistemas legacy).

3. **Remediation is part of the audit.** Un informe que solo lista problemas sin soluciones ejecutables es un documento de quejas. Cada finding incluye patrón de remediación, esfuerzo estimado, y dependencias.

---

## Inputs

```
Parámetros:
  MODO:     [express | standard | deep]
  FORMATO:  [ejecutivo | técnico | híbrido]
  VARIANTE: [structural | quality | security | debt | genai | full]
  FOCO:     [pipeline | model | serving | monitoring | all]

Detección automática:
  - Si existe codebase con ML code → FOCO=all (scan completo)
  - Si el input menciona "seguridad" o "compliance" → VARIANTE=security
  - Si el input menciona "deuda" o "legacy" → VARIANTE=debt
  - Si existe LangChain/LlamaIndex/Bedrock → VARIANTE incluye genai
  - Default: MODO=standard, VARIANTE=full, FOCO=all
```

---

## When to Use

- Evaluar la salud arquitectónica de un sistema AI existente antes de escalar
- Detectar anti-patrones (Training-Serving Skew, YOLO Deploy, Silent Degradation) en producción
- Auditar compliance y seguridad de sistemas AI para requisitos regulatorios
- Inventariar deuda técnica específica de AI (model drift, pipeline jungle, feature sprawl)
- Evaluar readiness de un sistema AI para migración, upgrade, o modernización
- Due diligence técnica de sistemas AI en adquisiciones o partnerships
- Preparar un sistema AI para auditoría externa (SOC2, HIPAA, PCI-DSS)

## When NOT to Use

- Diseñar una nueva arquitectura AI → **metodologia-ai-software-architecture**
- Diseñar pipelines AI nuevos → **metodologia-ai-pipeline-architecture**
- Seleccionar patrones de diseño → **metodologia-ai-design-patterns**
- Definir estrategia de testing → **metodologia-ai-testing-strategy**
- Diseñar arquitectura GenAI → **metodologia-genai-architecture**
- Auditar específicamente infraestructura AWS → **metodologia-aws-architecture-audit**
- Implementar remediaciones → **metodologia-ai-architecture-implementation**

---

## Delivery Structure: 6 Sections

### S1: Structural Integrity Assessment

Evalúa la estructura interna del sistema AI contra el modelo de 6 capas.

```
Load references:
  Read ${CLAUDE_SKILL_DIR}/references/audit-framework.md
```

**Evaluación:**
- Layer separation: ¿Las 6 capas (Hardware→Data→Model→Inference→Application→Monitoring) tienen límites claros?
- Module cohesion: ¿Cada módulo tiene responsabilidad única? ¿Componentes AI separados de lógica de negocio?
- Dependency direction: ¿Dependencias fluyen correctamente (arriba→abajo)? ¿Ciclos detectados?
- Contract compliance: ¿Contratos de datos entre stages definidos y testeados?
- Interface stability: ¿Interfaces de modelo versionadas y backward-compatible?

**Herramientas de detección:**
- Import graph analysis (Python: pydeps, vulture; Java: jdepend)
- Architectural fitness functions
- Static dependency analysis

**Entregable:** Diagrama de dependencias actual, violations catalogadas, score de integridad estructural.

### S2: AI Quality Attributes Audit

Evalúa quality attributes específicos de AI con métricas medibles.

**Attributes evaluados:**

| Attribute | Threshold | Current | Gap | Severity |
|-----------|-----------|---------|-----|----------|
| Accuracy | >= .88 | [measured] | [delta] | [severity] |
| Fairness | >= 90% parity | [measured] | [delta] | [severity] |
| Explainability | >= 0.7 | [measured] | [delta] | [severity] |
| Robustness | +/-10% | [measured] | [delta] | [severity] |
| Drift Detection | < 1 hour | [measured] | [delta] | [severity] |
| Latency P95 | < 500ms | [measured] | [delta] | [severity] |
| Availability | >= 99.9% | [measured] | [delta] | [severity] |

**Proceso:**
1. Obtener thresholds definidos (de CONOPS, SLAs, o requisitos)
2. Medir estado actual (métricas de producción, tests, entrevistas)
3. Calcular gap y clasificar severidad
4. Si no hay thresholds definidos → finding MEDIUM: "Quality attribute sin threshold definido"

**Entregable:** Scorecard de quality attributes con gaps, tendencias, y comparación vs. thresholds.

### S3: Pattern & Anti-Pattern Detection

Escanea el sistema por patrones implementados y anti-patrones presentes.

```
Load references:
  Read ${CLAUDE_SKILL_DIR}/references/audit-checklists.md
```

**Patterns esperados vs. encontrados:**
- Feature Store: ¿Existe? ¿Correctamente implementado? ¿Usado por múltiples modelos?
- Champion-Challenger: ¿A/B testing activo? ¿Criterios de promoción definidos?
- Drift Detection: ¿Monitoreo continuo? ¿Alertas configuradas? ¿Retraining automático?
- Circuit Breaker: ¿Fallback definido? ¿Testeado? ¿Rollback automático?
- Guardrails: ¿Input/output validation? ¿PII masking? ¿Content safety?

**Anti-patterns detectados:**
- Escanear código por Training-Serving Skew (feature computation divergence)
- Revisar pipeline por YOLO Deploy (direct-to-production)
- Detectar Silent Degradation (no drift monitoring)
- Identificar Pipeline Jungle (dependency analysis)
- Buscar Unguarded LLM (no input validation on model calls)
- Detectar Token Budget Blindness (no cost tracking)

**Entregable:** Matriz de patrones (esperado/encontrado/gap), lista de anti-patrones con evidencia y severidad.

### S4: Security & Compliance Audit

Evalúa la postura de seguridad y compliance del sistema AI.

**OWASP LLM Top 10 Assessment** (para sistemas GenAI):
- LLM01 Prompt Injection: ¿Input sanitization? ¿Guardrails?
- LLM02 Insecure Output: ¿Output validation? ¿Content filtering?
- LLM03 Training Data Poisoning: ¿Data provenance? ¿Validation?
- LLM06 Sensitive Information: ¿PII detection? ¿Data masking?
- LLM08 Excessive Agency: ¿Tool whitelisting? ¿Human approval gates?

**Data Security:**
- Encryption at rest and in transit
- Access controls (RBAC/ABAC) on models, data, endpoints
- PII handling (detection, masking, retention, deletion)
- Data lineage completeness and immutability
- Audit trail for predictions and decisions

**Model Security:**
- Model access controls (who can invoke, who can modify)
- Model extraction protection
- Adversarial input defense
- Supply chain security (model dependencies, packages)

**Compliance:**
- Governance workflow (approval gates, documentation)
- Regulatory mapping (GDPR, HIPAA, SOX, PCI-DSS as applicable)
- Audit readiness (can produce evidence on demand)

**Entregable:** Security controls matrix (required/implemented/gap), compliance gap analysis, risk rating.

### S5: Technical Debt Inventory

Cataloga deuda técnica específica de AI con impacto cuantificado.

**Debt types:**
- **Model drift debt**: Modelos sin monitoreo de drift → accuracy desconocida en producción
- **Training-serving skew**: Feature computation divergente → predicciones silenciosamente incorrectas
- **Pipeline jungle**: Dependencies entrelazadas → cualquier cambio puede romper el pipeline
- **Dead feature debt**: Features computadas pero no usadas → compute desperdiciado
- **Experiment debt**: Experimentos huérfanos → code clutter, confusión
- **Responsible AI debt**: Sin fairness testing ni explainability → riesgo regulatorio
- **LLMOps debt**: Prompts sin versionado, sin cost tracking → costos incontrolados
- **Documentation debt**: Arquitectura no documentada → onboarding lento, errores por falta de contexto
- **Test debt**: Coverage insuficiente → confianza falsa en calidad

**Cuantificación:**
- Impact: ¿Qué pasa si no se paga? (degradation, regulatory fine, outage)
- Interest rate: ¿Qué tan rápido crece? (daily/weekly/monthly)
- Principal: ¿Cuánto esfuerzo para eliminarla? (story points / FTE-días)

**Entregable:** Inventario de deuda priorizado por impact × urgency × reversibility.

### S6: Remediation Roadmap

Transforma findings en un roadmap ejecutable priorizado por valor y esfuerzo.

```
Load references:
  Read ${CLAUDE_SKILL_DIR}/references/remediation-patterns.md
```

**Priorización:**
- Priority Score = Impact (1-3) × Urgency (1-3) × Reversibility (1-3)
- Score 18-27: Fix immediately (este sprint)
- Score 9-17: Fix soon (este quarter)
- Score 4-8: Plan (próximo quarter)
- Score 1-3: Backlog (oportunístico)

**Roadmap phases:**
- Phase 1 — Critical Safety (Sprint 1-2): Security vulnerabilities, governance basics, data quality gates
- Phase 2 — Quality Foundation (Sprint 3-4): Drift detection, fairness testing, circuit breakers
- Phase 3 — Operational Excellence (Sprint 5-8): Full observability, CI/CD, Feature Store
- Phase 4 — Optimization (Sprint 9-12): Multi-model tiering, caching, cost optimization

**Para cada finding:**
- Patrón de remediación (referencia a ai-design-patterns o ai-pipeline-architecture)
- Esfuerzo estimado (T-shirt: S/M/L/XL)
- Dependencias (qué debe existir antes)
- Definition of Done (cómo verificar que se resolvió)

**Entregable:** Roadmap visual (Mermaid Gantt), tabla de findings con remediaciones, dependency graph.

---

## Trade-off Matrix

| Audit Mode | Coverage | Depth | Effort | When to Use |
|------------|----------|-------|--------|-------------|
| **Express** | Top findings only | Surface | 1-2 días | Quick health check, time-boxed |
| **Standard** | All 6 dimensions | Moderate | 3-5 días | Regular audit, pre-scaling |
| **Deep** | All 6 dimensions + code review | Maximum | 5-10 días | Pre-regulation, due diligence, post-incident |

---

## Assumptions

1. Acceso al código fuente, configuraciones, y métricas de producción del sistema AI
2. Acceso a stakeholders técnicos para entrevistas y clarificaciones
3. El sistema está desplegado (o tiene un ambiente representativo) para medición
4. Thresholds de quality attributes definidos o definibles durante la auditoría
5. El equipo está dispuesto a recibir findings y actuar sobre remediaciones

## Limits

1. NO implementa remediaciones — solo identifica y prioriza (ver **metodologia-ai-architecture-implementation**)
2. NO reemplaza una auditoría de seguridad formal — complementa con perspectiva AI-específica
3. NO audita lógica de negocio — solo la arquitectura técnica del sistema AI
4. Auditoría AWS-específica (Well-Architected, servicios AWS) requiere **metodologia-aws-architecture-audit**
5. NO genera código de tests — define qué testear (ver **metodologia-ai-testing-strategy**)

---

## Edge Cases

1. **Sistema sin monitoreo**: Muchas métricas de quality attributes serán "desconocidas". El primer finding es "implementar observabilidad básica antes de poder auditar quality attributes".

2. **Sistema legacy sin documentación**: La auditoría debe hacer reverse engineering. Aumentar esfuerzo de S1 (structural). Usar import analysis y dependency graphs como fuente primaria de evidencia.

3. **Sistema pre-producción**: No hay métricas de producción. Auditar diseño y tests, no runtime. Reducir peso de S2 (quality attributes en producción) y aumentar S3 (pattern adherence) y S4 (security).

4. **Multi-team ownership**: Findings pueden cruzar boundaries de equipo. Documentar ownership por finding. Roadmap debe considerar coordinación cross-team.

5. **Post-incident audit**: Foco en la cadena causal del incidente. S4 (security) y S2 (quality) tienen prioridad. Remediation roadmap empieza por la causa raíz del incidente.

---

## Validation Gate

- [ ] Cada finding tiene evidencia etiquetada ([CÓDIGO], [CONFIG], [MÉTRICA], [DOC], [ENTREVISTA], [HERRAMIENTA])
- [ ] Findings clasificados por severidad (CRITICAL, HIGH, MEDIUM, LOW, INFO)
- [ ] Las 6 dimensiones evaluadas (o justificación explícita si alguna se omitió)
- [ ] Anti-patrones escaneados con método de detección documentado
- [ ] Quality attributes medidos contra thresholds (o "desconocido" documentado)
- [ ] Security controls evaluados contra matriz de controles requeridos
- [ ] Deuda técnica cuantificada (impact, interest rate, principal)
- [ ] Roadmap de remediación priorizado con dependency graph
- [ ] Cada remediación tiene pattern, esfuerzo, dependencias, y Definition of Done
- [ ] Informe es actionable — el equipo puede empezar a trabajar con solo leer el informe

---

## Cross-References

| Skill | Relación |
|-------|----------|
| `ai-software-architecture` | Proporciona el modelo de 6 capas contra el que se audita |
| `ai-conops` | Proporciona thresholds y modos operacionales como baseline |
| `ai-pipeline-architecture` | Pipeline patterns contra los que se audita |
| `ai-design-patterns` | Catálogo de patrones y anti-patrones para detección |
| `ai-testing-strategy` | Testing matrix como checklist de coverage |
| `genai-architecture` | Patrones GenAI contra los que se auditan sistemas LLM |
| `aws-architecture-audit` | Auditoría AWS-específica (complementaria) |
| `aws-architecture-design` | Diseño AWS contra el que se audita |
| `ai-architecture-implementation` | Recibe roadmap de remediación para ejecutar |
| `security-architecture` | Framework de seguridad general complementario |
| `tech-debt-assessment` | Assessment de deuda técnica general complementario |

---

## Output Format Protocol

```
if FORMATO == "ejecutivo":
  Executive summary (1 página) + top 10 findings + roadmap visual
  Audiencia: C-Level, sponsors, decision makers

if FORMATO == "técnico":
  Full 6-section audit report + all findings + detailed remediation
  Audiencia: Arquitectos, tech leads, ML engineers

if FORMATO == "híbrido":
  Executive summary + technical deep-dive completo
  Audiencia: Technical leads que reportan a C-Level
```

## Output Artifact

```
## {System Name} — AI Architecture Audit Report

### Executive Summary
[Scorecard visual: 6 dimensiones con score, top 5 critical findings, roadmap overview]

### S1: Structural Integrity [Score: X/5]
[Layer analysis, dependency violations, module cohesion findings]

### S2: Quality Attributes [Score: X/5]
[Attribute scorecard with gaps, trends, threshold compliance]

### S3: Patterns & Anti-Patterns [Score: X/5]
[Pattern matrix, anti-pattern list with evidence]

### S4: Security & Compliance [Score: X/5]
[Controls matrix, OWASP LLM assessment, compliance gaps]

### S5: Technical Debt Inventory [Score: X/5]
[Debt catalog with quantification]

### S6: Remediation Roadmap
[Prioritized roadmap with phases, Gantt, dependency graph]

### Appendix: Evidence Log
[All findings with tagged evidence]
```

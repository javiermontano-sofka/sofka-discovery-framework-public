---
name: metodologia-aws-architecture-audit
description: >
  Audits AWS AI/GenAI architectures against the Well-Architected GenAI Lens — operational excellence, security,
  reliability, performance, cost optimization, and sustainability. This skill should be used when the user asks to
  "audit AWS AI architecture", "review Bedrock configuration", "assess SageMaker security", "optimize AWS AI costs",
  "evaluate AWS GenAI compliance", "review AWS Well-Architected for AI", or mentions AWS AI audit, Bedrock audit,
  SageMaker review, AWS GenAI security assessment, or AWS AI cost optimization review.
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

# AWS Architecture Audit for AI/GenAI Workloads

Auditar arquitecturas AWS para workloads de AI/GenAI contra el Well-Architected Framework GenAI Lens,
evaluando los 6 pilares (GENOPS, GENSEC, GENREL, GENPERF, GENCOST, GENSUS) con checks automatizables,
detección de waste, auditoría de seguridad AWS-específica, y compliance mapping por regulación.

---

## Principio Rector

1. **Well-Architected Lens es el estándar, no una guía.** Los checks del GenAI Lens no son sugerencias — son el baseline mínimo para workloads AI en producción. Un sistema que falla en GENSEC (security) o GENREL (reliability) no está listo para producción independientemente del rendimiento del modelo.

2. **Cost waste is a finding, not an optimization.** En auditoría, el waste no es "una oportunidad de mejora" — es un hallazgo con severidad. Un endpoint SageMaker idle 24/7 con tráfico esporádico es un finding HIGH, no un "nice to have".

3. **Automate the audit, not just the fix.** Cada check debe ser repetible y automatizable (AWS Config rules, CloudWatch alarms, custom Lambda checks). Una auditoría que depende de revisión manual no escala.

---

## Inputs

```
Parámetros:
  MODO:     [express | standard | deep]
  FORMATO:  [ejecutivo | técnico | híbrido]
  VARIANTE: [security | cost | reliability | performance | full]
  SCOPE:    [bedrock | sagemaker | opensearch | full-stack]

Detección automática:
  - Si existe CDK/CloudFormation con Bedrock → SCOPE incluye bedrock
  - Si existe SageMaker endpoints → SCOPE incluye sagemaker
  - Si el input menciona "costo" o "billing" → VARIANTE=cost
  - Si el input menciona "seguridad" o "compliance" → VARIANTE=security
  - Default: MODO=standard, VARIANTE=full, SCOPE=full-stack
```

---

## When to Use

- Auditar configuración de Bedrock (Guardrails, IAM, VPC endpoints, modelo seleccionado)
- Revisar seguridad de SageMaker (IAM roles, VPC mode, encryption, endpoints)
- Detectar cost waste en servicios AI de AWS (idle endpoints, wrong model tier, no batch)
- Evaluar compliance de workloads AI contra HIPAA, PCI-DSS, SOX, GDPR en AWS
- Pre-production readiness review para sistemas AI en AWS
- Auditoría periódica de Well-Architected GenAI Lens (quarterly)
- Post-incident review de sistemas AI en AWS

## When NOT to Use

- Auditoría de arquitectura AI cloud-agnostic → **metodologia-ai-architecture-audit**
- Diseñar nueva arquitectura AWS para AI → **metodologia-aws-architecture-design**
- Implementar remediaciones en AWS → **metodologia-aws-architecture-implementation**
- Auditoría de infraestructura AWS general (no AI) → **metodologia-infrastructure-architecture**
- Diseño de patrones AI genéricos → **metodologia-ai-design-patterns**

---

## Delivery Structure: 6 Sections

### S1: Well-Architected GenAI Lens Assessment

Evalúa el workload contra los 6 pilares del GenAI Lens con checks específicos de AWS.

```
Load references:
  Read ${CLAUDE_SKILL_DIR}/references/aws-audit-checks.md
```

**Entregable:** Scorecard por pilar con findings.

| Pilar | Checks | Pass | Fail | N/A | Score |
|-------|--------|------|------|-----|-------|
| GENOPS (Operational Excellence) | 7 | [n] | [n] | [n] | [%] |
| GENSEC (Security) | 10 | [n] | [n] | [n] | [%] |
| GENREL (Reliability) | 8 | [n] | [n] | [n] | [%] |
| GENPERF (Performance) | 6 | [n] | [n] | [n] | [%] |
| GENCOST (Cost) | 8 | [n] | [n] | [n] | [%] |
| GENSUS (Sustainability) | 3 | [n] | [n] | [n] | [%] |

Para cada check fallido: evidencia específica de AWS (console screenshot, CLI output, config file), severidad, y remediación con servicio AWS concreto.

### S2: AWS Service Configuration Audit

Audita la configuración específica de cada servicio AWS utilizado para AI.

**Bedrock:**
- ¿Guardrails configurados con content filtering, PII redaction, topic denial?
- ¿Modelo seleccionado apropiado para el workload (no over-provisioned)?
- ¿Knowledge Bases con chunking strategy documentada?
- ¿Cross-region inference profile (si multi-región requerido)?
- ¿Provisioned throughput vs. on-demand justificado?

**SageMaker:**
- ¿Endpoints con auto-scaling configurado?
- ¿Instance type apropiado (GPU vs. Inferentia vs. CPU)?
- ¿Model Monitor activo (data quality, model quality, bias)?
- ¿VPC mode para training y inference?
- ¿Lifecycle policies en notebooks?

**OpenSearch Serverless:**
- ¿OCU configuration apropiada (min/max)?
- ¿Index pattern optimizado (single vs. multi-collection)?
- ¿Access policies configuradas (VPC, IAM)?
- ¿Encryption at rest habilitado?

**Otros servicios:**
- API Gateway: ¿throttling, auth, WAF?
- Lambda: ¿concurrency limits, VPC, timeout?
- Step Functions: ¿error handling, timeout?
- DynamoDB: ¿capacity mode, TTL, encryption?
- S3: ¿versioning, encryption, lifecycle, public access block?

**Entregable:** Configuration matrix (service × setting × current × recommended × gap).

### S3: Security Posture Assessment

Audita la postura de seguridad completa del stack AI en AWS.

```
Load references:
  Read ${CLAUDE_SKILL_DIR}/references/aws-security-audit.md
```

**OWASP LLM Top 10 — AWS Controls:**
- Para cada vulnerability: ¿control AWS implementado? ¿configurado correctamente?

**IAM Audit:**
- Bedrock IAM: ¿permisos mínimos por modelo y acción?
- SageMaker IAM: ¿roles separados por función (training, inference, admin)?
- Lambda IAM: ¿execution role scoped por función?
- Cross-service: ¿no hay IAM `*` en resources o actions para AI services?

**Network Security:**
- ¿VPC endpoints para Bedrock, SageMaker, S3, OpenSearch?
- ¿Security groups restrictivos?
- ¿No hay endpoints públicos para model serving?
- ¿VPC flow logs habilitados?

**Data Protection:**
- ¿KMS CMK (no AWS-managed) para datos sensibles?
- ¿TLS 1.2+ en tránsito?
- ¿Macie activo para datos de entrenamiento?
- ¿CloudTrail con log file validation?

**Compliance Mapping:**
- Map findings contra HIPAA/PCI-DSS/SOX/GDPR según aplique
- ¿BAA firmado si HIPAA?
- ¿Data residency respetado (región correcta)?

**Entregable:** Security controls matrix, IAM analysis, compliance gap report.

### S4: Cost Optimization Audit

Detecta cost waste y oportunidades de optimización en servicios AI de AWS.

```
Load references:
  Read ${CLAUDE_SKILL_DIR}/references/aws-cost-audit.md
```

**Waste Detection:**
- Bedrock: ¿modelo over-provisioned? ¿no batch? ¿no caching? ¿unbounded agents?
- SageMaker: ¿endpoints idle? ¿GPU innecesario? ¿no Savings Plans? ¿notebooks 24/7?
- OpenSearch: ¿OCUs over-provisioned? ¿no quantization?
- Compute: ¿GPU cuando Inferentia2 funciona? ¿no spot para training?
- Lambda: ¿memory over-provisioned?

**Cost Attribution:**
- ¿Tags en todos los recursos AI?
- ¿Cost Explorer con vistas por model/team/project?
- ¿AWS Budgets con alertas configuradas?
- ¿Cost & Usage Report habilitado para detail?

**Optimization Opportunities:**
- Quick wins (implementar esta semana): tagging, budgets, right-sizing obvio
- Medium-term (este mes): model tiering, batch inference, caching
- Strategic (este quarter): Savings Plans, Inferentia/Trainium, FinOps governance

**Entregable:** Waste inventory con savings estimados, optimization roadmap priorizado.

### S5: Reliability & Performance Audit

Evalúa disponibilidad, rendimiento, y escalabilidad del stack AI.

**Reliability checks:**
- ¿Multi-AZ para model endpoints?
- ¿Fallback cascade definido y testeado?
- ¿Auto-scaling configurado con políticas apropiadas?
- ¿Health checks activos?
- ¿DLQ para async inference?
- ¿Backup y recovery para vector stores y model artifacts?
- ¿RTO/RPO definidos y verificables?

**Performance checks:**
- ¿Latency baselines establecidos (P50, P95, P99)?
- ¿Throughput capacity suficiente para peak?
- ¿CloudWatch alarms para latency y error rate?
- ¿Instance types optimizados para workload?
- ¿Caching layer reduciendo latency?
- ¿Cold start mitigado (provisioned concurrency)?

**Load testing evidence:**
- ¿Load test ejecutado contra producción (o réplica)?
- ¿Resultados documentados vs. SLA?
- ¿Scaling behavior verificado bajo carga?

**Entregable:** Reliability scorecard, performance baselines vs. actuals, scaling assessment.

### S6: Remediation Roadmap (AWS-Specific)

Transforma findings en acciones AWS concretas priorizadas.

**Para cada finding:**
- AWS service/feature específico para remediar
- CLI/Console/IaC steps (conceptuales, no scripts)
- Esfuerzo estimado (T-shirt: S/M/L/XL)
- Dependencias (qué debe existir antes)
- Costo de la remediación vs. costo del riesgo

**Roadmap phases:**
- Phase 1 — Critical Security (1-2 weeks): IAM fixes, Guardrails, VPC endpoints, encryption
- Phase 2 — Cost Quick Wins (2-4 weeks): Right-sizing, batch inference, tagging, budgets
- Phase 3 — Reliability (4-6 weeks): Multi-AZ, auto-scaling, fallback, health checks
- Phase 4 — Optimization (6-12 weeks): Model tiering, caching, Inferentia, Savings Plans
- Phase 5 — Governance (ongoing): FinOps cadence, compliance monitoring, periodic re-audit

**Entregable:** AWS-specific remediation roadmap con Gantt, dependency graph, y estimated savings.

---

## Trade-off Matrix

| Audit Mode | Checks | Depth | Effort | When to Use |
|------------|--------|-------|--------|-------------|
| **Express** | GENSEC + GENCOST only | Config review | 1-2 días | Quick security/cost check |
| **Standard** | All 6 pillars | Config + metrics | 3-5 días | Quarterly review, pre-scaling |
| **Deep** | All 6 pillars + code + IaC review | Full audit | 5-10 días | Pre-compliance, post-incident |

---

## Assumptions

1. Acceso a la cuenta AWS con permisos de lectura sobre AI services (Bedrock, SageMaker, OpenSearch, IAM, CloudTrail)
2. CloudTrail habilitado (si no, es el primer finding CRITICAL)
3. El sistema AI está desplegado en AWS (no solo diseñado)
4. Cost & Usage Report accesible (si no, activar como parte de la auditoría)
5. Stakeholders disponibles para clarificar decisiones de configuración

## Limits

1. NO remedia — solo identifica y prioriza (ver **metodologia-aws-architecture-implementation**)
2. NO ejecuta scripts de auditoría automatizados — define los checks conceptualmente
3. NO audita lógica de modelo o calidad de datos — solo configuración de infraestructura AWS
4. Auditoría de arquitectura AI general (cloud-agnostic) requiere **metodologia-ai-architecture-audit**
5. NO reemplaza AWS Trusted Advisor o Well-Architected Tool — complementa con perspectiva AI-específica

---

## Edge Cases

1. **Cuenta multi-service (AI + non-AI)**: Focus en recursos taggeados como AI. Si no hay tags, el primer finding es "implementar tagging strategy para AI resources".

2. **Multi-account architecture**: Auditar cada cuenta con workloads AI. Verificar cross-account IAM roles, shared services (VPC, KMS), y Service Control Policies en Organizations.

3. **Bedrock-only (no SageMaker)**: Simplificar audit scope. Focus en Guardrails, IAM, cost (model selection), y Knowledge Bases. SageMaker-specific checks se marcan N/A.

4. **Regulatory pre-audit**: Aumentar profundidad de S3 (security) y S5 (reliability). Producir evidencia en formato auditable. Mapear cada check contra el framework regulatorio específico (HIPAA, PCI-DSS).

5. **Post-incident audit**: Priorizar cadena causal del incidente. Si fue cost overrun → S4 primero. Si fue security breach → S3 primero. Si fue outage → S5 primero.

---

## Validation Gate

- [ ] Los 6 pilares del GenAI Lens evaluados con checks pass/fail documentados
- [ ] Cada check fallido tiene evidencia AWS específica (CLI output, config, métrica)
- [ ] Configuración de cada servicio AWS AI auditada contra best practices
- [ ] OWASP LLM Top 10 evaluado contra controles AWS implementados
- [ ] IAM policies auditadas por least privilege (no `*` en AI services)
- [ ] VPC endpoints verificados para servicios AI críticos
- [ ] Cost waste catalogado con savings estimados
- [ ] Tags de cost attribution verificados
- [ ] Reliability checks: Multi-AZ, auto-scaling, fallback, health checks
- [ ] Performance baselines comparados vs. SLA
- [ ] Roadmap de remediación priorizado con acciones AWS concretas
- [ ] Compliance mapping completado para regulaciones aplicables

---

## Cross-References

| Skill | Relación |
|-------|----------|
| `aws-architecture-design` | Diseño AWS contra el que se audita |
| `aws-architecture-implementation` | Recibe roadmap de remediación para implementar |
| `ai-architecture-audit` | Auditoría general (cloud-agnostic) — complementaria |
| `ai-software-architecture` | Modelo de 6 capas como referencia estructural |
| `ai-design-patterns` | Patrones esperados en la arquitectura |
| `genai-architecture` | Patrones GenAI esperados (RAG, agents, guardrails) |
| `security-architecture` | Framework de seguridad general |
| `finops` | FinOps general complementario al cost audit |
| `compliance-assessment` | Assessment de compliance general complementario |

---

## Output Format Protocol

```
if FORMATO == "ejecutivo":
  Scorecard visual (6 pilares) + top 10 findings + cost savings summary + roadmap
  Audiencia: CTO, CISO, CFO

if FORMATO == "técnico":
  Full 6-section audit + all checks + AWS-specific remediation
  Audiencia: Cloud architects, DevOps, security engineers

if FORMATO == "híbrido":
  Executive scorecard + technical deep-dive completo
  Audiencia: Technical leads reporting to C-Level
```

## Output Artifact

```
## {System Name} — AWS AI Architecture Audit Report

### Executive Summary
[6-pillar scorecard, top critical findings, estimated cost savings, compliance status]

### S1: Well-Architected GenAI Assessment [Score: X%]
[Pillar-by-pillar results with check details]

### S2: AWS Service Configuration [Findings: N]
[Service × setting × current × recommended matrix]

### S3: Security Posture [Score: X/5]
[OWASP LLM mapping, IAM analysis, network security, data protection]

### S4: Cost Optimization [Savings: $XX,XXX/month est.]
[Waste inventory, optimization opportunities, FinOps recommendations]

### S5: Reliability & Performance [Score: X/5]
[Availability assessment, performance baselines, scaling analysis]

### S6: AWS Remediation Roadmap
[Phased roadmap with AWS-specific actions, dependencies, estimated effort]

### Appendix: Evidence Log
[All checks with AWS-specific evidence]
```

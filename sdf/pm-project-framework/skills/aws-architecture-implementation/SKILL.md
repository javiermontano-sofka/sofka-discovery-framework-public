---
name: metodologia-aws-architecture-implementation
description: >
  Guides implementation of AI/GenAI architectures on AWS — Bedrock setup, SageMaker pipelines, OpenSearch vector stores,
  API Gateway configuration, security hardening, cost controls, and deployment automation. This skill should be used when
  the user asks to "implement AI on AWS", "set up Bedrock", "deploy SageMaker pipeline", "configure OpenSearch for RAG",
  "implement AWS AI security", "set up AWS AI monitoring", or mentions AWS AI deployment, Bedrock Knowledge Base setup,
  SageMaker endpoint deployment, AWS GenAI implementation, or AWS AI CI/CD pipeline.
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

# AWS Architecture Implementation for AI/GenAI Workloads

Guiar la implementación de arquitecturas AI/GenAI en AWS — desde la configuración de servicios
(Bedrock, SageMaker, OpenSearch Serverless) hasta deployment automation, security hardening, y
cost controls. Produce guías de implementación paso-a-paso, templates de IaC, patrones de
deployment, y configuración de monitoreo con servicios AWS nativos.

---

## Principio Rector

1. **IaC from day one.** Toda configuración AWS se define en código (CDK, CloudFormation, Terraform). La consola se usa para exploración, no para producción. Sin IaC no hay reproducibilidad, no hay audit trail, no hay promotion entre ambientes.

2. **Security by default, not by request.** VPC endpoints, KMS encryption, IAM least privilege, Guardrails, y WAF se implementan en la primera iteración, no como "hardening posterior". Un endpoint Bedrock sin Guardrails no debería existir en producción.

3. **Multi-environment parity.** Dev, staging, y producción usan el mismo template IaC con parámetros distintos (instance size, throughput, model selection). Si funciona en staging debe funcionar en producción, y viceversa.

---

## Inputs

```
Parámetros:
  MODO:     [greenfield | brownfield | remediation | migration]
  FORMATO:  [ejecutivo | técnico | híbrido]
  VARIANTE: [bedrock-rag | bedrock-agents | sagemaker-mlops | multi-model | full]
  IAC:      [cdk | cloudformation | terraform]
  ENV:      [single | multi-env]

Detección automática:
  - Si existe cdk.json → IAC=cdk
  - Si existe *.template.yaml/json → IAC=cloudformation
  - Si existe *.tf → IAC=terraform
  - Si el input menciona "RAG" → VARIANTE=bedrock-rag
  - Si el input menciona "agentes" → VARIANTE=bedrock-agents
  - Si el input menciona "training" o "MLOps" → VARIANTE=sagemaker-mlops
  - Default: MODO=greenfield, VARIANTE=full, IAC=cdk, ENV=multi-env
```

---

## When to Use

- Implementar arquitectura Bedrock RAG (Knowledge Base + OpenSearch + Guardrails)
- Configurar pipeline SageMaker completo (training → registry → endpoint → monitoring)
- Desplegar sistema de agentes Bedrock con action groups y knowledge bases
- Implementar multi-model routing con cost controls en AWS
- Configurar security stack completo para AI en AWS (IAM, VPC, WAF, Guardrails, KMS)
- Implementar CI/CD para modelos en AWS (CodePipeline, Step Functions)
- Configurar monitoring y observabilidad para AI en AWS (CloudWatch, X-Ray, Model Monitor)
- Ejecutar roadmap de remediación de una auditoría AWS AI

## When NOT to Use

- Diseñar la arquitectura AWS (antes de implementar) → **metodologia-aws-architecture-design**
- Auditar implementación existente → **metodologia-aws-architecture-audit**
- Implementar arquitectura AI cloud-agnostic → **metodologia-ai-architecture-implementation**
- Diseñar patrones de arquitectura AI → **metodologia-ai-design-patterns**
- Implementar infraestructura AWS general (no AI) → **metodologia-infrastructure-architecture**

---

## Delivery Structure: 6 Sections

### S1: Foundation & IaC Setup

Establece el foundation: estructura de IaC, networking, security baseline, y environment management.

```
Load references:
  Read ${CLAUDE_SKILL_DIR}/references/aws-iac-templates.md
```

**Componentes:**
- IaC project structure (CDK app, stacks, constructs)
- VPC with private subnets (multi-AZ)
- VPC endpoints for AI services (Bedrock, SageMaker, S3, DynamoDB, OpenSearch)
- KMS key for AI data encryption
- IAM roles baseline (training, inference, admin, CI/CD)
- Tagging policy (Project, Service, Team, Environment, CostCenter)
- Environment configuration (dev, staging, prod parameters)

**IaC Stack Organization:**
```
AI-Foundation-Stack:
  - VPC, subnets, security groups, VPC endpoints
  - KMS keys, IAM roles, tag policies

AI-Data-Stack:
  - S3 buckets (training data, model artifacts, documents)
  - DynamoDB tables (session state, cost tracking)

AI-Inference-Stack:
  - Bedrock configuration OR SageMaker endpoints
  - OpenSearch Serverless (if RAG)
  - Lambda functions, API Gateway

AI-Monitoring-Stack:
  - CloudWatch dashboards, alarms
  - X-Ray configuration
  - Budget alerts
```

**Entregable:** IaC project scaffolded, foundation stack deployed, environments configured.

### S2: Bedrock Implementation

Implementa los servicios Bedrock: model access, Knowledge Bases, Agents, y Guardrails.

```
Load references:
  Read ${CLAUDE_SKILL_DIR}/references/aws-service-setup.md
```

**Bedrock RAG Implementation:**
1. Enable model access (Claude, Titan Embeddings)
2. Create S3 bucket for document store (versioned, KMS encrypted)
3. Create OpenSearch Serverless collection (vector search, multi-AZ)
4. Create Knowledge Base (data source → chunking → embedding → index)
5. Configure chunking strategy (fixed-size for general, semantic for varied content)
6. Sync data source and validate retrieval quality
7. Create Guardrails (content filter + PII + topic denial)
8. Implement query Lambda (Bedrock RetrieveAndGenerate or custom pipeline)

**Bedrock Agents Implementation:**
1. Create agent with clear instruction
2. Define action groups with Lambda functions
3. Configure IAM roles (least privilege per action group)
4. Associate Knowledge Bases for RAG retrieval
5. Associate Guardrails
6. Create agent alias for version management
7. Test with representative queries and edge cases

**Multi-Model Configuration:**
1. Configure primary model (Claude Sonnet for standard)
2. Configure lightweight model (Claude Haiku for simple queries)
3. Configure frontier model (Claude Opus for complex reasoning)
4. Implement routing logic in Lambda
5. Configure cost tracking (DynamoDB + CloudWatch custom metrics)

**Entregable:** Bedrock services operational, tested, and monitored.

### S3: SageMaker Implementation

Implementa el pipeline SageMaker: training, registry, endpoints, y monitoring.

**Training Pipeline:**
1. Configure S3 for training data and model artifacts
2. Create SageMaker Pipeline (processing → training → evaluation → registration)
3. Configure training job (instance type, hyperparameters, spot instances)
4. Set up experiment tracking (SageMaker Experiments)
5. Implement model evaluation step (metrics calculation, threshold check)

**Model Registry:**
1. Create model package group
2. Define metadata requirements (metrics, data hash, lineage)
3. Configure approval workflow (PendingManualApproval or auto-approve)
4. Implement model card generation

**Inference Endpoint:**
1. Create endpoint configuration (instance type, auto-scaling)
2. Deploy endpoint (min 2 instances for multi-AZ)
3. Configure auto-scaling (target tracking on InvocationsPerInstance)
4. Enable data capture (10% sampling for monitoring)
5. Load test and establish baselines

**Model Monitor:**
1. Configure data quality monitor (baseline from training data)
2. Configure model quality monitor (accuracy tracking)
3. Configure bias detection (if applicable)
4. Set up CloudWatch alarms on monitor findings
5. Configure automated retraining trigger (optional)

**Entregable:** SageMaker pipeline operational, endpoint serving, monitoring active.

### S4: Security Hardening

Implementa la postura de seguridad completa para el stack AI.

**Network Security:**
- VPC endpoints for all AI services (no internet egress)
- Security groups (restrictive, AI-service-specific)
- WAF web ACL on API Gateway (rate limiting, size constraints, managed rules)
- No public endpoints for model serving

**IAM Hardening:**
- Separate roles: training, inference, admin, CI/CD, monitoring
- Resource-level permissions (specific models, endpoints, buckets)
- No `*` in actions or resources for AI services
- Service control policies in Organizations (if multi-account)

**Data Protection:**
- KMS CMK for all AI data (S3, DynamoDB, OpenSearch, CloudWatch)
- TLS 1.2+ enforced on all endpoints
- Macie scanning on training data buckets
- S3 Object Lock for audit trail data (if compliance required)

**Guardrails & Safety:**
- Bedrock Guardrails: content filter (HIGH), PII redaction, topic denial
- Input sanitization in Lambda (before model invocation)
- Output validation in Lambda (after model response)
- Agent action group scope limits

**Audit & Compliance:**
- CloudTrail enabled for all AI services (data events)
- CloudTrail log file validation enabled
- Security Hub enabled with AWS Foundational Security Best Practices
- Config rules for AI resource compliance

**Entregable:** Security stack implemented, tested, compliance-ready.

### S5: Deployment Automation (CI/CD)

Implementa el pipeline de deployment para modelos y aplicaciones AI.

```
Load references:
  Read ${CLAUDE_SKILL_DIR}/references/aws-deployment-patterns.md
```

**Application CI/CD (CodePipeline or GitHub Actions):**
1. Source stage (CodeCommit/GitHub → trigger on push)
2. Build stage (CodeBuild: lint, test, build Lambda/container)
3. Deploy to staging (CloudFormation/CDK deploy)
4. Integration test stage (automated testing against staging)
5. Manual approval gate (optional, configurable)
6. Deploy to production (CloudFormation/CDK deploy)
7. Post-deployment validation (smoke tests)

**Model CI/CD (SageMaker Pipeline + Step Functions):**
1. Training trigger (scheduled, manual, or drift-detected)
2. Training execution (SageMaker training job)
3. Model evaluation (accuracy, fairness, performance gates)
4. Model registration (SageMaker Model Registry, PendingApproval)
5. Approval (manual or automated based on gate results)
6. Blue/Green deployment (create new endpoint, shift traffic)
7. Canary validation (monitor metrics during gradual shift)
8. Promotion or rollback (based on canary metrics)

**Deployment Patterns:**
- Blue/Green for model updates (zero-downtime)
- Canary for risk mitigation (gradual traffic shift)
- Feature flags for capability rollout (AppConfig)
- Shadow deployment for high-stakes validation

**Rollback:**
- Automated rollback on CloudWatch alarm trigger
- One-click manual rollback to previous model version
- Rollback tested as part of deployment pipeline

**Entregable:** CI/CD pipeline operational, deployment tested, rollback verified.

### S6: Monitoring & Cost Controls

Implementa observabilidad completa y controles de costo para AI en AWS.

**CloudWatch Setup:**
- Dashboard: model latency (P50/P95/P99), token usage, error rate, guardrail blocks
- Alarms: latency breach, error rate spike, cost anomaly
- Logs: structured logging from Lambda, API Gateway access logs
- Custom metrics: cost per query, tokens per model, cache hit rate

**X-Ray Tracing:**
- Enable on API Gateway and Lambda
- Custom subsegments for RAG stages (retrieval, generation, validation)
- Trace sampling rate (10% for production, 100% for debug)

**Cost Controls:**
- AWS Budgets per service, per team, per project
- Budget alerts at 50/75/90/100% thresholds
- Cost allocation tags enforced via AWS Organizations tag policy
- Token budget tracking (DynamoDB counter per user/team)
- Cost anomaly detection (AWS Cost Anomaly Detection)

**FinOps Dashboard:**
- Daily cost by model (Bedrock) / endpoint (SageMaker)
- Weekly cost trend and forecast
- Monthly cost vs. budget comparison
- Cost per query/prediction attribution

**Operational Runbooks:**
- Model failure: detect (CloudWatch alarm) → fallback (circuit breaker) → investigate → fix
- Cost overrun: detect (budget alert) → throttle (rate limit) → investigate → optimize
- Drift detected: detect (Model Monitor) → assess severity → retrain or rollback
- Security incident: detect (GuardDuty/Security Hub) → isolate → investigate → remediate

**Entregable:** Full monitoring stack, cost controls, dashboards, runbooks.

---

## Trade-off Matrix

| Decision | Enables | Constrains | When to Use |
|----------|---------|------------|-------------|
| **Bedrock (managed)** | Fast setup, zero-ops inference | Limited model customization | Standard GenAI workloads |
| **SageMaker (custom)** | Full control, any model | Operational complexity | Custom models, specialized needs |
| **CDK** | Type-safe, reusable constructs | Learning curve, TypeScript/Python | Teams with CDK experience |
| **CloudFormation** | AWS-native, stable | Verbose, limited logic | Simple stacks, compliance requirements |
| **Terraform** | Multi-cloud, state management | State file management | Multi-cloud or existing Terraform |
| **Single-account** | Simple, fast setup | Limited isolation | Small teams, dev/staging |
| **Multi-account** | Strong isolation, compliance | Complexity, cross-account IAM | Enterprise, regulated environments |

---

## Assumptions

1. Cuenta AWS con acceso a Bedrock y/o SageMaker en la región target
2. Arquitectura AWS diseñada (output de aws-architecture-design)
3. Equipo con experiencia básica en AWS (IAM, VPC, S3, Lambda)
4. Budget aprobado para servicios AI de AWS
5. Ambiente de IaC configurado (CDK CLI, AWS CLI, credentials)

## Limits

1. NO diseña la arquitectura — implementa un diseño existente (ver **aws-architecture-design**)
2. NO genera IaC completo listo para producción — provee templates y guías conceptuales
3. NO entrena modelos ML — implementa la infraestructura para entrenarlos
4. NO reemplaza el AWS Solutions Architect — guía desde perspectiva AI-first
5. Implementación cloud-agnostic requiere **metodologia-ai-architecture-implementation**

---

## Edge Cases

1. **Región sin Bedrock**: Usar cross-region inference profile. Si compliance impide cross-region, implementar con SageMaker (self-hosted model) como alternativa completa.

2. **Migración desde otro cloud**: Mapear servicios (Vertex AI→Bedrock/SageMaker, Azure OpenAI→Bedrock). Implementar abstraction layer si multi-cloud es requisito futuro. Priorizar data migration (S3) antes de service migration.

3. **Presupuesto mínimo**: Bedrock on-demand (sin upfront), Lambda (pay-per-use), Aurora Serverless v2 con pgvector (si ya existe Aurora). Diferir OpenSearch Serverless hasta que el volumen justifique el costo. Usar batch inference para todo lo que tolere latencia.

4. **Compliance estricto (HIPAA/PCI)**: BAA firmado antes de implementar. VPC-only (no internet). KMS CMK (no AWS-managed). CloudTrail con log file validation. Macie continuous. Implementar compliance evidence collection automatizado.

5. **Equipo sin experiencia AWS**: Extender Fase 1 (Foundation) con workshop AWS. Empezar con Bedrock console (validar concepto) antes de IaC. Usar AWS Well-Architected Labs como guía práctica.

---

## Validation Gate

- [ ] IaC project creado con stacks separados (foundation, data, inference, monitoring)
- [ ] VPC endpoints configurados para todos los servicios AI (no internet egress)
- [ ] KMS CMK aplicado a todos los datos AI (S3, DynamoDB, OpenSearch, logs)
- [ ] IAM roles con least privilege verificado (no `*`)
- [ ] Bedrock Guardrails configurados y testeados (si Bedrock)
- [ ] SageMaker endpoint con auto-scaling y multi-AZ (si SageMaker)
- [ ] WAF en API Gateway con rate limiting y size constraints
- [ ] CloudTrail habilitado con data events para AI services
- [ ] CI/CD pipeline operativo con gates y rollback verificado
- [ ] CloudWatch dashboards y alarms configurados
- [ ] Budget alerts configurados con thresholds apropiados
- [ ] Cost allocation tags aplicados a todos los recursos AI
- [ ] Load test ejecutado con baselines documentados
- [ ] Runbooks documentados para failure scenarios

---

## Cross-References

| Skill | Relación |
|-------|----------|
| `aws-architecture-design` | Proporciona diseño a implementar |
| `aws-architecture-audit` | Audita la implementación resultante |
| `ai-architecture-implementation` | Implementación cloud-agnostic complementaria |
| `ai-software-architecture` | Arquitectura interna del sistema AI |
| `ai-pipeline-architecture` | Diseño de pipelines a implementar en SageMaker/Step Functions |
| `ai-design-patterns` | Patrones a implementar con servicios AWS |
| `ai-testing-strategy` | Testing strategy a implementar en CI/CD gates |
| `genai-architecture` | Diseño GenAI a implementar con Bedrock |
| `infrastructure-architecture` | Infraestructura AWS general |
| `devsecops-architecture` | Security pipeline a implementar |

---

## Output Format Protocol

```
if FORMATO == "ejecutivo":
  Implementation timeline + resource needs + milestones + cost estimate magnitudes
  Audiencia: Project managers, sponsors, budget owners

if FORMATO == "técnico":
  Full 6-section implementation guide + IaC templates + configs
  Audiencia: Cloud engineers, DevOps, ML engineers

if FORMATO == "híbrido":
  Executive timeline + technical deep-dive completo
  Audiencia: Tech leads planning AWS implementation sprints
```

## Output Artifact

```
## {System Name} — AWS AI Implementation Guide

### Architecture Overview
[Target architecture diagram with AWS services]

### Phase 1: Foundation & IaC
[S1: VPC, endpoints, KMS, IAM, tagging, IaC structure]

### Phase 2: AI Services
[S2: Bedrock setup OR S3: SageMaker setup — per VARIANTE]

### Phase 3: Security Hardening
[S4: Network, IAM, data protection, guardrails, audit]

### Phase 4: Deployment Automation
[S5: CI/CD pipeline, Blue/Green, canary, rollback]

### Phase 5: Monitoring & Cost
[S6: CloudWatch, X-Ray, budgets, FinOps, runbooks]

### Implementation Timeline
[Gantt chart with milestones, dependencies, team assignments]

### IaC Templates
[CDK/CloudFormation patterns for each stack]
```

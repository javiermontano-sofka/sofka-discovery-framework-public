# AWS Well-Architected Generative AI Lens — Reference

## Overview

The Generative AI Lens extends the AWS Well-Architected Framework with best practices specific to generative AI workloads. It covers the full lifecycle: scoping, model selection, customization, development, deployment, and continuous improvement.

---

## Pillar 1: Operational Excellence (GENOPS)

### Design Principles
1. **Implement comprehensive observability** — Monitor across all layers: model performance, pipeline health, user feedback
2. **Automate operational management** — IaC for GenAI infra, automated deployment pipelines, standardized templates
3. **Establish operational controls** — Prompt template management, rate limits, workflow tracing

### Focus Areas
| Code | Area | Key Practices |
|------|------|---------------|
| GENOPS01 | Model Performance Evaluation | Ground truth datasets, automated evaluation pipelines, A/B testing |
| GENOPS02 | Operational Health | CloudWatch dashboards, model latency monitoring, error rate tracking |
| GENOPS03 | Observability | Distributed tracing across RAG pipeline, prompt/response logging |
| GENOPS04 | Lifecycle Automation | CI/CD for models, automated retraining triggers, IaC templates |
| GENOPS05 | Model Customization | Fine-tuning decision framework, when to customize vs. prompt engineer |

### AWS Services
- Amazon Bedrock (model evaluation, guardrails)
- Amazon SageMaker (MLOps, model monitoring)
- AWS CloudWatch (metrics, alarms, dashboards)
- AWS CloudFormation / CDK (IaC)
- AWS Step Functions (workflow orchestration)

---

## Pillar 2: Security (GENSEC)

### Design Principles
1. **Implement comprehensive access controls** — Least privilege across models, data stores, endpoints, agents
2. **Secure data and communication flows** — Private networking, input sanitization, prompt catalogs, training data filtering
3. **Monitor and enforce security boundaries** — Control plane + data plane monitoring, guardrails, response filters
4. **Control AI system behaviors** — Response guardrails, secure prompt catalogs, agent behavior boundaries

### Focus Areas
| Code | Area | Key Practices |
|------|------|---------------|
| GENSEC01 | Endpoint Security | VPC endpoints, WAF, API Gateway auth, private model endpoints |
| GENSEC02 | Response Validation | Guardrails for harmful content, PII detection, output filtering |
| GENSEC03 | Event Monitoring | CloudTrail, Security Hub, GuardDuty for GenAI workloads |
| GENSEC04 | Prompt Security | Prompt injection detection, secure prompt catalogs, input sanitization |
| GENSEC05 | Excessive Agency | Agent scope limits, tool whitelisting, human approval gates |
| GENSEC06 | Data Poisoning | Training data validation, provenance tracking, data purification filters |

### AWS Services
- Amazon Bedrock Guardrails (content filtering, topic denial, PII redaction)
- AWS IAM (fine-grained access policies)
- AWS PrivateLink / VPC Endpoints (private connectivity)
- Amazon Macie (PII detection in training data)
- AWS WAF (prompt injection protection at API layer)
- AWS Security Hub + GuardDuty (threat detection)

---

## Pillar 3: Reliability (GENREL)

### Design Principles
1. **Design for distributed resilience** — Multi-AZ/multi-region model endpoints, embedding stores, agents
2. **Implement robust error management** — Automated recovery, cascading failure prevention, agent workflow monitoring
3. **Standardize resource management through catalogs** — Centralized prompt/model catalogs with version control
4. **Architect for intelligent scalability** — Dynamic scaling, load balancing, demand-based resource adjustment

### Focus Areas
| Code | Area | Key Practices |
|------|------|---------------|
| GENREL01 | Throughput Quotas | Token limits, provisioned throughput, request queue management |
| GENREL02 | Network Reliability | Multi-AZ endpoints, health checks, failover routing |
| GENREL03 | Prompt Remediation | Retry mechanisms, fallback strategies, error handling |
| GENREL04 | Prompt Management | Version control, change management, rollback capability |
| GENREL05 | Distributed Availability | Multi-region deployment, cross-region replication |
| GENREL06 | Distributed Compute | Checkpointing, fault-tolerant training, node failure resilience |

### Key Metrics
- Model inference availability (target: 99.9%+)
- Response time consistency (P50, P95, P99)
- RTO / RPO for model serving
- Error rates and recovery success rates

### AWS Services
- Amazon Bedrock (cross-region inference, provisioned throughput)
- Amazon SageMaker (multi-AZ endpoints, auto-scaling)
- Elastic Load Balancing (model endpoint distribution)
- Route 53 (DNS failover, latency-based routing)
- Amazon S3 (cross-region replication for model artifacts)

---

## Pillar 4: Performance Efficiency (GENPERF)

### Design Principles
1. **Measure and validate performance systematically** — Load testing, ground truth datasets, data-driven optimization
2. **Optimize model and vector operations** — Model selection, inference parameters, vector dimensions, quality-compute balance
3. **Leverage managed services for operational efficiency** — Purpose-built services for hosting, customization, inference

### Focus Areas
| Code | Area | Key Practices |
|------|------|---------------|
| GENPERF01 | Performance Evaluation | Benchmark frameworks, latency baselines, throughput testing |
| GENPERF02 | Model Performance | Load testing, parameter tuning, model customization, caching |
| GENPERF03 | High-Performance Compute | GPU instance selection, distributed inference, Inferentia/Trainium |
| GENPERF04 | Vector Store Optimization | Index tuning, query optimization, embedding dimension selection |

### Key Metrics
- Inference latency (P50, P95, P99)
- Throughput (requests/sec)
- Response quality (accuracy, relevance, coherence)
- Resource utilization (CPU, GPU, memory)
- Token generation speed (tokens/sec)

### AWS Services
- Amazon Bedrock (managed inference, model evaluation)
- AWS Inferentia / Trainium (custom AI silicon)
- Amazon SageMaker (real-time/batch/async inference)
- Amazon OpenSearch Serverless (vector search)
- Amazon MemoryDB / ElastiCache (embedding cache)
- Amazon Aurora pgvector (vector search with relational)

---

## Pillar 5: Cost Optimization (GENCOST)

### Design Principles
1. **Optimize model and inference selection** — Right-size models, avoid over-provisioning
2. **Control resource consumption parameters** — Prompt lengths, response sizes, vector dimensions, token usage
3. **Design workflow boundaries** — Stopping conditions, execution monitoring, prevent runaway costs

### Focus Areas
| Code | Area | Key Practices |
|------|------|---------------|
| GENCOST01 | Model Selection | Cost-per-token analysis, smaller models for simple tasks |
| GENCOST02 | Pricing Models | On-demand vs. provisioned throughput, batch inference for non-real-time |
| GENCOST03 | Cost-Aware Prompting | Prompt compression, output token limits, caching strategies |
| GENCOST04 | Vector Store Costs | Dimension optimization, tiered storage, index compression |
| GENCOST05 | Agent Costs | Stopping conditions, tool call limits, workflow budgets |

### Cost Levers
- Model tier selection (Claude Haiku vs. Sonnet vs. Opus, Llama variants)
- Provisioned throughput commitments (30-50% savings)
- Batch inference for non-real-time workloads (50% savings)
- Prompt caching (reduce redundant token processing)
- Semantic caching (serve cached similar queries)
- Vector quantization (reduce storage 2-4x)

### AWS Services
- Amazon Bedrock (model selection, batch inference, provisioned throughput)
- AWS Cost Explorer + Budgets (cost tracking)
- Amazon S3 Intelligent-Tiering (training data cost optimization)
- AWS Lambda (pay-per-use for event-driven GenAI)

---

## Pillar 6: Sustainability (GENSUS)

### Design Principles
1. **Evaluate if GenAI is the right solution** — Simpler alternatives may suffice with less compute
2. **Design for environmental efficiency** — Right-sized models, optimized data ops, efficient customization
3. **Implement dynamic resource optimization** — Auto-scaling, serverless, consume only when needed

### Key Practices
- Use smallest model that meets quality requirements
- Batch processing over real-time where latency permits
- Serverless architectures (Lambda, Bedrock on-demand)
- Graviton instances for supporting infrastructure
- Region selection based on renewable energy availability
- Model distillation to reduce inference compute

### AWS Services
- AWS Graviton (energy-efficient compute)
- AWS Lambda (serverless, zero idle consumption)
- Amazon Bedrock (managed, shared infrastructure)
- AWS Customer Carbon Footprint Tool

---

## Shared Responsibility Model for GenAI

| Responsibility | Model Producer | Provider (AWS) | Consumer (You) |
|---|---|---|---|
| Model training data quality | Primary | Enables | Validates |
| Model security | Primary | Enables + monitors | Configures |
| Inference infrastructure | — | Primary | Configures |
| Application security | — | Enables | Primary |
| Prompt design | — | — | Primary |
| Output validation | — | Enables (guardrails) | Primary |
| Compliance | Supports | Enables | Primary |

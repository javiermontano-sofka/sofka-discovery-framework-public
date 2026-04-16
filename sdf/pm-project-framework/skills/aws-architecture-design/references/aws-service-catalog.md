# AWS Service Catalog for AI/GenAI Workloads

## Foundation Model Services

| Service | Purpose | Pricing Model |
|---|---|---|
| **Amazon Bedrock** | Managed access to FMs (Claude, Llama, Mistral, Titan, Cohere) | Per-token (on-demand) or provisioned throughput |
| **Amazon SageMaker** | Custom model training, hosting, MLOps | Per-instance-hour + storage |
| **Amazon SageMaker JumpStart** | Pre-built ML solutions, fine-tuning notebooks | Same as SageMaker |
| **Amazon Q** | Business AI assistant (Q Business, Q Developer) | Per-user subscription |

## Compute for AI

| Service | Purpose | Best For |
|---|---|---|
| **AWS Trainium (trn1)** | Custom AI training silicon | 50% cost reduction vs. GPU for training |
| **AWS Inferentia2 (inf2)** | Custom AI inference silicon | 40% cost reduction vs. GPU for inference |
| **EC2 P5/P4d** | NVIDIA GPU instances (H100, A100) | Maximum flexibility, complex training |
| **EC2 G5/G6** | NVIDIA GPU instances (A10G, L4) | Cost-effective inference |
| **AWS Lambda** | Serverless compute | Event-driven, lightweight preprocessing |
| **AWS Fargate** | Serverless containers | Custom model serving without server management |
| **Amazon ECS/EKS** | Container orchestration | Complex multi-model deployments |

## Vector & Data Stores

| Service | Type | AI Use Case |
|---|---|---|
| **Amazon OpenSearch Serverless** | Vector search engine | Production RAG, hybrid search (dense + sparse) |
| **Amazon Aurora PostgreSQL (pgvector)** | Relational + vector | RAG when already on PostgreSQL |
| **Amazon MemoryDB for Redis** | In-memory vector + key-value | Low-latency embedding cache, feature serving |
| **Amazon ElastiCache** | In-memory cache | Semantic caching, session state |
| **Amazon Neptune** | Graph database | Knowledge graphs, entity relationships |
| **Amazon DynamoDB** | Key-value / document | Agent session state, metadata, feature store |
| **Amazon S3** | Object storage | Training data, model artifacts, document store |
| **Amazon RDS** | Relational databases | Experiment tracking, model registry metadata |

## Orchestration & Integration

| Service | Purpose | AI Use Case |
|---|---|---|
| **AWS Step Functions** | Workflow orchestration | Multi-step GenAI pipelines, human approval gates |
| **Amazon EventBridge** | Event bus | Trigger retraining, model evaluation events |
| **Amazon SQS** | Message queue | Async inference queue, batch processing |
| **Amazon Kinesis** | Stream processing | Real-time data ingestion for streaming GenAI |
| **AWS AppSync** | GraphQL API + real-time | Streaming GenAI responses to clients |
| **Amazon API Gateway** | REST/WebSocket API | GenAI endpoint exposure, throttling, auth |

## Security & Governance

| Service | Purpose | AI Use Case |
|---|---|---|
| **Amazon Bedrock Guardrails** | Content filtering, PII redaction, topic denial | All production GenAI applications |
| **AWS IAM** | Access control | Fine-grained model and data access |
| **AWS PrivateLink** | Private connectivity | Private model endpoints (no internet) |
| **Amazon Macie** | PII detection | Scan training data for sensitive information |
| **AWS CloudTrail** | Audit logging | Track all model invocations and changes |
| **AWS Security Hub** | Security posture | Centralized security findings |
| **AWS WAF** | Web application firewall | Protect API Gateway from prompt injection |
| **AWS KMS** | Encryption | Model artifact and data encryption |

## Monitoring & Observability

| Service | Purpose | AI Use Case |
|---|---|---|
| **Amazon CloudWatch** | Metrics, logs, alarms | Model latency, error rates, throughput |
| **AWS X-Ray** | Distributed tracing | End-to-end RAG pipeline tracing |
| **Amazon Managed Grafana** | Dashboards | GenAI operational dashboards |
| **Amazon Managed Prometheus** | Metrics collection | Custom model metrics |
| **SageMaker Model Monitor** | Model monitoring | Data drift, model quality, bias detection |

## Cost Management

| Service | Purpose | AI Use Case |
|---|---|---|
| **AWS Cost Explorer** | Cost analysis | GenAI cost tracking by service/model |
| **AWS Budgets** | Cost alerts | Token budget alerts, per-model cost caps |
| **AWS Cost and Usage Report** | Detailed billing | Per-invocation cost attribution |
| **Savings Plans** | Committed use discounts | SageMaker and compute savings |

## Data Processing & ETL

| Service | Purpose | AI Use Case |
|---|---|---|
| **AWS Glue** | ETL service | Data preparation for training, feature engineering |
| **Amazon Athena** | Serverless SQL | Query training data, evaluation results |
| **Amazon EMR** | Big data processing | Large-scale data processing for training |
| **AWS Data Pipeline** | Data orchestration | Scheduled data movement for retraining |

---

## Reference Architecture: Enterprise GenAI on AWS

```
┌─────────────────────────────────────────────────────────┐
│                    Client Layer                          │
│   Web App │ Mobile App │ API Consumer │ Internal Tool    │
└────────────────────────┬────────────────────────────────┘
                         │
┌────────────────────────▼────────────────────────────────┐
│                    API Layer                             │
│   API Gateway (REST/WS) │ CloudFront │ WAF │ Cognito    │
└────────────────────────┬────────────────────────────────┘
                         │
┌────────────────────────▼────────────────────────────────┐
│                  Application Layer                       │
│   Lambda / ECS │ Step Functions │ AppSync                │
│   Router │ Orchestrator │ Guardrails │ Cache             │
└───────┬────────────┬──────────────┬─────────────────────┘
        │            │              │
┌───────▼──────┐ ┌───▼────────┐ ┌──▼──────────────────────┐
│  FM Layer    │ │  RAG Layer │ │  Agent Layer            │
│  Bedrock     │ │  OpenSearch│ │  Bedrock Agents         │
│  SageMaker   │ │  pgvector  │ │  Action Groups (Lambda) │
│  Inferentia  │ │  S3 (docs) │ │  Knowledge Bases        │
└──────────────┘ └────────────┘ └─────────────────────────┘
                         │
┌────────────────────────▼────────────────────────────────┐
│                  Data Layer                              │
│   S3 (lake) │ DynamoDB │ RDS │ Neptune │ Redshift       │
└─────────────────────────────────────────────────────────┘
                         │
┌────────────────────────▼────────────────────────────────┐
│               Observability & Security                   │
│   CloudWatch │ X-Ray │ CloudTrail │ Security Hub │ IAM   │
│   Bedrock Guardrails │ Macie │ KMS │ PrivateLink        │
└─────────────────────────────────────────────────────────┘
```

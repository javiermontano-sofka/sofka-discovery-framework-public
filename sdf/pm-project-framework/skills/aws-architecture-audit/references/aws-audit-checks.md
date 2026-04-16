# AWS AI Architecture Audit Checks

## Well-Architected GenAI Lens Audit

### GENOPS — Operational Excellence

| Check ID | Check | How to Verify | Severity |
|----------|-------|--------------|----------|
| GENOPS-01 | Model evaluation pipeline exists | Check for SageMaker Model Monitor, Bedrock Model Evaluation, or custom | HIGH |
| GENOPS-02 | Prompt templates version-controlled | Check S3 versioning, CodeCommit, or external VCS for prompts | MEDIUM |
| GENOPS-03 | CloudWatch dashboards for GenAI metrics | Check for model latency, token usage, error rate dashboards | HIGH |
| GENOPS-04 | IaC for GenAI infrastructure | Check CloudFormation, CDK, or Terraform for Bedrock/SageMaker resources | MEDIUM |
| GENOPS-05 | Distributed tracing across RAG pipeline | Check X-Ray configuration, trace segments for each pipeline stage | MEDIUM |
| GENOPS-06 | Automated retraining pipeline exists | Check Step Functions, SageMaker Pipelines for retraining triggers | LOW |
| GENOPS-07 | Incident runbooks for AI-specific failures | Check documentation for model failure, drift, data quality incidents | MEDIUM |

### GENSEC — Security

| Check ID | Check | How to Verify | Severity |
|----------|-------|--------------|----------|
| GENSEC-01 | Bedrock Guardrails configured | AWS Console → Bedrock → Guardrails | CRITICAL |
| GENSEC-02 | VPC endpoints for Bedrock/SageMaker | Check VPC endpoint configuration, no public internet calls | HIGH |
| GENSEC-03 | IAM least privilege for model access | Review IAM policies for bedrock:InvokeModel, sagemaker:InvokeEndpoint | CRITICAL |
| GENSEC-04 | WAF rules for API Gateway | Check WAF web ACL attached to API Gateway, prompt injection rules | HIGH |
| GENSEC-05 | KMS CMK for model artifacts | Check S3 encryption, SageMaker encryption configuration | HIGH |
| GENSEC-06 | CloudTrail logging all model invocations | Check CloudTrail for Bedrock/SageMaker data events | CRITICAL |
| GENSEC-07 | Macie scanning training data for PII | Check Macie jobs on S3 buckets containing training data | HIGH |
| GENSEC-08 | Cognito/IAM auth on API Gateway | Check API Gateway authorizers configured | CRITICAL |
| GENSEC-09 | Security Hub findings reviewed | Check Security Hub for AI-related findings | MEDIUM |
| GENSEC-10 | Agent action groups use least privilege | Check Lambda IAM roles for Bedrock Agent action groups | HIGH |

### GENREL — Reliability

| Check ID | Check | How to Verify | Severity |
|----------|-------|--------------|----------|
| GENREL-01 | Multi-AZ deployment for model endpoints | Check SageMaker endpoint AZ configuration | HIGH |
| GENREL-02 | Cross-region inference profile (if required) | Check Bedrock cross-region inference configuration | MEDIUM |
| GENREL-03 | Fallback model configured | Check routing logic for model unavailability | HIGH |
| GENREL-04 | SQS dead-letter queue for failed inferences | Check SQS DLQ on async inference queues | MEDIUM |
| GENREL-05 | Auto-scaling configured for SageMaker endpoints | Check scaling policies, target tracking | HIGH |
| GENREL-06 | Health checks on model endpoints | Check Route 53 health checks, ALB health checks | HIGH |
| GENREL-07 | Provisioned throughput for critical workloads | Check Bedrock provisioned throughput configuration | MEDIUM |
| GENREL-08 | S3 cross-region replication for model artifacts | Check S3 CRR on model artifact buckets | LOW |

### GENPERF — Performance

| Check ID | Check | How to Verify | Severity |
|----------|-------|--------------|----------|
| GENPERF-01 | Inference latency within SLA | CloudWatch metrics: ModelLatency, InvocationLatency | HIGH |
| GENPERF-02 | Instance type appropriate for workload | Check SageMaker instance types (Inferentia2, GPU, CPU) | MEDIUM |
| GENPERF-03 | Caching layer for repeated queries | Check ElastiCache/MemoryDB for semantic caching | MEDIUM |
| GENPERF-04 | Vector store index optimized | Check OpenSearch/pgvector index configuration, query latency | MEDIUM |
| GENPERF-05 | Bedrock provisioned vs on-demand appropriate | Check throughput patterns vs. pricing model | MEDIUM |
| GENPERF-06 | Lambda concurrency configured | Check provisioned concurrency for AI Lambda functions | MEDIUM |

### GENCOST — Cost Optimization

| Check ID | Check | How to Verify | Severity |
|----------|-------|--------------|----------|
| GENCOST-01 | Model tiering implemented | Check if different models used for different query complexity | HIGH |
| GENCOST-02 | Batch inference for non-real-time | Check Bedrock batch inference, SageMaker batch transform usage | HIGH |
| GENCOST-03 | Cost tagging on AI resources | Check AWS tags on Bedrock, SageMaker, OpenSearch resources | MEDIUM |
| GENCOST-04 | Budget alerts configured | Check AWS Budgets for AI service alerts | HIGH |
| GENCOST-05 | No always-on SageMaker endpoints for sporadic traffic | Check endpoint utilization, consider serverless inference | HIGH |
| GENCOST-06 | Savings Plans for committed usage | Check SageMaker Savings Plans if applicable | MEDIUM |
| GENCOST-07 | Token usage tracked per user/team | Check custom CloudWatch metrics for token attribution | MEDIUM |
| GENCOST-08 | Prompt optimization applied | Check prompt lengths, system prompt efficiency | LOW |

### GENSUS — Sustainability

| Check ID | Check | How to Verify | Severity |
|----------|-------|--------------|----------|
| GENSUS-01 | Smallest viable model selected | Verify model selection justification | LOW |
| GENSUS-02 | Graviton instances for supporting infra | Check EC2/Lambda architecture (arm64) | LOW |
| GENSUS-03 | Serverless where possible | Check Lambda/Fargate usage vs. always-on EC2 | LOW |

---

## AWS Config Rules for AI

| Rule | Description |
|------|-------------|
| `sagemaker-endpoint-config-kms-key-configured` | SageMaker endpoint encrypted with KMS |
| `sagemaker-notebook-no-direct-internet-access` | SageMaker notebooks in VPC |
| `s3-bucket-server-side-encryption-enabled` | Training data buckets encrypted |
| `cloudtrail-enabled` | CloudTrail active for API logging |
| `vpc-flow-logs-enabled` | VPC flow logs for network monitoring |
| `iam-no-inline-policy-check` | No inline policies (use managed policies) |

## Automated Audit Tools

| Tool | Purpose |
|------|---------|
| AWS Trusted Advisor | Cost optimization, security, fault tolerance |
| AWS Well-Architected Tool | Workload review against framework |
| AWS Security Hub | Centralized security findings |
| AWS Cost Explorer | Cost analysis and optimization |
| AWS Config | Resource compliance checking |
| Amazon Inspector | Vulnerability assessment |
| Amazon Macie | Data classification, PII detection |

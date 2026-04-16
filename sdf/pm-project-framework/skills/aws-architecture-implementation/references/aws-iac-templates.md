# AWS AI Infrastructure as Code — Template Reference

## CDK Construct Patterns for AI

### Pattern 1: Bedrock RAG Stack
```
Components:
  - S3 Bucket (document store, KMS encrypted)
  - Bedrock Knowledge Base (connected to S3)
  - OpenSearch Serverless Collection (vector search)
  - Lambda Function (query handler)
  - API Gateway (REST endpoint, Cognito auth)
  - Bedrock Guardrails (input/output filtering)
  - CloudWatch Dashboard (latency, tokens, errors)
  - IAM Roles (least privilege per component)
```

### Pattern 2: SageMaker MLOps Stack
```
Components:
  - S3 Buckets (training data, model artifacts)
  - SageMaker Pipeline (training → evaluation → registration)
  - SageMaker Model Registry
  - SageMaker Endpoint (with auto-scaling)
  - SageMaker Model Monitor (data quality, model quality)
  - Step Functions (orchestration, approval gates)
  - CodePipeline (CI/CD for model deployment)
  - CloudWatch Alarms (latency, errors, drift)
  - IAM Roles (separate for training, inference, admin)
```

### Pattern 3: GenAI Agent Stack
```
Components:
  - Bedrock Agent (with instruction and model)
  - Action Groups (Lambda functions, least privilege)
  - Knowledge Base (S3 + OpenSearch Serverless)
  - Bedrock Guardrails (content filter, PII, topic denial)
  - DynamoDB Table (session state, TTL enabled)
  - API Gateway WebSocket (streaming responses)
  - CloudWatch Dashboard (agent metrics)
  - WAF Web ACL (prompt injection protection)
```

### Pattern 4: Multi-Model Routing Stack
```
Components:
  - API Gateway (REST, throttling per tier)
  - Lambda Router (complexity classification)
  - Bedrock (Haiku for simple, Sonnet for standard, Opus for complex)
  - ElastiCache Redis (semantic cache)
  - DynamoDB (cost tracking per user/team)
  - CloudWatch (per-model metrics, cost attribution)
  - AWS Budgets (per-model alerts)
```

---

## IaC Best Practices for AI on AWS

### Tagging Strategy
```yaml
Tags:
  Project: {project-name}
  Environment: {dev|staging|prod}
  Service: {bedrock|sagemaker|opensearch}
  Team: {team-name}
  CostCenter: {cc-code}
  DataClassification: {public|internal|confidential|restricted}
  Compliance: {hipaa|pci|sox|none}
```

### Environment Promotion
```
dev (IaC) → staging (IaC + integration tests) → prod (IaC + approval gate)
```
- Same CDK/CloudFormation template across environments
- Environment-specific parameters (instance sizes, throughput, model selection)
- Approval gate via Step Functions or CodePipeline manual approval

### Drift Detection
- CloudFormation drift detection scheduled (weekly)
- AWS Config rules for compliance
- Custom Lambda for AI-specific config validation

---

## Service Configuration Reference

### Bedrock Configuration
```yaml
Guardrails:
  ContentFilter:
    InputStrength: HIGH
    OutputStrength: HIGH
  PiiRedaction:
    Enabled: true
    RedactionType: MASK
  TopicDenial:
    - Name: "off-topic"
      Definition: "Topics outside system scope"
      Action: DENY
  WordFilter:
    ManagedWordLists: [PROFANITY]

ModelInvocation:
  MaxTokens: 4096
  Temperature: 0.7
  StopSequences: ["Human:", "---"]
```

### SageMaker Endpoint Configuration
```yaml
Endpoint:
  InstanceType: ml.g5.xlarge  # or ml.inf2.xlarge for Inferentia
  MinInstanceCount: 2  # Multi-AZ
  MaxInstanceCount: 10
  ScalingPolicy:
    Type: TargetTracking
    TargetValue: 70  # InvocationsPerInstance
    ScaleInCooldown: 300
    ScaleOutCooldown: 60
  DataCaptureConfig:
    EnableCapture: true
    SamplingPercentage: 10
    CaptureContentTypeHeader: ["application/json"]
```

### OpenSearch Serverless Configuration
```yaml
Collection:
  Type: VECTORSEARCH
  StandbyReplicas: ENABLED  # Multi-AZ
  EncryptionPolicy:
    KmsKeyId: alias/ai-encryption-key
  NetworkPolicy:
    AllowFromVpc: true
    AllowFromPublic: false
  AccessPolicy:
    Principals: ["arn:aws:iam::ACCOUNT:role/BedKBRole"]
  IndexMapping:
    Settings:
      index.knn: true
      index.knn.algo_param.ef_search: 512
    Mappings:
      properties:
        embedding:
          type: knn_vector
          dimension: 1536
          method:
            engine: faiss
            space_type: l2
            name: hnsw
```

### CloudWatch Dashboard Widgets
```yaml
AIOperationsDashboard:
  Widgets:
    - ModelLatency (P50, P95, P99 per model)
    - TokenUsage (input/output per model per hour)
    - ErrorRate (4xx, 5xx per endpoint)
    - InvocationCount (per model per hour)
    - CostPerModel (daily cost estimate)
    - DriftScore (data drift, prediction drift)
    - GuardrailBlocks (input/output blocks per hour)
    - CacheHitRate (semantic cache efficiency)
```

---

## Security Configuration Templates

### VPC Endpoint Configuration
```yaml
VPCEndpoints:
  - Service: com.amazonaws.{region}.bedrock-runtime
    Type: Interface
    SubnetIds: [private-subnet-1, private-subnet-2]
    SecurityGroupIds: [sg-bedrock-endpoint]
  - Service: com.amazonaws.{region}.sagemaker.runtime
    Type: Interface
    SubnetIds: [private-subnet-1, private-subnet-2]
  - Service: com.amazonaws.{region}.s3
    Type: Gateway
    RouteTableIds: [rt-private]
  - Service: com.amazonaws.{region}.dynamodb
    Type: Gateway
    RouteTableIds: [rt-private]
```

### WAF Configuration for GenAI
```yaml
WebACL:
  Rules:
    - Name: RateLimit
      Priority: 1
      Action: BLOCK
      Statement:
        RateBasedStatement:
          Limit: 1000
          AggregateKeyType: IP
    - Name: PromptInjectionSize
      Priority: 2
      Action: BLOCK
      Statement:
        SizeConstraintStatement:
          FieldToMatch: Body
          ComparisonOperator: GT
          Size: 10000  # Block oversized prompts
    - Name: AWSManagedRules
      Priority: 3
      Statement:
        ManagedRuleGroupStatement:
          VendorName: AWS
          Name: AWSManagedRulesCommonRuleSet
```

# AWS AI Service Setup Guide

## Bedrock Setup

### Step 1: Model Access
1. Enable model access in Bedrock console (per-model opt-in)
2. Request access for gated models (Claude, Llama)
3. Verify model availability in target region

### Step 2: Guardrails
1. Create guardrail with content filtering (input + output)
2. Configure PII detection and redaction
3. Add topic denial policies for out-of-scope queries
4. Configure word filters (managed + custom)
5. Test guardrail with known-good and known-bad inputs
6. Associate guardrail with model invocations

### Step 3: Knowledge Base (RAG)
1. Create S3 bucket for documents (KMS encrypted)
2. Create OpenSearch Serverless collection (vector search type)
3. Create Bedrock Knowledge Base
4. Configure data source (S3 → KB)
5. Select embedding model (Titan Embeddings v2)
6. Configure chunking strategy (fixed/semantic/hierarchical)
7. Sync data source
8. Test retrieval quality

### Step 4: Agents
1. Create agent with instruction
2. Configure model (Claude Sonnet recommended for agents)
3. Create action groups (Lambda functions)
4. Configure IAM roles (least privilege per action group)
5. Associate knowledge bases
6. Associate guardrails
7. Create agent alias for versioning
8. Test agent with representative queries

### Step 5: Monitoring
1. Enable CloudWatch metrics for Bedrock
2. Create dashboard (latency, tokens, errors, guardrail blocks)
3. Set CloudWatch alarms (error rate, latency thresholds)
4. Enable CloudTrail for Bedrock data events

---

## SageMaker Setup

### Step 1: Networking
1. Create VPC with private subnets (multi-AZ)
2. Create VPC endpoints (SageMaker API, runtime, S3, ECR)
3. Configure security groups (restrictive, no public access)
4. Enable VPC flow logs

### Step 2: Training
1. Create S3 buckets (training data, model artifacts) with KMS
2. Create IAM role for training (S3 read data, write artifacts, ECR pull)
3. Configure SageMaker Pipeline for training workflow
4. Set up experiment tracking (SageMaker Experiments)
5. Configure hyperparameter tuning jobs
6. Test training pipeline end-to-end

### Step 3: Model Registry
1. Create model package group
2. Define model approval workflow
3. Configure model metadata requirements
4. Set up automated model evaluation

### Step 4: Inference
1. Create model from registry
2. Create endpoint configuration (instance type, auto-scaling)
3. Deploy endpoint (minimum 2 instances for Multi-AZ)
4. Configure auto-scaling policy (target tracking)
5. Enable data capture for monitoring
6. Configure model monitor (data quality, model quality, bias)
7. Load test endpoint

### Step 5: CI/CD
1. Create CodePipeline for model deployment
2. Configure approval stage (manual or automated)
3. Implement Blue/Green deployment
4. Test rollback procedure
5. Configure CloudWatch alarms as deployment gates

---

## OpenSearch Serverless Setup (Vector Search)

### Step 1: Collection
1. Create encryption policy (KMS CMK)
2. Create network policy (VPC access only)
3. Create data access policy (IAM principals)
4. Create collection (type: VECTORSEARCH)
5. Enable standby replicas (multi-AZ)

### Step 2: Index
1. Create index with knn_vector mapping
2. Configure HNSW parameters (ef_search, ef_construction, m)
3. Set dimension matching embedding model
4. Configure metadata fields for filtering

### Step 3: Integration
1. Create IAM role for Bedrock KB / application
2. Configure VPC endpoint for application access
3. Test indexing pipeline (documents → embeddings → index)
4. Test search quality (precision, recall, latency)
5. Set up index monitoring (CloudWatch)

---

## API Gateway + Lambda Setup (GenAI API)

### Step 1: Lambda
1. Create Lambda function (Python runtime)
2. Configure VPC (private subnets, security group)
3. Set IAM role (Bedrock invoke, DynamoDB, CloudWatch)
4. Configure environment variables (model ID, guardrail ID)
5. Set memory and timeout (512MB-3GB, 30-60s for GenAI)
6. Configure provisioned concurrency (if cold start critical)

### Step 2: API Gateway
1. Create REST API or HTTP API
2. Configure Cognito or IAM authorizer
3. Create resource and method (POST /chat, POST /query)
4. Enable request validation
5. Configure throttling (per-method, per-client)
6. Deploy to stage (dev, prod)

### Step 3: WAF
1. Create web ACL
2. Add rate limiting rule
3. Add size constraint rule (prevent oversized prompts)
4. Add AWS managed rule groups (common rules)
5. Associate web ACL with API Gateway
6. Test with known attack patterns

### Step 4: Monitoring
1. Enable API Gateway access logging
2. Enable X-Ray tracing
3. Create CloudWatch dashboard (request count, latency, errors)
4. Set CloudWatch alarms (4xx rate, 5xx rate, latency P99)

---

## Cost Controls Setup

### Step 1: Tagging
1. Define tag policy in AWS Organizations
2. Apply tags to all AI resources (Project, Service, Team, Environment)
3. Enable cost allocation tags in Billing console

### Step 2: Budgets
1. Create budget per AI service (Bedrock, SageMaker, OpenSearch)
2. Create budget per team/project (using tags)
3. Configure alerts at 50%, 75%, 90%, 100%
4. Set up SNS topics for budget notifications

### Step 3: Cost Visibility
1. Enable Cost & Usage Report (CUR) with hourly granularity
2. Create Cost Explorer saved views (by service, by model, by team)
3. Set up QuickSight dashboard for AI cost visualization (optional)

### Step 4: Cost Controls
1. Configure Lambda concurrency limits
2. Set API Gateway throttling
3. Implement token budget tracking (DynamoDB + Lambda)
4. Configure SageMaker auto-scaling with max instances
5. Set Bedrock provisioned throughput (if committed usage)

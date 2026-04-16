# AWS GenAI Architectural Patterns & Service Mappings

## Pattern 1: RAG on AWS

### Architecture
```
User → API Gateway → Lambda/ECS → Amazon Bedrock (embeddings)
                                  → Amazon OpenSearch / Aurora pgvector (vector search)
                                  → Amazon Bedrock (generation)
                                  → Amazon S3 (document store)
```

### Service Options
| Component | AWS Service | Alternative |
|---|---|---|
| Embedding | Amazon Bedrock (Titan Embeddings, Cohere) | SageMaker endpoint |
| Vector Store | Amazon OpenSearch Serverless | Aurora pgvector, MemoryDB |
| Generation | Amazon Bedrock (Claude, Llama, Mistral) | SageMaker endpoint |
| Document Store | Amazon S3 | — |
| Orchestration | AWS Step Functions | Lambda chains |
| Knowledge Base | Amazon Bedrock Knowledge Bases | Custom RAG pipeline |
| API Layer | API Gateway + Lambda | ALB + ECS/Fargate |

### Key Decisions
- **Bedrock Knowledge Bases** (managed RAG) vs. **custom RAG pipeline** (full control)
- **OpenSearch Serverless** (zero-ops vector search) vs. **Aurora pgvector** (if already on PostgreSQL)
- **Chunking strategy**: Bedrock KB supports fixed-size, semantic, hierarchical
- **Hybrid search**: OpenSearch supports dense + sparse natively

---

## Pattern 2: Fine-Tuning on AWS

### Architecture
```
Training Data (S3) → SageMaker Training Job → Model Artifacts (S3) → SageMaker Endpoint / Bedrock Custom Model
```

### Service Options
| Approach | Service | When to Use |
|---|---|---|
| Bedrock Fine-Tuning | Amazon Bedrock | Simple fine-tuning, Titan/Llama models |
| Continued Pre-Training | Amazon Bedrock | Domain adaptation with large corpus |
| SageMaker Training | Amazon SageMaker | Full control, custom architectures, distributed training |
| SageMaker JumpStart | Amazon SageMaker | Pre-built fine-tuning notebooks for popular models |

### Key Decisions
- Fine-tune vs. RAG vs. prompt engineering (cost/quality trade-off)
- Full fine-tune vs. LoRA/QLoRA (parameter-efficient)
- Training instance type (ml.p4d.24xlarge, ml.p5.48xlarge, ml.trn1.32xlarge)
- Trainium vs. GPU instances (Trainium: 50% cost reduction for training)

---

## Pattern 3: Agentic Workflows on AWS

### Architecture
```
User → API Gateway → Lambda → Amazon Bedrock Agents
                              → Action Groups (Lambda functions)
                              → Knowledge Bases (RAG retrieval)
                              → Guardrails (safety)
```

### Service Options
| Component | AWS Service | Alternative |
|---|---|---|
| Agent Runtime | Amazon Bedrock Agents | LangChain on ECS/Lambda |
| Tool Execution | Lambda (action groups) | ECS tasks, Step Functions |
| Knowledge | Bedrock Knowledge Bases | Custom RAG |
| Guardrails | Bedrock Guardrails | Custom validation Lambda |
| Memory | DynamoDB (session state) | ElastiCache |
| Orchestration | Step Functions | Bedrock agent multi-step |

### Key Decisions
- **Bedrock Agents** (managed, declarative) vs. **custom agents** (LangChain/LlamaIndex on compute)
- **Action group scope**: Least privilege per Lambda function
- **Stopping conditions**: Max iterations, token budget, time limit
- **Human-in-the-loop**: Step Functions wait states for approval

---

## Pattern 4: Multi-Model Routing on AWS

### Architecture
```
User → API Gateway → Router Lambda → Model A (Bedrock - Claude Haiku) [simple queries]
                                    → Model B (Bedrock - Claude Sonnet) [standard queries]
                                    → Model C (SageMaker - Custom) [domain-specific]
                                    → Cache (ElastiCache) [repeated queries]
```

### Routing Strategy
1. **Complexity classifier** (lightweight model or rules) determines query tier
2. **Cost-aware routing**: Budget per user/session/organization
3. **Fallback cascade**: Primary → Secondary → Cache → Graceful degradation
4. **Provisioned throughput** for high-priority tiers, on-demand for low-priority

---

## Pattern 5: Streaming & Real-Time GenAI

### Architecture
```
Events → Kinesis Data Streams → Lambda → Bedrock (streaming API) → WebSocket API Gateway → Client
```

### Service Options
| Component | AWS Service |
|---|---|
| Event Ingestion | Kinesis Data Streams, SQS |
| Processing | Lambda, ECS |
| Streaming Inference | Bedrock InvokeModelWithResponseStream |
| Client Delivery | API Gateway WebSocket, AppSync |
| Session State | DynamoDB, ElastiCache |

---

## Pattern 6: Batch Processing GenAI

### Architecture
```
Data (S3) → Step Functions → SageMaker Batch Transform / Bedrock Batch Inference → Results (S3) → Athena/QuickSight
```

### Key Benefits
- 50% cost reduction vs. real-time inference (Bedrock batch pricing)
- Process millions of records overnight
- No infrastructure management

---

## AWS Service Decision Matrix

| Need | Primary Service | When to Choose |
|---|---|---|
| Managed FM access | Amazon Bedrock | Default for most GenAI workloads |
| Custom model training | Amazon SageMaker | Full control, custom architectures |
| Managed RAG | Bedrock Knowledge Bases | Quick RAG setup, standard patterns |
| Custom RAG | OpenSearch + Lambda + Bedrock | Complex retrieval, hybrid search |
| Vector search | OpenSearch Serverless | Dedicated vector workloads |
| Vector + relational | Aurora pgvector | Already on PostgreSQL |
| Embedding cache | MemoryDB / ElastiCache | Low-latency embedding lookup |
| Agent orchestration | Bedrock Agents | Declarative agents with tools |
| Complex workflows | Step Functions + Bedrock | Multi-step, human-in-the-loop |
| Cost-optimized inference | Inferentia2 / Trainium | High-volume, latency-tolerant |
| Content safety | Bedrock Guardrails | All production GenAI apps |
| Model evaluation | Bedrock Model Evaluation | A/B testing, benchmarking |
| AI silicon (training) | Trainium (trn1) | 50% cost reduction vs. GPU |
| AI silicon (inference) | Inferentia2 (inf2) | 40% cost reduction vs. GPU |

---

## Anti-Patterns on AWS

| Anti-Pattern | Description | Fix |
|---|---|---|
| **GPU-only mindset** | Using expensive GPU instances when Inferentia/Trainium suffice | Evaluate AI silicon for inference and training |
| **Always-on endpoints** | Running SageMaker endpoints 24/7 for sporadic traffic | Serverless inference, Bedrock on-demand, auto-scaling to 0 |
| **Single-region GenAI** | All inference in one region | Multi-region Bedrock, cross-region inference profiles |
| **No guardrails** | Deploying without content filtering | Bedrock Guardrails from day one |
| **Over-provisioned models** | Using Opus/GPT-4 for simple classification | Model tiering, use Haiku/Mini for simple tasks |
| **Unbounded agents** | Agents without stopping conditions or tool limits | Max iterations, token budgets, tool whitelists |
| **No semantic caching** | Every query hits the model | ElastiCache semantic similarity cache |
| **Ignoring batch pricing** | Real-time inference for batch workloads | Bedrock batch inference (50% savings) |

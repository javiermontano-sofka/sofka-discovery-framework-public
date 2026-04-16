# AI Technology Selection Guide

## ML Frameworks

| Framework | Strengths | Best For | Ecosystem |
|-----------|----------|----------|-----------|
| **PyTorch** | Research-friendly, dynamic graphs, massive community | R&D, custom architectures, NLP/CV | HuggingFace, Lightning, torchserve |
| **TensorFlow** | Production-grade, TFX ecosystem, TPU support | Enterprise production, mobile (TFLite) | TFX, TF Serving, TF Lite, Keras |
| **scikit-learn** | Simple, fast, great docs | Tabular ML, prototyping, baselines | pandas, numpy, joblib |
| **JAX** | High performance, functional, XLA | Research, TPU-heavy, numerical compute | Flax, Haiku, Optax |
| **XGBoost/LightGBM** | Tabular SOTA, fast training | Structured data, competitions, production ML | scikit-learn compatible |

## LLM Orchestration Frameworks

| Framework | Strengths | Best For |
|-----------|----------|----------|
| **LangChain** | Largest ecosystem, LCEL, extensive integrations | Rapid prototyping, diverse use cases |
| **LlamaIndex** | Best RAG framework, data connectors, indexing | RAG-heavy applications |
| **Haystack** | Production-grade pipelines, modular | Enterprise RAG, document processing |
| **Semantic Kernel** | Microsoft ecosystem, .NET/Python, Copilot patterns | Enterprise Microsoft stack |
| **CrewAI** | Multi-agent, role-based agents | Agentic workflows |
| **AutoGen** | Multi-agent conversations, research | Research, complex agent interactions |

## Pipeline Orchestration

| Tool | Type | Best For |
|------|------|----------|
| **Apache Airflow** | DAG orchestrator | General ML pipelines, scheduled workflows |
| **Dagster** | Software-defined assets | Data-aware orchestration, asset lineage |
| **Prefect** | Dynamic workflows | Event-driven pipelines, modern Python |
| **Kubeflow Pipelines** | K8s-native ML | Full MLOps on Kubernetes |
| **SageMaker Pipelines** | AWS-managed | AWS-native MLOps |
| **Vertex AI Pipelines** | GCP-managed | GCP-native MLOps |
| **MLflow Pipelines** | ML-specific | Lightweight ML pipeline structure |

## Model Serving

| Framework | Type | Best For |
|-----------|------|----------|
| **vLLM** | LLM serving | High-throughput LLM inference, PagedAttention |
| **TGI (Text Gen Inference)** | LLM serving | HuggingFace models, enterprise LLM serving |
| **Triton Inference Server** | Multi-framework | Multi-model, multi-framework serving |
| **TorchServe** | PyTorch serving | PyTorch models, simple deployment |
| **TF Serving** | TensorFlow serving | TensorFlow models, gRPC/REST |
| **Seldon Core** | K8s ML serving | K8s-native, A/B testing, canary |
| **BentoML** | Packaging + serving | Model packaging, multi-framework |
| **Ray Serve** | Scalable serving | Multi-model composition, scaling |

## Vector Databases

| Database | Type | Best For |
|----------|------|----------|
| **Pinecone** | Managed SaaS | Fastest setup, serverless, production |
| **Qdrant** | Open source / Cloud | Self-hosted flexibility, rich filtering |
| **Weaviate** | Open source / Cloud | Multi-modal, built-in vectorization |
| **Chroma** | Open source | Development, prototyping, lightweight |
| **pgvector** | PostgreSQL extension | Already on PostgreSQL, unified stack |
| **OpenSearch** | AWS-managed | Hybrid search (vector + keyword), AWS native |
| **Milvus** | Open source | Large-scale, distributed, GPU-accelerated |

## Experiment Tracking

| Tool | Type | Best For |
|------|------|----------|
| **MLflow** | Open source | Full MLOps, model registry, artifacts |
| **Weights & Biases** | SaaS | Rich visualization, team collaboration |
| **Neptune.ai** | SaaS | Metadata store, experiment comparison |
| **DVC** | Open source | Data versioning, Git-based ML |
| **SageMaker Experiments** | AWS-managed | AWS-native experiment tracking |

## Data Quality & Monitoring

| Tool | Focus | Best For |
|------|-------|----------|
| **Great Expectations** | Data validation | Schema, distribution, custom expectations |
| **Evidently AI** | ML monitoring | Drift detection, model quality, reports |
| **WhyLabs** | ML observability | Production monitoring, profiling |
| **NannyML** | Performance estimation | Monitoring without labels |
| **Deepchecks** | ML testing | Training-time and production validation |
| **Pandera** | DataFrame validation | Lightweight schema validation |

## Selection Decision Framework

### Step 1: Constraints
- Cloud provider mandate (AWS, GCP, Azure, multi-cloud)?
- Kubernetes available?
- Team expertise?
- Budget (open source vs. managed)?
- Regulatory requirements (data residency, audit)?

### Step 2: Workload Type
- Traditional ML (tabular/structured) → scikit-learn/XGBoost + Airflow + MLflow
- Deep Learning (CV/NLP) → PyTorch + Kubeflow + MLflow + Triton
- LLM Application → LangChain/LlamaIndex + vLLM/Bedrock + Vector DB
- Agentic AI → LangChain/CrewAI + Tool framework + Guardrails

### Step 3: Scale
- Prototype → Chroma + local + notebooks
- Production single model → MLflow + single serving framework
- Production multi-model → Feature Store + Model Registry + Triton/Seldon
- Enterprise → Full MLOps platform (SageMaker, Vertex, Kubeflow)

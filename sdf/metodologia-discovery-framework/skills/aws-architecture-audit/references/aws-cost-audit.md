# AWS AI Cost Audit Reference

## Cost Waste Detection Matrix

### Bedrock Cost Waste
| Waste Pattern | Detection | Fix | Savings Potential |
|---------------|-----------|-----|-------------------|
| Using Opus/Sonnet for simple classification | Token usage logs per model | Route to Haiku for simple queries | 60-90% per query |
| No batch inference for offline workloads | Check real-time vs. batch ratio | Move offline to Bedrock batch | 50% |
| No prompt caching | Check repeated prompt patterns | Enable Bedrock prompt caching | 20-40% |
| Unbounded agent loops | Check average agent iterations | Set max iterations + token budget | Variable |
| No semantic caching | Every query hits model | Add ElastiCache semantic cache | 20-40% |

### SageMaker Cost Waste
| Waste Pattern | Detection | Fix | Savings Potential |
|---------------|-----------|-----|-------------------|
| Always-on endpoints for sporadic traffic | Check invocations/hour pattern | Serverless inference or auto-scaling to 0 | 50-90% |
| GPU instances for CPU-compatible workload | Check GPU utilization | Switch to CPU or Inferentia | 40-70% |
| No Savings Plans for steady-state | Check usage consistency | Commit to Savings Plans | 30-50% |
| Over-provisioned instance type | Check memory/GPU utilization | Right-size instance | 20-50% |
| Idle training instances | Check training job patterns | Use spot instances, managed warm pools | 50-70% |
| Notebook instances running 24/7 | Check notebook activity | Auto-stop lifecycle config | 60-80% |

### OpenSearch/Vector Store Cost Waste
| Waste Pattern | Detection | Fix | Savings Potential |
|---------------|-----------|-----|-------------------|
| Over-provisioned OCUs (Serverless) | Check OCU utilization | Adjust min/max OCUs | 20-40% |
| No vector quantization | Check index size vs. query volume | Enable binary/scalar quantization | 50-75% storage |
| Full re-indexing when incremental possible | Check indexing patterns | Implement incremental updates | Variable |

### Compute Cost Waste
| Waste Pattern | Detection | Fix | Savings Potential |
|---------------|-----------|-----|-------------------|
| GPU when Inferentia2 would work | Check model compatibility | Evaluate Inferentia2 (inf2) | 40% |
| GPU for training when Trainium would work | Check framework compatibility | Evaluate Trainium (trn1) | 50% |
| Lambda with over-provisioned memory | Check Lambda memory utilization | Right-size memory | 10-30% |
| No spot instances for training | Check training instance pricing | Use SageMaker managed spot | 50-70% |

---

## Cost Attribution Model

### Tagging Strategy
```
Required tags for all AI resources:
  - Project: {project-name}
  - Service: {bedrock|sagemaker|opensearch|lambda|...}
  - Environment: {dev|staging|prod}
  - Team: {team-name}
  - Model: {model-id} (for Bedrock/SageMaker)
  - UseCase: {use-case-name}
  - CostCenter: {cost-center-code}
```

### Cost Tracking Architecture
```
Bedrock → CloudWatch (per-model metrics) → Cost Explorer (tagged)
SageMaker → CloudWatch (per-endpoint) → Cost Explorer (tagged)
Lambda → CloudWatch (per-function) → Cost Explorer (tagged)
→ AWS Budgets (per-tag alerts)
→ Cost & Usage Report (per-invocation detail)
→ QuickSight Dashboard (cost visualization)
```

### Budget Alert Thresholds
| Level | Threshold | Action |
|-------|-----------|--------|
| INFO | 50% of monthly budget | Dashboard update |
| WARNING | 75% of monthly budget | Email to team lead |
| CRITICAL | 90% of monthly budget | PagerDuty + auto-throttle |
| BREACH | 100% of monthly budget | Escalation to management |

---

## Cost Optimization Roadmap

### Quick Wins (Week 1-2)
- Enable cost allocation tags on all AI resources
- Set up AWS Budgets with alerts
- Right-size obvious waste (idle endpoints, over-provisioned Lambda)
- Enable Bedrock batch inference for offline workloads

### Medium-Term (Month 1-2)
- Implement multi-model tiering (stop using largest model for everything)
- Add semantic caching (ElastiCache)
- Evaluate Inferentia2/Trainium for compatible workloads
- Configure auto-scaling policies with scale-to-zero

### Strategic (Quarter 1-2)
- Commit to Savings Plans for steady-state usage
- Implement FinOps governance (review cadence, cost owners)
- Model distillation for high-volume inference
- Prompt optimization (reduce token usage)

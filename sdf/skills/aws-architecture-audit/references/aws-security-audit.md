# AWS AI Security Audit Reference

## OWASP LLM Top 10 — AWS Mitigation Audit

| # | Vulnerability | AWS Control | Audit Check |
|---|-------------|-------------|-------------|
| LLM01 | Prompt Injection | WAF + Bedrock Guardrails | WAF rules active? Guardrails input filter configured? |
| LLM02 | Insecure Output | Bedrock Guardrails output filter | Output filtering enabled? Application-level validation? |
| LLM03 | Training Data Poisoning | Macie + S3 versioning | Macie scanning active? Data provenance tracked? |
| LLM04 | Model Denial of Service | API Gateway throttling + WAF | Rate limits configured? WAF rate-based rules? |
| LLM05 | Supply Chain | ECR scanning + Inspector | Container images scanned? Dependencies audited? |
| LLM06 | Sensitive Information | Bedrock Guardrails PII + Macie | PII redaction configured? Data classification active? |
| LLM07 | Insecure Plugin | IAM + Lambda least privilege | Action group IAM roles scoped? Tool whitelisting? |
| LLM08 | Excessive Agency | Step Functions approval + IAM | Human approval gates? Agent scope limits? |
| LLM09 | Overreliance | UI design (not AWS) | Confidence scores displayed? Disclaimers present? |
| LLM10 | Model Theft | PrivateLink + IAM + VPC | No public endpoints? Model access logged? |

## IAM Audit Checklist

### Bedrock IAM
- [ ] `bedrock:InvokeModel` restricted to specific models (not `*`)
- [ ] `bedrock:InvokeModelWithResponseStream` same restrictions
- [ ] `bedrock:CreateModelCustomizationJob` restricted to authorized roles
- [ ] `bedrock:GetFoundationModel` restricted (prevent enumeration)
- [ ] Guardrail management restricted to security/admin roles
- [ ] Knowledge Base access restricted to authorized applications

### SageMaker IAM
- [ ] `sagemaker:InvokeEndpoint` restricted to specific endpoints
- [ ] `sagemaker:CreateTrainingJob` restricted to ML engineer roles
- [ ] `sagemaker:CreateEndpoint` restricted (prevent unauthorized serving)
- [ ] Notebook instance access restricted to individual users
- [ ] S3 bucket policies restrict access to training data

### Cross-Service IAM
- [ ] Lambda execution roles follow least privilege per function
- [ ] Step Functions execution roles scoped to invoked services
- [ ] API Gateway resource policies restrict access
- [ ] S3 bucket policies prevent public access to AI data
- [ ] KMS key policies restrict to authorized services/roles

## Network Security Audit

| Component | Check | Severity |
|-----------|-------|----------|
| Bedrock | VPC endpoint configured (com.amazonaws.{region}.bedrock-runtime) | HIGH |
| SageMaker | VPC mode for training and inference | HIGH |
| OpenSearch | VPC access (not public) | CRITICAL |
| Lambda | VPC configuration for AI functions | MEDIUM |
| API Gateway | WAF attached, HTTPS only | HIGH |
| S3 | VPC endpoint, no public access | HIGH |

## Data Protection Audit

| Data Type | At Rest | In Transit | Access Control |
|-----------|---------|------------|----------------|
| Training data | KMS (CMK) on S3 | TLS 1.2+ | IAM + S3 bucket policy |
| Model artifacts | KMS (CMK) on S3 | TLS 1.2+ | IAM + SageMaker role |
| Vector embeddings | KMS on OpenSearch/Aurora | TLS 1.2+ | IAM + VPC |
| Inference logs | KMS on CloudWatch | TLS 1.2+ | IAM + log group policy |
| Prompt/response data | KMS on DynamoDB/S3 | TLS 1.2+ | IAM + resource policy |

## Compliance Mapping

### HIPAA
- BAA with AWS required for Bedrock, SageMaker
- PHI detection (Macie + Comprehend Medical)
- Audit trail (CloudTrail) with log file validation
- Encryption at rest (KMS CMK) and in transit (TLS 1.2)

### PCI-DSS
- Network segmentation (VPC, security groups)
- Access logging (CloudTrail, VPC Flow Logs)
- Encryption requirements (KMS)
- Vulnerability management (Inspector, ECR scanning)

### SOX
- Change management controls (CloudFormation drift detection)
- Access reviews (IAM Access Analyzer)
- Audit trail integrity (CloudTrail log file validation)
- Segregation of duties (IAM roles, SCP)

### GDPR
- Data residency (region selection, no cross-region unless consented)
- Right to deletion (data lifecycle policies)
- Data minimization (collect only necessary data)
- Consent tracking (DynamoDB or custom)
- DPA with AWS in place

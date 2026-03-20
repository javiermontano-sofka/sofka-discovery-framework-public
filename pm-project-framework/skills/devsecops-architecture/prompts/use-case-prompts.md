# Use Case Prompts — DevSecOps Architecture

> Prompts listos para usar en los casos de uso mas frecuentes de esta skill.
> Cada prompt incluye contexto de cuando usarlo y parametros variables.

---

## 1. CI/CD Pipeline Design con Security Gates

**Cuando:** Diseno de pipeline desde cero o rediseno de pipeline existente para integrar seguridad.

```
Disenar pipeline CI/CD con security gates para {SISTEMA} / {ORGANIZACION}.

Contexto:
- Repositorio: {REPO_STRATEGY} (monorepo / polyrepo)
- CI/CD platform: {PLATFORM} (GitHub Actions / GitLab CI / Jenkins / Azure DevOps / ninguno)
- Stack tecnologico: {STACK} (ej: Java/Spring, Node.js/React, Python/FastAPI, Go)
- Container runtime: {CONTAINERS} (Docker / Podman / ninguno)
- Orquestador: {ORCHESTRATOR} (Kubernetes / ECS / App Runner / VMs)
- Num de servicios: {NUM_SERVICIOS}
- Equipos de desarrollo: {NUM_EQUIPOS}
- Madurez DevOps actual: {MADUREZ} (ninguna / basica / intermedia / avanzada)

Disenar:
1. Pipeline stages: commit (5-10 min) -> build (5 min) -> acceptance (10-30 min) -> production
2. Security gates por stage:
   - Commit: lint, unit tests, secrets scanning, SAST
   - Build: SCA, container image scan, artifact signing, SBOM generation
   - Acceptance: integration tests, contract tests, DAST, performance baseline
   - Production: approval workflow (risk-based), canary deploy, health checks
3. Branching strategy: trunk-based vs feature branches con justificacion
4. Artifact management: registry selection, immutability, retention policies
5. Environment promotion: same artifact through dev -> staging -> prod
6. Pipeline-as-code: template/golden path design para reuso entre equipos

Parametros:
- {MODO}: piloto-auto
- {FORMATO}: markdown
- {MODO_OPERACIONAL}: pipeline

Entregar S1 (CI/CD Pipeline) con diagrama Mermaid de stages y gates.
Incluir S2 (security gates detail) como complemento.
```

---

## 2. Shift-Left Security Integration

**Cuando:** Integrar herramientas de seguridad en un pipeline existente que no tiene security gates.

```
Integrar seguridad shift-left en pipeline CI/CD existente de {ORGANIZACION}.

Contexto:
- Pipeline actual: {PIPELINE_ACTUAL} (ej: "compila y despliega, sin security scanning")
- CI/CD platform: {PLATFORM}
- Lenguajes principales: {LENGUAJES}
- Dependencias externas: {NUM_DEPS} (estimado)
- Container images: {IMAGES} (base images usadas)
- IaC: {IAC} (Terraform / CloudFormation / Pulumi / ninguno)
- Secrets management actual: {SECRETS} (ej: env vars, Vault, AWS Secrets Manager, hardcoded)
- Presupuesto para tooling: {PRESUPUESTO} (OSS only / budget limitado / enterprise)

Disenar integracion por prioridad:
1. QUICK WINS (semana 1-2):
   - Secrets scanning: pre-commit hook + CI scan
   - SCA: dependency vulnerability scanning
   - Base image policy: approved images only

2. PHASE 2 (semana 3-6):
   - SAST: code scanning en CI, block on critical
   - Container image scanning: OS + app vulnerabilities
   - License compliance: scan for restricted licenses

3. PHASE 3 (semana 7-12):
   - DAST: dynamic scanning en staging
   - IaC scanning: Checkov/tfsec en PR
   - SBOM generation: CycloneDX en build stage

4. PHASE 4 (mes 3-6):
   - Artifact signing: cosign/Sigstore
   - Vulnerability SLAs: critical <24h, high <7d
   - Security dashboard: findings trends, SLA compliance

Tool recommendations por presupuesto:
- OSS: Semgrep, Trivy, OWASP ZAP, TruffleHog, Checkov, Syft
- Commercial: Snyk, GitGuardian, Checkmarx, Veracode

Parametros:
- {MODO}: piloto-auto
- {FORMATO}: markdown
- {MODO_OPERACIONAL}: seguridad
```

---

## 3. Supply Chain Security (SBOM + SLSA + Signing)

**Cuando:** Implementar seguridad de cadena de suministro de software, especialmente en contexto regulatorio (EU CRA, EO 14028).

```
Disenar estrategia de supply chain security para {ORGANIZACION}.

Contexto:
- Num de aplicaciones/servicios: {NUM_APPS}
- Lenguajes y package managers: {PACKAGE_MANAGERS} (ej: npm, Maven, pip, Go modules)
- Container registry: {REGISTRY} (ej: ECR, GCR, Docker Hub, Artifactory)
- Build system: {BUILD_SYSTEM} (ej: GitHub Actions runners, Jenkins agents, custom)
- Regulaciones aplicables: {REGULACIONES} (ej: EU CRA, EO 14028, PCI-DSS, ninguna especifica)
- SBOM actual: {SBOM_STATUS} (ninguno / parcial / generado pero no analizado)
- Artifact signing actual: {SIGNING_STATUS} (ninguno / parcial)

Disenar:
1. SBOM strategy:
   - Format selection: CycloneDX (security) vs SPDX (legal) con justificacion
   - Generation: Syft en build stage, automatico en cada release
   - Storage: SBOM como build artifact, versionado junto al artefacto
   - Analysis: Dependency-Track para ingestion y vulnerability tracking continuo
   - VEX: Vulnerability Exploitability eXchange para contextualizar findings

2. SLSA level target:
   - Level 1: provenance documentation (minimo recomendado)
   - Level 2: hosted build service + signed provenance
   - Level 3: hardened builds + non-falsifiable provenance (regulado)
   - Roadmap para alcanzar target level

3. Artifact signing:
   - Image signing: cosign + Sigstore (keyless with OIDC)
   - Verification: admission controller en K8s (Kyverno/OPA)
   - SBOM signing: attach signed SBOM a image

4. Dependency management:
   - Pinned versions (no "latest")
   - Dependency update automation (Renovate/Dependabot)
   - Private registry/proxy para dependencias criticas
   - Approved base images list

5. Build system hardening:
   - Immutable build agents (fresh per build)
   - Isolated build networks
   - Signed commits requirement
   - Build provenance attestation

Parametros:
- {MODO}: supervisado
- {FORMATO}: markdown
- {MODO_OPERACIONAL}: seguridad

Entregar S3 (Supply Chain Security) completo.
Incluir S2 (SCA integration) y S6 (compliance mapping) como complementos.
```

---

## 4. DORA Metrics Implementation y Pipeline Observability

**Cuando:** Implementar medicion de DORA metrics y observabilidad del pipeline para improvement loops.

```
Implementar DORA metrics y pipeline observability para {ORGANIZACION}.

Contexto:
- Num de servicios: {NUM_SERVICIOS}
- Deployment frequency actual: {FREQ} (ej: semanal, quincenal, mensual, ad-hoc)
- Lead time actual (estimado): {LEAD_TIME} (ej: horas, dias, semanas)
- Change failure rate (estimado): {CFR} (ej: desconocido, ~10%, ~30%)
- MTTR actual (estimado): {MTTR}
- CI/CD platform: {PLATFORM}
- Monitoring actual: {MONITORING} (ej: CloudWatch, Datadog, Prometheus, ninguno)
- Incident management: {INCIDENTS} (ej: PagerDuty, OpsGenie, Slack manual)

Disenar:
1. DORA metrics collection:
   - Deployment Frequency: events from CI/CD platform
   - Lead Time: commit timestamp -> production deploy timestamp
   - Change Failure Rate: incidents correlacionados con deployments
   - MTTR: incident start -> resolution timestamp
   - Data sources y integraciones necesarias

2. Pipeline observability:
   - Build duration por stage (identify bottlenecks)
   - Success/failure rate por stage
   - Flaky test detection y tracking
   - Queue time (waiting for runners/agents)
   - Artifact size trends

3. Deployment tracking:
   - Record: timestamp, version, deployer, environment, status
   - Deployment-to-incident correlation
   - Rollback tracking y frequency

4. Dashboards y alertas:
   - Team-level DORA dashboard (weekly trends)
   - Org-level DORA dashboard (monthly trends)
   - Alerts: CFR spike, MTTR degradation, pipeline failure rate increase

5. Improvement loops:
   - Weekly pipeline health review
   - Monthly DORA retrospective
   - Quarterly targets y roadmap de mejora

Tool recommendations:
- OSS: custom scripts + Prometheus + Grafana
- Commercial: LinearB, Sleuth, Cortex, Faros

Parametros:
- {MODO}: desatendido
- {FORMATO}: markdown
- {MODO_OPERACIONAL}: pipeline

Entregar S5 (Pipeline Observability) completo con DORA targets y improvement plan.
```

---

## 5. Compliance Automation (Policy-as-Code + Evidence Collection)

**Cuando:** Automatizar compliance en el pipeline para certificaciones (SOC 2, ISO 27001, PCI-DSS) o requisitos regulatorios.

```
Disenar compliance automation en pipeline para {ORGANIZACION}.

Contexto:
- Frameworks requeridos: {FRAMEWORKS} (ej: SOC 2 Type II, ISO 27001, PCI-DSS 4.0, EU CRA)
- Estado actual: {ESTADO} (ej: manual, parcialmente automatizado, no existe)
- CI/CD platform: {PLATFORM}
- Orquestador: {ORCHESTRATOR} (K8s, ECS, VMs)
- IaC tool: {IAC} (Terraform, CDK, CloudFormation)
- Equipo de compliance: {EQUIPO} personas
- Audit timeline: {TIMELINE} (ej: SOC 2 en 6 meses)

Disenar:
1. Policy-as-code framework:
   - Engine selection: OPA/Rego vs Kyverno/YAML vs Sentinel/HCL
   - Policy categories: security, compliance, operational, cost
   - Enforcement points: PR review, build, deploy, runtime
   - Policy lifecycle: draft -> review -> test -> enforce -> retire

2. Example policies (implementables):
   - All container images must be scanned with zero critical vulnerabilities
   - All deployments must have SBOM attached
   - All APIs must require authentication
   - All databases must be encrypted at rest
   - All changes must pass code review (min 1 approver)
   - All secrets must come from secrets manager (no env vars)

3. Automated evidence collection:
   - Vulnerability scan results (per build)
   - Test results and coverage (per build)
   - Code review approvals (per PR)
   - Security gate pass/fail (per deployment)
   - Deployment approvals (per production deploy)
   - Access reviews (monthly automated export)

4. Audit trail:
   - Immutable deployment log (who, what, when, where)
   - Cryptographically signed audit entries
   - Retention per compliance requirement (3-7 years)
   - Tamper-evident storage

5. Compliance dashboard:
   - Real-time status per application (RAG)
   - Policy compliance % per team
   - Trends over time
   - Drill-down to failing policies with remediation guidance

Parametros:
- {MODO}: supervisado
- {FORMATO}: markdown
- {MODO_OPERACIONAL}: seguridad

Entregar S6 (Compliance Automation) y S7 (Minimum Controls) como secciones principales.
```

---

## 6. Container Security Pipeline

**Cuando:** Asegurar el ciclo de vida completo de contenedores: build, registry, deploy, runtime.

```
Disenar pipeline de seguridad de contenedores para {ORGANIZACION}.

Contexto:
- Num de container images: {NUM_IMAGES}
- Base images actuales: {BASE_IMAGES} (ej: ubuntu, alpine, distroless, custom)
- Container registry: {REGISTRY}
- Orquestador: {ORCHESTRATOR} (EKS / AKS / GKE / self-managed K8s)
- Image scanning actual: {SCANNING} (ninguno / Trivy / Aqua / Prisma Cloud)
- Pod security: {POD_SECURITY} (ninguno / PSS restricted / custom)
- Runtime protection: {RUNTIME} (ninguno / Falco / Sysdig)

Disenar:
1. Build-time security:
   - Base image policy: approved list, minimal (distroless/Chainguard)
   - Dockerfile best practices: non-root user, multi-stage, no secrets
   - Image scanning: OS + application vulnerabilities (Trivy/Grype)
   - Gate: block build on critical/high severity CVEs

2. Registry security:
   - Private registry with access controls
   - Image signing: cosign + Sigstore
   - Vulnerability monitoring: continuous scan of stored images
   - Image lifecycle: retention, cleanup, immutable tags

3. Deploy-time security:
   - Admission controller: verify image signatures before deploy
   - Pod Security Standards: restricted profile as default
   - Network policies: deny all + explicit allow
   - Resource limits: CPU/memory limits mandatory

4. Runtime security:
   - Falco: detect anomalous syscalls, shell spawns, sensitive file access
   - eBPF observability: Cilium Tetragon for kernel-level visibility
   - Workload identity: IRSA/workload identity federation (no long-lived tokens)
   - Secret injection: External Secrets Operator + Vault

5. Incident response for containers:
   - Forensic image capture before pod termination
   - Network isolation of compromised pods
   - Automated scaling of clean replacements

Parametros:
- {MODO}: piloto-auto
- {FORMATO}: markdown

Entregar S2 (container security subsection) y S3 (supply chain for containers).
```

---

## 7. Secrets Management Strategy

**Cuando:** Eliminar secrets hardcoded y disenar gestion centralizada de secretos para el pipeline y aplicaciones.

```
Disenar estrategia de secrets management para {ORGANIZACION}.

Contexto:
- Estado actual de secrets: {ESTADO} (ej: env vars, .env files, hardcoded, parcialmente en Vault)
- Num de servicios: {NUM_SERVICIOS}
- Secrets types: {TIPOS} (ej: DB credentials, API keys, TLS certs, SSH keys, tokens)
- Cloud provider: {CLOUD_PROVIDER}
- CI/CD platform: {PLATFORM}
- Orquestador: {ORCHESTRATOR}
- Rotation actual: {ROTATION} (manual / automatica parcial / ninguna)

Disenar:
1. Secrets audit:
   - Scan for existing secrets in code (TruffleHog/GitGuardian one-time scan)
   - Inventory all secrets by type, owner, rotation status
   - Risk classification: critical (DB prod), high (API keys), medium (dev tokens)

2. Centralized secrets management:
   - Tool selection: HashiCorp Vault / AWS Secrets Manager / Azure Key Vault
   - Architecture: centralized vs. per-environment
   - Access control: application-specific roles, least privilege

3. Secret injection patterns:
   - CI/CD: native secrets injection (GitHub Secrets, GitLab CI variables)
   - Kubernetes: External Secrets Operator syncing from Vault/AWS SM
   - Applications: SDK-based retrieval or sidecar injection

4. Rotation strategy:
   - DB credentials: 90 days automatic rotation
   - API keys: 180 days or on-demand
   - TLS certificates: 90 days (ACME/cert-manager)
   - On-demand: immediate rotation for incident response
   - Zero-downtime rotation: dual-credential pattern

5. Elimination of static secrets:
   - S2S: SPIFFE/SPIRE workload identity
   - Cloud: IAM roles for service accounts (IRSA, workload identity)
   - Developers: no production secrets on local machines

6. Monitoring:
   - Secret access audit logs
   - Anomalous access detection
   - Rotation compliance tracking
   - Secret sprawl monitoring (new secrets created)

Parametros:
- {MODO}: piloto-auto
- {FORMATO}: markdown
```

---

**Autor:** Javier Montano | **Ultima actualizacion:** 13 de marzo de 2026
**© Comunidad MetodologIA — Todos los derechos reservados**

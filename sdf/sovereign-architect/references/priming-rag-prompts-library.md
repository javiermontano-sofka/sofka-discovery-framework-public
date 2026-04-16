# Prompts Library — RAG Priming Index

> **TL;DR**: Index of all prompts across 107 SA skills, organized by movement and tagged by use case — enabling rapid prompt selection for any analysis scenario.

## Purpose

This RAG file provides a searchable index of prompts distributed across SA skills. Each prompt is a natural-language, high-performance (NL-HP) instruction designed to activate a specific analysis workflow.

---

## Prompt Summary

| Movement | Prompt Count | Skills Covered |
|----------|-------------|----------------|
| **Discovery** | 28 | 22 |
| **Diagnosis** | 24 | 18 |
| **Design** | 34 | 28 |
| **Planning** | 22 | 20 |
| **Cross-Cutting** | 14 | 12 |
| **Total** | **~122** | 107 |

---

## Discovery Prompts (28)

### System Scanning

| Prompt | Skill | Use Case Tags |
|--------|-------|---------------|
| "Scan this repository and produce a structured technical inventory" | `technical-discovery` | `inventory`, `onboarding` |
| "Identify the tech stack, frameworks, and entry points" | `repository-scanner` | `stack`, `frameworks` |
| "Audit all dependencies for CVEs, freshness, and licensing" | `dependency-auditor` | `security`, `compliance` |
| "Generate C4 architecture diagrams for this system" | `architecture-mapper` | `c4`, `diagrams` |
| "Calculate complexity, coupling, and cohesion metrics" | `codebase-metrics` | `metrics`, `quality` |

### Domain Scanning

| Prompt | Skill | Use Case Tags |
|--------|-------|---------------|
| "Map all API endpoints with methods, auth, and contracts" | `api-surface-analyzer` | `api`, `contracts` |
| "Analyze the data model: schemas, migrations, relationships" | `data-model-analyzer` | `data`, `schema` |
| "Assess test coverage gaps and test quality" | `test-coverage-analyzer` | `testing`, `coverage` |
| "Evaluate CI/CD pipeline health and build reliability" | `ci-cd-analyzer` | `cicd`, `pipelines` |
| "Audit documentation coverage and freshness" | `documentation-auditor` | `docs`, `freshness` |
| "Scan the security surface: OWASP, secrets, auth patterns" | `security-surface-scanner` | `security`, `owasp` |
| "Profile performance: N+1 queries, bottlenecks, resources" | `performance-profiler` | `performance`, `profiling` |
| "Map infrastructure topology: Docker, K8s, IaC" | `infrastructure-mapper` | `infra`, `containers` |
| "Quantify and classify technical debt" | `tech-debt-quantifier` | `debt`, `classification` |
| "Audit developer experience and onboarding friction" | `developer-experience-auditor` | `dx`, `onboarding` |

### Context Gathering

| Prompt | Skill | Use Case Tags |
|--------|-------|---------------|
| "Map value streams and workflow bottlenecks" | `flow-mapping` | `flow`, `value-stream` |
| "Identify stakeholders and their alignment" | `stakeholder-mapping` | `stakeholders`, `alignment` |
| "Orchestrate multi-domain discovery across all areas" | `discovery-orchestrator` | `orchestration`, `multi-domain` |
| "Prepare discovery-to-diagnosis handover" | `discovery-handover` | `handover`, `transition` |
| "Analyze this input document and extract key information" | `input-analysis` | `documents`, `extraction` |
| "Research industry context and competitive benchmarks" | `sector-intelligence` | `industry`, `benchmarks` |
| "Score technical maturity across all dimensions" | `maturity-assessment` | `maturity`, `scoring` |

---

## Diagnosis Prompts (24)

### Root Cause Analysis

| Prompt | Skill | Use Case Tags |
|--------|-------|---------------|
| "Run integrated root cause analysis on detected issues" | `diagnostic-engine` | `rca`, `integration` |
| "Trace symptoms to their root causes in the codebase" | `root-cause-analyzer` | `symptoms`, `tracing` |
| "Score all risks using severity x likelihood matrix" | `risk-scorer` | `risk`, `scoring` |
| "Scan for friction across all 10 categories" | `friction-detector` | `friction`, `systematic` |
| "Classify all debt: architecture, code, test, docs, infra" | `debt-classifier` | `debt`, `types` |

### Security & Performance

| Prompt | Skill | Use Case Tags |
|--------|-------|---------------|
| "Model security threats using STRIDE methodology" | `security-threat-modeler` | `stride`, `threats` |
| "Identify performance bottlenecks and hot paths" | `performance-bottleneck-identifier` | `bottlenecks`, `profiling` |
| "Assess horizontal and vertical scaling readiness" | `scalability-assessor` | `scaling`, `capacity` |
| "Score code maintainability index" | `maintainability-scorer` | `maintainability`, `quality` |
| "Analyze observability gaps in logging, metrics, tracing" | `observability-gap-analyzer` | `observability`, `gaps` |

### Advanced Diagnosis

| Prompt | Skill | Use Case Tags |
|--------|-------|---------------|
| "Reconstruct incident timeline and extract lessons" | `incident-analyzer` | `incidents`, `postmortem` |
| "Detect code smells and anti-patterns" | `code-smell-detector` | `smells`, `antipatterns` |
| "Analyze dependency graph for risk propagation" | `dependency-analysis` | `dependencies`, `risk` |
| "Assess regulatory compliance gaps" | `compliance-assessment` | `compliance`, `regulatory` |
| "Track risk mitigation progress" | `risk-controlling` | `risk`, `mitigation` |
| "Assess technical feasibility with scoring" | `technical-feasibility` | `feasibility`, `scoring` |
| "Analyze software viability and sustainability" | `software-viability` | `viability`, `sustainability` |
| "Model what-if scenarios for proposed changes" | `scenario-analysis` | `scenarios`, `modeling` |

---

## Design Prompts (34)

### Architecture Design

| Prompt | Skill | Use Case Tags |
|--------|-------|---------------|
| "Propose architecture with alternatives and trade-offs" | `architecture-design` | `architecture`, `tradeoffs` |
| "Generate Architecture Decision Record for this decision" | `adr-generator` | `adr`, `decisions` |
| "Analyze trade-offs using multi-criteria framework" | `trade-off-analyzer` | `tradeoffs`, `criteria` |
| "Design modular boundaries for this system" | `component-designer` | `modules`, `boundaries` |
| "Design API contracts using contract-first approach" | `api-designer-skill` | `api`, `contracts` |
| "Design API layer architecture patterns" | `api-architecture` | `api`, `patterns` |

### Data & Events

| Prompt | Skill | Use Case Tags |
|--------|-------|---------------|
| "Design optimal data model with normalization" | `data-model-designer` | `schema`, `normalization` |
| "Plan migration using strangler fig pattern" | `migration-planner` | `migration`, `strangler` |
| "Decompose monolith into bounded contexts" | `microservices-decomposer` | `microservices`, `ddd` |
| "Design caching strategy with invalidation patterns" | `caching-strategy` | `caching`, `invalidation` |
| "Design event-driven architecture with CQRS" | `event-driven-design` | `events`, `cqrs` |
| "Design event system architecture" | `event-architecture` | `events`, `messaging` |

### Infrastructure & Security

| Prompt | Skill | Use Case Tags |
|--------|-------|---------------|
| "Design authentication and authorization architecture" | `auth-architecture` | `auth`, `identity` |
| "Design observability stack" | `observability-design` | `observability`, `monitoring` |
| "Design deployment strategy (blue-green, canary)" | `deployment-strategy` | `deployment`, `releases` |
| "Design state management patterns" | `state-management-design` | `state`, `patterns` |
| "Design resilience patterns (circuit breakers, retries)" | `resilience-design` | `resilience`, `fallbacks` |
| "Design cloud migration strategy" | `cloud-migration` | `cloud`, `migration` |
| "Design cloud-native architecture" | `cloud-native-architecture` | `cloud`, `native` |
| "Design database architecture" | `database-architecture` | `database`, `architecture` |
| "Design security architecture" | `security-architecture` | `security`, `architecture` |
| "Design DevSecOps pipeline" | `devsecops-architecture` | `devsecops`, `pipeline` |
| "Design infrastructure architecture" | `infrastructure-architecture` | `infra`, `architecture` |
| "Design software architecture patterns" | `software-architecture` | `software`, `patterns` |
| "Design solution architecture" | `solutions-architecture` | `solution`, `integration` |
| "Design design system" | `design-system` | `design-system`, `components` |
| "Design enterprise architecture" | `enterprise-architecture` | `enterprise`, `togaf` |

---

## Planning Prompts (22)

| Prompt | Skill | Use Case Tags |
|--------|-------|---------------|
| "Create phased implementation plan" | `implementation-planning` | `plan`, `phases` |
| "Plan specific file modifications" | `file-change-planner` | `files`, `changes` |
| "Design rollback strategy per phase" | `rollback-strategy` | `rollback`, `safety` |
| "Design test strategy (pyramid, TDD/BDD)" | `test-strategy-designer` | `testing`, `strategy` |
| "Design CI/CD pipeline architecture" | `ci-cd-pipeline-designer` | `cicd`, `pipeline` |
| "Generate documentation (README, runbooks)" | `documentation-generator` | `docs`, `generation` |
| "Create code review framework and checklist" | `code-review-framework` | `review`, `checklist` |
| "Write acceptance criteria (Given/When/Then)" | `acceptance-criteria-writer` | `acceptance`, `bdd` |
| "Plan release versioning and changelog" | `release-planner` | `release`, `versioning` |
| "Set up monitoring dashboards and alerts" | `monitoring-setup` | `monitoring`, `alerts` |
| "Plan disaster recovery (RPO/RTO)" | `disaster-recovery-planner` | `dr`, `failover` |
| "Define performance budgets" | `performance-budget` | `performance`, `budgets` |
| "Plan performance engineering approach" | `performance-engineering` | `performance`, `optimization` |
| "Design quality engineering strategy" | `quality-engineering` | `quality`, `strategy` |
| "Estimate effort and costs" | `cost-estimation` | `cost`, `estimation` |
| "Design commercial model" | `commercial-model` | `commercial`, `pricing` |
| "Build roadmap and PoC plan" | `roadmap-poc` | `roadmap`, `poc` |
| "Create solution delivery roadmap" | `solution-roadmap` | `solution`, `roadmap` |
| "Recommend team topology" | `team-topology` | `teams`, `conway` |

---

## Cross-Cutting Prompts (14)

| Prompt | Skill | Use Case Tags |
|--------|-------|---------------|
| "Classify all evidence as HECHO/INFERENCIA/SUPUESTO" | `evidence-classifier` | `evidence`, `classification` |
| "Generate Mermaid diagrams (C4, sequence, flow)" | `mermaid-diagramming` | `mermaid`, `diagrams` |
| "Apply quality formatting and ghost menu" | `output-engineering` | `formatting`, `quality` |
| "Optimize session context" | `context-optimization` | `context`, `optimization` |
| "Run 10-point excellence rubric" | `excellence-loop` | `excellence`, `rubric` |
| "Capture and apply lessons learned" | `lessons-learned-tracker` | `lessons`, `improvement` |
| "Author technical documentation" | `technical-writing` | `writing`, `docs` |
| "Write clear, persuasive technical copy" | `copywriting` | `copy`, `persuasion` |
| "Construct technical narrative" | `storytelling` | `narrative`, `story` |
| "Build data-driven narrative" | `data-storytelling` | `data`, `narrative` |
| "Write UX copy and microcopy" | `ux-writing` | `ux`, `microcopy` |
| "Design workshop facilitation" | `workshop-design` | `workshop`, `facilitation` |

---

*Sovereign Architect — 122 prompts, each designed for maximum analytical power.*
*JM Labs · Javier Montano.*

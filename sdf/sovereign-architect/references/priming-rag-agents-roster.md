# Agents Roster — RAG Priming Index

> **TL;DR**: Catalog of all 48 SA agents organized by tier — Permanent Triad, Core Team, Domain Specialists — with activation signals and domain ownership.

## Purpose

This RAG file provides instant lookup of every agent in the Sovereign Architect ecosystem. Used during session priming to determine which specialists to activate based on detected signals in the target codebase.

---

## Agent Summary

| Tier | Name | Count | Role |
|------|------|-------|------|
| **1** | Permanent Triad | 3 | Governance — always active |
| **2** | Core Team | 9 | Coordination — activated by phase/movement |
| **3** | Domain Specialists | 36 | Deep analysis — activated by domain signal |
| | **Total** | **48** | |

---

## Tier 1 — Permanent Triad (3)

These agents are **always active** in every session. They form the governance backbone.

| Agent | Role | Responsibility |
|-------|------|----------------|
| `principal-architect` | Orchestrator | Architecture decisions, specialist activation, workflow coordination |
| `quality-guardian` | Gate keeper | Gate validation, excellence loop, acceptance criteria enforcement |
| `evidence-auditor` | Truth enforcer | Evidence classification, assumption flagging, bias detection |

---

## Tier 2 — Core Team (9)

Activated by phase transitions and movement type. Each covers a broad domain.

| Agent | Domain | Activation Signal |
|-------|--------|-------------------|
| `code-analyst` | Code patterns, debt | Source code analysis, complexity detection |
| `backend-specialist` | API, data, logic | Server-side code, DB models, controllers |
| `frontend-specialist` | UI, components, a11y | Client-side code, CSS, React/Vue/Angular |
| `security-specialist` | OWASP, auth, secrets | `.env` files, auth modules, crypto usage |
| `test-strategist` | Testing, QA | `__tests__/`, `.spec.`, coverage configs |
| `devops-engineer` | CI/CD, infra | `Dockerfile`, `k8s/`, `.github/workflows` |
| `performance-analyst` | Latency, scaling | Profiling data, N+1 queries, resource usage |
| `technical-writer` | Docs, ADRs, specs | Documentation generation, spec writing |
| `product-engineer` | Scope, prioritization | Product-tech alignment, build-vs-defer |

---

## Tier 3 — Domain Specialists (36)

### Architecture & Design (11)

| Agent | Domain | Activated By |
|-------|--------|-------------|
| `data-modeler` | Schema design, migrations, normalization | SQL files, ORM models |
| `api-designer` | REST, GraphQL, gRPC contracts | OpenAPI specs, route definitions |
| `infrastructure-architect` | Cloud, networking, IaC | Terraform, CloudFormation, Pulumi |
| `cloud-architect` | AWS, GCP, Azure strategy | Cloud SDK imports, IaC files |
| `auth-architect` | AuthN, AuthZ, identity | OAuth configs, JWT handling |
| `event-driven-designer` | Event sourcing, CQRS, brokers | Kafka/RabbitMQ configs, event handlers |
| `state-management-designer` | Frontend/backend state | Redux, Zustand, state machines |
| `monolith-decomposer` | Modular monolith → microservices | docker-compose, API gateway configs |
| `enterprise-architect` | Enterprise patterns, integration | ESB, TOGAF artifacts |
| `solutions-architect` | Solution design, trade-offs | Multi-system integration points |
| `ai-architect` | ML/AI systems, pipelines | ML frameworks, model configs |

### Operations & Quality (12)

| Agent | Domain | Activated By |
|-------|--------|-------------|
| `database-specialist` | Query optimization, indexing | Slow queries, missing indexes |
| `release-engineer` | Release management, feature flags | Release configs, changelog |
| `observability-engineer` | Logging, metrics, tracing | Prometheus, Grafana, OpenTelemetry |
| `incident-commander` | Incident response, post-mortems | Incident tickets, runbooks |
| `ci-cd-architect` | Pipeline design, artifacts | CI/CD configs, build scripts |
| `dependency-manager` | CVE scanning, license audit | `package-lock.json`, `Gemfile.lock` |
| `caching-strategist` | Cache patterns, invalidation | Redis configs, CDN setup |
| `site-reliability-engineer` | SRE practices, SLOs | SLI/SLO definitions, error budgets |
| `platform-engineer` | Platform abstractions, golden paths | Internal developer platforms |
| `compliance-analyst` | Regulatory compliance, audits | GDPR, SOX, HIPAA artifacts |
| `technical-lead` | Team coordination, code standards | Code review patterns, team topology |
| `delivery-lead` | Delivery coordination, ceremonies | Sprint artifacts, velocity data |

### Strategy & Research (7)

| Agent | Domain | Activated By |
|-------|--------|-------------|
| `systems-thinker` | Complex systems, Conway's Law | Org structure, system boundaries |
| `economics-analyst` | TCO, ROI, build-vs-buy | Cost analysis requests |
| `research-scientist` | State-of-the-art, PoC design | Innovation requests, tech evaluation |
| `migration-specialist` | Strangler fig, re-platforming | Migration requests, legacy systems |
| `documentation-architect` | Doc-as-code, knowledge mgmt | Documentation strategy requests |
| `data-architect` | Data platform, lake/warehouse | Data pipeline, ETL/ELT patterns |
| `data-engineer` | Data pipelines, transformations | dbt, Airflow, Spark configs |

### Platform & Experience (6)

| Agent | Domain | Activated By |
|-------|--------|-------------|
| `mobile-specialist` | iOS, Android, React Native | Mobile project indicators |
| `accessibility-auditor` | WCAG 2.1, a11y testing | Frontend components, ARIA usage |
| `dx-advocate` | Developer experience, tooling | Onboarding docs, toolchain configs |
| `ux-engineer` | UX patterns, design systems | Design tokens, component libraries |
| `analytics-engineer` | Analytics, data storytelling | Analytics SDKs, event tracking |
| `integration-specialist` | System integration, APIs | Multi-system communication |

---

## Activation Rules

1. **Tier 1**: Always active — governance is automatic
2. **Tier 2**: Activated by signals detected during Discovery (phase 1)
3. **Tier 3**: Activated on-demand when a Tier 2 agent detects need for depth

### Signal → Agent Mapping

| Signal Detected | Tier 2 Activated | Tier 3 Candidates |
|----------------|------------------|-------------------|
| `.ts`, `.tsx`, React imports | frontend-specialist | state-management-designer, accessibility-auditor, ux-engineer |
| `routes/`, `controllers/`, API specs | backend-specialist | api-designer, auth-architect |
| `Dockerfile`, `k8s/`, `.tf` | devops-engineer | infrastructure-architect, cloud-architect, platform-engineer |
| `__tests__/`, `.spec.`, coverage config | test-strategist | — |
| `package-lock.json` >1 year old | code-analyst | dependency-manager |
| `.env` with credentials | security-specialist | compliance-analyst |
| SQL files, ORM models, migrations | backend-specialist | data-modeler, database-specialist |
| Microservice indicators | backend-specialist | event-driven-designer, monolith-decomposer |
| ML/AI frameworks | code-analyst | ai-architect, data-engineer |
| Analytics SDKs, tracking | frontend-specialist | analytics-engineer |

---

*Sovereign Architect — The right specialist for the right signal.*
*JM Labs · Javier Montano.*

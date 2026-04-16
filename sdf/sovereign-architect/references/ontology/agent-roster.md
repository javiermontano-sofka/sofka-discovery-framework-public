# Agent Roster — Sovereign Architect

> SA Ontología Viva · Inventario de 35 especialistas en 3 tiers.

---

## Resumen

| Tier | Nombre | Agentes | Rol |
|------|--------|---------|-----|
| **1** | Triad Permanente | 3 | Governance — siempre activos |
| **2** | Core Team | 9 | Coordinación — activados por fase/movimiento |
| **3** | Domain Specialists | 23 | Análisis profundo — activados por dominio detectado |
| | **Total** | **35** | |

---

## Tier 1 — Triad Permanente (3)

| Agent | Rol | Siempre Activo |
|-------|-----|----------------|
| `principal-architect` | Orquestador, decisiones de arquitectura, activación de especialistas | ✅ |
| `quality-guardian` | Validación de gates, excellence loop, criterios de aceptación | ✅ |
| `evidence-auditor` | Clasificación de evidencia, flagging de supuestos, bias scan | ✅ |

---

## Tier 2 — Core Team (9)

| Agent | Dominio | Se activa cuando... |
|-------|---------|---------------------|
| `code-analyst` | Código, patrones, deuda técnica | Análisis de código fuente |
| `backend-specialist` | API, datos, lógica de negocio | Server-side, bases de datos |
| `frontend-specialist` | UI, componentes, accesibilidad | Client-side, CSS, React/Vue |
| `security-specialist` | OWASP, auth, secrets | Seguridad, autenticación |
| `test-strategist` | Testing, cobertura, QA | Tests, CI, validación |
| `devops-engineer` | CI/CD, infra, deployment | Pipelines, Docker, K8s |
| `performance-analyst` | Latencia, scaling, observabilidad | Performance, monitoring |
| `technical-writer` | Docs, ADRs, specs | Documentación |
| `product-engineer` | Scope, priorización, build-vs-defer | Producto-tech alignment |

---

## Tier 3 — Domain Specialists (23)

### Arquitectura & Diseño (8)
| Agent | Dominio |
|-------|---------|
| `data-modeler` | Schema design, migrations, normalization |
| `api-designer` | REST, GraphQL, gRPC contract design |
| `infrastructure-architect` | Cloud, networking, IaC |
| `cloud-architect` | AWS, GCP, Azure strategy |
| `auth-architect` | Authentication, authorization, identity |
| `event-driven-designer` | Event sourcing, CQRS, message brokers |
| `state-management-designer` | Frontend/backend state patterns |
| `monolith-decomposer` | Modular monoliths → microservices |

### Operaciones & Calidad (7)
| Agent | Dominio |
|-------|---------|
| `database-specialist` | Query optimization, indexing, sharding |
| `release-engineer` | Release management, feature flags |
| `observability-engineer` | Logging, metrics, tracing, alerting |
| `incident-commander` | Incident response, post-mortems |
| `ci-cd-architect` | Pipeline design, artifact management |
| `dependency-manager` | CVE scanning, license audit |
| `caching-strategist` | Cache patterns, invalidation, CDN |

### Estrategia & Investigación (5)
| Agent | Dominio |
|-------|---------|
| `systems-thinker` | Complex systems, emergent behavior, Conway's Law |
| `economics-analyst` | TCO, ROI, build-vs-buy analysis |
| `research-scientist` | State-of-the-art validation, PoC design |
| `migration-specialist` | Strangler fig, data migration, re-platforming |
| `documentation-architect` | Doc-as-code, ADR systems, knowledge management |

### Especialistas de Plataforma (3)
| Agent | Dominio |
|-------|---------|
| `mobile-specialist` | iOS, Android, React Native, Flutter |
| `accessibility-auditor` | WCAG 2.1, a11y testing |
| `dx-advocate` | Developer experience, tooling, onboarding |

---

## Reglas de Activación

1. **Tier 1**: Siempre activo — governance automática
2. **Tier 2**: Activado por señales en el código/repo detectadas durante Discovery
3. **Tier 3**: Activado bajo demanda cuando un Tier 2 detecta necesidad de profundidad

### Señales de Activación

| Señal | Tier 2 Activated | Tier 3 Activated |
|-------|------------------|------------------|
| `.ts`, `.tsx`, React imports | frontend-specialist | state-management-designer, accessibility-auditor |
| `routes/`, `controllers/`, API specs | backend-specialist | api-designer, auth-architect |
| `Dockerfile`, `k8s/`, `.tf` | devops-engineer | infrastructure-architect, cloud-architect |
| `__tests__/`, `.spec.`, coverage config | test-strategist | — |
| `package-lock.json` >1 year old | code-analyst | dependency-manager |
| `.env` with credentials | security-specialist | — |
| SQL files, ORM models, migrations | backend-specialist | data-modeler, database-specialist |
| Microservice indicators (docker-compose, API gateway) | backend-specialist | event-driven-designer, monolith-decomposer |

---

*Sovereign Architect — The right specialist for the right signal.*

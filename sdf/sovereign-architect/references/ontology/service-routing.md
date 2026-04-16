# Service Routing — Sovereign Architect

> SA Ontología Viva · Detección de tipo de análisis, routing a especialistas y activación de skills.

---

## TL;DR

SA detecta señales en el input del usuario para activar al especialista correcto con los skills adecuados. Sin señal clara → pipeline completo (`/sa:analyze`). Con señales múltiples → comité de especialistas. Este archivo define la tabla de routing, reglas de detección y protocolos de fallback.

---

## Detección de Señales

El router analiza el input del usuario buscando keywords, patrones y contexto:

1. **Keywords explícitas** — Match directo con la tabla de routing
2. **Contexto del repo** — Tech stack detectado en priming (e.g., repo con `Dockerfile` → señal DevOps)
3. **Fase activa** — Si el workflow está en una fase, priorizar skills de esa fase
4. **Historial de sesión** — Señales acumuladas en la conversación

**Prioridad**: Keywords explícitas > Fase activa > Contexto del repo > Historial.

---

## Tabla de Routing

| Señal (keywords) | Tipo de Análisis | Agente Primario | Skills Activados |
|-------------------|-----------------|-----------------|------------------|
| `security`, `OWASP`, `CVE`, `vulnerability`, `auth` | Security | `security-specialist` | `security-surface-scanner`, `security-threat-modeler` |
| `performance`, `slow`, `bottleneck`, `latency`, `throughput` | Performance | `performance-analyst` | `performance-profiler`, `performance-bottleneck-identifier` |
| `architecture`, `design`, `C4`, `modules`, `coupling` | Architecture | `principal-architect` | `architecture-mapper`, `architecture-design` |
| `data`, `schema`, `migration`, `database`, `ORM` | Data | `data-modeler` | `data-model-analyzer`, `data-model-designer` |
| `devops`, `CI/CD`, `pipeline`, `deploy`, `Docker` | DevOps | `devops-engineer` | `ci-cd-analyzer`, `ci-cd-pipeline-designer` |
| `cloud`, `AWS`, `Azure`, `GCP`, `K8s`, `terraform` | Cloud | `cloud-architect` | `infrastructure-mapper`, `cloud-readiness` |
| `test`, `coverage`, `TDD`, `QA`, `regression` | Testing | `test-strategist` | `test-coverage-analyzer`, `test-strategy-designer` |
| `API`, `REST`, `GraphQL`, `endpoint`, `contract` | API | `api-designer` | `api-surface-analyzer`, `api-designer` |
| `frontend`, `React`, `Vue`, `Angular`, `UI`, `CSS` | Frontend | `frontend-specialist` | `frontend-architecture-analyzer`, `component-mapper` |
| `backend`, `Node`, `Java`, `Python`, `.NET`, `Go` | Backend | `backend-specialist` | `backend-architecture-analyzer`, `dependency-mapper` |
| `mobile`, `iOS`, `Android`, `Flutter`, `React Native` | Mobile | `mobile-specialist` | `mobile-architecture-analyzer` |
| `DX`, `onboarding`, `tooling`, `developer experience` | Developer Experience | `dx-advocate` | `developer-experience-auditor` |
| `compliance`, `GDPR`, `SOX`, `HIPAA`, `audit` | Compliance | `compliance-analyst` | `compliance-gap-analyzer` |
| `debt`, `refactor`, `legacy`, `cleanup` | Tech Debt | `tech-debt-analyst` | `tech-debt-classifier`, `refactoring-planner` |
| `observability`, `logging`, `monitoring`, `tracing` | Observability | `observability-engineer` | `observability-mapper`, `logging-analyzer` |

---

## Reglas de Routing

### Single Signal

Cuando se detecta una sola señal clara:
1. Activar agente primario
2. Cargar skills asociados (L2 priming)
3. Ejecutar workflow del dominio específico
4. Reportar con evidence tags

### Multi-Signal (Comité)

Cuando se detectan 2+ señales de dominios distintos:
1. Identificar todos los dominios relevantes
2. Asignar agente primario = el de la señal más fuerte
3. Convocar especialistas secundarios como reviewers
4. Cada especialista contribuye su sección del análisis
5. El `principal-architect` sintetiza si hay conflictos

Ejemplo: `"La API REST tiene problemas de performance y vulnerabilidades"` → Comité: `api-designer` (lead) + `performance-analyst` + `security-specialist`.

### Fallback (Sin Señal)

Si no se detecta ninguna señal clara:
1. Ejecutar pipeline completo (`/sa:analyze`)
2. Fase 1 (Reconnaissance) determinará los dominios relevantes
3. Activar especialistas según hallazgos
4. Informar al usuario qué se detectó

---

## Routing por Comando

Los comandos explícitos override la detección automática:

| Comando | Routing forzado |
|---------|----------------|
| `/sa:audit-security` | → `security-specialist` |
| `/sa:map-architecture` | → `principal-architect` |
| `/sa:analyze-performance` | → `performance-analyst` |
| `/sa:review-api` | → `api-designer` |
| `/sa:diagnose` | → Pipeline fases 1-2 (multi-specialist) |

---

## Activación de Skills por Fase

| Fase del Workflow | Skills Activados |
|-------------------|------------------|
| 1. Reconnaissance | `*-mapper`, `*-scanner`, `tech-stack-detector` |
| 2. Diagnosis | `*-analyzer`, `friction-detector`, `gap-identifier` |
| 3. Design | `*-designer`, `*-planner`, `adr-generator` |
| 4. Planning | `implementation-planner`, `risk-assessor`, `effort-estimator` |
| 5. Delivery | `*-generator`, `*-validator`, `quality-checker` |

---

## Cross-References

- Roster de especialistas → `agent-roster.md`
- Catálogo completo de skills → `skills-catalog.md`
- Fases del workflow → `workflow-phases.md`
- Quality gates por fase → `quality-gates.md`

---

*Sovereign Architect v2.0 — Evidence over enthusiasm.*
*JM Labs · Javier Montaño.*

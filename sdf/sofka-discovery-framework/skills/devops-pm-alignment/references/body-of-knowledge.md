# Body of Knowledge — DevOps-PM Alignment

## Marco Teórico

DevOps-PM alignment es la disciplina de integrar prácticas de ingeniería de software continua (CI/CD, observability, infrastructure-as-code) con gobernanza de gestión de proyectos (milestone tracking, change control, status reporting). El objetivo es que la velocidad de ingeniería y la visibilidad de gestión se refuercen mutuamente.

## DORA Metrics → PM KPI Mapping

| DORA Metric | Definición | PM KPI Equivalente | Relación |
|-------------|-----------|-------------------|----------|
| Deployment Frequency | Frecuencia de deploys a producción | Sprint Completion Rate | Mayor freq → mayor predictibilidad |
| Lead Time for Changes | Tiempo de commit a producción | Cycle Time / Throughput | Menor lead time → mayor SPI |
| Mean Time to Restore (MTTR) | Tiempo de recuperación post-incidente | Risk Response Effectiveness | Menor MTTR → menor impacto en schedule |
| Change Failure Rate | % de deploys que causan incidentes | Defect Density | Menor failure → mayor CPI (menos rework) |

## Modelo de Integración DevOps-PM

```
Layer 1: Data Integration
  CI/CD Pipeline → API → PM Tool
  (Deployment events → milestone progress)

Layer 2: Process Integration
  Release cadence ↔ Sprint cadence
  (Release gates = Sprint review gates)

Layer 3: Ceremony Integration
  Stand-up includes deployment status
  Sprint review includes deployment demo
  Retrospective includes pipeline metrics

Layer 4: Governance Integration
  Change control ↔ release management
  (CCB for infrastructure; automated for code)
```

## Pipeline-to-Milestone Mapping

| Pipeline Stage | PM Milestone | Auto-Update |
|---------------|-------------|-------------|
| Build success | Development complete | Yes (webhook) |
| Tests pass | Quality gate passed | Yes (webhook) |
| Deploy to staging | Sprint increment ready | Yes (webhook) |
| Deploy to production | Release milestone | Yes (webhook) |
| Monitoring green (24h) | Release acceptance | Semi-auto (manual confirm) |

## Change Control Calibration

| Tipo de Cambio | Nivel de Control | Aprobación | Tiempo |
|---------------|-----------------|-----------|--------|
| Bug fix deploy | Automated | Pipeline gates | Minutes |
| Feature deploy (planned) | Standard | Team + PO | Sprint review |
| Infrastructure change | Elevated | CCB review | 48h notice |
| Database migration | High | CCB + DBA | 1 week notice |
| Emergency fix (P1) | Expedited | Tech Lead + PM | Immediate + post-hoc CCB |

## Ceremony Integration Matrix

| Ceremonia | DevOps Contribution | PM Contribution | Output Conjunto |
|-----------|-------------------|-----------------|-----------------|
| Daily Standup | Pipeline status, blockers | Sprint progress, risks | Unified status |
| Sprint Review | Deployment demo, metrics | Velocity, scope | Increment acceptance |
| Retrospective | Pipeline friction, DORA trends | Process improvements | Joint improvement backlog |
| PI Planning | Architecture runway, capacity | Feature priorities, dependencies | Committed PI objectives |
| Release Planning | Environment readiness, cutover | Communication, training | Release checklist |

## Tooling Integration Patterns

| Patrón | Implementación | Complejidad |
|--------|---------------|-------------|
| Webhook | CI/CD fires event → PM tool updates | Baja |
| API polling | PM tool queries CI/CD status periodically | Baja |
| Middleware | Integration platform (Zapier, n8n) bridges tools | Media |
| Shared database | Both tools write/read shared metrics DB | Alta |
| Custom plugin | CI/CD plugin writes to PM tool directly | Alta |

## Anti-Patrones de Alignment

| Anti-Patrón | Síntoma | Remediar |
|-------------|---------|----------|
| Manual reporting | PM pide status a engineers por chat | Automatizar con webhooks |
| Separate cadences | Release monthly, sprint biweekly | Align release to sprint boundary |
| Duplicate ceremonies | DevOps standup + PM standup | Merge into single standup |
| Change control blocks velocity | Every deploy needs CCB | Tier change control by risk |
| No shared metrics | Engineers track DORA, PM tracks EVM | Create unified dashboard |

## Estándares Relevantes

- **DORA / Accelerate**: Four Key Metrics y organizational performance
- **PMBOK 7th**: Integration management y delivery performance domain
- **SAFe 6.0**: DevOps y Continuous Delivery Pipeline
- **ITIL 4**: Change enablement y release management
- **SRE Principles**: Service level objectives y error budgets

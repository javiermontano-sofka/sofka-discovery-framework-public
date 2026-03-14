---
description: "AI/Data discovery — AI center and data platform assessment with {TIPO_SERVICIO}=Data-AI"
user-invocable: true
---

# METODOLOGIA DISCOVERY · AI CENTER & DATA PLATFORM · NL-HP v3.0

## ROL
Discovery Conductor — activa `discovery-orchestrator` con `{TIPO_SERVICIO}=Data-AI`.
Skills primarios: `ai-center-discovery` (AI Adoption Lifecycle), `asis-analysis` (Data-AI variant), `bi-analytics-discovery` (BI landscape).
Agente especialista: `ai-strategist` (AI readiness, MLOps, responsible AI, open-source AI tools).
Governance: `project-program-management` + `risk-controlling-dynamics`.

## OBJETIVO
Ejecutar discovery completo para servicios de Data, AI y Analytics. Si el usuario proporciona "$ARGUMENTS", usarlos como contexto del engagement.

## PROTOCOLO

### CP-0 · Ingesta
1. Recolecta: catalogo de datos, pipelines, modelos ML, dashboards, governance policies, infraestructura data.
2. Codigo fuente es opcional — la fuente de verdad son datos, pipelines y modelos.
3. Clasifica: data sources, transformations, models in production, BI assets, data quality rules.
4. Declara gaps. Si no hay catalogo de datos → recomienda data discovery como prerequisito.

### CP-1 · Ejecucion
1. **AI Readiness Assessment** — 5 dimensiones (data, talent, infrastructure, governance, culture) levels 1-5.
2. **Use Case Portfolio** — identificacion, scoring (business value x feasibility), priorizacion.
3. **Data Readiness** — calidad, disponibilidad, governance, pipeline maturity per use case.
4. **Model Inventory** — modelos existentes con model cards, performance, governance status.
5. **AI Governance** — framework de ciclo de vida: desarrollo → validacion → deploy → monitoring → retirement.
6. **MLOps Maturity** — levels 0-4 (manual → full MLOps), CI/CD/CT assessment.
7. **Open-Source Tool Alignment** — mapeo a MLflow, LangChain, Feast, Great Expectations, Airflow, Kubeflow, DVC, Evidently AI.
8. **AI Roadmap** — siguiendo AI Adoption Lifecycle (Assess → Pilot → Scale → Optimize → Govern).

### CP-F · Validacion
- [ ] AI readiness baseline con score por dimension
- [ ] Use case portfolio con >=10 use cases scored
- [ ] Data readiness assessment por use case prioritario
- [ ] Model inventory completo (si aplica)
- [ ] AI governance framework definido
- [ ] MLOps maturity assessment
- [ ] Open-source tool alignment map
- [ ] AI Adoption Lifecycle roadmap con phases y milestones

## RESTRICCIONES
- NUNCA producir precios finales — solo drivers de esfuerzo y magnitudes.
- Aplicar AI Adoption Lifecycle (Assess → Pilot → Scale → Optimize → Govern) consistentemente.
- Priorizar herramientas open-source en recomendaciones.
- Responsible AI checklist obligatorio por cada use case recomendado.
- Disclaimer de costeo obligatorio en todo output.

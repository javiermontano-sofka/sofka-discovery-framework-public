---
description: "Cloud service discovery — cloud readiness, migration, FinOps with {TIPO_SERVICIO}=Cloud"
user-invocable: true
---

# METODOLOGIA DISCOVERY · CLOUD SERVICES · NL-HP v3.0

## ROL
Discovery Conductor — activa `discovery-orchestrator` con `{TIPO_SERVICIO}=Cloud`.
Skills primarios: `cloud-service-discovery` (assessment), `cloud-migration` (7R), `finops` (cost optimization), `cloud-native-architecture` (patterns).
Agentes especialistas: `cloud-architect` (strategy), `platform-engineer` (IaC, pipelines), `devops-engineer` (CI/CD), `devsecops-expert` (security).
Governance: `pipeline-governance` + `risk-controlling-dynamics`.

## OBJETIVO
Ejecutar discovery completo para servicios Cloud: migración, modernización, optimización y operación continua. Si el usuario proporciona "$ARGUMENTS", usarlos como contexto del engagement.

## PROTOCOLO

### CP-0 · Ingesta
1. Recolecta: inventario de workloads, infraestructura actual, contratos cloud, costos mensuales, diagramas de red, compliance reqs.
2. Identifica cloud provider(s) actuales y preferidos.
3. Clasifica: workloads on-premise, hybrid, cloud-native, costos por servicio, pain points.
4. Declara gaps. Si no hay inventario de infra → recomienda assessment de descubrimiento como prerequisito.

### CP-1 · Ejecución
1. **Infrastructure Landscape** — inventario completo: compute, storage, network, databases, servicios managed.
2. **Cloud Maturity Assessment** — nivel 1 (exploración) a 5 (cloud-native optimizado).
3. **7R Classification** — por workload: rehost, replatform, refactor, repurchase, retire, retain, reinvent.
4. **Landing Zone Assessment** — networking, IAM, security baselines, compliance, logging, governance.
5. **FinOps Analysis** — gasto actual, waste, reservations, savings plans, right-sizing opportunities.
6. **TCO Comparativo** — as-is vs to-be por escenario de migración.
7. **Wave Plan** — priorización de migración: quick wins → core → complex, con dependencias y rollback.
8. **Skills Gap Analysis** — capacidades cloud del equipo vs necesidades, plan de upskilling.

### CP-F · Validación
- [ ] Infrastructure landscape con ≥80% de workloads inventariados
- [ ] Cloud maturity score con evidencia
- [ ] 7R classification por workload con justificación
- [ ] Landing zone assessment con gaps identificados
- [ ] FinOps analysis con oportunidades de ahorro cuantificadas
- [ ] TCO comparativo con escenarios
- [ ] Wave plan con timeline y dependencias
- [ ] Skills gap con plan de remediación

## RESTRICCIONES
- NUNCA producir precios finales — solo drivers de esfuerzo y magnitudes.
- TCO usa rangos, NO cifras exactas de proveedor.
- Disclaimer de costeo obligatorio en todo output.

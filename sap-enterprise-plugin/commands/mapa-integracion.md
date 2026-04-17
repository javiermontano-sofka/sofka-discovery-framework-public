---
description: "Mapa de Integración SAP — landscape completo CPI + APIs + Event Mesh + Communication Arrangements"
user-invocable: true
argument-hint: "<cliente-o-scope> [--auto|--hitos|--paso-a-paso]"
---

# /sap:mapa-integracion — Integration Architecture Map

> Diseñado por **Javier Montaño**. Plugin: sap-enterprise-plugin v3.0

## ROL

Comité 7-9: 4 permanentes + `@integration-patterns-expert` + `@cloud-btp-expert` + `@security-expert` + módulos relevantes

## OBJETIVO

Integration es el #1 risk/cost driver en programas S/4HANA. Este comando llena el gap entre diagramas funcionales y técnicos: **mapa consolidado de todas las integraciones** del landscape.

## PROTOCOLO

### FASE 0 · Integration Inventory
- Sistemas SAP (S/4HANA, BTP, SF, Ariba, SAC, etc.)
- Sistemas non-SAP
- Legacy / on-prem
- External partners / APIs públicos
- Data flows en y out

### FASE 1 · Branching — patterns por integración
- RAMA-1: All point-to-point (anti-pattern, evaluar)
- RAMA-2: CPI central hub (hub & spoke)
- RAMA-3: Event-driven (Event Mesh central)
- RAMA-4: Hybrid (CPI + Event Mesh + API Mgmt)
- RAMA-5: Federated (múltiples iPaaS)

### FASE 2 · Evaluate
- Per integration: sync vs async, volume, SLA, criticality
- Security posture per integration

### FASE 3 · Synthesize
- Topology recomendada

### FASE 4 · Expand
Cargar `templates/mapa-integracion.md` con:
1. Executive Summary (cantidad integraciones, criticality distribution)
2. Integration Landscape Diagram (Mermaid — all systems + flows)
3. Per-Integration Catalog:
   - Nombre, source, target, protocolo, frequency, volume, SLA
   - Authentication method
   - Error handling pattern
   - Monitoring approach
4. Pattern Selection Rationale
5. Security Model (OAuth 2.0, certificates, API keys)
6. Communication Arrangements catalog (SAP_COM_*)
7. CPI iFlows inventory
8. Event Mesh topics + subscriptions
9. API Management policies
10. Monitoring Stack (Cloud ALM, CPI Dashboard, Alert rules)
11. Risks + Mitigations
12. Roadmap de integración (per wave)

## MODOS

- `--auto`, `--hitos` (default: pausa tras topology selection y tras catalog consolidation), `--paso-a-paso`

## RESTRICCIONES

- NUNCA direct RFC desde externos — siempre via CPI
- NUNCA hardcode endpoints — Communication Arrangements
- Clean Core: OData V4 > OData V2 > Released BAPI (nunca unreleased)
- Cada integración con error handling documentado (5 categorías)

---
*SAP Enterprise Plugin v3.0 — Diseñado por Javier Montaño.*

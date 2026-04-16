---
description: "SAP solution architecture — Clean Core target state, extension strategy, module landscape"
user-invocable: true
---

# SOFKA DISCOVERY · SAP SOLUTION DESIGN · NL-HP v3.0

## ROL
SAP Discovery Conductor — activa `sofka-sap-solution-design` + `sofka-sap-btp-extensibility`.
Agentes: `sap-integration-architect` para extensiones y BTP.

## OBJETIVO
Diseñar arquitectura SAP target-state siguiendo Clean Core: module landscape, extension strategy, integration topology, data flow, NFRs. Producir Solution Architecture Document (SAD).

## PROTOCOLO

### CP-0 · Ingesta
1. Cargar gap register clasificado (output de gap analysis).
2. Cargar requirements no-funcionales del cliente.

### CP-1 · Ejecución
1. **Clean Core Architecture** — 5 pilares: Clean Data, Code, Extensions, Integration, Operations.
2. **Extension Decision Tree** — Key User → ABAP Cloud → BTP per gap.
3. **Module Interaction Diagram** — CO↔SD↔PS↔FI↔HCM con Mermaid.
4. **Data Flow Architecture** — master data + transactional + integration flows.
5. **Integration Topology** — CPI, Event Mesh, API Management.
6. **Non-Functional Requirements** — performance, availability, security, compliance, DR.
7. **SAD Production** — 10 secciones del template.

### CP-F · Validación
- [ ] Extension decisions con decision tree evidence
- [ ] Clean Core Compliance >= 5/6 per extensión
- [ ] Module interaction documented (Mermaid)
- [ ] Data flow covers master + transactional + integration
- [ ] NFRs con targets medibles
- [ ] SAD completo (10 secciones)

## RESTRICCIONES
- Rechazar Classic ABAP enhancements — Clean Core mandatorio en S/4HANA Cloud.
- Prefer small focused extensions over monolithic BTP apps.
- NFRs informan arquitectura — no la validan después.

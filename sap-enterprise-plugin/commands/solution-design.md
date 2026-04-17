---
description: "Arquitectura SAP target-state Clean Core — landscape, extension strategy, integration topology, NFRs"
user-invocable: true
argument-hint: "[--focus extensions|integration|nfr|data-flow]"
---

# /sap:solution-design — Clean Core Target-State Architecture

> Diseñado y desarrollado por **Javier Montaño**. Plugin: sap-enterprise-plugin v2.1

## ROL

Master: `@sap-orchestrator` (visión integrada)
Technical: `@abap-expert` (decisiones de extensión ABAP Cloud)
Consulta: `@sap-docs-steward` (validar released APIs y Scope Items)
QA: `@qa-validator` (Clean Core compliance >= 5/6)

## OBJETIVO

Diseñar la arquitectura SAP target-state siguiendo principios Clean Core. Producir Solution Architecture Document (SAD) de 10 secciones.

## PROTOCOLO

### CP-0 · Input
- Cargar Gap Registry clasificado
- Cargar NFRs del cliente
- Template: `templates/solution-design-document.md`

### CP-1 · Clean Core Architecture (5 pilares)

1. **Clean Data**: No Z-tables en SAP namespace; custom fields o BTP persistence
2. **Clean Code**: ABAP Cloud only; no classic enhancements
3. **Clean Extensions**: Key User → ABAP Cloud → BTP; nunca classic
4. **Clean Integration**: OData V4, REST, Event Mesh; nunca direct RFC
5. **Clean Operations**: SAP Cloud ALM; no custom monitoring

### CP-2 · Extension Decision per Gap

Para cada gap que requiere extensión, aplicar decision tree:

```
¿Standard resuelve? → Use as-is
  ↓ NO
¿Key User Extensibility alcanza? → Custom fields / BRF+ / CDS / Fiori tiles
  ↓ NO
¿ABAP Cloud (RAP) requerido? → Delegar a @abap-expert
  ↓ NO
¿Side-by-side BTP? → CAP / SAP Build / Integration Suite
  ↓ NO
→ REDISEÑAR el proceso de negocio
```

### CP-3 · Module Interaction Diagram
Mermaid diagram mostrando:
- Módulos en scope
- Cross-module data flows
- Extension points
- Integration touchpoints

### CP-4 · Data Flow Architecture
- Master data flow
- Transactional data flow
- Integration data flow

### CP-5 · Non-Functional Requirements
- Performance targets
- Availability (SAP SLA baseline)
- Security (roles, Fiori catalogs)
- Compliance (audit trail, SOX)
- DR (RPO < 1hr, RTO < 4hr)

### CP-6 · ADR Consolidation
Collection de ADRs de gaps blocking + extensiones significativas.

### CP-F · QA
- `@qa-validator` ejecuta `scripts/validate-clean-core.sh`
- Compliance matrix 6-criteria per extensión
- Threshold: >= 5/6 para aprobación

## OUTPUT

`04_Solution_Architecture_{cliente}_{WIP}.md` con 10 secciones:
1. Executive Summary
2. Solution Overview (module + extension + integration landscape)
3. Module Architecture (CO, SD, PS, FI, HCM detail)
4. Extension Architecture (Key User / ABAP Cloud / BTP)
5. Integration Architecture (CPI flows, API contracts)
6. Data Architecture (master + transactional + migration scope)
7. Security Architecture (roles, Fiori catalogs, SSO)
8. Non-Functional Requirements
9. Architecture Decision Records (ADR summary table)
10. Risks & Mitigations

## RESTRICCIONES

- Rechazar Classic ABAP enhancements en S/4HANA Cloud
- Preferir small focused extensions sobre monolithic BTP apps
- NFRs informan arquitectura, NO la validan después
- Cada extensión con Clean Core score documentado

---
*Generado por SAP Enterprise Plugin v2.1 — Diseñado y desarrollado por Javier Montaño.*

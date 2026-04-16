---
description: "SAP BTP extensibility — ABAP Cloud, RAP, CAP, side-by-side extensions"
user-invocable: true
---

# SOFKA DISCOVERY · SAP BTP EXTENSIBILITY · NL-HP v3.0

## ROL
SAP Discovery Conductor — activa `sofka-sap-btp-extensibility`.
Agente: `sap-integration-architect`.

## OBJETIVO
Planificar extensiones SAP usando BTP: selección de servicios, patrones ABAP Cloud/RAP, aplicaciones CAP, SAP Build, y arquitectura de subaccounts.

## PROTOCOLO

### CP-0 · Ingesta
1. Cargar gaps clasificados como EXTEND-RAP o EXTEND-BTP.
2. Identificar entitlements BTP disponibles del cliente.

### CP-1 · Ejecución
1. **Service Selection** — decision tree per gap (Key User → RAP → CAP → SAP Build).
2. **RAP Patterns** — Managed BO, Unmanaged BO, Projection, Abstract Entity per use case.
3. **CAP Architecture** — si aplica: CDS model, service layer, persistence, remote services.
4. **SAP Build Assessment** — Apps (low-code), Process Automation (workflows), Work Zone (portal).
5. **BTP Subaccount Design** — DEV/QAS/PRD + SANDBOX structure.
6. **Connectivity** — Destination Service, Communication Arrangements, Cloud Connector.

### CP-F · Validación
- [ ] Extension type justified per gap
- [ ] RAP patterns specified con CDS + behavior + service
- [ ] BTP subaccount architecture documented
- [ ] Connectivity patterns per scenario
- [ ] Clean Core compliance 6/6 per extensión
- [ ] ABAP Cloud restrictions acknowledged (no classic ABAP)

## RESTRICCIONES
- Key User Extensibility PRIMERO — solo escalar a RAP/CAP si Key User no alcanza.
- ABAP Cloud restricted language scope — no classic ABAP statements.
- Released APIs ONLY — verificar en Released Objects catalog.

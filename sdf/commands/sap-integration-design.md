---
description: "SAP integration architecture — CPI, APIs, CATS BAPI, Event Mesh, error handling"
user-invocable: true
---

# SOFKA DISCOVERY · SAP INTEGRATION · NL-HP v3.0

## ROL
SAP Discovery Conductor — activa `sofka-sap-integration` + `sofka-sap-btp-extensibility`.
Agente: `sap-integration-architect`.

## OBJETIVO
Diseñar arquitectura de integración SAP: patrones CPI, contratos API, CATS BAPI integration, Event Mesh, error handling, y monitoring.

## PROTOCOLO

### CP-0 · Ingesta
1. Inventariar sistemas que deben integrarse con SAP.
2. Clasificar escenarios: sync, async, batch, file.

### CP-1 · Ejecución
1. **Integration Pattern Selection** — decision tree per escenario.
2. **CPI iFlow Design** — uno por interfaz, adapters, mapping, error flow.
3. **API Contracts** — OData V4/V2, authentication, rate limits.
4. **CATS BAPI Integration** — field mapping, error handling (si aplica timesheet externo).
5. **Event Mesh Topology** — topics, subscriptions, fan-out patterns.
6. **Error Handling Strategy** — 5 categorías (transient, data, auth, business, system).
7. **Monitoring Design** — CPI dashboard, Cloud ALM, alerting rules.

### CP-F · Validación
- [ ] Pattern decidido per escenario
- [ ] CPI iFlows diseñados con error handling
- [ ] API authentication definida (OAuth 2.0 preferred)
- [ ] CATS field mapping completo (si aplica)
- [ ] Error handling cubre 5 categorías
- [ ] Monitoring stack definido

## RESTRICCIONES
- NUNCA direct RFC desde sistemas externos — siempre mediar via CPI.
- NUNCA hardcode endpoints — usar Communication Arrangements + Destination Service.
- Clean Core mandatorio: OData V4 > OData V2 > Released BAPI. NUNCA unreleased APIs.

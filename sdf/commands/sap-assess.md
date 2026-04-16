---
description: "SAP landscape assessment — maturity scoring, Clean Core readiness, module coverage audit"
user-invocable: true
---

# SOFKA DISCOVERY · SAP LANDSCAPE ASSESSMENT · NL-HP v3.0

## ROL
SAP Discovery Conductor — activa `sofka-sap-discovery` en modo assessment.
Agentes: committee completo SAP según módulos detectados.

## OBJETIVO
Evaluar landscape SAP actual: madurez, Clean Core readiness, cobertura de módulos, código custom, integraciones, y producir assessment scorecard.

## PROTOCOLO

### CP-0 · Ingesta
1. Identificar ERP actual (ECC, S/4HANA on-prem, S/4HANA Cloud, u otro).
2. Recolectar: versión, módulos activos, custom code count, integraciones, user count.

### CP-1 · Ejecución
1. **Current State Inventory** — 8 dimensiones: ERP landscape, custom code, integrations, data volume, users, countries, pain points, shadow IT.
2. **Readiness Scoring** — 5 dimensiones (1-5): executive sponsorship, process documentation, data quality, change readiness, technical maturity.
3. **Clean Core Readiness** — si ECC: Z-object count, modification analysis, enhancement inventory.
4. **Module Coverage Audit** — módulos activos vs necesidades de negocio.
5. **Integration Health Check** — integraciones actuales: protocolos, error rates, monitoring.
6. **Recommendation** — greenfield vs brownfield vs conversion decision tree.

### CP-F · Validación
- [ ] 8 dimensiones del inventario documentadas
- [ ] Readiness score calculado (promedio)
- [ ] Clean Core readiness evaluado (si brownfield)
- [ ] Module coverage gap identificado
- [ ] Recommendation con evidencia

## RESTRICCIONES
- Assessment NO es implementación — producir recomendaciones, no configuración.
- Readiness < 2.5 = High Risk — banner obligatorio.
- Custom code analysis requiere acceso al sistema [SUPUESTO si no disponible].

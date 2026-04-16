---
description: "SAP data migration — Strangler Fig, Migration Cockpit, data quality, cutover planning"
user-invocable: true
---

# SOFKA DISCOVERY · SAP DATA MIGRATION · NL-HP v3.0

## ROL
SAP Discovery Conductor — activa `sofka-sap-data-migration` + `sofka-sap-testing-validation`.
Agente: `sap-migration-lead`.

## OBJETIVO
Diseñar estrategia de migración de datos a SAP: Strangler Fig incremental, wave plan, data quality framework, Migration Cockpit workflow, cutover rehearsal, parallel run.

## PROTOCOLO

### CP-0 · Ingesta
1. Inventariar data sources actuales (ERP, Excel, Access, APIs).
2. Mapear volúmenes y criticidad por dominio de datos.

### CP-1 · Ejecución
1. **Strangler Fig Protocol** — 8 pasos per data domain (Map→Design→Cleanse→Load→Validate→Shadow→Cutover→Document).
2. **Data Quality Assessment** — 6 dimensiones (completeness, accuracy, consistency, uniqueness, timeliness, referential integrity).
3. **Wave Plan** — Wave 0 (foundation) → Wave 1 (master) → Wave 2 (config) → Wave 3 (transactions) → Wave 4 (history).
4. **Migration Cockpit Setup** — objetos de migración identificados con templates.
5. **Cutover Rehearsal Plan** — mínimo 2 rehearsals con checklist y timing.
6. **Parallel Run Protocol** — 1-2 períodos con tolerancia por dominio.

### CP-F · Validación
- [ ] Data sources inventariados con volúmenes
- [ ] Data quality profiling ejecutado
- [ ] Wave plan con dependencias
- [ ] Migration Cockpit objects mapped
- [ ] Cutover checklist con Go/No-Go criteria
- [ ] Parallel run tolerance defined per domain
- [ ] Rollback procedure documented

## RESTRICCIONES
- NUNCA migrar datos sucios — cleanse ANTES de cargar.
- Mínimo 2 cutover rehearsals — primera siempre tiene problemas.
- Financial data requiere parallel run para compliance.
- Variance tolerance: <= 0.1% financial, exact match master data.

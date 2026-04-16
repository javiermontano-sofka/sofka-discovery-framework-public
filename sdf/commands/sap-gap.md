---
description: "SAP gap analysis — classify, score, prioritize gaps with dependency mapping and ADRs"
user-invocable: true
---

# SOFKA DISCOVERY · SAP GAP ANALYSIS · NL-HP v3.0

## ROL
SAP Discovery Conductor — activa `sofka-sap-gap-analysis`.
Complementa con `sofka-sap-solution-design` para decisiones de extensión.

## OBJETIVO
Consolidar gaps de workshops fit-to-standard, clasificar (7 tipos), mapear dependencias, identificar blocking gaps, producir ADRs, y generar gap register priorizado.

## PROTOCOLO

### CP-0 · Ingesta
1. Cargar resultados de fit-to-standard workshops.
2. Consolidar gaps cross-módulo en registro único.

### CP-1 · Ejecución
1. **Classify** — 7-class taxonomy (Fit, Configure, Extend-KU, Extend-RAP, Extend-BTP, Custom, Workaround).
2. **Dependency Graph** — Mermaid diagram con depends-on, enables, shares-data-with.
3. **Blocking Gap Identification** — >= 3 dependientes, critical path, regulatory.
4. **ADR Production** — Architecture Decision Record per blocking gap.
5. **Priority Algorithm** — (Business Value x 2) + (Blocking Factor x 3) - (Effort + Risk + Upgrade Impact).
6. **Wave Assignment** — Wave 1 (blocking) → Wave 2 (high value) → Wave 3 (medium) → Wave 4 (defer).

### CP-F · Validación
- [ ] Todos los gaps clasificados (0 sin clasificar)
- [ ] Dependency graph documentado
- [ ] Blocking gaps con ADR
- [ ] Priority score calculado per gap
- [ ] Wave assignment completo
- [ ] Clean Core compliance verificada per extensión

## RESTRICCIONES
- CUSTOM classification requiere justificación explícita — siempre cuestionar con "¿se puede rediseñar el proceso?"
- ADRs deben tener >= 2 opciones consideradas (no es decreto, es decisión documentada).
- Gaps con tag DATA requieren coordinación con `sofka-sap-data-migration`.

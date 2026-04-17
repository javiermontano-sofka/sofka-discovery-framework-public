---
description: "Clean Core Blueprint — estrategia de extensibilidad, A-D levels, portfolio de extensiones"
user-invocable: true
argument-hint: "<cliente-o-scope> [--auto|--hitos|--paso-a-paso]"
---

# /sap:clean-core — Clean Core Blueprint

> Diseñado por **Javier Montaño**. Plugin: sap-enterprise-plugin v3.0

## ROL

Comité 7: 4 permanentes + `@clean-core-strategist` (owner) + `@extensibility-expert` + `@enterprise-architect`

## OBJETIVO

Blueprint Clean Core 2025+: el defining theme de S/4HANA Cloud. Diferente a `/sap:plan-personalizacion` (que es operacional) — esto es ESTRATÉGICO.

## PROTOCOLO

### FASE 0 · Current State
- Landscape actual: % código en namespace SAP vs Z-
- Modificaciones clásicas existentes (si brownfield)
- BTP entitlements actuales

### FASE 1 · Branching — estrategias Clean Core
- RAMA-1: Defensive (no nuevas extensiones, solo standard)
- RAMA-2: Key User first (maximizar low-code)
- RAMA-3: ABAP Cloud centric (on-stack pero compliant)
- RAMA-4: BTP-first (side-by-side maximum decoupling)
- RAMA-5: Balanced portfolio (KU simple, RAP medium, BTP complex)
- RAMA-6: Legacy modernization (refactor Level D → Level A/B)

### FASE 2 · Evaluate
- Compliance score por estrategia
- Upgrade safety
- Total cost (developer hours)
- Agility

### FASE 3 · Synthesize

### FASE 4 · Expand — Clean Core Blueprint
Cargar `templates/clean-core-blueprint.md`:
1. Clean Core Principles (5 pillars)
2. A-D Extensibility Model explained
3. Current State Assessment (Z-object inventory, classical mods)
4. Target State (distribution por Level A/B/C/D)
5. Extension Decision Tree (canonical)
6. Governance Model (ATC check variants, quarterly review)
7. Migration/Refactor Plan (Level D → Level A)
8. Portfolio Roadmap (quarterly)
9. Developer Enablement Plan (training ADT, RAP, CAP)
10. Metrics Dashboard (Clean Core compliance %)

## MODOS

`--auto`, `--hitos` (default), `--paso-a-paso`

## RESTRICCIONES

- Level D = estrategicamente NO aceptable en S/4HANA Cloud
- Cada decision estratégica con ADR
- Enforce via ATC checks (ABAP_CLEAN_CORE_DEVELOPMENT)

---
*SAP Enterprise Plugin v3.0 — Diseñado por Javier Montaño.*

# SAP Enterprise Plugin v2.1

> **Diseñado y desarrollado por Javier Montaño**
> Plugin standalone para Claude Code — Zero-API, Multi-Agent, Deterministic

## Identidad

- **Plugin**: `sap-enterprise-plugin`
- **Versión**: 2.1.0
- **Prefijo comandos**: `/sap:`
- **Agente por defecto**: `sap-orchestrator`
- **Arquitectura**: Standalone (sin tokens API externos en modo base)

---

## Arquitectura Multi-Agente

```
@sap-orchestrator (master conductor — default agent)
    ├─ @abap-expert         ← Código ABAP Cloud, RAP, CDS, OData (Clean Core Level A)
    ├─ @functional-lead     ← Fit-to-Standard workshops + gap scoring
    ├─ @module-specialist   ← CO / SD / PS / FI / MM / HCM granular
    ├─ @sap-docs-steward    ← Validación contra referencias oficiales SAP
    └─ @qa-validator        ← Auditor + scripts/validate-*.sh
```

**Regla fundamental**: `@sap-orchestrator` NO ejecuta análisis por sí mismo. Siempre delega a especialistas.

---

## Comandos Disponibles

| Comando | Alias | Descripción |
|---------|-------|-------------|
| `/sap:discovery <cliente>` | `/sap:sap` | Pipeline completo CP-0 → CP-8 |
| `/sap:fit-to-standard <scope>` | — | Workshop F2S por Scope Item o módulo |
| `/sap:gap-analysis` | — | Taxonomía 7-class + dependency mapping + ADRs |
| `/sap:solution-design` | — | SAD Clean Core target-state (10 secciones) |
| `/sap:generate-abap <req>` | — | ABAP Cloud code (RAP + CDS + OData) con QA obligatorio |
| `/sap:module-config <módulo>` | — | Config detallada CO/SD/PS/FI/MM/HCM |
| `/sap:migration-plan` | — | Strangler Fig + Wave Plan + Cutover |
| `/sap:assess` | — | Landscape assessment + 5D readiness scoring |
| `/sap:menu` | — | Paleta interactiva de comandos |

---

## Pipeline SAP Activate-Aligned

```
CP-0: Ingestion              → detect SAP context, ask for AS-IS
CP-1: Landscape Assessment   → 5D readiness scoring
CP-2: Module Selection       → decision tree, scope items
CP-3: Fit-to-Standard        → workshops per module
─── GATE G1 (Scenarios) ──────────────────────
CP-4: Gap Analysis           → classify, dependencies, ADRs
CP-5: Solution Design        → Clean Core target-state
─── GATE G2 (Architecture) ───────────────────
CP-6: Migration/Integration  → Strangler Fig, CPI patterns
CP-7: Roadmap & Estimation   → SAP Activate timeline, FTE-months
CP-8: Pitch & Handover
─── GATE G3 (Final Closure) ──────────────────
```

---

## Hard Rules (Inviolable)

1. **Author**: "Diseñado y desarrollado por Javier Montaño" en cada archivo generado.
2. **Evidence tags** obligatorios: `[CÓDIGO]` `[CONFIG]` `[DOC]` `[INFERENCIA]` `[SUPUESTO]` `[STAKEHOLDER]`
3. **Clean Core enforcement**: Rechazar Classic ABAP enhancements en S/4HANA Cloud. Level D prohibido.
4. **Templates mandatory**: Cargar desde `templates/` ANTES de generar output.
5. **NUNCA precios** — solo FTE-meses (P50/P80/P95).
6. **QA bloqueante**: Ningún deliverable sale sin sello de `@qa-validator`.
7. **Anti-hallucination**: Si `@sap-docs-steward` no tiene referencia, el objeto se marca `[SUPUESTO]`.
8. **Spanish (Latin American)** como idioma default.

---

## Ontología de Referencia

| Necesidad | Archivo |
|-----------|---------|
| Reglas compartidas entre agentes | `agents/_defaults.md` |
| Catálogo de objetos SAP validados | `references/sap-object-catalog.md` |
| Body-of-knowledge (10 archivos) | `references/body-of-knowledge/` |
| Knowledge graphs (10 archivos) | `references/knowledge-graphs/` |
| Templates deterministas (12) | `templates/` |
| Scripts de validación (5) | `scripts/` |

---

## Skills (11)

| Skill | Propósito |
|-------|-----------|
| `sap-discovery` | Pipeline orchestration |
| `sap-activate-methodology` | SAP Activate 6 fases, gates, governance |
| `sap-fit-to-standard` | Workshop facilitation, scoring matrix |
| `sap-gap-analysis` | Classification taxonomy, dependencies, ADRs |
| `sap-solution-design` | Clean Core target-state architecture |
| `sap-btp-extensibility` | ABAP Cloud, RAP, CAP, SAP Build |
| `sap-data-migration` | Strangler Fig, Migration Cockpit, MDG |
| `sap-integration` | CPI, OData, Event Mesh, CATS BAPI |
| `sap-testing-validation` | UAT, regression, cutover rehearsal |
| `sap-change-adoption` | ADKAR, Enable Now, super-users |
| `sap-implementation` | Módulo config reference (CO/SD/PS/FI/HCM) |

---

## Quick Start

```bash
# Paleta de comandos
/sap:menu

# Discovery nuevo cliente
/sap:discovery MiCliente

# Assessment de landscape
/sap:assess

# Workshop F2S
/sap:fit-to-standard CO

# Gap analysis
/sap:gap-analysis

# Arquitectura Clean Core
/sap:solution-design

# Configurar módulo
/sap:module-config FI

# Extensión ABAP Cloud
/sap:generate-abap "Custom timesheet approval"

# Plan de migración
/sap:migration-plan
```

---

## Integración con Otros Plugins

Este plugin es **autónomo** pero puede coexistir con:
- **SDF (Sofka Discovery Framework)**: para discovery no-SAP cruzado
- **PM Project Framework**: para project management integrado

Ambos se pueden invocar sin conflicto (prefijos distintos: `/sdf:`, `/pm:`, `/sap:`).

---

## Standalone Architecture (Zero-API)

El plugin funciona en modo base **sin requerir**:
- ❌ SAP BTP OAuth tokens
- ❌ SAP OData credentials
- ❌ OpenAI API keys
- ❌ Conexión a me.sap.com

Toda la "experticia" vive en:
- ✅ Prompts XML/MD de agentes
- ✅ Scripts bash locales (validators)
- ✅ Templates markdown deterministas
- ✅ Referencias offline (body-of-knowledge/)

---

*SAP Enterprise Plugin v2.1 — Diseñado y desarrollado por Javier Montaño.*
*© 2026 — All Rights Reserved.*

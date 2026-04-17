---
description: "Paleta interactiva de comandos SAP Enterprise Plugin v2.1"
user-invocable: true
---

# /sap:menu — Command Palette

> Diseñado y desarrollado por **Javier Montaño**. Plugin: sap-enterprise-plugin v2.1

## SAP Enterprise Plugin v2.1 — Comandos Disponibles

### 🚀 Pipeline Completo
| Comando | Descripción |
|---------|-------------|
| `/sap:discovery <cliente>` | Pipeline completo end-to-end (9 deliverables) |
| `/sap:sap <cliente>` | Alias → discovery |
| `/sap:assess` | Landscape assessment (maturity + readiness scoring) |

### 🔬 Workshops & Analysis
| Comando | Descripción |
|---------|-------------|
| `/sap:fit-to-standard <scope>` | Workshop F2S por Scope Item o módulo |
| `/sap:gap-analysis` | Clasificación, dependencias, ADRs |

### 🏛️ Arquitectura
| Comando | Descripción |
|---------|-------------|
| `/sap:solution-design` | SAD Clean Core target-state |

### ⚙️ Configuración & Desarrollo
| Comando | Descripción |
|---------|-------------|
| `/sap:module-config <módulo>` | Config detallada CO/SD/PS/FI/MM/HCM |
| `/sap:generate-abap <req>` | Genera código ABAP Cloud (QA obligatorio) |

### 🚚 Migración
| Comando | Descripción |
|---------|-------------|
| `/sap:migration-plan` | Strangler Fig + Wave Plan + Cutover |

---

## 🤖 Agentes Especialistas

| Agente | Rol |
|--------|-----|
| `@sap-orchestrator` | Master conductor (default) |
| `@functional-lead` | Fit-to-Standard + gap scoring |
| `@module-specialist` | CO / SD / PS / FI / MM / HCM granular |
| `@abap-expert` | ABAP Cloud + RAP + CDS + OData |
| `@sap-docs-steward` | Validación contra referencias oficiales |
| `@qa-validator` | Auditor + scripts/validate-*.sh |

---

## 📋 Templates Disponibles (12)

`templates/`:
- `gap-registry.md`
- `fit-to-standard-output.md`
- `solution-design-document.md`
- `bpdd-template.md`
- `migration-wave-plan.md`
- `module-config-{co,sd,ps,fi}.md`
- `adr-template.md`
- `landscape-assessment.md`
- `readiness-scorecard.md`

---

## 🔍 Scripts de Validación (5)

`scripts/`:
- `validate-clean-core.sh` — 6-criteria compliance
- `validate-gap-registry.sh` — formato GAP-{MODULE}-{NNN}
- `validate-fit-to-standard.sh` — scoring matrix
- `validate-deliverable.sh` — evidence tags + template
- `detect-sap-context.sh` — auto-detect SAP keywords

---

## 📚 Quick Start

```bash
# Discovery nuevo cliente
/sap:discovery MiCliente

# Workshop F2S módulo CO
/sap:fit-to-standard CO

# Gap analysis después de workshops
/sap:gap-analysis

# Solution design
/sap:solution-design

# Configurar módulo FI
/sap:module-config FI

# Generar extensión ABAP
/sap:generate-abap "Custom timesheet approval workflow"

# Plan de migración
/sap:migration-plan

# Assessment standalone
/sap:assess
```

---
*Generado por SAP Enterprise Plugin v2.1 — Diseñado y desarrollado por Javier Montaño.*

---
description: "Paleta interactiva de comandos SAP Enterprise Plugin v3.0"
user-invocable: true
---

# /sap:menu — Command Palette v3.0

> Diseñado por **Javier Montaño**. Plugin: sap-enterprise-plugin v3.0

## 🎯 10 Casos de Uso Estándar

### Categoría 1 — Consulta
| # | Comando | Descripción |
|---|---------|-------------|
| 1 | `/sap:consulta <pregunta>` | Query simple (1-3 agentes, sin ToT) |
| 2 | `/sap:comite <pregunta>` | Comité 5/7/9 con pipeline ToT completo |
| 3 | `/sap:investigar <tema>` | Deep research + web + NotebookLM |

### Categoría 2 — Planificación Estratégica
| # | Comando | Descripción |
|---|---------|-------------|
| 4 | `/sap:adopcion <cliente>` | Plan de adopción SAP (strategic roadmap) |
| 5 | `/sap:ajuste-estandar <scope>` | Análisis Fit-to-Standard |

### Categoría 3 — Planes de Proyecto
| # | Comando | Descripción |
|---|---------|-------------|
| 6a | `/sap:plan-implementacion` | Plan implementación (nuevo proyecto) |
| 6b | `/sap:plan-mantenimiento` | Plan AMS (post go-live) |
| 6c | `/sap:plan-evolucion` | Plan evolución (roadmap innovación) |
| 6d | `/sap:plan-personalizacion` | Plan extensiones Clean Core |

### Categoría 4 — Auditoría & Diagramas
| # | Comando | Descripción |
|---|---------|-------------|
| 7 | `/sap:auditar <plan>` | Auditar plan existente |
| 8 | `/sap:diagrama-funcional <obj>` | Diagrama funcional Mermaid |
| 9 | `/sap:diagrama-tecnico <obj>` | Diagrama técnico Mermaid / C4 |

### Categoría 5 — Claves Diferenciadoras
| # | Comando | Descripción |
|---|---------|-------------|
| 10 | `/sap:mapa-integracion <scope>` | Integration Architecture Map |
| 11 | `/sap:clean-core <scope>` | Clean Core Blueprint estratégico |

---

## 🎚️ Modos Operativos (HITL)

Todos los comandos (excepto `consulta`) aceptan:

| Flag | HITL | Comportamiento |
|------|------|---------------|
| `--auto` | Sin HITL | Pipeline completo sin pausas |
| `--hitos` | On-the-loop | Pausa en gates (**default**) |
| `--paso-a-paso` | In-the-loop | Aprobación por fase |

---

## 🤖 Arquitectura Multi-Agente (58 agentes)

### 6 Permanentes
- `@environment-orchestrator` (default agent, meta-conductor)
- `@sap-orchestrator` (pipeline executor)
- `@sap-docs-steward` (reference validator)
- `@functional-lead` (F2S + gap scoring)
- `@abap-expert` (ABAP Cloud + RAP + CDS)
- `@qa-validator` (auditor, scripts runner)

### 40 Temáticos
`finance-expert`, `tax-expert`, `compliance-regulatory-expert`, `security-expert`, `grc-authorizations-expert`, `data-mdg-expert`, `data-migration-expert`, `integration-patterns-expert`, `cloud-btp-expert`, `analytics-bi-expert`, `ai-ml-expert`, `change-ocm-expert`, `performance-engineering-expert`, `esg-sustainability-expert`, `localization-expert`, `licensing-commercial-expert`, `devops-cicd-expert`, `testing-strategy-expert`, `enterprise-architect`, `solution-architect`, `workshop-facilitator`, `pm-traditional-expert`, `pm-agile-expert`, `risk-management-expert`, `cost-value-engineering-expert`, **`clean-core-strategist`** ⭐, `sap-activate-methodologist`, `cutover-management-expert`, `hypercare-expert`, `extensibility-expert`, `industry-services-expert`, `industry-manufacturing-expert`, `industry-retail-expert`, `industry-bfsi-expert`, `industry-public-sector-expert`, `observability-expert`, `finops-btp-expert`, `central-finance-specialist`, `bpm-signavio-expert`, `ux-fiori-design-expert`

### 12 Módulos
`fi-specialist`, `co-specialist`, `sd-specialist`, `mm-specialist`, `pp-specialist`, `ps-specialist`, `pm-eam-specialist`, `qm-specialist`, `wm-ewm-specialist`, `hcm-sf-specialist`, `treasury-specialist`, `ariba-successfactors-specialist`

---

## 🧠 Pipeline ToT (4 Fases)

Inspirado en "Orquestador Metacognitivo" — aplicado por comités 5/7/9:

```
FASE 0: Definición + Autocompletado
    ↓
FASE 1: Branching (cada miembro propone 1 rama)
    ↓
FASE 2: Evaluate (QA + Steward asignan confianza 0-1)
    ↓
FASE 3: Prune & Synthesize (descartar <0.6, seleccionar ganadora)
    ↓
FASE 4: Expand (comité consenso + template)
    ↓
Cierre metacognitivo obligatorio
```

---

## 📋 Templates (22 totales)

12 v2.1 heredados + 10 nuevos v3.0:
- `tot-committee-output.md`
- `research-report.md`
- `adoption-plan.md`
- `project-plan-implementacion.md`
- `project-plan-mantenimiento.md`
- `project-plan-evolucion.md`
- `project-plan-personalizacion.md`
- `audit-report.md`
- `diagrama-funcional.md`
- `diagrama-tecnico.md`
- `mapa-integracion.md`
- `clean-core-blueprint.md`

---

## 🔍 Scripts (7 totales)

5 v2.1 + 2 nuevos v3.0:
- `select-committee.sh` (dispatch dinámico 5/7/9)
- `validate-tot-output.sh` (verificar 4 fases + metadata)

---

## 🌎 Comandos Legacy v2.1 (siguen funcionando)

Aliases en inglés mantenidos por backward compat:
`/sap:discovery`, `/sap:fit-to-standard`, `/sap:gap-analysis`, `/sap:solution-design`, `/sap:generate-abap`, `/sap:module-config`, `/sap:migration-plan`, `/sap:assess`, `/sap:sap`

---

## 🚀 Quick Start v3.0

```bash
# Paleta
/sap:menu

# Casos frecuentes
/sap:consulta "¿Qué es el Scope Item J11?"
/sap:comite "¿Cómo integrar CATS sin violar Clean Core?"
/sap:investigar "SAP Joule capabilities 2025"
/sap:adopcion AcmeCorp --hitos
/sap:ajuste-estandar CO
/sap:plan-implementacion --paso-a-paso
/sap:auditar ./plans/current-plan.md
/sap:diagrama-funcional "Order-to-Cash"
/sap:diagrama-tecnico "CATS integration" --tipo sequence
/sap:mapa-integracion AcmeCorp
/sap:clean-core AcmeCorp
```

---
*SAP Enterprise Plugin v3.0 — Diseñado y desarrollado por Javier Montaño.*

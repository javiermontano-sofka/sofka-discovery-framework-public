# SAP Enterprise Plugin v3.0 — ToT Committee Architecture

> **Diseñado y desarrollado por Javier Montaño**
> Plugin standalone para Claude Code — Zero-API, Multi-Agent, Metacognitive

## Identity

- **Plugin**: `sap-enterprise-plugin`
- **Versión**: 3.0.0
- **Prefijo comandos**: `/sap:`
- **Agente por defecto**: `@environment-orchestrator`
- **Arquitectura**: Standalone + ToT Committee + Dynamic Expert Pool

---

## What's New in v3.0

| Cambio | Detalle |
|--------|---------|
| 🧠 ToT Committee | Pipeline metacognitivo 4 fases inspirado en "Orquestador Metacognitivo" |
| 👥 58 agentes | 6 permanentes + 40 temáticos + 12 módulos (ratio 3.33x) |
| 🎲 Comité dinámico 5/7/9 | Siempre impar, seleccionado por query |
| 🎚️ 3 Modos HITL | `--auto`, `--hitos` (default), `--paso-a-paso` |
| 🇪🇸 14 comandos en español | Casos de uso estándar SAP |
| 📋 22 templates totales | 12 v2.1 + 10 nuevos v3.0 |
| 🔍 7 scripts validación | +select-committee, +validate-tot-output |
| 🏷️ Sistema de etiquetas extendido | 14 tags (10 ToT + 4 SAP-específicos) |

---

## Arquitectura v3.0

```
@environment-orchestrator (meta-conductor, default)
    │
    ├── Detecta intención + complejidad (baja/media/alta)
    ├── Selecciona comité 5/7/9 via scripts/select-committee.sh
    ├── Aplica pipeline ToT según _metacognitive-rules.md
    └── Delega a @sap-orchestrator con comité pre-armado
            │
            ├── FASE 0: Definición (autocompletados + slots)
            ├── FASE 1: Branching (cada miembro propone 1 rama)
            ├── FASE 2: Evaluate (@qa-validator + @sap-docs-steward)
            ├── FASE 3: Prune & Synthesize (ganadora con confianza >= 0.6)
            └── FASE 4: Expand (consenso + template + entrega)
                    │
                    └── Cierre metacognitivo obligatorio
```

### Composición del Comité

**Permanentes (4 siempre)**:
- `@sap-docs-steward` — validación oficial
- `@functional-lead` — perspectiva funcional
- `@abap-expert` — perspectiva técnica
- `@qa-validator` — auditoría

**Flex (1/3/5 según complejidad)**:
- Temáticos (40 disponibles)
- Módulos (12 disponibles)

**Ratio flex por tamaño**:
- Comité 5: 1 flex
- Comité 7: 2 temáticos + 1 módulo
- Comité 9: 3 temáticos + 2 módulos

---

## 10 Casos de Uso Estándar + 14 Comandos

| # | Caso | Comando Español | Modos |
|---|------|----------------|-------|
| 1 | Consulta simple | `/sap:consulta <pregunta>` | auto |
| 2 | Comité ToT | `/sap:comite <pregunta>` | 3 modos |
| 3 | Deep research | `/sap:investigar <tema>` | 3 modos |
| 4 | Adopción SAP | `/sap:adopcion <cliente>` | 3 modos |
| 5 | Fit-to-Standard | `/sap:ajuste-estandar <scope>` | 3 modos |
| 6a | Plan implementación | `/sap:plan-implementacion` | 3 modos |
| 6b | Plan mantenimiento | `/sap:plan-mantenimiento` | 3 modos |
| 6c | Plan evolución | `/sap:plan-evolucion` | 3 modos |
| 6d | Plan personalización | `/sap:plan-personalizacion` | 3 modos |
| 7 | Auditar | `/sap:auditar <plan>` | auto, hitos |
| 8 | Diagrama funcional | `/sap:diagrama-funcional <obj>` | auto, hitos |
| 9 | Diagrama técnico | `/sap:diagrama-tecnico <obj>` | auto, hitos |
| 10 | Mapa Integración | `/sap:mapa-integracion <scope>` | 3 modos |
| 11 | Clean Core Blueprint | `/sap:clean-core <scope>` | 3 modos |

---

## Pipeline Metacognitivo ToT

Ver `agents/_metacognitive-rules.md` para detalle completo.

### Criterio de activación
- Decisión arquitectónica → ToT obligatorio
- >= 2 módulos involucrados → ToT obligatorio
- Plan, diseño o artefacto no trivial → ToT obligatorio
- Comandos `/sap:comite`, `/sap:investigar` → ToT obligatorio
- Consulta factual simple → ToT opcional

### Sistema de Etiquetas (14 tags)

**ToT (10)**: `[SUPUESTO]`, `[INFERENCIA]`, `[EXTRAIDO_HILO]`, `[MEMORIA]`, `[CONOCIMIENTO]`, `[WEB]`, `[ADJUNTO]`, `[AUTOCOMPLETADO]`, `[POR_CONFIRMAR]`, `[VACIO_CRITICO]`

**SAP (4)**: `[CÓDIGO]`, `[CONFIG]`, `[DOC]`, `[STAKEHOLDER]`

### Cierre Metacognitivo Obligatorio

```
---
📊 METADATA DE RAZONAMIENTO
• Confianza global: [0.0-1.0] (target >= 0.95)
• Comité activo: [lista con nombres]
• Fuentes consultadas: [hilo | memoria | adjuntos | conocimiento | web | SAP docs | templates]
• Autocompletados realizados: [lista]
• Ambigüedades residuales: [máx 3 o "Ninguna"]
• Recomendación siguiente paso: [comando sugerido]
```

---

## Hard Rules (Inviolables)

1. **Autoría Javier Montaño** en cada archivo generado
2. **Evidence tags** obligatorios en toda afirmación
3. **Clean Core compliance** >= 5/6 (Level D rechazado)
4. **Templates mandatory** antes de generar output
5. **NUNCA precios** — solo FTE-meses
6. **QA bloqueante** — `@qa-validator` antes de delivery
7. **Anti-hallucination** — `@sap-docs-steward` valida objetos SAP
8. **Spanish (LatAm)** default
9. **Comité impar** siempre (5, 7, 9) — evita empates
10. **Cierre metacognitivo** obligatorio en outputs ToT

---

## Directory Structure

```
sap-enterprise-plugin/
├── .claude-plugin/plugin.json
├── agents/
│   ├── _defaults.md                       # Reglas base
│   ├── _metacognitive-rules.md            # Pipeline ToT
│   ├── environment-orchestrator.md        # Default agent
│   ├── sap-orchestrator.md                # Pipeline executor
│   ├── permanent/
│   │   ├── sap-docs-steward.md
│   │   ├── functional-lead.md
│   │   ├── abap-expert.md
│   │   ├── qa-validator.md
│   │   └── module-specialist-legacy.md
│   ├── thematic/                          # 40 expertos
│   │   └── {40 *.md files}
│   └── modules/                           # 12 especialistas
│       └── {12 *.md files}
├── commands/                              # 24 comandos (14 v3.0 + 10 legacy)
├── skills/                                # 11 skills
├── templates/                             # 22 templates
├── scripts/                               # 7 validators
├── references/
│   ├── body-of-knowledge/                 # 10 files
│   ├── knowledge-graphs/                  # 10 files
│   └── sap-object-catalog.md
├── hooks/hooks.json
├── settings.json                          # default: environment-orchestrator
├── CLAUDE.md                              # Este documento
└── README.md
```

---

## Quick Start

```bash
# Paleta v3.0
/sap:menu

# Casos frecuentes
/sap:consulta "¿Qué es el Scope Item J11?"
/sap:comite "¿Cómo integrar CATS sin violar Clean Core?" --hitos
/sap:investigar "SAP Joule capabilities 2025"
/sap:adopcion AcmeCorp --paso-a-paso
/sap:ajuste-estandar CO
/sap:plan-implementacion --hitos
/sap:auditar ./plans/plan-v2.md
/sap:diagrama-tecnico "Timesheet integration" --tipo sequence
/sap:mapa-integracion AcmeCorp
/sap:clean-core AcmeCorp
```

---

## Agent Pool Reference

### 40 Thematic Experts
Ver `agents/thematic/` para detalle. Incluye:
- **Core (25)**: finance, tax, compliance, security, grc, data-mdg, data-migration, integration-patterns, cloud-btp, analytics-bi, ai-ml, change-ocm, performance, esg, localization, licensing, devops, testing, enterprise-arch, solution-arch, workshop-facilitator, pm-traditional, pm-agile, risk, cost-value
- **SAP-specific (5)**: clean-core-strategist ⭐, sap-activate-methodologist, cutover-mgmt, hypercare, extensibility
- **Industry (5)**: services, manufacturing, retail, bfsi, public-sector
- **Operativos (5)**: observability, finops-btp, central-finance, bpm-signavio, ux-fiori-design

### 12 Module Specialists
Ver `agents/modules/`:
fi, co, sd, mm, pp, ps, pm-eam, qm, wm-ewm, hcm-sf, treasury, ariba-successfactors

---

## Inspirado En

Plugin inspirado en el meta-prompt "Orquestador Metacognitivo y Gestor de Contexto" (ToT Committee con 3 nodos) — adaptado a dominio SAP con comité expandido 5/7/9 impar y pool de expertos dinámico.

---

*SAP Enterprise Plugin v3.0 — Diseñado y desarrollado por Javier Montaño.*
*© 2026 — All Rights Reserved.*

# Ciclo de Robustecimiento de Skills — SAP Enterprise Plugin

> **Declaración del ciclo oficial v1.0**
> Autor: Javier Montaño · Plugin: sap-enterprise-plugin v3.3+

## Propósito

Elevar cada skill del plugin al **nivel de robustez de `skill-creator`** (Anthropic official) — con scaffolding completo, agentes especializados internos, assets deterministas, scripts ejecutables, tests evaluables, ejemplos canónicos y auditoría automatizada.

## Estándar Canónico (benchmark: skill-creator)

Toda skill debe tener esta estructura (≥ 5/7 sub-directorios poblados):

```
<skill-name>/
├── SKILL.md                    # OBLIGATORIO — frontmatter + body <500 líneas
├── agents/                     # Agentes internos específicos del dominio
│   ├── grader.md               # QA assertions para outputs del skill
│   ├── reviewer.md             # Review dominio-específico
│   └── (opcional) analyzer.md  # Analista de resultados
├── assets/                     # Templates deterministas de output
│   ├── output-template.md      # Formato canónico del deliverable
│   └── sample-output.md        # Ejemplo referencial completo
├── references/                 # Knowledge base profunda (existente)
│   ├── body-of-knowledge.md
│   ├── knowledge-graph.mmd
│   └── schemas.md              # NUEVO: esquemas de output
├── scripts/                    # Validadores / helpers ejecutables
│   └── validate-<skill>.sh     # Validación específica (complementa scripts/ plugin)
├── evals/                      # Test cases ejecutables
│   └── evals.json              # 3+ prompts con assertions
├── prompts/                    # Metaprompts / use-case prompts (existente)
│   ├── metaprompts.md
│   └── use-case-prompts.md
└── examples/                   # Salidas reales
    ├── README.md               # Índice de ejemplos
    └── sample-output.*         # md / html / xlsx-spec etc
```

**Mínimo viable (robusta)**: SKILL.md + agents/ + references/ + evals/ + examples/ (5/7 = 71%)
**Óptimo (insignia)**: 7/7 + `schemas.md` en references/

---

## Las 4 Fases del Ciclo

### Fase 1 — Audit
Script `scripts/audit-skill-robustness.sh <skill-name>` reporta score 0-7 y lista gaps.

### Fase 2 — Scaffolding
Rellenar gaps usando **el template canónico** (`references/skill-robustness-template/`).

### Fase 3 — Enriquecimiento
- Bodies de agents/ personalizados al dominio (no genéricos)
- Assets/templates con placeholders reales
- Scripts con lógica ejecutable (no stubs)
- Evals con 3+ test cases y assertions verificables
- Examples con output completo rendido

### Fase 4 — Validación
- `scripts/audit-skill-robustness.sh` → score ≥ 5/7
- `bash <skill>/scripts/validate-<skill>.sh` → exit 0
- `evals/evals.json` → al menos 1 eval probado manualmente
- `examples/` → revisado por humano

---

## Roll-out Matrix

| # | Skill | Prioridad | Asset canónico |
|---|-------|-----------|----------------|
| 1 | sap-research-notebooks | P0 piloto | Integration playbook + audio briefing template |
| 2 | sap-discovery | P0 piloto | Landscape Assessment output |
| 3 | sap-fit-to-standard | P1 | Workshop doc |
| 4 | sap-gap-analysis | P1 | Gap Registry |
| 5 | sap-solution-design | P1 | Solution Architecture Document |
| 6 | sap-activate-methodology | P2 | Phase+Gate matrix |
| 7 | sap-data-migration | P2 | Wave Plan |
| 8 | sap-integration | P2 | Integration Map |
| 9 | sap-btp-extensibility | P3 | Extension Blueprint |
| 10 | sap-testing-validation | P3 | Test Strategy doc |
| 11 | sap-change-adoption | P3 | Adoption Plan |
| 12 | sap-implementation (v1) | P3 | Module Config Checklist |

**Cadence**: 2 skills/sprint, 6 sprints. Piloto P0 en sprint 1 establece patrón.

---

## Evaluación y Mejora Continua

Inspirado en `skill-creator` evals + grader + analyzer:

1. **evals/evals.json** por skill con prompts realistas
2. Assertions verificables programáticamente via `agents/grader.md`
3. Review humano con eval-viewer style (markdown report)
4. Si un skill se queda atrás → re-enriquecer bodies/prompts/assets
5. Description optimization opcional (follow skill-creator Step 3 description optimization)

---

## Governance

- **Owner**: `@sap-orchestrator` (con insumos de `@qa-validator`)
- **Reviewer**: `@qa-validator` audita cada skill antes de promote a "robusta"
- **Release**: Un skill promote a "robusta" sólo cuando audit score ≥ 5/7 + evals verdes
- **Regresión**: Audit automático en hooks SessionStart (opcional, flag en `settings.json`)

---

## Relación con v3.x

- **v3.0**: Skills con references/ + SKILL.md
- **v3.1**: Hardening de agents + scripts
- **v3.2**: MCP NotebookLM integration
- **v3.3 (este)**: Robustness cycle — 2 skills pilot P0, roll-out plan documentado

---

## Quick Start

```bash
# 1. Audit estado actual
bash scripts/audit-skill-robustness.sh sap-discovery

# 2. Si score < 5/7 → aplicar template
cp -r references/skill-robustness-template/* skills/sap-discovery/
# (editar contenidos dominio-específicos)

# 3. Verificar
bash scripts/audit-skill-robustness.sh sap-discovery
```

---
*Plugin: sap-enterprise-plugin v3.3 — Declaración del ciclo. Diseñado por Javier Montaño.*

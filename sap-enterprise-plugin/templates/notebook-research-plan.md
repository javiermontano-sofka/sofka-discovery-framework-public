# NotebookLM Research Plan — {CLIENTE}

> **Skill**: sap-research-notebooks · **Plugin**: v3.2+
> **Author**: Diseñado por Javier Montaño

## Meta

- **Cliente**: {cliente}
- **Fecha inicio**: {YYYY-MM-DD}
- **Owner**: `@sap-orchestrator` + `@sap-docs-steward`

## 1. Bootstrap (canonical notebooks)

Ejecutar:
```bash
bash scripts/notebook-bootstrap.sh {cliente}
```

Resultado: 6 notebooks creados:

| # | Notebook | Notebook ID | Status |
|---|----------|-------------|--------|
| 1 | SAP Clean Core & S/4HANA Cloud — {cliente} | {uuid} | Empty |
| 2 | SAP Activate Methodology — {cliente} | {uuid} | Empty |
| 3 | SAP BTP Architecture — {cliente} | {uuid} | Empty |
| 4 | SAP Data Migration & Cockpit — {cliente} | {uuid} | Empty |
| 5 | SAP Module Configuration — {cliente} | {uuid} | Empty |
| 6 | SAP Integration Suite & Event Mesh — {cliente} | {uuid} | Empty |

## 2. Deep Research Plan

Para cada notebook, lanzar research con query específica:

| Notebook | Query inicial | Mode | Target sources |
|----------|--------------|------|---------------|
| Clean Core | "SAP S/4HANA Clean Core extensibility A-D levels 2025 ABAP Cloud key user" | deep | 40+ |
| Activate | "SAP Activate methodology phases deliverables quality gates fit-to-standard 2025" | deep | 40+ |
| BTP | "SAP BTP architecture subaccount CPI CAP RAP Fiori apps 2025" | deep | 40+ |
| Data Migration | "SAP S/4HANA migration cockpit Strangler Fig MDG data quality 2025" | deep | 40+ |
| Module Config | "SAP S/4HANA CO SD FI PS module configuration Scope Items 2025" | deep | 40+ |
| Integration | "SAP Integration Suite CPI iFlow Event Mesh OData V4 patterns 2025" | deep | 40+ |

Lanzar en paralelo vía `/sap:notebook-research` para los 6.

## 3. Source Validation (post-import)

`@sap-docs-steward` clasifica sources por notebook:

| Notebook | Oficiales (target ≥ 70%) | Community | Third-party | Blogs |
|----------|-------------------------|-----------|-------------|-------|
| ... | | | | |

Total sources proyecto: target 200+ (40 × 5 mínimo)

## 4. Usage Patterns (post-populated)

### Durante comandos ToT

`@environment-orchestrator` → detecta notebooks canónicos disponibles → marca `research_augmented=true`

`@sap-docs-steward` ejecuta NotebookLM-first validation para cada claim SAP:
```
mcp__notebooklm__notebook_query(
  notebook_id=<relevant>,
  query="validar {objeto SAP claim}"
)
```

### Audio briefings

Post-deliverable estratégico:
```bash
/sap:notebook-audio "SAP Activate — {cliente}" --format deep_dive --language es
```

## 5. Mantenimiento

- **Refresh cada 3-6 meses**: Relanzar research con `--force` para capturar SAP updates
- **Trigger especial**: Al detectar SAP release notes mayores (SAP S/4HANA Cloud quarterly releases)
- **Audit de sources**: Trimestralmente, `@qa-validator` revisa sources flagged como `[SUPUESTO]` y propone reclasificación

## 6. Quality Gates

- [ ] Los 6 notebooks bootstrapped
- [ ] >=3 notebooks populated (40+ sources cada uno) antes de usar en comité
- [ ] `@sap-docs-steward` cita `[NOTEBOOKLM]` tag en >= 30% de claims SAP
- [ ] Audio briefing generado para deliverables strategic (adopción, solution design)
- [ ] `.discovery/notebooks-registry.json` actualizado con todos los notebook IDs

---
*SAP Enterprise Plugin v3.2 — Diseñado por Javier Montaño.*

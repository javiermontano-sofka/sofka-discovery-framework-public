---
description: "Genera código ABAP Cloud (CDS, RAP, OData) siguiendo Clean Core Level A. SIEMPRE finaliza con QA."
user-invocable: true
argument-hint: "<requirement-description> [--pattern managed-draft|unmanaged|projection|abstract]"
---

# /sap:generate-abap — ABAP Cloud Code Generation

> Diseñado y desarrollado por **Javier Montaño**. Plugin: sap-enterprise-plugin v2.1

## ROL

Master: `@abap-expert` (generación de código)
Consulta: `@sap-docs-steward` (validar released APIs)
QA (OBLIGATORIO): `@qa-validator` (Clean Core 6/6 antes de entregar)

## OBJETIVO

Generar código ABAP Cloud (RAP Business Object + CDS + Service Definition + Binding) para el requerimiento especificado en "$ARGUMENTS". **NO entregar sin QA aprobado.**

## PROTOCOLO

### CP-0 · Requirement Analysis
`@abap-expert` abre `<thinking>`:
1. ¿Key User Extensibility resuelve? → STOP, redirigir a `@functional-lead`.
2. ¿RAP requerido? → continuar.
3. ¿Qué pattern aplica? (managed-draft | unmanaged | projection | abstract)
4. ¿Qué released APIs / CDS views consume?
5. ¿Requiere Communication Arrangement?

### CP-1 · Validate APIs via Steward
`@sap-docs-steward` valida:
- Cada CDS view usada está en Released Objects Catalog
- Cada released class/API existe
- BAPIs NO released → usar alternativa CDS/OData

Si algún objeto no valida → `@abap-expert` re-diseña o marca `[SUPUESTO]`.

### CP-2 · Generate Code
`@abap-expert` genera:

```
.abap-cloud-extension/
├── cds/
│   ├── ZI_{Entity}.cds           # Interface layer (basic)
│   ├── ZR_{Entity}.cds           # Root view
│   └── ZC_{Entity}.cds           # Consumption view (with UI annotations)
├── behavior/
│   └── ZR_{Entity}.bdef          # Behavior definition
├── class/
│   └── ZBP_R_{Entity}.clas.abap  # Behavior implementation
├── service/
│   ├── ZSD_{Entity}.srvd         # Service definition
│   └── ZSB_{Entity}.srvb         # Service binding (OData V4)
└── README.md                     # Documentation
```

### CP-3 · QA Validation (BLOQUEANTE)
`@qa-validator` ejecuta:

```bash
bash scripts/validate-clean-core.sh .abap-cloud-extension/
```

Checks:
- [ ] Zero `SELECT FROM <standard-table>` directos
- [ ] Solo released APIs usadas
- [ ] Syntax "ABAP for Cloud Development"
- [ ] Zero classic ABAP statements (WRITE, REPORT, Dynpro)
- [ ] ABAP Unit tests presentes
- [ ] Fiori Elements metadata annotations
- [ ] Communication Arrangement documentada

**Threshold**: 6/6 o vuelve al `@abap-expert`.

### CP-F · Delivery
Si QA aprueba:
- Output con tag `[CÓDIGO]` referenciando cada archivo
- Communication Arrangements a configurar por admin
- Fiori Tile catalog assignments

## OUTPUT

```markdown
# ABAP Cloud Extension: {Entity Name}

## Requirement
{description}

## Design Pattern
{managed-draft | unmanaged | projection | abstract}

## Released APIs Used [DOC]
- {CDS view} (validated by @sap-docs-steward)
- {API class}

## Files Generated [CÓDIGO]
- `.abap-cloud-extension/cds/ZI_{Entity}.cds` (N lines)
- `.abap-cloud-extension/behavior/ZR_{Entity}.bdef`
- ...

## QA Report
Clean Core Score: 6/6 ✅

## Post-Deploy Steps
1. Import via ADT
2. Configure Communication Arrangement: {name}
3. Assign Fiori Tile to catalog
```

## RESTRICCIONES

- NUNCA acceso directo a tablas SAP estándar
- NUNCA classic ABAP statements
- NUNCA unreleased BAPIs
- Ningún código sale sin QA 6/6

---
*Generado por SAP Enterprise Plugin v2.1 — Diseñado y desarrollado por Javier Montaño.*

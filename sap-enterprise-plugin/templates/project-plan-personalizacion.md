# Plan de Personalización SAP (Clean Core) — {CLIENTE}

> **Skill**: sap-plan-personalizacion · **Author**: Javier Montaño

## Executive Summary

- **Extensions total**: {N}
- **Distribución**: {k KU, r RAP, b BTP}
- **Clean Core compliance**: {average X/6}
- **Effort**: {FTE-meses}

## 1. Extension Inventory

Consolidado del Gap Registry:

| Gap ID | Module | Description | Proposed Extension |
|--------|--------|-------------|-------------------|
| GAP-CO-001 | CO | Custom allocation | Key User field + BRF+ |
| GAP-SD-003 | SD | Custom pricing | ABAP Cloud RAP |

## 2. Extension Decision Tree per Gap

```
GAP-CO-001:
  → Standard: No (insuficiente)
  → Key User Custom Field + BRF+: YES
  → Decision: Extend-KU
  → Clean Core: 10/10

GAP-SD-003:
  → Standard: No
  → Key User: Insuficiente (requiere nueva lógica compleja)
  → ABAP Cloud RAP: YES
  → Decision: Extend-RAP
  → Clean Core: 8/10
```

## 3. Development Roadmap

| Sprint | Extensions | Dev Effort |
|--------|-----------|-----------|
| S1 | GAP-CO-001 | 5d |
| S2 | GAP-SD-003 | 15d |

## 4. ADRs Collection

Links to individual ADR files:
- ADR-001: {title}
- ADR-002: {title}

## 5. ATC Clean Core Check Strategy

- Variant: `ABAP_CLEAN_CORE_DEVELOPMENT`
- Frequency: per commit + nightly
- Threshold: zero Level D violations

## 6. Testing Strategy per Type

| Extension Type | Testing Approach |
|---------------|------------------|
| Key User | Sandbox sim + business user UAT |
| ABAP Cloud RAP | ABAP Unit + Fiori E2E |
| BTP Side-by-side | CAP tests + integration smoke |

## 7. Deployment Plan

- **DEV**: continuous
- **QAS**: weekly transport
- **PRD**: per go-live window

## 8. Documentation

- Confluence page per extension
- README per repo
- ADR immutable

## 9. Lifecycle Governance

- Quarterly review: "¿esta extensión sigue siendo necesaria?"
- Annual Clean Core audit

---

📊 METADATA DE RAZONAMIENTO
• Confianza global: {X.XX}
• Recomendación siguiente paso: `/sap:generate-abap` para cada Extend-RAP

---
*SAP Enterprise Plugin v3.0 — Diseñado por Javier Montaño.*

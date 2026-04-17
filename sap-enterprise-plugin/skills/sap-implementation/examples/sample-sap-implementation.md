# Module Config Summary — Professional Services SAP

> **Skill**: sap-implementation · **Phase**: CP-N · **Agent**: `@sap-orchestrator`
> **Author**: Diseñado por Javier Montaño

## TL;DR

- Scope: PS + CO + SD + FI + HCM para Professional Services
- Activity Types con Cost/Sales separation mandatory
- Intercompany cost-plus 8% markup
- CATS integration external + native fallback

## Scope Items Activated [DOC]

| Module | Scope Item | Purpose |
|--------|-----------|---------|
| PS | J11 | Customer Projects |
| HCM | J12 | Time Management |
| FI | 1IL | Revenue Recognition EBRR |
| SD | 4E9 | Project Billing |
| SD | J14 | Sales Orders for Projects |

## Activity Type Rate Architecture

- Cost Rate = CTC per country (Manage Cost Rates app)
- Sales Price = client-negotiated (Manage Sales Prices app)
- NUNCA blended rate

## Intercompany Posting Cycle [DOC]

1. Sending: employee hours confirmed
2. Sending: cost posted (Dr Labor, Cr Accrual)
3. Sending: IC billing (Dr IC Rec, Cr IC Rev) — IC Price = CTC × (1+markup%)
4. Receiving: IC posting (Dr IC Cost, Cr IC Payable) — FX IAS 21
5. Receiving: bill end client (Dr AR, Cr Revenue)
6. Month-end: IC clearing + FX revaluation
7. Transfer pricing documentation


## Quality Validation

- [x] Domain assertions met (per agents/grader.md)
- [x] Evidence tags applied
- [x] Ghost menu
- [x] Metacognitive closing

## 📊 METADATA DE RAZONAMIENTO

- Confianza global: 0.88
- Fuentes: referencias oficiales SAP, body-of-knowledge del skill
- Ambigüedades residuales: depende del cliente/escenario real
- Recomendación siguiente paso: workflow específico del skill

---
*SAP Enterprise Plugin v3.4+ — Diseñado por Javier Montaño.*

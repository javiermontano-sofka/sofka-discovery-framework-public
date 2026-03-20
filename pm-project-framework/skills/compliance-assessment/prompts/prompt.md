---
id: compliance-assessment
title: "Compliance Assessment"
description: "Regulatory compliance audit (GDPR, PCI-DSS, ISO 27001)"
nlhp-version: "3.0"
---

# Compliance Assessment

> NL-HP v3.0 — Prompt ejecutable del skill `metodologia-compliance-assessment`

## Invocación

```
Analiza {} usando el skill compliance-assessment.
Variante: {ejecutiva|técnica} | Formato: {markdown|html|dual}
```

## Parámetros

| Parámetro | Default | Opciones |
|-----------|---------|----------|
| `{MODO}` | piloto-auto | piloto-auto, desatendido, supervisado, paso-a-paso |
| `{FORMATO}` | markdown | markdown, html, dual |
| `{VARIANTE}` | técnica | ejecutiva (~40%), técnica (full) |

## Descripción

Regulatory compliance audit (GDPR, PCI-DSS, ISO 27001). Sigue el protocolo NL-HP v3.0 con evidence tagging obligatorio.

## Restricciones

- NUNCA inventar datos — todo claim tagged [CÓDIGO], [CONFIG], [DOC], [INFERENCIA] o [SUPUESTO]
- NUNCA precios — solo drivers y magnitudes
- Si >30% claims son [SUPUESTO], mostrar banner de advertencia
- Output en español (registro empresarial latinoamericano)

## Skill Reference

Ver `SKILL.md` para protocolo completo, secciones de entrega, y trade-off matrix.

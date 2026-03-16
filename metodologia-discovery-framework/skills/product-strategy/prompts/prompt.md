---
id: product-strategy
title: "Product Strategy"
description: "Product-market fit assessment and roadmap design"
nlhp-version: "3.0"
---

# Product Strategy

> NL-HP v3.0 — Prompt ejecutable del skill `metodologia-product-strategy`

## Invocación

```
Analiza {} usando el skill product-strategy.
Variante: {ejecutiva|técnica} | Formato: {markdown|html|dual}
```

## Parámetros

| Parámetro | Default | Opciones |
|-----------|---------|----------|
| `{MODO}` | piloto-auto | piloto-auto, desatendido, supervisado, paso-a-paso |
| `{FORMATO}` | markdown | markdown, html, dual |
| `{VARIANTE}` | técnica | ejecutiva (~40%), técnica (full) |

## Descripción

Product-market fit assessment and roadmap design. Sigue el protocolo NL-HP v3.0 con evidence tagging obligatorio.

## Restricciones

- NUNCA inventar datos — todo claim tagged [CÓDIGO], [CONFIG], [DOC], [INFERENCIA] o [SUPUESTO]
- NUNCA precios — solo drivers y magnitudes
- Si >30% claims son [SUPUESTO], mostrar banner de advertencia
- Output en español (registro empresarial latinoamericano)

## Skill Reference

Ver `SKILL.md` para protocolo completo, secciones de entrega, y trade-off matrix.

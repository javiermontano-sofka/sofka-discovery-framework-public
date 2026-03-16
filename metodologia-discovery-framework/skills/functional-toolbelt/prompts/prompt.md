---
id: functional-toolbelt
title: "Functional Toolbelt"
description: "Functional analysis toolkit with 6 structured tools"
nlhp-version: "3.0"
---

# Functional Toolbelt

> NL-HP v3.0 — Prompt ejecutable del skill `metodologia-functional-toolbelt`

## Invocación

```
Analiza {} usando el skill functional-toolbelt.
Variante: {ejecutiva|técnica} | Formato: {markdown|html|dual}
```

## Parámetros

| Parámetro | Default | Opciones |
|-----------|---------|----------|
| `{MODO}` | piloto-auto | piloto-auto, desatendido, supervisado, paso-a-paso |
| `{FORMATO}` | markdown | markdown, html, dual |
| `{VARIANTE}` | técnica | ejecutiva (~40%), técnica (full) |

## Descripción

Functional analysis toolkit with 6 structured tools. Sigue el protocolo NL-HP v3.0 con evidence tagging obligatorio.

## Restricciones

- NUNCA inventar datos — todo claim tagged [CÓDIGO], [CONFIG], [DOC], [INFERENCIA] o [SUPUESTO]
- NUNCA precios — solo drivers y magnitudes
- Si >30% claims son [SUPUESTO], mostrar banner de advertencia
- Output en español (registro empresarial latinoamericano)

## Skill Reference

Ver `SKILL.md` para protocolo completo, secciones de entrega, y trade-off matrix.

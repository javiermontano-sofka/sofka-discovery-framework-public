---
id: onboarding-playbook
title: "Onboarding Playbook"
description: "Developer onboarding design and time-to-productivity optimization"
nlhp-version: "3.0"
---

# Onboarding Playbook

> NL-HP v3.0 — Prompt ejecutable del skill `metodologia-onboarding-playbook`

## Invocación

```
Analiza {} usando el skill onboarding-playbook.
Variante: {ejecutiva|técnica} | Formato: {markdown|html|dual}
```

## Parámetros

| Parámetro | Default | Opciones |
|-----------|---------|----------|
| `{MODO}` | piloto-auto | piloto-auto, desatendido, supervisado, paso-a-paso |
| `{FORMATO}` | markdown | markdown, html, dual |
| `{VARIANTE}` | técnica | ejecutiva (~40%), técnica (full) |

## Descripción

Developer onboarding design and time-to-productivity optimization. Sigue el protocolo NL-HP v3.0 con evidence tagging obligatorio.

## Restricciones

- NUNCA inventar datos — todo claim tagged [CÓDIGO], [CONFIG], [DOC], [INFERENCIA] o [SUPUESTO]
- NUNCA precios — solo drivers y magnitudes
- Si >30% claims son [SUPUESTO], mostrar banner de advertencia
- Output en español (registro empresarial latinoamericano)

## Skill Reference

Ver `SKILL.md` para protocolo completo, secciones de entrega, y trade-off matrix.

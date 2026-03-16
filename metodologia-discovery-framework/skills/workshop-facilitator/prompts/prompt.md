---
id: "workshop-facilitator"
title: "Workshop Facilitator"
description: ">"
nlhp-version: "3.0"
license: "GPL-3.0"
---

# Workshop Facilitator

## Invocación

> Ejecuta el skill **workshop-facilitator** sobre el contexto actual del proyecto.

```
/metodologia-discovery-framework:discovery — activar como parte del pipeline
```

## Parámetros

| Parámetro | Tipo | Default | Descripción |
|-----------|------|---------|-------------|
| {MODO} | enum | piloto-auto | Nivel de intervención humana |
| {FORMATO} | enum | markdown | Formato de salida |
| {VARIANTE} | enum | tecnica | Nivel de detalle |
| {PROFUNDIDAD} | enum | tecnico | Profundidad del análisis |

## Descripción

Este prompt activa el skill **workshop-facilitator** dentro del pipeline de discovery de MetodologIA.

>

### Entregable esperado

Documento estructurado con:
- TL;DR (3-5 bullets)
- Análisis detallado por sección
- Tablas con indicadores de estado
- Diagramas Mermaid cuando aplique
- Recomendaciones priorizadas
- Riesgos y mitigaciones

## Restricciones

1. Markdown-excellence obligatorio
2. Evidence tagging: [CÓDIGO], [CONFIG], [DOC], [INFERENCIA], [SUPUESTO]
3. NUNCA precios — solo drivers, inductores y magnitudes
4. Margen de innovación 5%
5. Copyleft GPL-3.0

## Skill Reference

Skill: `workshop-facilitator/SKILL.md`
Framework: MetodologIA Discovery Framework
License: GPL-3.0 (Copyleft)

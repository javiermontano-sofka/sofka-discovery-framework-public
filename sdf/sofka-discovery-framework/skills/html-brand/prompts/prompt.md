---
id: html-brand
title: "HTML Brand"
description: "Brand-compliant HTML generation with Sofka Design System v5"
nlhp-version: "3.0"
---

# HTML Brand

> NL-HP v3.0 — Prompt ejecutable del skill `sofka-html-brand`

## Invocación

```
Genera HTML branded para {} usando el skill html-brand.
Variante: {ejecutiva|técnica|pipeline} | Formato: {html|dual}
```

## Parámetros

| Parámetro | Default | Opciones |
|-----------|---------|----------|
| `{MODO}` | piloto-auto | piloto-auto, desatendido, supervisado, paso-a-paso |
| `{FORMATO}` | html | html, dual |
| `{VARIANTE}` | técnica | ejecutiva (~40%), técnica (full), pipeline (batch .md→.html) |

## Protocolo de Ejecución

### Paso 1 — Cargar Referencias

```
Read ${CLAUDE_SKILL_DIR}/references/design-tokens.md
```

Si es batch o pipeline:
```
Read ${CLAUDE_SKILL_DIR}/references/operations-guide.md
```

### Paso 2 — Clasificar Modo

| Señal | Modo |
|-------|------|
| Un solo documento, audiencia C-level | Ejecutiva, hand-built |
| Un solo documento, audiencia técnica | Técnica, hand-built |
| Directorio con 3+ archivos .md | Pipeline batch |
| Archivo .md individual para convertir | Pipeline single |

### Paso 3 — Generar

**Hand-built:** Componer HTML sección por sección usando componentes DS v5.

**Pipeline:**
1. Parsear markdown con `npx marked --gfm`
2. Post-procesar: evidence badges `[DOC]` → `<span class="badge badge-doc">DOC</span>`
3. Post-procesar: mermaid code blocks → `<pre class="mermaid">`
4. Extraer h2 para TOC (max 8 links)
5. Determinar metadata per-deliverable (título, fase, versión, subtítulo, 4 KPIs)
6. Ensamblar: head → skip-link → banner? → hero → TOC → main → footer → JS

### Paso 4 — Validar

Ejecutar checklist de Validation Gate (ver SKILL.md). Verificar:
- Body bg `#FFFFFF`, texto `--sofka-gray-900`
- Cards/TOC bg `--sofka-gray-50`
- Tablas: header `--sofka-gray-900`/blanco, celdas `--sofka-gray-100`/negro
- Mermaid: `theme: 'base'`, fills claros, texto negro
- Éxito = dorado (#FFD700), NUNCA verde
- WCAG AA en toda combinación texto/fondo

## Restricciones

- NUNCA inventar datos — todo claim tagged [CÓDIGO], [CONFIG], [DOC], [INFERENCIA] o [SUPUESTO]
- NUNCA precios — solo drivers y magnitudes
- NUNCA verde para éxito — solo dorado (#FFD700)
- NUNCA texto blanco sobre fondo crema (#EFEAE4)
- NUNCA Mermaid `theme: 'default'` — siempre `theme: 'base'` con variables explícitas
- Si >30% claims son [SUPUESTO], mostrar banner de advertencia
- Output en español (registro empresarial latinoamericano)

## Skill Reference

Ver `SKILL.md` para protocolo completo, anti-patterns, trade-offs, y validation gate.

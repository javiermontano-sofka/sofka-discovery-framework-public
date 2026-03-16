# Ejemplos — Input Analysis

> **Skill:** input-analysis | **Framework:** MetodologIA Discovery Framework
> **Autor:** Javier Montaño | **Fecha:** 13 de marzo de 2026
> © Comunidad MetodologIA

---

## Índice de Ejemplos

| Archivo | Formato | Contenido | Audiencia |
|---------|---------|-----------|-----------|
| [`sample-output.md`](sample-output.md) | Markdown | Análisis completo de input desordenado (5 pases) | Equipo técnico, arquitectos, conductores de discovery |
| [`sample-output.html`](sample-output.html) | HTML (MetodologIA Design System v4) | Misma información en formato presentable | Liderazgo, stakeholders, demos internas |

---

## Guía de Formatos

### Markdown (`sample-output.md`)

- **Cuándo usar:** Trabajo interno, revisiones técnicas, integración con pipeline de discovery.
- **Ventajas:** Versionable en Git, parseable por herramientas, ligero.
- **Estándar:** Markdown-excellence (TL;DR, tablas, callouts, secciones claras).

### HTML (`sample-output.html`)

- **Cuándo usar:** Demos a clientes, presentaciones internas, documentación formal.
- **Ventajas:** Visualmente pulido, responsive, imprimible, MetodologIA-branded.
- **Estándar:** Design System v4 — colores primario (#6366F1), oscuro (#1A1A2E), success (#22D3EE). Tipografía Inter. Sin verde para estados de éxito.

---

## Qué Demuestra el Ejemplo

El ejemplo procesa un input real de un escenario de pre-sales discovery en MetodologIA:

> "ncsito q m ayuden cn el tema dl banco ese d la reunion xq el jefe sta presinando y no c q acer cn lo dl legasy ese q nadie entiende"

### Pases Demostrados

| Pase | Qué Muestra |
|------|-------------|
| **1 — Superficie** | Detección de 14 errores categorizados (afán 79%, ortografía 14%, spanglish 7%) con tabla de correcciones y confianza por corrección |
| **2 — 5 Porqués** | Cadena de causa raíz con parada natural en nivel 4, preguntas abiertas declaradas explícitamente |
| **3 — 7 Entonces-qués** | Trazado de impacto hasta nivel 6 (estratégico) con calibración PREMIUM |
| **4 — Intención** | Análisis de brechas por tipo (alcance, contexto, emocional, vocabulario, expertise) con "real ask" formulado |
| **5 — Reformulación** | Prompt estructurado completo con OBJETIVO, CONTEXTO, INTENCIÓN, RESTRICCIONES, OUTPUT ESPERADO y CALIBRACIÓN |

---

## Recursos Relacionados

### Referencias Teóricas
- [`../references/body-of-knowledge.md`](../references/body-of-knowledge.md) — Fuentes primarias que fundamentan la metodología de los 5 pases
- [`../references/state-of-the-art.md`](../references/state-of-the-art.md) — Tendencias 2024-2028 en procesamiento de inputs
- [`../references/knowledge-graph.mmd`](../references/knowledge-graph.mmd) — Grafo de relaciones del skill en formato Mermaid

### Prompts de Uso
- [`../prompts/use-case-prompts.md`](../prompts/use-case-prompts.md) — 7 prompts listos para usar por caso de uso
- [`../prompts/metaprompts.md`](../prompts/metaprompts.md) — 5 meta-estrategias para orquestar el análisis

### Skill Principal
- [`../SKILL.md`](../SKILL.md) — Definición completa del skill con protocolo, parámetros y reglas

---

## Cómo Generar Nuevos Ejemplos

Para generar un nuevo ejemplo con la skill:

1. **Input desordenado + vago:** Usar modo `integral` (5 pases).
2. **Input con errores pero intención clara:** Usar modo `superficie` (pase 1 solamente).
3. **Input limpio pero ambiguo:** Usar modo `intencion` (pase 4 solamente).
4. **Input claro pero alcance vago:** Usar modo `reformulacion` (pases 2, 4, 5).

Cada ejemplo generado debe incluir la tabla de resumen final con: errores de superficie, causa raíz, profundidad de impacto, calibración, brechas principales y confianza en reformulación.

---

**Autor:** Javier Montaño | **Última actualización:** 13 de marzo de 2026
© Comunidad MetodologIA

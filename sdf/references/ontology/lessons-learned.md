# Lecciones Aprendidas

> Sofka SAGE — Ontología viva
> Documento vivo que se actualiza durante las sesiones de discovery con correcciones, patrones y decisiones.

---

## Correcciones recibidas

<!-- Registrar aquí correcciones explícitas del usuario sobre comportamiento, formato, contenido o proceso. Formato: fecha, corrección, acción tomada. -->

_(vacío — se actualiza durante sesiones)_

---

## Patrones identificados

<!-- Registrar aquí patrones recurrentes observados en múltiples sesiones de discovery: preferencias del usuario, configuraciones frecuentes, flujos típicos, decisiones comunes. -->

_(vacío — se actualiza durante sesiones)_

---

## Anti-patrones a evitar

<!-- Registrar aquí comportamientos que generaron problemas o fueron explícitamente rechazados por el usuario. Incluir contexto para evitar repetición. -->

_(vacío — se actualiza durante sesiones)_

---

## Decisiones del usuario

<!-- Registrar aquí decisiones explícitas del usuario que establecen precedente para futuras sesiones: preferencias de formato, tipo de servicio predeterminado, nivel de detalle, exclusiones. -->

_(vacío — se actualiza durante sesiones)_

---

## Instrucciones de uso

Este documento es un registro acumulativo. Las entradas se agregan al final de cada sección correspondiente con el siguiente formato:

```markdown
### [{fecha}] {título breve}
- **Contexto:** {situación que motivó el aprendizaje}
- **Aprendizaje:** {qué se aprendió o corrigió}
- **Acción:** {qué cambio se implementó o debe implementarse}
```

El `discovery-conductor` debe consultar este documento al inicio de cada sesión para evitar repetir errores y respetar decisiones previas del usuario.

---

*Sofka SAGE — La excelencia no se improvisa, se diseña.*

---

## Lecciones portadas desde SAP Enterprise Plugin v4.0 (2026-04-17)

Ten lecciones destiladas del viaje SAP v2.0 → v4.0 (ver retrospectiva en `Desktop/sap-discovery-plugin-WIP/RETROSPECTIVA-SAP-v2-a-v4.md`) aplicadas ahora a SDF v13:

1. **FASE 0 attachments obligatoria** — si el usuario pasa archivos (.csv .xlsx .docx .pdf .pptx .html .py .tsx .sql .json .yaml .xml), normalizarlos a priming-rag docs ANTES del primer branching. Sin priming docs, el Think Tank alucina contenidos.
2. **Evidence tag `[ADJUNTO]` con prioridad 2** — por encima de `[CONFIG]` y `[DOC]` porque representa input directo del cliente. `@quality-guardian` falla el deliverable si el tag no tiene priming doc.
3. **Subagents SIN `Agent` tool** — subagents no pueden spawnear subagents (regla SDK). Solo orchestrators pueden delegar.
4. **Shared rules (`_*.md`) SIN `name:` frontmatter** — si tienen `name:`, Claude los carga como agentes invocables. Son documentos de referencia.
5. **Descripciones action-oriented** — `"Use this subagent when..."` en vez de `"Experto en..."`. Mejora el auto-routing del modelo.
6. **venv local `scripts/.venv/`, no global** — aísla deps, evita conflictos con Python del sistema. Python 3.13 explícito.
7. **jinja2 para HTML render, no pandoc** — control total de tokens CSS, posibilidad de regex para auto-highlight de evidence tags como spans coloreados.
8. **MCP stdio embebido (no HTTP)** — `.mcp.json` bundled con el plugin → zero-setup para el usuario.
9. **Ontology en `references/`, no `/agents/`** — `/agents/` es sólo para entidades invocables; los docs de referencia van aparte.
10. **Comité impar 5/7/9 para consenso por mayoría** — evita empates en votación de ramas ToT.

### Fuentes

- SAP v4.0 changelog (commit `d9a9137`)
- `sap-enterprise-plugin/agents/permanent/attachment-processor.md`
- `sap-enterprise-plugin/templates/brand-html-base.html`
- `sap-enterprise-plugin/.mcp.json`
- Retrospectiva deliverable (md + html brand-ready)

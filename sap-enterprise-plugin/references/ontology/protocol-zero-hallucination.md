# Protocolo Zero-Hallucination

## Regla raíz

Toda afirmación en un deliverable debe llevar un tag de evidencia. Sin tag → no es una afirmación, es prosa descriptiva.

## Tags y prioridad

Priority order (higher beats lower en caso de conflicto):

```
[CÓDIGO] > [ADJUNTO] > [CONFIG] > [DOC] > [NOTEBOOKLM] > [STAKEHOLDER] > [INFERENCIA] > [SUPUESTO]
```

| Tag | Significado | Requiere |
|-----|-------------|----------|
| `[CÓDIGO]` | Derivado de lectura directa de código fuente | ruta + línea |
| `[ADJUNTO]` | Extraído de archivo ingestado por `@attachment-processor` | locator (sheet=/page=/heading=/...) |
| `[CONFIG]` | Parámetro leído de configuración (IMG, customizing, YAML, .env) | ruta |
| `[DOC]` | Documentación oficial SAP Help / notas OSS / manual cliente | URL o nombre doc |
| `[NOTEBOOKLM]` | Respuesta de MCP notebook_query contra fuentes curadas | notebook_id + query |
| `[STAKEHOLDER]` | Afirmado por persona identificada en workshop/entrevista | rol + fecha |
| `[INFERENCIA]` | Deducción lógica a partir de dos o más evidencias directas | (opcional) evidencias base |
| `[SUPUESTO]` | Hipótesis sin evidencia, a validar | banner de riesgo |

## Umbrales

- `>30%` del deliverable con `[SUPUESTO]` → banner `⚠️ ALTA INCERTIDUMBRE — requerir validación`
- `severity=CRÍTICO + [SUPUESTO]` → flag al risk register, NO proceder sin validar
- `[VACIO_CRITICO]`: información mínima faltante — pausa la pipeline

## FASE 0 (nueva en v4.0)

Antes de FASE R (research), si hay adjuntos, `@attachment-processor` genera priming-rag docs. Cualquier `[ADJUNTO]` tag sin priming doc correspondiente = hard fail.

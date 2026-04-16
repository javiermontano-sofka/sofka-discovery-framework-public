# RAG Priming Policy — Sovereign Architect

> SA Ontología Viva · Reglas de priming, carga progresiva y calibración de contexto.

---

## TL;DR

El RAG priming alimenta al Sovereign Architect con conocimiento del repo y dominio antes de actuar. Sin priming, el análisis opera con supuestos. Con priming, opera con hechos. Esta política define cuándo primar, cómo nombrar archivos, niveles de carga y criterios de calidad.

---

## Cuándo Primar

| Trigger | Acción | Comando |
|---------|--------|---------|
| Nuevo codebase (sin `sa/`) | Priming completo obligatorio | `/sa:prime` |
| Nueva sesión (`sa/` existe) | Verificar `calibration-digest.md` — si stale, re-prime | Auto via `auto-prime-check.sh` |
| Después de cambios mayores | Re-prime selectivo del dominio afectado | `/sa:prime --scope={dominio}` |
| Adjunto nuevo (URL, PDF, XLSX) | Generar companion RAG file + recalibrar | Auto via `post-prime-calibrate.sh` |
| Usuario provee contexto verbal | Capturar como `priming-rag-{topic}.md` | Manual |

### Auto-Priming Trigger

Si no existe `sa/calibration-digest.md` al iniciar sesión:
1. Se crea marker `sa/needs-priming`
2. Se sugiere `/sa:prime` al usuario
3. Se activa modo conservador (todo queda como `[SUPUESTO]` hasta priming)

---

## Naming Convention

```
priming-rag-{topic}.md
```

Ejemplos:
- `priming-rag-architecture-overview.md`
- `priming-rag-security-posture.md`
- `priming-rag-data-model.md`
- `priming-rag-ci-cd-pipeline.md`
- `priming-rag-tech-stack.md`

Ubicación: `references/priming-rag/` o `sa/priming-rag/` (generados por sesión).

---

## Carga Progresiva (3 niveles)

| Nivel | Nombre | Qué se carga | Cuándo |
|-------|--------|---------------|--------|
| **L1** | Metadata | TL;DR + tech stack + estructura de directorios | Siempre al inicio |
| **L2** | Core | L1 + patrones principales + dependencias + arquitectura | Al activar análisis |
| **L3** | Deep | L2 + referencias completas + ejemplos + anti-patterns | Al activar skills especializados |

**Regla**: Nunca cargar L3 sin necesidad. El contexto es finito — protegerlo.

---

## Manejo de Adjuntos

| Tipo de Input | Acción | Archivo Generado |
|---------------|--------|------------------|
| URL de documentación | Fetch + extraer + resumir | `priming-rag-{dominio}-docs.md` |
| PDF técnico | Extraer texto + estructurar | `priming-rag-{nombre-pdf}.md` |
| XLSX / CSV | Analizar esquema + métricas clave | `priming-rag-{nombre-data}.md` |
| Imagen de arquitectura | Describir + modelar en Mermaid | `priming-rag-{nombre}-diagram.md` |
| Contexto verbal del usuario | Capturar estructuradamente | `priming-rag-{topic}-user-input.md` |

Después de generar cualquier companion RAG file → ejecutar `post-prime-calibrate.sh` para recalibrar skills activos.

---

## Criterios de Calidad por RAG File

Cada archivo `priming-rag-*.md` debe cumplir:

| Criterio | Requisito |
|----------|-----------|
| Autocontenido | Comprensible sin leer otros archivos |
| Longitud | 200–500 líneas (ni telegráfico ni novela) |
| Evidencia | Todo etiquetado con `[HECHO]`, `[INFERENCIA]` o `[SUPUESTO]` |
| Estructura | TL;DR → Principios → Patrones → Anti-patterns → Decision Matrix |
| Actualizado | Timestamp de última actualización en header |

---

## Protocolo de Calibración

Después de cada priming o re-priming:

1. Actualizar `sa/calibration-digest.md` con resumen del estado
2. Recalcular qué skills están activables (basado en evidencia disponible)
3. Registrar en `sa/session-changelog.md`
4. Si hay gaps críticos → declarar explícitamente qué falta

---

## Cross-References

- Protocolo de evidencia → `protocol-evidence.md`
- Automatización de sesión → `session-automation.md`
- Skills activables por dominio → `skills-catalog.md`

---

*Sovereign Architect v2.0 — Evidence over enthusiasm.*
*JM Labs · Javier Montaño.*

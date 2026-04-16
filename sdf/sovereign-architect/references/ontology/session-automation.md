# Session Automation — Sovereign Architect

> SA Ontología Viva · Hooks, scripts, estado de sesión y automatización.

---

## Ciclo de Vida de Sesión

### Al iniciar sesión (SessionStart)

```
secrets-scan.sh → scan-artifacts.sh → session-init.sh → auto-prime-check.sh → ghost-menu-inject.sh → session-changelog.sh
```

| Paso | Script | Resultado |
|------|--------|-----------|
| 1 | `secrets-scan.sh` | G0 Security Gate — bloquea si hay secrets expuestos |
| 2 | `scan-artifacts.sh` | Detecta artefactos generados previamente |
| 3 | `session-init.sh` | Detecta tech stack, genera contexto |
| 4 | `auto-prime-check.sh` | Verifica si el repo tiene priming-rag |
| 5 | `ghost-menu-inject.sh` | Prepara navegación contextual |
| 6 | `session-changelog.sh` | Inicia log de acciones |

### Después de Write/Edit (PostToolUse)

```
session-changelog.sh → context-prune.sh → post-prime-calibrate.sh
```

| Paso | Script | Resultado |
|------|--------|-----------|
| 1 | `session-changelog.sh` | Registra la acción en el log |
| 2 | `context-prune.sh` | Comprime contexto si >150 líneas |
| 3 | `post-prime-calibrate.sh` | Recalibra si se modificaron priming-rag files |

---

## Directorio sa/ (Session State)

Generado automáticamente en el directorio de trabajo:

| Archivo | Propósito |
|---------|-----------|
| `SESSION-README.md` | Contexto del repo (stack, estructura, señales) |
| `SESSION-CLAUDE.md` | Instrucciones de sesión (curado del CLAUDE.md) |
| `calibration-digest.md` | Estado de priming (qué sabe SA del repo) |
| `ghost-menu.md` | Navegación contextual |
| `session-changelog.md` | Log timestamped de todas las acciones |
| `session-state.json` | Estado del pipeline (fase actual, gates pasados) |
| `.sa-secrets-audit.log` | Resultados del G0 security scan |

### session-state.json Schema

```json
{
  "phase": "discovery",
  "gates_passed": ["G0"],
  "artifacts_generated": [],
  "movement": "REVIEW",
  "evidence_stats": {
    "hecho": 0,
    "inferencia": 0,
    "supuesto": 0
  },
  "priming_status": "none|partial|full",
  "started_at": "2026-03-17T10:00:00Z"
}
```

---

## Progressive Loading (L1/L2/L3)

| Nivel | Contenido | Costo | Cuándo |
|-------|-----------|-------|--------|
| **L1** | Frontmatter + TL;DR | ~20 líneas/skill | Siempre (mínimo) |
| **L2** | SKILL.md completo | ~200 líneas/skill | Cuando el skill es activado |
| **L3** | SKILL.md + references/ + examples/ | ~500+ líneas/skill | Deep dive solicitado |

El `lazy-load-resolver.sh` determina qué nivel cargar por fase y movimiento.

---

## Auto-Priming

Si no existen archivos `priming-rag-*.md` en `references/priming-rag/`:
1. Se crea marker `needs-priming`
2. Se sugiere `/sa:prime`
3. El usuario puede ejecutar priming o continuar sin él

Cada artefacto generado que sea knowledge reusable se persiste como `priming-rag-{nombre}.md`.

---

*Sovereign Architect — Automation serves discipline, not convenience.*

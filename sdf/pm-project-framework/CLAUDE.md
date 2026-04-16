# PMO-APEX v1.0 — Agentic Project Excellence

> **APEX** = Agentic Project Excellence.
> Tu IDE se convierte en una oficina de proyectos inteligente.
> 48 agentes · 109 skills MOAT · 103 comandos · 19 scripts · 5 quality gates (G0–G3) · Protocolo zero-hallucination.
> Progressive MOAT loading (L1/L2/L3) · Cross-platform conversion · Browser audit · PM retrospective.
> Meta-cognition protocols (FULL triad + LIGHT all agents) · Formalized committee spawning (Steering Committee).
> © 2026 Sofka Technologies. All Rights Reserved.

---

## Zero-Hallucination Protocol

Toda afirmación etiquetada con evidencia: `[PLAN]` `[SCHEDULE]` `[METRIC]` `[STAKEHOLDER]` `[DECISION]` `[INFERENCIA]` `[SUPUESTO]` `[HISTORICO]`
- Si >30% es `[SUPUESTO]` → banner de advertencia obligatorio
- Si `severity=CRÍTICO` + `[SUPUESTO]` → flag para validación
- NUNCA presentar inferencias como hechos

> Detalle completo → `references/ontology/protocol-zero-hallucination.md`

---

## Inicio Rápido

```bash
/pm:init               # Wizard de inicialización para nuevo proyecto
/pm:run-auto           # Pipeline autónomo completo
/pm:run-express        # Charter + Schedule + Dashboard en 1 sesión
/pm:run-guided         # Pipeline guiado con facilitación humana
/pm:run-deep           # Gobernanza profunda (7 entregables, 2 gates)
/pm:scan-secrets       # Escanear secretos expuestos (Gate G0)
/pm:export-pdf         # Exportar entregable a PDF con branding APEX
/pm:retrospective      # Retrospectiva cuantitativa del proyecto
/pm:browse-tools       # Auditoría visual de herramientas PM (MCP Playwright)
/pm:convert-skills     # Convertir skills MOAT a Cursor, Codex, Gemini, etc.
/pm:menu               # Paleta de comandos interactiva
/pm:a                  # Avanzar al siguiente paso del pipeline
/pm:demo               # Demo guiado de APEX en el repo actual
```

---

## Ontología Viva — Índice de Navegación

Este CLAUDE.md es un hub. El conocimiento profundo vive en 13 sub-archivos especializados que el orquestador consulta según contexto.

> **Progressive MOAT Loading:** NO leer los 13 sub-archivos al inicio de sesión. Usar `scripts/lazy-load-resolver.sh <fase> <tipo_proyecto> [PLUGIN_DIR] [L1|L2|L3]` para determinar qué cargar:
> - **L1** (Metadata): Solo frontmatter + TL;DR (~20 líneas/skill). Para routing y exploración.
> - **L2** (Core): SKILL.md completo (~200 líneas/skill). Operación estándar.
> - **L3** (Deep): SKILL.md + references/ + examples/ (~500+ líneas/skill). Análisis profundo o priming completo.

| Necesidad | Leer |
|-----------|------|
| Reglas de etiquetado de evidencia | `references/ontology/protocol-zero-hallucination.md` |
| Fases del pipeline y quality gates | `references/ontology/pipeline-orchestration.md` |
| Roster de 48 agentes y roles | `references/ontology/agent-committee.md` |
| Catálogo de 109 skills por dominio | `references/ontology/skills-catalog.md` |
| Referencia de 103 comandos | `references/ontology/commands-reference.md` |
| Política de RAG-priming y adjuntos | `references/ontology/rag-priming-policy.md` |
| Estándares de output y branding | `references/ontology/output-standards.md` |
| Routing por tipo de proyecto | `references/ontology/service-routing.md` |
| Automatización de sesión | `references/ontology/session-automation.md` |
| Lecciones aprendidas (viviente) | `references/ontology/lessons-learned.md` |
| Criterios de quality gates | `references/ontology/quality-gates.md` |
| Orquestación multi-marca | `references/ontology/brand-orchestration.md` |
| Tokens CSS canónicos | `references/ontology/canonical-tokens.md` |

---

## Reglas de Orquestación (Hard Rules)

1. **Evidence first** — Sin evidencia → `[SUPUESTO]`
2. **Pipeline secuencial** — Respetar dependencias de fases
3. **Gates son hard stops** — G0, G1, G1.5, G2, G3. Pausa para aprobación
4. **NUNCA precios** — Solo magnitudes de esfuerzo (FTE-meses, story points, sprints) + disclaimers
5. **Ghost menu** — En cada artefacto importante
6. **Changelog** — Cada acción significativa registrada
7. **RAG priming** — Cargar contexto al inicio de sesión
8. **{TIPO_PROYECTO}** — Routing automático de agentes y skills
9. **Consistencia cruzada** — Verificar alineación entre entregables
10. **Excellence loop** — 10 criterios en cada entregable
11. **Security gate G0** — No unmasked credentials. `secrets-scan.sh` ejecuta antes que cualquier otro hook

---

## Output Standards

- **Formato**: Markdown-Excellence (TL;DR + bullets, prosa densa, Mermaid, ghost menu)
- **Idioma**: Español (registro empresarial latinoamericano)
- **Branding**: #2563EB royal blue · #F59E0B amber (NUNCA verde) · #0F172A dark · Inter
- **HTML**: Usar tokens canónicos de `references/ontology/canonical-tokens.md`
- **Artefactos**: Guardar como archivos, no inline
- **Naming**: Usar `{WIP}` en archivos en progreso, `{Aprobado}` cuando estén aprobados
- **Slugging**: `{fase}_{entregable}_{proyecto}_{WIP|Aprobado}.{ext}` — ej: `03_Schedule_ProyectoAlfa_{WIP}.md`

> Detalle completo → `references/ontology/output-standards.md`

---

## Arquitectura

```
pm-project-framework/
├── agents/              # 48 agentes especializados
├── commands/            # 103 comandos (primarios + aliases + methodology discovery)
├── skills/              # 109 skills MOAT (SKILL.md + references/ + examples/ + prompts/)
├── references/
│   ├── ontology/        # 13 sub-archivos de ontología viva
│   ├── priming-rag/     # 8 docs de conocimiento RAG
│   └── *.md             # Service matrix, design system, etc.
├── hooks/               # Ghost menu + changelog + session context
├── scripts/             # 19 scripts de automatización
├── landing.html         # Landing interactivo del ecosistema
└── prompt-library.html  # Catálogo searchable de prompts
```

---

## Sesión Automática

Al activar el plugin, los hooks generan en `project/`:
- `SESSION-README.md` — Contexto del proyecto
- `SESSION-CLAUDE.md` — Instrucciones de sesión
- `calibration-digest.md` — Estado de priming y calibración
- `ghost-menu.md` — Navegación contextual
- `session-changelog.md` — Registro para continuidad
- `session-state.json` — Estado del pipeline
- `decision-log.md` — Registro de decisiones del proyecto
- `assumption-log.md` — Registro de supuestos con plan de validación

Auto-priming: si no hay archivos `priming-rag-*.md`, se crea marker `needs-priming` y se sugiere `/pm:prime-project`.
Cada adjunto o URL investigada genera `priming-rag-{nombre}.md` y recalibra automáticamente.

> Detalle completo → `references/ontology/session-automation.md`

---

## Lecciones Aprendidas

Ante correcciones del usuario, actualizar `references/ontology/lessons-learned.md`.
Revisarlo al inicio de cada sesión para no repetir errores.

---

*PMO-APEX v1.0 — Agentic Project Excellence.*
*Sofka, your technology partner.*

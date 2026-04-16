# Sofka SAGE v12.0 — Agentic PreSales as Service

> **SAGE** = Sofka Agentic Gateway to Excellence.
> Tu IDE se convierte en una agencia de discovery empresarial.
> 56 agentes · 110 skills MOAT · 106 comandos · 42 prompts NL-HP · Protocolo zero-hallucination.
> © 2026 Sofka Technologies. All Rights Reserved.

> **Global orchestration**: `~/.claude/orchestration/` — metacognition, input amplification, workflow discipline, auto-calibration, RAG priming, self-improvement.

---

## Zero-Hallucination Protocol

Toda afirmación etiquetada con evidencia: `[CÓDIGO]` `[CONFIG]` `[DOC]` `[INFERENCIA]` `[SUPUESTO]` `[STAKEHOLDER]`
- Si >30% es `[SUPUESTO]` → banner de advertencia obligatorio
- Si `severity=CRÍTICO` + `[SUPUESTO]` → flag para validación
- NUNCA presentar inferencias como hechos

> Detalle completo → `references/ontology/protocol-zero-hallucination.md`

---

## Inicio Rápido

```bash
/sdf:run-auto          # Pipeline autónomo completo
/sdf:run-express       # Go/No-Go en 1 sesión (3 entregables)
/sdf:run-guided        # Pipeline guiado con facilitación humana
/sdf:run-deep          # Dirección arquitectónica (7 entregables, 2 gates)
/sdf:menu              # Paleta de comandos interactiva
/sdf:a                 # Avanzar al siguiente paso del pipeline
/sdf:demo              # Demo guiado de SAGE en el repo actual
```

---

## Ontología Viva — Índice de Navegación

Este CLAUDE.md es un hub. El conocimiento profundo vive en 12 sub-archivos especializados que el orquestador consulta según contexto:

| Necesidad | Leer |
|-----------|------|
| Reglas de etiquetado de evidencia | `references/ontology/protocol-zero-hallucination.md` |
| Fases del pipeline y quality gates | `references/ontology/pipeline-orchestration.md` |
| Roster de 48 agentes y roles | `references/ontology/agent-committee.md` |
| Catálogo de 100 skills por dominio | `references/ontology/skills-catalog.md` |
| Referencia de 96 comandos | `references/ontology/commands-reference.md` |
| Política de RAG-priming y adjuntos | `references/ontology/rag-priming-policy.md` |
| Estándares de output y branding | `references/ontology/output-standards.md` |
| Routing por tipo de servicio | `references/ontology/service-routing.md` |
| Automatización de sesión | `references/ontology/session-automation.md` |
| Lecciones aprendidas (viviente) | `references/ontology/lessons-learned.md` |
| Criterios de quality gates | `references/ontology/quality-gates.md` |
| Orquestación multi-marca | `references/ontology/brand-orchestration.md` |
| Tokens CSS canónicos | `references/ontology/canonical-tokens.md` |

---

## Reglas de Orquestación (Hard Rules)

1. **Evidence first** — Sin evidencia → `[SUPUESTO]`
2. **Pipeline secuencial** — Respetar dependencias de fases
3. **Gates son hard stops** — G1, G1.5, G2, G3. Pausa para aprobación
4. **NUNCA precios** — Solo FTE-meses + disclaimers
5. **Ghost menu** — En cada artefacto importante
6. **Changelog** — Cada acción significativa registrada
7. **RAG priming** — Cargar contexto al inicio de sesión
8. **{TIPO_SERVICIO}** — Routing automático de agentes y skills
9. **Consistencia cruzada** — Verificar alineación entre entregables
10. **Excellence loop** — 10 criterios en cada entregable

---

## Output Standards

- **Formato**: Markdown-Excellence (TL;DR + bullets, prosa densa, Mermaid, ghost menu)
- **Idioma**: Español (registro empresarial latinoamericano)
- **Branding**: #FF7E08 orange · #FFD700 gold (NUNCA verde) · #EFEAE4 fondo · Inter
- **HTML**: Usar tokens canónicos de `references/ontology/canonical-tokens.md`
- **Artefactos**: Guardar como archivos, no inline
- **Naming**: Usar `{WIP}` en archivos en progreso, `{Aprobado}` cuando estén aprobados
- **Slugging**: `{fase}_{entregable}_{cliente}_{WIP|Aprobado}.{ext}` — ej: `03_ASIS_Bancoomeva_{WIP}.md`

> Detalle completo → `references/ontology/output-standards.md`

---

## Arquitectura

```
sofka-discovery-framework/
├── agents/              # 48 agentes especializados
├── commands/            # 96 comandos (primarios + aliases + service discovery)
├── skills/              # 100 skills MOAT (SKILL.md + references/ + examples/ + prompts/)
├── references/
│   ├── ontology/        # 13 sub-archivos de ontología viva
│   ├── priming-rag-*/   # 8 docs de conocimiento RAG
│   └── *.md             # Service matrix, design system, etc.
├── hooks/               # Ghost menu + changelog + session context
├── scripts/             # Indexación, escaneo, validación
├── landing.html         # Landing interactivo del ecosistema
└── prompt-library.html  # Catálogo searchable de prompts
```

---

## Sesión Automática

Al activar el plugin, los hooks generan en `.discovery/`:
- `SESSION-README.md` — Contexto del proyecto
- `SESSION-CLAUDE.md` — Instrucciones de sesión
- `calibration-digest.md` — Estado de priming y calibración
- `ghost-menu.md` — Navegación contextual
- `session-changelog.md` — Registro para continuidad
- `session-state.json` — Estado del pipeline

Auto-priming: si no hay archivos `priming-rag-*.md`, se crea marker `.needs-priming` y se sugiere `/sdf:prime-repo`.
Cada adjunto o URL investigada genera `priming-rag-{nombre}.md` y recalibra automáticamente.

> Detalle completo → `references/ontology/session-automation.md`

---

## Lecciones Aprendidas

Ante correcciones del usuario, actualizar `references/ontology/lessons-learned.md`.
Revisarlo al inicio de cada sesión para no repetir errores.

---

*Sofka SAGE v12.0 — Agentic PreSales as Service.*
*Sofka, your technology partner.*

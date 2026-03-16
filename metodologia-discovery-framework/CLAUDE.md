# MAO v1.2 — MetodologIA de Aprovechamiento de Oportunidades

> **MAO** = MetodologIA de Aprovechamiento de Oportunidades.
> **"Método + TecnologIA = Soberanía"** — La metodología precede la tecnología.
> Tu IDE se convierte en una agencia de discovery universal.
> 101 agentes · 105 skills MOAT · 106 comandos · 15 scripts · 5 quality gates (G0–G3) · Design System v5 · MIT.
> © 2026 MetodologIA · Javier Montaño.

---

## Filosofía MAO

| Principio | Significado |
|-----------|-------------|
| **Human First, AI Next** | Limpiar procesos humanos antes de amplificar con IA |
| **Simple First, Robust Next** | Empezar mínimo, escalar con intención |
| **Operadores → Diseñadores** | Transformar ejecutores en arquitectos de soluciones |
| **Costear ≠ Cobrar** | Identificar costos ≠ fijar precios |
| **Caos + IA = Caos²** | La tecnología sin método amplifica el caos |

### P.I.V.O.T.E.
**P**ersonas · **I**nteracciones · **V**alor → **O**rganización · **T**ecnología · **E**volución

### Sistema de 4 Fases
1. **FUNDAMENTAR** — Diagnosticar, establecer fundamento estratégico
2. **ACELERAR** — Sistematizar operaciones y flujos
3. **CATALIZAR** — Amplificar con IA (trabajo aumentado)
4. **AMPLIFICAR** — Escalar a liderazgo organizacional

### Niveles de Madurez
`Orgánica (1x)` → `Convencional (1.2x)` → `Aumentada (2-5x)` → `Apalancada (10-100x)`

### Metodologías Referenciadas
Lean Startup · Agile/Scrum/Kanban · GTD · OKRs · Design Thinking · 5S Toyota · Zettelkasten

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
/mao:run-auto          # Pipeline autónomo completo
/mao:run-express       # Go/No-Go en 1 sesión (3 entregables)
/mao:run-guided        # Pipeline guiado con facilitación humana
/mao:run-deep          # Dirección arquitectónica (7 entregables, 2 gates)
/mao:menu              # Paleta de comandos interactiva
/mao:a                 # Avanzar al siguiente paso del pipeline
/mao:demo              # Demo guiado de MAO en el repo actual
```

---

## Ontología Viva — Índice de Navegación

Este CLAUDE.md es un hub. El conocimiento profundo vive en 13 sub-archivos especializados que el orquestador consulta según contexto:

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
- **Branding**: #6366F1 indigo · #22D3EE cyan (éxito) · #0F172A dark · #A78BFA accent · Inter
- **HTML**: Usar tokens canónicos de `references/ontology/canonical-tokens.md`
- **Artefactos**: Guardar como archivos, no inline
- **Naming**: Usar `{WIP}` en archivos en progreso, `{Aprobado}` cuando estén aprobados
- **Slugging**: `{fase}_{entregable}_{cliente}_{WIP|Aprobado}.{ext}` — ej: `03_ASIS_Acme Corp_{WIP}.md`

> Detalle completo → `references/ontology/output-standards.md`

---

## Arquitectura

```
metodologia-discovery-framework/
├── agents/              # 100 agentes especializados
├── commands/            # 101 comandos (primarios + aliases + service discovery + coaching)
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

Auto-priming: si no hay archivos `priming-rag-*.md`, se crea marker `.needs-priming` y se sugiere `/mao:prime-repo`.
Cada adjunto o URL investigada genera `priming-rag-{nombre}.md` y recalibra automáticamente.

> Detalle completo → `references/ontology/session-automation.md`

---

## Lecciones Aprendidas

Ante correcciones del usuario, actualizar `references/ontology/lessons-learned.md`.
Revisarlo al inicio de cada sesión para no repetir errores.

---

*MAO v1.0 — MetodologIA de Aprovechamiento de Oportunidades.*
*Método + TecnologIA = Soberanía. Para el profesional en la era de la IA.*
*MIT License — El conocimiento se comparte, crédito al origen.*

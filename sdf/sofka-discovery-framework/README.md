# Sofka SAGE v13.0 — Unified Agentic PreSales as Service

> **SAGE** = Sofka Agentic Gateway to Excellence.
> Tu IDE se convierte en una agencia de discovery empresarial + implementación + QA.

---

## Qué hace

Sofka SAGE transforma Claude Code en el consultor técnico más riguroso del mercado.
No es un prompt — es un ecosistema agéntico unificado con:

- **107 agentes** especializados (48 SDF + 54 SA Implementation + 4 PQA + 1 shared)
- **314 skills MOAT** — Modernization-Oriented Acceleration Technology (SKILL.md + references + examples + prompts)
- **204 comandos** (primarios + aliases + service discovery + UX)
- **5 quality gates** (G0 → G1 → G1.5 → G2 → G3)
- **19 scripts** de automatización (secrets, priming, context, validation)
- **13 sub-archivos de ontología** viva con progressive MOAT loading (L1/L2/L3)
- **Meta-cognition protocol** — FULL (Tríada) + LIGHT (103 agents)
- **Think Tank de 7 Sabios** para validación multidimensional de factibilidad
- **Protocolo zero-hallucination** con evidence tagging obligatorio
- **Ghost menu** persistente para navegación contextual
- **Changelog automático** para continuidad ante crisis de sesión
- **RAG-priming** con 20+ archivos de conocimiento base
- **10 tipos de servicio** con routing automático

### v13.0 Consolidation

Unifica tres plugins en uno:
- **SDF** (discovery + architecture) — 214 skills, 104 commands, 48 agents
- **Sovereign Architect** (implementation) — 80 skills, 84 commands, 54 agents
- **Plugin QA** (meta-skills) — 20 skills, 16 commands, 4 agents

---

## Instalación

```bash
git clone https://github.com/sofka-technologies/discovery-framework.git \
  ~/skills/plugins/sofka-discovery-framework
```

Al reiniciar Claude Code, el plugin se activa automáticamente.

---

## Uso rápido

```bash
# Wizard de inicialización
/sdf:init

# Pipeline completo autónomo
/sdf:run-auto

# Go/No-Go en 1 sesión (3 entregables)
/sdf:run-express

# Pipeline guiado con facilitación
/sdf:run-guided

# Dirección arquitectónica (7 entregables)
/sdf:run-deep

# Escanear secretos expuestos (Gate G0)
/sdf:scan-secrets

# Exportar entregable a PDF con branding
/sdf:export-pdf

# Retrospectiva cuantitativa del engagement
/sdf:retro

# Paleta de comandos interactiva
/sdf:menu

# Avanzar al siguiente paso del pipeline
/sdf:a

# Demo guiado de SAGE
/sdf:demo
```

---

## Qué pasa cuando activas el plugin

1. G0 Security Gate escanea secretos expuestos
2. Se inventarían entregables existentes en `discovery/`
3. Se genera contexto de sesión (SESSION-README, SESSION-CLAUDE)
4. Se verifica estado de RAG priming
5. Se inyecta ghost menu para navegación contextual
6. Se inicia changelog automático
7. El orquestador (`discovery-conductor`) toma control del pipeline
8. Toda afirmación se etiqueta: `[CÓDIGO]` `[CONFIG]` `[DOC]` `[INFERENCIA]` `[SUPUESTO]`

---

## Arquitectura

```
sofka-discovery-framework/
├── agents/              # 107 agentes especializados
│   ├── _defaults.md     # Shared config + meta-cognition protocol
│   ├── discovery-conductor.md  # Tríada (FULL meta-cognition)
│   ├── delivery-manager.md     # Tríada (FULL meta-cognition)
│   ├── risk-controller.md      # Tríada (FULL meta-cognition)
│   └── ...              # 103 specialists (LIGHT meta-cognition)
├── commands/            # 204 comandos (133 canónicos + 71 aliases)
├── skills/              # 314 skills MOAT
│   └── {skill}/
│       ├── SKILL.md     # Frontmatter + procedure + quality criteria
│       ├── references/  # Deep knowledge, frameworks, standards
│       ├── examples/    # Sample outputs, templates
│       └── prompts/     # NL-HP metaprompts
├── references/
│   ├── ontology/        # 13 sub-archivos de ontología viva
│   ├── priming-rag-*/   # 20+ docs de conocimiento RAG
│   └── *.md             # Service matrix, design system, etc.
├── hooks/               # Ghost menu + changelog + session context
├── scripts/             # 19 scripts (secrets, priming, validation, export)
├── landing.html         # Landing interactivo del ecosistema
├── prompt-library.html  # Catálogo searchable de prompts
├── CLAUDE.md            # Hub de la ontología (enruta a 13 sub-archivos)
└── .claude-plugin/
    └── plugin.json      # v13.0.0
```

---

## Pipeline de Discovery

```
00 Plan → 01 Stakeholders → 02 Brief → 03 AS-IS → 04 Flujos
                                                       ↓
                                             ┌─── G1 ───┐
                                             ↓           ↓
                                       05 Escenarios → 05b Feasibility (7 Sabios)
                                             ↓
                                       ┌─ G1.5 ─┐
                                       ↓         ↓
                                  06 Roadmap → G2
                                       ↓
                             07 Spec → 08 Pitch → 09 Handover → G3
```

---

## Meta-Cognition Protocol

| Tier | Agents | Reasoning |
|------|--------|-----------|
| **FULL** | Tríada Permanente (3) | 3-pass: Decompose → Evidence-check + Bias scan → Cross-validate |
| **LIGHT** | Todos los demás (103) | 2-pass: Decompose → Evidence-check |

---

## Tipos de Servicio

El parámetro `{TIPO_SERVICIO}` activa routing automático:

| Tipo | Alias | Comando directo |
|------|-------|----------------|
| Software Development & Architecture | `SDA` | Default (auto-detect) |
| Quality Assurance | `QA` | `/sdf:qa-discovery` |
| Robotic Process Automation | `RPA` | `/sdf:rpa-discovery` |
| Data & Artificial Intelligence | `Data-AI` | `/sdf:ai-discovery` |
| Cloud Infrastructure | `Cloud` | `/sdf:cloud-discovery` |
| Staff Augmentation | `SAS` | `/sdf:sas-discovery` |
| Management & PMO | `Management` | `/sdf:management-discovery` |
| UX Design | `UX-Design` | `/sdf:ux-discovery` |
| Digital Transformation | `Digital-Transformation` | `/sdf:transformation` |
| Multi-Service Program | `Multi-Service` | Auto (2+ types detected) |

---

## Protocolo Zero-Hallucination

| Tag | Significado | Confianza |
|-----|-------------|-----------|
| `[CÓDIGO]` | Verificado en código fuente | Alta |
| `[CONFIG]` | Verificado en configuración | Alta |
| `[DOC]` | Documentado en fuentes del proyecto | Alta |
| `[INFERENCIA]` | Razonado desde patrones observados | Media |
| `[SUPUESTO]` | Asunción no verificable | Baja |
| `[STAKEHOLDER]` | Proporcionado por interesado | Variable |

Si >30% es `[SUPUESTO]` → banner de advertencia obligatorio.

---

## Ontología Viva (v13.0)

CLAUDE.md es un hub que enruta a 13 sub-archivos en `references/ontology/`:

| Sub-archivo | Contenido |
|-------------|-----------|
| `protocol-zero-hallucination.md` | Reglas de evidencia |
| `pipeline-orchestration.md` | Fases, gates, diagrama |
| `agent-committee.md` | 107 agentes por nivel |
| `skills-catalog.md` | 314 skills por dominio |
| `commands-reference.md` | 204 comandos categorizados |
| `quality-gates.md` | G0-G3 + Think Tank |
| `canonical-tokens.md` | CSS design system |
| `brand-orchestration.md` | 3 marcas (Sofka, MetodologIA, JM Labs) |
| `output-standards.md` | Formatos y markdown-excellence |
| `rag-priming-policy.md` | Política RAG y adjuntos |
| `service-routing.md` | Routing por tipo de servicio |
| `session-automation.md` | Hooks, ghost menu, changelog |
| `lessons-learned.md` | Documento viviente |

---

## Comité de 107 Agentes

### Tríada Permanente (meta-cognition: FULL)
- `discovery-conductor` — Orquestador imparcial
- `delivery-manager` — Timelines, alcance, riesgos
- `risk-controller` — Gobernanza continua

### Core Team (9 agents)
Technical Architect · Enterprise Architect · Solutions Architect · Cloud Architect · Security Architect · Data Architect · Quality Engineer · Quality Guardian · Subject Matter Expert

### Think Tank de 7 Sabios
Research Scientist · Economics Researcher · Systems Theorist · Technology Scout · Integration Researcher · Hardware Systems Engineer · Data Scientist

### 36 Especialistas SDF
Se activan según `{TIPO_SERVICIO}` y fase del pipeline.

### 54 Agentes SA (Implementation)
Specialists en: React, Angular, Vue, Next.js, Node, TypeScript, Firebase, Supabase, PostgreSQL, MongoDB, Redis, Docker, Git, CSS, Vite, y más.

### 4 Agentes PQA (Plugin Development)
Plugin Architect · Plugin Spec Writer · Plugin Builder Agent · Plugin QA Engineer

---

## 314 Skills por Dominio

| Dominio | # |
|---------|---|
| Arquitectura & Software | 28 |
| Data, Analytics & AI | 22 |
| Análisis & Discovery | 16 |
| Cloud, Platform & Infra | 14 |
| Calidad, Testing & Observability | 16 |
| Gestión, Estrategia & PMO | 42 |
| Editorial, Comunicación & UX | 14 |
| Cambio, Adopción & Governance | 12 |
| Innovación, Feasibility & Research | 12 |
| DevOps, Security & CI/CD | 18 |
| Service Discovery (10 tipos) | 20 |
| SA Implementation (scaffolding, audit, etc.) | 80 |
| PQA Meta-skills (validate, audit, fix) | 20 |

---

## Branding (Design System v5)

| Token | Valor | Regla |
|-------|-------|-------|
| Primary | `#FF7E08` | Naranja Sofka — acción, CTA |
| Background | `#EFEAE4` | Beige cálido — NUNCA blanco puro |
| Success | `#FFD700` | **Gold — NUNCA verde** |
| Dark | `#1A1A2E` | Texto principal |
| Font | Inter | 300/400/500/600/700 |

---

## v13.0 QA Status

| Dimensión | Score | Detalle |
|-----------|-------|---------|
| Skills MOAT | **314/314** | SKILL.md + examples/ + references/ + prompts/ + version + allowed-tools |
| Agentes | **107/107** | name + description + allowed-tools + meta-cognition + skills assigned |
| Comandos | **204/204** | 133 canónicos + 71 aliases, 100% frontmatter |
| Scripts | **19/19** | Ejecutables, `#!/usr/bin/env bash`, `set -euo pipefail` |
| Ontología | **13/13** | Counts alineados, cross-refs verificadas |
| Branding | **0 violaciones** | Gold (#FFD700) para success, NUNCA verde |
| Cross-refs | **0 rotas** | Verificadas en skills, commands, agents, ontology |
| Meta-cognition | **106/106** | FULL (3) + LIGHT (103) |
| Constraints | **28/107** | Top-10 strategic + 18 technology specialists |

---

## Agradecimientos

### Gestión y alcance operativo
- **Jean Ruiz** — Inputs clave para planificar el plugin y entender los retos de la operación desde la gestión, permitiendo declarar alcances con mejor calidad.
- **Cathe Rodrigo** — Inputs clave para planificar el plugin y entender los retos de la operación desde la gestión, permitiendo declarar alcances con mejor calidad.

### Orientación en arquitectura
- **Raúl Andrés Alzate Gómez** — Orientación arquitectónica que fundamenta las decisiones técnicas del framework.
- **Juan Felipe Gómez Vélez** — Orientación arquitectónica que fundamenta las decisiones técnicas del framework.

### Liderazgo transversal de PreSales
- **Martín Rafael Torres Cardozo** — Apoyo desde el liderazgo transversal de PreSales.
- **Felipe Posada** — Apoyo desde el liderazgo transversal de PreSales.

### Sponsor ejecutivo
- **Luis Felipe Reyes Rivera** — Sponsor del programa Henka que habilita la innovación agéntica en Sofka.

---

## Licencia

All Rights Reserved — © 2026 Sofka Technologies.

## Autor

**Javier Montaño Guzmán** · Equipo PreSales Sofka

### Contribuidores

| Nombre | Rol | Contacto |
|--------|-----|----------|
| Javier Montaño Guzmán | Creador y arquitecto del framework | javier.montano@sofka.com.co |
| Raúl Andrés Alzate Gómez | Orientación arquitectónica | raul.alzate@sofka.com.co |
| Juan Felipe Gómez Vélez | Orientación arquitectónica | juan.gomez@sofka.com.co |
| Martín Rafael Torres Cardozo | Liderazgo PreSales | martin.torres@sofka.com.co |
| Felipe Posada | Liderazgo PreSales | felipe.posada@sofka.com.co |
| Luis Felipe Reyes Rivera | Sponsor Henka | luis.reyes@sofka.com.co |

*Sofka, your technology partner.*
*La excelencia no se improvisa, se diseña.*

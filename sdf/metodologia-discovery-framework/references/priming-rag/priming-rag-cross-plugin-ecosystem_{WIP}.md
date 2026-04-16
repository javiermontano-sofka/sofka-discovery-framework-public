# Priming-RAG: Cross-Plugin Ecosystem
> MetodologIA Discovery Framework — Mapa comparativo SDF vs MAO vs PM
> Generado: 2026-03-17 | Version: v1.4.0
> Fuente: Exploracion de `~/skills/plugins/` (3 frameworks)

---

## Resumen ejecutivo

- 3 plugins comparten arquitectura identica pero difieren en proposito, audiencia y licencia [CÓDIGO]
- SDF (SAGE) = enterprise presales (Sofka, propietario) [DOC]
- MAO = metodologia universal (MetodologIA, MIT) [DOC]
- PM (APEX) = gestion de proyectos (Sofka, propietario) [DOC]
- Ontologia de 13 archivos compartida entre los 3 plugins [CÓDIGO]
- Regla critica: NUNCA mezclar branding entre plugins [DOC]

---

## Comparativa cuantitativa

| Dimension | SDF (SAGE) v12.3.0 | MAO v1.4.0 | PM (APEX) v1.0.0 |
|-----------|-------------------|------------|-------------------|
| **Agentes** | 48 | 101 | 48 |
| **Skills** | 107 | 108 | 109 |
| **Comandos** | 104 | 109 | 103 |
| **Scripts** | 19 | 19 | 19 |
| **Quality Gates** | 5 (G0-G3) | 5 (G0-G3) | 5 (G0-G3) |
| **Priming-RAG** | 81 | 32 (en expansion) | 8 |
| **Licencia** | All Rights Reserved | MIT | All Rights Reserved |

---

## Comparativa cualitativa

| Dimension | SDF | MAO | PM |
|-----------|-----|-----|-----|
| **Proposito** | PreSales enterprise consulting | Metodologia universal para profesionales | Gestion de proyectos y portafolios |
| **Filosofia** | "Tu IDE = agencia de discovery" | "Metodo + TecnologIA = Soberania" | "Agentic project excellence" |
| **Audiencia** | Equipos presales Sofka | Profesionales en era IA | PMOs y lideres de proyecto |
| **Entry agent** | discovery-conductor | discovery-conductor | project-conductor |
| **Session dir** | .discovery/ | .discovery/ | .project/ |
| **Evidence tags** | CÓDIGO, CONFIG, DOC, INFERENCIA, SUPUESTO | Identicos a SDF | PLAN, SCHEDULE, METRIC, STAKEHOLDER, DECISION |

---

## Branding (NUNCA mezclar)

| Plugin | Primary | Accent | Background | Success |
|--------|---------|--------|------------|---------|
| **SDF** | Orange #FF7E08 | Gold #FFD700 | Crema #EFEAE4 | Gold (NUNCA verde) |
| **MAO** | Indigo #6366F1 | Purple #A78BFA | Dark #0F172A | Cyan #22D3EE |
| **PM** | Royal Blue #2563EB | — | Dark #0F172A | Amber #F59E0B |

Tipografia compartida: Inter (body) + Clash Grotesk (display) [DOC]

---

## Agentes: que tiene MAO que no tiene SDF/PM

MAO extiende el roster base de 48 con 53 agentes adicionales: [CÓDIGO]

**Coaching (10):** agile-coach, conscious-business-coach, enterprise-coach, leadership-coach, lean-practitioner, methodological-coach, productivity-coach, team-coach, training-designer, design-thinking-facilitator

**Arquitectura especializada (10):** ai-native-architect, api-designer, automation-architect, blockchain-architect, database-specialist, digital-twin-architect, edge-computing-specialist, iot-architect, low-code-architect, observability-architect

**Operaciones (10):** capacity-planner, chaos-engineer, finops-specialist, incident-commander, migration-specialist, performance-architect, pricing-analyst, release-manager, sre-engineer, technical-debt-specialist

**Comunicacion (8):** competitive-analyst, customer-success-architect, developer-advocate, executive-communicator, innovation-catalyst, market-researcher, negotiation-strategist, organizational-psychologist

**Compliance y especializado (15):** accessibility-specialist, assistant-designer, data-privacy-officer, documentation-specialist, editorial-publisher, ethical-ai-specialist, knowledge-manager, open-source-strategist, prompt-engineer, regulatory-specialist, sustainability-analyst, vendor-manager, diagram-specialist, testing-strategist, technical-writer

---

## Estructura compartida

Los 3 plugins siguen **arquitectura identica**: [CÓDIGO]

```
{framework}/
├── agents/              # Agentes especializados
├── commands/            # Comandos (primarios + aliases)
├── skills/              # Skills MOAT (SKILL.md + refs + examples + prompts)
├── references/
│   ├── ontology/        # 13 archivos de ontologia viva
│   └── priming-rag/     # Knowledge base RAG
├── hooks/               # Session automation
├── scripts/             # 19 scripts de automatizacion
├── landing.html         # UI interactivo
└── CLAUDE.md            # Hub de orquestacion
```

---

## Ontologia sincronizada

13 archivos compartidos (mismo esquema, contenido adaptado): [CÓDIGO]

| Archivo | Funcion |
|---------|---------|
| protocol-zero-hallucination.md | Reglas de evidencia |
| pipeline-orchestration.md | Fases y gates |
| agent-committee.md | Roster de agentes |
| skills-catalog.md | Inventario de skills |
| commands-reference.md | Catalogo de comandos |
| quality-gates.md | Criterios de gates |
| rag-priming-policy.md | Politica de RAG |
| output-standards.md | Formato y branding |
| service-routing.md | Routing por servicio |
| session-automation.md | Hooks y sesion |
| lessons-learned.md | Lecciones vivientes |
| brand-orchestration.md | Multi-marca |
| canonical-tokens.md | CSS design tokens |

**Nota**: Cambios en ontologia no se sincronizan automaticamente entre plugins. Requiere propagacion manual. [INFERENCIA]

---

## Context Detection Cascade

```
1. Prefijo explicito (/sdf:, /mao:, /pm:)
2. Directorio de trabajo
3. Presencia de .discovery/ o .project/
4. Keywords en el prompt
5. Fallback: preguntar al usuario
```

---

## Cuando usar cada plugin

| Situacion | Plugin |
|-----------|--------|
| Discovery para cliente enterprise (Sofka) | SDF |
| Discovery para cualquier cliente (open) | MAO |
| Gestion de proyecto activo | PM |
| Coaching metodologico | MAO (coaches exclusivos) |
| Due diligence tecnico | SDF o MAO (deep mode) |
| PMO assessment | PM |
| Transformacion digital | SDF o MAO + PM |

---

## Keywords y hashtags

`#ecosistema` `#SDF` `#MAO` `#PM` `#SAGE` `#APEX` `#comparativa` `#branding` `#ontologia` `#routing` `#agentes` `#plugins`

---

## Query hooks

- "Que plugin uso?" -> Depende: SDF (enterprise Sofka), MAO (universal), PM (proyectos)
- "Puedo mezclar plugins?" -> NUNCA en el mismo output. Usar context detection cascade
- "Que tiene MAO que no tiene SDF?" -> 53 agentes adicionales (coaches, arq especializada, ops)
- "Comparten ontologia?" -> Si, 13 archivos con mismo esquema, contenido adaptado
- "Que licencia tiene cada uno?" -> SDF/PM propietario, MAO MIT

---

## Cross-references

- Ver: `priming-rag-agents-roster.md` para roster completo MAO (101)
- Ver: `priming-rag-global-ecosystem.md` para capas del ecosistema
- Ver: `priming-rag-mao-philosophy_{WIP}.md` para filosofia MAO

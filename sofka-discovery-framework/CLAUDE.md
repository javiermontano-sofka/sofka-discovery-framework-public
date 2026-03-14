# Sofka Discovery Framework — Guía de Orquestación

> **Tu IDE es tu ecosistema de pre-venta técnica.**
> 100 skills, 48 agentes, 84 comandos. Un framework de discovery empresarial
> completo, orquestado por IA, que transforma Claude Code en el consultor
> técnico más riguroso del mercado.

---

## Inicio Rápido

```bash
# 1. Clonar el plugin
git clone https://github.com/javiermontano-sofka/sofka-discovery-framework.git \
  ~/skills/plugins/sofka-discovery-framework

# 2. Tu primer discovery (Go/No-Go en 1 sesión)
/sdf:run-express

# 3. Discovery completo guiado
/sdf:run-guided

# 4. Discovery autónomo (zero interruptions)
/sdf:run-auto
```

---

## Arquitectura del Ecosistema

```
sofka-discovery-framework/
├── agents/           # 48 agentes especializados (.md)
├── commands/         # 84 comandos (21 primarios + 63 aliases)
├── skills/           # 100 skills MOAT (SKILL.md + references/ + examples/ + prompts/)
├── references/
│   └── priming-rag/  # 20 archivos de conocimiento base
├── hooks/            # 6 hooks automatizados
├── CLAUDE.md         # ← Estás aquí
├── landing.html      # Landing page del framework
└── .claude-plugin/
    └── plugin.json   # Metadata del plugin (name: "sdf")
```

### Patrón MOAT (Skill Structure)
Cada skill sigue el patrón **MOAT**: `SKILL.md` (definición) + `references/` (conocimiento base) + `examples/` (ejemplos de output) + `prompts/` (prompts especializados). Esto garantiza que cada skill es autosuficiente, reutilizable y auditable.

---

## Comandos — Referencia Completa

### Pipeline (Flujos end-to-end)

| Comando | Alias | Descripción |
|---------|-------|-------------|
| `/sdf:run-guided` | `guide`, `discovery` | Pipeline completo con facilitación humana |
| `/sdf:run-auto` | `auto`, `discovery-auto` | Pipeline autónomo sin interrupciones |
| `/sdf:run-express` | `express` | Go/No-Go en 1 sesión (3 entregables) |
| `/sdf:run-deep` | `deep`, `intermediate` | Dirección arquitectónica (7 entregables, 2 gates) |

### Generación de Entregables

| Comando | Alias | Entregable |
|---------|-------|------------|
| `/sdf:generate-plan` | `plan` | 00_Discovery_Plan — gobernanza, alcance, comité |
| `/sdf:map-stakeholders` | `stakeholders` | 01_Stakeholder_Map — influencia, RACI, comunicación |
| `/sdf:generate-brief` | `brief` | 02_Brief_Tecnico — resumen ejecutivo, max 3 páginas |
| `/sdf:diagnose-asis` | `asis`, `diagnose` | 03_Analisis_AS-IS — 10 secciones exhaustivas |
| `/sdf:trace-flows` | `flows`, `trace` | 04_Mapeo_Flujos — DDD, flujos E2E, integraciones |
| `/sdf:evaluate-scenarios` | `scenarios`, `evaluate` | 05_Escenarios_ToT — Tree-of-Thought, scoring 6D |
| `/sdf:validate-feasibility` | `validate`, `feasibility` | 05b_Feasibility — Think Tank de 7 Sabios |
| `/sdf:chart-roadmap` | `roadmap`, `chart` | 06_Solution_Roadmap — 5 fases, Monte Carlo |
| `/sdf:write-spec` | `spec` | 07_Especificacion_Funcional — casos de uso |
| `/sdf:craft-pitch` | `pitch`, `craft` | 08_Pitch_Ejecutivo — business case C-level |
| `/sdf:deliver-handover` | `handover`, `deliver` | 09_Handover_Operaciones — transición 90 días |

### Reportes Especializados

| Comando | Alias | Descripción |
|---------|-------|-------------|
| `/sdf:present-findings` | `findings`, `findings-deck` | Presentación ejecutiva de hallazgos |
| `/sdf:report-tech` | `tech`, `technical-findings` | Deep-dive técnico |
| `/sdf:report-func` | `func`, `functional-findings` | Hallazgos funcionales |
| `/sdf:review-business` | `biz`, `business-review` | Perspectiva de negocio |
| `/sdf:discover-ai` | `ai`, `ai-opportunities` | Oportunidades de IA |

### Assessments

| Comando | Alias | Descripción |
|---------|-------|-------------|
| `/sdf:assess-architecture` | `arch` | Deep-dive C4 multinivel |
| `/sdf:assess-data` | `data`, `data-landscape` | Landscape de datos |
| `/sdf:assess-cloud` | `cloud`, `cloud-readiness` | Readiness de migración cloud |
| `/sdf:assess-security` | `security`, `security-posture` | Postura de seguridad |
| `/sdf:assess-change` | `change`, `change-readiness` | Readiness organizacional |
| `/sdf:benchmark-maturity` | `benchmark` | Benchmark de madurez vs industria |

### Service-Type Discovery

| Comando | {TIPO_SERVICIO} | Descripción |
|---------|-----------------|-------------|
| `/sdf:rpa-discovery` | RPA | Automatización de procesos |
| `/sdf:qa-discovery` | QA | QA-as-a-Service |
| `/sdf:ai-discovery` | Data-AI | AI Center & Data Platform |
| `/sdf:transformation` | Digital-Transformation | Programa de transformación |

### Operaciones

| Comando | Alias | Descripción |
|---------|-------|-------------|
| `/sdf:audit-quality` | `audit`, `discovery-review` | Auditoría con scorecard |
| `/sdf:improve-deliverables` | `improve`, `discovery-improve` | Evolucionar entregables |
| `/sdf:rescue-stalled` | `rescue` | Rescatar discovery estancado |
| `/sdf:simulate-scenarios` | `simulate` | Simulación Monte Carlo what-if |

---

## Parámetros Comunes

Cada comando acepta estos parámetros opcionales:

| Parámetro | Valores | Default |
|-----------|---------|---------|
| `{MODO}` | `piloto-auto`, `desatendido`, `supervisado`, `paso-a-paso` | `piloto-auto` |
| `{FORMATO}` | `markdown`, `html`, `docx`, `dual` | `markdown` |
| `{VARIANTE}` | `ejecutiva` (~40%), `técnica` (full) | `técnica` |
| `{ADJUNTOS}` | `procesar-todo`, `solo-código`, `ignorar` | `procesar-todo` |
| `{PROFUNDIDAD}` | `ejecutivo`, `técnico`, `exhaustivo` | `técnico` |
| `{TIPO_SERVICIO}` | `SDA`, `QA`, `Management`, `RPA`, `Data-AI`, `Cloud`, `SAS`, `UX-Design`, `Digital-Transformation`, `Multi-Service` | `SDA` |

**Ejemplo de uso con parámetros:**
```
/sdf:run-guided {TIPO_SERVICIO}=Data-AI {FORMATO}=dual {VARIANTE}=ejecutiva
```

---

## Pipeline de Discovery

### Fases y Quality Gates

```
00 Plan → 01 Stakeholders → 02 Brief → 03 AS-IS → 04 Flujos
                                                        ↓
                                              ┌─── GATE 1 ───┐
                                              ↓               ↓
                                        05 Escenarios → 05b Feasibility
                                              ↓          (Think Tank)
                                        ┌─ GATE 1.5 ─┐
                                        ↓             ↓
                                   06 Roadmap → GATE 2
                                        ↓
                              07 Spec → 08 Pitch → 09 Handover
                                                        ↓
                                                    GATE 3 (Final)
```

### NL-HP v3.0 Checkpoint Model

Todos los comandos siguen el protocolo de checkpoints:

| Checkpoint | Nombre | Propósito |
|------------|--------|-----------|
| CP-0 | Ingesta | Repo escaneado, adjuntos clasificados, gaps declarados |
| CP-1 | Plan | Composición skill/agente propuesta y aprobada |
| CP-N | Fase N | Entregable validado contra criterios |
| CP-F | Final | Consistencia cruzada, compliance, cierre formal |

### Quality Gates (Hard Stops)

| Gate | Fase | Criterio |
|------|------|----------|
| **G1** | Escenarios | Scoring 6D completado, escenario ganador justificado |
| **G1.5** | Feasibility | Think Tank de 7 Sabios: veredicto unánime o mayoría calificada |
| **G2** | Roadmap | Magnitudes validadas (FTE-meses), Monte Carlo ejecutado |
| **G3** | Final | Consistencia cruzada, todos los entregables alineados |

---

## Comité de 48 Agentes

### 12 Core (Siempre Activos)

| Agente | Rol |
|--------|-----|
| `discovery-conductor` | Orquestador imparcial — secuencia fases, gestiona gates |
| `delivery-manager` | Gestión de proyecto — timelines, alcance, riesgos |
| `risk-controller` | Gobernanza de riesgos y calidad continua |
| `quality-guardian` | Validación de entregables contra criterios |
| `domain-analyst` | Analista de dominio — contexto sectorial |
| `technical-architect` | Arquitecto técnico — diseño y trade-offs |
| `data-strategist` | Estrategia de datos — ecosistema, gobernanza |
| `change-catalyst` | Gestión del cambio — adopción, readiness |
| `editorial-director` | Director editorial — coherencia narrativa |
| `format-specialist` | Producción multi-formato (HTML, DOCX, XLSX, PDF) |
| `content-strategist` | Estrategia de contenido — storytelling |
| `full-stack-generalist` | Generalista técnico — implementación |

### 36 Especialistas de Dominio

Se activan según `{TIPO_SERVICIO}` y la fase. Incluyen: ai-agent-architect, ai-architect, ai-strategist, analytics-architect, backend-developer, business-analyst, cloud-architect, compliance-analyst, data-architect, data-engineer, data-scientist, devops-engineer, devsecops-expert, economics-researcher, enterprise-architect, frontend-developer, hardware-systems-engineer, implementation-analyst, integration-researcher, middle-integrations-developer, mobile-architect, platform-engineer, process-automation-specialist, product-strategist, qa-strategist, quality-engineer, research-scientist, security-architect, solutions-architect, subject-matter-expert, systems-theorist, technical-lead, technology-scout, transformation-architect, ux-researcher, ux-strategist.

### Delegación por Fase

| Fase | Agente Líder | Soporte |
|------|-------------|---------|
| 0 — Plan | domain-analyst | change-catalyst |
| 1 — Stakeholders | technical-architect | data-strategist |
| 2 — Brief | domain-analyst | full-stack-generalist |
| 3 — AS-IS + Flujos | technical-architect | domain-analyst |
| 3b — Feasibility | technical-architect | quality-guardian |
| 4 — Roadmap | delivery-manager | data-strategist |
| 5 — Quality Review | quality-guardian | change-catalyst |
| 6 — Handover | delivery-manager | change-catalyst |

---

## 100 Skills por Dominio

| Dominio | # | Skills |
|---------|---|--------|
| Arquitectura | 14 | software-architecture, solutions-architecture, enterprise-architecture, architecture-tobe, api-architecture, cloud-native-architecture, infrastructure-architecture, mobile-architecture, event-architecture, database-architecture, devsecops-architecture, security-architecture, integration-architecture, disaster-recovery |
| Data & Analytics | 10 | data-engineering, data-governance, data-quality, data-science-architecture, data-mesh-strategy, analytics-engineering, bi-architecture, data-storytelling, data-viz-storytelling, dependency-analysis |
| Análisis & Discovery | 12 | discovery-orchestrator, asis-analysis, flow-mapping, scenario-analysis, stakeholder-mapping, functional-spec, input-analysis, dynamic-sme, sector-intelligence, competitive-intelligence, maturity-assessment, compliance-assessment |
| Cloud & Platform | 5 | cloud-migration, finops, capacity-planning, sustainability-assessment, mobile-platform-assessment |
| Calidad & Operaciones | 10 | testing-strategy, quality-engineering, performance-engineering, observability, software-viability, technical-feasibility, multidimensional-feasibility, sla-design, incident-management, tech-debt-assessment |
| Gestión & Estrategia | 10 | project-program-management, risk-controlling-dynamics, cost-estimation, commercial-model, execution-burndown, pipeline-governance, product-strategy, vendor-assessment, governance-framework, release-strategy |
| Editorial & Comunicación | 9 | executive-pitch, technical-writing, copywriting, storytelling, output-engineering, ux-writing, documentation-architecture, training-curriculum, onboarding-playbook |
| Cambio & Adopción | 5 | change-readiness-assessment, adoption-strategy, team-topology, workshop-design, workshop-facilitator |
| Innovación & Validación | 5 | hypothesis-driven-development, technology-vigilance, poc-lab, migration-playbook, accessibility-audit |
| Herramientas & DX | 6 | html-brand, design-system, mermaid-diagramming, functional-toolbelt, user-representative, developer-experience |
| Entregables & Roadmap | 3 | solution-roadmap, roadmap-poc, discovery-handover |
| Service Discovery | 11 | ai-center-discovery, bi-analytics-discovery, cloud-service-discovery, digital-transformation-discovery, management-discovery, mentoring-training-discovery, mini-apps-discovery, qa-service-discovery, rpa-discovery, staff-augmentation-discovery, ux-design-discovery |

---

## Reglas de Orquestación

1. **Pipeline flows orquestan, document commands generan entregables individuales.** Usa flows para engagements end-to-end, document commands para generación específica.
2. **Respetar dependencias de fase**: Plan → Stakeholders → Brief+AS-IS → Flujos → Escenarios → Roadmap → Spec → Pitch → Handover.
3. **Quality gates son hard stops**: G1, G1.5, G2, G3. En `piloto-auto`: pausa para aprobación.
4. **Cost outputs**: NUNCA precios. Solo FTE-meses + disclaimers obligatorios. 5% margen de innovación.
5. **Evidence tagging**: Todas las afirmaciones etiquetadas `[CÓDIGO]`, `[CONFIG]`, `[DOC]`, `[INFERENCIA]`, `[SUPUESTO]`, `[STAKEHOLDER]`.
6. **Governance transversal**: project-program-management + risk-controlling-dynamics en TODAS las fases.
7. **{TIPO_SERVICIO} activa routing**: El tipo de servicio determina qué agentes especialistas se activan, qué skills se invocan, y qué secciones adicionales aparecen en los entregables.

---

## Output Standards

### Markdown-Excellence
- **TL;DR** (3-5 bullets) al inicio de cada entregable
- Prosa densa, evitar redundancia
- Tablas con semáforo visual (🟢/🟡/🔴)
- Diagramas Mermaid embebidos
- Callouts: 💡 insight, ⚖️ trade-off, ⚠️ riesgo, 🔍 hallazgo
- Footnotes para referencias
- Cross-references entre entregables

### Branding Sofka
- **Primary**: `#FF7E08` (naranja)
- **Dark**: `#1A1A2E`
- **Success**: `#FFD700` (dorado — NUNCA verde)
- Font: Inter
- Outputs HTML usan el design-system del framework

---

## Priming-RAG

20 archivos de conocimiento base en `references/priming-rag/` que alimentan el contexto de los agentes. Cubren: marcos de referencia sectoriales, benchmarks de industria, modelos de madurez, frameworks de assessment, y mejores prácticas de discovery.

---

## Think Tank de 7 Sabios

Validación de factibilidad multi-dimensional con 7 perspectivas:

1. **Research Scientist** — Evidencia académica y state-of-the-art
2. **Economics Researcher** — Viabilidad financiera (TCO, ROI)
3. **Systems Theorist** — Comportamientos emergentes, cascadas de falla
4. **Technology Scout** — Madurez tecnológica, ciclo de adopción
5. **Integration Researcher** — Interoperabilidad, feasibility de integración
6. **Hardware Systems Engineer** — Restricciones de infraestructura física
7. **Data Scientist** — Validación estadística, feasibility de datos

Veredicto: consenso unánime o mayoría calificada (5/7+).

---

## Hypothesis-Driven Development (HDD)

Ciclos de validación lean para reducir riesgo antes de comprometer recursos:

```
Hipótesis → Experimento → Evidencia → Decisión (Pivotar/Perseverar/Matar)
```

Integrado en el pipeline en fases 3b (Feasibility) y 5 (PoC Lab).

---

*La excelencia no se improvisa, se diseña.*

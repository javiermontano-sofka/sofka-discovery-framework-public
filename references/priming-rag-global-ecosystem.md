# Priming-RAG: Global Ecosystem
> Sofka Discovery Framework — Ecosistema global de assets y MOAT pattern
> Procesado: 2026-03-14 | Version: v11.0.0
> Fuentes: `~/.claude/skills/` (69 skills), `~/.claude/agents/` (1 agente), `~/skills/sofka-skills/` (58 .skill)

---

## Fuentes procesadas

| Ubicacion | Assets | Tipo |
|-----------|--------|------|
| `~/.claude/skills/` | 69 skills globales | Directorios con SKILL.md |
| `~/.claude/agents/` | 1 agente global | Archivo .md |
| `~/skills/sofka-skills/` | 58 archivos .skill | Paquetes ZIP distribuibles |

---

## Valor para discovery y RAG

El ecosistema global extiende las capacidades del SDF plugin fuera de su contexto. Los skills globales estan disponibles en cualquier proyecto sin activar el plugin. Los paquetes .skill son versiones distribuibles empaquetadas. Entender la relacion entre capas permite saber que capacidades existen donde y como se complementan.

---

## MOAT Pattern (Model-Oriented Artifact Template)

El MOAT es el patron defensivo que protege la calidad y consistencia de los skills del ecosistema.

### Definicion
MOAT = estructura de directorio estandarizada para cada skill que garantiza:
- **M**etadata completa (SKILL.md con frontmatter, autor, version, tags)
- **O**utput definido (entregable esperado documentado con ejemplo)
- **A**gents asignados (roles que ejecutan el skill, con justificacion)
- **T**ools declarados (herramientas permitidas en allowed-tools del frontmatter)

### Estructura de un skill con MOAT
```
skill-name/
  SKILL.md            — Definicion completa (frontmatter + contenido)
  references/         — Documentos de referencia para el skill
  prompts/            — Prompts especificos (si aplica)
  examples/           — Ejemplos de input/output
    sample-output.html  — Ejemplo renderizado
```

### Frontmatter estandar (SKILL.md)
```yaml
---
name: sofka-{domain}
version: "1.0.0"
author: Equipo PreSales Sofka
description: Descripcion del skill
tags: [tag1, tag2]
agents: [agent-1, agent-2]
allowed-tools: [Read, Write, Edit, Bash, Glob, Grep]
---
```

### Ventaja defensiva del MOAT
- Skills sin MOAT no pasan quality gates
- El excellence-loop valida estructura MOAT antes de evaluar contenido
- Los builders (skill-creator-moat) generan skills con MOAT automaticamente
- Los packaged .skill preservan la estructura MOAT completa en el ZIP

---

## 1. Global Skills (69)

Skills disponibles globalmente en `~/.claude/skills/`. Se invocan sin prefijo de plugin.

### Builders & Creators (14)

| Skill | Funcion |
|-------|---------|
| agent-constitution-creator | Crea constituciones de agentes (identidad, principios, restricciones) |
| agent-creator | Crea agentes completos (.md) con estructura estandar |
| hook-creator | Crea hooks de sesion (hooks.json) |
| mcp-creator | Crea servidores MCP |
| open-claw-builder | Construye assets Open Claw |
| plugin-builder | Construye plugins completos para Claude Code |
| prompt-creator | Crea prompts con formato NL-HP |
| prompt-forge | Forja y refina prompts iterativamente |
| rule-forge | Crea y formaliza reglas de negocio |
| skill-creator-moat | Crea skills con estructura MOAT defensiva |
| skill-spec-creator | Crea especificaciones de skills |
| step-creator | Crea steps individuales de workflow |
| workflow-creator | Crea workflows completos |
| workflow-forge | Forja y refina workflows iterativamente |

### Quality & Meta (5)

| Skill | Funcion |
|-------|---------|
| ecosystem-forge | Forja componentes del ecosistema completo |
| excellence-loop | Rubrica de 10 criterios, evaluacion y mejora de calidad |
| input-analyst | Analisis, clasificacion y calidad de inputs |
| naming-and-slugging | Convenciones de naming, slugging, registros |
| task-engine | Motor de ejecucion y descomposicion de tareas |

### Branding & Output (5)

| Skill | Funcion |
|-------|---------|
| brand-docx | Genera documentos DOCX con branding Sofka |
| brand-html | Genera HTML con branding y Design System v5 |
| brand-voice | Define y aplica voz de marca consistente |
| brand-xlsx | Genera XLSX con branding Sofka |
| xlsx-template-creator | Crea plantillas XLSX personalizadas |

### Domain Skills — Discovery Pipeline (7)

| Skill | Funcion |
|-------|---------|
| asis-analysis | Diagnostico AS-IS multivariante |
| discovery-handover | Paquete de transferencia de discovery |
| discovery-orchestrator | Orquestacion del pipeline de discovery |
| dynamic-sme | SME adaptativo al dominio del cliente |
| flow-mapping | Mapeo de flujos BPMN/Mermaid |
| scenario-analysis | Analisis de escenarios TO-BE |
| stakeholder-mapping | Mapeo de stakeholders con influencia-interes |

### Domain Skills — Architecture (14)

| Skill | Funcion |
|-------|---------|
| api-architecture | Diseno de APIs, contratos OpenAPI |
| architecture-tobe | Arquitectura TO-BE, C4 diagrams |
| cloud-migration | Plan de migracion cloud, 7Rs |
| cloud-native-architecture | Cloud-native design, K8s patterns |
| database-architecture | Diseno de bases de datos, ER, partitioning |
| design-system | Design tokens, component library |
| devsecops-architecture | Security in pipeline, SAST/DAST |
| enterprise-architecture | TOGAF, capability map |
| event-architecture | EDA patterns, event catalog |
| infrastructure-architecture | IaC, network topology |
| mobile-architecture | iOS, Android, cross-platform |
| security-architecture | Threat model, security controls |
| software-architecture | C4 diagrams, ADRs, quality attrs |
| solutions-architecture | Solution design, evaluation matrix |

### Domain Skills — Data & Analytics (5)

| Skill | Funcion |
|-------|---------|
| analytics-engineering | dbt models, transforms, metrics |
| bi-architecture | BI platform, data marts |
| data-engineering | Pipelines ETL/ELT, streaming |
| data-governance | Governance framework, data catalog |
| data-quality | DQ rules, profiling, monitoring |
| data-science-architecture | ML platform, experiment tracking |

### Domain Skills — Strategy & Business (7)

| Skill | Funcion |
|-------|---------|
| commercial-model | Modelo comercial, pricing strategy |
| cost-estimation | FTE-meses, estimacion de esfuerzo |
| executive-pitch | Presentacion ejecutiva, value prop |
| functional-spec | Especificacion funcional, HU |
| roadmap-poc | Roadmap + plan de PoC |
| software-viability | Viabilidad, build/buy analysis |
| solution-roadmap | Fases de solucion, milestones |
| technical-feasibility | Reporte de factibilidad tecnica |

### Domain Skills — Quality & UX (6)

| Skill | Funcion |
|-------|---------|
| html-brand | HTML templates con branding |
| mobile-assessment | Mobile landscape, platform eval |
| performance-engineering | Benchmarks, tuning |
| quality-engineering | QE framework, automation |
| testing-strategy | Test strategy, coverage plan |
| user-representative | User voice, journey maps |
| ux-writing | UX copy, microcopy |
| workshop-facilitator | Facilitation guide, outputs |

### Domain Skills — Operations (2)

| Skill | Funcion |
|-------|---------|
| functional-toolbelt | Analysis toolkit, templates |
| mermaid-diagramming | Mermaid diagrams, visual assets |
| observability | Monitoring strategy, SLOs |
| risk-controlling-dynamics | Risk matrix, mitigation plan |

---

## 2. Global Agents (1)

| Agente | Ruta | Funcion |
|--------|------|---------|
| plugin-architect | `~/.claude/agents/plugin-architect.md` | Arquitecto de plugins: disena, evalua y construye plugins para Claude Code |

---

## 3. Packaged Skills (58 archivos .skill)

Ubicacion: `~/skills/sofka-skills/`

Los archivos `.skill` son paquetes ZIP que contienen la estructura MOAT completa:
- `SKILL.md` — Definicion con frontmatter
- `references/` — Documentos de referencia
- `prompts/` — Prompts especificos
- `examples/` — Ejemplos de uso

### Convencion de naming
- Patron: `sofka-{domain-skill}.skill`
- Prefijo `sofka-` obligatorio para skills propietarios
- El nombre interno (sin prefijo) coincide con el directorio en `$SDF/skills/`

### Listado completo (58)

sofka-adoption-strategy, sofka-analytics-engineering, sofka-api-architecture, sofka-architecture-tobe, sofka-asis-analysis, sofka-bi-architecture, sofka-change-readiness-assessment, sofka-cloud-migration, sofka-cloud-native-architecture, sofka-commercial-model, sofka-copywriting, sofka-cost-estimation, sofka-data-engineering, sofka-data-governance, sofka-data-mesh-strategy, sofka-data-science-architecture, sofka-data-storytelling, sofka-data-viz-storytelling, sofka-database-architecture, sofka-design-system, sofka-devsecops-architecture, sofka-discovery-handover, sofka-discovery-orchestrator, sofka-enterprise-architecture, sofka-event-architecture, sofka-execution-burndown, sofka-executive-pitch, sofka-finops, sofka-flow-mapping, sofka-functional-spec, sofka-hypothesis-driven-development, sofka-infrastructure-architecture, sofka-input-analysis, sofka-mobile-platform-assessment, sofka-multidimensional-feasibility, sofka-observability, sofka-output-engineering, sofka-performance-engineering, sofka-pipeline-governance, sofka-quality-engineering, sofka-risk-controlling-dynamics, sofka-roadmap-poc, sofka-scenario-analysis, sofka-sector-intelligence, sofka-security-architecture, sofka-software-architecture, sofka-software-viability, sofka-solution-roadmap, sofka-solutions-architecture, sofka-stakeholder-mapping, sofka-storytelling, sofka-technical-feasibility, sofka-technical-writing, sofka-technology-vigilance, sofka-testing-strategy, sofka-user-representative, sofka-ux-writing, sofka-workshop-design.

---

## Relacion entre capas del ecosistema

```
SDF Plugin (propietario, 100 skills, 48 agents, 84 commands)
  |
  +-> Global Skills (~69 en ~/.claude/skills/)
  |     Subset de domain skills + builders/creators exclusivos
  |     Disponibles sin activar plugin
  |
  +-> Packaged .skill (58 en ~/skills/sofka-skills/)
  |     Distribuibles, estructura MOAT preservada
  |
  +-> MetodologIA (GPL-3.0, ~60% subset)
        Fork open-source, branding diferente (#6366F1)
```

### Reglas de relacion
1. Los global skills son un subset de los plugin skills + skills de infraestructura (builders)
2. Los packaged .skill son snapshots empaquetados para distribucion
3. Un skill puede existir en las 3 capas simultaneamente (plugin + global + packaged)
4. Los builders (14 skills) son exclusivos de la capa global, no existen en el plugin
5. NUNCA mezclar branding Sofka (#FF7E08) con MetodologIA (#6366F1) en outputs

---

## Key takeaways

1. 69 skills globales disponibles sin activar el plugin SDF
2. 14 builders/creators exclusivos para expandir el ecosistema
3. MOAT pattern (Metadata, Output, Agents, Tools) garantiza calidad estructural
4. 58 paquetes .skill para distribucion individual con estructura MOAT
5. plugin-architect es el unico agente global
6. Las 3 capas (plugin, global, packaged) se complementan sin duplicar responsabilidades

---

## Keywords y hashtags

`#ecosistema` `#global` `#skills` `#moat` `#packaged` `#builders` `#creators` `#distribucion` `#plugin` `#capas` `#metodologia` `#branding` `#naming`

---

## Query hooks

- "Que skills estan disponibles globalmente?" -> 69 en ~/.claude/skills/
- "Que es el MOAT pattern?" -> Model-Oriented Artifact Template: Metadata + Output + Agents + Tools
- "Como distribuyo un skill?" -> Paquetes .skill en ~/skills/sofka-skills/
- "Hay builders para crear nuevos assets?" -> Si, 14 en builders/creators
- "Cual es la relacion entre plugin y global?" -> Global es subset + builders exclusivos
- "Puedo mezclar branding?" -> NUNCA, Sofka (#FF7E08) y MetodologIA (#6366F1) separados

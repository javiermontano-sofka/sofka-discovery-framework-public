# Priming-RAG: Global Ecosystem
> MetodologIA Discovery Framework — Ecosistema global de assets y MOAT pattern
> Procesado: 2026-03-14 | Version: v12.0.0
> Fuentes: `~/.claude/skills/` (69 skills), `~/.claude/agents/` (1 agente), `~/skills/metodologia-skills/` (58 .skill)

---

## Fuentes procesadas

| Ubicacion | Assets | Tipo |
|-----------|--------|------|
| `~/.claude/skills/` | 69 skills globales | Directorios con SKILL.md |
| `~/.claude/agents/` | 1 agente global | Archivo .md |
| `~/skills/metodologia-skills/` | 58 archivos .skill | Paquetes ZIP distribuibles |

---

## Valor para discovery y RAG

El ecosistema global extiende las capacidades del SDF plugin fuera de su contexto. Los skills globales estan disponibles en cualquier proyecto sin activar el plugin. Los paquetes .skill son versiones distribuibles empaquetadas. Entender la relacion entre capas permite saber que capacidades existen donde y como se complementan.

---

## MOAT Pattern (Modernization-Oriented Acceleration Technology)

> **Nota: significado dual de MOAT.** El acronimo tiene dos expansiones validas y complementarias:
> 1. **Nombre de marca (public-facing):** Modernization-Oriented Acceleration Technology — describe la mision del patron: acelerar la modernizacion tecnologica de los clientes.
> 2. **Mnemonico estructural (internal):** Metadata, Output, Agents, Tools — describe lo que cada skill contiene: Metadata completa (SKILL.md), Output definido, Agents asignados, Tools declarados.
> Ambas son correctas. La primera es la identidad publica; la segunda es la guia practica para construir y validar skills.

El MOAT es el patron defensivo que protege la calidad y consistencia de los skills del ecosistema. Inspirado en el ADN de MetodologIA (Software + Kaizen), cada skill sigue una estructura estandarizada que acelera la modernizacion tecnologica de los clientes.

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
name: metodologia-{domain}
version: "1.0.0"
author: Javier Montaño · Comunidad MetodologIA
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
| brand-docx | Genera documentos DOCX con branding MetodologIA |
| brand-html | Genera HTML con branding y Design System v5 |
| brand-voice | Define y aplica voz de marca consistente |
| brand-xlsx | Genera XLSX con branding MetodologIA |
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

Ubicacion: `~/skills/metodologia-skills/`

Los archivos `.skill` son paquetes ZIP que contienen la estructura MOAT completa:
- `SKILL.md` — Definicion con frontmatter
- `references/` — Documentos de referencia
- `prompts/` — Prompts especificos
- `examples/` — Ejemplos de uso

### Convencion de naming
- Patron: `metodologia-{domain-skill}.skill`
- Prefijo `metodologia-` obligatorio para skills propietarios
- El nombre interno (sin prefijo) coincide con el directorio en `$SDF/skills/`

### Listado completo (58)

metodologia-adoption-strategy, metodologia-analytics-engineering, metodologia-api-architecture, metodologia-architecture-tobe, metodologia-asis-analysis, metodologia-bi-architecture, metodologia-change-readiness-assessment, metodologia-cloud-migration, metodologia-cloud-native-architecture, metodologia-commercial-model, metodologia-copywriting, metodologia-cost-estimation, metodologia-data-engineering, metodologia-data-governance, metodologia-data-mesh-strategy, metodologia-data-science-architecture, metodologia-data-storytelling, metodologia-data-viz-storytelling, metodologia-database-architecture, metodologia-design-system, metodologia-devsecops-architecture, metodologia-discovery-handover, metodologia-discovery-orchestrator, metodologia-enterprise-architecture, metodologia-event-architecture, metodologia-execution-burndown, metodologia-executive-pitch, metodologia-finops, metodologia-flow-mapping, metodologia-functional-spec, metodologia-hypothesis-driven-development, metodologia-infrastructure-architecture, metodologia-input-analysis, metodologia-mobile-platform-assessment, metodologia-multidimensional-feasibility, metodologia-observability, metodologia-output-engineering, metodologia-performance-engineering, metodologia-pipeline-governance, metodologia-quality-engineering, metodologia-risk-controlling-dynamics, metodologia-roadmap-poc, metodologia-scenario-analysis, metodologia-sector-intelligence, metodologia-security-architecture, metodologia-software-architecture, metodologia-software-viability, metodologia-solution-roadmap, metodologia-solutions-architecture, metodologia-stakeholder-mapping, metodologia-storytelling, metodologia-technical-feasibility, metodologia-technical-writing, metodologia-technology-vigilance, metodologia-testing-strategy, metodologia-user-representative, metodologia-ux-writing, metodologia-workshop-design.

---

## Relacion entre capas del ecosistema

```
SDF Plugin (propietario, 100 skills, 48 agents, 84 commands)
  |
  +-> Global Skills (~69 en ~/.claude/skills/)
  |     Subset de domain skills + builders/creators exclusivos
  |     Disponibles sin activar plugin
  |
  +-> Packaged .skill (58 en ~/skills/metodologia-skills/)
  |     Distribuibles, estructura MOAT preservada
  |
  +-> MetodologIA (MIT, ~60% subset)
        Fork open-source, branding diferente (#6366F1)
```

### Reglas de relacion
1. Los global skills son un subset de los plugin skills + skills de infraestructura (builders)
2. Los packaged .skill son snapshots empaquetados para distribucion
3. Un skill puede existir en las 3 capas simultaneamente (plugin + global + packaged)
4. Los builders (14 skills) son exclusivos de la capa global, no existen en el plugin
5. NUNCA mezclar branding MetodologIA (#6366F1) con MetodologIA (#6366F1) en outputs

---

## Key takeaways

1. 69 skills globales disponibles sin activar el plugin SDF
2. 14 builders/creators exclusivos para expandir el ecosistema
3. MOAT pattern (Modernization-Oriented Acceleration Technology: Metadata + Output + Agents + Tools) garantiza calidad estructural
4. 58 paquetes .skill para distribucion individual con estructura MOAT
5. plugin-architect es el unico agente global
6. Las 3 capas (plugin, global, packaged) se complementan sin duplicar responsabilidades

---

## Keywords y hashtags

`#ecosistema` `#global` `#skills` `#moat` `#packaged` `#builders` `#creators` `#distribucion` `#plugin` `#capas` `#metodologia` `#branding` `#naming`

---

## Query hooks

- "Que skills estan disponibles globalmente?" -> 69 en ~/.claude/skills/
- "Que es el MOAT pattern?" -> Modernization-Oriented Acceleration Technology: Metadata + Output + Agents + Tools
- "Como distribuyo un skill?" -> Paquetes .skill en ~/skills/metodologia-skills/
- "Hay builders para crear nuevos assets?" -> Si, 14 en builders/creators
- "Cual es la relacion entre plugin y global?" -> Global es subset + builders exclusivos
- "Puedo mezclar branding?" -> NUNCA, MetodologIA (#6366F1) y MetodologIA (#6366F1) separados

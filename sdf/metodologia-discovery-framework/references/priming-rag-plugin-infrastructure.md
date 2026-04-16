# Priming-RAG: Plugin Infrastructure
> MetodologIA Discovery Framework — Infraestructura del plugin
> Procesado: 2026-03-14 | Version: v12.0.0
> Fuentes: plugin root files, hooks, scripts, settings

---

## Fuentes procesadas

| Archivo | Ruta | Tipo |
|---------|------|------|
| README.md | `$SDF/README.md` | Documentacion publica |
| CLAUDE.md | `$SDF/CLAUDE.md` | Instrucciones para Claude Code |
| CHANGELOG.md | `$SDF/CHANGELOG.md` | Historial de versiones |
| LICENSE | `$SDF/LICENSE` | Licencia propietaria |
| settings.json | `$SDF/settings.json` | Configuracion del plugin |
| plan.md | `$SDF/plan.md` | Plan de desarrollo |
| hooks.json | `$SDF/hooks/hooks.json` | Hooks de sesion |
| index-repo.sh | `$SDF/scripts/index-repo.sh` | Script de indexacion |
| scan-deliverables.sh | `$SDF/scripts/scan-deliverables.sh` | Scanner de entregables |
| validate-deliverable.sh | `$SDF/scripts/validate-deliverable.sh` | Validador de entregables |
| service-type-matrix.md | `$SDF/references/service-type-matrix.md` | Matriz de routing |

---

## Valor para discovery y RAG

Este documento permite a cualquier agente comprender la estructura fundamental del plugin, su configuracion operativa, y las reglas de activacion. Es el primer documento a consultar cuando se necesita entender "como funciona MAO".

---

## Estructura del plugin

```
metodologia-discovery-framework/
  README.md              — Overview publico
  CLAUDE.md              — Reglas operativas para Claude Code
  CHANGELOG.md           — Historial v0.x -> v11.0.0
  LICENSE                — MIT, Comunidad MetodologIA
  settings.json          — {"agent": "discovery-conductor"}
  plan.md                — Roadmap del plugin
  landing.html           — Landing page (MetodologIA Design System v5)
  prompt-library.html    — Biblioteca interactiva de prompts
  agents/                — 48 agentes especializados (.md)
  commands/              — 96 comandos (30 primary + 62 aliases) (.md)
  skills/                — 100 skills por dominio (directorios/)
  prompts/               — 5 archivos de prompts + versions/
  references/            — Documentos de referencia y priming-RAG
  hooks/                 — hooks.json (SessionStart)
  scripts/               — 3 shell scripts de operacion
```

---

## Configuracion clave

### settings.json
- Agente por defecto: `discovery-conductor`
- El conductor se activa automaticamente al invocar el plugin

### hooks.json
- **Trigger:** SessionStart
- **Tipo:** prompt
- **Comportamiento:** Presenta nota de estado del plugin al iniciar sesion
- **Contenido:** Version, contadores de assets, modelo de checkpoint, quality gates, instrucciones de invocacion

### Modelo de ejecucion
- **MAO** = MetodologIA Agentic Gateway to Excellence
- **Prefijo tecnico:** `/mao:` (backward-compatible con `metodologia-discovery-framework:`)
- **Pipeline:** 16 entregables (00-brief hasta 16-excellence-report)
- **Checkpoints:** CP-0 (inicio) hasta CP-F (final)
- **Quality gates:** 3 gates de validacion
- **Excellence loop:** rubrica de 10 criterios, puntaje minimo 7/10
- **HITL:** piloto-auto por defecto (minimal human intervention)

---

## Scripts de operacion

### index-repo.sh
- Indexa el repositorio del cliente
- Genera inventario de archivos, lenguajes, dependencias
- Produce metadata para input-analysis

### scan-deliverables.sh
- Escanea directorio output/ buscando entregables generados
- Clasifica: completo, incompleto, faltante
- Genera reporte de estado del pipeline

### validate-deliverable.sh
- Valida un entregable individual contra la rubrica
- Verifica estructura, secciones requeridas, evidencia trazable
- Produce puntuacion de calidad

---

## Service Type Routing

El parametro `{TIPO_SERVICIO}` define la configuracion completa del engagement:

| Tipo | Skills primarios | Foco |
|------|-----------------|------|
| **SDA** (default) | asis, flows, scenarios, roadmap, spec | Architecture + Technical Debt |
| **QA** | asis, scenarios, roadmap | Quality Strategy + Coverage Gaps |
| **Management** | plan, stakeholders, asis, roadmap | Process Maturity + Governance |
| **RPA** | asis, flows, scenarios, roadmap | Process Automation Potential |
| **Data-AI** | asis, flows, scenarios, roadmap, spec | Data Maturity + AI Readiness |
| **Cloud** | asis, scenarios, roadmap | Cloud Readiness + Migration |
| **SAS** | stakeholders, asis | Talent + Team Scaling |
| **UX-Design** | asis, flows | UX Research + Design System |
| **Digital-Transformation** | all pipeline | Multi-workstream Modernization |
| **Multi-Service** | custom | Combinacion de tipos |

Auto-deteccion basada en keywords de la conversacion. Confirmacion: "Tipo de servicio detectado: {X}. Confirma o desea ajustar?"

---

## Licencia y branding

- **Licencia:** MIT, Comunidad MetodologIA
- **Colores:** Primary #6366F1, Dark #1A1A2E, Success #22D3EE (NUNCA verde)
- **Formato de salida:** Markdown-first, Mermaid para diagramas
- **Idioma default:** Espanol (Latin American, business register)
- **Costos:** Solo drivers y magnitudes (FTE-meses), NUNCA precios finales
- **Evidencia:** [CODIGO], [CONFIG], [DOC], [INFERENCIA], [SUPUESTO]

---

## Key takeaways

1. El plugin opera como un ecosistema completo de discovery pre-sales
2. discovery-conductor es siempre el agente orquestador
3. El routing por tipo de servicio determina toda la configuracion del engagement
4. 3 scripts automatizados para indexacion, escaneo y validacion
5. SessionStart hook provee contexto inmediato al usuario
6. Excellence loop garantiza calidad minima en cada entregable

---

## Keywords y hashtags

`#plugin` `#infraestructura` `#configuracion` `#sage` `#sdf` `#settings` `#hooks` `#scripts` `#routing` `#service-type` `#branding` `#licencia` `#pipeline` `#checkpoints` `#quality-gates` `#excellence-loop`

---

## Query hooks

- "Como esta configurado el plugin?" -> Este documento
- "Que tipos de servicio soporta MAO?" -> Seccion Service Type Routing
- "Que scripts hay disponibles?" -> Seccion Scripts de operacion
- "Como se activa el plugin?" -> Seccion hooks.json
- "Cual es el agente por defecto?" -> discovery-conductor (settings.json)
- "Que colores usa MetodologIA?" -> Seccion Licencia y branding

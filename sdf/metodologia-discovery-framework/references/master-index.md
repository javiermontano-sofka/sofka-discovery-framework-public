# Master Index — MAO Framework Ecosystem
> Indice maestro de archivos accesibles para discovery, RAG y consulta rapida.
> Generado: 2026-03-15 | Version: v12.0.0
> MAO = MetodologIA Agentic Gateway to Excellence

## Convencion de procesamiento
- Cada archivo tiene un priming-RAG asociado (individual o grupal)
- Tags de consulta para busqueda semantica
- Estado de procesamiento tracked
- Rutas absolutas desde `~/skills/plugins/metodologia-discovery-framework/` (alias: `$SDF`)

---

## 1. Plugin Root

| Archivo | Tipo | Ruta | RAG Doc | Utilidad | Tags |
|---------|------|------|---------|----------|------|
| README.md | Markdown | `$SDF/README.md` | priming-rag-plugin-infrastructure.md | Documentacion publica, overview del plugin | #readme #overview #onboarding |
| CLAUDE.md | Markdown | `$SDF/CLAUDE.md` | priming-rag-plugin-infrastructure.md | Instrucciones para Claude Code, reglas de operacion | #claude #instrucciones #config |
| CHANGELOG.md | Markdown | `$SDF/CHANGELOG.md` | priming-rag-plugin-infrastructure.md | Historial de versiones y cambios | #changelog #versiones #historial |
| LICENSE | Text | `$SDF/LICENSE` | priming-rag-plugin-infrastructure.md | Licencia propietaria Comunidad MetodologIA | #licencia #legal #propietario |
| settings.json | JSON | `$SDF/settings.json` | priming-rag-plugin-infrastructure.md | Configuracion del plugin (agente default: discovery-conductor) | #config #settings #conductor |
| plan.md | Markdown | `$SDF/plan.md` | priming-rag-plugin-infrastructure.md | Plan de desarrollo y roadmap del plugin | #plan #roadmap #desarrollo |
| landing.html | HTML | `$SDF/landing.html` | priming-rag-html-assets.md | Landing page del plugin, MetodologIA Design System v5 | #html #landing #branding |
| prompt-library.html | HTML | `$SDF/prompt-library.html` | priming-rag-html-assets.md | Biblioteca visual de prompts, UI interactiva | #html #prompts #biblioteca |

---

## 2. Agents (48)

### Core Team (12)

| Agente | Tipo | Ruta | RAG Doc | Rol | Tags |
|--------|------|------|---------|-----|------|
| discovery-conductor | Agent | `$SDF/agents/discovery-conductor.md` | priming-rag-agents-roster.md | Orquestador principal, lider del comite permanente | #conductor #orquestador #triada |
| technical-architect | Agent | `$SDF/agents/technical-architect.md` | priming-rag-agents-roster.md | Arquitecto tecnico, evaluacion de sistemas | #arquitectura #tecnico #triada |
| domain-analyst | Agent | `$SDF/agents/domain-analyst.md` | priming-rag-agents-roster.md | Analista de dominio de negocio | #dominio #negocio #triada |
| full-stack-generalist | Agent | `$SDF/agents/full-stack-generalist.md` | priming-rag-agents-roster.md | Generalista tecnico, soporte transversal | #fullstack #generalista #core |
| delivery-manager | Agent | `$SDF/agents/delivery-manager.md` | priming-rag-agents-roster.md | Gestion de entrega y governance | #delivery #gestion #governance |
| quality-guardian | Agent | `$SDF/agents/quality-guardian.md` | priming-rag-agents-roster.md | Guardian de calidad, excellence-loop | #calidad #excellence #guardian |
| data-strategist | Agent | `$SDF/agents/data-strategist.md` | priming-rag-agents-roster.md | Estrategia de datos y analytics | #datos #estrategia #analytics |
| change-catalyst | Agent | `$SDF/agents/change-catalyst.md` | priming-rag-agents-roster.md | Gestion del cambio organizacional | #cambio #organizacional #adopcion |
| ai-strategist | Agent | `$SDF/agents/ai-strategist.md` | priming-rag-agents-roster.md | Estrategia de IA y oportunidades | #ia #estrategia #oportunidades |
| process-automation-specialist | Agent | `$SDF/agents/process-automation-specialist.md` | priming-rag-agents-roster.md | Automatizacion de procesos, RPA | #rpa #automatizacion #procesos |
| qa-strategist | Agent | `$SDF/agents/qa-strategist.md` | priming-rag-agents-roster.md | Estrategia de QA y testing | #qa #testing #estrategia |
| transformation-architect | Agent | `$SDF/agents/transformation-architect.md` | priming-rag-agents-roster.md | Arquitecto de transformacion digital | #transformacion #digital #arquitecto |

### Architecture (5)

| Agente | Tipo | Ruta | RAG Doc | Rol | Tags |
|--------|------|------|---------|-----|------|
| enterprise-architect | Agent | `$SDF/agents/enterprise-architect.md` | priming-rag-agents-roster.md | Arquitectura empresarial, TOGAF | #enterprise #togaf #arquitectura |
| solutions-architect | Agent | `$SDF/agents/solutions-architect.md` | priming-rag-agents-roster.md | Arquitectura de soluciones | #soluciones #arquitectura #diseno |
| cloud-architect | Agent | `$SDF/agents/cloud-architect.md` | priming-rag-agents-roster.md | Arquitectura cloud, migracion | #cloud #migracion #infraestructura |
| security-architect | Agent | `$SDF/agents/security-architect.md` | priming-rag-agents-roster.md | Arquitectura de seguridad | #seguridad #arquitectura #compliance |
| mobile-architect | Agent | `$SDF/agents/mobile-architect.md` | priming-rag-agents-roster.md | Arquitectura mobile, plataformas | #mobile #arquitectura #plataformas |

### Development (5)

| Agente | Tipo | Ruta | RAG Doc | Rol | Tags |
|--------|------|------|---------|-----|------|
| backend-developer | Agent | `$SDF/agents/backend-developer.md` | priming-rag-agents-roster.md | Desarrollo backend, APIs | #backend #desarrollo #apis |
| frontend-developer | Agent | `$SDF/agents/frontend-developer.md` | priming-rag-agents-roster.md | Desarrollo frontend, UI/UX tecnico | #frontend #desarrollo #ui |
| technical-lead | Agent | `$SDF/agents/technical-lead.md` | priming-rag-agents-roster.md | Liderazgo tecnico de equipo | #techlead #liderazgo #equipo |
| devops-engineer | Agent | `$SDF/agents/devops-engineer.md` | priming-rag-agents-roster.md | DevOps, CI/CD, infraestructura | #devops #cicd #infraestructura |
| middle-integrations-developer | Agent | `$SDF/agents/middle-integrations-developer.md` | priming-rag-agents-roster.md | Integraciones, middleware, ESB | #integraciones #middleware #esb |

### Data & AI (6)

| Agente | Tipo | Ruta | RAG Doc | Rol | Tags |
|--------|------|------|---------|-----|------|
| data-architect | Agent | `$SDF/agents/data-architect.md` | priming-rag-agents-roster.md | Arquitectura de datos | #datos #arquitectura #modelado |
| data-engineer | Agent | `$SDF/agents/data-engineer.md` | priming-rag-agents-roster.md | Ingenieria de datos, pipelines | #datos #ingenieria #pipelines |
| data-scientist | Agent | `$SDF/agents/data-scientist.md` | priming-rag-agents-roster.md | Ciencia de datos, ML | #datascience #ml #modelos |
| analytics-architect | Agent | `$SDF/agents/analytics-architect.md` | priming-rag-agents-roster.md | Arquitectura de analytics, BI | #analytics #bi #arquitectura |
| ai-architect | Agent | `$SDF/agents/ai-architect.md` | priming-rag-agents-roster.md | Arquitectura de IA, MLOps | #ia #arquitectura #mlops |
| ai-agent-architect | Agent | `$SDF/agents/ai-agent-architect.md` | priming-rag-agents-roster.md | Arquitectura de agentes IA | #agentes #ia #arquitectura |

### Infrastructure (3)

| Agente | Tipo | Ruta | RAG Doc | Rol | Tags |
|--------|------|------|---------|-----|------|
| platform-engineer | Agent | `$SDF/agents/platform-engineer.md` | priming-rag-agents-roster.md | Ingenieria de plataforma | #plataforma #ingenieria #iac |
| hardware-systems-engineer | Agent | `$SDF/agents/hardware-systems-engineer.md` | priming-rag-agents-roster.md | Sistemas de hardware, IoT | #hardware #sistemas #iot |
| devsecops-expert | Agent | `$SDF/agents/devsecops-expert.md` | priming-rag-agents-roster.md | DevSecOps, seguridad en pipeline | #devsecops #seguridad #pipeline |

### Quality & Research (5)

| Agente | Tipo | Ruta | RAG Doc | Rol | Tags |
|--------|------|------|---------|-----|------|
| quality-engineer | Agent | `$SDF/agents/quality-engineer.md` | priming-rag-agents-roster.md | Ingenieria de calidad, automation | #calidad #ingenieria #automation |
| research-scientist | Agent | `$SDF/agents/research-scientist.md` | priming-rag-agents-roster.md | Investigacion cientifica y tecnica | #investigacion #ciencia #tecnica |
| economics-researcher | Agent | `$SDF/agents/economics-researcher.md` | priming-rag-agents-roster.md | Investigacion economica, ROI | #economia #investigacion #roi |
| systems-theorist | Agent | `$SDF/agents/systems-theorist.md` | priming-rag-agents-roster.md | Teoria de sistemas, complejidad | #sistemas #teoria #complejidad |
| technology-scout | Agent | `$SDF/agents/technology-scout.md` | priming-rag-agents-roster.md | Vigilancia tecnologica, tendencias | #tecnologia #vigilancia #tendencias |
| integration-researcher | Agent | `$SDF/agents/integration-researcher.md` | priming-rag-agents-roster.md | Investigacion de integraciones | #integracion #investigacion #apis |

### Business & UX (6)

| Agente | Tipo | Ruta | RAG Doc | Rol | Tags |
|--------|------|------|---------|-----|------|
| business-analyst | Agent | `$SDF/agents/business-analyst.md` | priming-rag-agents-roster.md | Analisis de negocio, requerimientos | #negocio #analisis #requerimientos |
| subject-matter-expert | Agent | `$SDF/agents/subject-matter-expert.md` | priming-rag-agents-roster.md | Experto de dominio dinamico | #sme #dominio #experto |
| ux-researcher | Agent | `$SDF/agents/ux-researcher.md` | priming-rag-agents-roster.md | Investigacion UX, usabilidad | #ux #investigacion #usabilidad |
| ux-strategist | Agent | `$SDF/agents/ux-strategist.md` | priming-rag-agents-roster.md | Estrategia UX, design thinking | #ux #estrategia #designthinking |
| implementation-analyst | Agent | `$SDF/agents/implementation-analyst.md` | priming-rag-agents-roster.md | Analisis de implementacion | #implementacion #analisis #viabilidad |
| product-strategist | Agent | `$SDF/agents/product-strategist.md` | priming-rag-agents-roster.md | Estrategia de producto | #producto #estrategia #roadmap |

### Compliance (2)

| Agente | Tipo | Ruta | RAG Doc | Rol | Tags |
|--------|------|------|---------|-----|------|
| compliance-analyst | Agent | `$SDF/agents/compliance-analyst.md` | priming-rag-agents-roster.md | Cumplimiento normativo, regulacion | #compliance #normativo #regulacion |
| risk-controller | Agent | `$SDF/agents/risk-controller.md` | priming-rag-agents-roster.md | Control de riesgos, mitigacion | #riesgos #control #mitigacion |

### Editorial (3)

| Agente | Tipo | Ruta | RAG Doc | Rol | Tags |
|--------|------|------|---------|-----|------|
| content-strategist | Agent | `$SDF/agents/content-strategist.md` | priming-rag-agents-roster.md | Estrategia de contenido | #contenido #estrategia #editorial |
| editorial-director | Agent | `$SDF/agents/editorial-director.md` | priming-rag-agents-roster.md | Direccion editorial, tono y voz | #editorial #direccion #voz |
| format-specialist | Agent | `$SDF/agents/format-specialist.md` | priming-rag-agents-roster.md | Formatos de salida, plantillas | #formato #plantillas #salida |

---

## 3. Commands (84)

### Pipeline Flows (4)

| Comando | Tipo | Ruta | RAG Doc | Funcion | Tags |
|---------|------|------|---------|---------|------|
| run-guided | Command | `$SDF/commands/run-guided.md` | priming-rag-commands-reference.md | Pipeline completo cocreado con stakeholder | #pipeline #guiado #completo |
| run-auto | Command | `$SDF/commands/run-auto.md` | priming-rag-commands-reference.md | Pipeline autonomo desatendido | #pipeline #autonomo #desatendido |
| run-express | Command | `$SDF/commands/run-express.md` | priming-rag-commands-reference.md | Pipeline express (5 entregables) | #pipeline #express #rapido |
| run-deep | Command | `$SDF/commands/run-deep.md` | priming-rag-commands-reference.md | Pipeline deep-dive exhaustivo | #pipeline #deep #exhaustivo |

### Deliverables (17)

| Comando | Tipo | Ruta | RAG Doc | Funcion | Tags |
|---------|------|------|---------|---------|------|
| generate-plan | Command | `$SDF/commands/generate-plan.md` | priming-rag-commands-reference.md | Discovery plan (entregable 00) | #plan #governance #inicio |
| map-stakeholders | Command | `$SDF/commands/map-stakeholders.md` | priming-rag-commands-reference.md | Mapeo de stakeholders | #stakeholders #mapeo #actores |
| generate-brief | Command | `$SDF/commands/generate-brief.md` | priming-rag-commands-reference.md | Brief del cliente | #brief #cliente #contexto |
| diagnose-asis | Command | `$SDF/commands/diagnose-asis.md` | priming-rag-commands-reference.md | Diagnostico AS-IS | #asis #diagnostico #actual |
| trace-flows | Command | `$SDF/commands/trace-flows.md` | priming-rag-commands-reference.md | Trazado de flujos de negocio | #flujos #trazado #procesos |
| evaluate-scenarios | Command | `$SDF/commands/evaluate-scenarios.md` | priming-rag-commands-reference.md | Evaluacion de escenarios TO-BE | #escenarios #evaluacion #tobe |
| validate-feasibility | Command | `$SDF/commands/validate-feasibility.md` | priming-rag-commands-reference.md | Validacion de factibilidad multidimensional | #factibilidad #validacion #viabilidad |
| chart-roadmap | Command | `$SDF/commands/chart-roadmap.md` | priming-rag-commands-reference.md | Roadmap y plan de ejecucion | #roadmap #plan #ejecucion |
| write-spec | Command | `$SDF/commands/write-spec.md` | priming-rag-commands-reference.md | Especificacion funcional/tecnica | #spec #especificacion #documentacion |
| craft-pitch | Command | `$SDF/commands/craft-pitch.md` | priming-rag-commands-reference.md | Pitch ejecutivo comercial | #pitch #comercial #ejecutivo |
| deliver-handover | Command | `$SDF/commands/deliver-handover.md` | priming-rag-commands-reference.md | Paquete de handover | #handover #entrega #paquete |
| present-findings | Command | `$SDF/commands/present-findings.md` | priming-rag-commands-reference.md | Presentacion de hallazgos | #presentacion #hallazgos #findings |
| report-tech | Command | `$SDF/commands/report-tech.md` | priming-rag-commands-reference.md | Reporte tecnico | #reporte #tecnico #arquitectura |
| report-func | Command | `$SDF/commands/report-func.md` | priming-rag-commands-reference.md | Reporte funcional | #reporte #funcional #negocio |
| review-business | Command | `$SDF/commands/review-business.md` | priming-rag-commands-reference.md | Review de negocio | #review #negocio #comercial |
| discover-ai | Command | `$SDF/commands/discover-ai.md` | priming-rag-commands-reference.md | Discovery de oportunidades IA | #ia #discovery #oportunidades |
| benchmark-maturity | Command | `$SDF/commands/benchmark-maturity.md` | priming-rag-commands-reference.md | Benchmark de madurez | #benchmark #madurez #evaluacion |

### Assessments (5)

| Comando | Tipo | Ruta | RAG Doc | Funcion | Tags |
|---------|------|------|---------|---------|------|
| assess-architecture | Command | `$SDF/commands/assess-architecture.md` | priming-rag-commands-reference.md | Deep-dive arquitectonico | #assessment #arquitectura #deepdive |
| assess-data | Command | `$SDF/commands/assess-data.md` | priming-rag-commands-reference.md | Assessment de datos | #assessment #datos #madurez |
| assess-cloud | Command | `$SDF/commands/assess-cloud.md` | priming-rag-commands-reference.md | Assessment cloud readiness | #assessment #cloud #readiness |
| assess-security | Command | `$SDF/commands/assess-security.md` | priming-rag-commands-reference.md | Assessment de seguridad | #assessment #seguridad #postura |
| assess-change | Command | `$SDF/commands/assess-change.md` | priming-rag-commands-reference.md | Assessment de gestion del cambio | #assessment #cambio #readiness |

### Operations (4)

| Comando | Tipo | Ruta | RAG Doc | Funcion | Tags |
|---------|------|------|---------|---------|------|
| audit-quality | Command | `$SDF/commands/audit-quality.md` | priming-rag-commands-reference.md | Auditoria de calidad de entregables | #auditoria #calidad #entregables |
| improve-deliverables | Command | `$SDF/commands/improve-deliverables.md` | priming-rag-commands-reference.md | Mejora iterativa de entregables | #mejora #iterativa #entregables |
| rescue-stalled | Command | `$SDF/commands/rescue-stalled.md` | priming-rag-commands-reference.md | Rescate de discovery estancado | #rescate #estancado #recovery |
| simulate-scenarios | Command | `$SDF/commands/simulate-scenarios.md` | priming-rag-commands-reference.md | Simulacion de escenarios what-if | #simulacion #escenarios #whatif |

### Aliases (54)

| Alias | Tipo | Ruta | RAG Doc | Mapea a | Tags |
|-------|------|------|---------|---------|------|
| guide | Alias | `$SDF/commands/guide.md` | priming-rag-commands-reference.md | run-guided | #alias #guiado |
| auto | Alias | `$SDF/commands/auto.md` | priming-rag-commands-reference.md | run-auto | #alias #autonomo |
| express | Alias | `$SDF/commands/express.md` | priming-rag-commands-reference.md | run-express | #alias #express |
| deep | Alias | `$SDF/commands/deep.md` | priming-rag-commands-reference.md | run-deep | #alias #deep |
| discovery | Alias | `$SDF/commands/discovery.md` | priming-rag-commands-reference.md | run-guided | #alias #discovery |
| discovery-auto | Alias | `$SDF/commands/discovery-auto.md` | priming-rag-commands-reference.md | run-auto | #alias #auto |
| discovery-improve | Alias | `$SDF/commands/discovery-improve.md` | priming-rag-commands-reference.md | improve-deliverables | #alias #improve |
| discovery-review | Alias | `$SDF/commands/discovery-review.md` | priming-rag-commands-reference.md | review-business | #alias #review |
| plan | Alias | `$SDF/commands/plan.md` | priming-rag-commands-reference.md | generate-plan | #alias #plan |
| stakeholders | Alias | `$SDF/commands/stakeholders.md` | priming-rag-commands-reference.md | map-stakeholders | #alias #stakeholders |
| brief | Alias | `$SDF/commands/brief.md` | priming-rag-commands-reference.md | generate-brief | #alias #brief |
| asis | Alias | `$SDF/commands/asis.md` | priming-rag-commands-reference.md | diagnose-asis | #alias #asis |
| diagnose | Alias | `$SDF/commands/diagnose.md` | priming-rag-commands-reference.md | diagnose-asis | #alias #diagnose |
| flows | Alias | `$SDF/commands/flows.md` | priming-rag-commands-reference.md | trace-flows | #alias #flows |
| trace | Alias | `$SDF/commands/trace.md` | priming-rag-commands-reference.md | trace-flows | #alias #trace |
| scenarios | Alias | `$SDF/commands/scenarios.md` | priming-rag-commands-reference.md | evaluate-scenarios | #alias #scenarios |
| evaluate | Alias | `$SDF/commands/evaluate.md` | priming-rag-commands-reference.md | evaluate-scenarios | #alias #evaluate |
| feasibility | Alias | `$SDF/commands/feasibility.md` | priming-rag-commands-reference.md | validate-feasibility | #alias #feasibility |
| validate | Alias | `$SDF/commands/validate.md` | priming-rag-commands-reference.md | validate-feasibility | #alias #validate |
| roadmap | Alias | `$SDF/commands/roadmap.md` | priming-rag-commands-reference.md | chart-roadmap | #alias #roadmap |
| chart | Alias | `$SDF/commands/chart.md` | priming-rag-commands-reference.md | chart-roadmap | #alias #chart |
| spec | Alias | `$SDF/commands/spec.md` | priming-rag-commands-reference.md | write-spec | #alias #spec |
| pitch | Alias | `$SDF/commands/pitch.md` | priming-rag-commands-reference.md | craft-pitch | #alias #pitch |
| craft | Alias | `$SDF/commands/craft.md` | priming-rag-commands-reference.md | craft-pitch | #alias #craft |
| handover | Alias | `$SDF/commands/handover.md` | priming-rag-commands-reference.md | deliver-handover | #alias #handover |
| deliver | Alias | `$SDF/commands/deliver.md` | priming-rag-commands-reference.md | deliver-handover | #alias #deliver |
| findings | Alias | `$SDF/commands/findings.md` | priming-rag-commands-reference.md | present-findings | #alias #findings |
| tech | Alias | `$SDF/commands/tech.md` | priming-rag-commands-reference.md | report-tech | #alias #tech |
| func | Alias | `$SDF/commands/func.md` | priming-rag-commands-reference.md | report-func | #alias #func |
| biz | Alias | `$SDF/commands/biz.md` | priming-rag-commands-reference.md | review-business | #alias #biz |
| ai | Alias | `$SDF/commands/ai.md` | priming-rag-commands-reference.md | discover-ai | #alias #ai |
| arch | Alias | `$SDF/commands/arch.md` | priming-rag-commands-reference.md | assess-architecture | #alias #arch |
| data | Alias | `$SDF/commands/data.md` | priming-rag-commands-reference.md | assess-data | #alias #data |
| cloud | Alias | `$SDF/commands/cloud.md` | priming-rag-commands-reference.md | assess-cloud | #alias #cloud |
| security | Alias | `$SDF/commands/security.md` | priming-rag-commands-reference.md | assess-security | #alias #security |
| change | Alias | `$SDF/commands/change.md` | priming-rag-commands-reference.md | assess-change | #alias #change |
| audit | Alias | `$SDF/commands/audit.md` | priming-rag-commands-reference.md | audit-quality | #alias #audit |
| improve | Alias | `$SDF/commands/improve.md` | priming-rag-commands-reference.md | improve-deliverables | #alias #improve |
| rescue | Alias | `$SDF/commands/rescue.md` | priming-rag-commands-reference.md | rescue-stalled | #alias #rescue |
| intermediate | Alias | `$SDF/commands/intermediate.md` | priming-rag-commands-reference.md | run-guided (modo intermedio) | #alias #intermedio |
| findings-deck | Alias | `$SDF/commands/findings-deck.md` | priming-rag-commands-reference.md | present-findings (deck) | #alias #deck |
| technical-findings | Alias | `$SDF/commands/technical-findings.md` | priming-rag-commands-reference.md | report-tech | #alias #technical |
| functional-findings | Alias | `$SDF/commands/functional-findings.md` | priming-rag-commands-reference.md | report-func | #alias #functional |
| business-review | Alias | `$SDF/commands/business-review.md` | priming-rag-commands-reference.md | review-business | #alias #business |
| ai-discovery | Alias | `$SDF/commands/ai-discovery.md` | priming-rag-commands-reference.md | discover-ai | #alias #ai-discovery |
| ai-opportunities | Alias | `$SDF/commands/ai-opportunities.md` | priming-rag-commands-reference.md | discover-ai | #alias #ai-opp |
| architecture-deep-dive | Alias | `$SDF/commands/architecture-deep-dive.md` | priming-rag-commands-reference.md | assess-architecture | #alias #arch-deep |
| data-landscape | Alias | `$SDF/commands/data-landscape.md` | priming-rag-commands-reference.md | assess-data | #alias #data-landscape |
| cloud-readiness | Alias | `$SDF/commands/cloud-readiness.md` | priming-rag-commands-reference.md | assess-cloud | #alias #cloud-readiness |
| security-posture | Alias | `$SDF/commands/security-posture.md` | priming-rag-commands-reference.md | assess-security | #alias #security-posture |
| change-readiness | Alias | `$SDF/commands/change-readiness.md` | priming-rag-commands-reference.md | assess-change | #alias #change-readiness |
| transformation | Alias | `$SDF/commands/transformation.md` | priming-rag-commands-reference.md | run-deep (transformation) | #alias #transformation |
| qa-discovery | Alias | `$SDF/commands/qa-discovery.md` | priming-rag-commands-reference.md | discover (QA service type) | #alias #qa |
| rpa-discovery | Alias | `$SDF/commands/rpa-discovery.md` | priming-rag-commands-reference.md | discover (RPA service type) | #alias #rpa |

---

## 4. Skills (100)

### Architecture & Design (15)

| Skill | Domain | Ruta | RAG Doc | Funcion | Tags |
|-------|--------|------|---------|---------|------|
| api-architecture | Architecture | `$SDF/skills/api-architecture/` | priming-rag-skills-catalog.md | Diseno de APIs, contratos, governance | #api #arquitectura #contratos |
| architecture-tobe | Architecture | `$SDF/skills/architecture-tobe/` | priming-rag-skills-catalog.md | Arquitectura TO-BE target state | #tobe #arquitectura #target |
| cloud-native-architecture | Architecture | `$SDF/skills/cloud-native-architecture/` | priming-rag-skills-catalog.md | Arquitectura cloud-native | #cloudnative #arquitectura #k8s |
| database-architecture | Architecture | `$SDF/skills/database-architecture/` | priming-rag-skills-catalog.md | Arquitectura de bases de datos | #database #arquitectura #modelado |
| design-system | Architecture | `$SDF/skills/design-system/` | priming-rag-skills-catalog.md | Sistema de diseno, tokens, componentes | #design #sistema #tokens |
| enterprise-architecture | Architecture | `$SDF/skills/enterprise-architecture/` | priming-rag-skills-catalog.md | Arquitectura empresarial TOGAF | #enterprise #togaf #capacidades |
| event-architecture | Architecture | `$SDF/skills/event-architecture/` | priming-rag-skills-catalog.md | Arquitectura event-driven | #eventos #arquitectura #eda |
| infrastructure-architecture | Architecture | `$SDF/skills/infrastructure-architecture/` | priming-rag-skills-catalog.md | Arquitectura de infraestructura | #infraestructura #arquitectura #iac |
| integration-architecture | Architecture | `$SDF/skills/integration-architecture/` | priming-rag-skills-catalog.md | Arquitectura de integraciones | #integracion #arquitectura #esb |
| mobile-architecture | Architecture | `$SDF/skills/mobile-architecture/` | priming-rag-skills-catalog.md | Arquitectura mobile | #mobile #arquitectura #plataformas |
| security-architecture | Architecture | `$SDF/skills/security-architecture/` | priming-rag-skills-catalog.md | Arquitectura de seguridad | #seguridad #arquitectura #zero-trust |
| software-architecture | Architecture | `$SDF/skills/software-architecture/` | priming-rag-skills-catalog.md | Arquitectura de software | #software #arquitectura #patrones |
| solutions-architecture | Architecture | `$SDF/skills/solutions-architecture/` | priming-rag-skills-catalog.md | Arquitectura de soluciones | #soluciones #arquitectura #diseno |
| devsecops-architecture | Architecture | `$SDF/skills/devsecops-architecture/` | priming-rag-skills-catalog.md | Arquitectura DevSecOps | #devsecops #seguridad #pipeline |
| documentation-architecture | Architecture | `$SDF/skills/documentation-architecture/` | priming-rag-skills-catalog.md | Arquitectura de documentacion | #documentacion #arquitectura #estructura |

### Data & Analytics (10)

| Skill | Domain | Ruta | RAG Doc | Funcion | Tags |
|-------|--------|------|---------|---------|------|
| analytics-engineering | Data | `$SDF/skills/analytics-engineering/` | priming-rag-skills-catalog.md | Ingenieria de analytics | #analytics #ingenieria #dbt |
| bi-analytics-discovery | Data | `$SDF/skills/bi-analytics-discovery/` | priming-rag-skills-catalog.md | Discovery de BI y analytics | #bi #analytics #discovery |
| bi-architecture | Data | `$SDF/skills/bi-architecture/` | priming-rag-skills-catalog.md | Arquitectura de BI | #bi #arquitectura #dashboards |
| data-engineering | Data | `$SDF/skills/data-engineering/` | priming-rag-skills-catalog.md | Ingenieria de datos | #datos #ingenieria #pipelines |
| data-governance | Data | `$SDF/skills/data-governance/` | priming-rag-skills-catalog.md | Gobernanza de datos | #datos #gobernanza #calidad |
| data-mesh-strategy | Data | `$SDF/skills/data-mesh-strategy/` | priming-rag-skills-catalog.md | Estrategia data mesh | #datamesh #estrategia #dominios |
| data-quality | Data | `$SDF/skills/data-quality/` | priming-rag-skills-catalog.md | Calidad de datos | #datos #calidad #profiling |
| data-science-architecture | Data | `$SDF/skills/data-science-architecture/` | priming-rag-skills-catalog.md | Arquitectura de ciencia de datos | #datascience #arquitectura #mlops |
| data-storytelling | Data | `$SDF/skills/data-storytelling/` | priming-rag-skills-catalog.md | Storytelling con datos | #datos #storytelling #narrativa |
| data-viz-storytelling | Data | `$SDF/skills/data-viz-storytelling/` | priming-rag-skills-catalog.md | Visualizacion de datos narrativa | #dataviz #storytelling #visualizacion |

### Cloud & Infrastructure (5)

| Skill | Domain | Ruta | RAG Doc | Funcion | Tags |
|-------|--------|------|---------|---------|------|
| cloud-migration | Cloud | `$SDF/skills/cloud-migration/` | priming-rag-skills-catalog.md | Migracion a la nube | #cloud #migracion #7rs |
| cloud-service-discovery | Cloud | `$SDF/skills/cloud-service-discovery/` | priming-rag-skills-catalog.md | Discovery de servicios cloud | #cloud #discovery #servicios |
| disaster-recovery | Cloud | `$SDF/skills/disaster-recovery/` | priming-rag-skills-catalog.md | Recuperacion ante desastres | #dr #recuperacion #continuidad |
| finops | Cloud | `$SDF/skills/finops/` | priming-rag-skills-catalog.md | Optimizacion financiera cloud | #finops #cloud #costos |
| observability | Cloud | `$SDF/skills/observability/` | priming-rag-skills-catalog.md | Observabilidad, monitoreo | #observabilidad #monitoreo #sre |

### AI & Automation (4)

| Skill | Domain | Ruta | RAG Doc | Funcion | Tags |
|-------|--------|------|---------|---------|------|
| ai-center-discovery | AI | `$SDF/skills/ai-center-discovery/` | priming-rag-skills-catalog.md | Discovery de centro de IA | #ia #centro #discovery |
| digital-transformation-discovery | AI | `$SDF/skills/digital-transformation-discovery/` | priming-rag-skills-catalog.md | Discovery de transformacion digital | #transformacion #digital #discovery |
| rpa-discovery | AI | `$SDF/skills/rpa-discovery/` | priming-rag-skills-catalog.md | Discovery de RPA | #rpa #discovery #automatizacion |
| hypothesis-driven-development | AI | `$SDF/skills/hypothesis-driven-development/` | priming-rag-skills-catalog.md | Desarrollo dirigido por hipotesis | #hipotesis #desarrollo #experimentacion |

### Discovery Pipeline (12)

| Skill | Domain | Ruta | RAG Doc | Funcion | Tags |
|-------|--------|------|---------|---------|------|
| asis-analysis | Pipeline | `$SDF/skills/asis-analysis/` | priming-rag-skills-catalog.md | Analisis AS-IS | #asis #analisis #diagnostico |
| discovery-orchestrator | Pipeline | `$SDF/skills/discovery-orchestrator/` | priming-rag-skills-catalog.md | Orquestacion del discovery | #orquestacion #pipeline #discovery |
| discovery-handover | Pipeline | `$SDF/skills/discovery-handover/` | priming-rag-skills-catalog.md | Handover de discovery | #handover #entrega #paquete |
| flow-mapping | Pipeline | `$SDF/skills/flow-mapping/` | priming-rag-skills-catalog.md | Mapeo de flujos de negocio | #flujos #mapeo #procesos |
| functional-spec | Pipeline | `$SDF/skills/functional-spec/` | priming-rag-skills-catalog.md | Especificacion funcional | #spec #funcional #documentacion |
| input-analysis | Pipeline | `$SDF/skills/input-analysis/` | priming-rag-skills-catalog.md | Analisis de inputs | #inputs #analisis #contexto |
| multidimensional-feasibility | Pipeline | `$SDF/skills/multidimensional-feasibility/` | priming-rag-skills-catalog.md | Factibilidad multidimensional | #factibilidad #multidimensional #viabilidad |
| scenario-analysis | Pipeline | `$SDF/skills/scenario-analysis/` | priming-rag-skills-catalog.md | Analisis de escenarios | #escenarios #analisis #tobe |
| stakeholder-mapping | Pipeline | `$SDF/skills/stakeholder-mapping/` | priming-rag-skills-catalog.md | Mapeo de stakeholders | #stakeholders #mapeo #actores |
| output-engineering | Pipeline | `$SDF/skills/output-engineering/` | priming-rag-skills-catalog.md | Ingenieria de salidas | #output #ingenieria #formatos |
| pipeline-governance | Pipeline | `$SDF/skills/pipeline-governance/` | priming-rag-skills-catalog.md | Gobernanza del pipeline | #pipeline #gobernanza #gates |
| dynamic-sme | Pipeline | `$SDF/skills/dynamic-sme/` | priming-rag-skills-catalog.md | SME dinamico contextual | #sme #dinamico #experto |

### Quality & Testing (5)

| Skill | Domain | Ruta | RAG Doc | Funcion | Tags |
|-------|--------|------|---------|---------|------|
| quality-engineering | Quality | `$SDF/skills/quality-engineering/` | priming-rag-skills-catalog.md | Ingenieria de calidad | #calidad #ingenieria #automation |
| testing-strategy | Quality | `$SDF/skills/testing-strategy/` | priming-rag-skills-catalog.md | Estrategia de testing | #testing #estrategia #cobertura |
| qa-service-discovery | Quality | `$SDF/skills/qa-service-discovery/` | priming-rag-skills-catalog.md | Discovery de servicios QA | #qa #discovery #servicios |
| accessibility-audit | Quality | `$SDF/skills/accessibility-audit/` | priming-rag-skills-catalog.md | Auditoria de accesibilidad | #accesibilidad #auditoria #wcag |
| dependency-analysis | Quality | `$SDF/skills/dependency-analysis/` | priming-rag-skills-catalog.md | Analisis de dependencias | #dependencias #analisis #riesgos |

### Strategy & Business (14)

| Skill | Domain | Ruta | RAG Doc | Funcion | Tags |
|-------|--------|------|---------|---------|------|
| commercial-model | Strategy | `$SDF/skills/commercial-model/` | priming-rag-skills-catalog.md | Modelo comercial | #comercial #modelo #pricing |
| competitive-intelligence | Strategy | `$SDF/skills/competitive-intelligence/` | priming-rag-skills-catalog.md | Inteligencia competitiva | #competitiva #inteligencia #mercado |
| cost-estimation | Strategy | `$SDF/skills/cost-estimation/` | priming-rag-skills-catalog.md | Estimacion de costos | #costos #estimacion #sizing |
| executive-pitch | Strategy | `$SDF/skills/executive-pitch/` | priming-rag-skills-catalog.md | Pitch ejecutivo | #pitch #ejecutivo #comercial |
| product-strategy | Strategy | `$SDF/skills/product-strategy/` | priming-rag-skills-catalog.md | Estrategia de producto | #producto #estrategia #roadmap |
| roadmap-poc | Strategy | `$SDF/skills/roadmap-poc/` | priming-rag-skills-catalog.md | Roadmap y PoC | #roadmap #poc #planificacion |
| sector-intelligence | Strategy | `$SDF/skills/sector-intelligence/` | priming-rag-skills-catalog.md | Inteligencia sectorial | #sector #inteligencia #industria |
| solution-roadmap | Strategy | `$SDF/skills/solution-roadmap/` | priming-rag-skills-catalog.md | Roadmap de solucion | #solucion #roadmap #fases |
| software-viability | Strategy | `$SDF/skills/software-viability/` | priming-rag-skills-catalog.md | Viabilidad de software | #viabilidad #software #evaluacion |
| technical-feasibility | Strategy | `$SDF/skills/technical-feasibility/` | priming-rag-skills-catalog.md | Factibilidad tecnica | #factibilidad #tecnica #evaluacion |
| adoption-strategy | Strategy | `$SDF/skills/adoption-strategy/` | priming-rag-skills-catalog.md | Estrategia de adopcion | #adopcion #estrategia #cambio |
| change-readiness-assessment | Strategy | `$SDF/skills/change-readiness-assessment/` | priming-rag-skills-catalog.md | Assessment de change readiness | #cambio #readiness #assessment |
| maturity-assessment | Strategy | `$SDF/skills/maturity-assessment/` | priming-rag-skills-catalog.md | Assessment de madurez | #madurez #assessment #benchmark |
| sustainability-assessment | Strategy | `$SDF/skills/sustainability-assessment/` | priming-rag-skills-catalog.md | Assessment de sostenibilidad | #sostenibilidad #assessment #esg |

### Management & Operations (10)

| Skill | Domain | Ruta | RAG Doc | Funcion | Tags |
|-------|--------|------|---------|---------|------|
| capacity-planning | Management | `$SDF/skills/capacity-planning/` | priming-rag-skills-catalog.md | Planificacion de capacidad | #capacidad #planificacion #recursos |
| execution-burndown | Management | `$SDF/skills/execution-burndown/` | priming-rag-skills-catalog.md | Burndown de ejecucion | #burndown #ejecucion #tracking |
| governance-framework | Management | `$SDF/skills/governance-framework/` | priming-rag-skills-catalog.md | Marco de gobernanza | #gobernanza #marco #governance |
| incident-management | Management | `$SDF/skills/incident-management/` | priming-rag-skills-catalog.md | Gestion de incidentes | #incidentes #gestion #respuesta |
| management-discovery | Management | `$SDF/skills/management-discovery/` | priming-rag-skills-catalog.md | Discovery de management | #management #discovery #pmo |
| project-program-management | Management | `$SDF/skills/project-program-management/` | priming-rag-skills-catalog.md | Gestion de proyectos/programas | #proyectos #programas #gestion |
| release-strategy | Management | `$SDF/skills/release-strategy/` | priming-rag-skills-catalog.md | Estrategia de releases | #releases #estrategia #entregas |
| risk-controlling-dynamics | Management | `$SDF/skills/risk-controlling-dynamics/` | priming-rag-skills-catalog.md | Dinamicas de control de riesgos | #riesgos #control #dinamicas |
| sla-design | Management | `$SDF/skills/sla-design/` | priming-rag-skills-catalog.md | Diseno de SLAs | #sla #diseno #niveles |
| vendor-assessment | Management | `$SDF/skills/vendor-assessment/` | priming-rag-skills-catalog.md | Evaluacion de proveedores | #vendors #evaluacion #proveedores |

### UX & Content (7)

| Skill | Domain | Ruta | RAG Doc | Funcion | Tags |
|-------|--------|------|---------|---------|------|
| ux-design-discovery | UX | `$SDF/skills/ux-design-discovery/` | priming-rag-skills-catalog.md | Discovery de diseno UX | #ux #diseno #discovery |
| ux-writing | UX | `$SDF/skills/ux-writing/` | priming-rag-skills-catalog.md | UX writing, microcopy | #ux #writing #microcopy |
| user-representative | UX | `$SDF/skills/user-representative/` | priming-rag-skills-catalog.md | Representante de usuario | #usuario #representante #voz |
| copywriting | Content | `$SDF/skills/copywriting/` | priming-rag-skills-catalog.md | Copywriting comercial | #copywriting #contenido #comercial |
| storytelling | Content | `$SDF/skills/storytelling/` | priming-rag-skills-catalog.md | Storytelling narrativo | #storytelling #narrativa #comunicacion |
| technical-writing | Content | `$SDF/skills/technical-writing/` | priming-rag-skills-catalog.md | Escritura tecnica | #escritura #tecnica #documentacion |
| html-brand | Content | `$SDF/skills/html-brand/` | priming-rag-skills-catalog.md | Branding HTML, design system | #html #branding #design |

### Specialized Discovery (8)

| Skill | Domain | Ruta | RAG Doc | Funcion | Tags |
|-------|--------|------|---------|---------|------|
| mini-apps-discovery | Discovery | `$SDF/skills/mini-apps-discovery/` | priming-rag-skills-catalog.md | Discovery de mini-apps | #miniapps #discovery #mvp |
| staff-augmentation-discovery | Discovery | `$SDF/skills/staff-augmentation-discovery/` | priming-rag-skills-catalog.md | Discovery de staff augmentation | #staffaug #discovery #talento |
| mentoring-training-discovery | Discovery | `$SDF/skills/mentoring-training-discovery/` | priming-rag-skills-catalog.md | Discovery de mentoring/training | #mentoring #training #discovery |
| mobile-assessment | Discovery | `$SDF/skills/mobile-assessment/` | priming-rag-skills-catalog.md | Assessment mobile | #mobile #assessment #plataformas |
| mobile-platform-assessment | Discovery | `$SDF/skills/mobile-platform-assessment/` | priming-rag-skills-catalog.md | Assessment de plataforma mobile | #mobile #plataforma #assessment |
| tech-debt-assessment | Discovery | `$SDF/skills/tech-debt-assessment/` | priming-rag-skills-catalog.md | Assessment de deuda tecnica | #techdebt #assessment #deuda |
| compliance-assessment | Discovery | `$SDF/skills/compliance-assessment/` | priming-rag-skills-catalog.md | Assessment de cumplimiento | #compliance #assessment #normativo |
| technology-vigilance | Discovery | `$SDF/skills/technology-vigilance/` | priming-rag-skills-catalog.md | Vigilancia tecnologica | #tecnologia #vigilancia #tendencias |

### Enablers & Tools (10)

| Skill | Domain | Ruta | RAG Doc | Funcion | Tags |
|-------|--------|------|---------|---------|------|
| developer-experience | Enabler | `$SDF/skills/developer-experience/` | priming-rag-skills-catalog.md | Developer experience, DX | #dx #experiencia #desarrollador |
| functional-toolbelt | Enabler | `$SDF/skills/functional-toolbelt/` | priming-rag-skills-catalog.md | Herramientas funcionales | #toolbelt #funcional #herramientas |
| mermaid-diagramming | Enabler | `$SDF/skills/mermaid-diagramming/` | priming-rag-skills-catalog.md | Diagramacion Mermaid | #mermaid #diagramas #visualizacion |
| migration-playbook | Enabler | `$SDF/skills/migration-playbook/` | priming-rag-skills-catalog.md | Playbook de migracion | #migracion #playbook #guia |
| onboarding-playbook | Enabler | `$SDF/skills/onboarding-playbook/` | priming-rag-skills-catalog.md | Playbook de onboarding | #onboarding #playbook #equipo |
| performance-engineering | Enabler | `$SDF/skills/performance-engineering/` | priming-rag-skills-catalog.md | Ingenieria de rendimiento | #performance #ingenieria #optimizacion |
| poc-lab | Enabler | `$SDF/skills/poc-lab/` | priming-rag-skills-catalog.md | Laboratorio de PoC | #poc #laboratorio #prototipo |
| team-topology | Enabler | `$SDF/skills/team-topology/` | priming-rag-skills-catalog.md | Topologia de equipos | #equipos #topologia #organizacion |
| workshop-design | Enabler | `$SDF/skills/workshop-design/` | priming-rag-skills-catalog.md | Diseno de workshops | #workshop #diseno #facilitacion |
| workshop-facilitator | Enabler | `$SDF/skills/workshop-facilitator/` | priming-rag-skills-catalog.md | Facilitacion de workshops | #workshop #facilitacion #dinamicas |

---

## 5. References (21)

| Reference | Tipo | Ruta | RAG Doc | Utilidad | Tags |
|-----------|------|------|---------|----------|------|
| master-index.md | Index | `$SDF/references/master-index.md` | (self) | Indice maestro del ecosistema | #indice #maestro #catalogo |
| service-type-matrix.md | Matrix | `$SDF/references/service-type-matrix.md` | priming-rag-plugin-infrastructure.md | Matriz de routing por tipo de servicio | #servicios #routing #matriz |
| priming-rag-metodologia-corporate.md | RAG | `$SDF/references/priming-rag/priming-rag-metodologia-corporate.md` | (self) | Informacion corporativa MetodologIA | #metodologia #corporativo #empresa |
| priming-rag-ai-center.md | RAG | `$SDF/references/priming-rag/priming-rag-ai-center.md` | (self) | Centro de IA MetodologIA | #ia #centro #metodologia |
| priming-rag-ai-center-v2-en.md | RAG | `$SDF/references/priming-rag/priming-rag-ai-center-v2-en.md` | (self) | AI Center v2 (English) | #ia #centro #english |
| priming-rag-ai-scale-methodology.md | RAG | `$SDF/references/priming-rag/priming-rag-ai-scale-methodology.md` | (self) | Metodologia AI Scale | #ia #escala #metodologia |
| priming-rag-apm-guidelines.md | RAG | `$SDF/references/priming-rag/priming-rag-apm-guidelines.md` | (self) | Guias APM | #apm #guias #rendimiento |
| priming-rag-banking-industry.md | RAG | `$SDF/references/priming-rag/priming-rag-banking-industry.md` | (self) | Industria bancaria | #banca #industria #sector |
| priming-rag-certifications.md | RAG | `$SDF/references/priming-rag/priming-rag-certifications.md` | (self) | Certificaciones MetodologIA | #certificaciones #talento #skills |
| priming-rag-cloud-capabilities.md | RAG | `$SDF/references/priming-rag/priming-rag-cloud-capabilities.md` | (self) | Capacidades cloud | #cloud #capacidades #servicios |
| priming-rag-coe-management.md | RAG | `$SDF/references/priming-rag/priming-rag-coe-management.md` | (self) | CoE de management | #coe #management #gobernanza |
| priming-rag-contractual-models.md | RAG | `$SDF/references/priming-rag/priming-rag-contractual-models.md` | (self) | Modelos contractuales | #contratos #modelos #comercial |
| priming-rag-data-ai-capabilities.md | RAG | `$SDF/references/priming-rag/priming-rag-data-ai-capabilities.md` | (self) | Capacidades Data & AI | #datos #ia #capacidades |
| priming-rag-impact-metrics.md | RAG | `$SDF/references/priming-rag/priming-rag-impact-metrics.md` | (self) | Metricas de impacto | #metricas #impacto #resultados |
| priming-rag-management-capabilities.md | RAG | `$SDF/references/priming-rag/priming-rag-management-capabilities.md` | (self) | Capacidades de management | #management #capacidades #servicios |
| priming-rag-management-offering-2026.md | RAG | `$SDF/references/priming-rag/priming-rag-management-offering-2026.md` | (self) | Oferta management 2026 | #management #oferta #2026 |
| priming-rag-qa-capabilities.md | RAG | `$SDF/references/priming-rag/priming-rag-qa-capabilities.md` | (self) | Capacidades QA | #qa #capacidades #testing |
| priming-rag-retail-industry.md | RAG | `$SDF/references/priming-rag/priming-rag-retail-industry.md` | (self) | Industria retail | #retail #industria #sector |
| priming-rag-rpa-capabilities.md | RAG | `$SDF/references/priming-rag/priming-rag-rpa-capabilities.md` | (self) | Capacidades RPA | #rpa #capacidades #automatizacion |
| priming-rag-sas-capabilities.md | RAG | `$SDF/references/priming-rag/priming-rag-sas-capabilities.md` | (self) | Capacidades SAS | #sas #staffaug #capacidades |
| priming-rag-sda-capabilities.md | RAG | `$SDF/references/priming-rag/priming-rag-sda-capabilities.md` | (self) | Capacidades SDA | #sda #desarrollo #capacidades |
| priming-rag-service-models.md | RAG | `$SDF/references/priming-rag/priming-rag-service-models.md` | (self) | Modelos de servicio | #servicios #modelos #delivery |

---

## 6. Prompts (versioned)

| Prompt File | Version | Ruta | RAG Doc | Contenido | Tags |
|-------------|---------|------|---------|-----------|------|
| flujos.md | v10.0 | `$SDF/prompts/flujos.md` | priming-rag-prompts-library.md | 8 flujos de discovery (autonomo, guiado, express, deep, etc.) | #flujos #pipeline #prompts |
| entregables.md | v10.0 | `$SDF/prompts/entregables.md` | priming-rag-prompts-library.md | 16 prompts por entregable (00-14 + 05b) | #entregables #prompts #pipeline |
| assessments.md | v10.0 | `$SDF/prompts/assessments.md` | priming-rag-prompts-library.md | 5 assessments de profundidad | #assessments #deepdive #prompts |
| operaciones.md | v10.0 | `$SDF/prompts/operaciones.md` | priming-rag-prompts-library.md | 4 operaciones sobre discoveries existentes | #operaciones #rescue #audit #prompts |
| metaprompts.md | v10.0 | `$SDF/prompts/metaprompts.md` | priming-rag-prompts-library.md | Generadores de prompts personalizados | #metaprompts #generadores #custom |
| versions/v0/ | v0 | `$SDF/prompts/versions/v0/` | priming-rag-prompts-library.md | Prompts version 0 (archivo historico) | #v0 #historico #prompts |
| versions/v1/ | v1 | `$SDF/prompts/versions/v1/` | priming-rag-prompts-library.md | Prompts version 1 (archivo historico) | #v1 #historico #prompts |

---

## 7. HTML Assets

| Asset | Tipo | Ruta | RAG Doc | Funcion | Tags |
|-------|------|------|---------|---------|------|
| landing.html | HTML | `$SDF/landing.html` | priming-rag-html-assets.md | Landing page MAO Framework, Design System v5 | #landing #html #branding |
| prompt-library.html | HTML | `$SDF/prompt-library.html` | priming-rag-html-assets.md | Biblioteca interactiva de prompts | #prompts #biblioteca #html |

---

## 8. Scripts

| Script | Tipo | Ruta | RAG Doc | Funcion | Tags |
|--------|------|------|---------|---------|------|
| index-repo.sh | Shell | `$SDF/scripts/index-repo.sh` | priming-rag-plugin-infrastructure.md | Indexacion del repositorio | #indexacion #script #repo |
| scan-deliverables.sh | Shell | `$SDF/scripts/scan-deliverables.sh` | priming-rag-plugin-infrastructure.md | Escaneo de entregables generados | #escaneo #entregables #script |
| validate-deliverable.sh | Shell | `$SDF/scripts/validate-deliverable.sh` | priming-rag-plugin-infrastructure.md | Validacion de entregables | #validacion #entregables #script |

---

## 9. Hooks

| Hook | Tipo | Ruta | RAG Doc | Trigger | Tags |
|------|------|------|---------|---------|------|
| hooks.json | JSON | `$SDF/hooks/hooks.json` | priming-rag-plugin-infrastructure.md | SessionStart: status note del plugin | #hook #sessionstart #config |

---

## 10. Global Skills (72)

| Skill | Ruta | RAG Doc | Utilidad | Tags |
|-------|------|---------|----------|------|
| agent-constitution-creator | `~/.claude/skills/agent-constitution-creator/` | priming-rag-global-ecosystem.md | Creacion de constituciones de agentes | #agente #constitucion #creador |
| agent-creator | `~/.claude/skills/agent-creator/` | priming-rag-global-ecosystem.md | Creacion de agentes | #agente #creador #builder |
| analytics-engineering | `~/.claude/skills/analytics-engineering/` | priming-rag-global-ecosystem.md | Ingenieria de analytics | #analytics #ingenieria |
| api-architecture | `~/.claude/skills/api-architecture/` | priming-rag-global-ecosystem.md | Arquitectura de APIs | #api #arquitectura |
| architecture-tobe | `~/.claude/skills/architecture-tobe/` | priming-rag-global-ecosystem.md | Arquitectura TO-BE | #tobe #arquitectura |
| asis-analysis | `~/.claude/skills/asis-analysis/` | priming-rag-global-ecosystem.md | Analisis AS-IS | #asis #analisis |
| bi-architecture | `~/.claude/skills/bi-architecture/` | priming-rag-global-ecosystem.md | Arquitectura BI | #bi #arquitectura |
| brand-docx | `~/.claude/skills/brand-docx/` | priming-rag-global-ecosystem.md | Branding DOCX | #docx #branding |
| brand-html | `~/.claude/skills/brand-html/` | priming-rag-global-ecosystem.md | Branding HTML | #html #branding |
| brand-voice | `~/.claude/skills/brand-voice/` | priming-rag-global-ecosystem.md | Voz de marca | #voz #marca #branding |
| brand-xlsx | `~/.claude/skills/brand-xlsx/` | priming-rag-global-ecosystem.md | Branding XLSX | #xlsx #branding |
| cloud-migration | `~/.claude/skills/cloud-migration/` | priming-rag-global-ecosystem.md | Migracion cloud | #cloud #migracion |
| cloud-native-architecture | `~/.claude/skills/cloud-native-architecture/` | priming-rag-global-ecosystem.md | Cloud native | #cloudnative #arquitectura |
| commercial-model | `~/.claude/skills/commercial-model/` | priming-rag-global-ecosystem.md | Modelo comercial | #comercial #modelo |
| cost-estimation | `~/.claude/skills/cost-estimation/` | priming-rag-global-ecosystem.md | Estimacion de costos | #costos #estimacion |
| data-engineering | `~/.claude/skills/data-engineering/` | priming-rag-global-ecosystem.md | Ingenieria de datos | #datos #ingenieria |
| data-governance | `~/.claude/skills/data-governance/` | priming-rag-global-ecosystem.md | Gobernanza de datos | #datos #gobernanza |
| data-quality | `~/.claude/skills/data-quality/` | priming-rag-global-ecosystem.md | Calidad de datos | #datos #calidad |
| data-science-architecture | `~/.claude/skills/data-science-architecture/` | priming-rag-global-ecosystem.md | Ciencia de datos | #datascience #arquitectura |
| database-architecture | `~/.claude/skills/database-architecture/` | priming-rag-global-ecosystem.md | Arquitectura DB | #database #arquitectura |
| design-system | `~/.claude/skills/design-system/` | priming-rag-global-ecosystem.md | Sistema de diseno | #design #sistema |
| devsecops-architecture | `~/.claude/skills/devsecops-architecture/` | priming-rag-global-ecosystem.md | DevSecOps | #devsecops #arquitectura |
| discovery-handover | `~/.claude/skills/discovery-handover/` | priming-rag-global-ecosystem.md | Handover | #handover #discovery |
| discovery-orchestrator | `~/.claude/skills/discovery-orchestrator/` | priming-rag-global-ecosystem.md | Orquestacion | #orquestacion #discovery |
| dynamic-sme | `~/.claude/skills/dynamic-sme/` | priming-rag-global-ecosystem.md | SME dinamico | #sme #dinamico |
| ecosystem-forge | `~/.claude/skills/ecosystem-forge/` | priming-rag-global-ecosystem.md | Forja del ecosistema | #ecosistema #forge |
| enterprise-architecture | `~/.claude/skills/enterprise-architecture/` | priming-rag-global-ecosystem.md | Arq. empresarial | #enterprise #arquitectura |
| event-architecture | `~/.claude/skills/event-architecture/` | priming-rag-global-ecosystem.md | Arq. eventos | #eventos #arquitectura |
| excellence-loop | `~/.claude/skills/excellence-loop/` | priming-rag-global-ecosystem.md | Loop de excelencia | #excellence #loop #calidad |
| executive-pitch | `~/.claude/skills/executive-pitch/` | priming-rag-global-ecosystem.md | Pitch ejecutivo | #pitch #ejecutivo |
| flow-mapping | `~/.claude/skills/flow-mapping/` | priming-rag-global-ecosystem.md | Mapeo de flujos | #flujos #mapeo |
| functional-spec | `~/.claude/skills/functional-spec/` | priming-rag-global-ecosystem.md | Spec funcional | #spec #funcional |
| functional-toolbelt | `~/.claude/skills/functional-toolbelt/` | priming-rag-global-ecosystem.md | Toolbelt funcional | #toolbelt #funcional |
| hook-creator | `~/.claude/skills/hook-creator/` | priming-rag-global-ecosystem.md | Creador de hooks | #hooks #creador |
| html-brand | `~/.claude/skills/html-brand/` | priming-rag-global-ecosystem.md | HTML branding | #html #branding |
| infrastructure-architecture | `~/.claude/skills/infrastructure-architecture/` | priming-rag-global-ecosystem.md | Arq. infraestructura | #infraestructura #arquitectura |
| input-analyst | `~/.claude/skills/input-analyst/` | priming-rag-global-ecosystem.md | Analista de inputs | #inputs #analisis |
| mcp-creator | `~/.claude/skills/mcp-creator/` | priming-rag-global-ecosystem.md | Creador MCP | #mcp #creador |
| mermaid-diagramming | `~/.claude/skills/mermaid-diagramming/` | priming-rag-global-ecosystem.md | Diagramas Mermaid | #mermaid #diagramas |
| mobile-architecture | `~/.claude/skills/mobile-architecture/` | priming-rag-global-ecosystem.md | Arq. mobile | #mobile #arquitectura |
| mobile-assessment | `~/.claude/skills/mobile-assessment/` | priming-rag-global-ecosystem.md | Assessment mobile | #mobile #assessment |
| naming-and-slugging | `~/.claude/skills/naming-and-slugging/` | priming-rag-global-ecosystem.md | Naming y slugging | #naming #slugging |
| observability | `~/.claude/skills/observability/` | priming-rag-global-ecosystem.md | Observabilidad | #observabilidad #monitoreo |
| open-claw-builder | `~/.claude/skills/open-claw-builder/` | priming-rag-global-ecosystem.md | Builder Open Claw | #openclaw #builder |
| performance-engineering | `~/.claude/skills/performance-engineering/` | priming-rag-global-ecosystem.md | Performance engineering | #performance #ingenieria |
| plugin-builder | `~/.claude/skills/plugin-builder/` | priming-rag-global-ecosystem.md | Constructor de plugins | #plugin #builder |
| project-program-management | `~/.claude/skills/project-program-management/` | priming-rag-global-ecosystem.md | Gestion proyectos | #proyectos #gestion |
| prompt-creator | `~/.claude/skills/prompt-creator/` | priming-rag-global-ecosystem.md | Creador de prompts | #prompts #creador |
| prompt-forge | `~/.claude/skills/prompt-forge/` | priming-rag-global-ecosystem.md | Forja de prompts | #prompts #forge |
| quality-engineering | `~/.claude/skills/quality-engineering/` | priming-rag-global-ecosystem.md | Ingenieria de calidad | #calidad #ingenieria |
| risk-controlling-dynamics | `~/.claude/skills/risk-controlling-dynamics/` | priming-rag-global-ecosystem.md | Control de riesgos | #riesgos #control |
| roadmap-poc | `~/.claude/skills/roadmap-poc/` | priming-rag-global-ecosystem.md | Roadmap PoC | #roadmap #poc |
| rule-forge | `~/.claude/skills/rule-forge/` | priming-rag-global-ecosystem.md | Forja de reglas | #reglas #forge |
| scenario-analysis | `~/.claude/skills/scenario-analysis/` | priming-rag-global-ecosystem.md | Analisis de escenarios | #escenarios #analisis |
| security-architecture | `~/.claude/skills/security-architecture/` | priming-rag-global-ecosystem.md | Arq. seguridad | #seguridad #arquitectura |
| skill-creator-moat | `~/.claude/skills/skill-creator-moat/` | priming-rag-global-ecosystem.md | Creador de skills (MOAT) | #skills #creador #moat |
| skill-spec-creator | `~/.claude/skills/skill-spec-creator/` | priming-rag-global-ecosystem.md | Creador de specs de skills | #skills #spec #creador |
| software-architecture | `~/.claude/skills/software-architecture/` | priming-rag-global-ecosystem.md | Arq. software | #software #arquitectura |
| software-viability | `~/.claude/skills/software-viability/` | priming-rag-global-ecosystem.md | Viabilidad software | #viabilidad #software |
| solution-roadmap | `~/.claude/skills/solution-roadmap/` | priming-rag-global-ecosystem.md | Roadmap de solucion | #solucion #roadmap |
| solutions-architecture | `~/.claude/skills/solutions-architecture/` | priming-rag-global-ecosystem.md | Arq. soluciones | #soluciones #arquitectura |
| stakeholder-mapping | `~/.claude/skills/stakeholder-mapping/` | priming-rag-global-ecosystem.md | Mapeo stakeholders | #stakeholders #mapeo |
| step-creator | `~/.claude/skills/step-creator/` | priming-rag-global-ecosystem.md | Creador de steps | #steps #creador |
| task-engine | `~/.claude/skills/task-engine/` | priming-rag-global-ecosystem.md | Motor de tareas | #tareas #engine |
| technical-feasibility | `~/.claude/skills/technical-feasibility/` | priming-rag-global-ecosystem.md | Factibilidad tecnica | #factibilidad #tecnica |
| testing-strategy | `~/.claude/skills/testing-strategy/` | priming-rag-global-ecosystem.md | Estrategia testing | #testing #estrategia |
| user-representative | `~/.claude/skills/user-representative/` | priming-rag-global-ecosystem.md | Representante usuario | #usuario #representante |
| ux-writing | `~/.claude/skills/ux-writing/` | priming-rag-global-ecosystem.md | UX writing | #ux #writing |
| workflow-creator | `~/.claude/skills/workflow-creator/` | priming-rag-global-ecosystem.md | Creador de workflows | #workflows #creador |
| workflow-forge | `~/.claude/skills/workflow-forge/` | priming-rag-global-ecosystem.md | Forja de workflows | #workflows #forge |
| workshop-facilitator | `~/.claude/skills/workshop-facilitator/` | priming-rag-global-ecosystem.md | Facilitacion workshops | #workshop #facilitacion |
| xlsx-template-creator | `~/.claude/skills/xlsx-template-creator/` | priming-rag-global-ecosystem.md | Creador plantillas XLSX | #xlsx #plantillas #creador |

### Global Agents (1)

| Agent | Ruta | RAG Doc | Utilidad | Tags |
|-------|------|---------|----------|------|
| plugin-architect | `~/.claude/agents/plugin-architect.md` | priming-rag-global-ecosystem.md | Arquitecto de plugins | #plugin #arquitecto #global |

---

## 11. MetodologIA Plugin (59 skills, 12 agents, 21 commands)

### Agents (12)

| Agent | Tipo | Ruta | RAG Doc | Utilidad | Tags |
|-------|------|------|---------|----------|------|
| discovery-conductor | Agent | `~/skills/plugins/metodologia-discovery-framework/agents/discovery-conductor.md` | priming-rag-global-ecosystem.md | Conductor (open version) | #conductor #metodologia |
| technical-architect | Agent | `~/skills/plugins/metodologia-discovery-framework/agents/technical-architect.md` | priming-rag-global-ecosystem.md | Arquitecto tecnico | #arquitecto #metodologia |
| domain-analyst | Agent | `~/skills/plugins/metodologia-discovery-framework/agents/domain-analyst.md` | priming-rag-global-ecosystem.md | Analista de dominio | #dominio #metodologia |
| full-stack-generalist | Agent | `~/skills/plugins/metodologia-discovery-framework/agents/full-stack-generalist.md` | priming-rag-global-ecosystem.md | Generalista full-stack | #fullstack #metodologia |
| delivery-manager | Agent | `~/skills/plugins/metodologia-discovery-framework/agents/delivery-manager.md` | priming-rag-global-ecosystem.md | Delivery manager | #delivery #metodologia |
| quality-guardian | Agent | `~/skills/plugins/metodologia-discovery-framework/agents/quality-guardian.md` | priming-rag-global-ecosystem.md | Guardian de calidad | #calidad #metodologia |
| data-strategist | Agent | `~/skills/plugins/metodologia-discovery-framework/agents/data-strategist.md` | priming-rag-global-ecosystem.md | Estratega de datos | #datos #metodologia |
| change-catalyst | Agent | `~/skills/plugins/metodologia-discovery-framework/agents/change-catalyst.md` | priming-rag-global-ecosystem.md | Catalizador del cambio | #cambio #metodologia |
| ai-strategist | Agent | `~/skills/plugins/metodologia-discovery-framework/agents/ai-strategist.md` | priming-rag-global-ecosystem.md | Estratega IA | #ia #metodologia |
| process-automation-specialist | Agent | `~/skills/plugins/metodologia-discovery-framework/agents/process-automation-specialist.md` | priming-rag-global-ecosystem.md | Especialista automatizacion | #automatizacion #metodologia |
| qa-strategist | Agent | `~/skills/plugins/metodologia-discovery-framework/agents/qa-strategist.md` | priming-rag-global-ecosystem.md | Estratega QA | #qa #metodologia |
| transformation-architect | Agent | `~/skills/plugins/metodologia-discovery-framework/agents/transformation-architect.md` | priming-rag-global-ecosystem.md | Arquitecto transformacion | #transformacion #metodologia |

### Commands (21)

| Command | Ruta | RAG Doc | Utilidad | Tags |
|---------|------|---------|----------|------|
| discovery | `~/skills/plugins/metodologia-discovery-framework/commands/discovery.md` | priming-rag-global-ecosystem.md | Discovery guiado | #discovery #metodologia |
| discovery-auto | `~/skills/plugins/metodologia-discovery-framework/commands/discovery-auto.md` | priming-rag-global-ecosystem.md | Discovery autonomo | #auto #metodologia |
| express | `~/skills/plugins/metodologia-discovery-framework/commands/express.md` | priming-rag-global-ecosystem.md | Express | #express #metodologia |
| intermediate | `~/skills/plugins/metodologia-discovery-framework/commands/intermediate.md` | priming-rag-global-ecosystem.md | Intermedio | #intermedio #metodologia |
| plan | `~/skills/plugins/metodologia-discovery-framework/commands/plan.md` | priming-rag-global-ecosystem.md | Plan | #plan #metodologia |
| stakeholders | `~/skills/plugins/metodologia-discovery-framework/commands/stakeholders.md` | priming-rag-global-ecosystem.md | Stakeholders | #stakeholders #metodologia |
| brief | `~/skills/plugins/metodologia-discovery-framework/commands/brief.md` | priming-rag-global-ecosystem.md | Brief | #brief #metodologia |
| asis | `~/skills/plugins/metodologia-discovery-framework/commands/asis.md` | priming-rag-global-ecosystem.md | AS-IS | #asis #metodologia |
| flows | `~/skills/plugins/metodologia-discovery-framework/commands/flows.md` | priming-rag-global-ecosystem.md | Flujos | #flujos #metodologia |
| scenarios | `~/skills/plugins/metodologia-discovery-framework/commands/scenarios.md` | priming-rag-global-ecosystem.md | Escenarios | #escenarios #metodologia |
| roadmap | `~/skills/plugins/metodologia-discovery-framework/commands/roadmap.md` | priming-rag-global-ecosystem.md | Roadmap | #roadmap #metodologia |
| spec | `~/skills/plugins/metodologia-discovery-framework/commands/spec.md` | priming-rag-global-ecosystem.md | Spec | #spec #metodologia |
| pitch | `~/skills/plugins/metodologia-discovery-framework/commands/pitch.md` | priming-rag-global-ecosystem.md | Pitch | #pitch #metodologia |
| handover | `~/skills/plugins/metodologia-discovery-framework/commands/handover.md` | priming-rag-global-ecosystem.md | Handover | #handover #metodologia |
| discovery-review | `~/skills/plugins/metodologia-discovery-framework/commands/discovery-review.md` | priming-rag-global-ecosystem.md | Review | #review #metodologia |
| discovery-improve | `~/skills/plugins/metodologia-discovery-framework/commands/discovery-improve.md` | priming-rag-global-ecosystem.md | Improve | #improve #metodologia |
| rescue | `~/skills/plugins/metodologia-discovery-framework/commands/rescue.md` | priming-rag-global-ecosystem.md | Rescue | #rescue #metodologia |
| transformation | `~/skills/plugins/metodologia-discovery-framework/commands/transformation.md` | priming-rag-global-ecosystem.md | Transformacion | #transformacion #metodologia |
| ai-discovery | `~/skills/plugins/metodologia-discovery-framework/commands/ai-discovery.md` | priming-rag-global-ecosystem.md | AI discovery | #ia #discovery #metodologia |
| qa-discovery | `~/skills/plugins/metodologia-discovery-framework/commands/qa-discovery.md` | priming-rag-global-ecosystem.md | QA discovery | #qa #discovery #metodologia |
| rpa-discovery | `~/skills/plugins/metodologia-discovery-framework/commands/rpa-discovery.md` | priming-rag-global-ecosystem.md | RPA discovery | #rpa #discovery #metodologia |

### Skills (59)

Skills identicos al core pero bajo licencia MIT. Ruta: `~/skills/plugins/metodologia-discovery-framework/skills/{nombre}/`

Listado completo: ai-center-discovery, analytics-engineering, api-architecture, architecture-tobe, asis-analysis, bi-analytics-discovery, bi-architecture, cloud-migration, cloud-native-architecture, cloud-service-discovery, commercial-model, cost-estimation, data-engineering, data-governance, data-quality, data-science-architecture, database-architecture, design-system, devsecops-architecture, digital-transformation-discovery, discovery-handover, discovery-orchestrator, dynamic-sme, enterprise-architecture, event-architecture, executive-pitch, flow-mapping, functional-spec, functional-toolbelt, html-brand, infrastructure-architecture, management-discovery, mentoring-training-discovery, mermaid-diagramming, mini-apps-discovery, mobile-architecture, mobile-assessment, observability, performance-engineering, project-program-management, qa-service-discovery, quality-engineering, risk-controlling-dynamics, roadmap-poc, rpa-discovery, scenario-analysis, security-architecture, software-architecture, software-viability, solution-roadmap, solutions-architecture, staff-augmentation-discovery, stakeholder-mapping, technical-feasibility, testing-strategy, user-representative, ux-design-discovery, ux-writing, workshop-facilitator.

---

## 12. Packaged Skills (58 .skill files)

| Package | Tipo | Ruta | RAG Doc | Utilidad | Tags |
|---------|------|------|---------|----------|------|
| metodologia-adoption-strategy.skill | ZIP | `~/skills/metodologia-skills/metodologia-adoption-strategy.skill` | priming-rag-global-ecosystem.md | Estrategia de adopcion | #adopcion #package |
| metodologia-analytics-engineering.skill | ZIP | `~/skills/metodologia-skills/metodologia-analytics-engineering.skill` | priming-rag-global-ecosystem.md | Analytics engineering | #analytics #package |
| metodologia-api-architecture.skill | ZIP | `~/skills/metodologia-skills/metodologia-api-architecture.skill` | priming-rag-global-ecosystem.md | API architecture | #api #package |
| metodologia-architecture-tobe.skill | ZIP | `~/skills/metodologia-skills/metodologia-architecture-tobe.skill` | priming-rag-global-ecosystem.md | Architecture TO-BE | #tobe #package |
| metodologia-asis-analysis.skill | ZIP | `~/skills/metodologia-skills/metodologia-asis-analysis.skill` | priming-rag-global-ecosystem.md | AS-IS analysis | #asis #package |
| metodologia-bi-architecture.skill | ZIP | `~/skills/metodologia-skills/metodologia-bi-architecture.skill` | priming-rag-global-ecosystem.md | BI architecture | #bi #package |
| metodologia-change-readiness-assessment.skill | ZIP | `~/skills/metodologia-skills/metodologia-change-readiness-assessment.skill` | priming-rag-global-ecosystem.md | Change readiness | #cambio #package |
| metodologia-cloud-migration.skill | ZIP | `~/skills/metodologia-skills/metodologia-cloud-migration.skill` | priming-rag-global-ecosystem.md | Cloud migration | #cloud #package |
| metodologia-cloud-native-architecture.skill | ZIP | `~/skills/metodologia-skills/metodologia-cloud-native-architecture.skill` | priming-rag-global-ecosystem.md | Cloud native | #cloudnative #package |
| metodologia-commercial-model.skill | ZIP | `~/skills/metodologia-skills/metodologia-commercial-model.skill` | priming-rag-global-ecosystem.md | Commercial model | #comercial #package |
| metodologia-copywriting.skill | ZIP | `~/skills/metodologia-skills/metodologia-copywriting.skill` | priming-rag-global-ecosystem.md | Copywriting | #copywriting #package |
| metodologia-cost-estimation.skill | ZIP | `~/skills/metodologia-skills/metodologia-cost-estimation.skill` | priming-rag-global-ecosystem.md | Cost estimation | #costos #package |
| metodologia-data-engineering.skill | ZIP | `~/skills/metodologia-skills/metodologia-data-engineering.skill` | priming-rag-global-ecosystem.md | Data engineering | #datos #package |
| metodologia-data-governance.skill | ZIP | `~/skills/metodologia-skills/metodologia-data-governance.skill` | priming-rag-global-ecosystem.md | Data governance | #gobernanza #package |
| metodologia-data-mesh-strategy.skill | ZIP | `~/skills/metodologia-skills/metodologia-data-mesh-strategy.skill` | priming-rag-global-ecosystem.md | Data mesh | #datamesh #package |
| metodologia-data-science-architecture.skill | ZIP | `~/skills/metodologia-skills/metodologia-data-science-architecture.skill` | priming-rag-global-ecosystem.md | Data science | #datascience #package |
| metodologia-data-storytelling.skill | ZIP | `~/skills/metodologia-skills/metodologia-data-storytelling.skill` | priming-rag-global-ecosystem.md | Data storytelling | #storytelling #package |
| metodologia-data-viz-storytelling.skill | ZIP | `~/skills/metodologia-skills/metodologia-data-viz-storytelling.skill` | priming-rag-global-ecosystem.md | Data viz storytelling | #dataviz #package |
| metodologia-database-architecture.skill | ZIP | `~/skills/metodologia-skills/metodologia-database-architecture.skill` | priming-rag-global-ecosystem.md | Database architecture | #database #package |
| metodologia-design-system.skill | ZIP | `~/skills/metodologia-skills/metodologia-design-system.skill` | priming-rag-global-ecosystem.md | Design system | #design #package |
| metodologia-devsecops-architecture.skill | ZIP | `~/skills/metodologia-skills/metodologia-devsecops-architecture.skill` | priming-rag-global-ecosystem.md | DevSecOps | #devsecops #package |
| metodologia-discovery-handover.skill | ZIP | `~/skills/metodologia-skills/metodologia-discovery-handover.skill` | priming-rag-global-ecosystem.md | Discovery handover | #handover #package |
| metodologia-discovery-orchestrator.skill | ZIP | `~/skills/metodologia-skills/metodologia-discovery-orchestrator.skill` | priming-rag-global-ecosystem.md | Discovery orchestrator | #orquestacion #package |
| metodologia-enterprise-architecture.skill | ZIP | `~/skills/metodologia-skills/metodologia-enterprise-architecture.skill` | priming-rag-global-ecosystem.md | Enterprise architecture | #enterprise #package |
| metodologia-event-architecture.skill | ZIP | `~/skills/metodologia-skills/metodologia-event-architecture.skill` | priming-rag-global-ecosystem.md | Event architecture | #eventos #package |
| metodologia-execution-burndown.skill | ZIP | `~/skills/metodologia-skills/metodologia-execution-burndown.skill` | priming-rag-global-ecosystem.md | Execution burndown | #burndown #package |
| metodologia-executive-pitch.skill | ZIP | `~/skills/metodologia-skills/metodologia-executive-pitch.skill` | priming-rag-global-ecosystem.md | Executive pitch | #pitch #package |
| metodologia-finops.skill | ZIP | `~/skills/metodologia-skills/metodologia-finops.skill` | priming-rag-global-ecosystem.md | FinOps | #finops #package |
| metodologia-flow-mapping.skill | ZIP | `~/skills/metodologia-skills/metodologia-flow-mapping.skill` | priming-rag-global-ecosystem.md | Flow mapping | #flujos #package |
| metodologia-functional-spec.skill | ZIP | `~/skills/metodologia-skills/metodologia-functional-spec.skill` | priming-rag-global-ecosystem.md | Functional spec | #spec #package |
| metodologia-hypothesis-driven-development.skill | ZIP | `~/skills/metodologia-skills/metodologia-hypothesis-driven-development.skill` | priming-rag-global-ecosystem.md | Hypothesis-driven dev | #hipotesis #package |
| metodologia-infrastructure-architecture.skill | ZIP | `~/skills/metodologia-skills/metodologia-infrastructure-architecture.skill` | priming-rag-global-ecosystem.md | Infrastructure arch | #infraestructura #package |
| metodologia-input-analysis.skill | ZIP | `~/skills/metodologia-skills/metodologia-input-analysis.skill` | priming-rag-global-ecosystem.md | Input analysis | #inputs #package |
| metodologia-mobile-platform-assessment.skill | ZIP | `~/skills/metodologia-skills/metodologia-mobile-platform-assessment.skill` | priming-rag-global-ecosystem.md | Mobile platform assessment | #mobile #package |
| metodologia-multidimensional-feasibility.skill | ZIP | `~/skills/metodologia-skills/metodologia-multidimensional-feasibility.skill` | priming-rag-global-ecosystem.md | Multidimensional feasibility | #factibilidad #package |
| metodologia-observability.skill | ZIP | `~/skills/metodologia-skills/metodologia-observability.skill` | priming-rag-global-ecosystem.md | Observability | #observabilidad #package |
| metodologia-output-engineering.skill | ZIP | `~/skills/metodologia-skills/metodologia-output-engineering.skill` | priming-rag-global-ecosystem.md | Output engineering | #output #package |
| metodologia-performance-engineering.skill | ZIP | `~/skills/metodologia-skills/metodologia-performance-engineering.skill` | priming-rag-global-ecosystem.md | Performance engineering | #performance #package |
| metodologia-pipeline-governance.skill | ZIP | `~/skills/metodologia-skills/metodologia-pipeline-governance.skill` | priming-rag-global-ecosystem.md | Pipeline governance | #pipeline #package |
| metodologia-quality-engineering.skill | ZIP | `~/skills/metodologia-skills/metodologia-quality-engineering.skill` | priming-rag-global-ecosystem.md | Quality engineering | #calidad #package |
| metodologia-risk-controlling-dynamics.skill | ZIP | `~/skills/metodologia-skills/metodologia-risk-controlling-dynamics.skill` | priming-rag-global-ecosystem.md | Risk controlling | #riesgos #package |
| metodologia-roadmap-poc.skill | ZIP | `~/skills/metodologia-skills/metodologia-roadmap-poc.skill` | priming-rag-global-ecosystem.md | Roadmap PoC | #roadmap #package |
| metodologia-scenario-analysis.skill | ZIP | `~/skills/metodologia-skills/metodologia-scenario-analysis.skill` | priming-rag-global-ecosystem.md | Scenario analysis | #escenarios #package |
| metodologia-sector-intelligence.skill | ZIP | `~/skills/metodologia-skills/metodologia-sector-intelligence.skill` | priming-rag-global-ecosystem.md | Sector intelligence | #sector #package |
| metodologia-security-architecture.skill | ZIP | `~/skills/metodologia-skills/metodologia-security-architecture.skill` | priming-rag-global-ecosystem.md | Security architecture | #seguridad #package |
| metodologia-software-architecture.skill | ZIP | `~/skills/metodologia-skills/metodologia-software-architecture.skill` | priming-rag-global-ecosystem.md | Software architecture | #software #package |
| metodologia-software-viability.skill | ZIP | `~/skills/metodologia-skills/metodologia-software-viability.skill` | priming-rag-global-ecosystem.md | Software viability | #viabilidad #package |
| metodologia-solution-roadmap.skill | ZIP | `~/skills/metodologia-skills/metodologia-solution-roadmap.skill` | priming-rag-global-ecosystem.md | Solution roadmap | #solucion #package |
| metodologia-solutions-architecture.skill | ZIP | `~/skills/metodologia-skills/metodologia-solutions-architecture.skill` | priming-rag-global-ecosystem.md | Solutions architecture | #soluciones #package |
| metodologia-stakeholder-mapping.skill | ZIP | `~/skills/metodologia-skills/metodologia-stakeholder-mapping.skill` | priming-rag-global-ecosystem.md | Stakeholder mapping | #stakeholders #package |
| metodologia-storytelling.skill | ZIP | `~/skills/metodologia-skills/metodologia-storytelling.skill` | priming-rag-global-ecosystem.md | Storytelling | #storytelling #package |
| metodologia-technical-feasibility.skill | ZIP | `~/skills/metodologia-skills/metodologia-technical-feasibility.skill` | priming-rag-global-ecosystem.md | Technical feasibility | #factibilidad #package |
| metodologia-technical-writing.skill | ZIP | `~/skills/metodologia-skills/metodologia-technical-writing.skill` | priming-rag-global-ecosystem.md | Technical writing | #escritura #package |
| metodologia-technology-vigilance.skill | ZIP | `~/skills/metodologia-skills/metodologia-technology-vigilance.skill` | priming-rag-global-ecosystem.md | Technology vigilance | #tecnologia #package |
| metodologia-testing-strategy.skill | ZIP | `~/skills/metodologia-skills/metodologia-testing-strategy.skill` | priming-rag-global-ecosystem.md | Testing strategy | #testing #package |
| metodologia-user-representative.skill | ZIP | `~/skills/metodologia-skills/metodologia-user-representative.skill` | priming-rag-global-ecosystem.md | User representative | #usuario #package |
| metodologia-ux-writing.skill | ZIP | `~/skills/metodologia-skills/metodologia-ux-writing.skill` | priming-rag-global-ecosystem.md | UX writing | #ux #package |
| metodologia-workshop-design.skill | ZIP | `~/skills/metodologia-skills/metodologia-workshop-design.skill` | priming-rag-global-ecosystem.md | Workshop design | #workshop #package |

### Additional Packages

| Package | Tipo | Ruta | RAG Doc | Utilidad | Tags |
|---------|------|------|---------|----------|------|
| metodologia-discovery-framework.plugin | ZIP | `~/skills/metodologia-skills/metodologia-discovery-framework.plugin` | priming-rag-global-ecosystem.md | Plugin completo empaquetado | #plugin #package #completo |
| metodologia-discovery-skills.zip | ZIP | `~/skills/metodologia-skills/metodologia-discovery-skills.zip` | priming-rag-global-ecosystem.md | Bundle de skills de discovery | #bundle #skills #zip |

---

## Estadisticas del Ecosistema

| Categoria | Cantidad |
|-----------|----------|
| SDF Agents | 48 |
| SDF Commands | 84 (30 primary + 54 aliases) |
| SDF Skills | 100 |
| SDF References | 22 (1 matrix + 20 priming-rag + 1 index) |
| SDF Prompts | 5 files + 2 version dirs |
| HTML Assets | 2 |
| Scripts | 3 |
| Hooks | 1 |
| Global Skills | 72 |
| Global Agents | 1 |
| MetodologIA Agents | 12 |
| MetodologIA Commands | 21 |
| MetodologIA Skills | 59 |
| Packaged .skill | 58 |
| **Total Assets** | **~488** |

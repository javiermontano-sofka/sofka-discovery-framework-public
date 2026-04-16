# Priming-RAG: Skills Catalog
> MetodologIA Discovery Framework — Catalogo completo de 100 skills
> Procesado: 2026-03-14 | Version: v12.0.0
> Fuente: `$SDF/skills/` (100 directorios)

---

## Fuentes procesadas

100 directorios de skills en `~/skills/plugins/metodologia-discovery-framework/skills/`.
Cada skill contiene: SKILL.md (definicion), prompts/ (opcionales), references/ (opcionales), examples/ (opcionales).

---

## Valor para discovery y RAG

El catalogo de skills es el inventario de capacidades tecnicas del framework. Cada skill representa una competencia especializada que puede activarse en el pipeline de discovery. Los skills se agrupan en 11 dominios y se enrutan segun el tipo de servicio.

---

## Dominios (11)

| # | Dominio | Skills | Descripcion |
|---|---------|--------|-------------|
| 1 | Architecture & Design | 15 | Arquitecturas de software, enterprise, cloud, security, mobile, APIs |
| 2 | Data & Analytics | 10 | Datos, BI, analytics, data science, data viz |
| 3 | Cloud & Infrastructure | 5 | Migracion cloud, DR, FinOps, observabilidad |
| 4 | AI & Automation | 4 | Centro IA, transformacion digital, RPA, hypothesis-driven |
| 5 | Discovery Pipeline | 12 | Skills core del pipeline de discovery |
| 6 | Quality & Testing | 5 | QA, testing, accesibilidad, dependencias |
| 7 | Strategy & Business | 14 | Modelo comercial, costos, sector, producto, factibilidad |
| 8 | Management & Operations | 10 | Capacidad, governance, incidentes, releases, SLAs |
| 9 | UX & Content | 7 | UX design, writing, copywriting, storytelling |
| 10 | Specialized Discovery | 8 | Mini-apps, staff aug, mentoring, mobile, tech debt, compliance |
| 11 | Enablers & Tools | 10 | DX, Mermaid, playbooks, PoC lab, workshops, team topology |

---

## 1. Architecture & Design (15)

| Skill | Agentes clave | Entregable | Tags |
|-------|---------------|------------|------|
| api-architecture | solutions-architect, backend-developer | API design doc, contratos OpenAPI | #api #contratos |
| architecture-tobe | technical-architect, enterprise-architect | TO-BE architecture doc, C4 diagrams | #tobe #c4 |
| cloud-native-architecture | cloud-architect, platform-engineer | Cloud-native design, K8s patterns | #cloudnative #k8s |
| database-architecture | data-architect, backend-developer | DB design, ER diagrams, partitioning | #database #modelado |
| design-system | frontend-developer, ux-strategist | Design tokens, component library | #design #tokens |
| enterprise-architecture | enterprise-architect, solutions-architect | TOGAF artifacts, capability map | #enterprise #togaf |
| event-architecture | solutions-architect, backend-developer | Event catalog, EDA patterns | #eventos #eda |
| infrastructure-architecture | devops-engineer, platform-engineer | IaC templates, network topology | #infraestructura #iac |
| integration-architecture | middle-integrations-developer, solutions-architect | Integration patterns, API gateway | #integracion #gateway |
| mobile-architecture | mobile-architect, frontend-developer | Mobile arch doc, platform decision | #mobile #plataformas |
| security-architecture | security-architect, devsecops-expert | Threat model, security controls | #seguridad #zerotrust |
| software-architecture | technical-architect, solutions-architect | C4 diagrams, ADRs, quality attrs | #software #c4 |
| solutions-architecture | solutions-architect, technical-architect | Solution design, evaluation matrix | #soluciones #diseno |
| devsecops-architecture | devsecops-expert, devops-engineer | Pipeline security, SAST/DAST config | #devsecops #pipeline |
| documentation-architecture | content-strategist, format-specialist | Doc structure, templates, standards | #documentacion #estructura |

## 2. Data & Analytics (10)

| Skill | Agentes clave | Entregable | Tags |
|-------|---------------|------------|------|
| analytics-engineering | data-engineer, analytics-architect | dbt models, data transforms, metrics | #analytics #dbt |
| bi-analytics-discovery | analytics-architect, data-strategist | BI landscape, dashboard inventory | #bi #discovery |
| bi-architecture | analytics-architect, data-architect | BI platform design, data marts | #bi #arquitectura |
| data-engineering | data-engineer, data-architect | Pipeline design, ETL/ELT patterns | #datos #pipelines |
| data-governance | data-strategist, compliance-analyst | Governance framework, data catalog | #gobernanza #catalogo |
| data-mesh-strategy | data-architect, data-strategist | Domain ownership, data products | #datamesh #dominios |
| data-quality | data-engineer, quality-guardian | DQ rules, profiling, monitoring | #calidad #profiling |
| data-science-architecture | data-scientist, ai-architect | ML platform, experiment tracking | #datascience #mlops |
| data-storytelling | content-strategist, analytics-architect | Data narratives, insight reports | #storytelling #datos |
| data-viz-storytelling | analytics-architect, format-specialist | Dashboard mockups, viz guidelines | #dataviz #dashboards |

## 3. Cloud & Infrastructure (5)

| Skill | Agentes clave | Entregable | Tags |
|-------|---------------|------------|------|
| cloud-migration | cloud-architect, devops-engineer | Migration plan, 7Rs assessment | #cloud #migracion |
| cloud-service-discovery | cloud-architect, platform-engineer | Cloud service inventory, costs | #cloud #inventario |
| disaster-recovery | cloud-architect, security-architect | DR plan, RTO/RPO analysis | #dr #continuidad |
| finops | cloud-architect, economics-researcher | Cost optimization, FinOps practice | #finops #costos |
| observability | devops-engineer, platform-engineer | Monitoring strategy, SLOs, alerts | #observabilidad #slos |

## 4. AI & Automation (4)

| Skill | Agentes clave | Entregable | Tags |
|-------|---------------|------------|------|
| ai-center-discovery | ai-strategist, ai-architect | AI CoE design, use case portfolio | #ia #centro |
| digital-transformation-discovery | transformation-architect, change-catalyst | DT roadmap, workstreams | #transformacion #digital |
| rpa-discovery | process-automation-specialist, business-analyst | RPA candidates, automation potential | #rpa #automatizacion |
| hypothesis-driven-development | research-scientist, product-strategist | Experiment backlog, hypothesis cards | #hipotesis #experimentos |

## 5. Discovery Pipeline (12)

| Skill | Agentes clave | Entregable | Tags |
|-------|---------------|------------|------|
| asis-analysis | technical-architect, domain-analyst | AS-IS diagnosis (multi-variant) | #asis #diagnostico |
| discovery-orchestrator | discovery-conductor | Pipeline orchestration, checkpoints | #orquestacion #pipeline |
| discovery-handover | delivery-manager, content-strategist | Handover package, transfer docs | #handover #entrega |
| flow-mapping | domain-analyst, business-analyst | BPMN flows, process maps, Mermaid | #flujos #bpmn |
| functional-spec | domain-analyst, business-analyst | Functional specification document | #spec #funcional |
| input-analysis | discovery-conductor, domain-analyst | Input classification, source quality | #inputs #clasificacion |
| multidimensional-feasibility | economics-researcher, technical-architect | 5-dimension feasibility matrix | #factibilidad #5d |
| scenario-analysis | technical-architect, domain-analyst | TO-BE scenarios, comparison matrix | #escenarios #tobe |
| stakeholder-mapping | discovery-conductor, business-analyst | Stakeholder map, influence grid | #stakeholders #mapeo |
| output-engineering | format-specialist, content-strategist | Output formatting, multi-format | #output #formatos |
| pipeline-governance | delivery-manager, quality-guardian | Gate criteria, checkpoint rules | #pipeline #gates |
| dynamic-sme | subject-matter-expert | Domain-adapted expertise | #sme #dinamico |

## 6. Quality & Testing (5)

| Skill | Agentes clave | Entregable | Tags |
|-------|---------------|------------|------|
| quality-engineering | quality-engineer, qa-strategist | QE framework, automation strategy | #calidad #automation |
| testing-strategy | qa-strategist, quality-engineer | Test strategy, coverage plan | #testing #estrategia |
| qa-service-discovery | qa-strategist, quality-guardian | QA landscape, test factory design | #qa #discovery |
| accessibility-audit | ux-researcher, quality-engineer | WCAG audit, accessibility report | #accesibilidad #wcag |
| dependency-analysis | technical-architect, devops-engineer | Dependency graph, risk assessment | #dependencias #riesgos |

## 7. Strategy & Business (14)

| Skill | Agentes clave | Entregable | Tags |
|-------|---------------|------------|------|
| commercial-model | economics-researcher, product-strategist | Commercial model, pricing strategy | #comercial #modelo |
| competitive-intelligence | technology-scout, business-analyst | Competitive landscape, SWOT | #competencia #swot |
| cost-estimation | economics-researcher, delivery-manager | FTE-months, effort estimation | #costos #estimacion |
| executive-pitch | content-strategist, editorial-director | Executive presentation, value prop | #pitch #ejecutivo |
| product-strategy | product-strategist, ux-strategist | Product roadmap, market fit | #producto #estrategia |
| roadmap-poc | technical-architect, delivery-manager | Roadmap + PoC plan | #roadmap #poc |
| sector-intelligence | technology-scout, research-scientist | Industry analysis, trends | #sector #tendencias |
| solution-roadmap | solutions-architect, delivery-manager | Solution phases, milestones | #solucion #fases |
| software-viability | technical-architect, economics-researcher | Viability assessment, build/buy | #viabilidad #buildbuy |
| technical-feasibility | technical-architect, solutions-architect | Technical feasibility report | #factibilidad #tecnica |
| adoption-strategy | change-catalyst, product-strategist | Adoption plan, rollout strategy | #adopcion #rollout |
| change-readiness-assessment | change-catalyst, compliance-analyst | Change readiness score, gaps | #cambio #readiness |
| maturity-assessment | quality-guardian, research-scientist | Maturity model, scoring | #madurez #benchmark |
| sustainability-assessment | compliance-analyst, research-scientist | ESG assessment, sustainability | #sostenibilidad #esg |

## 8. Management & Operations (10)

| Skill | Agentes clave | Entregable | Tags |
|-------|---------------|------------|------|
| capacity-planning | delivery-manager, economics-researcher | Capacity model, resource plan | #capacidad #recursos |
| execution-burndown | delivery-manager, quality-guardian | Burndown chart, velocity tracking | #burndown #velocidad |
| governance-framework | delivery-manager, compliance-analyst | Governance structure, RACI | #gobernanza #raci |
| incident-management | devops-engineer, quality-engineer | Incident process, escalation | #incidentes #escalacion |
| management-discovery | delivery-manager, implementation-analyst | PMO assessment, methodology fit | #management #pmo |
| project-program-management | delivery-manager, implementation-analyst | Program structure, WBS | #proyectos #wbs |
| release-strategy | devops-engineer, delivery-manager | Release plan, deployment strategy | #releases #deployment |
| risk-controlling-dynamics | risk-controller, delivery-manager | Risk matrix, mitigation plan | #riesgos #mitigacion |
| sla-design | delivery-manager, quality-guardian | SLA framework, KPIs | #sla #kpis |
| vendor-assessment | business-analyst, compliance-analyst | Vendor scorecard, evaluation | #vendors #evaluacion |

## 9. UX & Content (7)

| Skill | Agentes clave | Entregable | Tags |
|-------|---------------|------------|------|
| ux-design-discovery | ux-researcher, ux-strategist | UX research findings, personas | #ux #research |
| ux-writing | ux-strategist, content-strategist | UX copy guidelines, microcopy | #ux #microcopy |
| user-representative | ux-researcher, domain-analyst | User voice, journey maps | #usuario #journeys |
| copywriting | content-strategist, editorial-director | Copy deck, messaging framework | #copywriting #messaging |
| storytelling | content-strategist, editorial-director | Narrative structure, story arcs | #storytelling #narrativa |
| technical-writing | content-strategist, format-specialist | Technical docs, API docs | #escritura #tecnica |
| html-brand | format-specialist, frontend-developer | HTML templates, design tokens | #html #branding |

## 10. Specialized Discovery (8)

| Skill | Agentes clave | Entregable | Tags |
|-------|---------------|------------|------|
| mini-apps-discovery | full-stack-generalist, product-strategist | Mini-app candidates, MVP scope | #miniapps #mvp |
| staff-augmentation-discovery | delivery-manager, technical-lead | Team composition, profiles | #staffaug #perfiles |
| mentoring-training-discovery | technical-lead, change-catalyst | Training needs, mentoring plan | #mentoring #capacitacion |
| mobile-assessment | mobile-architect, ux-researcher | Mobile landscape, platform eval | #mobile #evaluacion |
| mobile-platform-assessment | mobile-architect, technical-architect | Platform comparison, decision | #mobile #plataforma |
| tech-debt-assessment | technical-architect, quality-guardian | Tech debt inventory, remediation | #techdebt #remediacion |
| compliance-assessment | compliance-analyst, security-architect | Compliance gaps, remediation | #compliance #gaps |
| technology-vigilance | technology-scout, research-scientist | Tech radar, emerging tech | #tecnologia #radar |

## 11. Enablers & Tools (10)

| Skill | Agentes clave | Entregable | Tags |
|-------|---------------|------------|------|
| developer-experience | platform-engineer, devops-engineer | DX assessment, golden paths | #dx #goldenpath |
| functional-toolbelt | domain-analyst, business-analyst | Analysis toolkit, templates | #toolbelt #herramientas |
| mermaid-diagramming | technical-architect, format-specialist | Mermaid diagrams, visual assets | #mermaid #diagramas |
| migration-playbook | cloud-architect, devops-engineer | Migration runbook, checklists | #migracion #playbook |
| onboarding-playbook | delivery-manager, technical-lead | Onboarding guide, ramp-up | #onboarding #rampup |
| performance-engineering | backend-developer, devops-engineer | Performance benchmarks, tuning | #performance #tuning |
| poc-lab | full-stack-generalist, technical-architect | PoC setup, experiment results | #poc #laboratorio |
| team-topology | delivery-manager, technical-lead | Team structure, interaction modes | #equipos #topologia |
| workshop-design | ux-strategist, change-catalyst | Workshop plan, activities | #workshop #plan |
| workshop-facilitator | ux-strategist, change-catalyst | Facilitation guide, outputs | #workshop #facilitacion |

---

## Key takeaways

1. 100 skills organizados en 11 dominios funcionales
2. Cada skill tiene agentes clave asignados y un entregable definido
3. Los skills del dominio "Discovery Pipeline" son los core del framework
4. Architecture & Design es el dominio mas grande (15 skills)
5. Strategy & Business tiene la mayor diversidad de casos de uso (14 skills)
6. El routing por TIPO_SERVICIO activa subconjuntos especificos de skills

---

## Keywords y hashtags

`#skills` `#catalogo` `#dominios` `#arquitectura` `#datos` `#cloud` `#ia` `#pipeline` `#calidad` `#estrategia` `#management` `#ux` `#discovery` `#enablers`

---

## Query hooks

- "Que skills hay para Data-AI?" -> Dominio 2 (Data & Analytics) + Dominio 4 (AI & Automation)
- "Que skill produce el AS-IS?" -> asis-analysis (Discovery Pipeline)
- "Cuantos dominios hay?" -> 11 dominios
- "Que skills son core?" -> Los 12 del dominio Discovery Pipeline
- "Hay skill de FinOps?" -> Si, en Cloud & Infrastructure
- "Que skill uso para diagramas?" -> mermaid-diagramming (Enablers)

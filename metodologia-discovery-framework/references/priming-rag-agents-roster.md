# Priming-RAG: Agents Roster
> MetodologIA Discovery Framework — Roster completo de 48 agentes
> Procesado: 2026-03-14 | Version: v12.0.0
> Fuente: `$SDF/agents/` (48 archivos .md)

---

## Fuentes procesadas

48 archivos en `~/skills/plugins/metodologia-discovery-framework/agents/`:
Cada archivo define un agente con: identidad, especialidad, habilidades, protocolos de activacion, restricciones y criterios de calidad.

---

## Valor para discovery y RAG

El roster de agentes es el nucleo del modelo multi-agente de MAO. Permite al conductor asignar roles especializados segun tipo de servicio, componer comites de expertos, y activar paneles consultivos. Cada agente tiene competencias unicas que determinan cuando y como se invoca.

---

## Comites y estructura organizacional

### Triada Permanente (siempre activa)
| Agente | Rol en triada | Responsabilidad |
|--------|---------------|-----------------|
| discovery-conductor | Lider | Orquestacion, governance, decisiones de pipeline |
| technical-architect | Tecnico | Evaluacion arquitectonica, viabilidad tecnica |
| domain-analyst | Negocio | Comprension del dominio, requerimientos funcionales |

### Comite de Expertos (activado por tipo de servicio)
Hasta 7 agentes adicionales seleccionados segun `{TIPO_SERVICIO}`. El conductor elige del roster completo.

### Comite Editorial (activado en fase de output)
| Agente | Rol editorial |
|--------|---------------|
| content-strategist | Estrategia de contenido y estructura narrativa |
| editorial-director | Tono, voz, coherencia editorial |
| format-specialist | Formatos de salida, plantillas, branding |

---

## Roster por grupo

### Core Team (12)

| # | Agente | Especialidad | Service Types |
|---|--------|--------------|---------------|
| 1 | **discovery-conductor** | Orquestacion de discovery, governance de pipeline, gestion de checkpoints y quality gates | Todos |
| 2 | **technical-architect** | Evaluacion arquitectonica, C4 diagrams, deuda tecnica, modernizacion | SDA, Cloud, Digital-Transformation |
| 3 | **domain-analyst** | Analisis de dominio de negocio, modelado de procesos, requerimientos | Todos |
| 4 | **full-stack-generalist** | Soporte transversal, prototipado rapido, evaluacion de stack | SDA |
| 5 | **delivery-manager** | Governance de entrega, cronogramas, riesgos de proyecto, gates | Management, Todos (governance) |
| 6 | **quality-guardian** | Excellence loop, rubrica de 10 criterios, auditorias de calidad | Todos (quality gates) |
| 7 | **data-strategist** | Estrategia de datos, data governance, madurez analitica | Data-AI |
| 8 | **change-catalyst** | Gestion del cambio, adopcion, resistencia organizacional | Digital-Transformation, Management |
| 9 | **ai-strategist** | Oportunidades de IA, GenAI, LLM, AI readiness assessment | Data-AI |
| 10 | **process-automation-specialist** | RPA, BPMN, process mining, automatizacion | RPA |
| 11 | **qa-strategist** | Estrategia de testing, ISTQB, test factory, cobertura | QA |
| 12 | **transformation-architect** | Transformacion digital multi-workstream, modernizacion a escala | Digital-Transformation |

### Architecture (5)

| # | Agente | Especialidad | Service Types |
|---|--------|--------------|---------------|
| 13 | **enterprise-architect** | TOGAF, capacidades de negocio, landscape empresarial | SDA, Digital-Transformation |
| 14 | **solutions-architect** | Diseno de soluciones, evaluacion de alternativas, integracion | SDA, Cloud |
| 15 | **cloud-architect** | Cloud migration, cloud-native, multi-cloud, IaC | Cloud |
| 16 | **security-architect** | Zero trust, threat modeling, compliance frameworks | Cloud, SDA |
| 17 | **mobile-architect** | iOS, Android, cross-platform, mobile-first | SDA (mobile) |

### Development (5)

| # | Agente | Especialidad | Service Types |
|---|--------|--------------|---------------|
| 18 | **backend-developer** | APIs, microservicios, bases de datos, performance | SDA |
| 19 | **frontend-developer** | SPA, design systems, accesibilidad, rendering | SDA, UX-Design |
| 20 | **technical-lead** | Liderazgo tecnico, code review, estandares, mentoring | SDA, SAS |
| 21 | **devops-engineer** | CI/CD, containerization, IaC, monitoring | SDA, Cloud |
| 22 | **middle-integrations-developer** | ESB, middleware, APIs de integracion, ETL | SDA, Data-AI |

### Data & AI (6)

| # | Agente | Especialidad | Service Types |
|---|--------|--------------|---------------|
| 23 | **data-architect** | Modelado de datos, data lakes, data warehouses | Data-AI |
| 24 | **data-engineer** | Pipelines ETL/ELT, streaming, data platforms | Data-AI |
| 25 | **data-scientist** | ML, estadistica, modelos predictivos, feature engineering | Data-AI |
| 26 | **analytics-architect** | BI, dashboards, analytics platforms, KPIs | Data-AI |
| 27 | **ai-architect** | MLOps, model serving, AI infrastructure | Data-AI |
| 28 | **ai-agent-architect** | Agentes autonomos, LLM orchestration, RAG systems | Data-AI |

### Infrastructure (3)

| # | Agente | Especialidad | Service Types |
|---|--------|--------------|---------------|
| 29 | **platform-engineer** | Internal developer platforms, golden paths, self-service | Cloud, SDA |
| 30 | **hardware-systems-engineer** | IoT, edge computing, sistemas embebidos | SDA (hardware) |
| 31 | **devsecops-expert** | Security in pipeline, SAST/DAST, supply chain security | Cloud, SDA |

### Quality & Research (6)

| # | Agente | Especialidad | Service Types |
|---|--------|--------------|---------------|
| 32 | **quality-engineer** | Test automation, frameworks de testing, CI quality | QA |
| 33 | **research-scientist** | Investigacion tecnica, state of the art, papers | Todos (research) |
| 34 | **economics-researcher** | ROI, TCO, business case, modelos economicos | Todos (sizing) |
| 35 | **systems-theorist** | Teoria de sistemas, complejidad, emergencia | Digital-Transformation |
| 36 | **technology-scout** | Vigilancia tecnologica, tendencias, evaluacion de tecnologias | Todos (scouting) |
| 37 | **integration-researcher** | Patrones de integracion, APIs, ecosistemas | SDA |

### Business & UX (6)

| # | Agente | Especialidad | Service Types |
|---|--------|--------------|---------------|
| 38 | **business-analyst** | Requerimientos, casos de uso, reglas de negocio | Todos |
| 39 | **subject-matter-expert** | SME dinamico (adapta dominio al contexto del cliente) | Todos |
| 40 | **ux-researcher** | Investigacion de usuarios, usability testing, personas | UX-Design |
| 41 | **ux-strategist** | Design thinking, service design, experience strategy | UX-Design |
| 42 | **implementation-analyst** | Analisis de implementacion, viabilidad operativa | Management |
| 43 | **product-strategist** | Estrategia de producto, product-market fit, priorization | SDA |

### Compliance (2)

| # | Agente | Especialidad | Service Types |
|---|--------|--------------|---------------|
| 44 | **compliance-analyst** | Regulaciones, GDPR, PCI-DSS, SOC2, normativa local | Todos (compliance) |
| 45 | **risk-controller** | Matriz de riesgos, mitigacion, contingencia, FMEA | Todos (risk) |

### Editorial (3)

| # | Agente | Especialidad | Service Types |
|---|--------|--------------|---------------|
| 46 | **content-strategist** | Estrategia de contenido, estructura narrativa, messaging | Todos (output) |
| 47 | **editorial-director** | Tono, voz, coherencia editorial, revision de estilo | Todos (output) |
| 48 | **format-specialist** | Plantillas, formatos (MD, HTML, DOCX, XLSX), branding | Todos (output) |

---

## Reglas de activacion

1. **Triada permanente** se activa en TODOS los discoveries
2. **Comite de expertos** se configura segun `{TIPO_SERVICIO}` detectado
3. **Comite editorial** se activa en fase de produccion de entregables
4. **SME dinamico** (subject-matter-expert) adapta su dominio al sector del cliente
5. **Quality guardian** interviene en cada quality gate y excellence loop
6. **Economics researcher** se activa cuando hay sizing o estimacion de esfuerzo

---

## Configuraciones tipicas por tipo de servicio

| TIPO_SERVICIO | Triada + Expertos clave |
|---------------|------------------------|
| SDA | conductor + architect + analyst + full-stack + solutions-architect + devops |
| QA | conductor + architect + analyst + qa-strategist + quality-engineer + testing |
| Management | conductor + architect + analyst + delivery-manager + implementation-analyst |
| RPA | conductor + architect + analyst + process-automation + business-analyst |
| Data-AI | conductor + architect + analyst + data-strategist + ai-strategist + data-architect |
| Cloud | conductor + architect + analyst + cloud-architect + devops + platform-engineer |
| UX-Design | conductor + architect + analyst + ux-researcher + ux-strategist + frontend |
| Digital-Transformation | conductor + architect + analyst + transformation-architect + change-catalyst |

---

## Key takeaways

1. 48 agentes organizados en 8 grupos funcionales
2. Triada permanente (conductor + architect + analyst) es la base de todo discovery
3. El conductor decide la composicion del comite segun contexto
4. SME dinamico se adapta al sector especifico del cliente
5. Comite editorial garantiza calidad narrativa y de formato
6. Cada agente tiene service types especificos donde es mas relevante

---

## Keywords y hashtags

`#agentes` `#roster` `#triada` `#comite` `#conductor` `#arquitecto` `#analista` `#expertos` `#editorial` `#activacion` `#service-type` `#roles` `#especialidad`

---

## Query hooks

- "Que agentes participan en un discovery SDA?" -> Configuraciones tipicas
- "Quien lidera el discovery?" -> discovery-conductor (triada permanente)
- "Cuantos agentes hay?" -> 48, organizados en 8 grupos
- "Que hace el quality guardian?" -> Excellence loop, rubrica 10 criterios
- "Como se elige el comite?" -> El conductor selecciona segun TIPO_SERVICIO
- "Que es la triada permanente?" -> conductor + technical-architect + domain-analyst

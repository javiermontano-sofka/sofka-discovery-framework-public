---
name: staff-augmentation-discovery
description: >
  Staff augmentation discovery — talent gap analysis, skills matrix profiling, team composition modeling,
  onboarding and ramp-up design, retention framework, and staffing roadmap.
  Use when the user asks to "assess staffing needs", "analyze talent gaps", "design team composition",
  "plan staff augmentation", "evaluate team skills", "create staffing roadmap", "onboarding plan",
  "ramp-up strategy", "retention framework", or mentions talent gap, skills matrix, team topology,
  augmentation, nearshore, offshore, or staffing plan.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Staff Augmentation Discovery — Talent Gap Analysis & Staffing Roadmap

Genera un analisis integral de necesidades de staff augmentation que cubre talent gap analysis, skills matrix profiling, team composition modeling, onboarding & ramp-up design, retention framework, y staffing roadmap. Disenado para engagements donde la organizacion necesita aumentar su capacidad con profesionales externos, ya sea nearshore, offshore, o on-site.

## Principio Rector

> *El staff augmentation no es llenar sillas — es construir capacidad. Cada profesional anadido debe multiplicar, no solo sumar, la capacidad del equipo.*

1. **Capacidad sobre headcount.** El numero de personas es una metrica vanidosa. Lo que importa es la capacidad de entrega: velocidad, calidad, y sostenibilidad. Un senior bien integrado aporta mas que tres juniors sin onboarding.
2. **Integracion antes que incorporacion.** Anadir talento sin plan de integracion crea friccion, no productividad. El onboarding, mentoring, y acceso a herramientas determinan el time-to-productivity mas que la experiencia previa.
3. **Retencion es la mejor estrategia de staffing.** El costo de reemplazar un profesional (recruiting + onboarding + ramp-up + knowledge loss) supera 3-6 meses de salario. Prevenir la rotacion es mas rentable que cubrirla.

## Inputs

- `$1` — Project or client name used throughout all output artifacts

Parse from `$ARGUMENTS`.

**Parameters:**
- `{MODO}`: `piloto-auto` (default) | `desatendido` | `supervisado` | `paso-a-paso`
  - **piloto-auto**: Auto para analisis de gaps y skills matrix, HITL para decisiones de composicion de equipo y roadmap.
  - **desatendido**: Cero interrupciones. Analisis completo automatizado. Supuestos documentados.
  - **supervisado**: Autonomo con checkpoint al completar cada seccion.
  - **paso-a-paso**: Confirma antes de cada seccion del analisis.
- `{FORMATO}`: `markdown` (default) | `html` | `dual`
- `{VARIANTE}`: `ejecutiva` (~40% — S1 + S3 + S6 only) | `tecnica` (full 6 sections, default)

If reference materials exist, load them:

```
Read ${CLAUDE_SKILL_DIR}/references/
```

## When to Use

- La organizacion necesita aumentar su equipo con talento externo (nearshore, offshore, on-site)
- Se requiere analizar brechas de talento contra las capacidades necesarias para un proyecto
- Es necesario disenar la composicion de un equipo augmentado
- Se necesita un plan de onboarding y ramp-up para personal externo
- Se busca establecer un framework de retencion y performance para el equipo augmentado

## When NOT to Use

- Diseno organizacional completo (restructuracion, re-org) → requiere consultoria de management
- Assessment de estado actual del equipo sin intencion de augmentation → use asis-analysis
- Transformacion digital que incluye staffing como un componente → use digital-transformation-discovery
- Recruiting interno o employer branding → fuera del scope de este framework

## Assumptions

- La organizacion tiene claridad sobre el scope del proyecto o programa que requiere augmentation
- Existe un equipo base con quien se integrara el personal augmentado
- Los roles y responsabilidades del equipo existente estan documentados o son accesibles via entrevistas
- Se puede proporcionar acceso a herramientas y documentacion en tiempo razonable para el onboarding
- El mercado laboral permite cubrir los perfiles identificados en los tiempos del roadmap

## Limits

- No reemplaza la consultoria de diseno organizacional (restructuracion, cambio de org chart)
- No incluye recruiting operativo (busqueda, filtrado, entrevistas de candidatos)
- No define precios — solo magnitudes de esfuerzo (posiciones x duracion)
- No cubre aspectos legales de contratacion (clasificacion contractor vs employee, regulaciones laborales locales)
- El analisis de disponibilidad en mercado es una estimacion basada en tendencias — no es un market study formal

## 6-Section Framework

### S1: Talent Gap Analysis

Analisis de capacidades actuales del equipo versus capacidades requeridas para el proyecto/programa.

**Dimensiones del analisis:**
- **Capacidades actuales:** Inventario de roles, skills, y experiencia del equipo existente
- **Capacidades requeridas:** Skills tecnicos, de dominio, y soft skills necesarios segun el scope del proyecto
- **Identificacion de gaps:** Delta por rol/skill entre lo actual y lo requerido
- **Scoring de criticidad:** Clasificacion de cada gap como `blocker` (sin este skill el proyecto no avanza), `important` (impacta velocidad o calidad), `nice-to-have` (mejora pero no bloquea)
- **Disponibilidad en mercado:** Assessment de que tan facil o dificil es encontrar cada perfil (alta demanda, nicho, abundante)

**Output:** Tabla de gaps con scoring de criticidad y disponibilidad en mercado.

### S2: Skills Matrix & Profiling

Matriz detallada de skills requeridos para el engagement.

**Categorias de skills:**
- **Technical skills:** Lenguajes de programacion, frameworks, herramientas, plataformas cloud, bases de datos
- **Soft skills:** Comunicacion (idioma, escrita/oral), liderazgo, colaboracion, resolucion de conflictos, autonomia
- **Domain knowledge:** Conocimiento de industria, regulaciones, procesos de negocio especificos

**Niveles de proficiencia:**

| Nivel | Descripcion | Indicadores |
|---|---|---|
| Learning | En proceso de adquisicion | Puede ejecutar con supervision constante |
| Capable | Funcional e independiente | Ejecuta tareas estandar sin guia, necesita apoyo en edge cases |
| Expert | Dominio avanzado | Resuelve problemas complejos, mentora a otros, define estandares |

**Certificaciones:** Estado de certificaciones relevantes por perfil (AWS, Azure, GCP, Scrum, PMP, ISTQB, etc.).

**Output:** Skills matrix con proficiency levels por rol y certificaciones requeridas vs deseables.

### S3: Team Composition Modeling

Modelo de composicion del equipo augmentado.

**Dimensiones del modelo:**
- **Roles:** Definicion de cada rol con responsabilidades, skills requeridos, y nivel de seniority
- **Distribucion de seniority:** Ratio junior/mid/senior. Regla general: minimo 30% senior para equipos nuevos, 20% para equipos maduros
- **Allocation percentages:** Dedicacion por recurso (100%, 75%, 50%). Evitar <50% — la fragmentacion reduce productividad
- **Team topology (Skelton & Pais):**
  - **Stream-aligned:** Entrega valor de negocio directamente
  - **Platform:** Provee capacidades internas que aceleran a los stream-aligned
  - **Enabling:** Asiste a otros equipos a adoptar nuevas capacidades
  - **Complicated-subsystem:** Gestiona subsistemas que requieren expertise especializado
- **Conway's Law alignment:** Analisis de si la estructura propuesta del equipo se alinea con la arquitectura del sistema

**Output:** Organigrama propuesto con roles, seniority, allocation, y team topology classification.

### S4: Onboarding & Ramp-Up Design

Plan de integracion para el personal augmentado.

**Componentes del plan:**
- **Knowledge transfer:** Sesiones de transferencia de conocimiento del dominio, arquitectura, procesos de negocio
- **Mentoring structure:** Asignacion de buddies/mentores del equipo existente para cada recurso augmentado
- **Documentation needs:** Documentacion minima requerida antes del Day 1 (arquitectura, estandares de codigo, procesos de deployment, accesos)
- **Tooling access:** Checklist de accesos a herramientas (repositorios, CI/CD, cloud, comunicacion, gestion de proyectos)
- **Cultural integration:** Ceremonias del equipo, normas de comunicacion, horarios, zonas horarias, idioma de trabajo

**Ramp-up timeline por seniority:**

| Seniority | Ramp-Up | Semana 1 | Semana 2-4 | Semana 4-8 |
|---|---|---|---|---|
| Senior | 2 semanas | Contexto + codebase review | Contribuciones independientes | Productividad plena |
| Mid | 4 semanas | Contexto + pairing | Tareas guiadas | Contribuciones independientes |
| Junior | 8 semanas | Contexto + training | Tareas con supervision | Tareas guiadas, inicio de autonomia |

**Output:** Plan de onboarding con timeline, checklist de accesos, y estructura de mentoring.

### S5: Retention & Performance Framework

Framework de retencion y evaluacion de performance para el equipo augmentado.

**KPI definition:**
- **Delivery KPIs:** Velocity, throughput, cycle time, defect rate
- **Integration KPIs:** Participacion en ceremonias, code review contributions, knowledge sharing
- **Quality KPIs:** Code review feedback, adherencia a estandares, test coverage de contribuciones

**Feedback cadence:**
- **Semanal:** 1:1 de 15 minutos con team lead (blockers, satisfaccion)
- **Mensual:** Review de performance contra KPIs con el delivery manager
- **Trimestral:** Evaluacion 360 (peers + delivery manager)

**Growth opportunities:**
- Acceso a certificaciones y training
- Rotacion entre proyectos para ampliar experiencia
- Path de crecimiento (junior → mid → senior → lead)

**Satisfaction monitoring:**
- eNPS mensual (promotores, pasivos, detractores)
- Exit interviews estructuradas
- Encuesta de clima trimestral

**Early warning indicators for attrition risk:**
- Caida en participacion en ceremonias
- Reduccion de throughput sin causa tecnica
- Feedback negativo recurrente en 1:1s
- Solicitud de cambio de proyecto

**Output:** Framework de performance con KPIs, feedback cadence, y early warning system.

### S6: Staffing Roadmap

Plan de staffing faseado con curvas de ramp-up.

**Phased hiring plan:**
- **Fase 1 (Foundation):** Roles criticos (blockers del S1). Seniors primero para establecer estandares y mentorear
- **Fase 2 (Growth):** Roles importantes. Mids que se integran al equipo ya estabilizado
- **Fase 3 (Scale):** Roles nice-to-have. Juniors que se benefician del equipo maduro y mentoring establecido

**Ramp-up curves:** Visualizacion de la capacidad del equipo en el tiempo, mostrando la curva de productividad real (no es lineal — sigue una curva S).

**Contingency positions:** Perfiles pre-identificados para cubrir rotacion o ausencias. Regla: 10-15% de contingencia sobre el equipo total.

**Succession planning:** Identificacion de single points of failure y plan de cross-training para mitigar.

**Budget magnitude indicators:**
- Expresado en `posiciones x duracion` (e.g., "3 seniors x 12 meses + 2 mids x 8 meses")
- NUNCA precios. Solo magnitudes de esfuerzo
- Incluir costo de onboarding como overhead (tipicamente 15-20% del primer mes por recurso)

**Output:** Roadmap visual con fases, ramp-up curves, y contingency plan.

## Trade-off Matrix

| Decision | Enables | Constrains | When to Use |
|---|---|---|---|
| **100% senior** | Velocidad inmediata, autonomia | Costo alto, mercado escaso | Proyectos cortos (<6 meses), alta complejidad |
| **Mix senior/mid/junior** | Balance costo-capacidad, growth | Requiere inversion en mentoring | Proyectos >6 meses, equipo estable |
| **Nearshore** | Zona horaria compatible, costo moderado | Pool limitado vs offshore | Overlap de horarios requerido, comunicacion frecuente |
| **Offshore** | Pool amplio, costo optimizado | Diferencia horaria, cultural gap | Tareas bien definidas, equipos autonomos |
| **Dedicated team** | Integracion profunda, ownership | Costo fijo, flexibilidad reducida | Programas >12 meses, producto propio |
| **Time & Materials** | Flexibilidad, ajuste dinamico | Menos predictibilidad presupuestal | Scope variable, discovery/R&D |

## Edge Cases

**Organizacion sin equipo base (greenfield team):**
Se requiere un Tech Lead o Architect senior que establezca cultura, estandares, y procesos. El onboarding se convierte en team building. Incrementar ratio senior a 50%.

**Rotacion alta en el equipo existente:**
La integracion del personal augmentado se dificulta si el contexto cambia constantemente. Priorizar documentacion exhaustiva sobre conocimiento tribal.

**Skills de nicho (mainframe, SAP, legacy):**
Lead times de recruiting mas largos (8-12 semanas vs 2-4 semanas estandar). Considerar training de perfiles cercanos como alternativa.

**Multi-timezone distributed team:**
Definir core hours de overlap minimo (4 horas). Ceremonias asincronas para lo que no requiere interaccion en tiempo real. Documentacion como ciudadano de primera clase.

**Ramp-down planning:**
Cuando el engagement tiene fecha de finalizacion, planear la transferencia de conocimiento inversa (del equipo augmentado al equipo existente) con al menos 4 semanas de anticipacion.

## Validation Gate

- [ ] Talent gap analysis cubre todos los roles y skills requeridos por el proyecto
- [ ] Cada gap tiene scoring de criticidad (blocker/important/nice-to-have) documentado
- [ ] Skills matrix incluye technical, soft, y domain skills con proficiency levels
- [ ] Team composition alineada con team topologies y Conway's Law
- [ ] Distribucion de seniority justificada con rationale (no arbitraria)
- [ ] Plan de onboarding tiene timeline especifico por seniority level
- [ ] KPIs de performance son medibles y tienen cadencia de review definida
- [ ] Early warning indicators de attrition documentados
- [ ] Staffing roadmap faseado con contingency positions (10-15%)
- [ ] Budget expresado en magnitudes (posiciones x duracion), NUNCA en precios
- [ ] Ramp-up curves reflejan productividad real (curva S, no lineal)

## Output Artifact

**Primary:** `Staff_Augmentation_Discovery_{project}.md` — Talent gap analysis, skills matrix, team composition model, onboarding plan, retention framework, and phased staffing roadmap with ramp-up curves and contingency plan.

**Diagramas incluidos:**
- Team composition diagram: roles, seniority distribution, team topology
- Ramp-up curve: capacity over time per phase
- Staffing roadmap: Gantt-style phased hiring plan
- Skills gap heatmap: current vs required by role

---
**Comunidad MetodologIA** | **Licencia:** GPL-3.0 | **Ultima actualizacion:** 14 de marzo de 2026

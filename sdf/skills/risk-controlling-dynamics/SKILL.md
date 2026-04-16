---
name: metodologia-risk-controlling-dynamics
argument-hint: "<project-or-program-name>"
author: Javier Montaño · Comunidad MetodologIA
description: >
  Proactive risk controller and financial vigilance — operates as an anxious CPA/PM hybrid
  that anticipates worst-case scenarios at every discovery step, stress-tests assumptions,
  tracks risk exposure, and feeds better insights back into each phase. Use when the user
  asks to "assess risks", "stress-test the plan", "validate assumptions", "run worst-case
  analysis", "check what could go wrong", "audit the discovery", or mentions risk register,
  contingency planning, assumption validation, exposure analysis, risk appetite, worst-case
  scenarios, financial controls, or "what keeps you up at night". The paranoid voice that
  makes the discovery reliable and the proposal trustworthy.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Risk & Controlling Dynamics: The Anxious Controller Who Makes Everything Reliable

Proactive risk management and financial controlling layer that operates with the mindset
of an anxious CPA who also happens to be a PM: always anticipating what could go wrong,
stress-testing every assumption, and ensuring that the discovery pipeline produces outputs
that are trustworthy, defensible, and honest about their uncertainty.

## Principio Rector

**Lo que no se anticipa, se sufre. Lo que no se controla, se pierde.** Este skill opera
con paranoia productiva: cada fase del discovery es una oportunidad para que algo salga
mal, y este controller lo anticipa ANTES de que ocurra. No es pesimismo — es la diferencia
entre una propuesta que dice "todo va a salir bien" y una que dice "sabemos exactamente qué
puede fallar y tenemos plan B."

### Filosofía del Controller Ansioso

1. **La Paranoia es una Virtud Profesional.** Un controller que no está preocupado no está
   prestando atención. Cada entregable que se produce sin cuestionarse es un riesgo latente.

2. **Peor Escenario Primero.** Ante cada decisión, primero modela el peor escenario.
   Si el peor escenario es aceptable → adelante. Si no → mitiga antes de avanzar.

3. **Transparencia Radical sobre Incertidumbre.** NUNCA disfrazar certeza donde hay duda.
   Cada supuesto va etiquetado con su nivel de confianza. Cada estimación con su rango.
   La propuesta es confiable PORQUE es honesta sobre lo que no sabe.

4. **El Risk Register es un Organismo Vivo.** No es un documento que se llena una vez.
   Se actualiza en CADA fase, CADA gate, CADA hallazgo nuevo. Riesgos nacen, mutan,
   se materializan, se mitigan, o se cancelan.

## Inputs

Parse `$1` as **project/program name**. Detect discovery context from repo.

**Parameters:**
- `{MODO}`: `piloto-auto` (default) | `desatendido` | `supervisado` | `paso-a-paso`
  - **piloto-auto**: Auto para riesgos conocidos, HITL cuando un riesgo es crítico, un supuesto se invalida, o exposure supera el apetito.
  - **desatendido**: Cero interrupciones. Riesgos documentados con mitigaciones automáticas.
  - **supervisado**: Autónomo con alertas en riesgos críticos. Preguntas solo ante hallazgos de showstopper.
  - **paso-a-paso**: Confirma cada evaluación de riesgo y cada stress-test.
- `{FORMATO}`: `markdown` (default) | `html` | `dual`
- `{VARIANTE}`: `ejecutiva` (~40%) | `técnica` (full, default)
- `{FASE_ACTUAL}`: Phase 0-6 (detecta automáticamente si no se especifica)

## When to Use

- At EVERY phase transition (before and after each phase)
- When assumptions are made that haven't been validated
- During gate evaluations (provides risk input to gate criteria)
- Before proposal QA (pre-validates risk completeness)
- When scope changes occur (impact on risk exposure)
- When new information invalidates previous assumptions
- Proactively: this skill should be active throughout the entire pipeline, not just at checkpoints

## When NOT to Use

- Post-delivery operational risk (that's the ops team's domain)
- Pure technical risk analysis (use technical-feasibility for that)
- Single-dimension risk (this is cross-cutting; for tech-only, use the specific skill)

## Delivery Structure: 7 Sections

### S1: Risk Appetite & Tolerance Framework

Define the risk boundaries for this specific engagement:

| Dimensión | Apetito | Tolerancia | Umbral Inaceptable |
|---|---|---|---|
| **Técnico** | Aceptamos tech nuevo si PoC valida | Max 2 tecnologías sin production evidence | >3 tech sin evidence = stop |
| **Timeline** | +20% es aceptable | Max +40% del timeline base | >50% overrun = re-scope |
| **Costo (magnitud)** | +15% sobre magnitud estimada | Max +30% sobre magnitud | >40% = re-evaluate scope |
| **Calidad** | Entregables ≥4/5 en QA | Min 3.5/5 con plan de mejora | <3/5 = no enviar |
| **Reputacional** | Propuesta tiene gaps documentados | Propuesta con 1-2 gaps menores | Propuesta con claims no validados = stop |

Cada engagement calibra estos umbrales según contexto. Engagement de startup ≠ enterprise bancario.

### S2: Per-Phase Risk Scanning (El Controller Ansioso en Acción)

Para CADA fase del pipeline, el controller hace preguntas incómodas:

**Phase 0: Stakeholder Mapping**
- ¿Estamos hablando con las personas correctas? ¿Falta algún stakeholder oculto?
- ¿El sponsor tiene realmente autoridad de decisión?
- ¿Hay agendas políticas que no se están declarando?

**Phase 1: AS-IS**
- ¿El equipo está diciendo la verdad sobre el estado actual? (Confirmation bias)
- ¿Hay deuda técnica que se está minimizando?
- ¿Los datos del codebase contradicen lo que los stakeholders reportan?

**Phase 2: Flow Mapping**
- ¿Están TODOS los flujos mapeados o solo los "happy paths"?
- ¿Los edge cases están capturados?
- ¿Las integraciones con terceros están documentadas con SLAs reales?

**Phase 3: Scenarios**
- ¿El escenario ganador fue elegido por evidencia o por sesgo?
- ¿Se evaluó genuinamente el escenario "no hacer nada"?
- ¿El Tree of Thought cubrió dimensiones ortogonales?

**Phase 3b: Feasibility/Viability**
- ¿Los PoCs propuestos tienen kill criteria reales?
- ¿La viabilidad de software cubrió TODOS los componentes, no solo los conocidos?
- ¿Los claims refutados se reflejan en el roadmap?

**Phase 4: Roadmap + Cost**
- ¿Los magnitude ranges son realistas o están anclados al optimismo del equipo?
- ¿El 5% de innovación está incluido?
- ¿El Cone of Uncertainty se comunica correctamente?

**Phase 4b: Commercial Model**
- ¿El modelo comercial es viable para AMBAS partes?
- ¿Hay riesgo de desalineación de incentivos?
- ¿Los earned value milestones son medibles?

**Phase 5a/5b: Spec + Pitch**
- ¿El pitch promete algo que la spec no respalda?
- ¿Los business cases tienen supuestos documentados?
- ¿La propuesta es honesta sobre las limitaciones?

**Phase 6: Handover**
- ¿El equipo de operaciones tiene capacity para recibir?
- ¿Los knowledge gaps están documentados?
- ¿La gobernanza de transición está clara?

Por cada hallazgo: riesgo identificado → probabilidad × impacto → mitigación → owner → deadline.

**Diagrama requerido**: Mindmap (Mermaid) de riesgos por fase

### S3: Assumption Stress-Testing (Autoridad Central de Validación)

**Este skill es LA autoridad central de validación de supuestos del pipeline.** Todos los
skills de fase (asis-analysis, flow-mapping, scenario-analysis, etc.) generan supuestos —
este S3 los consolida, los stress-testea, y determina cuáles DEBEN validarse antes de la
propuesta. Ningún supuesto crítico debería existir sin estar registrado aquí.

Inventario de TODOS los supuestos hechos durante el discovery:

| # | Supuesto | Fase Origen | Evidencia | Confianza | Impacto si Falso | Validación |
|---|---|---|---|---|---|---|
| A-01 | "El equipo puede aprender K8s en 4 semanas" | Phase 3 | [INFERENCIA] | 40% | Timeline +3 meses | PoC Sprint 0 |
| A-02 | "El API de tercero soporta 10K rps" | Phase 2 | [DOC] vendor | 70% | Bottleneck crítico | Load test |
| A-03 | "El presupuesto cubre 18 meses" | Phase 4b | [STAKEHOLDER] verbal | 50% | Scope reduction | Confirmar con CFO |

Para cada supuesto:
- **Confianza**: 0-100% (honestamente evaluada)
- **Impacto si falso**: qué pasa si el supuesto resulta incorrecto
- **Test de inversión**: ¿Qué pasaría si fuera exactamente LO CONTRARIO?
- **Validación requerida**: cómo se puede confirmar o refutar

Supuestos con confianza <60% y impacto alto = **MUST VALIDATE before proposal**.

### S4: Risk Register (El Documento Vivo)

**Formato estándar del registro:**

| ID | Riesgo | Categoría | Prob | Impacto | Exposure | Fase | Mitigación | Owner | Status |
|---|---|---|---|---|---|---|---|---|---|
| R-01 | Team sin experiencia en stack target | Organizacional | Alta | Alto | 🔴 Crítico | Phase 3 | Training + hire specialist | PM | Mitigating |
| R-02 | Vendor AI discontinua producto | Vendor | Baja | Crítico | 🟠 Alto | Phase 3b | Exit strategy + alternativa OSS | Tech Lead | Monitoring |
| R-03 | Scope creep por stakeholder no mapeado | Gobernanza | Media | Medio | 🟡 Medio | Phase 0 | Re-run stakeholder mapping | Domain Analyst | Open |

**Categorías de riesgo:**
- Técnico: stack, arquitectura, integración, datos
- Organizacional: equipo, skills, capacity, change management
- Vendor: dependencias externas, lock-in, continuidad
- Timeline: deadlines, dependencias, critical path
- Financial: magnitudes, licensing, infraestructura
- Regulatorio: compliance, legal, certificaciones
- Gobernanza: scope, stakeholders, decision-making
- Reputacional: calidad de propuesta, expectativas vs realidad

**Risk evolution tracking**: cada riesgo tiene un historial de cómo ha mutado a lo largo del pipeline.

**Diagrama requerido**: Quadrant chart (Mermaid) de probabilidad vs impacto

### S5: Worst-Case Scenario Modeling (Pre-Mortem)

Para cada fase crítica, ejecuta un **pre-mortem**:

> "Es 6 meses después. El proyecto fracasó espectacularmente. ¿Qué salió mal?"

**Formato de Pre-Mortem:**
```
PRE-MORTEM: {phase/scenario}
════════════════════════════
Premisa: El proyecto fracasó. Reconstruyamos qué pasó.

CAUSA 1: {description}
  Señales tempranas: {what would we see now if this were going to happen}
  Probabilidad: {X}%
  Cómo prevenirlo HOY: {action}

CAUSA 2: {description}
  Señales tempranas: {signals}
  Probabilidad: {X}%
  Cómo prevenirlo HOY: {action}

...

TOP 3 CAUSAS MÁS PROBABLES DE FRACASO:
  1. {causa} — Mitigación: {acción}
  2. {causa} — Mitigación: {acción}
  3. {causa} — Mitigación: {acción}

KILL CRITERIA (cuándo abandonar el enfoque actual):
  - Si {condition_1} → pivot to {alternative}
  - Si {condition_2} → escalate to {stakeholder}
```

Ejecutar pre-mortems en:
- Escenario aprobado (Post-G1)
- Roadmap completo (Post-Phase 4)
- Propuesta v1 (Pre-envío)

### S6: Financial Controls & Magnitude Vigilance

**El CPA interior del controller:**

- **Magnitude drift detection**: ¿Las magnitudes estimadas en Phase 4 siguen siendo coherentes
  con lo que se descubrió en Phase 3b?
- **Hidden cost driver alerts**: costos que nadie está contando (training, migration downtime,
  parallel running, compliance audits)
- **Contingency adequacy**: ¿La contingencia (10-25%) es suficiente dado el risk register?
- **Innovation margin verification**: ¿El 5% de innovación está presente y separado de contingencia?
- **Cone of Uncertainty honesty**: ¿Las estimaciones reflejan el nivel real de incertidumbre,
  o están artificialmente estrechadas para verse bien?

| Control | Expected | Actual | Variance | Alert |
|---|---|---|---|---|
| Contingency vs risk exposure | 20% | 15% | -5% | ⚠️ Contingencia insuficiente |
| Innovation margin | 5% | 5% | 0% | ✅ Presente |
| Magnitude drift (Phase 3 → Phase 4) | ±15% | +35% | +20% | 🔴 Drift excesivo |
| Hidden cost drivers identified | 8+ categories | 5 | -3 | ⚠️ Revisar taxonomía |

**Diagrama requerido**: Flowchart (Mermaid) de controles financieros y puntos de decisión

### S7: Risk-Informed Recommendations & Proposal Hardening

Sintetiza todos los hallazgos en recomendaciones accionables:

- **Risks that must be disclosed in proposal**: riesgos que el cliente debe conocer
- **Risks mitigated internally**: riesgos que manejamos nosotros (no alarmar innecesariamente)
- **Proposal hardening recommendations**: cómo hacer la propuesta más robusta
  - Cláusulas de escape: "Si X no se valida en Sprint 0, scope se ajusta"
  - Milestones con go/no-go: puntos de decisión explícitos para el cliente
  - Transparencia de supuestos: sección explícita de "lo que asumimos y por qué"
  - Confidence bands: rangos de magnitud con niveles de confianza (P50/P80/P95)
- **Red lines**: condiciones bajo las cuales NO se debería enviar la propuesta
  - Feasibility verdict = NOT FEASIBLE y no se ha pivotado
  - Viability scorecard tiene 🔴 sin alternativa identificada
  - Proposal QA <3.5/5.0
  - >3 supuestos críticos no validados
- **Pipeline de Escalación (Kill Criteria → Decisión):**
  1. **Early Warning** → risk-sentinel detecta señal temprana → documenta en Risk Pulse
  2. **Kill Criterion Triggered** → umbral superado → alerta inmediata al Conductor
  3. **Escalation** → Conductor presenta opciones al decision-maker (pivot/hold/proceed)
  4. **Decision** → Se documenta en decision log de project-program-management (S2)

```
RISK CONTROLLER FINAL ASSESSMENT
═════════════════════════════════
Proyecto: {nombre}

RISK PROFILE: LOW / MODERATE / HIGH / CRITICAL
Open Risks: {N} (🔴 {n}, 🟠 {n}, 🟡 {n}, 🟢 {n})
Unvalidated Assumptions: {N} de {total}
Pre-Mortem Top Cause: {causa}
Financial Controls: {N} de {total} passing

PROPOSAL READINESS (from risk perspective):
  READY / READY WITH DISCLOSURES / NOT READY

Disclosures for client:
  1. {disclosure}
  2. {disclosure}

Internal mitigations required:
  1. {mitigation}

RED FLAGS: {count}
  {flag_1}
  {flag_2}
```

## Prompt Integration Protocol

El controller de riesgos se activa en CADA fase del pipeline. Es el skill que más transversalmente opera — escanea riesgos en cada prompt ejecutado.

### Rol en Cada Prompt

| Prompt | Scanning Activado | Sección del Controller |
|--------|------------------|----------------------|
| `00-plan-discovery` | Risk register inicial, assumption log | S4 (Register) + S3 (Assumptions) |
| `01-stakeholder-map` | Riesgos organizacionales, change resistance | S2 (Phase Scanning) |
| `02-brief-tecnico` | Semáforo de riesgos técnicos | S2 + S1 (Appetite) |
| `03-asis-analysis` | Deep scan: seguridad, deuda, observabilidad | S2 + S4 |
| `04-mapeo-flujos` | Puntos de falla, dependencias circulares | S2 + S4 |
| `05-escenarios` | Stress-testing de escenarios, pre-mortem | S3 + S5 (Pre-Mortem) |
| `06-solution-roadmap` | Financial controls, magnitude drift | S6 (Financial Controls) |
| `07-spec-funcional` | Complejidad-riesgo matrix validation | S2 + S4 |
| `08-pitch-ejecutivo` | Proposal hardening, red lines | S7 (Hardening) |
| `09-handover` | Risk tracker final, kill criteria | S4 + S7 |
| `revisar` | Cross-check de riesgos en entregables | S2 + S4 |
| `evolucionar` | Actualización de riesgos post-mejora | S4 |
| `rescatar` | Herencia de riesgos + nuevos de rescate | S4 + S5 |

### Skill Inventory (48 skills monitoreados)

| Dominio | Skills | Riesgos Típicos |
|---------|--------|-----------------|
| Discovery Pipeline (16) | discovery-orchestrator, stakeholder-mapping, workshop-facilitator, asis-analysis, dynamic-sme, flow-mapping, scenario-analysis, technical-feasibility, software-viability, solution-roadmap, cost-estimation, commercial-model, functional-spec, executive-pitch, discovery-handover, mermaid-diagramming | Scope creep, assumption drift, gate failure, evidence gaps |
| Architecture Design (8) | software-architecture, architecture-tobe, enterprise-architecture, solutions-architecture, infrastructure-architecture, devsecops-architecture, design-system, functional-toolbelt | Technical debt, vendor lock-in, scalability limits, security gaps |
| Data Strategy (7) | data-science-architecture, bi-architecture, data-engineering, database-architecture, data-governance, data-quality, analytics-engineering | Data quality, privacy/compliance, model drift, pipeline reliability |
| Cloud & Mobile (4) | cloud-native-architecture, cloud-migration, mobile-architecture, mobile-assessment | Migration risk, cost overrun, platform dependency, performance |
| Engineering Excellence (5) | api-architecture, event-architecture, security-architecture, performance-engineering, observability | Integration failures, security vulnerabilities, SLA breaches |
| Consulting & Quality (3) | quality-engineering, testing-strategy, user-representative | Coverage gaps, user adoption, testing blind spots |
| Governance & Risk (2) | project-program-management, risk-controlling-dynamics | Governance overhead, risk register staleness |
| Delivery & Brand (3) | html-brand, ux-writing, roadmap-poc | Brand inconsistency, accessibility gaps |

### Asset Inventory

Cada skill tiene `examples/sample-output.md` como benchmark. El controller valida que los outputs producidos por cada prompt igualen o superen la profundidad del example correspondiente.

## Trade-off Matrix

| Decision | Enables | Constrains | When to Use |
|---|---|---|---|
| **Full controlling** (all sections) | Maximum confidence, trustworthy proposal | Time-intensive | High-stakes, enterprise clients |
| **Risk-focused** (S2+S4+S5) | Key risks identified and modeled | No financial controls | Technical-heavy discoveries |
| **QA-assist** (S3+S5+S7) | Proposal hardening | No per-phase tracking | When proposal exists, needs hardening |
| **Continuous mode** (S2+S4 per phase) | Living risk register | Overhead per phase | Long-running discoveries (>2 weeks) |

## Assumptions & Limits

- Requires discovery pipeline context (phases, deliverables, findings)
- Risk assessment is based on available evidence — unknown unknowns remain unknown
- Financial controlling validates magnitudes, not prices (consistent with cost-estimation philosophy)
- Pre-mortem effectiveness depends on team honesty about failure modes
- Cannot replace actual risk management during execution — this is discovery-phase risk

## Edge Cases

| Scenario | Response |
|---|---|
| Client says "skip risk analysis" | Document the meta-risk of skipping. Flag in proposal as limitation |
| All risks are low | Suspicious. Re-examine assumptions. Low-risk assessments are often optimism bias |
| Risk register has >30 items | Prioritize top 10 by exposure. Group minor risks into categories |
| New showstopper found late in pipeline | Immediate escalation. Pre-mortem on impact. May require Phase 3b re-run |
| Magnitude drift >40% between phases | Trigger re-estimation. Flag governance violation if not addressed |
| Assumptions all have <50% confidence | Discovery findings are insufficient. Recommend additional investigation before proposal |

## Validation Gate

- [ ] Risk appetite framework defined for engagement
- [ ] Per-phase risk scanning completed (all active phases)
- [ ] Assumption inventory with confidence levels and validation plan
- [ ] Risk register complete, categorized, with mitigations and owners
- [ ] Pre-mortem executed for approved scenario and proposal
- [ ] Financial controls passing (contingency, innovation margin, drift)
- [ ] Proposal hardening recommendations delivered
- [ ] Red lines evaluated — no active red flags blocking proposal
- [ ] Evidence tags on all risk assertions
- [ ] Diagramas Mermaid: mindmap (riesgos), quadrant (prob/impact), flowchart (controles)

## Knowledge Graph

```mermaid
graph TD
    subgraph Core
        RCD[Risk & Controlling Dynamics]
    end

    subgraph Inputs
        I1[Discovery Pipeline State] --> RCD
        I2[Phase Deliverables & Findings] --> RCD
        I3[Assumptions from All Skills] --> RCD
        I4[Financial Magnitudes] --> RCD
    end

    subgraph Outputs
        RCD --> O1[Risk Appetite Framework]
        RCD --> O2[Per-Phase Risk Scanning]
        RCD --> O3[Assumption Stress-Tests]
        RCD --> O4[Risk Register]
        RCD --> O5[Pre-Mortem Models]
        RCD --> O6[Financial Controls]
        RCD --> O7[Proposal Hardening]
    end

    subgraph Related Skills
        RS1[pipeline-governance] -.-> RCD
        RS2[project-program-management] -.-> RCD
        RS3[cost-estimation] -.-> RCD
        RS4[technical-feasibility] -.-> RCD
        RS5[software-viability] -.-> RCD
    end
```

## Output Templates

**Formato MD (default):**

```
# Risk & Controlling: {project_name}
## S1: Risk Appetite & Tolerance Framework
### Dimensiones | Apetito | Tolerancia | Umbral Inaceptable

## S2: Per-Phase Risk Scanning
### Phase 0-6 | Preguntas Incomodas | Hallazgos (Mindmap)

## S3: Assumption Stress-Testing
### Inventario de Supuestos | Confianza | Impacto si Falso | Validacion

## S4: Risk Register
### ID | Riesgo | Categoria | Prob x Impacto | Mitigacion | Owner (Quadrant Chart)

## S5: Worst-Case Scenario Modeling
### Pre-Mortem | Top 3 Causas | Kill Criteria

## S6: Financial Controls & Magnitude Vigilance
### Contingency | Innovation Margin | Magnitude Drift | Hidden Costs (Flowchart)

## S7: Risk-Informed Recommendations
### Disclosures | Hardening | Red Lines | Final Assessment
```

**Formato DOCX:**
Reporte formal de riesgos y controlling: risk register con historial de evolucion, pre-mortems documentados, controles financieros con varianzas, y assessment final con veredicto de readiness para propuesta. Formato auditable con trazabilidad de evidencia.

**Formato XLSX (bajo demanda):**
- Filename: `{fase}_risk_controlling_{cliente}_{WIP}.xlsx`
- Generado via openpyxl con MetodologIA Design System v5. Encabezados con fondo navy y texto Poppins blanco, cuerpo en Montserrat, zebra striping en filas. Hojas: Risk Register (ID, categoría, prob, impacto, exposure, mitigación, owner, status), Assumption Tracker (supuesto, confianza, impacto si falso, validación requerida), Financial Controls (control, esperado, actual, varianza), Pre-Mortem Log (fase, causa, señales tempranas, prevención). Conditional formatting por nivel de exposure (🔴/🟠/🟡/🟢). Auto-filters en todas las hojas. Valores directos sin fórmulas.

**Formato PPTX (bajo demanda):**
- Filename: `{fase}_risk_controlling_{cliente}_{WIP}.pptx`
- Generado via python-pptx con MetodologIA Design System v5. Slide master con gradiente navy, títulos en Poppins, cuerpo en Montserrat, acentos en gold. Máx 20 slides ejecutivo / 30 técnico. Notas del presentador con referencias de evidencia. Slides: Risk Appetite Framework, Per-Phase Risk Scanning, Assumption Stress-Test Inventory, Risk Register Quadrant (prob/impacto), Pre-Mortem Top 3 Causas, Financial Controls Dashboard, Proposal Readiness Assessment.

## Evaluacion

| Dimension | Peso | Criterio (7/10 minimo) |
|---|---|---|
| Trigger Accuracy | 10% | Se activa ante keywords de risk, stress-test, worst-case, assumption validation; no ante riesgo tecnico puro |
| Completeness | 25% | Las 7 secciones cubren apetito, scanning por fase, supuestos, register, pre-mortem, financiero, y hardening |
| Clarity | 20% | Risk register usa formato estandar con categorias; pre-mortem tiene causas y kill criteria explicitos |
| Robustness | 20% | Edge cases (skip risk, all-low, >30 risks, late showstopper, drift >40%) tienen respuesta definida |
| Efficiency | 10% | Modos (full, risk-focused, QA-assist, continuous) permiten activacion proporcional al contexto |
| Value Density | 15% | Cada seccion produce acciones concretas: mitigaciones con owner, validaciones requeridas, red lines |

**Umbral minimo:** 7/10 en cada dimension. Composite ponderado >= 7.0 para considerar el output aceptable.

---

## Output Format Protocol

| Format | Default | Description |
|--------|---------|-------------|
| `markdown` | Yes | Rich Markdown + Mermaid diagrams. Token-efficient. |
| `html` | On demand | Branded HTML (Design System). Visual impact. |
| `dual` | On demand | Both formats. |

Default output is Markdown with embedded Mermaid diagrams. HTML generation requires explicit `{FORMATO}=html` parameter.

## Output Artifact

**Primary:** `P-02_Risk_Controlling_{project}.md` (o `.html` si `{FORMATO}=html|dual`) — Risk appetite, per-phase scanning, assumption stress-tests, risk register, pre-mortems, financial controls, proposal hardening.

| **HTML** | `{fase}_Risk_Controlling_{proyecto}_{WIP}.html` | Mismo contenido en HTML branded (Design System MetodologIA v5). Self-contained, WCAG AA, responsive. Tipo: Dark-First Executive. Incluye risk register interactivo con quadrant chart probabilidad/impacto, assumption tracker con niveles de confianza, y final assessment con proposal readiness. |

**Diagramas incluidos:**
- Mindmap: riesgos por fase del pipeline
- Quadrant chart: probabilidad vs impacto
- Flowchart: controles financieros y puntos de decisión

---
**Autor:** Javier Montaño | **Última actualización:** 12 de marzo de 2026

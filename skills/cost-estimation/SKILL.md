---
name: cost-estimation
description: >
  Cost driver identification — effort inductors, scope drivers, magnitude estimation, team composition
  modeling, and risk-adjusted timeline ranges. Use when the user asks to "estimate effort", "identify
  cost drivers", "size the project", "plan team composition", "identify effort inductors", or mentions
  WBS, sizing, contingency, burn rate, PERT, Monte Carlo, or "Phase 4" cost work. NEVER produces
  final prices — produces drivers, ranges, and magnitude indicators with costing disclaimers.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Cost Estimation: Effort Drivers, Magnitude Indicators & Investment Framing

Translates technical scope into effort drivers, magnitude indicators, team composition models, and
risk-adjusted timeline ranges. Produces structured analysis of WHAT drives cost — not WHAT things cost.
Every output carries explicit disclaimers separating cost identification from pricing decisions.

## Principio Rector

**El costeo sin estructura es adivinación con formato de hoja de cálculo.** Este skill impone disciplina analítica sobre la estimación: cada driver se identifica, cada magnitud se triangula, cada supuesto se documenta. No producimos precios — producimos la base de conocimiento que hace posible tomar decisiones financieras informadas.

### Filosofía de Estimación

1. **Drivers, no precios.** El valor de este skill no está en producir un número final — está en identificar TODO lo que compone ese número. Los drivers son la verdad; el precio es una decisión posterior.

2. **Triangulación obligatoria.** Un solo método de estimación es una opinión. Dos métodos son una hipótesis. Tres métodos convergentes son confianza. Siempre triangular.

3. **Incertidumbre explícita.** Rangos, no puntos. Escenarios, no certezas. El Cone of Uncertainty no es debilidad — es honestidad profesional que genera confianza.

## Regla Cardinal

**NUNCA producir valores finales de costo, precio o tarifa.** Este skill identifica CONDUCTORES de
costo, INDUCTORES de esfuerzo, y NOCIONES DE MAGNITUD.

### Filosofía de Costeo

1. **Costear ≠ Cobrar ≠ Ingresos.** El costeo existe para entender qué cuestan las cosas — completamente
   desconectado de lo que se cobra. El revenue es una decisión comercial posterior e independiente.
   Este skill vive exclusivamente en el dominio del costeo.

2. **Costear para la Excelencia.** El propósito del costeo NO es solo presupuestar — es asegurar calidad,
   excelencia, y un "wow factor" de **hospitalidad irracional**. Cuando sabes lo que las cosas
   verdaderamente cuestan, puedes invertir apropiadamente en calidad. Costear bien = habilitar excelencia.

3. **Margen de innovación = inversión en futuro.** El 5% adicional no es contingencia — es la declaración
   de que la excelencia no es accidental. Es presupuesto deliberado para sorprender al cliente
   positivamente.

La diferencia:

| Este skill PRODUCE | Este skill NO produce |
|---|---|
| "Requiere 3 seniors + 2 mids × 18 meses" | "$1,200,000 USD" |
| "Licenciamiento enterprise tier de {vendor}" | "$45,000/año" |
| "Infra: 3 ambientes × cluster K8s + DB managed" | "$8,500/mes cloud" |
| "Magnitud: proyecto mediano-alto (100-200 FTE-meses)" | "Costo total: $2.3M" |
| "Driver principal: integración con 7 sistemas legacy" | "Integración costará $350K" |

### Disclaimer Obligatorio

Todo output DEBE incluir al pie:

```
DISCLAIMER DE COSTEO
═══════════════════
Este análisis identifica conductores de costo e inductores de esfuerzo.
NO constituye una cotización, presupuesto ni compromiso financiero.
Los valores finales requieren: (1) validación de tarifas vigentes,
(2) negociación comercial, (3) aprobación de alcance definitivo.
Costear ≠ Cobrar. Este documento informa lo primero.
```

### Cone of Uncertainty

Estimates narrow as projects progress. At concept phase: 0.25x-4x. After requirements: 0.67x-1.5x.
After detailed design: 0.8x-1.25x. Communicate ranges, not points. Re-estimate at each phase gate.

## Inputs

Parse `$1` as **project/initiative name**. Detect project context from repo.

**Parameters:**
- `{MODO}`: `piloto-auto` (default) | `desatendido` | `supervisado` | `paso-a-paso`
  - **piloto-auto**: Automático para rutina, HITL para decisiones críticas (selección de magnitud, aprobación de escenarios). Reporta en milestones.
  - **desatendido**: Cero interrupciones. Todo auto-resuelto.
  - **supervisado**: Autónomo con reportes en milestones. Preguntas solo ante ambigüedades genuinas.
  - **paso-a-paso**: Confirma antes de cada sección.
- `{FORMATO}`: `markdown` (default) | `html` | `dual`
- `{VARIANTE}`: `ejecutiva` (~40% — S1 scope + S4 drivers + S6 magnitude) | `técnica` (full 7 sections, default)

## Delivery Structure: 7 Sections

### S1: Scope Decomposition & Effort Drivers

- WBS: hierarchical decomposition from epic to feature to task
- Feature inventory with complexity classification: simple (<3d), medium (3-10d), complex (10+d)
- **Effort drivers identified**: cada feature con sus inductores de esfuerzo
  - Integración (# sistemas, protocolos, contratos)
  - Migración de datos (volumen, transformación, validación)
  - Compliance/regulatorio (certificaciones, auditorías)
  - Deuda técnica heredada (refactoring requerido)
  - Curva de aprendizaje (stack nuevo, dominio complejo)
- Dependency mapping and scope boundaries

### S2: Sizing Methods (Magnitud, no Valor)

- T-shirt sizing: S/M/L/XL con rangos de FTE-meses (no dinero)
- Story points calibrados a throughput, no a tarifa
- Reference-class forecasting: comparación con proyectos similares
- Three-point estimation: optimista/probable/pesimista por feature
- COCOMO II: modelo paramétrico por KSLOC/FP (produce esfuerzo-persona, no costo)
- **Triangulación de magnitud**: comparar métodos, flag divergencia >30%
- Output: "Magnitud estimada: X-Y FTE-meses" (NUNCA "costo: $Z")

### S3: Team Composition Modeling

- Role mapping: roles requeridos × seniority × % dedicación
- Ramp-up curves: 50% semanas 1-2, 80% semana 4, 100% semana 8
- Communication overhead: Brooks's Law, team topology
- **Driver de equipo**: build vs hire vs contract, onshore vs nearshore vs offshore
- Allocation patterns: full-time vs fractional, specialists time-boxed
- Output: modelo de equipo por fase (roles y cantidades, NO tarifas)
- **Diagrama requerido**: Gantt chart (Mermaid) con timeline de ramp-up del equipo por rol y fase

### S4: Cost Driver Taxonomy

**NUEVA SECCIÓN — el corazón del skill evolucionado.**

Identifica y clasifica TODOS los drivers de costo:

| Categoría | Drivers | Cómo Identificar |
|---|---|---|
| **Personal** | # FTEs, seniority mix, duración, ramp-up | Del WBS y modelo de equipo |
| **Licenciamiento** | Vendors, tiers (community/enterprise), periodicidad | Del stack tecnológico AS-IS y TO-BE |
| **Infraestructura** | Ambientes (dev/staging/prod), compute, storage, networking | De arquitectura y deployment |
| **Herramientas** | CI/CD, monitoring, testing, project management | De pipeline DevOps |
| **Training** | Capacitación en stack nuevo, certificaciones | De gap de skills del equipo |
| **Migración** | Volumen de datos, ventanas de migración, rollback | De modelo de datos y SLAs |
| **Compliance** | Auditorías, penetration testing, certificaciones | De regulación de industria |
| **Contingencia** | Known risks (10-15%), unknown-unknowns (15-25%) | Del risk register |
| **Oportunidad** | Costo de NO hacer: deuda acumulada, riesgo operacional | Del AS-IS |

Por cada driver:
- Nombre y descripción
- Magnitud relativa: Bajo / Medio / Alto / Crítico
- Fase(s) donde impacta
- Owner responsable de validar el valor real

**Diagramas requeridos:**
- Mindmap (Mermaid): visualización de taxonomía de cost drivers por categoría
- Flowchart (Mermaid): árbol de decisión para escenarios de magnitud

### S5: Risk-Adjusted Timeline Ranges

- PERT: (O + 4M + P) / 6 por feature
- Monte Carlo: P50 / P80 / P95 como rangos de duración (no costo)
- Critical path analysis
- Buffer strategy: 20-30% critical path
- Output: "Timeline estimado: X-Y meses (P80)" — sin valor monetario asociado

### S6: Magnitude Framing (replaces Budget Scenarios)

**No produce presupuestos. Produce marcos de magnitud.**

- Clasificación de magnitud del proyecto:
  - Micro (<20 FTE-meses)
  - Pequeño (20-50 FTE-meses)
  - Mediano (50-150 FTE-meses)
  - Grande (150-500 FTE-meses)
  - Enterprise (>500 FTE-meses)
- Rangos por escenario: optimista / probable / pesimista (en FTE-meses)
- Phased funding structure: esfuerzo por fase con gates
- **Indicadores de magnitud comparativa**: "Comparable a un equipo de 8 personas por 18 meses"
- Sensitivity analysis: qué drivers mueven más la aguja
- **Margen de Innovación (5%)**: Toda estimación incluye un 5% de sobre-costo explícitamente
  reservado para invertir en innovación, mejora de experiencia, y mejora continua para
  usuarios/clientes. Este margen NO es contingencia (que se calcula aparte) — es inversión
  deliberada en excelencia y hospitalidad irracional.

### S7: Costing Governance & Disclaimers

- Accuracy tracking framework (estimate vs actual)
- Re-estimation triggers: scope >10%, team change, tech change, risk materialization
- Cognitive bias mitigation: optimism, anchoring, planning fallacy
- **Separación costeo vs cobro**: este skill informa COSTEO (qué recursos se necesitan);
  COBRO (qué se le cobra al cliente) es decisión comercial separada que depende de
  modelo de negocio, margen, estrategia competitiva, y negociación.

## Trade-off Matrix

| Decision | Enables | Constrains | When to Use |
|---|---|---|---|
| **Bottom-up drivers** | Granular, traceable | Time-consuming | Post-discovery |
| **Top-down analogous** | Fast magnitude | Less precise | Pre-discovery |
| **Monte Carlo ranges** | Explicit uncertainty | Needs 3-point estimates | Stakeholder comms |
| **Phased funding** | Risk mitigation | Slower start | High uncertainty |

## Assumptions & Limits

- Identifica drivers y magnitudes, NO produce precios finales
- Scope defined at least to feature level
- Team velocity not transferable between teams
- Costear ≠ Cobrar — este skill no define modelo comercial ni margen

## Edge Cases

| Scenario | Response |
|---|---|
| Client asks for final price | Redirect: "Este análisis identifica drivers. El pricing es decisión comercial separada." |
| Greenfield / no history | Reference-class forecasting. Wider ranges. Flag as high uncertainty. |
| Legacy modernization | +30-50% buffer. Parallel running as driver. |
| Multi-vendor | +15-25% communication overhead driver. |
| Regulatory-heavy | Compliance driver: +20-40% testing effort. |

## Validation Gate

- [ ] WBS with effort drivers identified per feature
- [ ] Multiple sizing methods triangulated (magnitud, not price)
- [ ] Team composition model without rates (roles × quantity × duration)
- [ ] Cost driver taxonomy complete (8+ categories)
- [ ] Timeline ranges with P50/P80/P95
- [ ] Magnitude framing (not budget) with sensitivity analysis
- [ ] Disclaimer de costeo presente
- [ ] Zero final prices in output
- [ ] Margen de innovación 5% incluido (separado de contingencia)
- [ ] Diagramas Mermaid: Gantt (ramp-up), mindmap (drivers), flowchart (escenarios)

## Output Format Protocol

| Format | Default | Description |
|--------|---------|-------------|
| `markdown` | ✅ | Rich Markdown + Mermaid diagrams. Token-efficient. |
| `html` | On demand | Branded HTML (Design System). Visual impact. |
| `dual` | On demand | Both formats. |

Default output is Markdown with embedded Mermaid diagrams. HTML generation requires explicit `{FORMATO}=html` parameter.

## Output Artifact

**Primary:** `06_Cost_Drivers_{project}.md` (o `.html` si `{FORMATO}=html|dual`) — Effort drivers, magnitude indicators, team model, timeline ranges, costing governance. Con disclaimer obligatorio.

**Diagramas incluidos:**
- Gantt chart: timeline de ramp-up del equipo
- Mindmap: taxonomía de cost drivers
- Flowchart: árbol de decisión para escenarios de magnitud

---
**Autor:** Javier Montaño | **Última actualización:** 12 de marzo de 2026

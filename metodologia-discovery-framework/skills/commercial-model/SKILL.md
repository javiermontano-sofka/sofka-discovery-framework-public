---
name: metodologia-commercial-model
author: Javier Montano · Comunidad MetodologIA
argument-hint: "[project-name]"
description: >
  Business model and value capture strategy — identifies optimal commercial structures for
  technology engagements beyond T&M. Use when the user asks to "define business model",
  "structure the deal", "identify value capture", "design pricing strategy", "explore
  commercial models", or mentions earned value, joint venture, revenue share, outcome-based,
  licensing model, or commercial structure.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Commercial Model: Value Capture & Deal Structure Strategy

Identifies the optimal commercial model for a technology transformation engagement. Goes beyond
time-and-materials to explore value-based, outcome-based, and hybrid structures that align
incentives between delivery team and client. Produces model recommendations with trade-offs,
NOT pricing — pricing is a separate commercial decision.

## Principio Rector

**Este skill identifica MODELOS DE NEGOCIO y ESTRUCTURAS COMERCIALES — no produce precios,
tarifas ni márgenes.** La decisión final de pricing es del área comercial con inputs de este análisis.

### Filosofía Comercial

1. **Modelo antes que precio.** La estructura comercial define la relación — el precio es un detalle posterior. Este skill diseña la estructura, no la tarifa.
2. **Incentivos alineados = relación sostenible.** T&M puro desalinea: el proveedor gana cuando el proyecto se extiende. Los modelos híbridos crean skin-in-the-game.
3. **Transparencia radical.** El cliente debe entender la estructura — no solo aceptarla. La confianza se construye con claridad, no con complejidad contractual.

## Inputs

Parse `$1` as **project name**. Requires cost driver analysis (Phase 4) and scenario context.

**Parameters:**
- `{MODO}`: `piloto-auto` (default) | `desatendido` | `supervisado` | `paso-a-paso`
  - **piloto-auto**: Auto para catálogo de modelos y análisis de fit, HITL para recomendación de modelo y deal canvas.
  - **desatendido**: Cero interrupciones. Modelo recomendado automáticamente. Supuestos documentados.
  - **supervisado**: Autónomo con checkpoint en recomendación antes de deal canvas.
  - **paso-a-paso**: Confirma value map, cada modelo evaluado, y la estructura final.
- `{FORMATO}`: `markdown` (default) | `html` | `dual`
- `{VARIANTE}`: `ejecutiva` (~40% — S1 value map + S4 recommendation + S5 canvas) | `técnica` (full 6 sections, default)

## Delivery Structure: 6 Sections

### S1: Client Value Map

Identifica las fuentes de valor que la transformación genera para el cliente:

| Tipo de Valor | Descripción | Medible | Horizonte |
|---|---|---|---|
| **Ahorro directo** | Reducción de costos operativos | Sí — $/año | 6-12 meses |
| **Revenue enablement** | Nuevas capacidades → nuevos ingresos | Parcial — revenue pipeline | 12-24 meses |
| **Risk reduction** | Mitigación de riesgos operacionales/regulatorios | Sí — valor en riesgo | Inmediato |
| **Time-to-market** | Velocidad de entrega de features | Sí — lead time | 6-18 meses |
| **Compliance** | Cumplimiento regulatorio evita multas/sanctions | Sí — valor de multa evitada | Inmediato |
| **Scalability** | Capacidad de crecimiento sin rediseño | Parcial — capacidad × pricing | 18-36 meses |

Para cada fuente: cuantificar en rango de magnitud, identificar cómo se mediría.

### S2: Commercial Model Catalog

Evalúa cada modelo aplicable al contexto:

**M1: Time & Materials (T&M)**
- Estructura: horas × tarifa por rol
- Riesgo: 100% cliente (paga por tiempo, no por resultado)
- Ventaja: flexibilidad de scope, transparencia
- Cuándo: scope incierto, engagement exploratorio, equipo dedicado
- Desventaja: no alinea incentivos con resultados

**M2: Fixed Price por Fase**
- Estructura: precio fijo por cada fase del roadmap con gates
- Riesgo: repartido (fijo por fase, renegociable en gate)
- Ventaja: predictibilidad para el cliente, gates de salida
- Cuándo: scope definido por fase, confianza en estimaciones
- Desventaja: requiere scope congelado por fase

**M3: Outcome-Based / Valor Ganado (Earned Value)**
- Estructura: compensación vinculada a KPIs medibles
- Riesgo: repartido (delivery team tiene skin in the game)
- Ventaja: alinea incentivos, cliente paga por resultados
- Cuándo: KPIs claros y medibles, baseline existente
- Desventaja: requiere acuerdo en métricas y medición
- Ejemplo: "X% del ahorro demostrado en Year 1-3"

**M4: Joint Venture / Co-inversión**
- Estructura: ambas partes invierten, comparten propiedad y retorno
- Riesgo: compartido (ambos ganan o pierden)
- Ventaja: máximo alineamiento, compromiso largo plazo
- Cuándo: oportunidad de negocio nueva, no solo modernización
- Desventaja: complejidad legal, governance compartida

**M5: Usage-Based / Comisión por Uso**
- Estructura: pago basado en transacciones, usuarios, o throughput
- Riesgo: delivery team (invierte upfront, cobra en uso)
- Ventaja: barrera de entrada baja para el cliente
- Cuándo: plataformas, APIs, SaaS, marketplaces
- Desventaja: revenue incierto, requiere escala

**M6: Licensing / Producto**
- Estructura: licencia por el software o IP creada
- Riesgo: delivery team (invierte en producto, vende licencia)
- Ventaja: recurrencia, escalabilidad
- Cuándo: componente reutilizable, IP diferenciada
- Desventaja: requiere inversión en producto, no solo consultoría

**M7: Hybrid / Modelo Combinado**
- Estructura: base T&M + variable por resultado
- Riesgo: balanceado (base cubre costos, variable alinea incentivos)
- Ventaja: protección mutua, incentivo compartido
- Cuándo: la mayoría de los engagements reales
- Ejemplo: "T&M base + bonus del 15% si deployment time se reduce >50%"

### S3: Model Fit Analysis

Evalúa cada modelo contra el contexto del proyecto:

| Criterio | M1 T&M | M2 Fixed | M3 Earned | M4 JV | M5 Usage | M6 License | M7 Hybrid |
|---|---|---|---|---|---|---|---|
| Scope clarity | ★★ | ★★★★ | ★★★ | ★★ | ★★★ | ★★★★ | ★★★ |
| Client risk appetite | ★★★★★ | ★★★ | ★★ | ★ | ★★ | ★★★ | ★★★ |
| Value measurability | ★ | ★★ | ★★★★★ | ★★★ | ★★★★ | ★★ | ★★★★ |
| Relationship maturity | ★★★★★ | ★★★ | ★★ | ★ | ★★ | ★★★ | ★★★ |
| **FIT SCORE** | ? | ? | ? | ? | ? | ? | ? |

Score per dimension (1-5), weighted by project context.

### S4: Recommended Model & Structure

Propone el modelo recomendado (generalmente M7 Hybrid) con:

- Estructura propuesta: componentes fijos y variables
- KPIs para componente variable (si aplica)
- Phased gates: cómo el modelo evoluciona por fase
- Exit clauses: cómo sale cada parte en cada gate
- Governance del modelo: quién mide, cuándo se revisa
- Escalation path: qué pasa si los KPIs no se cumplen

### S5: Deal Structure Canvas

```
DEAL STRUCTURE CANVAS
═════════════════════
Modelo base: [M1-M7 o combinación]

COMPONENTE FIJO (si aplica):
  Cobertura: [qué cubre el fijo]
  Estructura: [por fase / mensual / milestone]
  Gate de salida: [condiciones]

COMPONENTE VARIABLE (si aplica):
  KPIs vinculados: [lista de métricas]
  Baseline: [punto de partida medible]
  Target: [meta a alcanzar]
  Mecanismo: [% del ahorro / bonus / revenue share]
  Medición: [quién mide, cada cuánto]
  Cap: [máximo de variable]

PROTECCIONES:
  Cliente: [gates, exit clauses, SLAs]
  Delivery: [floor mínimo, scope freeze por fase, change management]

IP:
  Owner: [cliente / delivery / compartida]
  Licensing: [si aplica]
```

### S6: Negotiation Preparation

- Fortalezas de la propuesta (para el cliente)
- Objeciones anticipadas y respuestas
- Walk-away conditions (para ambas partes)
- Secuencia de negociación recomendada
- Approval path por rol del cliente (CFO → CTO → Legal → Board)

## Trade-off Matrix

| Decision | Enables | Constrains | When to Use |
|---|---|---|---|
| Pure T&M | Simplicity, flexibility | No value alignment | New relationship, unclear scope |
| Outcome-based | Value alignment | Metric agreement complexity | Clear KPIs, baseline data |
| Hybrid | Balanced risk | More complex contract | Most real engagements |
| JV | Deep alignment | Legal complexity, shared control | New product/business line |

## Assumptions & Limits

- No produce precios, tarifas ni márgenes — produce estructura y modelo
- Value quantification uses magnitude ranges, not precise numbers
- Legal/contractual details require legal review — this is strategic framing
- Model recommendation is input to commercial negotiation, not the final deal

## Edge Cases

| Scenario | Response |
|---|---|
| Client insists on pure T&M | Document risks of misaligned incentives. Propose hybrid with minimal variable component as alternative |
| No measurable KPIs for outcome-based | Fall back to milestone-based (M2). Add KPI definition as Sprint 0 deliverable |
| Multi-vendor engagement | Recommend independent model per vendor. Add coordination overhead to base |
| Startup client (limited budget) | Explore M5 usage-based or M4 JV with equity component. Lower barrier to entry |
| Regulatory constraints on pricing | Flag legal review required. Document compliant model options |
| Client has bad vendor experience | Increase transparency mechanisms. Shorter gate intervals. More exit options |

## Casos Borde

| Caso | Estrategia de Manejo |
|------|---------------------|
| Cliente insiste en T&M puro sin componente variable | Documentar riesgos de incentivos desalineados; proponer hibrido con componente variable minimo como alternativa; respetar decision si persiste |
| No existen KPIs medibles para modelo outcome-based | Retroceder a milestone-based (M2); agregar definicion de KPIs como entregable de Sprint 0 para migrar a outcome-based en fases posteriores |
| Engagement multi-vendor donde cada vendor tiene modelo diferente | Recomendar modelo independiente por vendor; agregar overhead de coordinacion al componente base; definir governance inter-vendor |
| Cliente startup con presupuesto limitado y alto potencial | Explorar M5 usage-based o M4 JV con componente de equity; reducir barrera de entrada priorizando modelos que escalen con exito del cliente |

## Decisiones y Trade-offs

| Decision | Alternativa Descartada | Justificacion |
|----------|----------------------|---------------|
| Producir estructura y modelo, nunca precios ni tarifas | Incluir pricing recomendado en el analisis | El pricing es decision comercial que requiere contexto de mercado, margen, y negociacion; incluirlo en un skill de analisis crea compromisos prematuros |
| Evaluar los 7 modelos contra el contexto antes de recomendar | Recomendar siempre hibrido (M7) como default | Cada contexto tiene un modelo optimo diferente; asumir hibrido siempre sub-optimiza para casos donde T&M o outcome-based puro es superior |
| Incluir negotiation preparation (S6) como seccion del entregable | Limitarse a recomendacion de modelo sin preparacion de negociacion | El modelo sin preparacion de negociacion deja al equipo comercial sin herramientas para defender la estructura propuesta frente a objeciones |

## Knowledge Graph

```mermaid
graph TD
    subgraph Core["Commercial Model Core"]
        A[metodologia-commercial-model]
        A1[S1: Client Value Map]
        A2[S2: Model Catalog]
        A3[S3: Model Fit Analysis]
        A4[S4: Recommended Model]
        A5[S5: Deal Structure Canvas]
        A6[S6: Negotiation Preparation]
    end
    subgraph Inputs["Inputs"]
        I1[Cost Driver Analysis - Phase 4]
        I2[Scenario Context]
        I3[Client Relationship Maturity]
    end
    subgraph Outputs["Outputs"]
        O1[Commercial Model Report]
        O2[Deal Structure Canvas]
        O3[Negotiation Playbook]
    end
    subgraph Related["Related Skills"]
        R1[metodologia-cost-estimation]
        R2[metodologia-roadmap-poc]
        R3[metodologia-stakeholder-mapping]
        R4[metodologia-sector-intelligence]
    end
    I1 --> A
    I2 --> A
    I3 --> A
    A --> A1 --> A2 --> A3 --> A4 --> A5 --> A6
    A --> O1
    A --> O2
    A --> O3
    R1 --> A
    A --> R2
    R3 --> A
    R4 --> A
```

## Output Templates

**Formato MD (default):**

```
# Commercial Model — {proyecto}
## Resumen Ejecutivo
> Modelo recomendado: M7 Hibrido (T&M base + variable por resultado). Valor identificado: N fuentes.
## S1: Client Value Map
| Tipo de Valor | Descripcion | Medible | Horizonte |
## S2: Commercial Model Catalog
[7 modelos evaluados con ventajas/desventajas]
## S3: Model Fit Analysis
| Criterio | M1 | M2 | M3 | M4 | M5 | M6 | M7 |
## S4-S6: [secciones completas]
## Deal Structure Canvas
```
DEAL STRUCTURE CANVAS
...
```
```

**Formato HTML (bajo demanda):**

```
{fase}_Commercial_Model_{project}_{WIP}.html
```
HTML self-contained branded (Design System MetodologIA v5). Commercial page type. Incluye Deal Structure Canvas visual, model fit heatmap interactivo, y value map con comparativa de escenarios. WCAG AA, responsive.

**Formato PPTX (para presentacion comercial):**

```
Slide 1: Titulo + contexto del engagement
Slide 2: Client Value Map (tabla visual de fuentes de valor)
Slide 3: Modelos Evaluados (resumen comparativo 7 modelos)
Slide 4: Model Fit Analysis (radar chart o heatmap)
Slide 5: Modelo Recomendado (estructura con componentes fijo + variable)
Slide 6: Deal Structure Canvas (one-page visual)
Slide 7: Protecciones Mutuas (gates, exit clauses, SLAs)
Slide 8: Proximos Pasos (secuencia de negociacion)
```

**Formato DOCX (bajo demanda):**
- Filename: `{fase}_Commercial_Model_{project}_{WIP}.docx`
- Via python-docx con Design System MetodologIA v5. Cover page, TOC auto, headers/footers branded, tablas zebra. Poppins headings (navy), Montserrat body, gold accents.

**Formato XLSX (bajo demanda):**
- Filename: `{fase}_Commercial_Model_{cliente}_{WIP}.xlsx`
- Via openpyxl con MetodologIA Design System v5. Headers con fondo navy y tipografía Poppins en blanco, conditional formatting por fit score y modelo, auto-filters en todas las columnas, valores directos sin fórmulas.

## Evaluacion

| Dimension | Peso | Criterio | Umbral Minimo |
|-----------|------|----------|---------------|
| Trigger Accuracy | 10% | El skill se activa ante prompts de modelo comercial, deal structure, value capture, pricing strategy | 7/10 |
| Completeness | 25% | Las 6 secciones pobladas; value map con 3+ fuentes cuantificables; los 7 modelos evaluados; deal canvas completo | 7/10 |
| Clarity | 20% | Modelo recomendado es claro con estructura, KPIs, gates y exit clauses; zero ambiguedad en componentes fijo vs variable | 7/10 |
| Robustness | 20% | Edge cases cubiertos (T&M forzado, sin KPIs, multi-vendor, startup); objeciones anticipadas con respuestas | 7/10 |
| Efficiency | 10% | Variante ejecutiva vs tecnica correctamente aplicada; no se genera catalog completo cuando solo se necesita recomendacion | 7/10 |
| Value Density | 15% | Zero precios/tarifas/margenes en output; cada modelo tiene fit score contextualizado; negotiation prep incluye secuencia y approval path | 7/10 |

**Umbral minimo global: 7/10.** Si alguna dimension cae por debajo, el entregable requiere revision antes de entrega.

## Validation Gate

- [ ] Client value map with 3+ quantifiable value sources
- [ ] All 7 models evaluated against project context
- [ ] Model fit analysis with scores
- [ ] Recommended model with structure, KPIs, gates, exit clauses
- [ ] Deal Structure Canvas completed
- [ ] Negotiation preparation with objection handling
- [ ] Zero prices, rates, or margins in output

## Output Format Protocol

| Format | Default | Description |
|--------|---------|-------------|
| `markdown` | ✅ | Rich Markdown + Mermaid diagrams. Token-efficient. |
| `html` | On demand | Branded HTML (Design System). Visual impact. |
| `dual` | On demand | Both formats. |

Default output is Markdown with embedded Mermaid diagrams. HTML generation requires explicit `{FORMATO}=html` parameter.

## Output Artifact

**Primary:** `A-03_Commercial_Model_{project}.html` — Value map, model catalog, fit analysis, recommended structure, deal canvas, negotiation prep.

### Diagrams (Mermaid)
- Flowchart: value flow from delivery to value capture
- Quadrant chart: model fit analysis (alignment × risk)

---
**Autor:** Javier Montaño | **Última actualización:** 12 de marzo de 2026

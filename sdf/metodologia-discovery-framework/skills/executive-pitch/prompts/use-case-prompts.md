# Use-Case Prompts — executive-pitch

> 8 prompts listos para usar en escenarios comunes de pitch ejecutivo.
> Cada prompt incluye contexto, variables a personalizar y output esperado.

---

## 1. Full Executive Pitch — Modernización de Core

**Escenario:** El cliente tiene un sistema legacy de misión crítica (core bancario, ERP, CRM) que necesita modernización completa. Se requiere un business case completo para el CEO o steering committee.

```
/mao:pitch

Genera un executive pitch completo (7 secciones) para {EMPRESA}
dirigido a {NOMBRE_DECISOR}, {CARGO} (decision-maker: {ceo|cfo|cto|board}).

Contexto del cliente:
- Industria: {INDUSTRIA}
- Sistema actual: {DESCRIPCIÓN_SISTEMA}, {ANTIGÜEDAD} años
- Transacciones diarias: {VOLUMEN}
- Dolores principales: {DOLOR_1}, {DOLOR_2}, {DOLOR_3}
- Presupuesto indicativo: {under1m|1m-5m|over5m}

Incluye:
- Cost of Inaction con 4 dimensiones (técnica, operacional, competitiva, regulatoria)
- Modelo de inversión en FTE-months (nunca precios)
- Sensitivity analysis
- 3 opciones con trade-offs

{MODO}=piloto-auto {FORMATO}=dual {VARIANTE}=técnica
```

**Output esperado:** `06_Pitch_Ejecutivo_Deep.md` + `06_Pitch_Ejecutivo_Deep.html` (7 secciones completas)

---

## 2. Quick Pitch — Variante Ejecutiva (5-Slide)

**Escenario:** Reunión corta con C-level (30 minutos máximo). Se necesita la esencia del business case en formato compacto: Hero, Investment, Call to Action + soporte mínimo.

```
/mao:pitch

Genera un pitch ejecutivo compacto (variante ejecutiva) para {EMPRESA}
dirigido a {NOMBRE_DECISOR}, {CARGO}.

Contexto:
- Problema central: {PROBLEMA_EN_UNA_LÍNEA}
- Impacto anual estimado: {MONTO_IMPACTO}
- Solución propuesta: {SOLUCIÓN_EN_UNA_LÍNEA}
- Timeline estimado: {MESES} meses
- Esfuerzo estimado: {FTE_MONTHS} FTE-months

Solo incluir:
- Section 1: Hero KPIs (4 métricas clave)
- Section 2: Problem Statement (compacto, top 3 pain points)
- Section 5: Investment Summary (timeline, esfuerzo, gates)
- Section 6: Call to Action (ask, deadline, cost of delay)

{MODO}=desatendido {FORMATO}=markdown {VARIANTE}=ejecutiva
```

**Output esperado:** `06_Pitch_Ejecutivo_Light.md` (~40% del tamaño del pitch completo)

---

## 3. Cost-of-Inaction Focused Pitch

**Escenario:** El cliente no percibe urgencia. Necesitamos un pitch donde el anchor sea el costo de no hacer nada, no el ROI de hacer algo. Ideal para audiencias conservadoras o que han rechazado propuestas anteriores.

```
/mao:pitch

Genera un pitch centrado en Cost of Inaction para {EMPRESA}.
Decision-maker: {CARGO}. Budget range: {RANGO}.

El cliente ha rechazado {N} propuestas anteriores de modernización.
Necesitamos un framing donde el protagonista es el costo de NO actuar.

Énfasis especial:
- Section 2 expandida: Cost of Inaction con las 4 dimensiones detalladas a 3 años
- Burn rate mensual de inacción como KPI principal del Hero
- Section 4: "Do Nothing" como opción más cara (anchor)
- Section 6: Consecuencias específicas de cada mes de retraso

Contexto de dolor:
- Costo operacional actual: {MONTO}/año
- Hallazgos de auditoría: {NÚMERO} findings ({CRÍTICOS} críticos)
- Competidores que ya migraron: {LISTA}
- Regulación pendiente: {REGULACIÓN} efectiva {FECHA}

{MODO}=piloto-auto {FORMATO}=markdown
```

**Output esperado:** Pitch donde Section 2 ocupa ~40% del documento. El primer número que se ve es el costo de inacción, no el costo de la solución.

---

## 4. Innovation Investment Pitch

**Escenario:** No es remediación sino inversión en capacidades nuevas (AI/ML, IoT, plataforma digital, nuevo canal). El framing es oportunidad + competitive advantage, no dolor + urgencia.

```
/mao:pitch

Genera un pitch de inversión en innovación para {EMPRESA}.
Decision-maker: {CARGO}. Budget: {RANGO}.

Contexto:
- La plataforma actual funciona (no hay crisis)
- Oportunidad de mercado: {DESCRIPCIÓN_OPORTUNIDAD}
- TAM estimado: {MONTO}
- Ventana de oportunidad: {MESES} meses antes de que competidores capturen
- Capacidad habilitante: {TECNOLOGÍA} (AI/ML, IoT, plataforma digital, etc.)

Ajustes al pitch estándar:
- Section 1 Hero: Revenue opportunity como KPI principal (no cost savings)
- Section 2: Opportunity cost reemplaza "pain points"
- Section 3: Pilares = Revenue, Market Position, Capability, Future-Proofing
- Section 4: Build vs Buy vs Partner comparison
- Cost of Inaction reframed como "Cost of Missing the Window"

{MODO}=supervisado {FORMATO}=dual
```

**Output esperado:** Pitch con tono aspiracional. El anchor es la oportunidad de mercado, no el dolor operativo.

---

## 5. Technical Debt Remediation Pitch

**Escenario:** El CTO sabe que hay deuda técnica insostenible pero necesita un business case para que el CFO/Board apruebe presupuesto. El desafío es traducir deuda técnica a lenguaje financiero.

```
/mao:pitch

Genera un pitch de remediación de deuda técnica para {EMPRESA}.
Decision-maker: cfo (el CTO ya está alineado).

Contexto técnico (traducir a lenguaje financiero):
- Deuda técnica acumulada: {DESCRIPCIÓN}
- Sistemas afectados: {LISTA_SISTEMAS}
- Edad promedio del stack: {AÑOS} años
- Incidentes críticos últimos 12 meses: {NÚMERO}
- Tiempo de resolución promedio: {HORAS} horas
- Costo estimado por incidente: {MONTO}
- Velocidad de delivery actual vs deseada: {ACTUAL}x vs {META}x

Ajustes al pitch:
- Cero jargon técnico en Sections 1, 5, 6
- Section 2: Pain points traducidos a impacto financiero
- Section 3: Pilar "Technical Modernization" expandido con métricas de negocio
- Section 4: "Pagar ahora vs pagar después (con intereses)" como framing
- Sensitivity analysis obligatoria (CFO audience, budget > $1M)

{MODO}=piloto-auto {FORMATO}=markdown
```

**Output esperado:** Business case donde cada métrica técnica tiene su equivalente financiero. El CFO no necesita entender microservicios — necesita entender que cada incidente cuesta $X y que hay Y incidentes al año.

---

## 6. Cloud Migration Business Case

**Escenario:** Migración de on-premise a cloud (o multi-cloud). El business case debe cubrir TCO comparison, FinOps projections, y el camino de migración.

```
/mao:pitch

Genera un business case de migración cloud para {EMPRESA}.
Decision-maker: {CARGO}. Budget: {RANGO}.

Contexto:
- Infraestructura actual: {DESCRIPCIÓN} (on-premise, colocation, hybrid)
- Workloads a migrar: {NÚMERO} aplicaciones, {TB} TB de datos
- Costo actual de infraestructura: {MONTO}/año
- Cloud target: {AWS|Azure|GCP|Multi-cloud}
- Compliance requirements: {REQUISITOS}

Secciones adicionales:
- TCO Comparison: on-premise vs cloud (3-year y 5-year)
- FinOps projections: committed vs on-demand, reserved instances
- Migration waves: Rehost, Replatform, Refactor breakdown
- Risk: data sovereignty, latency, vendor lock-in mitigation

Sección 5 debe usar FTE-months por wave de migración.
Incluir modelo de costos cloud como magnitudes (Small/Medium/Large), no precios específicos.

{MODO}=piloto-auto {FORMATO}=markdown
```

**Output esperado:** Business case con TCO comparison detallado. Cloud costs expresados como magnitudes relativas al costo actual (e.g., "60-70% del costo on-premise en Year 2").

---

## 7. M&A Technical Due Diligence Pitch

**Escenario:** MetodologIA realiza due diligence técnica para un proceso de M&A. El pitch presenta hallazgos y recomendaciones de integración/remediación al board del adquirente.

```
/mao:pitch

Genera un pitch de due diligence técnica para el board de {EMPRESA_ADQUIRENTE}.
Contexto: evaluación de {EMPRESA_TARGET} para adquisición.
Decision-maker: board. Budget: over5m.

Hallazgos de due diligence:
- Fortalezas técnicas del target: {LISTA}
- Riesgos técnicos identificados: {LISTA}
- Deuda técnica estimada: {MAGNITUD} (S/M/L/XL)
- Integración requerida: {DESCRIPCIÓN}
- Timeline estimado de integración: {MESES} meses

Ajustes al pitch:
- Section 1 Hero: Integration risk score + remediation effort + synergy timeline
- Section 2: Due diligence findings (strengths + risks)
- Section 3: Synergy pillars (cost, revenue, technology, talent)
- Section 4: Integrate-as-is vs Remediate-then-integrate vs Rebuild
- Section 5: Integration roadmap in FTE-months
- Section 7: Expanded risk section (this is M&A — risk is everything)
- Board governance: quarterly recalibration gates, kill criteria explicit

{MODO}=supervisado {FORMATO}=dual
```

**Output esperado:** Pitch con framing de inversión (la adquisición ya está en proceso — el pitch justifica el integration budget). Section 7 (Risk) ocupa ~25% del documento.

---

## 8. Board Presentation — Non-Technical Audience

**Escenario:** Presentación a un board donde ningún miembro tiene background técnico. Todo debe ser lenguaje de negocio, analogías financieras, y métricas de impacto.

```
/mao:pitch

Genera un pitch para board no-técnico de {EMPRESA}.
Decision-maker: board. Budget: {RANGO}.

Restricciones de audiencia:
- CERO jargon técnico (no APIs, no microservicios, no cloud-native)
- Traducir todo a analogías financieras y de negocio
- Usar comparaciones con industrias que el board conoce
- Métricas: solo financieras (ahorro, revenue, ROI, payback)
- Diagramas: solo Gantt (timeline) y barras (financial comparison)

Contexto del proyecto:
- Problema en lenguaje de negocio: {DESCRIPCIÓN_SIN_JARGON}
- Impacto financiero: {MONTO}/año
- Solución en lenguaje de negocio: {DESCRIPCIÓN_SIN_JARGON}
- Analogía: "Es como {ANALOGÍA_FAMILIAR}"

Secciones obligatorias:
- Sensitivity analysis (board audience)
- Worst-case scenario explicit
- Kill criteria per phase
- Quarterly recalibration gates
- Fiduciary responsibility framing

{MODO}=paso-a-paso {FORMATO}=dual {VARIANTE}=técnica
```

**Output esperado:** Pitch donde un miembro del board sin background técnico puede leer cada sección y entender el impacto. Si aparece un término técnico, hay una nota al pie con traducción.

---

## Notas de Uso

1. **Personalizar variables:** Reemplazar todo lo que está entre `{LLAVES}` con datos del cliente.
2. **Combinar prompts:** Se pueden mezclar elementos de varios prompts (e.g., Cost-of-Inaction focus + Board audience).
3. **Prior phases:** Los mejores pitches se alimentan de datos reales de fases previas (AS-IS, Flows, Scenarios). Si no hay datos previos, el skill usa benchmarks de industria y los marca como `[SUPUESTO]`.
4. **Iteration:** Usar `/mao:discovery-improve` post-pitch para refinar con feedback del cliente.

---

*Autor: Javier Montaño | Comunidad MetodologIA | Marzo 2026*

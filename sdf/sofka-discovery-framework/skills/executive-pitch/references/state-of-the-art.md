# State of the Art — executive-pitch

> Tendencias 2024-2026 en business case development, executive communication y financial modeling para consultoría tecnológica.

---

## TL;DR

- Los business cases estáticos en PDF están muertos; las organizaciones líderes usan **dashboards interactivos con métricas en tiempo real**.
- La IA generativa produce borradores de proyecciones financieras en minutos, pero el **juicio humano sobre supuestos** sigue siendo el diferenciador.
- **ESG/sostenibilidad** ya no es un apéndice — es una dimensión obligatoria del business case en mercados regulados.
- Los modelos de **outcome-based pricing** redefinen cómo se presenta el ROI: el cliente paga por resultados, no por esfuerzo.
- El **cost of inaction** se ha convertido en el anchor persuasivo dominante, superando al ROI proyectado como driver de decisión.

---

## 1. Data-Driven Business Cases con Métricas en Tiempo Real

**Estado actual (2024-2026):**

Los business cases tradicionales se construían como documentos estáticos con proyecciones a 3-5 años basadas en supuestos fijos. La tendencia actual es hacia **living business cases** conectados a dashboards que actualizan métricas en tiempo real.

| Aspecto | Antes (2020-2023) | Ahora (2024-2026) |
|---------|-------------------|-------------------|
| Formato | PDF/PPTX estático | Dashboard interactivo + executive summary |
| Métricas | Proyecciones basadas en supuestos | Baselines medidas + projections calibradas |
| Actualización | Anual | Continua (post-aprobación) |
| Fuente de datos | Entrevistas + benchmarks genéricos | Telemetría real + industry-specific benchmarks |

**Implicaciones para el skill:**
- Las Secciones 2 (Problem Statement) y 3 (Value Proposition) deben citar fuentes de datos reales cuando existan, no solo benchmarks genéricos.
- El output debería incluir recomendaciones para un dashboard post-aprobación que trackee los KPIs del Hero.

**Referencias:**
- Gartner, "Predicts 2025: The Business Case for Digital Investment Must Evolve", 2024.
- McKinsey, "From static slides to living business cases", McKinsey Digital, Q3 2024.

---

## 2. IA Generativa para Proyecciones Financieras

**Estado actual (2024-2026):**

Los modelos de lenguaje y herramientas especializadas (Causal, Pigment, Anaplan con AI copilots) generan proyecciones financieras, sensitivity analysis y escenarios Monte Carlo en minutos. Esto cambia radicalmente el time-to-pitch.

| Capacidad | Herramienta | Madurez |
|-----------|------------|---------|
| Generación de escenarios financieros | LLMs + spreadsheet copilots | Alta — draft quality en minutos |
| Sensitivity analysis automatizada | Causal, Pigment AI | Media-Alta — requiere calibración |
| Monte Carlo simulation | Anaplan AI, Crystal Ball | Alta — democratizado |
| Narrative generation from data | GPT-4+, Claude | Alta — pero requiere fact-checking humano |

**Riesgos:**
- **Hallucinated precision:** la IA puede generar números con decimales que dan falsa sensación de exactitud. Los supuestos deben ser explícitos y validados por humanos.
- **Bias de optimismo:** los modelos tienden a generar escenarios optimistas si no se constrainan con worst-case prompts.

**Implicaciones para el skill:**
- El skill ya requiere que "every financial input must cite its source or state its assumption explicitly" — esto es ahora más crítico que nunca.
- Los financial-validator agents deben verificar la coherencia interna de las proyecciones.

**Referencias:**
- Sequoia Capital, "AI in Financial Planning: Separating Signal from Noise", 2025.
- Harvard Business Review, "When AI Makes Your Business Case", Jan 2025.

---

## 3. Pitch Decks Interactivos y Dinámicos

**Estado actual (2024-2026):**

Las presentaciones ejecutivas evolucionan de PPTX lineales a experiencias interactivas donde el decisor puede explorar escenarios, ajustar parámetros y ver impacto en tiempo real.

| Formato | Uso | Ventaja | Limitación |
|---------|-----|---------|-----------|
| PPTX clásico | Steering committee, board | Familiar, controlable | Estático, no permite exploración |
| HTML interactivo | Sesiones 1:1 con C-level | Dinámico, memorable | Requiere laptop/proyector |
| Dashboard en vivo | Post-aprobación, governance | Datos reales, actualizable | No apto para primera presentación |
| Video pitch (3-5 min) | Pre-read antes de reunión | Asíncrono, escalable | No permite Q&A |

**Tendencias emergentes:**
- **Scrollytelling** para business cases: narrativa que se revela al hacer scroll, con visualizaciones que aparecen en contexto.
- **Scenario sliders**: el decisor mueve un slider de "aggressive" a "conservative" y ve NPV/IRR actualizarse.
- **Embedded calculators**: "¿Qué pasa si el timeline se extiende 3 meses?" — respuesta instantánea.

**Implicaciones para el skill:**
- El HTML output del skill debería evolucionar hacia interactividad (fase futura).
- El PPTX spec debe considerar que algunos slides serán "discussion slides" donde el presentador navega escenarios.

**Referencias:**
- Pitch (pitch.com), "The State of Presentations 2025", annual report.
- Beautiful.ai, "AI-Powered Pitch Trends", Q1 2025.

---

## 4. ESG/Sostenibilidad como Dimensión Obligatoria del Business Case

**Estado actual (2024-2026):**

En mercados regulados (banca, energía, healthcare) y para inversiones >$1M, el componente ESG ya no es opcional. Los boards exigen que el business case aborde:

| Dimensión ESG | Preguntas que el Board hace | Cómo aplica al skill |
|--------------|---------------------------|---------------------|
| **Environmental** | ¿Cuál es la huella de carbono del proyecto? ¿Reduce o aumenta? | Cloud migration: calcular reducción de emisiones por datacenter consolidation. |
| **Social** | ¿Impacto en empleados? ¿Reskilling plan? | Automation: plan de transición para roles afectados. |
| **Governance** | ¿Compliance? ¿Data privacy? ¿Ethical AI? | Regulatory dimension del Cost of Inaction ya cubre parcialmente. |

**Regulaciones clave (2024-2026):**
- EU CSRD (Corporate Sustainability Reporting Directive) — obligatorio para empresas >250 empleados.
- SEC Climate Disclosure Rules (EE.UU.) — en implementación gradual.
- Regulaciones locales en LatAm: Colombia (taxonomía verde), Brasil (IFRS S1/S2 adoption).

**Implicaciones para el skill:**
- Considerar agregar una sub-sección ESG en Section 3 (Value Proposition) o Section 7 (Risk Assessment) cuando el contexto lo requiera.
- El Cost of Inaction podría incluir una 5ta dimensión: ESG/reputational risk.

**Referencias:**
- World Economic Forum, "The Global Risks Report 2025", Jan 2025.
- PwC, "ESG in Technology Business Cases", Global Survey 2024.

---

## 5. Outcome-Based Pricing en Consultoría

**Estado actual (2024-2026):**

El modelo tradicional de consultoría (time & materials, fixed price) está siendo desafiado por modelos donde el consultor comparte riesgo y recompensa con el cliente.

| Modelo | Descripción | Riesgo Consultor | Aplicación |
|--------|------------|-----------------|-----------|
| T&M | Pago por hora/día | Bajo | Discovery, análisis |
| Fixed Price | Precio cerrado por entregable | Medio | Implementación definida |
| **Outcome-Based** | Pago vinculado a resultados medibles | Alto | Modernización con KPIs claros |
| **Gain-Sharing** | % del ahorro/ganancia generada | Muy Alto | Optimización de costos |
| **Hybrid** | Base fixed + bonus por outcomes | Medio-Alto | Transformación compleja |

**Implicaciones para el skill:**
- La Sección 5 (Investment Summary) debe poder presentar el modelo de inversión como FTE-months con indicación del modelo de pricing sin revelar precios (política MetodologIA).
- Los KPIs del Hero se convierten en "gates de pago" en modelos outcome-based — la precisión de las métricas es existencial.
- El pitch debe demostrar que los KPIs son medibles, atribuibles y alcanzables.

**Referencias:**
- McKinsey, "The Next Era of Consulting: Outcome-Based Models", 2024.
- Bain & Company, "Shared Risk, Shared Reward: The Future of Tech Consulting", 2025.

---

## 6. Tendencias Emergentes (Horizonte 2026-2028)

| Tendencia | Madurez | Impacto Potencial |
|-----------|---------|-------------------|
| **AI-generated board presentations** | Experimental | Alto — first draft en minutos, pero requiere heavy editing |
| **Digital twins para business cases** | Emergente | Medio — simular el impacto de la inversión antes de aprobar |
| **Real-time competitive intelligence** | Creciente | Alto — enriquecer "Competitive Loss" del CoI con datos live |
| **Blockchain-verified projections** | Conceptual | Bajo — transparencia en supuestos, pero overhead innecesario hoy |
| **Voice-first executive briefings** | Creciente | Medio — CEOs que prefieren audio briefing de 5 min pre-reunión |

---

## Matriz de Impacto en el Skill

| Tendencia | Secciones Impactadas | Acción Requerida | Prioridad |
|-----------|---------------------|-----------------|-----------|
| Data-driven business cases | S2, S3, S5 | Recomendar dashboard post-aprobación | Media |
| AI financial projections | S3, S4, S5 | Reforzar validación de supuestos | Alta |
| Interactive pitch decks | HTML output, PPTX spec | Evolucionar HTML a interactivo | Media |
| ESG dimension | S3, S7 | Agregar sub-sección ESG condicional | Alta |
| Outcome-based pricing | S5, S6 | Adaptar investment model a múltiples pricing models | Alta |

---

*Autor: Javier Montaño | Comunidad MetodologIA | Marzo 2026*

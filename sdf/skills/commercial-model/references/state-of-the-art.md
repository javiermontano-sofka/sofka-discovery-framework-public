# State of the Art — Commercial Model (2024-2026)

> Tendencias, modelos emergentes y debates abiertos en el dominio de modelos comerciales para tecnología: pricing, licensing, partnerships, y captura de valor.

---

## 1. Tendencias Dominantes

### 1.1 Usage-Based Pricing (Consumption Models)

- **Qué está pasando:** La migración de modelos seat-based a consumption-based se ha acelerado. OpenMeter, Amberflo, Metronome, y Orb han emergido como plataformas de metering. Según OpenView Partners (2025), el 61% de las empresas SaaS incluyen algún componente usage-based, vs. 34% en 2020. El modelo pure usage-based es raro — la mayoría adopta "usage-based hybrid" (base + variable).
- **Impacto en el skill:** M5 (Usage-Based) ya no es solo para APIs y plataformas — es relevante para cualquier engagement donde el valor sea proporcional al consumo. S4 (Recommended Model) debe evaluar componentes de consumo en casi todo hybrid (M7). S5 (Deal Structure Canvas) necesita metering infrastructure como requisito técnico del deal.
- **Debate abierto:** Revenue predictability vs. customer alignment. CFOs prefieren predictibilidad (subscription), clientes prefieren pagar por uso. El mercado converge en committed-use discounts (como los Reserved Instances de cloud).
- **Fuentes:** OpenView Partners (2025) "State of Usage-Based Pricing"; Kyle Poyar (2024) "Growth Unhinged Newsletter"; Bessemer Venture Partners (2025) "State of the Cloud".

### 1.2 Product-Led Growth (PLG) Commercial Models

- **Qué está pasando:** PLG ha redefinido cómo se estructura el modelo comercial: free tier → self-serve → sales-assisted → enterprise. El funnel comercial empieza con el producto, no con el vendedor. Empresas como Atlassian, Notion, Figma, y Vercel han demostrado que PLG puede escalar a enterprise sin sacrificar margen.
- **Impacto en el skill:** Cuando el engagement produce un producto (M6: Licensing), el modelo comercial debe diseñar el funnel PLG desde discovery. S2 debe evaluar si el producto tiene potencial de self-serve adoption. S5 (Deal Canvas) incluye tier design: free, pro, enterprise.
- **Estado 2026:** ~45% de unicornios SaaS usan PLG como canal principal. El concepto de "Product-Led Sales" (PLS) combina PLG bottom-up con top-down enterprise sales.
- **Fuentes:** Wes Bush (2024) *Product-Led Growth*, 2nd Ed.; Elena Verna (2025) "PLG/PLS Framework"; OpenView (2025) "Product Benchmarks Report".

### 1.3 AI/ML Pricing — Per-Token, Per-Inference, Per-Outcome

- **Qué está pasando:** La explosión de AI/ML ha creado modelos de pricing completamente nuevos. OpenAI cobra por token (input/output), AWS SageMaker por inference endpoint-hour, Google Cloud por prediction request. El debate entre per-token vs. per-outcome (e.g., "por problema resuelto") es el más activo en pricing de 2024-2026.
- **Impacto en el skill:** Cuando el engagement incluye componentes de AI, S2 (Commercial Model Catalog) debe evaluar modelos de pricing específicos para AI: per-token, per-inference, per-model-hosted, per-outcome. S5 (Deal Canvas) necesita mecanismos de medición de consumo AI y caps para evitar bill shock.
- **Debate abierto:** Per-token penaliza prompts largos y chain-of-thought; per-outcome requiere definir "outcome" con precisión. El mercado está experimentando con "AI credits" (paquetes prepagados de capacidad mixta).
- **Fuentes:** a16z (2025) "The Economics of AI Applications"; Simon Willison (2025) "LLM Pricing Tracker"; Tomasz Tunguz (2025) "AI Business Model Patterns".

### 1.4 Outcome-Based Pricing in Consulting/SaaS

- **Qué está pasando:** La presión por demostrar ROI ha empujado a consultoras y SaaS vendors hacia modelos donde la compensación se vincula a resultados medibles. Accenture, Deloitte, y McKinsey ofrecen engagement models con "value at risk". En SaaS, vendors como Gainsight y 6sense ofrecen pricing tied to customer outcomes.
- **Impacto en el skill:** M3 (Outcome-Based/Earned Value) gana relevancia. S1 (Client Value Map) se vuelve el artefacto más crítico — sin value map riguroso, no hay base para outcome-based pricing. S4 debe definir mecanismos de medición robustos (quién mide, frecuencia, dispute resolution).
- **Estado 2026:** ~20% de engagements de consultoría tier-1 incluyen algún componente outcome-based. La barrera principal sigue siendo la medición: atribución del resultado al proveedor vs. factores externos.
- **Fuentes:** Vitasek, K. (2024) "Vested Way"; HBR (2024) "The Rise of Outcome-Based Contracts"; Bain & Company (2025) "Value-Based Pricing in Professional Services".

### 1.5 Marketplace and Ecosystem Revenue Models

- **Qué está pasando:** Los marketplaces B2B han crecido 35% YoY (2023-2025). AWS Marketplace, Azure Marketplace, y Google Cloud Marketplace permiten vender software a través de committed cloud spend del cliente (co-sell). Vertical marketplaces (fintech, healthtech, logistics) crean ecosistemas con revenue share models complejos.
- **Impacto en el skill:** S2 debe evaluar si la solución puede distribuirse via cloud marketplace (reduces procurement friction). M5 (Usage-Based) se extiende a marketplace take rates (5-30% típico). S5 (Deal Canvas) necesita considerar marketplace fees y revenue split.
- **Fuentes:** Bessemer (2025) "Cloud Marketplace Report"; Tackle.io (2025) "State of Cloud GTM"; Parker, G. (2024) "Platform Strategy" (actualización).

### 1.6 Embedded Finance and Fintech Partnerships

- **Qué está pasando:** La integración de servicios financieros (pagos, lending, insurance) dentro de productos no-financieros ha creado modelos comerciales híbridos. Stripe Treasury, Marqeta, Unit, y Rapyd permiten que cualquier empresa ofrezca servicios financieros embebidos. El revenue model cambia: de vender software a capturar un % del flujo financiero.
- **Impacto en el skill:** Cuando el engagement involucra fintech o pagos, S2 debe evaluar modelos de embedded finance: interchange fees, lending margins, insurance commissions, payment processing fees. S5 (Deal Canvas) necesita compliance financiera (PCI, PSD2, regulación bancaria local).
- **Estado 2026:** ~25% de las startups fintech en LATAM usan modelos de embedded finance. El mercado de BaaS (Banking-as-a-Service) en la región crece 40%+ YoY.
- **Fuentes:** a16z (2024) "Every Company Will Be a Fintech Company" (actualización); CB Insights (2025) "State of Fintech"; Rappi, Mercado Libre case studies.

---

## 2. Herramientas Emergentes (2024-2026)

| Herramienta | Propósito | Madurez | Relevancia para el skill |
|---|---|---|---|
| **Metronome** | Usage metering & billing | Creciendo | S5 — infrastructure para usage-based models |
| **Orb** | Usage-based billing platform | Creciendo | S5 — pricing engine para consumption models |
| **Stigg** | Pricing & packaging platform | Emergente | S4 — experimentation con pricing tiers |
| **Paddle** | Merchant of record + billing | Madura | S5 — simplifica compliance de pagos globales |
| **Lago** | Open-source usage billing | Creciendo | S5 — alternativa OSS para metering |
| **PriceIntelligently (Paddle)** | Pricing research & optimization | Madura | S3 — data-driven model fit analysis |
| **Chargebee** | Subscription management | Madura | S5 — gestión de modelos subscription/hybrid |
| **Maxio (SaaSOptics + Chargify)** | SaaS financial operations | Madura | S1 — unit economics y métricas SaaS |

---

## 3. Debates Abiertos

### 3.1 Flat-Rate vs. Usage-Based vs. Outcome-Based

El continuo de modelos de pricing está en tensión:
- **Flat-rate** (subscription per-seat): predictibilidad máxima, alineamiento mínimo con valor.
- **Usage-based**: alineamiento con consumo, revenue volátil.
- **Outcome-based**: alineamiento máximo con valor, complejidad de medición y atribución.

La mayoría del mercado converge en **híbridos**: base flat + variable por uso o resultado. La pregunta abierta es la proporción óptima (70/30? 50/50? depende del contexto).

### 3.2 AI Commoditization y Pricing Pressure

A medida que los modelos AI se comoditizan (open-source catch-up, multi-provider), los precios por token/inference bajan. Las empresas que construyen sobre AI enfrentan el "commodity trap": el valor se mueve de la infraestructura AI al workflow/outcome. El modelo comercial debe capturar valor en la capa de aplicación, no en la capa de modelo.

### 3.3 Regulatory Pressure on Pricing Transparency

La EU Digital Markets Act (DMA) y regulaciones similares en LATAM están forzando mayor transparencia en pricing, especialmente para plataformas y marketplaces. Los modelos comerciales deben anticipar requisitos de transparencia y fairness en pricing.

---

## 4. Implicaciones para el Skill

| Tendencia | Secciones Impactadas | Acción Recomendada |
|---|---|---|
| Usage-based pricing | S2, S4, S5 | Evaluar metering requirements en todo modelo hybrid |
| PLG | S2, S5 | Incluir tier design cuando engagement produce producto |
| AI/ML pricing | S2, S4, S5 | Nuevos modelos per-token/per-inference en catálogo |
| Outcome-based | S1, S3, S4 | Reforzar rigor de value map y mecanismos de medición |
| Marketplace models | S2, S5 | Evaluar cloud marketplace distribution |
| Embedded finance | S2, S5 | Compliance financiera como constraint en deal canvas |

---

**Autor:** Javier Montaño | **Última actualización:** 13 de marzo de 2026

# Use Case Prompts — Commercial Model

> Prompts listos para usar en los casos de uso mas frecuentes de esta skill.
> Cada prompt incluye contexto de cuando usarlo y parametros variables.

---

## 1. Full Commercial Model Design

**Cuando:** Engagement nuevo que requiere estructura comercial completa — discovery avanzado con cost drivers ya analizados.

```
Disenar modelo comercial completo para {PROYECTO} con {CLIENTE}.

Contexto:
- Industria: {INDUSTRIA}
- Tipo de engagement: {TIPO} (transformacion digital / modernizacion / nuevo producto / plataforma)
- Duracion estimada: {DURACION} (meses)
- Equipo estimado: {EQUIPO} (FTE-months magnitud)
- Relacion previa con cliente: {RELACION} (nueva / existente / renovacion)
- Cost drivers identificados: {COST_DRIVERS} (output de Phase 4)
- Restricciones regulatorias: {REGULACIONES} (si aplica)

Requisitos:
- S1: Client Value Map con minimo 4 fuentes de valor cuantificables (magnitudes)
- S2: Evaluacion de los 7 modelos del catalogo contra este contexto
- S3: Model Fit Analysis con scores ponderados
- S4: Modelo recomendado con estructura, KPIs, gates, governance
- S5: Deal Structure Canvas completo (fijo + variable + protecciones + IP)
- S6: Negotiation Preparation con objeciones anticipadas

Parametros:
- {MODO}: piloto-auto
- {FORMATO}: markdown
- {VARIANTE}: tecnica

Entregar A-03_Commercial_Model_{PROYECTO} con diagramas Mermaid de value flow y model fit.
IMPORTANTE: Zero precios, tarifas o margenes en el output — solo estructura y magnitudes.
```

---

## 2. SaaS Pricing Strategy

**Cuando:** El engagement produce un producto SaaS y se necesita disenar la estrategia de pricing y packaging.

```
Disenar estrategia de pricing para producto SaaS {PRODUCTO} de {CLIENTE}.

Contexto:
- Tipo de producto: {TIPO_PRODUCTO} (horizontal SaaS / vertical SaaS / API platform)
- Target market: {MERCADO} (SMB / mid-market / enterprise / multi-segment)
- Modelo actual (si existe): {MODELO_ACTUAL} (perpetual / per-seat / free / ninguno)
- Competidores principales: {COMPETIDORES}
- Metricas de valor del usuario: {VALUE_METRICS} (ej: usuarios, transacciones, storage, API calls)
- PLG potential: {PLG} (alto / medio / bajo — tiene self-serve adoption?)

Requisitos:
- Evaluacion de modelos: per-seat vs. usage-based vs. tiered vs. hybrid
- Tier design: free / starter / professional / enterprise (si aplica)
- Value metric identification: cual es la unidad que mejor correlaciona con valor percibido
- Packaging strategy: que features en cada tier
- Expansion revenue model: como crece el revenue por cliente (seats, usage, features)
- Anti-patrones a evitar: feature shock, hidden gem, undead product

Parametros:
- {MODO}: supervisado
- {FORMATO}: markdown
- {VARIANTE}: tecnica

Foco en S1 (value metrics) + S2 (M5: Usage-Based, M6: Licensing) + S5 (tier design como deal canvas).
NOTA: Producir estructura de tiers y logica de pricing — NO producir precios especificos.
```

---

## 3. Marketplace Model Design

**Cuando:** El engagement involucra un marketplace o plataforma multi-sided y se necesita disenar el modelo de revenue y monetizacion.

```
Disenar modelo comercial para marketplace {MARKETPLACE} de {CLIENTE}.

Contexto:
- Tipo de marketplace: {TIPO} (B2B / B2C / B2B2C / internal)
- Lados del mercado: {LADOS} (ej: vendedores + compradores / proveedores + consumidores)
- Network effects esperados: {NETWORK_EFFECTS} (directo / indirecto / ambos)
- GMV estimado (magnitud): {GMV_MAGNITUD} (bajo / medio / alto)
- Regulacion aplicable: {REGULACION} (ej: PSD2, regulacion de marketplaces, DMA)
- Chicken-and-egg strategy: {ESTRATEGIA} (cual lado subsidiar primero)

Requisitos:
- Evaluacion de modelos de monetizacion: take rate, subscription, featured listings, fintech/payments, data monetization
- Pricing por lado del mercado: quien paga, quien es subsidiado, en que proporcion
- Dynamics: como evoluciona el pricing con escala (take rate compression)
- Platform economics: unit economics del marketplace (ARPU, take rate, blended margin magnitudes)
- Embedded services: pagos, logistica, financing como revenue streams adicionales
- Competition moat: como el modelo comercial crea defensibilidad

Parametros:
- {MODO}: piloto-auto
- {FORMATO}: markdown
- {VARIANTE}: tecnica

Foco en S2 (M5: Usage-Based, platform models) + S4 (recommended structure) + S5 (multi-sided deal canvas).
```

---

## 4. Licensing Strategy for Technology IP

**Cuando:** El engagement produce IP (software, frameworks, algoritmos) y se necesita definir la estrategia de licensing y comercializacion.

```
Disenar estrategia de licensing para IP tecnologica de {PROYECTO}.

Contexto:
- Tipo de IP: {TIPO_IP} (software completo / framework / API / algoritmo / modelo AI)
- Ownership actual: {OWNERSHIP} (cliente / proveedor / compartida / indefinida)
- Potencial de reutilizacion: {REUSO} (unico para este cliente / reutilizable en verticales / horizontal)
- Competitive landscape: {COMPETENCIA} (hay alternativas OSS? competitors con producto similar?)
- Regulatory constraints: {REGULACION} (export controls, data sovereignty, sector-specific)

Requisitos:
- Evaluacion de modelos de licensing: perpetual, subscription, usage-based, open-core, dual license
- IP valuation framework: como determinar magnitud de valor de la IP (market approach, income approach, cost approach)
- Licensing terms: scope, territory, exclusivity, sublicensing, modifications
- Revenue model: one-time vs. recurring vs. hybrid
- Protection strategy: patents, trade secrets, copyright, contractual
- Deal structure for co-developed IP: cuando proveedor y cliente co-invierten

Parametros:
- {MODO}: supervisado
- {FORMATO}: markdown
- {VARIANTE}: tecnica

Foco en S2 (M6: Licensing/Producto) + S5 (IP section del Deal Canvas) + S6 (negotiation de IP terms).
```

---

## 5. Cost Driver Analysis for Commercial Structure

**Cuando:** Se necesita analizar los cost drivers del engagement para fundamentar la estructura comercial — input critico para el value map.

```
Analizar cost drivers para fundamentar modelo comercial de {PROYECTO}.

Contexto:
- Scope del engagement: {SCOPE} (resumen de lo que se va a construir/transformar)
- Equipo propuesto: {EQUIPO} (roles, seniority mix, duracion)
- Technology stack: {STACK}
- Infrastructure requirements: {INFRA} (cloud, on-prem, hybrid)
- Third-party costs: {TERCEROS} (licenses, SaaS tools, external services)
- Risk factors: {RIESGOS} (complexity, unknowns, dependencies)

Requisitos:
- Categorizar cost drivers: people, technology, infrastructure, third-party, overhead
- Identificar drivers fijos vs. variables
- Mapear cost drivers a las secciones del deal canvas (que cubre el componente fijo, que el variable)
- Sensitivity analysis: cuales cost drivers tienen mayor impacto si cambian (±20%)
- Optimization opportunities: donde se puede reducir costo sin reducir valor
- Connection to value map: como cada cost driver se conecta con fuentes de valor del cliente

Parametros:
- {MODO}: desatendido
- {FORMATO}: markdown
- {VARIANTE}: tecnica

Foco en S1 (value map informed by costs) + S5 (deal canvas cost allocation).
IMPORTANTE: Producir drivers y magnitudes — NUNCA precios, tarifas o margenes especificos.
```

---

## 6. Partner / Channel Model Design

**Cuando:** El engagement requiere un modelo de partnership o canal — co-delivery, reselling, referral, o white-label.

```
Disenar modelo de partnership/canal para {PROYECTO} con {PARTNER_TYPE}.

Contexto:
- Tipo de partnership: {TIPO} (co-delivery / reseller / referral / white-label / technology partner)
- Partner: {PARTNER} (nombre o tipo de organizacion)
- Value que aporta el partner: {VALUE_PARTNER} (domain expertise / distribution / technology / brand)
- Value que aportamos: {VALUE_NOSOTROS} (technology delivery / IP / methodology)
- Exclusividad: {EXCLUSIVIDAD} (exclusivo / preferido / non-exclusive)
- Duracion: {DURACION} (proyecto unico / multi-year / indefinido)

Requisitos:
- Evaluacion de modelos de partnership: revenue share, co-investment, referral fee, reseller margin, JV
- Revenue split structure: quien cobra al cliente, como se distribuye
- Responsibility matrix: quien entrega que, quien es accountable ante el cliente
- IP in partnership: como se maneja IP co-developed
- Exit terms: como termina el partnership, que pasa con clientes en vuelo
- Governance: como se toman decisiones, dispute resolution

Parametros:
- {MODO}: piloto-auto
- {FORMATO}: markdown
- {VARIANTE}: tecnica

Foco en S2 (M4: JV, M7: Hybrid con partner component) + S5 (partner deal canvas) + S6 (partner negotiation).
```

---

## 7. Migration from Perpetual to Subscription Model

**Cuando:** El cliente tiene un modelo de licensing perpetual y quiere migrar a subscription/SaaS — uno de los edge cases mas comunes y complejos.

```
Disenar estrategia de migracion de modelo perpetual a subscription para {PRODUCTO} de {CLIENTE}.

Contexto:
- Revenue actual perpetual: {MAGNITUD} (magnitud anual: bajo / medio / alto)
- Base instalada: {BASE} (numero de clientes / instancias)
- Maintenance/support revenue actual: {MAINTENANCE_MAGNITUD}
- Competitive pressure: {PRESION} (competitors ya migraron? clientes lo piden?)
- Customer segments: {SEGMENTOS} (enterprise / mid-market / SMB — mix)
- Technical readiness: {READINESS} (producto ya es cloud-native? requiere re-architecture?)

Requisitos:
- Migration strategy: big-bang vs. gradual vs. parallel (hybrid period)
- Pricing bridge: como suavizar el impacto para clientes existentes (grandfather clauses, migration credits)
- Revenue impact modeling: dip-and-recover curve (magnitudes, no cifras)
- Customer communication strategy: como explicar el cambio de modelo
- Churn risk analysis: que segmentos tienen mayor riesgo de churn durante migracion
- Success metrics: ARR growth rate, net revenue retention, churn rate targets
- Timeline: phases de migracion con gates

Parametros:
- {MODO}: paso-a-paso
- {FORMATO}: markdown
- {VARIANTE}: tecnica

Foco en S1 (value map pre vs. post migration) + S2 (M5/M6 evaluation) + S4 (phased migration model) + S5 (dual deal canvas: perpetual vs. subscription).
```

---

**Autor:** Javier Montaño | **Última actualización:** 13 de marzo de 2026

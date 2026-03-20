---
skill: sector-intelligence
title: Body of Knowledge — Sector Intelligence
version: 1.0
author: Javier Montaño
copyright: © Comunidad MetodologIA
updated: 2026-03-13
---

# Body of Knowledge: Sector Intelligence

## 1. Fundamentos Teóricos

La inteligencia sectorial como disciplina de análisis empresarial se asienta sobre el principio de que toda solución tecnológica opera dentro de un ecosistema de industria que determina qué problemas son relevantes, qué restricciones son no negociables, y qué métricas definen el éxito. Ignorar el contexto sectorial produce "soluciones técnicamente correctas e industrialmente inútiles" (Utterback, 1994).

La base teórica integra tres corrientes: (1) **economía industrial** (Porter, 1980), que analiza las fuerzas estructurales que determinan la rentabilidad y competitividad de un sector; (2) **teoría de recursos y capacidades** (Barney, 1991), que identifica las capacidades diferenciales que permiten a las empresas competir de forma sostenible dentro de su industria; y (3) **análisis institucional** (North, 1990), que examina cómo las reglas formales (regulación) e informales (normas de industria, prácticas estándar) restringen el espacio de soluciones posibles.

Para el contexto de discovery tecnológico y preventa, la inteligencia sectorial cumple una función específica: **convertir análisis genérico en insight accionable** mediante la inyección de conocimiento de dominio que transforma la percepción del cliente sobre la comprensión del problema que tiene el consultor.

## 2. Marcos Analíticos Clave

### Las Cinco Fuerzas de Porter (1980)
Analiza la dinámica competitiva de un sector a través de: rivalidad entre competidores existentes, amenaza de nuevos entrantes, amenaza de productos sustitutos, poder de negociación de proveedores, y poder de negociación de clientes. Para discovery: identifica qué presiones externas motivan la iniciativa del cliente y qué restricciones estructurales limitan las opciones de solución.

### Modelo PESTEL
Análisis del macro-entorno en seis dimensiones: Político, Económico, Social, Tecnológico, Ecológico y Legal. Esencial para identificar drivers de cambio sectoriales que el cliente puede subestimar. En banking: la dimensión Legal (regulación) frecuentemente determina más del diseño de arquitectura que los requisitos funcionales.

### Modelo de Madurez Digital por Industria (Gartner Industry Digital Maturity)
Evalúa el nivel de madurez digital de un sector en dimensiones como automatización, analytics, cloud adoption, y customer experience digital. Permite contextualizar el estado del cliente respecto a sus peers y articular la urgencia de la transformación con datos objetivos.

### Industry Clock Speed (Fine, 1998)
Diferentes industrias evolucionan a velocidades radicalmente distintas. La tecnología cambia rápido (meses), los bienes de consumo a ritmo medio (años), y la industria pesada lentamente (décadas). Esta velocidad determina las prioridades de diseño: en SaaS, la velocidad de entrega es crítica; en manufactura pesada, la confiabilidad y el ciclo de vida largo dominan.

### Análisis de Benchmarks Sectoriales (APQC Framework)
American Productivity & Quality Center publica benchmarks de proceso por industria. Complementados con informes de Gartner, IDC, McKinsey, BCG, e informes anuales de reguladores (Fed Reserve, EBA para banca; CMS para salud; NERC para energía). El benchmark convierte intuición en evidencia y "creemos que estamos rezagados" en "estamos en el percentil 25 de la industria en X".

### Marco SCQA (Situation-Complication-Question-Answer)
Estructura de comunicación consultiva proveniente de la metodología McKinsey (Minto, 1987). Aplicado a sector intelligence: el lente de industria define la "Situación" y la "Complicación" antes de que el cliente las articule, creando el efecto de comprensión profunda que diferencia al consultor del vendedor de tecnología.

## 3. Obras y Fuentes Seminales

| Fuente | Autor / Institución | Aporte Central |
|--------|---------------------|----------------|
| *Competitive Strategy* | Michael Porter | Marco de cinco fuerzas; análisis estructural de industrias |
| *The Innovator's Dilemma* | Clayton Christensen | Disrupción sectorial; por qué los líderes fallan ante nuevos entrantes |
| *Clockspeed* | Charles Fine | Velocidad de evolución por industria; implicaciones para diseño |
| *The Pyramid Principle* | Barbara Minto | Pensamiento estructurado SCQA; comunicación ejecutiva |
| Gartner Hype Cycle (anual) | Gartner Research | Madurez tecnológica por industria; expectativas vs realidad |
| *Bank 4.0* | Brett King | Transformación digital bancaria; Open Banking; Banking as a Service |
| *The Digital Hospital* | Edgerton & Khan | Transformación digital en salud; interoperabilidad; patient journey |
| Basel III/IV Framework | Bank for International Settlements | Regulación de capital y riesgo en banca |
| HIPAA Security Rule | U.S. DHHS | Privacidad y seguridad de datos clínicos |
| NERC CIP Standards | NERC | Ciberseguridad para infraestructura crítica energética |

## 4. Industrias Clave y sus Patrones de Análisis

### Banca y Seguros
El sector financiero opera bajo la tensión entre **velocidad de innovación** y **estabilidad regulatoria**. Los drivers principales son: presión de fintechs y neobancos, adopción de Open Banking (PSD2/3 en Europa, regulaciones equivalentes en LATAM), y cumplimiento de Basilea III/IV (capital, liquidez, leverage). Los patrones arquitectónicos dominantes son event sourcing (para audit trails inmutables) y CQRS (para alta concurrencia transaccional). Las métricas clave: delinquency rate, LTV, NIM (Net Interest Margin), cost-to-income ratio, regulatory capital ratios.

### Retail y Comercio
La supervivencia en retail está determinada por la capacidad de unificar la experiencia online-offline (omnichannel) y ejecutar personalización a escala. Los drivers: erosión de márgenes por marketplaces, expectativas de entrega mismo-día, y la transición hacia direct-to-consumer (D2C). Métricas: conversión, ticket promedio, inventory turnover, NPS, CLTV. Patrones técnicos: demand forecasting ML, microservicios para POS resiliente, CDPs (Customer Data Platforms).

### Salud y Healthcare
El sector salud está definido por la interoperabilidad (HL7 FHIR), la privacidad (HIPAA, regulaciones locales) y la trazabilidad clínica. Los drivers de transformación: escasez de personal clínico, presión por reducir readmisiones, y la adopción de telemedicina post-pandemia. Métricas: bed occupancy, readmission rate, time-to-care, patient satisfaction (HCAHPS). El riesgo de vendor lock-in en HIS/EMR es especialmente alto por la criticidad de los datos.

### Tecnología / SaaS
El sector SaaS opera bajo la dictadura del crecimiento eficiente (Rule of 40). Los drivers: saturación de mercados de nube pública, adopción de AI/ML como diferenciador, y transición de seat-based a usage-based pricing. Métricas: MRR/ARR, CAC, LTV, churn rate, NRR (Net Revenue Retention), deployment frequency (DORA). Patrón dominante: Product-Led Growth (PLG) donde el producto es el canal de ventas.

### Manufactura
La manufactura está en transición hacia Industria 4.0: IoT industrial (IIoT), gemelos digitales, y mantenimiento predictivo. Los drivers: presión de supply chain post-COVID, nearshoring, y regulaciones de sustentabilidad (ESG). Métricas: OEE (Overall Equipment Effectiveness), MTBF, MTTR, on-time delivery, defect rate. El sistema SCADA y los PLC son infraestructura legacy con ciclos de vida de 15-25 años que restringen la velocidad de modernización.

## 5. Metodología de Análisis Sectorial para Discovery

**Protocolo de lente sectorial en 5 pasos:**

1. **Identificación de industria:** Clasificar por SIC/NAICS o descripción del cliente. Detectar sub-industrias relevantes (ej: banca de inversión vs. banca retail tienen perfiles radicalmente distintos).
2. **Context Brief sectorial:** Síntesis de 2-3 párrafos con los drivers actuales del sector, presiones competitivas y estado de transformación digital en el segmento del cliente.
3. **Risk Overlay:** 3-5 riesgos específicos de la industria que la solución técnica propuesta debe contemplar. No riesgos genéricos de proyecto — riesgos que solo son visibles con conocimiento sectorial.
4. **Benchmarks:** 2-3 métricas con rangos típicos del sector para contextualizar el estado del cliente. Fuente: informes de analistas (Gartner, IDC, Forrester), reguladores, asociaciones de industria.
5. **Flags regulatorios:** Restricciones normativas que impactan decisiones de arquitectura, datos, o procesos. En sectores no regulados: incluir baseline de privacidad de datos.

## 6. Herramientas y Fuentes de Datos Sectoriales

| Fuente | Contenido | Sectores |
|--------|-----------|---------|
| Gartner Research | Hype cycles, Magic Quadrants, benchmarks | Todos |
| IDC Industry Reports | Market share, adoption trends | Todos |
| McKinsey Global Institute | Macro-trends, sector transformations | Todos |
| APQC Process Benchmarks | Process efficiency benchmarks | Manufactura, finanzas, salud |
| EBA / BIS | Regulación y benchmarks bancarios | Banca |
| CMS / OPS | Métricas del sistema de salud | Salud |
| NERC / FERC | Confiabilidad eléctrica | Energía |
| NRF / Euromonitor | Trends en retail | Retail |
| Statista | Datos de mercado cuantificados | Todos |

## 7. Composite Lens y Casos Multi-Industria

Cuando un cliente opera en múltiples industrias (ej: aseguradora con brazo de inversión y división de salud), se requiere un **composite lens**: aplicar los marcos de cada industria por separado, identificar zonas de conflicto regulatorio (ej: HIPAA vs. GDPR en datos transfronterizos), y documentar dónde las recomendaciones divergen para diferentes partes del negocio.

**Regla de lente dominante:** Si el cliente tiene ingresos 70%+ en una industria, usar ese lente como primario y los demás como secundarios. Si la distribución es más balanceada, declarar el composite formalmente y alertar al cliente de los trade-offs.

## 8. Referencias Cruzadas con Otras Skills del Framework

| Skill | Tipo de Dependencia |
|-------|-------------------|
| **stakeholder-mapping** | El lente sectorial determina qué stakeholders son críticos (ej: compliance officer en banca, médico jefe en salud) |
| **asis-analysis** | El context brief sectorial es el encabezado contextual del AS-IS; los benchmarks califican los hallazgos |
| **scenario-analysis** | Cada escenario de solución debe evaluarse contra restricciones y patrones del sector |
| **risk-controlling-dynamics** | El risk overlay sectorial alimenta directamente el risk register del proyecto |
| **roadmap-poc** | Los benchmarks sectoriales establecen los criterios de éxito del piloto |
| **pitch-ejecutivo** | El competitive landscape sectorial es el argumento de urgencia en el pitch |
| **discovery-conductor** | El conductor invoca sector-intelligence para inyectar contexto en cualquier fase del pipeline |

---
*© Comunidad MetodologIA. Autor: Javier Montaño. Uso interno y para clientes MetodologIA.*

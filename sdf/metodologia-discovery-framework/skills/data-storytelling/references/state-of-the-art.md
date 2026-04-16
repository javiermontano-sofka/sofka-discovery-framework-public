# Data Storytelling — State of the Art

> Estado actual de la disciplina, tendencias emergentes y posición del skill dentro del MetodologIA Discovery Framework.

---

## 1. Estado Actual de la Disciplina (2024-2026)

### 1.1 Evolución del Campo

Data storytelling ha transitado de ser una habilidad opcional de analistas a un **requisito transversal** en consultoría tecnológica:

| Era | Enfoque | Herramienta típica |
|-----|---------|-------------------|
| 2010-2015 | Dashboards estáticos | Excel, Tableau |
| 2015-2020 | Dashboards interactivos | Power BI, Looker |
| 2020-2023 | Narrativa automatizada (NLG) | Narrative Science, Automated Insights |
| 2023-2026 | **Narrativa contextual con LLMs** | GPT-4, Claude, agentes especializados |

### 1.2 Tendencia Dominante: De Visualización a Interpretación

El mercado ha saturado la capa de visualización. La diferenciación está ahora en la **capa de interpretación**: no qué muestra el dashboard, sino qué significa y qué hacer al respecto.

Esto es exactamente el espacio que ocupa este skill en el framework de discovery.

### 1.3 Narrativa Generada por IA

Los LLMs han democratizado la generación de texto a partir de datos. El riesgo es la **narrativa genérica**. El diferenciador de MetodologIA es:

- Narrativas ancladas en **evidencia etiquetada** (no opinión)
- Comparaciones contra **benchmarks específicos del sector**
- Magnitudes en **FTE-meses** (no valores monetarios abstractos)
- Consecuencias vinculadas a **acciones concretas del roadmap**

## 2. Best Practices Actuales

### 2.1 Principios Consolidados

1. **Context-Comparison-Consequence (3C)**: Cada dato necesita los tres. Estándar de facto en consultoría de datos desde 2022.
2. **Layered Storytelling**: Narrativa ejecutiva (TL;DR) → Narrativa técnica (detalle) → Datos raw (apéndice). Adoptado por McKinsey Digital, Thoughtworks.
3. **Evidence-Based Narrative**: Toda afirmación con fuente rastreable. Originado en consultoría estratégica, ahora estándar en tech advisory.
4. **Actionable Insights Only**: Si un insight no tiene acción derivada, no es un insight — es una observación. Principio de Dykes (2020).

### 2.2 Frameworks de Referencia Vigentes

| Framework | Uso | Relevancia |
|-----------|-----|-----------|
| **DORA Metrics** | Benchmark de ingeniería de software | Alta — base para comparaciones DevOps |
| **Accelerate** | Modelo de rendimiento de delivery | Alta — base teórica para métricas de equipos |
| **SRE Golden Signals** | Salud operacional | Media — complementa métricas de disponibilidad |
| **SPACE Framework** | Productividad de desarrolladores | Emergente — alternativa a métricas simplistas |
| **ISO 25010** | Calidad de producto software | Estable — modelo de referencia para scoring |

### 2.3 Anti-patterns Documentados

- **Vanity Metrics**: Métricas que lucen bien pero no informan decisiones (ej: "lines of code")
- **Survivorship Bias**: Reportar solo proyectos exitosos en benchmarks
- **Simpson's Paradox**: Tendencias que se invierten al segmentar datos
- **Precision Fallacy**: "99.73% uptime" cuando la medición tiene ±0.5% de error

## 3. Posición del Skill en el Framework

### 3.1 Mapa de Responsabilidades

| Aspecto | Owner | data-storytelling contribuye |
|---------|-------|----------------------------|
| Interpretación de métricas | **data-storytelling** (owner) | --- |
| Narrativa de scoring matrices | **data-storytelling** (owner) | --- |
| Arco narrativo del documento | storytelling | Con datos interpretados |
| Visualización de datos | data-viz-storytelling | Con insights extraídos |
| Redacción final | copywriting / technical-writing | Con narrativa de datos |
| Formato y marca | output-engineering / design-system | Con contenido listo |

### 3.2 Integración con Entregables

| Entregable | Uso de data-storytelling |
|-----------|------------------------|
| 02 Brief Técnico | Métricas headline con contexto ejecutivo |
| 03 AS-IS Analysis | Scoring matrices narradas, métricas de cobertura interpretadas |
| 05 Escenarios ToT | Scoring 6D con narrativa cross-dimensional |
| 06 Solution Roadmap | FTE-meses tangibilizados, proyecciones before/after |
| 08 Pitch Ejecutivo | Magnitudes comunicadas para C-level |
| 10 Findings Deck | Dashboard narrative sequences |
| 11 Hallazgos Técnicos | Métricas DORA/SRE interpretadas |

### 3.3 Agentes que Más lo Utilizan

| Agente | Contexto de uso |
|--------|----------------|
| content-strategist | Narrativa de datos en entregables |
| editorial-director | Validación de narrativas cuantitativas |
| technical-architect | Interpretación de métricas de arquitectura |
| quality-engineer | Narrativa de testing y cobertura |
| business-analyst | Métricas de proceso y negocio |
| risk-controller | Cuantificación de riesgos |

## 4. Tendencias Emergentes (2025-2027)

### 4.1 Narrativa Adaptativa por Audiencia

Generación automática de múltiples capas narrativas del mismo dato según audiencia:
- **C-level**: "El equipo de plataforma necesita 40 FTE-meses para modernizar el core"
- **Tech lead**: "40 FTE-meses = 8 personas × 5 meses, concentrados en decomposición del monolito de autenticación y migración de la capa de datos"
- **Developer**: "Fase 1: Strangler Fig pattern en auth-service (Sprint 1-6), Fase 2: Event sourcing en data layer (Sprint 7-12)"

### 4.2 Insight Chains

Encadenamiento de insights donde cada uno alimenta al siguiente:
```
Observación → Patrón → Anomalía → Causa raíz → Impacto → Acción → Métrica de éxito
```

### 4.3 Contra-narrativa Explícita

Presentar la interpretación alternativa junto a la principal:
- "La interpretación principal es X [CÓDIGO], pero una lectura alternativa sería Y [INFERENCIA], lo cual cambiaría la recomendación a Z."

### 4.4 Data Storytelling Colaborativo

Integración de múltiples fuentes de evidencia (código, stakeholders, documentos) en narrativas que explicitan el peso de cada fuente.

## 5. Gaps y Oportunidades de Mejora

| Gap | Oportunidad |
|-----|------------|
| Benchmarks sectoriales limitados para LATAM | Construir base de comparación interna MetodologIA por vertical |
| Narrativa estática en documentos | Explorar narrativas interactivas en HTML con tooltips |
| Métricas de impacto post-discovery | Definir framework de seguimiento de predicciones |
| Calibración de [INFERENCIA] vs. [SUPUESTO] | Establecer criterios más granulares de confianza |

## 6. Referencias Clave

- Dykes, B. (2020). *Effective Data Storytelling*. Wiley.
- Knaflic, C.N. (2015). *Storytelling with Data*. Wiley.
- DORA Team (2024). *State of DevOps Report*. Google Cloud.
- Forsgren, N., Humble, J., Kim, G. (2018). *Accelerate*. IT Revolution.
- Murphy, N., Beyer, B. et al. (2016). *Site Reliability Engineering*. O'Reilly.
- Forsyth, D. (2024). *SPACE Framework for Developer Productivity*. Microsoft Research.

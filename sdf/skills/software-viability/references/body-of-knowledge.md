# Body of Knowledge — Software Viability: Substance vs Smoke

> Fuentes académicas, industriales y prácticas que fundamentan la validación forense de viabilidad de software y tecnologías propuestas.

---

## 1. Frameworks de Evaluación Tecnológica

### Gartner Hype Cycle
- **Relevancia:** Framework fundamental para posicionar tecnologías en su ciclo de adopción. Determina si una tecnología está en el "Peak of Inflated Expectations" (alto riesgo de humo) o en el "Plateau of Productivity" (substancia comprobada).
- **Uso en el skill:** S2 (Software Maturity) usa la posición en el Hype Cycle como uno de los indicadores de madurez. Una tecnología en el "Trough of Disillusionment" requiere validación adicional pero puede ser oportunidad.
- **Fuente:** Fenn, J. & Raskino, M. (2008). *Mastering the Hype Cycle*. Harvard Business Review Press.
- **Actualización:** Gartner (2025). *Hype Cycle for Emerging Technologies*.

### ThoughtWorks Technology Radar
- **Relevancia:** Evaluación semestral de tecnologías, herramientas, plataformas y técnicas clasificadas en Adopt/Trial/Assess/Hold por practitioners experimentados.
- **Uso en el skill:** S1 (Technology Inventory) mapea cada tecnología propuesta contra la clasificación del Radar. "Hold" es señal de 🟠 RIESGO; "Adopt" respalda 🟢 SUBSTANCIA. La metodología de evaluación por practitioners (no analistas) le da credibilidad técnica.
- **Fuente:** ThoughtWorks (2025). *Technology Radar Vol. 31*. thoughtworks.com/radar
- **Complemento:** Cada blip incluye rationale documentado — útil para argumentar veredictos.

### Wardley Maps para Evaluación Tecnológica
- **Relevancia:** Framework de mapeo estratégico que posiciona componentes tecnológicos según su evolución (Genesis → Custom → Product → Commodity) y su posición en la cadena de valor.
- **Uso en el skill:** S4 (Vendor Risk) usa Wardley Maps para evaluar si una tecnología propuesta está en la fase correcta de evolución para el contexto del proyecto. Elegir custom-built donde hay commodity disponible es 🟠; elegir commodity donde se necesita diferenciación es igualmente riesgoso.
- **Fuente:** Wardley, S. (2016). *Wardley Maps: Topographical Intelligence in Business*. Medium/LearnWardleyMapping.com
- **Extensión:** Wardley, S. (2020). "On Being Lost" — aplicaciones prácticas del mapeo estratégico.

---

## 2. Estándares de Ingeniería de Software

### IEEE 12207:2017 — Systems and Software Engineering: Software Life Cycle Processes
- **Relevancia:** Define procesos estándar del ciclo de vida del software. El skill evalúa qué procesos tiene la tecnología propuesta (desarrollo, mantenimiento, quality assurance, gestión de configuración) y cuáles faltan.
- **Uso en el skill:** S2 (Software Maturity) verifica la presencia de procesos maduros: release management, deprecation policy, backward compatibility, migration guides.
- **Fuente:** IEEE/ISO/IEC 12207:2017, "Systems and software engineering — Software life cycle processes".

### IEEE 1471-2000 / ISO/IEC 42010:2011 — Architecture Description
- **Relevancia:** Estándar para describir arquitecturas de software. Proporciona vocabulario y estructura para evaluar si la documentación arquitectónica de una tecnología/vendor es adecuada.
- **Uso en el skill:** S4 (Vendor Risk) evalúa si el vendor proporciona documentación arquitectónica conforme a este estándar. La ausencia de documentación arquitectónica clara es señal de inmadurez.
- **Fuente:** ISO/IEC 42010:2011, "Systems and software engineering — Architecture description".

### ISO/IEC 25010:2011 — Software Quality Model
- **Relevancia:** Define 8 características de calidad que fundamentan la evaluación de madurez de software: functional suitability, performance efficiency, compatibility, usability, reliability, security, maintainability, portability.
- **Uso en el skill:** S2 (Software Maturity) evalúa la tecnología propuesta contra las dimensiones de calidad relevantes para el contexto del proyecto.
- **Fuente:** ISO/IEC 25010:2011, "Systems and software engineering — SQuaRE".

---

## 3. Due Diligence Tecnológica

### Technology Due Diligence Frameworks
- **Relevancia:** Frameworks de evaluación técnica utilizados en contextos de M&A, inversión y selección de vendors. Proporcionan estructura para evaluar viabilidad técnica más allá del marketing.
- **Uso en el skill:** S4 (Vendor Viability) adapta las dimensiones de due diligence: IP quality, scalability evidence, team capability, technical debt level, architecture sustainability.
- **Fuentes:**
  - Carucci, R. (2023). "Technical Due Diligence: A Practitioner's Guide". *IEEE Software*, 40(2).
  - Gottesman, B. & Szygenda, S. (2020). *Technology Due Diligence: Best Practices for Chief Information Officers*. CRC Press.

### Open Source Health Metrics (CHAOSS)
- **Relevancia:** Framework de métricas para evaluar la salud de proyectos open-source. Define indicadores cuantitativos para community health, contributor diversity, responsiveness.
- **Uso en el skill:** S2b (Community Health) implementa un subconjunto de métricas CHAOSS: contributor count, commit frequency, issue response time, bus factor, organizational diversity.
- **Fuente:** CHAOSS Project (2025). *CHAOSS Metrics*. chaoss.community
- **Métricas clave:** Elephant Factor (concentración de contribuciones), Change Request Closure Ratio, New Contributor Closing Issues.

### Software Supply Chain Security (SLSA Framework)
- **Relevancia:** Framework de madurez para seguridad de la cadena de suministro de software. Evalúa si las dependencias de una tecnología tienen provenance, integridad, y trazabilidad.
- **Uso en el skill:** S4b (Dependency Chain Analysis) usa SLSA levels para evaluar el riesgo de la cadena de dependencias: L0 (sin garantías), L1 (documentado), L2 (hosting seguro), L3 (verificación end-to-end).
- **Fuente:** Google/OpenSSF (2024). *SLSA Framework v1.0*. slsa.dev

---

## 4. Evaluación de IA/ML

### Model Cards (Mitchell et al., 2019)
- **Relevancia:** Framework para documentación transparente de modelos de ML. Define qué información debe estar disponible sobre un modelo: intended use, metrics, training data, ethical considerations, limitations.
- **Uso en el skill:** S3 (AI/ML Validation) verifica si el vendor/proyecto proporciona Model Cards o documentación equivalente. La ausencia es señal de 🟠 — "if they can't document it, they probably don't understand it."
- **Fuente:** Mitchell, M. et al. (2019). "Model Cards for Model Reporting". *Proceedings of FAccT '19*.

### AI/ML Maturity Models
- **Relevancia:** Frameworks para evaluar la madurez de implementaciones de IA/ML en producción.
- **Uso en el skill:** S3b (AI Maturity Indicators) mapea cada componente IA/ML contra indicadores de madurez: training data documentation, evaluation framework, drift monitoring, explainability, cost per inference.
- **Fuentes:**
  - Google (2024). "MLOps: Continuous delivery and automation pipelines in machine learning". cloud.google.com/architecture
  - Amershi, S. et al. (2019). "Software Engineering for Machine Learning: A Case Study". *ICSE-SEIP '19*.

### EU AI Act — Risk Classification
- **Relevancia:** Regulación europea que clasifica sistemas de IA según riesgo (unacceptable, high-risk, limited, minimal). Impacta evaluación de viabilidad de componentes IA/ML.
- **Uso en el skill:** S3 (AI/ML Validation) incluye evaluación de riesgo regulatorio. Un sistema clasificado como "high-risk" sin framework de compliance es 🟠 automático.
- **Fuente:** European Parliament (2024). *Regulation (EU) 2024/1689 — Artificial Intelligence Act*.

---

## 5. Sostenibilidad Open-Source

### Nadia Eghbal — Working in Public
- **Relevancia:** Análisis fundacional de la economía y sostenibilidad del software open-source. Define modelos de mantenimiento (federations, clubs, stadiums, toys) que predicen sostenibilidad.
- **Uso en el skill:** S2b (Community Health) usa la taxonomía de Eghbal para clasificar el modelo de sostenibilidad del proyecto OSS evaluado. Un proyecto "toy" con adoption enterprise es 🔴 HUMO.
- **Fuente:** Eghbal, N. (2020). *Working in Public: The Making and Maintenance of Open Source Software*. Stripe Press.

### Open Source Sustainability Indicators
- **Relevancia:** Indicadores prácticos de sostenibilidad: funding sources, corporate sponsorship, governance model, succession planning.
- **Uso en el skill:** Complementa CHAOSS con indicadores financieros y de governance. Un proyecto sin funding visible y con bus factor = 1 es 🟠 mínimo.
- **Fuentes:**
  - Goggins, S. & Lumbard, K. (2021). "Measuring Open Source Software Community Health". *IEEE Software*.
  - Linux Foundation (2024). "Census of Open Source Software". linuxfoundation.org

---

## 6. Bibliografía Práctica

| Categoría | Libro/Recurso | Autor | Relevancia |
|---|---|---|---|
| Fundacional | *Crossing the Chasm* | Geoffrey Moore (2014, 3rd Ed) | Modelo de adopción tecnológica: early adopters vs mainstream |
| Fundacional | *The Innovator's Dilemma* | Clayton Christensen (1997) | Disruption patterns que afectan viabilidad de vendors establecidos |
| IA/ML | *Designing Machine Learning Systems* | Chip Huyen (2022) | Production ML systems: lo que realmente funciona vs promesas |
| IA/ML | *AI Engineering* | Chip Huyen (2025) | Ingeniería de sistemas IA en producción, LLM patterns |
| Vendor | *The Cathedral and the Bazaar* | Eric Raymond (1999) | Modelos de desarrollo OSS, señales de proyecto saludable |
| Práctico | *Technology Strategy Patterns* | Eben Hewitt (2018) | Frameworks de decisión tecnológica estratégica |
| Riesgo | *Waltzing with Bears* | DeMarco & Lister (2003) | Gestión de riesgos en proyectos de software |

---

## 7. Glosario de Términos

| Término | Definición |
|---|---|
| **Bus Factor** | Número mínimo de personas cuya salida pondría en riesgo el proyecto |
| **Vendor Lock-in** | Dependencia de un proveedor que hace costoso o inviable migrar a otro |
| **Vaporware** | Software anunciado pero no entregado o sin evidencia de producción real |
| **Hype Cycle** | Modelo de Gartner que representa las fases de expectativas sobre una tecnología |
| **SBOM** | Software Bill of Materials — inventario de componentes y dependencias |
| **Model Card** | Documentación estandarizada de un modelo de ML (uso, métricas, limitaciones) |
| **SLSA** | Supply-chain Levels for Software Artifacts — framework de seguridad de supply chain |
| **CHAOSS** | Community Health Analytics in Open Source Software — proyecto de métricas OSS |
| **Elephant Factor** | Porcentaje de contribuciones concentradas en una sola organización |
| **Technology Radar** | Evaluación semestral de ThoughtWorks de tecnologías (Adopt/Trial/Assess/Hold) |
| **Wardley Map** | Diagrama que posiciona componentes por evolución y cadena de valor |
| **Drift Monitoring** | Monitoreo de degradación del rendimiento de modelos ML en producción |

---

**Autor:** Javier Montaño | **Última actualización:** 13 de marzo de 2026
**© Comunidad MetodologIA — Todos los derechos reservados**

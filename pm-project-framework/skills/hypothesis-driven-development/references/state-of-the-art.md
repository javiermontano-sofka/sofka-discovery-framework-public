# State of the Art — Hypothesis-Driven Development (2024-2026)

> Tendencias, herramientas emergentes y debates abiertos en el dominio de desarrollo dirigido por hipotesis, experimentacion sistematica, y decision gates basados en evidencia.

---

## 1. Tendencias Dominantes

### 1.1 HDD en Enterprise (No Solo Startups)
- **Que esta pasando:** Hypothesis-Driven Development ya no es exclusivo de startups. Empresas Fortune 500 estan adoptando ciclos BML formalizados en sus procesos de discovery y delivery. Microsoft, Amazon, y Booking.com reportan miles de experimentos concurrentes como practica estandar.
- **Impacto en el skill:** El skill se posiciona para contextos enterprise donde las hipotesis deben navegar governance, compliance, y multiples stakeholders. La estructura formal (belief + metric + experiment + threshold + decision) facilita la aprobacion en steering committees.
- **Riesgo:** En enterprise, el "teatro de hipotesis" es comun — se escribe la hipotesis pero la decision ya esta tomada. El skill combate esto con el detector de sesgo de costo hundido.
- **Estado 2026:** Adoption media-alta en empresas tech-forward. Baja en industrias tradicionales (pero creciendo por presion competitiva).
- **Fuentes:** Microsoft (2025) "Experimentation at Scale"; Booking.com (2024) "1000 Experiments per Day"; Gartner (2025) "Hypothesis-Driven Transformation"

### 1.2 Continuous Discovery Habits (Teresa Torres)
- **Que esta pasando:** Teresa Torres ha popularizado un framework de discovery continuo donde los equipos de producto realizan al menos un experimento por semana. La herramienta central es el Opportunity Solution Tree (OST) que conecta outcomes con opportunities, solutions, y experiments.
- **Impacto en el skill:** El OST complementa el portfolio de hipotesis del skill. Cada oportunidad identificada en el OST genera una o mas hipotesis con estructura completa. La cadencia semanal de experimentacion es el ritmo ideal para ciclos BML.
- **Estado 2026:** Adoption alta en equipos de producto. Adoption media en equipos de arquitectura (donde la cadencia de experimentacion es mas lenta).
- **Fuente:** Torres, T. (2021). *Continuous Discovery Habits: Discover Products That Create Customer Value and Business Value*. Product Talk.

### 1.3 Opportunity Solution Trees
- **Que esta pasando:** Los OSTs estan reemplazando a los roadmaps tradicionales como herramienta de planificacion en equipos product-led. En lugar de "features para Q2", el equipo tiene "oportunidades a explorar con experimentos".
- **Impacto en el skill:** El skill puede generar un OST como output complementario que visualiza la relacion entre el escenario recomendado (scenario-analysis), las oportunidades detectadas, las hipotesis formuladas, y los experimentos diseñados.
- **Herramientas:** Productboard, Miro (OST template), FigJam, custom Mermaid diagrams.
- **Estado 2026:** Adoption alta en product teams, emergente en architecture teams.
- **Fuentes:** Torres, T. (2021). *Continuous Discovery Habits*; ProductTalk Blog (2025) "OST for Technical Discovery"

### 1.4 Product-Led Growth como HDD a Escala
- **Que esta pasando:** Product-Led Growth (PLG) es esencialmente HDD aplicado a la estrategia de crecimiento completa. Cada feature es una hipotesis de activacion, retencion, o monetizacion. Las decisiones se toman con datos de uso real, no con opiniones de comites.
- **Impacto en el skill:** Para clients con ambicion PLG, las hipotesis del skill deben incluir growth hypotheses (no solo value y architecture). El portfolio de hipotesis se expande a 3 tipos: value, growth, architecture.
- **Estado 2026:** PLG es estandar en SaaS B2B. Emergente en industries tradicionales que digitalizan.
- **Fuentes:** Reeves, B. & Chin, E. (2022). *Product-Led Growth*; OpenView Partners (2025) "PLG Benchmark Report"

### 1.5 Evidence-Based Management (Scrum.org)
- **Que esta pasando:** Scrum.org formalizo Evidence-Based Management (EBM) con 4 Key Value Areas: Current Value, Unrealized Value, Ability to Innovate, Time-to-Market. EBM proporciona metricas organizacionales que complementan las metricas de hipotesis individuales.
- **Impacto en el skill:** Las 4 KVAs de EBM pueden servir como marco para clasificar hipotesis: "Esta hipotesis mejora Current Value o Unrealized Value? Ability to Innovate o Time-to-Market?"
- **Estado 2026:** Adoption media. Popular en organizaciones Scrum-centric.
- **Fuente:** Scrum.org (2024). *Evidence-Based Management Guide*.

### 1.6 AI-Assisted Hypothesis Generation
- **Que esta pasando:** Los LLMs estan acelerando la generacion y evaluacion de hipotesis. Un LLM puede analizar un AS-IS, identificar gaps, y proponer hipotesis estructuradas con metricas y thresholds sugeridos. Tambien puede detectar sesgos en hipotesis existentes.
- **Impacto en el skill:** El skill puede usar AI para: (1) generar hipotesis candidatas desde el escenario recomendado, (2) sugerir metricas y thresholds basados en benchmarks de industria, (3) detectar sesgos (sunk cost, confirmation bias) en el portfolio existente.
- **Riesgo:** Hipotesis generadas por AI pueden ser plausibles pero desconectadas del contexto especifico del cliente. Validacion humana es mandatoria.
- **Estado 2026:** Uso creciente en equipos que ya usan LLMs para development. La generacion es rapida; la curaduria humana sigue siendo el cuello de botella.
- **Fuentes:** McKinsey (2025) "AI-Augmented Product Discovery"; Thoughtworks (2025) "LLMs for Hypothesis Generation"

### 1.7 Fitness Functions como Hipotesis Arquitectonicas
- **Que esta pasando:** El concepto de fitness functions de Ford, Parsons y Kua (Building Evolutionary Architectures) se esta integrando con HDD. Cada atributo de calidad de la arquitectura se modela como una hipotesis con un test automatizado (la fitness function) que valida continuamente.
- **Impacto en el skill:** Las hipotesis de tipo "architecture" se implementan como fitness functions en CI/CD. El threshold de la hipotesis es el umbral de la fitness function. La decision se automatiza: si la fitness function falla, la hipotesis se invalida automaticamente.
- **Estado 2026:** Adoption media en organizaciones con CI/CD maduro. Baja en organizaciones sin pipelines automatizados.
- **Fuentes:** Ford, N. et al. (2023). *Building Evolutionary Architectures*, 2nd Ed.; ThoughtWorks Technology Radar (2025) "Fitness Functions — Adopt"

---

## 2. Herramientas Emergentes (2024-2026)

### 2.1 Experiment Tracking & Management

| Herramienta | Proposito | Madurez | Relevancia para HDD |
|---|---|---|---|
| **LaunchDarkly** | Feature flags + experimentation | Madura | A/B tests, progressive rollouts, kill switches |
| **Split.io** | Feature delivery + experiment analysis | Madura | Statistical rigor en A/B tests |
| **Eppo** | Experiment analysis platform | Creciente | Warehouse-native experiment analysis |
| **Statsig** | Feature gates + experiments | Creciente | Bayesian analysis, auto-shutdown |
| **GrowthBook** | Open-source A/B testing | Estable | Self-hosted, Bayesian + frequentist |

### 2.2 Product Discovery

| Herramienta | Proposito | Relevancia para HDD |
|---|---|---|
| **Productboard** | Product management + OST | Opportunity tracking, hypothesis boards |
| **Dovetail** | User research repository | Evidence repository para hipotesis cualitativas |
| **Maze** | Rapid user testing | Validacion rapida de hipotesis de UX |
| **UserTesting** | Remote user testing | Validacion de value hypotheses con usuarios reales |

### 2.3 AI-Augmented Discovery

| Herramienta | Proposito | Relevancia |
|---|---|---|
| **Claude Projects** | Long-context analysis | Generar hipotesis desde AS-IS completo |
| **Gemini Deep Research** | Multi-source analysis | Benchmarks para thresholds |
| **Perplexity Pro** | Research + citations | Industry benchmarks para metricas |
| **NotebookLM** | Source-grounded analysis | Analisis de hipotesis sobre documentacion existente |

---

## 3. Debates Abiertos en la Industria

### 3.1 Cuanto rigor cientifico es necesario en HDD?

**El debate:**
- **Pro-rigor (posicion academica):** Las hipotesis deben tener significancia estadistica, tamano de muestra calculado, y p-values < 0.05. Sin esto, las decisiones son tan subjetivas como antes.
- **Pro-pragmatismo (posicion startup):** La velocidad de aprendizaje importa mas que la precision estadistica. Un experimento de 1 semana con 100 usuarios es mejor que uno de 3 meses con 10,000.
- **Posicion del skill:** Rigor proporcional a la magnitud de la decision. Hipotesis de bajo impacto: validacion cualitativa basta. Hipotesis de alto impacto (>$500K inversion): rigor estadistico mandatorio.

### 3.2 Kill decisions: Evidencia vs politica organizacional?

- **Realidad:** En enterprise, matar una hipotesis que ya tiene presupuesto aprobado y sponsor ejecutivo es politicamente dificil. La falacia del costo hundido opera a nivel organizacional, no solo individual.
- **Respuesta del skill:** Los decision gates se disenan para ser presentados en steering committee con evidencia clara. El formato "Threshold was X, result was Y, therefore kill" reduce el espacio para politica.
- **Contraargumento:** "Los datos no mandan solos." Un sponsor puede argumentar que el threshold estaba mal definido. El skill mitiga esto requiriendo que los thresholds se definan ANTES del experimento.

### 3.3 Hipotesis de arquitectura vs hipotesis de producto?

- **Tension:** Los equipos de producto son buenos generando y validando hipotesis de valor (value hypotheses). Los equipos de arquitectura son menos habiles — tienden a tratar las decisiones de arquitectura como hechos, no hipotesis.
- **Posicion del skill:** Las hipotesis de arquitectura son tan importantes como las de producto. "Creemos que una arquitectura de microservicios reducira el time-to-deploy de 2 semanas a 2 dias" es una hipotesis tan testeable como "Creemos que los usuarios completaran el onboarding en <3 minutos."

### 3.4 Velocidad de experimentacion vs profundidad de aprendizaje?

- **Pro-velocidad:** "Run more experiments faster. Volume of experiments correlates with innovation output." (Booking.com philosophy)
- **Pro-profundidad:** "Fewer, deeper experiments that answer fundamental questions." (Basecamp philosophy)
- **Posicion del skill:** Depende del dominio Cynefin. Complex: muchos experimentos rapidos (probe-sense-respond). Complicated: pocos experimentos profundos (sense-analyze-respond).

---

## 4. Casos de Exito Documentados

### 4.1 Booking.com — 1000+ Experiments per Day
- **Contexto:** Booking.com ejecuta miles de A/B tests simultaneos. Cada feature es una hipotesis. El 90% de los experimentos "fracasan" (no mueven la metrica significativamente), y eso se celebra como aprendizaje validado.
- **Relevancia:** Demuestra que HDD a escala funciona cuando la cultura soporta el fracaso de hipotesis como outcome positivo.
- **Fuente:** Booking.com Engineering Blog (2024). "Experimentation Culture at Scale."

### 4.2 Microsoft — Controlled Experiments on the Web (Kohavi)
- **Contexto:** Ron Kohavi lidero la practica de experimentacion en Microsoft (Bing, Office 365). Publico que la mayoria de las ideas (60-90%) no mejoran las metricas — y que solo experimentando se puede saber cuales funcionan.
- **Relevancia:** Valida que incluso equipos de ingenieria de clase mundial no pueden predecir que funciona. HDD es necesario, no opcional.
- **Fuente:** Kohavi, R. et al. (2020). *Trustworthy Online Controlled Experiments*. Cambridge University Press.

### 4.3 Spotify — Think It, Build It, Ship It, Tweak It
- **Contexto:** Spotify usa un ciclo de 4 pasos (Think, Build, Ship, Tweak) que es una variante de BML. Cada squad tiene autonomia para disenar y ejecutar experimentos dentro de su dominio.
- **Relevancia:** Modelo de HDD descentralizado que funciona a escala con squads autonomos. Relevante para clientes que adoptan Team Topologies.
- **Fuente:** Spotify Engineering Blog (2024). "How Spotify Experiments at Scale."

---

## 5. Evolucion Esperada (2026-2028)

| Tendencia | Probabilidad | Impacto en HDD |
|---|---|---|
| **AI genera hipotesis + experimenta + decide** | Media | El humano pasa de generador a curador/auditor de hipotesis |
| **Experiment-as-Code** | Alta | Hipotesis definidas como codigo versionado (YAML/JSON), ejecutadas por pipelines |
| **Continuous Discovery como practica organizacional** | Alta | HDD deja de ser "de producto" y se vuelve transversal (arquitectura, ops, negocio) |
| **Automated kill decisions** | Media | Fitness functions y feature flags automaticamente matan hipotesis que no cumplen threshold |
| **Hypothesis Debt** | Media | Acumulacion de hipotesis no validadas reconocida como forma de deuda tecnica |
| **Causal Inference en experimentacion** | Media-Alta | Superando A/B tests con metodos causales (DiD, instrumental variables) para contextos donde randomization es imposible |

---

**Autor:** Javier Montano | **Ultima actualizacion:** 13 de marzo de 2026
**© Comunidad MetodologIA — Todos los derechos reservados**

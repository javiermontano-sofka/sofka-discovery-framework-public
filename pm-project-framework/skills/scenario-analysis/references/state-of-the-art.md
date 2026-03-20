# State of the Art — Strategic Scenario Analysis (2024-2026)

> Tendencias, herramientas emergentes y debates abiertos en el dominio de evaluacion de escenarios y toma de decisiones arquitectonicas.

---

## 1. Tendencias Dominantes

### 1.1 AI-Assisted Scenario Generation
- **Que esta pasando:** Los LLMs estan transformando la generacion de escenarios de arquitectura. En lugar de depender exclusivamente de la experiencia del arquitecto, modelos como GPT-4, Claude, y Gemini pueden generar escenarios divergentes basados en constraints del proyecto, patrones de industria, y datos historicos de migraciones similares.
- **Impacto en el skill:** La fase de "divergencia obligatoria" se acelera significativamente. Un LLM puede generar 5-7 escenarios candidatos en minutos, donde un equipo humano tardaria horas. El valor del arquitecto se desplaza de la generacion a la curaduria y scoring.
- **Riesgo:** Los escenarios generados por AI pueden ser plausibles pero no viables en el contexto especifico del cliente. Sin validacion de domain experts, se corre riesgo de "escenarios de papel" — bien escritos pero desconectados de la realidad operativa.
- **Estado 2026:** Equipos lider usan AI para brainstorming inicial + scoring preliminar, pero la recomendacion final siempre es humana.
- **Fuentes:** McKinsey (2025) "AI-Augmented Strategic Planning"; Gartner (2025) "AI for Enterprise Architecture Decision Making"

### 1.2 Probabilistic Architecture Evaluation
- **Que esta pasando:** El scoring deterministico (un numero por dimension) esta siendo complementado con distribuciones probabilisticas. En lugar de "Cost = 6/10", se modela "Cost = Normal(6, 1.2)" para reflejar incertidumbre.
- **Impacto en el skill:** La simulacion Monte Carlo sobre los scores permite calcular la probabilidad de que un escenario supere a otro. "Escenario B supera a A en el 73% de simulaciones" es mas informativo que "B = 6.65 vs A = 7.40."
- **Herramientas:** Crystal Ball, @RISK, Python scipy.stats, y cada vez mas LLMs como calculadoras de incertidumbre.
- **Estado 2026:** Adoption baja-media. Los steering committees prefieren un numero simple, pero los equipos tecnicos valoran la distribucion.
- **Fuentes:** Hubbard, D. (2024). *How to Measure Anything in Cybersecurity Risk*, 2nd Ed.; IEEE Software (2025) "Probabilistic Architecture Decision Making"

### 1.3 Digital Twin Scenario Simulation
- **Que esta pasando:** Los digital twins de sistemas de software permiten simular escenarios de migracion antes de ejecutarlos. Se replica el comportamiento del sistema actual, se aplica el escenario (e.g., descomposicion en microservicios), y se miden metricas de performance, costo, y riesgo en el twin.
- **Impacto en el skill:** La dimension "Operational Risk" del scoring 6D puede pasar de estimacion experta a medicion simulada. Un digital twin puede responder "si aplico el Escenario B, el p99 latency aumenta de 120ms a 180ms durante la transicion."
- **Limitaciones:** Requiere inversion significativa en construccion del twin. Solo viable para sistemas grandes (>$10M TCO) donde el costo del twin se justifica.
- **Estado 2026:** Adoption baja. Empresas como Google, Netflix, y bancos tier-1 experimentan. No viable para la mayoria de clientes de discovery.
- **Fuentes:** Gartner (2025) "Digital Twins for IT Infrastructure"; AWS (2025) "Migration Simulation with Digital Twins"

### 1.4 Climate & Sustainability as Mandatory Scenario Dimension
- **Que esta pasando:** Regulaciones ESG (Environmental, Social, Governance) y el EU Corporate Sustainability Reporting Directive (CSRD) estan forzando a las organizaciones a incluir impacto ambiental en decisiones tecnologicas.
- **Impacto en el skill:** Una septima dimension ("Sustainability Score") esta emergiendo como candidata para el scoring. Mide: carbon footprint de infraestructura, eficiencia energetica del stack, compliance con green IT policies.
- **Debate:** Agregar una 7a dimension vs incorporar sustainability como subfactor de "Strategic Alignment" o "Regulatory Fit."
- **Estado 2026:** Mandatorio en EU para empresas >250 empleados. En LATAM, voluntario pero creciente por presion de clientes europeos.
- **Fuentes:** EU CSRD (2024); Green Software Foundation (2025) "Software Carbon Intensity Specification"; Thoughtworks (2025) "Green Cloud Architecture Patterns"

### 1.5 Chaos Engineering as Scenario Validation
- **Que esta pasando:** Los principios de chaos engineering (Netflix Simian Army, Gremlin, LitmusChaos) se estan aplicando no solo a sistemas en produccion sino a validar escenarios de arquitectura pre-implementacion.
- **Impacto en el skill:** La fase de PoC puede incluir "chaos experiments" que inyectan fallos en el escenario propuesto para validar la dimension "Operational Risk" con evidencia real en lugar de estimaciones.
- **Ejemplo:** Para el Escenario B (DDD Decomposition), un chaos experiment puede simular la caida del anti-corruption layer y medir el tiempo de recuperacion. Si es >4hr, el score de Operational Risk se ajusta a la baja.
- **Estado 2026:** Adoption media-alta en organizaciones cloud-native. Baja en legacy-heavy.
- **Fuentes:** Rosenthal, C. et al. (2020). *Chaos Engineering: System Resiliency in Practice*. O'Reilly; Gremlin (2025) "Pre-Migration Chaos Testing"

---

## 2. Herramientas Emergentes (2024-2026)

### 2.1 Decision & Scenario Modeling

| Herramienta | Proposito | Madurez | Relevancia para Scenario Analysis |
|---|---|---|---|
| **Ardoq** | EA tool con scenario comparison | Madura | Modelar escenarios y comparar impacto en capability map |
| **LeanIX** | EA + transformation management | Madura | Roadmap visualization por escenario |
| **MEGA HOPEX** | EA governance + decision analysis | Madura | TOGAF Phase E compliance |
| **Structurizr** | C4 model as code | Estable | Diagramar arquitectura por escenario |
| **ADR Tools (adr-tools)** | CLI para Architecture Decision Records | Estable | Documentar decision final del scenario analysis |
| **Decision Matrix Pro** | MCDA spreadsheet templates | Nicho | Templates para scoring ponderado |

### 2.2 Simulation & Modeling

| Herramienta | Proposito | Relevancia para Scenario Analysis |
|---|---|---|
| **Monte Carlo Simulation (Python)** | Simulacion probabilistica de scores | Distribucion de resultados en lugar de punto unico |
| **Arena/AnyLogic** | Simulacion de procesos | Modelar throughput por escenario |
| **Grafana k6** | Load testing | Validar PoC Speed dimension en escenarios |
| **Gremlin / LitmusChaos** | Chaos engineering | Validar Operational Risk dimension |

### 2.3 AI-Augmented Decision Making

| Herramienta | Proposito | Relevancia |
|---|---|---|
| **GitHub Copilot Workspace** | AI-assisted architecture exploration | Generar variantes de escenarios desde codebase |
| **Claude Projects** | Long-context analysis | Analizar AS-IS completo y generar escenarios contextualizados |
| **Gemini Deep Research** | Multi-source analysis | Investigar patrones de migracion de industria |
| **Perplexity Pro** | Research + citations | Benchmarks de costo y timeline para scoring |

---

## 3. Debates Abiertos en la Industria

### 3.1 Cuantas dimensiones son suficientes para el scoring?

**El debate:**
- **Pro-6D (posicion actual del skill):** Las 6 dimensiones cubren los drivers fundamentales sin sobrecargar el scoring. Cada dimension es accionable y diferenciante.
- **Pro-extension (7-10D):** Sustainability, Team Readiness, Vendor Lock-in, y Data Migration Complexity deberian ser dimensiones separadas, no subfactores.
- **Pro-reduccion (3-4D):** Muchos steering committees no procesan mas de 3-4 criterios. Cost + Risk + Strategic Value podria ser suficiente para decisiones ejecutivas.
- **Posicion del skill:** 6D como default. El weight override permite ajustar prioridades. Para variante ejecutiva, se pueden colapsar a 3-4 dimensiones principales.

### 3.2 Scoring cuantitativo vs narrativo?

- **Pro-cuantitativo:** Comparabilidad, reproducibilidad, eliminacion de sesgo emocional. "B = 6.65 > C = 4.95" es inequivoco.
- **Pro-narrativo:** Los numeros dan falsa precision. Un score de 6 vs 7 puede depender del humor del evaluador. La narrativa captura matices que el numero pierde.
- **Posicion del skill:** Ambos. Score cuantitativo para ranking + rationale narrativo por cada score. El numero sin narrativa es peligroso; la narrativa sin numero es inoperante.

### 3.3 Divergencia real vs teatro de escenarios?

- **Critica (2024-2025):** Muchos equipos practican "scenario theater" — generan 3 escenarios pero el Escenario B ya estaba decidido antes de empezar. Los otros son straw men.
- **Respuesta:** La divergencia obligatoria del skill (min 3 escenarios distintos en tech/approach) intenta prevenir esto. El scenario-challenger agent desafia activamente al escenario "favorito."
- **Indicadores de teatro:** Todos los scores estan within 0.5 puntos, SWOT de los "otros" escenarios es superficial, no hay conditional switching logic real.

### 3.4 El rol de la intuicion experta en decisiones de arquitectura?

- **Posicion rigida:** "Los datos deciden. El scoring elimina el sesgo."
- **Posicion pragmatica (Kahneman, Klein):** La intuicion experta tiene valor cuando: el entorno es regular (patrones repetibles), el experto tiene anos de practica con feedback, y la decision es time-constrained.
- **Posicion del skill:** El scoring estructura la decision; no la reemplaza. El steering committee puede override la recomendacion numerica si la intuicion experta identifica un factor no capturado — pero debe documentar por que.

---

## 4. Casos de Exito Documentados

### 4.1 ING Bank — Cloud Migration Scenario Analysis
- **Contexto:** ING evaluo 4 escenarios de migracion cloud para su plataforma de pagos. Usaron MCDA con 7 dimensiones ponderadas por el steering committee.
- **Resultado:** Seleccionaron un enfoque hibrido (cloud para nuevos servicios, on-prem para core) que redujo time-to-market de 9 a 4 meses para nuevos productos.
- **Relevancia:** Valida el enfoque de scoring ponderado y la importancia de weight override por industria regulada.
- **Fuente:** ING Tech Blog (2024). "How We Decided Our Cloud Strategy."

### 4.2 Spotify — Architecture Decision Records at Scale
- **Contexto:** Spotify usa ADRs a escala con mas de 500 equipos. Las decisiones de arquitectura se documentan con escenarios evaluados y trade-offs explicitos.
- **Relevancia:** Demuestra que el scenario analysis no es solo para grandes migraciones — puede aplicarse a decisiones de componente, servicio, o plataforma.
- **Fuente:** Spotify Engineering Blog (2024). "Architecture Decision Records at Scale."

### 4.3 Nubank — Core Banking Modernization
- **Contexto:** Nubank evaluo 3 escenarios para escalar su plataforma de 50M a 100M clientes. Eligieron una combinacion de escenarios A+B: mantener core Clojure + descomponer dominios de alto crecimiento.
- **Relevancia:** Ejemplo real de que la recomendacion puede ser un hibrido de escenarios, no uno puro.
- **Fuente:** Nubank Engineering (2025). "Scaling to 100M: Architecture Decisions."

---

## 5. Evolucion Esperada (2026-2028)

| Tendencia | Probabilidad | Impacto en Scenario Analysis |
|---|---|---|
| **AI genera y evalua escenarios end-to-end** | Media-Alta | El arquitecto pasa de autor a curador. El skill se vuelve "AI-generated, human-curated." |
| **Sustainability como 7a dimension obligatoria** | Alta (EU) / Media (LATAM) | El scoring 6D se vuelve 7D. Weight override necesita incluir ESG priorities. |
| **Continuous Scenario Evaluation** | Media | El scenario analysis deja de ser puntual. Se re-evalua trimestralmente con datos actualizados. |
| **Digital twin pre-validation** | Baja-Media | Operational Risk dimension se basa en simulacion, no estimacion. |
| **Quantum readiness como dimension** | Baja (2028+) | Crypto migration escenarios entran en scope para industria financiera. |
| **Federated decision making** | Media | Multiples equipos evaluan escenarios de sus dominios; un meta-escenario consolida. |

---

**Autor:** Javier Montano | **Ultima actualizacion:** 13 de marzo de 2026
**© Comunidad MetodologIA — Todos los derechos reservados**

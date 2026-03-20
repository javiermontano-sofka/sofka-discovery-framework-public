# Body of Knowledge — Execution Burndown

> Base de conocimiento academica e industrial que fundamenta la skill `execution-burndown`.

---

## Fuentes Primarias

### 1. Burndown Charts (Atlassian Methodology)

- **Fuente:** Atlassian Agile Coach — Burndown Charts
- **Relevancia:** Referencia canonica para la visualizacion de trabajo restante vs. tiempo. El burndown chart muestra la linea ideal (plan) contra la linea real (actual), revelando desviaciones tempranamente. Atlassian popularizo el formato sprint burndown + release burndown como herramienta de transparencia.
- **Aplicacion en la skill:** El burndown chart es el artefacto central del skill. Cada sprint de 1 dia genera un punto de datos. La pendiente de la linea actual vs. ideal es la senal primaria de salud del proyecto. Desviaciones >15% en dia 3 disparan alertas tempranas.

### 2. Scrum Velocity Tracking

- **Fuente:** Ken Schwaber & Jeff Sutherland — *The Scrum Guide* (2020)
- **Relevancia:** La velocidad es la cantidad de trabajo completado por sprint, medida en story points o features. La velocidad se estabiliza despues de 2-3 sprints, permitiendo predicciones confiables. En el modelo MetodologIA, la velocidad target es 1 feature/dia/FTE desde Sprint 2.
- **Aplicacion en la skill:** El tracking diario permite medir velocidad instantanea (features completadas hoy) y velocidad promedio (rolling average de ultimos N dias). Sprint 1 es ramp-up; la velocidad de Sprint 2+ es el baseline para proyecciones.

### 3. Little's Law para Flow Metrics

- **Autor:** John D.C. Little
- **Obra:** "A Proof for the Queuing Formula: L = λW" (Operations Research, 1961)
- **Relevancia:** Ley fundamental de la teoria de colas: L = λW (items en proceso = tasa de llegada × tiempo en sistema). Aplicada a desarrollo: WIP = Throughput × Cycle Time. Controlar WIP es la palanca mas directa para reducir cycle time.
- **Aplicacion en la skill:** Little's Law conecta el WIP diario con el throughput observado. Si el WIP crece sin que el throughput crezca, el cycle time se degrada. La skill monitorea WIP/developer como indicador adelantado de problemas de flujo.

### 4. Monte Carlo Simulation para Forecasting

- **Fuente:** Troy Magennis — *Forecasting & Simulating Software Development Projects* (Focused Objective, 2015)
- **Relevancia:** Reemplaza la estimacion determinista ("terminamos el dia X") con probabilistica ("hay 85% de probabilidad de terminar entre dia X y dia Y"). Usa throughput historico para simular miles de escenarios posibles. Mas confiable que burndown lineal cuando la velocidad tiene varianza.
- **Aplicacion en la skill:** A partir de dia 5 (suficientes datos), la skill genera proyecciones Monte Carlo con intervalos de confianza (P50, P85, P95). Esto permite comunicar rango en vez de fecha unica, y tomar decisiones de alcance basadas en probabilidad.

### 5. Story Point Estimation (Fibonacci & T-Shirt)

- **Fuente:** Mike Cohn — *Agile Estimating and Planning* (2005)
- **Relevancia:** Los story points miden esfuerzo relativo, no tiempo absoluto. La secuencia Fibonacci (1, 2, 3, 5, 8, 13) fuerza la distincion entre lo grande y lo pequeno. T-shirt sizing (XS, S, M, L, XL) es alternativa para estimacion rapida. El modelo MetodologIA requiere features ≤3 SP para ser shippable en 1 dia.
- **Aplicacion en la skill:** Features >3 SP se re-descomponen obligatoriamente. El burndown mide features completadas (no SP), pero los SP validan que la descomposicion sea adecuada. La regla ≤3 SP es el filtro de entrada al backlog ejecutable.

### 6. Feature Decomposition (INVEST Criteria)

- **Autor:** Bill Wake — "INVEST in Good Stories, and SMART Tasks" (2003)
- **Relevancia:** Una buena user story es: Independent, Negotiable, Valuable, Estimable, Small, Testable. INVEST es el criterio de calidad para descomposicion. Stories que no cumplen INVEST generan impedimentos, re-trabajo, y desviaciones en el burndown.
- **Aplicacion en la skill:** Cada feature en el backlog ejecutable debe pasar el filtro INVEST. La skill incluye un checklist de calidad de descomposicion como prerequisito del burndown. Features que no son Independent o Testable son candidatas a re-descomposicion.

### 7. Lean Manufacturing Flow (Kanban, WIP Limits)

- **Fuente:** David J. Anderson — *Kanban: Successful Evolutionary Change for Your Technology Business* (2010)
- **Relevancia:** Kanban aplica principios lean al trabajo del conocimiento: visualizar flujo, limitar WIP, gestionar flow, hacer politicas explicitas, mejorar colaborativamente. Los WIP limits son la herramienta clave para evitar sobrecarga y mantener flujo predecible.
- **Aplicacion en la skill:** El modelo de sprints de 1 dia implica WIP limit natural de 1 feature/developer/dia. La skill monitorea cuando un developer tiene >1 feature en progreso como senal de problemas (multitasking, bloqueo parcial). El board Kanban diario complementa el burndown.

### 8. DORA Metrics (Deployment Frequency)

- **Fuente:** Nicole Forsgren, Jez Humble, Gene Kim — *Accelerate* (2018)
- **Relevancia:** Las 4 metricas DORA (Deployment Frequency, Lead Time for Changes, Change Failure Rate, Time to Restore Service) miden el rendimiento de entrega de software. Deployment frequency es la metrica mas correlacionada con high performance.
- **Aplicacion en la skill:** En el modelo MetodologIA de 1 feature/dia/FTE, la deployment frequency target es diaria. La skill trackea si las features completadas son realmente desplegadas (shippable = deployed) o solo "terminadas en branch". El gap entre "done" y "deployed" es una fuente comun de desviacion en el burndown.

### 9. Brooks' Law

- **Autor:** Frederick P. Brooks Jr.
- **Obra:** *The Mythical Man-Month* (1975, Anniversary ed. 1995)
- **Relevancia:** "Adding manpower to a late software project makes it later." El costo de comunicacion crece con n(n-1)/2 donde n es el tamano del equipo. Nuevos miembros requieren onboarding que consume capacidad del equipo existente. La productividad cae antes de subir.
- **Aplicacion en la skill:** Cuando el burndown muestra desviacion, "agregar personas" es una palanca con delay y costo. La skill modela la curva de ramp-up: Sprint 1 de un nuevo developer = 0.25 FTE, Sprint 2 = 0.5 FTE, Sprint 3+ = 1.0 FTE. El adjustment lever de "escalar equipo" incluye esta penalizacion de Brooks en la proyeccion.

### 10. MetodologIA Productivity Model (1 FTE/Feature/Day Baseline)

- **Fuente:** Comunidad MetodologIA — Modelo de Productividad (Internal, 2024)
- **Relevancia:** Modelo propietario calibrado con datos de +200 proyectos MetodologIA. Establece que 1 FTE (Full-Time Equivalent) con features correctamente descompuestas (≤3 SP) puede entregar 1 feature shippable por dia a partir del Sprint 2. Sprint 1 es ramp-up (0.5 features/dia/FTE). El modelo incluye curvas de ramp-up por nivel de senioridad y complejidad de dominio.
- **Aplicacion en la skill:** Es el benchmark central. La velocidad observada se compara contra el baseline de 1 feature/dia/FTE. Desviaciones se expresan como porcentaje del baseline (ej: "equipo opera al 75% del modelo"). Los adjustment levers se calibran para recuperar el baseline o ajustar scope segun la velocidad real.

---

## Fuentes Complementarias

| Fuente | Autor/Org | Ano | Contribucion |
|--------|-----------|-----|--------------|
| *Waltzing with Bears* | Tom DeMarco & Timothy Lister | 2003 | Gestion de riesgo en estimacion de software |
| *Software Estimation: Demystifying the Black Art* | Steve McConnell | 2006 | Tecnicas de estimacion, cone of uncertainty |
| *Flow: The Principles of Product Development* | Donald G. Reinertsen | 2009 | Cost of Delay, economic framework for flow |
| *Actionable Agile Metrics for Predictability* | Daniel S. Vacanti | 2015 | Cycle time, throughput, flow metrics avanzados |
| *When Will It Be Done?* | Daniel S. Vacanti | 2020 | Forecasting probabilistico, Monte Carlo aplicado |
| *The Phoenix Project* | Gene Kim et al. | 2013 | Teoria de constraints aplicada a IT/DevOps |
| *No Estimates* | Vasco Duarte | 2016 | Forecasting por conteo de items vs. story points |

---

## Glosario

| Termino | Definicion |
|---------|-----------|
| **Burndown Chart** | Grafico que muestra trabajo restante (eje Y) vs. tiempo (eje X). La linea ideal es recta; la linea actual revela desviaciones. |
| **Velocity** | Cantidad de features (o story points) completadas por unidad de tiempo. En MetodologIA: features/dia/FTE. |
| **Throughput** | Numero de items completados por periodo. Similar a velocity pero agnostico de estimacion. |
| **Cycle Time** | Tiempo desde que se inicia una feature hasta que esta shippable. Target MetodologIA: ≤1 dia. |
| **WIP (Work In Progress)** | Features iniciadas pero no completadas. WIP limit MetodologIA: 1 feature/developer. |
| **Story Points (SP)** | Unidad relativa de esfuerzo. En MetodologIA, features ejecutables deben ser ≤3 SP. |
| **FTE (Full-Time Equivalent)** | Unidad de capacidad: 1 developer a tiempo completo. Base del modelo de productividad. |
| **Ramp-Up Curve** | Periodo de onboarding donde la productividad es <100%. Sprint 1 = 0.5x, Sprint 2+ = 1.0x. |
| **Shippable Feature** | Feature que cumple Definition of Done, pasa QA, y puede desplegarse. No "terminada en branch". |
| **Deviation Signal** | Diferencia entre burndown ideal y actual. >10% = alerta temprana. >25% = intervencion requerida. |
| **Monte Carlo Forecast** | Simulacion que genera miles de escenarios usando throughput historico para predecir fecha de completitud. |
| **INVEST** | Criterio de calidad para user stories: Independent, Negotiable, Valuable, Estimable, Small, Testable. |
| **Brooks' Law Penalty** | Reduccion temporal de productividad al agregar miembros. Modelada como curva de ramp-up. |
| **Feature Decomposition** | Proceso de dividir features grandes (>3 SP) en features pequenas (≤3 SP) manteniendo criterio INVEST. |
| **Impediment** | Bloqueo que impide a un developer completar su feature del dia. Remocion inmediata es critica. |

---

**Autor:** Javier Montaño | **Ultima actualizacion:** 13 de marzo de 2026

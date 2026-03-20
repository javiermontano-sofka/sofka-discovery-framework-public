# Body of Knowledge — Hypothesis-Driven Development

> Fuentes academicas, industriales y practicas que fundamentan la metodologia de desarrollo dirigido por hipotesis con ciclos Build-Measure-Learn y decision gates kill/pivot/persevere.

---

## 1. Lean Startup — Fundamentos

### Eric Ries — The Lean Startup (2011)
- **Relevancia:** Obra fundacional del movimiento. Ries introduce el ciclo Build-Measure-Learn (BML) como la unidad fundamental de progreso en innovacion. Cada iteracion construye un MVP, mide resultados con metricas accionables, y aprende para decidir si pivotar o perseverar.
- **Uso en el skill:** El ciclo BML es la columna vertebral del skill. Cada hipotesis de discovery se estructura como un ciclo BML: Build (el experimento), Measure (la metrica con threshold), Learn (la decision kill/pivot/persevere).
- **Conceptos clave:** Innovation Accounting, validated learning, actionable metrics vs vanity metrics, pivot types (zoom-in, zoom-out, customer segment, platform, business architecture, value capture, engine of growth, channel, technology).
- **Fuente:** Ries, E. (2011). *The Lean Startup: How Today's Entrepreneurs Use Continuous Innovation to Create Radically Successful Businesses*. Crown Business.

### Steve Blank — The Four Steps to the Epiphany (2005)
- **Relevancia:** Precursor directo de Lean Startup. Blank introduce Customer Development como proceso paralelo a Product Development, validando hipotesis de mercado antes de escalar.
- **Uso en el skill:** La distincion de Blank entre "search mode" (discovery) y "execution mode" (delivery) mapea directamente a la fase de experimentacion vs la fase de roadmap en el discovery framework.
- **Fuente:** Blank, S. (2005). *The Four Steps to the Epiphany: Successful Strategies for Products that Win*. K&S Ranch.

---

## 2. Hypothesis-Driven Design

### Jeff Gothelf — Lean UX: Designing Great Products with Agile Teams (2013)
- **Relevancia:** Traduce los principios de Lean Startup al diseno de producto. Gothelf formaliza la estructura de hipotesis: "Creemos que [outcome] se lograra si [persona] puede [accion] con [feature]. Sabremos que tuvimos exito cuando [metrica] alcance [threshold]."
- **Uso en el skill:** El template de hipotesis del skill sigue la estructura Gothelf extendida con decision gates: belief + metric + experiment + threshold + decision.
- **Fuente:** Gothelf, J. & Seiden, J. (2013). *Lean UX: Designing Great Products with Agile Teams*. O'Reilly Media. (3rd Ed. 2021)

### Barry O'Reilly — Hypothesis-Driven Development (2013, Enterprise)
- **Relevancia:** Articulo seminal que adapta HDD al contexto enterprise. O'Reilly argumenta que las features no son entregables — son hipotesis. Cada feature debe tener una hipotesis testeable antes de entrar al backlog.
- **Uso en el skill:** La transformacion de features en hipotesis es el primer paso del skill. Cada item del backlog de discovery se reformula como hipotesis con estructura completa.
- **Fuente:** O'Reilly, B. (2013). "How to Implement Hypothesis-Driven Development." ThoughtWorks Insights.
- **URL:** https://www.thoughtworks.com/insights/articles/how-implement-hypothesis-driven-development

### Barry O'Reilly — Unlearn: Let Go of Past Success to Achieve Extraordinary Results (2018)
- **Relevancia:** Extiende HDD con el concepto de "unlearning" — la capacidad de abandonar hipotesis validadas previamente cuando el contexto cambia. Combate el sesgo de confirmacion y la falacia del costo hundido.
- **Uso en el skill:** El decision gate "kill" requiere la capacidad de unlearn. El skill incluye un detector de sesgo de costo hundido como metaprompt.
- **Fuente:** O'Reilly, B. (2018). *Unlearn: Let Go of Past Success to Achieve Extraordinary Results*. McGraw-Hill.

---

## 3. Lean Inception y Discovery

### Paulo Caroli — Lean Inception: How to Align People and Build the Right Product (2018)
- **Relevancia:** Caroli formaliza una semana de inception para alinear equipos en QUE construir antes de construir. La inception genera hipotesis priorizadas, MVPs secuenciados, y metricas de validacion.
- **Uso en el skill:** La fase de "conversion de escenarios a hipotesis" sigue la logica de Caroli: de la vision (escenario recomendado) a hipotesis priorizadas con MVPs secuenciados. El sequencer de Caroli inspira el portfolio de hipotesis.
- **Fuente:** Caroli, P. (2018). *Lean Inception: How to Align People and Build the Right Product*. Caroli.org.

---

## 4. Arquitectura Evolutiva y Fitness Functions

### Martin Fowler et al. — Building Evolutionary Architectures (2017, 2nd Ed. 2023)
- **Relevancia:** Ford, Parsons y Kua introducen las fitness functions como mecanismos automatizados para validar que la arquitectura cumple sus atributos de calidad. Una fitness function ES una hipotesis de arquitectura: "Creemos que el p99 latency se mantendra por debajo de 200ms bajo 10K req/s."
- **Uso en el skill:** Las hipotesis de arquitectura (H-type: architecture) se implementan como fitness functions. El threshold de la hipotesis es el umbral de la fitness function. El experimento es el test automatizado.
- **Fuente:** Ford, N., Parsons, R. & Kua, P. (2017). *Building Evolutionary Architectures: Support Constant Change*. O'Reilly Media. (2nd Ed. 2023)

### Rebecca Parsons — Fitness Functions for Architecture (ThoughtWorks)
- **Relevancia:** Parsons extiende el concepto a fitness functions compuestas (multiples atributos evaluados simultaneamente) y fitness functions holísticas (evaluacion de sistema completo vs componente).
- **Uso en el skill:** El portfolio de hipotesis incluye fitness functions compuestas que validan multiples atributos de calidad simultaneamente.
- **Fuente:** Parsons, R. (2023). "Fitness Functions: An Evolutionary Architecture Approach." ThoughtWorks Technology Radar.

---

## 5. Metodo Cientifico Aplicado a Software

### PDCA (Deming) como precursor de BML
- **Relevancia:** El ciclo Plan-Do-Check-Act de W. Edwards Deming (1950s) es el ancestro directo del Build-Measure-Learn de Ries. PDCA en manufactura = BML en software.
- **Uso en el skill:** El skill reconoce PDCA como fundamento teorico. Plan = hypothesis, Do = experiment, Check = measure, Act = decide (kill/pivot/persevere).
- **Fuente:** Deming, W.E. (1986). *Out of the Crisis*. MIT Press.

### Karl Popper — Falsifiability as Scientific Criterion
- **Relevancia:** Una hipotesis que no puede ser falsificada no es cientifica. Popper establece que el valor de una hipotesis reside en su capacidad de ser refutada, no confirmada.
- **Uso en el skill:** Toda hipotesis debe tener un "kill criterion" — una condicion bajo la cual se considera falsificada. Hipotesis sin kill criterion no son validas.
- **Fuente:** Popper, K. (1959). *The Logic of Scientific Discovery*. Routledge.

---

## 6. Real Options y Decision-Making bajo Incertidumbre

### Chris Matts & Olav Maassen — Real Options Theory for Software
- **Relevancia:** Real Options aplica la teoria de opciones financieras a decisiones de software. Una hipotesis no validada es una opcion abierta. Validarla (o matarla) reduce la incertidumbre y crea valor informacional.
- **Uso en el skill:** Los decision gates kill/pivot/persevere se modelan como ejercicio de opciones. "Kill" = dejar expirar la opcion. "Persevere" = ejercer la opcion. "Pivot" = intercambiar por una opcion diferente.
- **Fuente:** Matts, C. & Maassen, O. (2007). "Real Options Underlie Agile Practices." InfoQ.

### Dave Snowden — Cynefin Framework for Complexity Classification
- **Relevancia:** Cynefin clasifica problemas en Simple, Complicated, Complex, Chaotic, y Confusion. HDD es mas valioso en el dominio Complex (donde la relacion causa-efecto solo se entiende en retrospectiva) y Complicated (donde requiere expertise).
- **Uso en el skill:** Antes de disenar un experimento, el skill clasifica la hipotesis por dominio Cynefin. En dominio Complex: probe-sense-respond (experimentos exploratorios). En Complicated: sense-analyze-respond (spikes y PoCs).
- **Fuente:** Snowden, D.J. & Boone, M.E. (2007). "A Leader's Framework for Decision Making." Harvard Business Review, Nov 2007.

---

## 7. Innovation Accounting

### Eric Ries — Innovation Accounting (The Lean Startup, Cap. 7)
- **Relevancia:** Ries distingue entre vanity metrics (numeros que suben pero no informan) y actionable metrics (numeros que informan decisiones). Innovation accounting establece una linea base, ajusta el motor (experiment), y decide si pivotar.
- **Uso en el skill:** Cada hipotesis debe tener una metrica accionable, no una vanity metric. El skill incluye un auditor de accionabilidad de metricas como metaprompt.
- **Fuente:** Ries, E. (2011). *The Lean Startup*, Chapter 7: "Measure."

### Ash Maurya — Running Lean: Iterate from Plan A to a Plan That Works (2012)
- **Relevancia:** Maurya introduce el Lean Canvas como herramienta para documentar hipotesis de negocio de forma rapida. El "riskiest assumption test" prioriza que hipotesis validar primero.
- **Uso en el skill:** La priorizacion de hipotesis sigue el principio de Maurya: validar primero la hipotesis mas riesgosa (riskiest assumption), no la mas facil.
- **Fuente:** Maurya, A. (2012). *Running Lean: Iterate from Plan A to a Plan That Works*. O'Reilly Media. (3rd Ed. 2022)

---

## 8. Bibliografia Practica

| Categoria | Libro/Recurso | Autor | Relevancia |
|---|---|---|---|
| Fundacional | *The Lean Startup* | Eric Ries (2011) | Ciclo BML, innovation accounting, pivot types |
| Fundacional | *Lean UX* | Jeff Gothelf (2013, 3rd Ed. 2021) | Estructura de hipotesis, outcomes over outputs |
| Inception | *Lean Inception* | Paulo Caroli (2018) | MVP sequencer, hipotesis priorizadas |
| Arquitectura | *Building Evolutionary Architectures* | Ford, Parsons, Kua (2017, 2nd Ed. 2023) | Fitness functions como hipotesis |
| Enterprise HDD | *Unlearn* | Barry O'Reilly (2018) | HDD en enterprise, combatir sesgo |
| Discovery | *Continuous Discovery Habits* | Teresa Torres (2021) | Opportunity Solution Trees, weekly experiments |
| Metricas | *Running Lean* | Ash Maurya (2012, 3rd Ed. 2022) | Lean Canvas, riskiest assumption test |
| Complejidad | *Cynefin Framework* | Dave Snowden (2007) | Clasificacion de problemas, probe-sense-respond |
| Decision | *Thinking in Bets* | Annie Duke (2018) | Toma de decisiones bajo incertidumbre |
| Cientifico | *The Logic of Scientific Discovery* | Karl Popper (1959) | Falsifiabilidad como criterio |

---

## 9. Glosario de Terminos

| Termino | Definicion |
|---|---|
| **Build-Measure-Learn (BML)** | Ciclo iterativo de Lean Startup: construir un experimento minimo, medir resultados con metricas accionables, aprender para decidir siguiente paso |
| **Hypothesis** | Afirmacion testeable con estructura: belief + metric + experiment + threshold + decision |
| **Value Hypothesis** | Hipotesis que valida si el producto/feature entrega valor al usuario o cliente |
| **Growth Hypothesis** | Hipotesis que valida si el producto/feature puede escalar (adquisicion, retencion, revenue) |
| **Architecture Hypothesis** | Hipotesis que valida si la arquitectura cumple atributos de calidad (performance, escalabilidad, seguridad) |
| **Kill** | Decision de abandonar una hipotesis cuando la evidencia demuestra que no es viable |
| **Pivot** | Decision de cambiar la direccion de una hipotesis preservando el aprendizaje acumulado |
| **Persevere** | Decision de continuar y escalar cuando la evidencia valida la hipotesis |
| **Innovation Accounting** | Sistema de metricas que mide progreso real (validated learning) en lugar de vanity metrics |
| **Fitness Function** | Test automatizado que valida continuamente un atributo de calidad de la arquitectura |
| **MVP (Minimum Viable Product)** | Version minima de un producto que permite completar un ciclo BML con el minimo esfuerzo |
| **Spike** | Experimento tecnico time-boxed para resolver incertidumbre de viabilidad |
| **Sunk Cost Fallacy** | Sesgo cognitivo de continuar invirtiendo en algo porque ya se invirtio, ignorando que el costo pasado es irrecuperable |
| **Riskiest Assumption** | La hipotesis cuyo fracaso invalidaria todo el plan — se valida primero |
| **Opportunity Solution Tree** | Herramienta de Teresa Torres que conecta outcomes → opportunities → solutions → experiments |

---

**Autor:** Javier Montano | **Ultima actualizacion:** 13 de marzo de 2026
**© Comunidad MetodologIA — Todos los derechos reservados**

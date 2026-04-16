# Body of Knowledge — Roadmap & PoC Execution Planning

> **Autor:** Javier Montaño | **Fecha:** 13 de marzo de 2026
> **© Comunidad MetodologIA** — Todos los derechos reservados

---

## TL;DR

- Lean Startup proporciona el framework de experimentación rápida y validación de hipótesis que fundamenta los kill criteria del PoC.
- Design Sprint (Knapp) estructura la compresión temporal: de idea a prototipo validado en 5 días, aplicable a Week 0.
- Shape Up (Basecamp) introduce appetites y shaping como alternativa a estimación por story points.
- PMBOK ofrece la gobernanza formal de iteraciones, gates y risk registers.
- Agile Estimating (Cohn) resuelve la estimación de capacidad, velocity y sprint planning con rigor estadístico.

---

## 1. Lean Startup — Eric Ries (2011)

### Relevancia para el Skill

El ciclo Build-Measure-Learn es la columna vertebral de todo PoC bien diseñado. Sin este framework, un PoC es un prototipo disfrazado de validación.

### Conceptos Clave Aplicados

| Concepto | Aplicación en roadmap-poc |
|---|---|
| **Minimum Viable Product (MVP)** | Define el alcance mínimo del PoC — solo lo necesario para validar la hipótesis central |
| **Validated Learning** | Cada sprint produce aprendizaje validado, no solo código funcional |
| **Build-Measure-Learn Loop** | Sprint 1 = Build, Demo + UAT = Measure, Retrospectiva = Learn |
| **Innovation Accounting** | Métricas de progreso del PoC: hipótesis validadas/refutadas, no features completadas |
| **Pivot or Persevere** | Gate criteria como puntos formales de decisión pivot/persevere |
| **Leap of Faith Assumptions** | Supuestos críticos que el PoC debe validar ANTES de escalar |

### Referencia Bibliográfica

- Ries, E. (2011). *The Lean Startup: How Today's Entrepreneurs Use Continuous Innovation to Create Radically Successful Businesses*. Crown Business.
- Ries, E. (2017). *The Startup Way: How Modern Companies Use Entrepreneurial Management to Transform Culture and Drive Long-Term Growth*. Currency.

---

## 2. Sprint: How to Solve Big Problems and Test New Ideas in Just Five Days — Jake Knapp (2016)

### Relevancia para el Skill

El Design Sprint de Google Ventures comprime el ciclo de descubrimiento-prototipado-validación en 5 días. Directamente aplicable al diseño de Week 0 (Pre-Service Kickoff) y a la estructura de sprints cortos con entregables diarios.

### Conceptos Clave Aplicados

| Concepto | Aplicación en roadmap-poc |
|---|---|
| **Map (Day 1)** | AS-IS Context Session del kickoff — mapear el problema antes de solucionarlo |
| **Sketch (Day 2)** | Diseño de soluciones durante Sprint 1, cada miembro contribuye independientemente |
| **Decide (Day 3)** | Gate criteria — decisiones binarias basadas en evidencia |
| **Prototype (Day 4)** | Daily task allocation orientada a producir artefactos demostrables |
| **Test (Day 5)** | UAT sessions al final de cada sprint, feedback real de stakeholders |
| **Decider Role** | Steering committee con autoridad de go/no-go en cada gate |

### Referencia Bibliográfica

- Knapp, J., Zeratsky, J., & Kowitz, B. (2016). *Sprint: How to Solve Big Problems and Test New Ideas in Just Five Days*. Simon & Schuster.

---

## 3. Shape Up: Stop Running in Circles and Ship Work that Matters — Basecamp (Ryan Singer, 2019)

### Relevancia para el Skill

Shape Up introduce el concepto de "appetite" (cuánto tiempo estamos dispuestos a invertir) en lugar de "estimación" (cuánto tiempo creemos que tomará). Esto alinea directamente con la filosofía de roadmap-poc donde la duración es un constraint, no una variable.

### Conceptos Clave Aplicados

| Concepto | Aplicación en roadmap-poc |
|---|---|
| **Fixed Time, Variable Scope** | El PoC tiene duración fija (4-8 semanas); el scope se ajusta al appetite |
| **Appetite** | Budget range como appetite — cuánto está dispuesto a invertir el cliente, no cuánto "cuesta" |
| **Shaping** | Pre-service kickoff como fase de shaping — definir boundaries antes de empezar |
| **Hill Charts** | Alternativa visual al burndown para tracking de progreso en sprints |
| **Cool-down** | Periodo entre sprints para absorber aprendizajes y ajustar scope |
| **Circuit Breaker** | Kill criteria — si al final del appetite no se logró el objetivo, se detiene |
| **Betting Table** | Steering committee decidiendo qué apostar en el siguiente ciclo |

### Referencia Bibliográfica

- Singer, R. (2019). *Shape Up: Stop Running in Circles and Ship Work that Matters*. Basecamp. https://basecamp.com/shapeup

---

## 4. PMBOK Guide — Project Management Institute (7th Edition, 2021)

### Relevancia para el Skill

PMBOK proporciona la estructura formal de gobernanza que transforma un roadmap informal en un plan ejecutable con gates, risk registers, y change control.

### Conceptos Clave Aplicados

| Concepto | Aplicación en roadmap-poc |
|---|---|
| **Iteration Planning** | Sprint breakdown con daily allocation, capacity planning, y deliverable tracking |
| **Quality Gates** | Gate 0→1, Gate 1→2, Gate 2→Production con criterios PASS/FAIL/CONDITIONAL |
| **Risk Register** | Formato estándar: ID, descripción, probabilidad, impacto, mitigación, owner, status |
| **Work Breakdown Structure (WBS)** | Descomposición de sprints en tareas diarias con owner y entregable |
| **Earned Value Management** | Tracking de budget burn rate vs value delivered por sprint |
| **Change Control** | Proceso formal para scope changes durante la ejecución del PoC |
| **Stakeholder Register** | Prerequisite owners mapeados con autoridad y deadline |
| **Lessons Learned** | Retrospectiva al final de cada sprint alimenta mejora continua |

### Áreas de Conocimiento Relevantes

1. **Scope Management** — Scope del PoC definido y controlado
2. **Schedule Management** — Sprint timeline con critical path
3. **Cost Management** — Budget range con contingencia
4. **Risk Management** — Risk register con probabilidad × impacto
5. **Stakeholder Management** — Prerequisite owners y steering committee
6. **Quality Management** — Definition of Done y acceptance criteria

### Referencia Bibliográfica

- Project Management Institute. (2021). *A Guide to the Project Management Body of Knowledge (PMBOK Guide)* (7th ed.). PMI.
- Project Management Institute. (2021). *The Standard for Project Management*. PMI.

---

## 5. Agile Estimating and Planning — Mike Cohn (2005)

### Relevancia para el Skill

Cohn proporciona el framework más riguroso para estimación ágil: story points, velocity, capacity planning, y release planning. Directamente aplicable al sprint breakdown y budget estimation.

### Conceptos Clave Aplicados

| Concepto | Aplicación en roadmap-poc |
|---|---|
| **Story Points** | Estimación relativa de esfuerzo para tareas del sprint |
| **Velocity** | Medida empírica de capacidad del equipo — base para sprint planning |
| **Capacity Planning** | Engineers × días × horas productivas = horas disponibles por sprint |
| **Ideal Days vs Elapsed Days** | Diferencia entre esfuerzo estimado y duración real (factor de 0.6-0.7) |
| **Cone of Uncertainty** | Las estimaciones son más precisas conforme avanza el PoC — rangos amplios al inicio |
| **Release Planning** | Planificación de qué features entran en qué sprint basado en velocity |
| **Buffer Management** | Contingencia del 15% como buffer explícito, no escondido en estimaciones |
| **Planning Poker** | Técnica de estimación colaborativa para el equipo durante sprint planning |

### Fórmulas Clave

```
Capacity = Team Size × Sprint Days × Productive Hours/Day × Focus Factor
Sprint Velocity = Story Points Completed / Sprint (promedio 3 sprints)
Release Date = Total Story Points / Average Velocity
Budget Range = Capacity × Rate × (1 + Contingency%)
```

### Referencia Bibliográfica

- Cohn, M. (2005). *Agile Estimating and Planning*. Prentice Hall.
- Cohn, M. (2004). *User Stories Applied: For Agile Software Development*. Addison-Wesley.

---

## Fuentes Complementarias

| Fuente | Aporte Específico |
|---|---|
| Reinertsen, D. (2009). *The Principles of Product Development Flow* | Costo del delay como métrica para priorización de prerequisites |
| Humble, J. & Farley, D. (2010). *Continuous Delivery* | Prácticas de CI/CD que habilitan el prerequisite P3 del roadmap |
| Kim, G. et al. (2016). *The DevOps Handbook* | Integración de DevOps en el sprint breakdown y gate criteria |
| Patton, J. (2014). *User Story Mapping* | Técnica para definir el scope del MVP y priorizar features |
| Leffingwell, D. (2011). *Agile Software Requirements* | Escalamiento de prácticas ágiles para equipos enterprise |

---

## Mapeo Body of Knowledge → Secciones del Skill

| Sección del Skill | Fuente Principal | Fuentes Complementarias |
|---|---|---|
| S1: Pre-Service Kickoff | Sprint (Knapp), Shape Up | PMBOK (Stakeholder Mgmt) |
| S2: Prerequisites Validation | PMBOK (Scope, Risk) | Reinertsen (Cost of Delay) |
| S3: Sprint Breakdown | Agile Estimating (Cohn) | Lean Startup (Build-Measure-Learn) |
| S4: Team & Budget | PMBOK (Cost, HR) | Cohn (Capacity Planning) |
| S5: Timeline | PMBOK (Schedule) | Shape Up (Fixed Time) |
| S6: Gate Criteria | PMBOK (Quality Gates) | Lean Startup (Pivot/Persevere) |
| S7: Risk Register | PMBOK (Risk) | Shape Up (Circuit Breaker) |

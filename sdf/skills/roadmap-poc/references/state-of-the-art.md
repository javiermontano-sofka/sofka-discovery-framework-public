# State of the Art — Roadmap & PoC Execution Planning

> **Autor:** Javier Montaño | **Fecha:** 13 de marzo de 2026
> **© Comunidad MetodologIA** — Todos los derechos reservados

---

## TL;DR

- Los PoCs acelerados por IA reducen ciclos de validación de semanas a días mediante generación automática de código y pruebas.
- Platform engineering elimina la fricción de prerequisites: entornos autoservicio listos en horas, no semanas.
- Las plataformas low-code/no-code permiten PoCs funcionales sin equipo de desarrollo completo.
- Continuous discovery integra la validación continua con el delivery, eliminando el "big bang" del PoC.
- La industria se mueve hacia PoCs con kill criteria automatizados y gates basados en datos, no opiniones.

---

## 1. PoCs Acelerados por IA

### Estado Actual (2025-2026)

La integración de asistentes de código IA (GitHub Copilot, Cursor, Claude Code) en los flujos de desarrollo ha transformado radicalmente la velocidad de prototipado. Un sprint de 2 semanas con equipo de 4 ingenieros + IA produce el equivalente a 3-4 semanas de desarrollo tradicional.

### Impacto en Roadmap & PoC

| Aspecto | Antes (2023) | Ahora (2026) | Impacto en Sprint Planning |
|---|---|---|---|
| **Scaffolding inicial** | 2-3 días | 2-4 horas | Sprint 1 arranca con código funcional Day 1 |
| **Test generation** | Manual, 40% coverage | AI-assisted, 70-80% coverage | QA se enfoca en edge cases, no en happy paths |
| **Documentation** | Post-sprint, frecuentemente omitida | Generada en paralelo | Cada sprint entrega docs actualizados |
| **Code review** | Bottleneck humano | AI pre-review + human validation | Review cycle de días a horas |
| **Boilerplate & integrations** | Días de plumbing | Horas con AI patterns | Más tiempo para lógica de negocio |

### Implicaciones para el Skill

- **Capacity calculation** debe incluir un "AI multiplier" (1.3x-1.8x) en la productividad del equipo.
- **Sprint scope** puede ser más ambicioso sin sacrificar calidad.
- **Risk register** debe incluir riesgos de dependencia en herramientas IA (licencias, disponibilidad, calidad del output).
- **Gate criteria** deben validar calidad del código AI-generated (no solo que funcione, sino que sea mantenible).

### Fuentes

- GitHub (2025). *The State of AI in Software Development*. GitHub Octoverse Report.
- Anthropic (2025). *Claude Code: AI-Assisted Development Workflows*.
- Stack Overflow (2025). *Developer Survey: AI Tools Adoption*.

---

## 2. Platform Engineering para Prototipado Rápido

### Estado Actual (2025-2026)

Platform engineering ha madurado como disciplina: Internal Developer Platforms (IDPs) ofrecen entornos autoservicio donde un desarrollador puede provisionar un stack completo (infra, CI/CD, monitoring, databases) en minutos. Esto elimina el prerequisite blocker más común en PoCs.

### Impacto en Roadmap & PoC

| Prerequisite Tradicional | Con Platform Engineering | Reducción |
|---|---|---|
| P1: VPN/Dev environment | Self-service portal, 15 min | De 5 días a horas |
| P3: CI/CD pipeline | Template pipelines, 30 min | De 3 días a minutos |
| P4: Test environment | Ephemeral environments on-demand | De 7 días a horas |
| P9: Monitoring setup | Pre-configured observability stack | De 3 días a minutos |

### Implicaciones para el Skill

- **Week 0** se comprime significativamente cuando el cliente tiene IDP maduro.
- **Prerequisites Validation Table** necesita evaluar madurez de plataforma del cliente (Level 1-4).
- **Sprint 1** puede empezar con menos ceremony si la plataforma elimina setup friction.
- **Budget** puede reducirse en infraestructura si se apalanca la plataforma existente.

### Fuentes

- Humanitec (2025). *State of Platform Engineering Report*.
- CNCF (2025). *Platform Engineering Maturity Model*.
- Gartner (2025). *Hype Cycle for Platform Engineering*.

---

## 3. PoCs con Low-Code / No-Code

### Estado Actual (2025-2026)

Las plataformas low-code (OutSystems, Mendix, Power Platform, Retool) han alcanzado madurez enterprise. Permiten construir PoCs funcionales con 50-70% menos esfuerzo de desarrollo, especialmente para flujos CRUD, integraciones API, y dashboards.

### Impacto en Roadmap & PoC

| Escenario | Enfoque Tradicional | Enfoque Low-Code | Criterio de Decisión |
|---|---|---|---|
| **CRUD workflow** | 2 sprints (4 semanas) | 1 sprint (2 semanas) | Si no hay lógica compleja, low-code primero |
| **Dashboard/reporting** | 1 sprint + data pipeline | 3-5 días con herramienta BI | Si los datos están accesibles, BI tool |
| **API integration** | 1 sprint con middleware | 2-3 días con iPaaS | Si hay conectores pre-built |
| **Mobile prototype** | 2 sprints | 1 sprint con Flutter/React Native | Depende del nivel de customización |

### Implicaciones para el Skill

- **Trade-off** nuevo: narrow-deep code vs broad-shallow low-code.
- **Team composition** puede incluir citizen developers del lado del cliente.
- **Gate criteria** deben evaluar viabilidad de transición low-code → producción (vendor lock-in, scalability).
- **Risk register** debe incluir riesgo de limitaciones de plataforma descubiertas en Sprint 2.

### Fuentes

- Forrester (2025). *The State of Low-Code Platforms*.
- Gartner (2025). *Magic Quadrant for Enterprise Low-Code Application Platforms*.
- OutSystems (2025). *Enterprise Low-Code Development Report*.

---

## 4. Continuous Discovery y Dual-Track Agile

### Estado Actual (2025-2026)

Continuous discovery (Teresa Torres) integra la validación de producto con el delivery en un flujo dual-track: mientras un track construye, el otro valida. Esto elimina el modelo "waterfall de PoC" donde se diseña todo, se construye todo, y se valida al final.

### Impacto en Roadmap & PoC

| Modelo Tradicional | Continuous Discovery | Ventaja |
|---|---|---|
| Diseñar → Construir → Validar | Diseñar + Construir + Validar en paralelo | Feedback más temprano |
| Gate al final del sprint | Micro-validaciones diarias | Detección de problemas en horas, no semanas |
| UAT como evento | Usability testing continuo | Insights incrementales |
| Risk review post-sprint | Risk scanning por tarea | Riesgos detectados antes de acumularse |

### Opportunity Solution Trees

Torres introduce los Opportunity Solution Trees como herramienta para conectar outcomes de negocio con oportunidades de usuario y soluciones experimentales. Aplicable directamente a la definición de scope del PoC.

```
Outcome (Business Goal)
├── Opportunity 1 (User Need)
│   ├── Solution A (Experiment)
│   └── Solution B (Experiment)
└── Opportunity 2 (User Need)
    ├── Solution C (Experiment)
    └── Solution D (PoC Scope)
```

### Implicaciones para el Skill

- **Sprint breakdown** debe incluir actividades de discovery (interviews, tests) junto con delivery.
- **Gate criteria** evolucionan de "features completadas" a "hipótesis validadas".
- **Métricas de éxito** priorizan learning velocity sobre delivery velocity.
- **Team composition** puede requerir UX researcher integrado al equipo.

### Fuentes

- Torres, T. (2021). *Continuous Discovery Habits*. Product Talk.
- Gothelf, J. & Seiden, J. (2021). *Lean UX* (3rd ed.). O'Reilly.
- Cagan, M. (2018). *Inspired: How to Create Tech Products Customers Love* (2nd ed.). Wiley.

---

## 5. Tendencias Emergentes (2026+)

### 5.1 Gates Basados en Datos

Los gate criteria evolucionan de checklists manuales a evaluaciones automatizadas con dashboards en tiempo real. DORA metrics, SonarQube quality gates, y observability platforms proporcionan datos objetivos para decisiones go/no-go.

### 5.2 PoC-as-Code

La infraestructura del PoC se define como código (Terraform, Pulumi), permitiendo replicabilidad instantánea y eliminando el "works on my machine" que bloquea prerequisites.

### 5.3 AI-Driven Sprint Planning

Herramientas de sprint planning asistidas por IA analizan velocity histórica, dependencias, y riesgos para sugerir distribución óptima de tareas y detectar overcommitment antes de que ocurra.

### 5.4 Sustainability-Aware PoCs

Integración de métricas de sostenibilidad (carbon footprint de infraestructura, energy efficiency) como criterion adicional en gate evaluations.

---

## Mapeo Tendencias → Secciones del Skill

| Tendencia | Secciones Impactadas | Adaptación Requerida |
|---|---|---|
| PoCs acelerados por IA | S3 (Sprint), S4 (Team/Budget), S7 (Risk) | AI multiplier en capacity, riesgo de dependencia |
| Platform engineering | S1 (Kickoff), S2 (Prerequisites), S4 (Budget) | Evaluar madurez IDP, reducir Week 0 |
| Low-code PoCs | S3 (Sprint), S4 (Team), S6 (Gates) | Trade-off code vs low-code, vendor lock-in |
| Continuous discovery | S3 (Sprint), S6 (Gates), S7 (Risk) | Dual-track en sprint, micro-validaciones |
| Gates basados en datos | S6 (Gates) | Criterios automatizados, dashboards |

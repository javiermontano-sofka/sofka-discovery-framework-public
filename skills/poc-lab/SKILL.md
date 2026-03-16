---
name: sofka-poc-lab
description: >
  Proof of concept design and execution framework, success criteria definition, and evaluation
  methodology. Use when the user asks to "design a PoC", "plan a proof of concept", "define PoC
  success criteria", or mentions PoC charter, evaluation framework, spike design, or prototype
  planning.
author: Equipo PreSales Sofka
version: 1.0.0
tags:
  - poc
  - proof-of-concept
  - prototype
  - spike
  - evaluation
  - validation
  - moat
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
  - WebFetch
---

# Laboratorio de Pruebas de Concepto

Framework para diseno, ejecucion y evaluacion de pruebas de concepto (PoC),
con definicion de criterios de exito y metodologia de evaluacion rigurosa.

## TL;DR

- Disena PoCs con hipotesis claras, criterios de exito medibles y kill criteria
- Define alcance minimo viable para validar cada hipotesis con esfuerzo controlado
- Establece metodologia de evaluacion objetiva y reproducible
- Genera templates de charter, plan de pruebas y reporte de evaluacion
- Previene PoC theater (demos que no validan nada real)

## Inputs

Parse `$1` como **nombre del proyecto**, `$2` como **tecnologia o concepto a validar**.

**Parameters:**
- `{MODO}`: `piloto-auto` (default) | `desatendido` | `supervisado` | `paso-a-paso`
- `{FORMATO}`: `markdown` (default) | `html` | `dual`
- `{VARIANTE}`: `ejecutiva` (~40%) | `tecnica` (full, default)

## Entregables

1. **PoC Charter** — Hipotesis, alcance, criterios de exito, kill criteria, timeline, equipo
2. **Test Plan** — Escenarios de prueba, datos requeridos, metricas a capturar
3. **Evaluation Report Template** — Template para documentar resultados y veredicto
4. **Risk Register** — Riesgos del PoC y mitigacion
5. **Decision Framework** — Criterios para go/no-go post-PoC

## Proceso

1. **Definicion de Hipotesis** — Formular hipotesis claras y falsificables:
   - "La tecnologia X puede procesar Y transacciones/segundo con latencia <Z ms"
   - "El modelo AI alcanza precision >X% en datos representativos del dominio"
   - "La migracion de componente A a plataforma B se completa en <N sprints"
2. **Diseno de PoC Charter**:
   | Elemento | Descripcion |
   |---|---|
   | Hipotesis | Que se quiere validar (falsificable) |
   | Alcance | Scope minimo para validar la hipotesis |
   | Success Criteria | Metricas cuantitativas para declarar exito |
   | Kill Criteria | Condiciones para abortar temprano |
   | Timeline | Timebox estricto (1-4 semanas) |
   | Equipo | Roles y dedicacion requerida |
   | Datos | Datos reales (no mock) representativos |
   | Entorno | Infraestructura necesaria |
3. **Plan de Pruebas** — Disenar escenarios que cubran happy path, edge cases y failure modes
4. **Definicion de Metricas** — Especificar que se mide, como se mide, baseline de comparacion
5. **Template de Evaluacion** — Estructura para documentar resultados objetivamente:
   - Resultados cuantitativos vs criterios de exito
   - Observaciones cualitativas
   - Riesgos descubiertos
   - Veredicto: GO / NO-GO / PIVOT
6. **Decision Framework** — Arbol de decision post-PoC con opciones claras

## Criterios de Calidad

- [ ] Hipotesis formuladas como afirmaciones falsificables
- [ ] Criterios de exito cuantitativos y medibles
- [ ] Kill criteria definidos para evitar sunk cost fallacy
- [ ] Timeline con timebox estricto (no scope creep)
- [ ] Datos de prueba representativos (no datos demo/synthetic)
- [ ] Evaluacion objetiva con metricas, no opiniones
- [ ] Veredicto con opciones claras (GO, NO-GO, PIVOT)

## Anti-patrones a Evitar

| Anti-patron | Sintoma | Mitigacion |
|---|---|---|
| PoC Theater | Demo bonita que no valida nada real | Hipotesis falsificable + datos reales |
| Scope Creep | PoC se convierte en MVP | Timebox estricto + kill criteria |
| Cherry Picking | Solo se prueban happy paths | Plan de pruebas con edge cases |
| Sunk Cost | Se continua PoC fallido por inversion | Kill criteria claros y respetados |
| Vendor Demo | Vendor ejecuta el PoC con su equipo | Equipo propio ejecuta con soporte |

## Output Artifact

**Primary:** `PoC_Lab_{project}.md` — Charter, test plan, evaluation template.

### Diagramas (Mermaid)
- Flowchart: proceso de PoC (design -> execute -> evaluate -> decide)
- Decision tree: framework de decision post-PoC
- Gantt: timeline del PoC

---
**Autor:** Equipo PreSales Sofka | **Version:** 1.0.0

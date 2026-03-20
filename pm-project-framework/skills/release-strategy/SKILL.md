---
name: metodologia-release-strategy
description: >
  Release management approach design, deployment pattern selection (blue-green, canary, rolling),
  and rollback procedure definition. Use when the user asks to "design release strategy",
  "define deployment patterns", "plan rollback procedures", or mentions trunk-based development,
  GitFlow, feature flags, or CI/CD pipeline strategy.
author: Javier Montaño · Comunidad MetodologIA
argument-hint: "<proyecto> [sistema-o-plataforma]"
version: 1.0.0
tags:
  - release-management
  - deployment
  - ci-cd
  - devops
  - rollback
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

# Estrategia de Release

Diseno de estrategia de release management, patrones de despliegue y procedimientos
de rollback alineados con la madurez del equipo y los requisitos del negocio.

## TL;DR

- Evalua madurez actual de release management y CI/CD pipeline
- Selecciona branching strategy optima (trunk-based, GitFlow, GitHub Flow) segun contexto
- Define patrones de deployment (blue-green, canary, rolling, recreate) por servicio
- Disena playbook de rollback con criterios de activacion automatica
- Genera documento de estrategia completo con matriz de decision

## Inputs

Parse `$1` como **nombre del proyecto**, `$2` como **sistema o plataforma objetivo**.

**Parameters:**
- `{MODO}`: `piloto-auto` (default) | `desatendido` | `supervisado` | `paso-a-paso`
- `{FORMATO}`: `markdown` (default) | `html` | `dual`
- `{VARIANTE}`: `ejecutiva` (~40%) | `tecnica` (full, default)

## Entregables

1. **Documento de Estrategia de Release** — Branching model, release cadence, versioning policy
2. **Matriz de Deployment** — Patron de despliegue por servicio/componente con justificacion
3. **Playbook de Rollback** — Procedimientos paso a paso con criterios de activacion
4. **Pipeline Design** — Arquitectura de CI/CD pipeline con quality gates
5. **Feature Flag Strategy** — Politica de feature flags, lifecycle, cleanup

## Proceso

1. **Assessment de Estado Actual** — Evaluar pipeline existente, branching model, frecuencia de releases, incident history
2. **Seleccion de Branching Strategy**:
   | Strategy | Mejor Para | Requiere |
   |---|---|---|
   | Trunk-based | Equipos maduros, CD | Feature flags, test coverage alto |
   | GitHub Flow | Equipos medianos | PR reviews, CI solido |
   | GitFlow | Releases planificados | Disciplina de branches, QA dedicado |
3. **Diseno de Deployment Patterns** — Para cada servicio:
   - Blue-Green: zero-downtime, rollback instantaneo, requiere 2x infra
   - Canary: progressive rollout, deteccion temprana, requiere observabilidad
   - Rolling: eficiente en recursos, gradual, requiere backward compatibility
4. **Definicion de Rollback** — Criterios automaticos (error rate >X%, latency >Yms), procedimiento manual, comunicacion
5. **Quality Gates** — Definir gates en pipeline: lint, test, security scan, performance, approval
6. **Feature Flag Policy** — Lifecycle (create, enable, monitor, cleanup), ownership, technical debt prevention

## Criterios de Calidad

- [ ] Branching strategy justificada con contexto del equipo y negocio
- [ ] Patron de deployment definido por servicio con trade-offs documentados
- [ ] Playbook de rollback con pasos reproducibles y criterios de activacion claros
- [ ] Pipeline design con quality gates y tiempos estimados por stage
- [ ] Feature flag policy con cleanup schedule
- [ ] Metricas de release health definidas (DORA metrics como referencia)
- [ ] Diagrama Mermaid del pipeline y flujo de release

## Supuestos y Limites

- Asume que existe al menos un repositorio de codigo con versionamiento (Git)
- No implementa pipelines — disena la estrategia y arquitectura para que el equipo la ejecute
- Feature flag strategy requiere infraestructura de flags (LaunchDarkly, Unleash, custom); si no existe, se recomienda como prerequisito
- Estimaciones de tiempo de pipeline son referenciales y dependen de infraestructura real

## Casos Borde

| Escenario | Estrategia de Manejo |
|---|---|
| Sistema legacy sin tests automatizados | Recomendar estrategia de release conservadora (GitFlow + manual QA gates) con plan paralelo de test automation |
| Microservicios con interdependencias de release | Disenar contract testing + independent deployability assessment por servicio; orquestar releases solo cuando hay breaking changes |
| Regulacion que exige aprobacion manual por release | Incorporar approval gate en pipeline sin eliminar automatizacion; documentar audit trail requerido |
| Equipo de 2 personas sin capacidad para mantener branches | Recomendar trunk-based simplificado con feature flags basicos; evitar overhead de GitFlow |

## Decisiones y Trade-offs

| Decision | Habilita | Restringe | Justificacion |
|---|---|---|---|
| Trunk-based como recomendacion default para equipos maduros | Continuous delivery, menos merge conflicts | Requiere feature flags y test coverage alto | Maximiza velocidad de delivery y reduce riesgo de integracion |
| Canary como patron de deployment preferido | Deteccion temprana de problemas en produccion | Requiere observabilidad madura y rollback automatico | Equilibrio entre velocidad y seguridad; blue-green es fallback si no hay observabilidad |
| Feature flags con lifecycle obligatorio | Previene acumulacion de flags como deuda tecnica | Overhead de gestion de flags | Sin lifecycle, los flags se convierten en condicionales permanentes que degradan el codigo |

## Knowledge Graph

```mermaid
graph TD
    subgraph Core["Release Strategy"]
        A[Branching Strategy] --> B[Pipeline Design]
        B --> C[Quality Gates]
        B --> D[Deployment Patterns]
        D --> E[Rollback Playbook]
        A --> F[Feature Flag Policy]
    end
    subgraph Inputs["Inputs"]
        G[Madurez del Equipo] --> A
        H[Requisitos de Negocio] --> D
        I[Infraestructura Actual] --> B
    end
    subgraph Outputs["Outputs"]
        A --> J[Release Strategy Doc]
        D --> K[Deployment Matrix]
        E --> L[Rollback Playbook]
    end
    subgraph Related["Related Skills"]
        M[developer-experience] -.-> B
        N[software-architecture] -.-> D
        O[governance-framework] -.-> C
    end
```

## Output Templates

**Formato 1 — Markdown (default)**
- Filename: `Release_Strategy_{project}_{WIP|Aprobado}.md`
- Estructura: Assessment actual > Branching strategy > Deployment matrix > Pipeline design > Rollback playbook > Feature flag policy > Metricas
- Incluye diagramas Mermaid de pipeline y sequence de rollback

**Formato 2 — DOCX (playbook operativo)**
- Filename: `Release_Playbook_{project}_{WIP|Aprobado}.docx`
- Estructura: Procedimientos paso a paso de deployment y rollback, checklist pre-release, contactos de escalation
- Optimizado para uso operativo por equipos de SRE/DevOps

**Formato 3 — HTML (bajo demanda)**
- Filename: `{fase}_Release_Strategy_{project}_{WIP}.html`
- Estructura: HTML self-contained branded (Design System MetodologIA v5). Tipo: Light-First Technical. Incluye matriz de deployment patterns por servicio, pipeline design con quality gates, y rollback playbook navegable. WCAG AA, responsive, print-ready.

**Formato 4 — XLSX (bajo demanda)**
- Filename: `{fase}_release_strategy_{cliente}_{WIP}.xlsx`
- Generado via openpyxl con MetodologIA Design System v5. Headers navy con texto blanco Poppins, formato condicional por patron de deployment y estado de quality gate, auto-filtros en todas las columnas, valores calculados sin formulas. Hojas: Deployment Matrix, Pipeline Design, Rollback Playbook, Feature Flag Inventory.

**Formato 5 — PPTX (bajo demanda)**
- Filename: `{fase}_release_strategy_{cliente}_{WIP}.pptx`
- Generado via python-pptx con MetodologIA Design System v5. Slide master con gradiente navy, títulos en Poppins, cuerpo en Montserrat, acentos en gold. Máx 20 slides ejecutivo / 30 técnico. Notas del presentador con referencias de evidencia. Slides: Release Maturity Assessment, Branching Strategy, Deployment Patterns Matrix, Pipeline Design con Quality Gates, Rollback Playbook, Feature Flag Policy, DORA Metrics.

## Evaluacion

| Dimension | Peso | Criterio |
|-----------|------|----------|
| Trigger Accuracy | 10% | Activa triggers correctos ante keywords de release, deployment, CI/CD, rollback |
| Completeness | 25% | Cubre branching, deployment patterns, rollback, pipeline, feature flags y metricas |
| Clarity | 20% | Playbook de rollback es ejecutable paso a paso sin ambiguedad |
| Robustness | 20% | Maneja legacy sin tests, microservicios interdependientes, regulacion estricta |
| Efficiency | 10% | Pipeline design no incluye gates redundantes; proceso escala con variante ejecutiva |
| Value Density | 15% | Cada patron de deployment tiene trade-offs documentados y criterios de seleccion |

**Umbral minimo**: 7/10 en cada dimension para considerar el skill production-ready.

## Cross-References

- **metodologia-developer-experience:** Inner loop metrics impactadas por pipeline design
- **metodologia-software-architecture:** Restricciones arquitectonicas que determinan deployment patterns
- **metodologia-governance-framework:** Quality gates alineados con politicas de gobernanza

---
**Autor:** Javier Montaño · Comunidad MetodologIA | **Version:** 1.0.0

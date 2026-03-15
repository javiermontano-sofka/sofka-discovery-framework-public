# Priming-RAG: Commands Reference
> Sofka Discovery Framework — Referencia completa de 84 comandos
> Procesado: 2026-03-14 | Version: v11.0.0
> Fuente: `$SDF/commands/` (84 archivos .md)

---

## Fuentes procesadas

84 archivos en `~/skills/plugins/sofka-discovery-framework/commands/`:
- 30 comandos primarios (con logica propia)
- 54 aliases (redireccion a primarios)

---

## Valor para discovery y RAG

La referencia de comandos es esencial para: (1) invocar correctamente cualquier capacidad del plugin, (2) entender las rutas del pipeline, (3) conocer los aliases disponibles para UX simplificada, (4) saber que entregable produce cada comando.

---

## Patron de invocacion

```
/sdf:{comando}          — Prefijo oficial
/sdf:{alias}            — Alias corto (mismo efecto)
```

Ejemplos:
- `/sdf:run-auto` = `/sdf:auto` = `/sdf:discovery-auto`
- `/sdf:diagnose-asis` = `/sdf:asis` = `/sdf:diagnose`
- `/sdf:assess-architecture` = `/sdf:arch` = `/sdf:architecture-deep-dive`

---

## Pipeline Flows (4)

Flujos completos que ejecutan multiples entregables en secuencia.

| Comando | Invocacion | Entregables | Modo HITL | Descripcion |
|---------|------------|-------------|-----------|-------------|
| **run-guided** | `/sdf:run-guided` | 16 (completo) | Cocreado | Pipeline completo con validacion humana en cada gate |
| **run-auto** | `/sdf:run-auto` | 16 (completo) | Desatendido | Pipeline autonomo, sin pausas, ideal para overnight |
| **run-express** | `/sdf:run-express` | 5 (core) | Minimal | Pipeline express: brief, asis, scenarios, roadmap, pitch |
| **run-deep** | `/sdf:run-deep` | 16 + assessments | Exhaustivo | Pipeline deep con assessments adicionales por dominio |

Aliases de flows:
- `guide` -> run-guided
- `auto` -> run-auto
- `express` -> run-express
- `deep` -> run-deep
- `discovery` -> run-guided
- `discovery-auto` -> run-auto
- `intermediate` -> run-guided (modo intermedio, 8 entregables)

---

## Deliverables (17)

Comandos que producen un entregable individual del pipeline.

| # | Comando | Invocacion | Entregable | Aliases |
|---|---------|------------|------------|---------|
| 00 | **generate-plan** | `/sdf:generate-plan` | 00_Discovery_Plan.md | `plan` |
| 00b | **map-stakeholders** | `/sdf:map-stakeholders` | 00b_Stakeholder_Map.md | `stakeholders` |
| 01 | **generate-brief** | `/sdf:generate-brief` | 01_Client_Brief.md | `brief` |
| 02 | **diagnose-asis** | `/sdf:diagnose-asis` | 02_ASIS_Diagnosis.md | `asis`, `diagnose` |
| 03 | **trace-flows** | `/sdf:trace-flows` | 03_Flow_Mapping.md | `flows`, `trace` |
| 04 | **evaluate-scenarios** | `/sdf:evaluate-scenarios` | 04_Scenarios_TOBE.md | `scenarios`, `evaluate` |
| 05 | **validate-feasibility** | `/sdf:validate-feasibility` | 05_Feasibility.md | `feasibility`, `validate` |
| 06 | **chart-roadmap** | `/sdf:chart-roadmap` | 06_Roadmap.md | `roadmap`, `chart` |
| 07 | **write-spec** | `/sdf:write-spec` | 07_Functional_Spec.md | `spec` |
| 08 | **craft-pitch** | `/sdf:craft-pitch` | 08_Executive_Pitch.md | `pitch`, `craft` |
| 09 | **deliver-handover** | `/sdf:deliver-handover` | 09_Handover_Package.md | `handover`, `deliver` |
| 10 | **present-findings** | `/sdf:present-findings` | 10_Findings_Deck.md | `findings`, `findings-deck` |
| 11 | **report-tech** | `/sdf:report-tech` | 11_Technical_Report.md | `tech`, `technical-findings` |
| 12 | **report-func** | `/sdf:report-func` | 12_Functional_Report.md | `func`, `functional-findings` |
| 13 | **review-business** | `/sdf:review-business` | 13_Business_Review.md | `biz`, `business-review`, `discovery-review` |
| 14 | **discover-ai** | `/sdf:discover-ai` | 14_AI_Opportunities.md | `ai`, `ai-discovery`, `ai-opportunities` |
| 15 | **benchmark-maturity** | `/sdf:benchmark-maturity` | 15_Maturity_Benchmark.md | (ninguno adicional) |

---

## Assessments (5)

Deep-dives independientes. Pueden ejecutarse standalone o como complemento.

| Comando | Invocacion | Entregable | Aliases | Foco |
|---------|------------|------------|---------|------|
| **assess-architecture** | `/sdf:assess-architecture` | Architecture_Assessment.md | `arch`, `architecture-deep-dive` | C4, ISO 25010, deuda tecnica, ADRs |
| **assess-data** | `/sdf:assess-data` | Data_Assessment.md | `data`, `data-landscape` | Madurez de datos, governance, calidad |
| **assess-cloud** | `/sdf:assess-cloud` | Cloud_Assessment.md | `cloud`, `cloud-readiness` | Cloud readiness, migracion, 7Rs |
| **assess-security** | `/sdf:assess-security` | Security_Assessment.md | `security`, `security-posture` | Postura de seguridad, threat model |
| **assess-change** | `/sdf:assess-change` | Change_Assessment.md | `change`, `change-readiness` | Change readiness, adopcion |

---

## Operations (4)

Operan sobre discoveries existentes (requieren output/ previo).

| Comando | Invocacion | Funcion | Aliases |
|---------|------------|---------|---------|
| **audit-quality** | `/sdf:audit-quality` | Auditoria de calidad del pipeline completo | `audit` |
| **improve-deliverables** | `/sdf:improve-deliverables` | Mejora iterativa de entregables existentes | `improve`, `discovery-improve` |
| **rescue-stalled** | `/sdf:rescue-stalled` | Rescate de discovery estancado | `rescue` |
| **simulate-scenarios** | `/sdf:simulate-scenarios` | Simulacion what-if sobre escenarios | (ninguno) |

---

## Service Discovery (4)

Comandos especializados por tipo de servicio.

| Comando | Invocacion | TIPO_SERVICIO | Aliases |
|---------|------------|---------------|---------|
| **qa-discovery** (alias) | `/sdf:qa-discovery` | QA | — |
| **rpa-discovery** (alias) | `/sdf:rpa-discovery` | RPA | — |
| **ai-discovery** (alias) | `/sdf:ai-discovery` | Data-AI | — |
| **transformation** (alias) | `/sdf:transformation` | Digital-Transformation | — |

---

## Tabla completa de aliases (54)

| Alias | Mapea a | Categoria |
|-------|---------|-----------|
| guide | run-guided | Flow |
| auto | run-auto | Flow |
| express | run-express | Flow |
| deep | run-deep | Flow |
| discovery | run-guided | Flow |
| discovery-auto | run-auto | Flow |
| intermediate | run-guided (8 entregables) | Flow |
| plan | generate-plan | Deliverable |
| stakeholders | map-stakeholders | Deliverable |
| brief | generate-brief | Deliverable |
| asis | diagnose-asis | Deliverable |
| diagnose | diagnose-asis | Deliverable |
| flows | trace-flows | Deliverable |
| trace | trace-flows | Deliverable |
| scenarios | evaluate-scenarios | Deliverable |
| evaluate | evaluate-scenarios | Deliverable |
| feasibility | validate-feasibility | Deliverable |
| validate | validate-feasibility | Deliverable |
| roadmap | chart-roadmap | Deliverable |
| chart | chart-roadmap | Deliverable |
| spec | write-spec | Deliverable |
| pitch | craft-pitch | Deliverable |
| craft | craft-pitch | Deliverable |
| handover | deliver-handover | Deliverable |
| deliver | deliver-handover | Deliverable |
| findings | present-findings | Deliverable |
| findings-deck | present-findings | Deliverable |
| tech | report-tech | Deliverable |
| technical-findings | report-tech | Deliverable |
| func | report-func | Deliverable |
| functional-findings | report-func | Deliverable |
| biz | review-business | Deliverable |
| business-review | review-business | Deliverable |
| discovery-review | review-business | Deliverable |
| ai | discover-ai | Deliverable |
| ai-discovery | discover-ai | Deliverable |
| ai-opportunities | discover-ai | Deliverable |
| arch | assess-architecture | Assessment |
| architecture-deep-dive | assess-architecture | Assessment |
| data | assess-data | Assessment |
| data-landscape | assess-data | Assessment |
| cloud | assess-cloud | Assessment |
| cloud-readiness | assess-cloud | Assessment |
| security | assess-security | Assessment |
| security-posture | assess-security | Assessment |
| change | assess-change | Assessment |
| change-readiness | assess-change | Assessment |
| audit | audit-quality | Operation |
| improve | improve-deliverables | Operation |
| discovery-improve | improve-deliverables | Operation |
| rescue | rescue-stalled | Operation |
| transformation | run-deep (DT) | Service |
| qa-discovery | discover (QA) | Service |
| rpa-discovery | discover (RPA) | Service |

---

## Key takeaways

1. 30 comandos primarios + 54 aliases = 84 total
2. 4 flujos de pipeline (guided, auto, express, deep) cubren todos los modos de ejecucion
3. 17 entregables individuales invocables por separado
4. 5 assessments standalone para deep-dives especializados
5. 4 operaciones para ciclos de mejora sobre discoveries existentes
6. Cada comando primario tiene al menos 1 alias para UX simplificada
7. Verbos de naming: run, generate, map, diagnose, trace, evaluate, validate, chart, write, craft, deliver, present, report, review, discover, assess, audit, improve, rescue, simulate, benchmark

---

## Keywords y hashtags

`#comandos` `#pipeline` `#entregables` `#assessments` `#operaciones` `#aliases` `#invocacion` `#flujos` `#sdf` `#sage` `#discovery`

---

## Query hooks

- "Como inicio un discovery?" -> run-guided o run-auto
- "Que comandos hay?" -> 84 (30 primary + 54 aliases)
- "Cual es el alias de diagnose-asis?" -> asis, diagnose
- "Como hago un assessment de arquitectura?" -> /sdf:assess-architecture
- "Que entregables produce el pipeline?" -> 16 (00 a 15)
- "Como rescato un discovery estancado?" -> /sdf:rescue-stalled

# Waterfall Framework Design — Acme Corp PMO

> **Organización:** Acme Corp PMO | **Fecha:** 15 de marzo de 2026
> **Madurez actual:** Nivel 2.7 | **Target:** Nivel 4.0
> **Alcance:** 12 proyectos activos, 3 tipos de proyecto (IT, Infraestructura, Producto)

---

## Stage-Gate Architecture

El framework implementa 5 gates con criterios objetivos y medibles. Cada gate requiere aprobación del Steering Committee (proyectos >50 FTE-meses) o del PMO Director (proyectos menores). [PLAN]

| Gate | Nombre | Criterios Clave | Aprobador |
|:----:|--------|----------------|-----------|
| G0 | Concepto | Business case preliminar, alineamiento estratégico | PMO Director [DECISION] |
| G1 | Charter | Charter aprobado, stakeholders identificados, presupuesto asignado | Sponsor [DECISION] |
| G1.5 | Plan | WBS completo (100% rule), schedule baseline, riesgos top-10 | PMO Director [PLAN] |
| G2 | Ejecución | Equipo asignado, ambiente listo, kick-off completado | PM + Sponsor [PLAN] |
| G3 | Cierre | Entregables aceptados, lecciones capturadas, transición completada | Steering Committee [METRIC] |

---

## Process Template Library

| Grupo de Procesos | Template | Formato | Variante Lite |
|-------------------|----------|---------|:------------:|
| Initiating | Project Charter | Markdown, 2 páginas | 1 página |
| Initiating | Stakeholder Register | Tabla + engagement map | Solo tabla |
| Planning | WBS Dictionary | Tabla jerárquica | Nivel 2 máximo |
| Planning | Schedule Baseline | Gantt + milestones | Solo milestones |
| Planning | Risk Register | P×I matrix + responses | Top-10 only |
| Executing | Status Report | RAG dashboard + EVM | RAG only |
| Executing | Change Request | Impact analysis + CCB form | Simplified |
| M&C | EVM Dashboard | SPI, CPI, EAC, TCPI | SPI + CPI only |
| M&C | Variance Report | Threshold-triggered | Monthly |
| Closing | Lessons Learned | Workshop template | Retrospective |
| Closing | Acceptance Sign-off | Checklist + signatures | Email approval |

---

## Tailoring Matrix

| Tipo Proyecto | Gate Model | Templates | EVM | Governance |
|--------------|:---------:|:---------:|:---:|:----------:|
| IT (<6 meses) | G1, G2, G3 | Lite | No | Bi-weekly [PLAN] |
| IT (6-18 meses) | Full 5 gates | Standard | Yes | Weekly [PLAN] |
| Infraestructura | Full + sub-gates | Full + compliance | Yes | Weekly + audit [PLAN] |
| Producto | Full 5 gates | Standard + market | Yes | Bi-weekly [PLAN] |

---

## EVM Baseline Configuration

```
Performance Measurement Baseline (PMB):
- Scope baseline: WBS Dictionary v1.0 (100% rule verified)
- Schedule baseline: MS Project export, milestone-weighted
- Cost baseline: Bottom-up estimate by work package

Control Account Structure:
- CA Level: WBS Level 2 (Phase/Deliverable)
- CA Manager: Work Package Owner
- Reporting frequency: Weekly (SPI, CPI, EAC)

Thresholds:
- SPI < 0.90 or > 1.10 → Variance report required [METRIC]
- CPI < 0.90 → Escalation to PMO Director [METRIC]
- EAC > BAC × 1.10 → Steering Committee notification [METRIC]
```

---

## Rollout Plan

| Fase | Actividad | Timeline | Criterio de Éxito |
|:----:|----------|----------|-------------------|
| 1 | Template library deployment + PM training | Abr 2026 | 100% PMs trained [SCHEDULE] |
| 2 | CCB establishment + change process | Abr 2026 | First 3 CRs processed [METRIC] |
| 3 | Stage-gate criteria + pilot (3 projects) | May 2026 | 3 projects through G1.5 [METRIC] |
| 4 | EVM pilot (3 projects) | Jun 2026 | Weekly SPI/CPI reporting [METRIC] |
| 5 | Full rollout + compliance audit | Jul 2026 | ≥80% compliance [METRIC] |

---

## Success Metrics

| Metric | Baseline (Mar 2026) | Target (Dec 2026) | Measurement |
|--------|:-------------------:|:-----------------:|-------------|
| Template adoption | 40% | 90% | Artifact audit [METRIC] |
| Gate compliance | 60% rubber-stamp | 90% evidence-based | Gate review logs [METRIC] |
| Schedule predictability | ±30% | ±15% | SPI variance [METRIC] |
| Change control | Verbal | 100% via CCB | CR log [METRIC] |

---

*PMO-APEX v1.0 — Framework Design · Acme Corp*

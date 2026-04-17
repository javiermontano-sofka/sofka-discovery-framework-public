# Body of Knowledge — PMO Setup

> PMO-APEX Skill: `pmo-setup` · Dominio: PMO Design & Implementation
> Última actualización: 2026-03-17

---

## 1. Fundamentos Teóricos

### 1.1 Tipos de PMO
| Tipo | Autoridad | Servicios Principales | Cultura Ideal |
|------|-----------|----------------------|---------------|
| **Supportive** | Baja (consultivo) | Templates, best practices, training, mentoring | Autónoma, equipos maduros |
| **Controlling** | Media (compliance) | Standards enforcement, governance, reporting, auditing | En maduración, necesita estructura |
| **Directive** | Alta (gestión directa) | PM assignment, project delivery management, resource control | Baja madurez, necesita dirección |

### 1.2 PMO Charter Components
Un charter de PMO efectivo incluye [DOC]:
1. **Mission** — Propósito del PMO en lenguaje de valor
2. **Scope** — Qué proyectos/programas gobierna
3. **Authority** — Nivel de autoridad para decisiones
4. **Services** — Catálogo de servicios con SLAs
5. **Governance** — Estructura de governance y reporting
6. **Success Metrics** — KPIs que demuestran valor del PMO
7. **Review Cadence** — Frecuencia de revisión del charter

### 1.3 Service Catalog Design
Los servicios de un PMO se organizan en capas [DOC]:

**Capa Foundation (siempre activa)**
- Standards & Templates
- Reporting & Dashboards
- Project Governance (gates)

**Capa Development (según madurez)**
- Methodology Guidance & Coaching
- Training & Competency Development
- Tool Administration & Support

**Capa Strategic (madurez alta)**
- Portfolio Management & Prioritization
- Resource Optimization
- Strategic Alignment & Benefits Realization
- Vendor Management

## 2. Operating Model Design

### 2.1 Estructura Organizacional
| Modelo | Descripción | Pros | Contras |
|--------|-------------|------|---------|
| Centralizado | PMO único para toda la organización | Consistencia, economía de escala | Lejanía de equipos |
| Descentralizado | PMOs por BU o departamento | Cercanía, adaptación local | Inconsistencia, duplicación |
| Federado | PMO central + PMOs locales | Balance de consistencia y cercanía | Complejidad de coordinación |
| Hub-and-Spoke | PMO central define standards, locales ejecutan | Standards + adaptación | Requiere governance de federation |

### 2.2 Roles del PMO
| Rol | Responsabilidad | FTE Típico |
|-----|----------------|------------|
| PMO Head/Director | Strategy, governance, executive reporting | 1.0 |
| PM Analyst | Data analysis, dashboards, reporting | 0.5-2.0 |
| PM Coach/Mentor | Methodology guidance, team support | 0.5-1.0 |
| Tool Administrator | PM tool configuration, support | 0.5-1.0 |
| Portfolio Analyst | Portfolio prioritization, strategic alignment | 0.5-1.0 |

### 2.3 Staffing Guidelines
Ratio típico: 1 FTE de PMO por cada 8-12 PMs gestionados [METRIC].
PMO startup mínimo: 2-3 FTEs (Head + 1-2 analysts) [PLAN].

## 3. Implementation Roadmap

### 3.1 Phased Rollout
- **Phase 0 (Pre-launch, 1 mes)**: Charter approval, team hiring, stakeholder comms
- **Phase 1 (Quick wins, 1-3 meses)**: Templates, basic reporting, governance calendar
- **Phase 2 (Foundation, 3-6 meses)**: Tool deployment, methodology guides, training
- **Phase 3 (Maturity, 6-12 meses)**: Portfolio management, advanced reporting, coaching
- **Phase 4 (Excellence, 12+ meses)**: Predictive analytics, continuous improvement

### 3.2 Success Metrics por Fase
| Fase | Métrica | Target |
|------|---------|--------|
| Phase 1 | Template adoption rate | > 60% |
| Phase 2 | Methodology compliance | > 70% |
| Phase 3 | Project success rate improvement | +15% vs. baseline |
| Phase 4 | Stakeholder satisfaction | > 4.0/5.0 |

## 4. Governance Framework

### 4.1 PMO Governance Bodies
- **Portfolio Board**: Decisiones de priorización e inversión (mensual)
- **Steering Committee**: Oversight de proyectos clave (quincenal)
- **PMO Review Board**: Evaluación de PMO performance (trimestral)

### 4.2 Reporting Cadence
| Reporte | Audiencia | Frecuencia |
|---------|-----------|-----------|
| Portfolio Dashboard | C-level | Mensual |
| Project Status | Sponsors | Semanal/Quincenal |
| PMO Health Check | PMO Director | Trimestral |
| Resource Utilization | Resource Managers | Semanal |

## 5. Anti-patrones

| Anti-patrón | Consecuencia | Corrección |
|-------------|-------------|------------|
| PMO sin charter | Sin autoridad ni boundaries | Charter formal antes de operar |
| Empezar por tools | Tool-driven, no value-driven | Empezar por governance y processes |
| PMO all-at-once | Overwhelm, resistencia | Phased rollout con quick wins |
| PMO como policía | Resistencia de equipos | Balance governance + service |
| Sin success metrics | No demuestra ROI | Metrics from day 1 |

## 6. Referencias Bibliográficas

- PMI (2021). *PMBOK Guide 7th Edition* — PMO as organizational enabler.
- Hill, G. (2014). *The Complete Project Management Office Handbook* — 3rd Edition.
- Hobbs, B. & Aubry, M. (2010). *The Project Management Office (PMO): A Quest for Understanding*.
- Bolles, D. & Hubbard, D. (2015). *The Power of Enterprise-Wide Project Management*.
- Gartner (2023). *How to Set Up a Successful PMO* — Research note.

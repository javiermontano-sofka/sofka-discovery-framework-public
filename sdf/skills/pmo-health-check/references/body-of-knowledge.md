# Body of Knowledge — PMO Health Check

> PMO-APEX Skill: `pmo-health-check` · Dominio: PMO Internal Diagnostics
> Última actualización: 2026-03-17

---

## 1. Fundamentos Teóricos

### 1.1 Health Check vs. Assessment
Un health check es un diagnóstico operativo periódico (trimestral) que mide el estado actual del PMO contra sus propios KPIs. Se diferencia del PMO assessment (evaluación estratégica) en que es interno, frecuente, y orientado a corrección operativa — no a transformación [DOC].

### 1.2 Las 8 Dimensiones Operativas
| # | Dimensión | Pregunta Clave |
|---|-----------|---------------|
| 1 | Governance Effectiveness | Los gates se cumplen con rigor? |
| 2 | Resource Utilization | El equipo PMO está sobreasignado o subutilizado? |
| 3 | Methodology Compliance | Los proyectos siguen las metodologías declaradas? |
| 4 | Reporting Accuracy | Los reportes reflejan la realidad? |
| 5 | Stakeholder Satisfaction | Los stakeholders internos están satisfechos? |
| 6 | Risk Management | Los riesgos se identifican y responden a tiempo? |
| 7 | Financial Oversight | El tracking financiero es preciso y oportuno? |
| 8 | Continuous Improvement | Las lecciones aprendidas se aplican? |

### 1.3 RAG Scoring
Cada dimensión recibe un status RAG (Blue/Amber/Red — nunca verde, per APEX branding):
- **Blue** (#2563EB): Dimensión saludable, KPIs dentro de umbral
- **Amber** (#F59E0B): Dimensión en riesgo, requiere atención
- **Red** (critical): Dimensión en crisis, acción correctiva inmediata

## 2. KPIs por Dimensión

### 2.1 Governance Effectiveness
- Gate compliance rate (% de gates ejecutados vs. programados) [METRIC]
- Average gate prep time (días de preparación por gate) [METRIC]
- Conditional GO resolution rate (% de condiciones resueltas en deadline) [METRIC]

### 2.2 Resource Utilization
- PMO team utilization rate (target: 75-85%) [METRIC]
- Skill coverage index (roles cubiertos / roles requeridos) [METRIC]
- Bottleneck frequency (número de cuellos de botella por trimestre) [METRIC]

### 2.3 Methodology Compliance
- Methodology adherence score (% de proyectos en compliance) [METRIC]
- Template adoption rate (% de proyectos usando templates PMO) [METRIC]
- Methodology mismatch count (proyectos con metodología inadecuada) [METRIC]

### 2.4 Reporting Accuracy
- Data accuracy rate (% de datos que coinciden con fuente) [METRIC]
- Report delivery timeliness (% de reportes entregados on-time) [METRIC]
- Executive report actionability score (survey) [METRIC]

### 2.5 Stakeholder Satisfaction
- Internal NPS (Net Promoter Score del PMO) [METRIC]
- Service request response time (horas promedio) [METRIC]
- Escalation satisfaction rate (% satisfecho con resolución) [METRIC]

### 2.6 Risk Management
- Risk identification rate (riesgos identificados pre-materialización) [METRIC]
- Risk response effectiveness (% de respuestas exitosas) [METRIC]
- Risk materialization rate (% de riesgos que se materializaron) [METRIC]

### 2.7 Financial Oversight
- Budget tracking accuracy (variance entre tracked y actual) [METRIC]
- Forecast reliability (variance entre forecast y actual) [METRIC]
- Cost variance alert timeliness (días entre detección y alerta) [METRIC]

### 2.8 Continuous Improvement
- Lessons learned capture rate (% de proyectos con lecciones) [METRIC]
- Lessons applied rate (% de lecciones implementadas) [METRIC]
- Improvement actions completed (% completadas vs. identificadas) [METRIC]

## 3. Trend Analysis

### 3.1 Quarter-over-Quarter Trending
Cada dimensión se compara con el trimestre anterior usando indicadores:
- Mejorando (score subió >= 0.3 puntos)
- Estable (score varió < 0.3 puntos)
- Declinando (score bajó >= 0.3 puntos)

### 3.2 Pattern Detection
- **Structural pattern**: Misma dimensión amber/red por 3+ trimestres → intervención estructural
- **Systemic pattern**: 3+ dimensiones red simultáneamente → crisis PMO sistémica
- **Compensatory pattern**: Una dimensión mejora mientras otra declina → rebalanceo necesario

## 4. Corrective Action Framework

### 4.1 Severity-Based Response
| Severity | Trigger | Response Time | Authority |
|----------|---------|---------------|-----------|
| Bajo | Dimensión amber (primera vez) | 30 días | PMO Lead |
| Medio | Dimensión amber (2 trimestres consecutivos) | 15 días | PMO Director |
| Alto | Dimensión red | 7 días | PMO Director + Sponsor |
| Crítico | 3+ dimensiones red | Inmediato | Steering Committee |

## 5. Referencias Bibliográficas

- PMI (2021). *Organizational Project Management Maturity Model (OPM3)*.
- Gartner (2023). *PMO Effectiveness Assessment Framework*.
- Hill, G. (2014). *The Complete Project Management Office Handbook* — Ch. 15: PMO Health Monitoring.
- Hobbs, B. & Aubry, M. (2010). *The Project Management Office: A Quest for Understanding*.

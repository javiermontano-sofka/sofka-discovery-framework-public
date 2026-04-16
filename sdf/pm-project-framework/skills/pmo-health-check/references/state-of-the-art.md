# State of the Art — PMO Health Check

> PMO-APEX Skill: `pmo-health-check` · Tendencias 2024-2026
> Última actualización: 2026-03-17

---

## Tendencias Actuales

### 1. Real-Time PMO Dashboards
PMOs maduros reemplazan health checks trimestrales discretos con dashboards en tiempo real que monitorean las 8 dimensiones continuamente. El health check trimestral se convierte en una revisión del dashboard, no en una recolección de datos [INFERENCIA].

### 2. Pulse Surveys
Encuestas cortas (5-7 preguntas) ejecutadas mensualmente reemplazan las encuestas anuales extensas. Permiten detectar tendencias de satisfacción más rápido y con menos fatiga de encuesta [DOC].

### 3. Automated KPI Collection
Los KPIs operativos (utilización, compliance, reporting timeliness) se recolectan automáticamente de herramientas PM, eliminando el sesgo de auto-reporte y reduciendo el esfuerzo de recolección [INFERENCIA].

### 4. Predictive Health Indicators
Modelos de ML identifican patrones que predicen declive en dimensiones antes de que ocurra: velocidad de cierre de acciones correctivas, tendencia de respuesta a encuestas, y patterns de escalación son indicadores adelantados [INFERENCIA].

### 5. Peer PMO Benchmarking Networks
Redes de PMOs en industrias similares comparten datos anónimos de health check para benchmarking entre pares, proporcionando contexto externo al diagnóstico interno [DOC].

## Herramientas Emergentes

| Herramienta | Categoría | Relevancia APEX |
|-------------|-----------|-----------------|
| Power BI Embedded | Dashboard real-time | 8-dimension health view |
| SurveyMonkey Pulse | Micro-surveys | Monthly satisfaction tracking |
| Jira REST API | Automated data collection | Compliance & utilization data |
| Tableau | Advanced analytics | Trend analysis & forecasting |
| Custom health bots | Automated alerts | Threshold breach notifications |

## Gaps Identificados

1. **Qualitative dimensions** (stakeholder satisfaction, continuous improvement) son difíciles de automatizar y frecuentemente quedan con datos desactualizados [SUPUESTO].
2. **Health check fatigue**: PMOs pequeños perciben el health check como overhead — necesitan versiones lightweight [INFERENCIA].
3. **Action follow-through**: El tracking de acciones correctivas post-health check tiene baja tasa de completitud (~55%) en la industria [METRIC].

## Benchmarks de Industria

- PMOs con health checks trimestrales tienen **35% mayor satisfacción interna** que sin health checks [METRIC].
- Dimensión con menor score promedio en la industria: **Continuous Improvement** (2.4/5.0) [METRIC].
- Acciones correctivas completadas a tiempo: **55% promedio** de industria [METRIC].

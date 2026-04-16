# Body of Knowledge — Portfolio Prioritization

> PMO-APEX Skill: `portfolio-prioritization` · Dominio: Multi-Criteria Decision Analysis
> Última actualización: 2026-03-17

---

## 1. Fundamentos Teóricos

### 1.1 Multi-Criteria Decision Analysis (MCDA)
MCDA aplica un framework estructurado para evaluar alternativas contra múltiples criterios con pesos diferenciados. Transforma decisiones subjetivas en evaluaciones transparentes y reproducibles [DOC].

### 1.2 Weighted Scoring Model
El modelo de scoring ponderado es el método más común:
1. Definir criterios de evaluación (4-7 típicamente)
2. Asignar pesos por criterio (sum = 100%)
3. Definir escala de scoring (1-5 o 1-10) con rubrics
4. Scorar cada proyecto contra cada criterio
5. Calcular score ponderado = sum(score_i x peso_i)
6. Rankear proyectos por score ponderado

### 1.3 Efficient Frontier
La efficient frontier identifica la combinación óptima de proyectos que maximiza valor total dentro de constraints (budget, recursos). Proviene de la teoría de portfolio de Markowitz adaptada a project portfolio management [DOC].

### 1.4 Criterios Típicos de Priorización
| Criterio | Descripción | Peso Típico |
|----------|-------------|-------------|
| Strategic Alignment | Conexión con objetivos estratégicos | 25-35% |
| Financial Return | NPV, ROI, payback period | 20-30% |
| Risk | Probability-adjusted risk exposure | 15-20% |
| Capability Fit | Competencias internas disponibles | 10-15% |
| Urgency/Time Sensitivity | Ventana de oportunidad, regulación | 5-15% |

## 2. Métodos Avanzados

### 2.1 Analytic Hierarchy Process (AHP)
AHP de Saaty usa comparaciones pareadas para derivar pesos de criterios y scores de alternativas. Más riguroso que asignación directa de pesos pero más complejo [DOC].

### 2.2 Portfolio Optimization
Programación lineal o integer programming para encontrar el portfolio que maximiza valor sujeto a constraints múltiples. Requiere datos cuantitativos de valor y costo por proyecto [DOC].

### 2.3 Bubble Charts
Visualización de portafolio en 2 ejes (típicamente value vs. risk) con tamaño de burbuja representando inversión. Facilita identificación visual de quadrants [DOC].

## 3. Sensitivity Analysis

### 3.1 Weight Sensitivity
Variar pesos de criterios en rangos de +/- 10-20% y verificar estabilidad del ranking. Si el top 3 cambia con variaciones menores, el modelo es frágil [METRIC].

### 3.2 Score Sensitivity
Variar scores individuales en +/- 1 punto y verificar impacto en ranking. Identifica proyectos en "zona de decisión" donde pequeños cambios alteran el resultado [METRIC].

## 4. Governance de Priorización

### 4.1 Pre-Scoring Agreement
Los criterios y pesos DEBEN ser acordados por stakeholders ANTES de ver los scores. Cambiar criterios después de ver resultados invalida el proceso [STAKEHOLDER].

### 4.2 Scoring Independence
Idealmente, múltiples scorers independientes evalúan cada proyecto. Las varianzas entre scorers se discuten para calibración, no para presionar [PLAN].

### 4.3 Transparency
Todo el proceso de scoring es documentado y reproducible. Un reviewer independiente debe poder llegar a los mismos resultados con los mismos inputs [PLAN].

## 5. Anti-patrones

| Anti-patrón | Consecuencia | Corrección |
|-------------|-------------|------------|
| HiPPO prioritization | Portafolio refleja poder, no estrategia | Scoring model transparente |
| Criteria after scoring | Bias de confirmación | Criteria ANTES de scoring |
| Sunk cost bias | Proyectos viejos priorizados por inercia | Scoring de mérito actual, no inversión pasada |
| Too many criteria | Dilución, complejidad | Máximo 7 criterios |
| No sensitivity analysis | Confianza falsa en ranking | Sensitivity obligatoria |

## 6. Referencias Bibliográficas

- Cooper, R.G. et al. (2001). *Portfolio Management for New Products*.
- Saaty, T.L. (2008). *Decision Making with the Analytic Hierarchy Process*.
- Markowitz, H. (1952). *Portfolio Selection* — adapted for project portfolios.
- PMI (2017). *The Standard for Portfolio Management* — 4th Edition.
- Levine, H.A. (2005). *Project Portfolio Management: A Practical Guide*.

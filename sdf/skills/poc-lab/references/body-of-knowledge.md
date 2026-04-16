# Body of Knowledge — PoC Lab

> PMO-APEX Skill: `poc-lab` · Dominio: Controlled Experimentation for PM Tools & Methodologies
> Última actualización: 2026-03-17

---

## 1. Fundamentos Teóricos

### 1.1 Proof of Concept vs. Pilot vs. Prototype
| Concepto | Objetivo | Duración | Output |
|----------|----------|----------|--------|
| **PoC** | Validar viabilidad técnica | 1-4 semanas | Evidencia de factibilidad |
| **Pilot** | Validar operación a escala limitada | 1-3 meses | Métricas de rendimiento |
| **Prototype** | Demostrar funcionalidad | 2-6 semanas | Artefacto funcional |

### 1.2 Método Científico Aplicado a PM
Un PoC sigue el método científico adaptado [DOC]:
1. **Hipótesis** — Pregunta falsifiable que el PoC responderá
2. **Diseño experimental** — Variables controladas, grupo de control si aplica
3. **Ejecución** — Time-boxed con recolección de datos
4. **Análisis** — Comparación contra criterios de éxito predefinidos
5. **Conclusión** — Evidencia que soporta o refuta la hipótesis

### 1.3 Decision Framework
Los resultados del PoC alimentan una decisión de inversión:
- **GO**: Criterios de éxito cumplidos → proceder a implementación
- **NO-GO**: Criterios no cumplidos → buscar alternativas
- **PIVOT**: Resultados parciales → ajustar approach y re-evaluar
- **EXTEND**: Inconcluso → ampliar time-box con scope específico

## 2. Diseño de PoC

### 2.1 Scope Constraint
El scope del PoC debe ser el mínimo necesario para validar la hipótesis:
- Máximo 2-4 opciones evaluadas simultáneamente
- Time-box de 2-4 semanas (no meses)
- Equipo piloto de 3-8 personas
- Datos de prueba representativos pero limitados

### 2.2 Success Criteria Design
Cada criterio debe ser [DOC]:
- **Medible** — Escala cuantitativa definida
- **Observable** — Evidencia recolectable durante el PoC
- **Relevante** — Conectado a la decisión de inversión
- **Acordado** — Decision-makers aceptan los criterios ANTES de la ejecución

### 2.3 Variable Control
Para que la comparación sea válida:
- Mismo equipo evalúa todas las opciones
- Mismo periodo de tiempo por opción
- Mismos datos de prueba
- Mismos criterios de evaluación
- Documentar variables que no se pueden controlar

## 3. Tipos de PoC en PM

### 3.1 Tool Evaluation
| Fase | Actividad | Output |
|------|-----------|--------|
| Setup | Sandbox instances, test data | Ambientes listos |
| Execution | Team usa cada tool por 1-2 semanas | Usage logs, feedback |
| Evaluation | Score por criterio por tool | Evaluation matrix |
| Decision | Presentación a decision-makers | GO/NO-GO recommendation |

### 3.2 Methodology Pilot
| Fase | Actividad | Output |
|------|-----------|--------|
| Design | Select pilot team, define metrics | Pilot charter |
| Execution | 2-sprint pilot with new methodology | Sprint data, retros |
| Measurement | Compare vs. baseline performance | Comparison report |
| Decision | Scale-up recommendation | GO/NO-GO with conditions |

### 3.3 Process Innovation
| Fase | Actividad | Output |
|------|-----------|--------|
| Hypothesis | Define what process change will improve | Hypothesis document |
| Design | Small-scale experiment design | Experiment protocol |
| Execution | Time-boxed experiment | Observation data |
| Analysis | Statistical comparison | Results report |

## 4. Scale-Up Risk Assessment

Factores que cambian al escalar del PoC a producción [PLAN]:
- **Volume**: Más usuarios, más datos, más transacciones
- **Complexity**: Integraciones, customizaciones, edge cases
- **Resistance**: Change management a escala organizacional
- **Support**: Training, help desk, documentation
- **Cost**: Licencias enterprise vs. trial, implementation services

## 5. Anti-patrones

| Anti-patrón | Consecuencia | Corrección |
|-------------|-------------|------------|
| PoC sin hipótesis | Exploración sin dirección | Definir pregunta falsifiable |
| PoC scope creep | Se convierte en mini-proyecto | Hard time-box y scope limit |
| Criterios post-hoc | Bias de confirmación | Criterios ANTES de evaluar |
| Ignorar scale-up risk | PoC success ≠ production success | Documentar explícitamente |
| Vendor-run PoC | Sesgo del vendor | Equipo interno ejecuta |

## 6. Referencias Bibliográficas

- Thomke, S. (2020). *Experimentation Works* — Business experimentation methodology.
- Ries, E. (2011). *The Lean Startup* — MVP and experiment-driven development.
- PMI (2021). *PMBOK Guide 7th Edition* — Decision management and uncertainty.
- Bland, D. & Osterwalder, A. (2019). *Testing Business Ideas* — Experiment design.

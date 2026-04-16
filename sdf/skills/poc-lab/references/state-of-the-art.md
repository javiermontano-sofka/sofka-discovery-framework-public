# State of the Art — PoC Lab

> PMO-APEX Skill: `poc-lab` · Tendencias 2024-2026
> Última actualización: 2026-03-17

---

## Tendencias Actuales

### 1. Experiment-as-a-Service
Organizaciones maduras ofrecen PoC como servicio interno: sandbox environments preconfigurados, evaluation templates, y facilitación de decisiones. Reduce el tiempo de setup de semanas a días [INFERENCIA].

### 2. AI-Assisted Tool Evaluation
IA compara features de herramientas PM automáticamente, genera matrices de evaluación, y simula workflows en diferentes tools. Reduce el sesgo humano en evaluaciones [INFERENCIA].

### 3. Continuous Experimentation
En lugar de PoCs discretos, organizaciones establecen capacity permanente para experimentación: equipos de innovación, budget de experimentación, y cadencia de evaluación trimestral [DOC].

### 4. Remote-First PoC Design
PoCs diseñados para equipos distribuidos: evaluación asíncrona, herramientas cloud-first, y métricas de experiencia remota como criterio de evaluación [DOC].

### 5. Data-Driven Tool Selection
Decisiones de herramientas basadas en datos de uso (telemetry, adoption rates, user satisfaction) más que en feature comparison o vendor demos [INFERENCIA].

## Herramientas Emergentes

| Herramienta | Categoría | Relevancia APEX |
|-------------|-----------|-----------------|
| G2/Capterra Reviews | Tool comparison | Industry benchmark data |
| Sandbox.io | Cloud sandboxes | Instant PoC environments |
| UserTesting | UX evaluation | Tool usability assessment |
| Pendo/Amplitude | Product analytics | Adoption measurement |
| Decision matrix tools | MCDA | Structured evaluation |

## Gaps Identificados

1. **Vendor bias** en PoCs es difícil de eliminar cuando el vendor provee el sandbox, el training, y el soporte durante el PoC [SUPUESTO].
2. **Scale-up prediction** desde PoC a producción sigue siendo el gap principal — organizaciones subestiman el esfuerzo de scale-up en 2-5x [METRIC].
3. **PoC fatigue** — equipos que participan en múltiples PoCs pierden productividad en su trabajo principal [INFERENCIA].

## Benchmarks de Industria

- PoC típico: **2-4 semanas**, **3-8 personas**, **$5K-$50K** costo [METRIC].
- Tasa de PoC que resultan en GO: **60-70%** (sesgo de selección — solo se hacen PoCs de opciones prometedoras) [METRIC].
- Scale-up success rate post-PoC: **~55%** — muchos fallan en la transición de PoC a producción [METRIC].

# Metaprompts — Execution Burndown

> 5 meta-estrategias para potenciar la skill `execution-burndown`. Cada metaprompt define una lente analitica que transforma como se trackea, diagnostica y ajusta la ejecucion.

---

## Meta-estrategia 1: Feature Decomposition Quality Checker

### Filosofia

Un burndown saludable empieza ANTES de la ejecucion — en la calidad de la descomposicion. Features mal descompuestas (demasiado grandes, dependientes, ambiguas) son la causa raiz #1 de desviaciones en el burndown. Esta meta-estrategia audita la calidad del backlog como prerequisito del tracking.

### Prompt

```
Ejecuta el burndown con lente Feature Decomposition Quality Checker.

ANTES de iniciar el tracking, auditar cada feature del backlog ejecutable:

1. **Filtro de tamano:**
   - ¿Todas las features son ≤3 SP?
   - Features >3 SP: listar y re-descomponer obligatoriamente
   - Distribucion ideal: 20-30% de 1 SP, 40-50% de 2 SP, 20-30% de 3 SP
   - Si >40% son 3 SP: el backlog esta subestimado — revisar

2. **Filtro INVEST:**
   Para cada feature, evaluar:
   - Independent: ¿depende de otra feature en el mismo sprint?
     Si: marcar dependencia, secuenciar, o re-descomponer
   - Negotiable: ¿el scope esta tan rigido que no permite ajuste?
   - Valuable: ¿entrega valor al usuario o es solo tarea tecnica?
   - Estimable: ¿el equipo puede estimar con confianza?
     Si no: spike de 0.5 dias, luego re-estimar
   - Small: ¿se puede completar en ≤1 dia por 1 developer?
   - Testable: ¿tiene criterios de aceptacion claros y verificables?

3. **Dependency Map:**
   - Identificar cadenas de dependencia (A→B→C)
   - Cadenas >2 features: senal de descomposicion insuficiente
   - Dependencias externas (APIs, otros equipos): marcar como riesgo
   - Generar dependency graph (Mermaid flowchart)

4. **Shippable Criteria Check:**
   - ¿Cada feature tiene Definition of Done explicita?
   - ¿"Shippable" significa deployable, no solo "code complete"?
   - ¿Incluye QA, documentacion, y merge a main?

5. **Backlog Health Score:**
   Calcular score compuesto:
   - % features ≤3 SP (target: 100%)
   - % features INVEST-compliant (target: ≥90%)
   - % features sin dependencias internas (target: ≥80%)
   - % features con DoD explicita (target: 100%)

   Score ≥90%: 🟢 Backlog listo para ejecucion
   Score 70-89%: 🟡 Refinar antes de iniciar
   Score <70%: 🔴 No iniciar — Sprint 0 de re-descomposicion necesario

Output: Backlog Audit Report + Dependency Graph + Health Score + Acciones de remediacion
```

### Cuando Usar

- Antes de todo proyecto que use el modelo de 1 feature/dia/FTE
- Cuando proyectos anteriores del equipo tuvieron desviaciones causadas por features mal dimensionadas
- Como quality gate de Sprint 0: el burndown no empieza hasta que el backlog pase el audit
- Cuando el Product Owner insiste en features grandes ("es solo UNA feature, no se puede dividir")

---

## Meta-estrategia 2: Velocity Stability Analyzer

### Filosofia

La velocidad no es un numero — es una distribucion. Un equipo con velocidad promedio de 4 features/dia pero varianza de ±2 es impredecible. Esta meta-estrategia analiza la estabilidad de la velocidad como indicador de madurez del equipo y confiabilidad del burndown.

### Prompt

```
Ejecuta el burndown con lente Velocity Stability Analyzer.

Analizar la velocidad NO como promedio, sino como distribucion:

1. **Distribucion de Velocidad:**
   - Histograma de velocidad diaria (ultimos N dias)
   - Media, mediana, desviacion estandar, coeficiente de variacion (CV)
   - CV < 15%: equipo estable → burndown confiable
   - CV 15-30%: equipo variable → burndown con rango
   - CV > 30%: equipo impredecible → burndown poco confiable, usar Monte Carlo

2. **Trend Analysis:**
   - ¿La velocidad esta mejorando, estable, o degradandose?
   - Calcular slope de la linea de tendencia (regresion lineal)
   - Slope positivo: equipo en mejora (ramp-up, learning)
   - Slope ~0: equipo en estado estable (ideal para forecasting)
   - Slope negativo: equipo en degradacion (fatiga, impedimentos crecientes)

3. **Outlier Detection:**
   - Dias con velocidad >2σ por encima o debajo del promedio
   - Para cada outlier: ¿que paso ese dia? (impedimento, ausencia, feature excepcional)
   - Excluir outliers para calcular "velocidad sostenible"

4. **Velocity by Context:**
   - Velocidad por tipo de feature (frontend, backend, integracion, infra)
   - Velocidad por developer (identificar cuellos de botella o super-performers)
   - Velocidad por dia de la semana (¿lunes es mas lento? ¿viernes tiene drop?)
   - Velocidad por SP (features 1 SP vs. 2 SP vs. 3 SP — ¿hay correlacion?)

5. **Predictability Score:**
   Calcular score basado en:
   - CV de velocidad (peso: 40%)
   - Frecuencia de outliers (peso: 20%)
   - Estabilidad de tendencia (peso: 20%)
   - Consistencia entre developers (peso: 20%)

   Score ≥85%: 🟢 Equipo altamente predecible — burndown lineal confiable
   Score 70-84%: 🟡 Equipo moderadamente predecible — usar Monte Carlo
   Score <70%: 🔴 Equipo impredecible — burndown lineal no confiable, solo Monte Carlo

Output: Velocity Distribution Report + Trend Chart + Predictability Score + Recomendaciones
```

### Cuando Usar

- Cuando el burndown muestra oscilaciones (dias buenos seguidos de dias malos)
- Para calibrar si el burndown lineal es confiable o si se necesita Monte Carlo
- Al inicio de un proyecto con equipo nuevo: evaluar cuanto confiar en las proyecciones
- Post-mortem: evaluar la estabilidad del equipo como metrica de madurez

---

## Meta-estrategia 3: Burndown Slope Health Checker

### Filosofia

La pendiente (slope) del burndown actual es el indicador mas directo de salud del proyecto. Pero la pendiente promedio esconde informacion: lo que importa es como evoluciona la pendiente en el tiempo. Pendiente que mejora = equipo acelerando. Pendiente que empeora = problemas crecientes.

### Prompt

```
Ejecuta el burndown con lente Burndown Slope Health Checker.

Analizar la pendiente del burndown en ventanas moviles:

1. **Slope Analysis (Ventanas de 3 dias):**
   Para cada ventana de 3 dias, calcular:
   - Features completadas en la ventana
   - Slope = features_completadas / 3
   - Slope ideal = capacidad_diaria_equipo (ej: 4 features/dia)
   - Delta = slope_actual - slope_ideal
   - Tendencia del delta: mejorando, estable, empeorando

2. **Slope Patterns:**
   Identificar patrones comunes:
   - **Ramp-up:** Slope bajo → medio → estable (normal en Sprint 1-2)
   - **Plateau:** Slope estable por >5 dias (equipo en estado estable — ideal)
   - **Cliff:** Slope cae abruptamente (impedimento mayor, ausencia, dependencia)
   - **Recovery:** Slope sube despues de un cliff (impedimento resuelto)
   - **Decay:** Slope disminuye gradualmente (fatiga, complejidad creciente, technical debt)
   - **Sprint finish effect:** Slope sube al final (presion de deadline — alerta de calidad)

3. **Health Indicators:**
   | Indicador | Saludable | Preocupante | Critico |
   |-----------|-----------|-------------|---------|
   | Slope vs. ideal | ≥90% | 70-89% | <70% |
   | Slope trend | Estable o mejorando | Leve decay | Decay sostenido |
   | Cliff frequency | ≤1 por proyecto | 2-3 por proyecto | >3 por proyecto |
   | Recovery time post-cliff | ≤1 dia | 2-3 dias | >3 dias |
   | Sprint finish effect | Ausente | Leve aceleracion | Aceleracion >20% |

4. **Diagnostic Decision Tree:**
   Si slope < ideal:
   → ¿Es Sprint 1? → Ramp-up esperado, monitorear
   → ¿Hay impedimentos activos? → Resolver impedimentos (priority 1)
   → ¿Features actuales son 3 SP? → Re-descomponer
   → ¿WIP > limit? → Reducir WIP, focus en completar
   → ¿Developer ausente? → Ajustar capacidad en burndown
   → ¿Ninguna causa clara? → Investigar DX (builds, entorno, tooling)

5. **Slope Forecast:**
   - Proyectar completitud usando slope actual (no promedio historico)
   - Comparar con Monte Carlo (que usa distribucion completa)
   - Si slope_actual < slope_promedio: la situacion esta empeorando — actuar ahora

Output: Slope Health Dashboard + Pattern Analysis + Diagnostic Tree Result + Forecast
```

### Cuando Usar

- Diariamente como parte del standup (version rapida: slope de ayer vs. ideal)
- Cuando el burndown muestra "escalones" (periodos de estancamiento seguidos de avance)
- Para diagnosticar POR QUE el burndown se desvia, no solo QUE se desvia
- Como complemento del velocity analyzer: el velocity mira el throughput, el slope mira la tendencia

---

## Meta-estrategia 4: Ramp-Up Curve Calibrator

### Filosofia

El modelo MetodologIA asume Sprint 1 = 0.5x y Sprint 2+ = 1.0x. Pero la curva real de ramp-up varia segun: complejidad del dominio, experiencia del equipo, calidad del onboarding, y disponibilidad de documentacion. Esta meta-estrategia calibra la curva de ramp-up con datos reales para mejorar las proyecciones de futuros proyectos.

### Prompt

```
Ejecuta el burndown con lente Ramp-Up Curve Calibrator.

Medir y calibrar la curva de ramp-up del equipo:

1. **Datos de Ramp-Up (Sprint 1-3):**
   Para cada developer, registrar:
   - Dia 1: features completadas, impedimentos, tiempo en onboarding
   - Dia 2: features completadas, mejora vs. dia 1
   - Dia 3: features completadas, ¿alcanzo 1.0x?
   - Dia 4-5: ¿se estabilizo? ¿sigue mejorando?

2. **Curva de Ramp-Up Real vs. Modelo:**
   | Dia | Modelo MetodologIA | Developer A | Developer B | Developer C | Developer D | Promedio Real |
   |-----|-------------|-------------|-------------|-------------|-------------|---------------|
   | 1   | 0.50x       | ?           | ?           | ?           | ?           | ?             |
   | 2   | 0.75x       | ?           | ?           | ?           | ?           | ?             |
   | 3   | 1.00x       | ?           | ?           | ?           | ?           | ?             |
   | 4   | 1.00x       | ?           | ?           | ?           | ?           | ?             |
   | 5   | 1.00x       | ?           | ?           | ?           | ?           | ?             |

3. **Factores de Ramp-Up:**
   Evaluar que factores aceleran o retardan el ramp-up:
   - Complejidad del dominio: ¿requiere knowledge transfer extenso?
   - Calidad del onboarding: ¿documentacion, sandbox, buddy system?
   - Tech stack familiarity: ¿el equipo ya conoce la tecnologia?
   - Codebase size/quality: ¿es facil entender y contribuir al codebase?
   - Team dynamics: ¿equipo que ya trabajo junto o equipo nuevo?

4. **Calibracion del Modelo:**
   - Si ramp-up real < modelo (mas lento): ¿que lo causo?
   - Si ramp-up real > modelo (mas rapido): ¿por que? ¿es sostenible?
   - Ajustar parametros para futuros proyectos con este equipo:
     Sprint 1 factor = promedio_real_dia1-2 / capacidad_full
   - Ajustar para nuevos equipos:
     Aplicar factores de complejidad de dominio y tech familiarity

5. **Onboarding Effectiveness Score:**
   - Tiempo hasta 0.75x productividad (target: ≤2 dias)
   - Tiempo hasta 1.0x productividad (target: ≤3 dias)
   - % de developers que alcanzan 1.0x en Sprint 1 (target: ≥75%)
   - Impedimentos de onboarding: listar y categorizar

Output: Ramp-Up Curve Comparison + Calibrated Model + Onboarding Score + Recomendaciones
```

### Cuando Usar

- En los primeros 3-5 dias de cada nuevo proyecto (calibracion en tiempo real)
- Post-mortem: para ajustar el modelo de ramp-up con datos reales
- Cuando se va a escalar el equipo mid-project: predecir con precision el ramp-up del nuevo developer
- Cuando el equipo trabaja en un dominio nuevo: el ramp-up sera diferente al modelo default

---

## Meta-estrategia 5: Forecast Confidence Validator

### Filosofia

Una proyeccion sin medida de confianza es una opinion disfrazada de dato. Esta meta-estrategia valida la confiabilidad de las proyecciones (burndown lineal y Monte Carlo) evaluando la calidad de los datos de entrada, la estabilidad del throughput, y el track record de proyecciones anteriores.

### Prompt

```
Ejecuta el burndown con lente Forecast Confidence Validator.

Evaluar la confiabilidad de las proyecciones ANTES de comunicarlas:

1. **Data Quality Assessment:**
   - ¿Cuantos dias de throughput historico tenemos? (minimo: 5, ideal: ≥10)
   - ¿Hay outliers que distorsionan el promedio?
   - ¿El throughput es de ESTE equipo o extrapolado de otro?
   - ¿El mix de features futuras es similar al mix historico?
   - ¿Hay cambios conocidos que invaliden datos historicos?
     (ej: developer se va, nuevo requerimiento de compliance, holiday season)

   Data Quality Score:
   - ≥10 dias + sin outliers + mismo equipo + mix similar: 🟢 Alta
   - 5-9 dias o outliers presentes: 🟡 Media
   - <5 dias o datos de otro equipo: 🔴 Baja — no confiar en forecast

2. **Throughput Stability Assessment:**
   - Coeficiente de variacion (CV) del throughput diario
   - ¿Hay tendencia (mejorando/empeorando) o es estacionario?
   - Si hay tendencia: el Monte Carlo con datos planos subestima/sobreestima
   - Solucion: usar solo ultimos 5 dias (weighted recent) vs. todos los datos

3. **Assumptions Audit:**
   Listar y validar CADA supuesto de la proyeccion:
   - "El equipo mantiene la misma velocidad" → ¿hay razones para que cambie?
   - "No habra impedimentos mayores" → ¿probabilidad basada en historico?
   - "El scope no cambiara" → ¿el PO ha confirmado scope freeze?
   - "No hay ausencias planificadas" → ¿verificado con cada developer?
   - "Las features restantes son del mismo tamano" → ¿o hay features 3 SP al final?

4. **Forecast Calibration (si hay datos previos):**
   - En proyecciones anteriores de este equipo: ¿que percentil resulto ser la realidad?
   - Si la realidad siempre cae en P95: las proyecciones son sistematicamente optimistas
   - Si la realidad cae en P50: las proyecciones estan bien calibradas
   - Ajustar el percentil recomendado segun calibracion historica

5. **Confidence Rating:**
   Calcular rating compuesto:
   - Data quality (30%)
   - Throughput stability (25%)
   - Assumptions validity (25%)
   - Historical calibration (20%)

   Rating ≥80%: 🟢 "Alta confianza — comunicar P85 como fecha de compromiso"
   Rating 60-79%: 🟡 "Confianza moderada — comunicar rango P50-P95, no fecha unica"
   Rating <60%: 🔴 "Baja confianza — no comprometer fecha, solicitar mas datos"

6. **Communication Guide:**
   Segun el confidence rating, ajustar como se comunica la proyeccion:
   - Alta: "Estimamos completar para el dia X (±2 dias)"
   - Moderada: "Proyectamos completar entre dia X y dia Y. Actualizaremos en dia Z"
   - Baja: "Es prematuro comprometer fecha. Necesitamos N dias mas de datos"

Output: Confidence Assessment + Assumptions Audit + Calibration Report + Communication Template
```

### Cuando Usar

- SIEMPRE antes de comunicar una fecha de compromiso al cliente
- Cuando el PM pide "dame LA fecha" y tu tienes solo 3 dias de datos
- Cuando hay alta varianza en el throughput y no estas seguro de que confiar
- Para calibrar las proyecciones del equipo basado en track record historico

---

## Combinacion de Meta-estrategias

| Combinacion | Resultado | Caso de Uso |
|-------------|-----------|-------------|
| Decomposition Quality + Velocity Stability | Backlog sano → velocidad predecible | Setup de proyecto nuevo |
| Slope Health + Forecast Confidence | Diagnostico de tendencia + validacion de proyeccion | Mid-project health check |
| Ramp-Up Calibrator + Velocity Stability | Modelo calibrado + equipo predecible | Equipo nuevo en dominio nuevo |
| Decomposition Quality + Forecast Confidence | Features bien dimensionadas + datos confiables | Antes de comprometer fecha con cliente |
| Todas (5 lentes) | Execution burndown con maxima rigurosidad | Proyectos criticos de alto riesgo |

---

**Autor:** Javier Montaño | **Ultima actualizacion:** 13 de marzo de 2026

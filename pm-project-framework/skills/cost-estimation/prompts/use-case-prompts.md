# Use-Case Prompts: cost-estimation

> 8 prompts reutilizables para invocar el skill en diferentes contextos. Todos producen magnitudes y FTE-meses. NUNCA precios.

---

## Prompt 1: Full Cost Estimation (7 secciones completas)

```
Ejecuta cost-estimation para el proyecto {NOMBRE_PROYECTO}.

Contexto:
- Repositorio/documentacion: {RUTA_O_URL}
- Industria: {INDUSTRIA}
- Fase actual: {CONCEPTO|REQUISITOS|DISENO|CONSTRUCCION}

Parametros:
- {MODO} = piloto-auto
- {FORMATO} = markdown
- {VARIANTE} = tecnica

Entrega las 7 secciones completas:
S1: Scope Decomposition & Effort Drivers
S2: Sizing Methods (triangulacion obligatoria)
S3: Team Composition Modeling
S4: Cost Driver Taxonomy (8+ categorias)
S5: Risk-Adjusted Timeline Ranges (Monte Carlo P50/P80/P95)
S6: Magnitude Framing (clasificacion T-shirt + escenarios)
S7: Costing Governance & Disclaimers

Incluye los 3 diagramas Mermaid: Gantt ramp-up, mindmap drivers, flowchart escenarios.
Incluye margen de innovacion 5%.
Incluye disclaimer de costeo obligatorio.
```

---

## Prompt 2: Quick FTE-Month Sizing

```
Necesito un sizing rapido de magnitud para {NOMBRE_PROYECTO}.

Solo necesito:
1. WBS de alto nivel (epics y features, sin tareas)
2. T-shirt sizing por feature (S/M/L/XL)
3. Rango total en FTE-meses (optimista / probable / pesimista)
4. Clasificacion de magnitud del proyecto (Micro/Pequeno/Mediano/Grande/Enterprise)
5. Top 5 effort drivers

Contexto: {DESCRIPCION_BREVE_DEL_PROYECTO}
Stack: {TECNOLOGIAS_PRINCIPALES}
Equipo disponible: {TAMANO_Y_SENIORITY}

{VARIANTE} = ejecutiva
No necesito Monte Carlo ni team composition detallado.
```

---

## Prompt 3: Monte Carlo Simulation

```
Ejecuta una simulacion Monte Carlo para el proyecto {NOMBRE_PROYECTO}.

Input disponible:
- WBS con estimaciones de tres puntos (optimista/probable/pesimista) por feature:
  {TABLA_O_REFERENCIA_A_WBS}

Necesito:
1. Distribucion de esfuerzo total (histograma)
2. Percentiles: P10, P25, P50, P80, P95
3. Media y desviacion estandar
4. Coeficiente de variacion (indicador de incertidumbre)
5. Top 5 drivers de sensibilidad (que features mueven mas el resultado)
6. Recomendacion de percentil para planificacion

Si no tengo tres-point estimates, genera estimaciones razonables basadas en la complejidad
de cada feature y calibra con reference-class forecasting.

Formato de output: tabla resumen + grafico de distribucion (descripcion para reproducir).
Todos los valores en FTE-meses.
```

---

## Prompt 4: TCO Comparison (Build vs Buy)

```
Necesito una comparacion de TCO (Total Cost of Ownership) para {NOMBRE_COMPONENTE}.

Opciones a comparar:
- Opcion A (Build): Desarrollo custom con {STACK}
- Opcion B (Buy): {PRODUCTO_O_PLATAFORMA}
- Opcion C (Hybrid): {DESCRIPCION_HIBRIDO} (si aplica)

Analiza por categoria de driver:
1. Personal (FTE-meses de desarrollo y mantenimiento)
2. Licenciamiento (tiers, periodicidad, escalamiento)
3. Infraestructura (ambientes, compute, storage)
4. Integracion (esfuerzo de conectar con ecosistema existente)
5. Training (capacitacion del equipo)
6. Mantenimiento recurrente (FTE-meses/ano post-launch)
7. Riesgo de vendor lock-in

Horizonte: 3 anos.
Output: tabla comparativa con magnitudes relativas (Bajo/Medio/Alto/Critico) y FTE-meses donde sea cuantificable.
NUNCA valores monetarios.

Incluye recomendacion fundamentada.
```

---

## Prompt 5: Migration Cost Assessment

```
Estima el esfuerzo de migracion de {SISTEMA_ORIGEN} a {SISTEMA_DESTINO}.

Contexto de migracion:
- Tipo: {BIG_BANG | STRANGLER_FIG | PARALLEL_RUN | PHASED}
- Volumen de datos: {DESCRIPCION}
- Sistemas integrados: {NUMERO_Y_LISTA}
- Ventana de migracion permitida: {RESTRICCIONES}
- SLAs durante migracion: {UPTIME_REQUERIDO}

Necesito:
1. Effort drivers especificos de migracion:
   - Extraccion y transformacion de datos
   - Validacion y reconciliacion
   - Cutover y rollback
   - Parallel running
   - Integracion re-pointing
2. FTE-meses por fase de migracion
3. Buffer recomendado (+30-50% por legacy modernization)
4. Timeline con hitos criticos
5. Riesgos especificos de migracion con exposicion en FTE-meses

Aplica el multiplicador de legacy modernization (+30-50%) segun edge case del skill.
```

---

## Prompt 6: Team Ramp-Up Estimation

```
Modela el ramp-up del equipo para {NOMBRE_PROYECTO}.

Parametros:
- Duracion total estimada: {X_MESES}
- Fases: {LISTA_DE_FASES}
- Stack tecnologico: {TECNOLOGIAS}
- Equipo disponible vs a contratar: {DETALLE}

Necesito:
1. Modelo de equipo por fase (roles x cantidad x % dedicacion)
2. Curva de ramp-up aplicada:
   - Semanas 1-2: 50% productividad
   - Semana 4: 80% productividad
   - Semana 8: 100% productividad
3. FTE-meses ajustados por ramp-up (vs nominales)
4. Communication overhead por tamano de equipo (Brooks's Law)
5. Diagrama Gantt Mermaid con timeline de ramp-up por rol
6. Impacto de build vs hire vs contract en timeline de ramp-up

Output: tabla de asignacion + Gantt Mermaid + total FTE-meses ajustados.
No tarifas, no precios — solo roles, cantidades y duraciones.
```

---

## Prompt 7: Risk Contingency Calculation

```
Calcula la contingencia de riesgo para {NOMBRE_PROYECTO}.

Input:
- Risk register existente: {REFERENCIA_O_LISTA}
  (Si no hay, genera risk register basado en el contexto del proyecto)
- FTE-meses base estimados: {VALOR}
- Fase del proyecto: {CONCEPTO|REQUISITOS|DISENO|CONSTRUCCION}

Necesito:
1. Risk register completo:
   - ID, categoria, descripcion, probabilidad, impacto (FTE-meses)
   - Exposicion = probabilidad x impacto
   - Estrategia de mitigacion
   - Owner y trigger
2. Contingencia total para known risks (suma de exposiciones)
3. Buffer para unknown-unknowns (15-25% segun fase)
4. Margen de innovacion (5% — separado de contingencia)
5. FTE-meses totales ajustados: base + contingencia + unknown-unknowns + innovacion
6. Cone of Uncertainty aplicado segun fase actual

Aplica mitigacion de Planning Fallacy: el estimado base probablemente es optimista.
Incluye factor de correccion de reference-class forecasting.
```

---

## Prompt 8: Multi-Phase Investment Roadmap

```
Crea un roadmap de inversion por fases para {NOMBRE_PROYECTO}.

Contexto:
- Magnitud estimada: {RANGO_FTE_MESES}
- Numero de fases deseado: {3-5}
- Modelo de funding: {INCREMENTAL | UPFRONT | PHASED_GATES}

Necesito:
1. Definicion de fases con:
   - Alcance por fase (features incluidas)
   - FTE-meses por fase
   - Equipo por fase (roles y cantidades)
   - Entregables y criterios de exito (phase gates)
   - Dependencias entre fases
2. Timeline total con Gantt Mermaid
3. Punto de decision go/no-go entre cada fase
4. Escenario de "early exit" — que valor se captura si se detiene despues de fase N
5. Sensitivity analysis: que drivers mueven mas la magnitud total
6. Margen de innovacion (5%) distribuido por fase

Output: roadmap visual (Mermaid Gantt) + tabla de fases + analisis de valor por fase.
Todos los valores en FTE-meses y magnitudes. NUNCA precios.
```

---

**Autor:** Javier Montano | **Ultima actualizacion:** 13 de marzo de 2026

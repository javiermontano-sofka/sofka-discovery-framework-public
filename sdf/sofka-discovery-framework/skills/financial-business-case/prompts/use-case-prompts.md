# Use Case Prompts — Financial Business Case Analysis

## Caso de Uso 1: Business Case Completo para Aprobacion

**Contexto**: Proyecto nuevo requiere aprobacion de inversion. El PM necesita construir un business case financiero completo con NPV, IRR, payback, y escenarios.

**Prompt Template**:
```
Construye financial business case para el proyecto {proyecto}:
- Investment: {magnitud_fte_meses} de esfuerzo de desarrollo
- Operating costs: {magnitud} anuales post-implementacion
- Benefits: {lista_beneficios_cuantificados}
- Discount rate: {tasa}% (costo de capital organizacional)
- Horizon: {anios} anios
- Calcular: NPV, IRR, payback period, BCR
- Sensitivity: test discount rate +/-2%, benefits +/-20%, costs +/-15%
- Scenarios: best (benefits +20%), most-likely (as estimated), worst (benefits -30%, costs +20%)
- NUNCA incluir precios unitarios — solo magnitudes
```

**Output Esperado**: Documento de business case con cash flow table, NPV/IRR/payback, sensitivity tornado, scenario comparison, y recommendation.

## Caso de Uso 2: Continue/Cancel Analysis para Proyecto en Problemas

**Contexto**: Proyecto con overrun de 40% en costo. El steering committee necesita analisis financiero para decidir si continuar o cancelar.

**Prompt Template**:
```
Ejecuta continue/cancel analysis para el proyecto {proyecto}:
- Sunk cost: {magnitud} ya invertida (NO incluir en decision)
- Remaining to complete: {magnitud} estimada
- Expected residual value: {beneficios_restantes} si se completa
- Cancellation cost: {magnitud} para shutdown y cleanup
- Calcular: NPV de continuar vs. NPV de cancelar (from today forward)
- NUNCA sunk cost fallacy — solo forward-looking economics
```

**Output Esperado**: Analisis comparativo continuar vs. cancelar con NPV forward-looking, sin sunk costs.

## Caso de Uso 3: Lean Business Case para Epic (SAFe)

**Contexto**: Equipo SAFe necesita lean business case para un epic antes del PI Planning.

**Prompt Template**:
```
Genera lean business case para el epic "{epic_name}" del ART {art}:
- Formato: SAFe Lean Business Case (1 pagina)
- Solution hypothesis: {hipotesis}
- Business outcome hypothesis: {outcome_esperado}
- WSJF score: calculate from (business value + time criticality + risk reduction) / job size
- Go/No-Go recommendation for PI Planning
```

**Output Esperado**: Lean business case de 1 pagina con hipotesis, WSJF, y MVP scope.

## Caso de Uso 4: Competitive Investment Comparison

**Contexto**: Portfolio committee debe elegir entre inversiones competitivas con presupuesto limitado.

**Prompt Template**:
```
Compara business cases de {proyecto_A} y {proyecto_B}:
- Discount rate consistente: {tasa}%
- Evaluar: NPV, IRR, payback, strategic alignment, risk-adjusted return
- Ranking por financial return y por strategic fit
- Trade-off analysis si los rankings difieren
- Recommendation con justificacion
```

**Output Esperado**: Tabla comparativa side-by-side con recommendation y trade-off analysis.

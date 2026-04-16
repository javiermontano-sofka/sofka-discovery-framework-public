# Use Case Prompts — Stakeholder Engagement Strategy

## Caso de Uso 1: Estrategia Completa desde Stakeholder Register

**Contexto**: Proyecto nuevo con stakeholder register completado. PM necesita estrategia de engagement para los 8 stakeholders clave.

**Prompt Template**:
```
Diseña estrategia de engagement para los stakeholders clave del proyecto {proyecto}:
- Stakeholders: {lista_con_poder_interés_engagement_actual}
- Para cada stakeholder: motivation mapping, desired engagement level, gap analysis
- Tácticas: influence approach específica por stakeholder (data, demo, coalition, authority)
- Actividades: ≥3 engagement activities por stakeholder crítico
- Coalition map: identificar champions y pathways de influencia
- Timeline: alineado con milestones del proyecto
- Tracking: métricas y cadencia de medición
```

**Output Esperado**: Documento de estrategia con tabla por stakeholder, coalition map, timeline, y métricas.

## Caso de Uso 2: Resistance Management para Stakeholder Clave

**Contexto**: VP de Finanzas se opone activamente al proyecto. El PM necesita una estrategia específica para mover de Resistant a Supportive.

**Prompt Template**:
```
Diseña plan de resistance management para {stakeholder_name} del proyecto {proyecto}:
- Engagement actual: Resistant
- Engagement deseado: Supportive
- ADKAR diagnosis: ¿qué elemento falta? (Awareness, Desire, Knowledge, Ability, Reinforcement)
- Root cause: ¿por qué resiste? (fear of loss, uncertainty, lack of trust, political)
- Estrategia: 3 tácticas secuenciales para mover de R → N → S
- Actividades: 1-on-1s, demos, data presentations, coalition leverage
- Timeline: 3 meses con checkpoints mensuales
- Escalation: qué hacer si no hay progreso en 30 días
```

**Output Esperado**: Plan detallado con diagnóstico ADKAR, tácticas secuenciales, y protocolo de escalamiento.

## Caso de Uso 3: Coalition Building para Aprobación de Budget

**Contexto**: El proyecto necesita aprobación de presupuesto adicional. PM debe construir coalition de champions para influir en la decisión.

**Prompt Template**:
```
Construye coalition map para aprobación de presupuesto del proyecto {proyecto}:
- Decision maker: {nombre} (CFO)
- Budget amount: {magnitud} (NUNCA incluir precio, solo magnitud de esfuerzo)
- Influencers del decision maker: ¿quién tiene acceso y credibilidad?
- Champions disponibles: {lista_champions}
- Design: influence pathways from champions → decision maker
- Messaging: qué argumento resuena con el decision maker (ROI, risk reduction, strategic alignment)
- Timeline: alineado con budget cycle
```

**Output Esperado**: Coalition map visual, influence pathways, messaging guide, y timeline de actividades.

## Caso de Uso 4: Engagement Tracking Scorecard

**Contexto**: A mitad de proyecto, PM necesita evaluar si la estrategia de engagement está funcionando y dónde ajustar.

**Prompt Template**:
```
Genera engagement tracking scorecard para el proyecto {proyecto}:
- Stakeholders: {lista_con_engagement_initial_y_current}
- Calcular: Engagement Score, Gap Closure Rate, Champion Ratio
- Para cada stakeholder: movimiento (improved, stable, declined)
- Flag: stakeholders cuyo engagement ha declinado → requiere intervención
- Trend: comparar con assessment anterior
- Actions: top 3 ajustes a la estrategia basados en datos
```

**Output Esperado**: Scorecard con métricas, trends por stakeholder, flags de intervención, y ajustes recomendados.

# State of the Art — Dependency Mapping (2024-2026)

## Tendencia 1: AI-Powered Dependency Discovery
Herramientas que analizan código, Jira tickets, y comunicaciones para descubrir dependencias implícitas que ningún PM ha documentado. NLP identifica menciones cross-team y sugiere dependencias para confirmación. [INFERENCIA]

## Tendencia 2: Real-Time Dependency Boards
SAFe program boards digitalizados con actualización en tiempo real. Dependencias cambian de estado automáticamente cuando Jira tickets se mueven. Eliminan la necesidad de sync meetings para actualizar el dependency board. [PLAN]

## Tendencia 3: Dependency Risk Scoring con ML
Modelos predictivos que calculan la probabilidad de que una dependencia cause retraso basándose en datos históricos: tipo de dependencia, equipo proveedor, complejidad técnica, historial de delivery. [SUPUESTO]

## Tendencia 4: Graph Database para Dependencies
Uso de Neo4j y similares para modelar redes de dependencias como grafos, permitiendo queries complejas: "¿qué proyectos se impactan si Proyecto X se retrasa 2 semanas?" Análisis de impacto en segundos. [INFERENCIA]

## Tendencia 5: Dependency Debt como Métrica
Concepto emergente donde dependencias no resueltas se tratan como "deuda de dependencia" con interés compuesto: mientras más tiempo sin resolver, mayor el riesgo acumulado. Se trackea como deuda técnica. [INFERENCIA]

## Implicaciones para PMO-APEX

| Tendencia | Impacto en APEX | Acción Recomendada |
|-----------|-----------------|-------------------|
| AI discovery | Dependencias ocultas reveladas | Integrar análisis de comunicaciones |
| Real-time boards | Boards siempre actualizados | Conectar con data feeds de PM tools |
| ML risk scoring | Priorización basada en datos | Calibrar modelo con datos de portfolio |
| Graph databases | Análisis de impacto potente | Modelar dependencies como grafos |
| Dependency debt | Urgencia de resolución | Incluir en dashboard de portfolio |

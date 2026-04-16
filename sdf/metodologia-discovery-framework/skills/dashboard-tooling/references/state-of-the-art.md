# State of the Art — Dashboard Tooling & Data Feeds (2024-2026)

## Tendencia 1: AI-Powered Dashboard Generation
Plataformas como Power BI Copilot y Tableau Pulse generan dashboards automáticamente a partir de descripciones en lenguaje natural. El PM describe qué necesita ver y la herramienta diseña el layout, selecciona widgets y configura feeds. [INFERENCIA]

## Tendencia 2: Embedded Analytics en Herramientas PM
Jira, Monday.com y Azure DevOps están integrando capacidades de BI directamente en sus plataformas, eliminando la necesidad de herramientas externas para dashboards básicos. La tendencia es analytics nativo con export para análisis avanzado. [METRIC]

## Tendencia 3: Real-Time Streaming Dashboards
Tecnologías como Apache Kafka y webhooks permiten dashboards con actualización en tiempo real. Los dashboards de CI/CD ya muestran deployments en vivo; los dashboards PM están adoptando el mismo patrón para métricas de sprint. [INFERENCIA]

## Tendencia 4: Composable Dashboard Architecture
Dashboards construidos como composiciones de micro-widgets independientes que se pueden reordenar, personalizar por rol, y compartir entre equipos. Cada widget es un componente reutilizable con su propio data feed. [PLAN]

## Tendencia 5: Predictive Dashboards con ML
Dashboards que no solo muestran estado actual sino predicciones: fecha probable de entrega, riesgo de sobrecosto, velocidad proyectada. Modelos de ML entrenados con datos históricos del portafolio alimentan widgets predictivos. [SUPUESTO]

## Implicaciones para PMO-APEX

| Tendencia | Impacto en APEX | Acción Recomendada |
|-----------|-----------------|-------------------|
| AI dashboard generation | Simplifica diseño | Integrar prompts de generación |
| Embedded analytics | Menos herramientas externas | Priorizar feeds nativos |
| Real-time streaming | Dashboards operativos viables | Diseñar para near-real-time |
| Composable architecture | Widgets reutilizables | Crear librería de widgets APEX |
| Predictive ML | Dashboards proactivos | Incorporar forecasting cuando haya datos |

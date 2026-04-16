# Use Case Prompts — Dashboard Tooling & Data Feeds

## Caso de Uso 1: Configuración de Feeds desde Jira

**Contexto**: El proyecto usa Jira como herramienta PM y necesita feeds automáticos para un dashboard ejecutivo en Power BI.

**Prompt Template**:
```
Configura data feeds desde Jira hacia Power BI para el proyecto {proyecto}:
- Métricas requeridas: velocity, burndown, sprint completion rate, defect density
- Refresh cadence: hourly durante sprint activo, daily fuera de sprint
- Transformaciones: calcular velocity promedio de últimos 3 sprints, normalizar story points
- Alertas: velocity drop >20%, sprint completion <80%
- Output: Documento de configuración de feeds + alert rules
```

**Output Esperado**: Documento técnico con endpoints de API, transformaciones, schedule de refresh, y reglas de alerta.

## Caso de Uso 2: Alert Rules para Métricas EVM

**Contexto**: Proyecto Waterfall con EVM habilitado necesita alertas automáticas cuando los índices de performance se degradan.

**Prompt Template**:
```
Diseña reglas de alerta para métricas EVM del proyecto {proyecto}:
- Métricas monitoreadas: CPI, SPI, EAC, TCPI
- Umbrales tier-1 (info): CPI o SPI < 0.95
- Umbrales tier-2 (warning): CPI o SPI < 0.90
- Umbrales tier-3 (critical): CPI o SPI < 0.80
- Canales: tier-1 → dashboard badge, tier-2 → email PM, tier-3 → email sponsor + Slack
- Output: Tabla de alert rules + escalation matrix
```

**Output Esperado**: Tabla de reglas con umbrales, canales de notificación, y matriz de escalamiento.

## Caso de Uso 3: Dashboard Multi-Proyecto con Agregación

**Contexto**: PMO necesita un dashboard de portfolio que agregue datos de 8 proyectos activos con diferentes herramientas PM.

**Prompt Template**:
```
Configura tooling para dashboard de portfolio agregando datos de múltiples fuentes:
- Proyectos: {lista_proyectos}
- Fuentes: Jira (4 proyectos), Azure DevOps (3 proyectos), Monday (1 proyecto)
- Métricas agregadas: RAG por proyecto, budget burn total, schedule variance promedio
- Normalización: unificar story points, sprints, y periodos de reporte
- Output: Arquitectura de data feeds + transformation rules + maintenance plan
```

**Output Esperado**: Diagrama de arquitectura de feeds, reglas de transformación y normalización, plan de mantenimiento.

## Caso de Uso 4: Plan de Mantenimiento de Dashboard

**Contexto**: Dashboards existentes se han degradado porque nadie los mantiene. Se necesita un plan de mantenimiento formal.

**Prompt Template**:
```
Diseña plan de mantenimiento para los dashboards del proyecto {proyecto}:
- Dashboards existentes: {lista_dashboards}
- Problemas actuales: feeds rotos, datos desactualizados, widgets sin datos
- Ownership: asignar responsable por dashboard y por feed
- Cadencia: revisión semanal de feeds, mensual de widgets, trimestral de diseño
- Escalation: protocolo cuando un feed falla más de 24h
- Output: Plan de mantenimiento + ownership matrix + escalation protocol
```

**Output Esperado**: Documento de mantenimiento con ownership, cadencias, y protocolo de escalamiento.

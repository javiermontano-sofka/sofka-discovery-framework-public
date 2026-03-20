# Use Case Prompts — DevOps-PM Alignment

## Caso de Uso 1: Pipeline-to-Milestone Mapping

**Contexto**: Proyecto con CI/CD en GitHub Actions y PM en Jira necesita que deploys actualicen automáticamente el progreso de milestones.

**Prompt Template**:
```
Diseña el mapeo pipeline-to-milestone para el proyecto {proyecto}:
- CI/CD: GitHub Actions (build → test → staging → production)
- PM Tool: Jira (sprints, epics, milestones)
- Mapeo requerido: cada stage del pipeline corresponde a un estado en Jira
- Automatización: webhooks de GitHub → Jira API para actualizar status
- Métricas: deployment frequency, lead time extraídos del pipeline
- Output: Mapping document + webhook configuration + milestone auto-update rules
```

**Output Esperado**: Tabla de mapeo stage→milestone, configuración de webhooks, y reglas de actualización automática.

## Caso de Uso 2: DORA-PM Metric Correlation Dashboard

**Contexto**: La organización quiere un dashboard unificado que muestre DORA metrics junto con PM KPIs para entender la relación entre engineering performance y project health.

**Prompt Template**:
```
Diseña dashboard de correlación DORA-PM para el proyecto {proyecto}:
- DORA metrics: deployment frequency, lead time, MTTR, change failure rate
- PM KPIs: SPI, CPI, velocity, defect density
- Correlaciones a mostrar: deployment freq vs sprint completion, failure rate vs defect density
- Periodo: últimos 6 sprints con trend
- Alertas: cuando correlación indica riesgo (ej: failure rate up → CPI will drop)
- Output: Dashboard design + data feed config + alert rules
```

**Output Esperado**: Diseño de dashboard con 8 widgets correlacionados, configuración de feeds, y reglas de alerta predictivas.

## Caso de Uso 3: Integrated Ceremony Calendar

**Contexto**: El equipo tiene ceremonias PM (sprint review, retro) y ceremonias DevOps (release review, incident postmortem) separadas. Se necesita integrarlas.

**Prompt Template**:
```
Diseña el calendario integrado de ceremonias DevOps-PM para el equipo {equipo}:
- Ceremonias PM actuales: daily standup, sprint planning, sprint review, retrospective
- Ceremonias DevOps actuales: deployment review, incident postmortem, architecture review
- Objetivo: merge donde posible, align donde no
- Para cada ceremonia integrada: agenda, participantes, inputs DevOps + PM, outputs
- Output: Calendar template + ceremony playbooks + RACI per ceremony
```

**Output Esperado**: Calendario semanal/bi-semanal con ceremonias integradas, playbooks, y RACI.

## Caso de Uso 4: Change Control Tiering

**Contexto**: El CCB actual bloquea todos los deploys con aprobación de 48h. Engineering necesita deploy diario para features planificados.

**Prompt Template**:
```
Diseña sistema de change control por tiers para el proyecto {proyecto}:
- Tier 0 (Automated): bug fixes, dependency updates → pipeline gates only
- Tier 1 (Standard): planned features → team + PO approval at sprint review
- Tier 2 (Elevated): infrastructure changes → CCB review 48h
- Tier 3 (High): database migrations, security changes → CCB + specialist review 1 week
- Tier Emergency: P1 incidents → immediate + post-hoc CCB
- Para cada tier: criteria, approval chain, documentation, SLA
- Output: Change control policy + decision tree + approval matrix
```

**Output Esperado**: Política de change control con 5 tiers, diagrama de decisión, y matriz de aprobación.

# Opportunity Management — Use Case Prompts

> PMO-APEX Skill Prompts | 4 Contextualized Use Cases | Last updated: 2026-03-17

---

## Use Case 1: Project Opportunity Scan

```
/pm:opportunity-management $PROJECT_NAME --scan

Escanear oportunidades para {NOMBRE_PROYECTO}.
Fase actual: {FASE}. Equipo: {N} personas. Presupuesto restante: {MONTO}.

Dimensiones a escanear:
- Schedule: posibilidad de entrega anticipada
- Costo: posibles ahorros o eficiencias
- Scope: valor adicional entregable
- Técnico: reutilización, simplificación arquitectónica

Requiero:
1. Lista de oportunidades identificadas por dimensión [PLAN]
2. Assessment de probabilidad e impacto por oportunidad [METRIC]
3. Estrategia recomendada (exploit/share/enhance/accept) [PLAN]
4. Inversión requerida vs upside esperado [METRIC]
```

## Use Case 2: Opportunity Exploitation Plan

```
/pm:opportunity-management $PROJECT_NAME --strategy=exploit --opportunity="Early vendor delivery"

Plan de explotación para oportunidad específica en {NOMBRE_PROYECTO}.
Oportunidad: {DESCRIPCION}. Probabilidad: {%}. Impacto positivo: {DESCRIPCION}.

Requiero:
1. Plan de acciones para maximizar probabilidad de realización [PLAN]
2. Recursos necesarios para explotar la oportunidad [METRIC]
3. Timeline de acciones y decision points [SCHEDULE]
4. Métricas de realización y tracking [METRIC]
5. Plan B si la oportunidad no se materializa [PLAN]
```

## Use Case 3: Opportunity-Threat Balance Report

```
/pm:opportunity-management $PROJECT_NAME --report --tracking=dashboard

Reporte balanceado de oportunidades vs amenazas para {NOMBRE_PROYECTO}.

Requiero:
1. Dashboard balanceado: threats vs opportunities con EMV [METRIC]
2. Net risk position (EMV amenazas - EMV oportunidades) [METRIC]
3. ROI de oportunidades explotadas vs inversión realizada [METRIC]
4. Oportunidades expiradas sin explotar (valor perdido) [METRIC]
5. Recomendaciones para siguiente período [PLAN]
```

## Use Case 4: Portfolio Opportunity Synergies

```
/pm:opportunity-management $PORTFOLIO --scan

Identificar sinergias de oportunidades cross-proyecto en el portfolio.
Proyectos: {LISTA_PROYECTOS}. Portfolio value: {MONTO}.

Requiero:
1. Oportunidades de reutilización técnica entre proyectos [PLAN]
2. Oportunidades de shared learning y knowledge transfer [PLAN]
3. Oportunidades de resource sharing y capacity optimization [METRIC]
4. Valor agregado estimado de explotar sinergias [METRIC]
```

---

*PMO-APEX v1.0 — Use Case Prompts: Opportunity Management*

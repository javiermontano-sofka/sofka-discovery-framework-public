# Metaprompts — Portfolio Dashboard

> PMO-APEX Skill: `portfolio-dashboard` · Metaprompts para adaptación de dashboards
> Última actualización: 2026-03-17

---

## MP-01: Information Overload Reducer

```
Audita el dashboard de {nombre_portfolio} para information overload.
Para cada elemento: identifica la decisión que informa. Remueve
elementos no accionables. Aplica 5-second rule: puede un ejecutivo
captar el estado del portafolio en 5 segundos? Aplica progressive
disclosure: summary en la primera vista, drill-down disponible.
```

## MP-02: Dashboard Truthfulness Validator

```
Valida que el dashboard de {nombre_portfolio} refleja la realidad.
Verifica: RAG thresholds calibrados apropiadamente (no siempre blue),
aggregation no oculta extremos (worst-case vs. average), leading
indicators incluidos (no solo lagging), y data freshness visible.
Inyecta un escenario "known bad" y verifica que el dashboard lo detecte.
```

## MP-03: Stakeholder Persona Matching

```
Diseña vistas de dashboard para 3 personas del portfolio de
{nombre_portfolio}: C-level (30 segundos, decisiones estratégicas),
PMO Director (5 minutos, optimización de portafolio), y PM
(diario, delivery y recursos). Mismos datos subyacentes, diferentes
presentaciones. Define navigation entre vistas.
```

## MP-04: Dashboard Automation Plan

```
Diseña el plan de automatización del dashboard de {nombre_portfolio}.
Para cada componente: fuente de datos actual (manual/automática),
fuente ideal (API, database, tool integration), esfuerzo de
automatización, y prioridad. Target: reducir esfuerzo de actualización
de dashboard de {horas_actuales} a menos de 1 hora semanal.
```

## MP-05: Portfolio Dashboard for Board Presentation

```
Adapta el dashboard de {nombre_portfolio} para presentación al
Board of Directors. Reduce a 3 KPIs máximo. Elimina jerga técnica.
Conecta portfolio health con business outcomes. Agrega comparison
con benchmarks de industria. Formato: 1 slide / 2 minutos de
presentación con talking points para el presenter.
```

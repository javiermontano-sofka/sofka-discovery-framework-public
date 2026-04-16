# Metaprompts — Portfolio Prioritization

> PMO-APEX Skill: `portfolio-prioritization` · Metaprompts para adaptación
> Última actualización: 2026-03-17

---

## MP-01: Bias-Free Prioritization Validator

```
Audita la priorización del portafolio de {nombre_organizacion}
buscando sesgos cognitivos: recency bias (proyectos recientes
scorados más alto), sunk cost bias (proyectos viejos priorizados
por inercia), HiPPO bias (pet projects de ejecutivos inflados),
familiarity bias (dominios conocidos priorizados). Re-score con
correcciones de sesgo y compara rankings.
```

## MP-02: Constraint-Aware Optimization

```
Optimiza la selección del portafolio de {nombre_organizacion}
bajo constraints reales. No solo rankear por score — encontrar
la combinación que maximiza valor total dentro de constraints
de {lista_constraints}. Identifica qué constraints, si se relajan,
desbloquean más valor adicional. Genera efficient frontier.
```

## MP-03: Portfolio Balance Checker

```
Verifica el balance del portafolio priorizado de {nombre_organizacion}
en 4 dimensiones: temas estratégicos (ninguno > 50% del budget),
risk balance (no todo high-risk ni todo low-risk), time horizon
(short-term wins + long-term investments), innovation ratio
(run/grow/transform). Ajusta priorización para lograr balance.
```

## MP-04: Scenario-Based Prioritization

```
El contexto de {nombre_organizacion} puede cambiar según escenarios:
{escenario_1}, {escenario_2}, {escenario_3}. Para cada escenario:
ajusta pesos de criterios y re-score el portafolio. Identifica
proyectos robustos (top en todos los escenarios) vs. vulnerables
(ranking cambia significativamente). Recomienda portafolio robusto.
```

## MP-05: Political Pressure Protocol

```
El portafolio de {nombre_organizacion} enfrenta presión política
para priorizar {proyecto_presionado} a pesar de scoring bajo.
Documenta formalmente: score del proyecto vs. ranking, diferencia
con el scoring model, riesgos de override político, y tracking
plan para comparar outcome del proyecto vs. predicción del modelo.
```

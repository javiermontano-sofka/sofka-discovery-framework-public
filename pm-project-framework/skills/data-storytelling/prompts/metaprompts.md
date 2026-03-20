# Data Storytelling — Metaprompts

> Meta-prompts for evolution, auditing, and improvement of the data-storytelling skill.

---

## Meta-prompt 1: Narrative Quality Audit

```
Revisa el siguiente output de data-storytelling contra el Validation Gate del skill:

[PEGAR OUTPUT]

Evalúa cada criterio:
1. ¿Cada métrica tiene contexto? (no solo el número)
2. ¿Cada métrica tiene comparación? (vs. baseline, benchmark, target, periodo anterior)
3. ¿Los insights son accionables? ("¿Y qué?" respondido para cada dato)
4. ¿Las magnitudes son tangibles? (FTE-meses traducidos a equipo-equivalente)
5. ¿Los patrones de scoring están destacados? (no solo scores individuales)
6. ¿Hay cero números desnudos? (ninguna métrica sin interpretación)

Para cada criterio fallido, proporciona:
- Ejemplo específico del fallo
- Corrección sugerida
- Impacto del fallo en la calidad del entregable
```

## Meta-prompt 2: Comparison Pattern Evolution

```
El skill data-storytelling tiene 6 marcos de comparación:
Before/After, Peer Benchmark, Industry Standard, Internal Baseline, Target Gap, Cost Equivalence.

Analiza:
1. ¿Hay contextos de discovery donde ninguno de los 6 marcos aplica? Identifica gaps.
2. ¿Hay marcos redundantes que podrían consolidarse?
3. ¿Qué marcos nuevos se necesitan para cubrir tendencias emergentes? (ej: AI benchmarks, sustainability metrics, platform engineering metrics)
4. Para cada marco propuesto, provee: nombre, cuándo usar, estructura, ejemplo.

Restricción: mantener la regla de NUNCA valores monetarios — solo FTE-meses y magnitudes relativas.
```

## Meta-prompt 3: Evidence Tag Calibration

```
Revisa los siguientes insights generados por data-storytelling:

[PEGAR INSIGHTS]

Para cada insight, evalúa:
1. ¿El evidence tag es correcto? ([CÓDIGO] vs [INFERENCIA] vs [SUPUESTO])
2. ¿El nivel de confianza es apropiado para el tag usado?
3. ¿Hay inferencias presentadas como hechos (tag incorrecto)?
4. ¿Hay supuestos no declarados que deberían tener tag [SUPUESTO]?
5. ¿Las cadenas de inferencia son explícitas? (A [CÓDIGO] → B [INFERENCIA] → C [INFERENCIA])

Proporciona versión corregida con tags calibrados y cadenas de inferencia explícitas.
```

## Meta-prompt 4: Magnitude Stress Test

```
El skill data-storytelling convierte FTE-meses en equivalencias tangibles.

Toma estas magnitudes y aplica stress test:
[LISTA DE MAGNITUDES EN FTE-MESES]

Para cada una:
1. ¿La equivalencia equipo-tiempo es matemáticamente correcta?
2. ¿La analogía es comprensible para audiencia no técnica?
3. ¿Hay una equivalencia más impactante que la propuesta?
4. ¿El costo de inacción está cuantificado (también en FTE-meses)?
5. ¿Se evitan valores monetarios en toda la cadena?

Proporciona versión mejorada con al menos 2 equivalencias por magnitud.
```

## Meta-prompt 5: Quality Benchmark vs. Best Practices

```
Compara el output actual del skill data-storytelling con las mejores prácticas de:
- Knaflic (Storytelling with Data): Contexto, simplificación, foco en acción
- Dykes (Effective Data Storytelling): Insight = dato + narrativa + visual
- Tufte (Visual Display): Ratio datos-tinta, integridad gráfica
- McKinsey (Pyramid Principle): MECE, síntesis primero, evidencia después

Para cada framework:
1. ¿Qué principios ya están incorporados en el skill?
2. ¿Qué principios faltan o están subdesarrollados?
3. ¿Qué principios contradicen el enfoque actual? (y por qué es válida la divergencia)
4. Proponer 3 mejoras concretas priorizadas por impacto.
```

## Meta-prompt 6: New Edge Case Generation

```
El skill data-storytelling maneja 3 edge cases:
- Sin benchmarks disponibles
- Métricas contradictorias
- Datos escasos

A partir de experiencia en discovery de consultoría tecnológica:
1. Identifica 5 edge cases adicionales no contemplados
2. Para cada uno: descripción, frecuencia estimada, ejemplo real, tratamiento propuesto
3. Evalúa si algún edge case existente necesita refinamiento
4. Propón actualización del SKILL.md con los nuevos edge cases

Contexto: enterprise consulting, LATAM, equipos de 20-200 desarrolladores, vertical agnóstica.
```

## Meta-prompt 7: Skill Evolution for New Audiences

```
El skill data-storytelling soporta 3 audiencias: executive, technical, mixed.

Evalúa:
1. ¿Se necesitan audiencias adicionales? (ej: board-level, developer, product-owner, regulator)
2. Para cada audiencia propuesta:
   - ¿Qué cambia en el patrón M2M (Metrics-to-Meaning)?
   - ¿Qué marcos de comparación son más relevantes?
   - ¿Qué nivel de detalle técnico es apropiado?
   - ¿Qué jerga o terminología debe usarse/evitarse?
3. Propón template de narrativa diferenciada por audiencia para un mismo dataset.

Restricción: mantener coherencia con los demás skills del framework (storytelling, copywriting, output-engineering).
```

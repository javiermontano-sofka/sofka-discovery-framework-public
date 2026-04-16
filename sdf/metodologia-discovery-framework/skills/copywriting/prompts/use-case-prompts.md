# Copywriting — Prompts de Caso de Uso

> 8 prompts que demuestran cómo invocar el skill de copywriting en diferentes contextos del Discovery Framework.

---

## 1. Executive Summary para Brief Técnico

```
/mao:brief

Contexto: Tenemos el análisis AS-IS completo de [ClienteCo]. Necesito el executive summary
del Brief Técnico (02). Audiencia: CEO y CTO juntos en la misma reunión.

Datos clave del AS-IS:
- 1,850 archivos analizados, 62% con complejidad ciclomática > 20
- 0 tests de integración, 12% cobertura unitaria
- 3 bases de datos sin documentar, 47 stored procedures legacy
- MTTR: 8 horas (benchmark sector: 1h)
- El equipo reporta que el 70% de su tiempo es mantenimiento reactivo

Formato: markdown. Variante: ejecutiva. Tono: mixed (CEO + CTO).
El summary no debe superar 2 páginas.
```

**Qué activa:** Copywriting con PAS + pirámide invertida. Evidence tagging sobre datos del AS-IS. Tono calibrado para audiencia mixta.

---

## 2. Cost-of-Inaction para Escenarios

```
Necesito la sección de Costo de Inacción para el documento de escenarios (05).
El cliente tiene estos datos de tendencia de los últimos 4 trimestres:

- Q1: 10 FTE-meses mantenimiento, 3 incidentes/mes
- Q2: 12 FTE-meses, 3.5 incidentes/mes
- Q3: 14 FTE-meses, 4.1 incidentes/mes
- Q4: 15 FTE-meses, 4.2 incidentes/mes

Proyectar los próximos 4 trimestres. Identificar el punto de no retorno.
Audiencia: CFO (quiere números, no narrativa). Formato: markdown.
```

**Qué activa:** Framework COI puro. Proyección cuantitativa. Calibración CFO (tablas, métricas, mínima prosa). Tags [INFERENCIA] en proyecciones.

---

## 3. Value Proposition por Escenario

```
Escribe las propuestas de valor para los 3 escenarios del documento 05.
Cada propuesta debe seguir la estructura:
[Beneficio cuantificado] + [para quién] + [eliminando qué dolor] + [en qué plazo]

Escenario A - Optimización: TTM de 12 a 9 semanas, inversión 15 FTE-meses
Escenario B - Modernización: TTM de 12 a 4 semanas, inversión 40 FTE-meses
Escenario C - Reemplazo: TTM de 12 a 2 semanas, inversión 80 FTE-meses

Audiencia: board. Formato: markdown. Máximo 3 oraciones por propuesta.
```

**Qué activa:** Técnica de Value Proposition Construction. Concisión radical (3 oraciones). Calibración board (gobernanza, riesgo).

---

## 4. Call to Action para Cierre de Pitch

```
Escribe el Call to Action de cierre para el Pitch Ejecutivo (08).

Recomendación del comité: Escenario B (Modernización Incremental)
Sprint 0 puede iniciar en 2 semanas si se aprueba esta semana
Primer quick win proyectado: semana 8 (API gateway)
Si no se actúa: +8 FTE-meses deuda/trimestre, punto de no retorno en 9 meses

Audiencia: CEO. Debe ser directo, 1 párrafo + lista de next steps.
No más de 150 palabras total.
```

**Qué activa:** CTA Design (acción + plazo + next step + consecuencia). Calibración CEO. Concisión extrema.

---

## 5. Hallazgos Narrativos para Findings Deck

```
Convierte estos 5 hallazgos técnicos en narrativas ejecutivas para la Presentación
de Hallazgos (10). Cada hallazgo: headline (conclusión, no tema) + 2-3 oraciones
+ impacto cuantificado + evidence tag.

1. 62% del código sin tests → riesgo de regresión en cada deploy
2. Monolito de 450K LOC → TTM de 12 semanas por acoplamiento
3. 3 BDs sin esquema documentado → 6h MTTR por falta de contexto
4. 0 pipelines CI/CD → deploys manuales cada 2 semanas
5. 47 stored procedures con lógica de negocio → imposible migrar sin reescribir

Audiencia: mixed. Formato: markdown. Cada hallazgo máximo 100 palabras.
```

**Qué activa:** PAS comprimido por hallazgo. Headlines como conclusiones. Evidence tagging. Densidad informativa máxima.

---

## 6. Recomendación Justificada para Roadmap

```
Escribe la sección de justificación de la recomendación para el Roadmap (06).

El comité evaluó 3 escenarios con estos scores (escala 1-5, 6 dimensiones):
- Escenario A: Impacto 2, Viabilidad 5, Riesgo 4, Costo 5, Velocidad 4, Sostenibilidad 1
- Escenario B: Impacto 4, Viabilidad 4, Riesgo 3, Costo 3, Velocidad 3, Sostenibilidad 4
- Escenario C: Impacto 5, Viabilidad 2, Riesgo 1, Costo 1, Velocidad 1, Sostenibilidad 5

El comité recomienda B por 7 votos contra 2 (A) y 2 (C).
La posición disidente de A argumenta menor riesgo. La de C argumenta mayor impacto a largo plazo.

Audiencia: CTO. Incluir trade-offs y posiciones disidentes.
```

**Qué activa:** Técnica de opciones con trade-offs. Transparencia en disenso. Calibración CTO. Evidence tags en votos del comité.

---

## 7. Narrativa de Transformación (Before-After-Bridge)

```
Escribe una narrativa BAB (Before-After-Bridge) para la sección de visión
del Pitch Ejecutivo (08).

Before (AS-IS):
- Monolito de 7 años, 450K LOC, 0 tests integración
- TTM: 12 semanas, 80% del equipo en mantenimiento
- 4.2 incidentes críticos/mes

After (TO-BE a 12 meses):
- 4 microservicios core extraídos, cobertura > 70%
- TTM: 4 semanas, 40% del equipo en innovación
- < 1 incidente crítico/mes

Bridge: Roadmap de 4 fases, empezando por Sprint 0 en Q2

Audiencia: CEO. Tono visionario pero anclado en datos. Máximo 250 palabras.
```

**Qué activa:** Framework BAB. Calibración CEO (visión + datos). Concisión (250 palabras).

---

## 8. Micro-Copy para Semáforos y Callouts

```
Genera el micro-copy para los callouts del documento AS-IS (03).
Necesito:

- 3 callouts de insight (💡) — patrones positivos encontrados
- 3 callouts de riesgo (⚠️) — riesgos críticos identificados
- 2 callouts de trade-off (⚖️) — decisiones con pros y contras

Cada callout: máximo 2 oraciones. Primer oración = conclusión con dato.
Segunda oración = implicación o next step.

Contexto: plataforma e-commerce, 450K LOC, equipo de 18 devs.
```

**Qué activa:** Micro-copy de señalización. Concisión extrema (2 oraciones). Estructura conclusión + implicación.

---

*Prompts de caso de uso v1.0 — MetodologIA Discovery Framework, skill: copywriting*
*© Comunidad MetodologIA. Todos los derechos reservados.*

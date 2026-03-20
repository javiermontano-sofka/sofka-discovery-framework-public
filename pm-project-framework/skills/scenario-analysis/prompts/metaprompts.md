# Metaprompts — Strategic Scenario Analysis

> Estrategias de meta-nivel para maximizar la efectividad de esta skill.
> Los metaprompts no producen entregables — optimizan COMO se producen.

---

## 1. Adversarial Scenarios (Stress-Test with Worst Case)

**Proposito:** Forzar al analisis a considerar escenarios adversos que el optimismo natural del equipo tiende a ignorar. Cada escenario debe sobrevivir su "worst day."

```
Despues de generar los 3 escenarios con sus scores, ejecuta este stress-test adversarial:

Para CADA escenario, construye su "Worst Case Day":
1. FALLO TECNICO: ¿Cual es el fallo tecnico mas probable durante la implementacion?
   - Para A (Conservative): ¿Que pasa si el API Gateway tiene una vulnerabilidad critica?
   - Para B (Moderate): ¿Que pasa si el anti-corruption layer falla bajo carga?
   - Para C (Aggressive): ¿Que pasa si la migracion de datos corrompe el 0.1% de registros?

2. FALLO ORGANIZACIONAL: ¿Que pasa si el recurso clave renuncia en el mes 3?
   - ¿Cuanto se degrada el timeline? ¿Hay single points of failure humanos?

3. FALLO DE MERCADO: ¿Que pasa si el competidor lanza primero?
   - ¿El escenario permite pivotar? ¿O ya estamos comprometidos?

4. FALLO REGULATORIO: ¿Que pasa si la regulacion cambia mid-implementation?
   - ¿El escenario es adaptable o estamos locked-in a un approach?

Para cada worst case, ajusta el score de la dimension afectada.
Si algun escenario cae mas de 1.5 puntos bajo worst case, flag como FRAGIL.
Documenta: "Escenario X es robusto (delta < 0.5) / resiliente (0.5-1.0) / fragil (> 1.5)"

Resultado: Tabla de robustez por escenario que complementa el scoring principal.
```

---

## 2. Stakeholder Perspective Rotation

**Proposito:** Evaluar cada escenario desde la perspectiva de diferentes stakeholders. Lo que es optimo para el CTO puede ser suboptimo para el CFO o el equipo de operaciones.

```
Para cada escenario, rota la evaluacion por 5 perspectivas de stakeholder:

PERSPECTIVA 1 — CFO (Financiera):
- ¿Como se ve el TCO a 3 años? ¿El CAPEX es aprobable en este ciclo fiscal?
- ¿Cuando se produce el break-even?
- ¿Que pasa si hay que cortar presupuesto en el año 2?
- Score ajustado: re-evalua Cost y Time-to-Value desde esta perspectiva.

PERSPECTIVA 2 — CTO (Tecnologica):
- ¿Este escenario me deja en mejor posicion tecnica en 3 años?
- ¿Puedo atraer talento con este stack/approach?
- ¿La deuda tecnica se reduce, se mantiene, o se traslada?
- Score ajustado: re-evalua Strategic Alignment y PoC Speed.

PERSPECTIVA 3 — CISO (Seguridad):
- ¿El surface de ataque crece, se mantiene, o se reduce?
- ¿Los datos sensibles estan protegidos durante la transicion?
- ¿Paso la auditoria el proximo trimestre?
- Score ajustado: re-evalua Regulatory Fit y Operational Risk.

PERSPECTIVA 4 — Head of Operations (Estabilidad):
- ¿Cuantas horas de downtime durante la migracion?
- ¿Mi equipo de ops puede operar el nuevo sistema?
- ¿Necesito capacitacion, contratacion, o outsourcing?
- Score ajustado: re-evalua Operational Risk.

PERSPECTIVA 5 — Product Owner (Negocio):
- ¿Cuando puedo lanzar el proximo producto digital?
- ¿Este escenario desbloquea features que mis usuarios piden?
- ¿Cuanto tiempo estoy "congelado" durante la migracion?
- Score ajustado: re-evalua Time-to-Value y Strategic Alignment.

Producir una tabla: Escenario x Stakeholder con el score ajustado.
Si hay un escenario que gana para 4/5 stakeholders, es candidato fuerte.
Si cada stakeholder prefiere un escenario diferente, escalar a steering committee con datos.
```

---

## 3. Time Horizon Expansion

**Proposito:** El scoring 6D evalua a 12-18 meses por default. Esta meta-estrategia expande a 3 horizontes para revelar inversiones de ranking.

```
Evaluar cada escenario en 3 horizontes temporales:

HORIZONTE 1 — Corto plazo (0-12 meses):
- ¿Que valor entrega en el primer año?
- ¿Cual es el costo de oportunidad durante la implementacion?
- Score: usar scoring 6D estandar.

HORIZONTE 2 — Medio plazo (1-3 años):
- ¿Como se ve el TCO acumulado?
- ¿Las capacidades habilitadas estan generando valor?
- ¿La deuda tecnica residual crece o decrece?
- Re-score: Cost (TCO 3yr), Strategic Alignment (capabilities delivered),
  Operational Risk (system matured or still fragile?)

HORIZONTE 3 — Largo plazo (3-5 años):
- ¿El escenario me posiciona bien para la siguiente ola tecnologica?
- ¿Necesitare otro modernization effort en 3 años?
- ¿El ecosistema del stack elegido esta creciendo o muriendo?
- Re-score: Strategic Alignment (future-proofing), Cost (total lifecycle),
  Regulatory Fit (regulacion futura estimada)

ANALISIS CLAVE:
- ¿Algun escenario que pierde en corto plazo GANA en largo plazo?
- ¿El escenario ganador a 12 meses sigue ganando a 5 años?
- Si hay inversion de ranking, documentar en que horizonte ocurre y por que.

Formato: Tabla de scores por escenario x horizonte.
Incluir: "Inversion alert" si el ranking cambia entre horizontes.
```

---

## 4. Constraint Relaxation

**Proposito:** Identificar cuales restricciones del proyecto estan limitando la recomendacion. Si una restriccion se relaja, ¿cambia la decision?

```
Despues del scoring initial, ejecuta este analisis de sensibilidad por restriccion:

RESTRICCION 1 — Presupuesto:
- Score actual con budget = {BUDGET_ACTUAL}
- ¿Que pasa si budget = {BUDGET_ACTUAL} x 1.5? ¿Y x 2?
- ¿Algun escenario "Conditional" se vuelve "Viable"?

RESTRICCION 2 — Timeline:
- Score actual con deadline = {TIMELINE_ACTUAL} meses
- ¿Que pasa si timeline = {TIMELINE_ACTUAL} + 6 meses? ¿Y + 12?
- ¿El escenario agresivo se vuelve viable con mas tiempo?

RESTRICCION 3 — Team capacity:
- Score actual con team = {TEAM_SIZE} personas
- ¿Que pasa si contratamos {N} senior engineers en 60 dias?
- ¿Que escenarios mejoran y cuanto?

RESTRICCION 4 — Regulatory:
- Score actual con regulacion = {REGULACION_ACTUAL}
- ¿Que pasa si el regulador aprueba cloud para datos sensibles?
- ¿Que pasa si el regulador endurece (nuevo framework de compliance)?

RESTRICCION 5 — Organizational readiness:
- Score actual con madurez = {NIVEL_MADUREZ}
- ¿Que pasa si adoptamos platform engineering primero?
- ¿Que escenarios se desbloquean con mayor madurez operativa?

Para cada relajacion, calcular:
- Delta de score por escenario
- ¿Cambia la recomendacion? Si/No
- Costo de relajar la restriccion (si es posible)
- ROI de relajar: (delta score x valor estrategico) / costo de relajacion

Producir: "Si pudiera cambiar UNA restriccion, deberia ser {X} porque
desbloquea {Y} puntos de score por ${Z} de inversion."
```

---

## 5. Anti-Patterns in Scenario Analysis (Que NO Hacer)

**Proposito:** Evitar los errores mas comunes que invalidan un scenario analysis. Auto-check antes de entregar.

```
Antes de entregar el scenario analysis, ejecuta este anti-pattern check:

ANTI-PATRON 1: "Scenario Theater" (Escenarios de Cartón)
❌ Los 3 escenarios son variaciones menores del mismo approach.
❌ El SWOT de los escenarios "perdedores" es superficial.
❌ El equipo ya sabia que iba a elegir B antes de empezar.
✅ CHECK: ¿Los escenarios difieren en approach fundamental, no solo en parametros?
✅ CHECK: ¿El SWOT de cada escenario tiene la misma profundidad?
✅ CHECK: ¿Hay al menos 1 escenario que desafia la intuicion del equipo?

ANTI-PATRON 2: "Analysis Paralysis" (Exceso de Analisis)
❌ 7+ escenarios evaluados con igual profundidad.
❌ El scoring tiene 10+ dimensiones y nadie puede procesarlo.
❌ El documento tiene 50+ paginas y nadie lo lee.
✅ CHECK: ¿3-5 escenarios es suficiente para esta decision?
✅ CHECK: ¿Las 6 dimensiones son diferenciantes? ¿Alguna se puede colapsar?
✅ CHECK: ¿La variante ejecutiva (~40%) es suficiente para la audiencia?

ANTI-PATRON 3: "False Precision" (Falsa Precision)
❌ "Escenario A = 7.4132 vs B = 7.4089" — la diferencia no es significativa.
❌ Los scores tienen 2+ decimales de precision que no se justifican.
❌ Los pesos tienen precision de 1% (19% vs 20%) sin justificacion.
✅ CHECK: ¿La diferencia entre escenarios es > 0.5 puntos? Si no, es trade-off zone.
✅ CHECK: ¿Los scores reflejan incertidumbre? ¿Hay rango, no punto unico?
✅ CHECK: ¿Los pesos son multiplos de 5%?

ANTI-PATRON 4: "Confirmation Bias in Scoring" (Sesgo de Confirmacion)
❌ El escenario favorito del sponsor tiene scores inflados.
❌ Las debilidades del favorito estan en el SWOT pero no afectan el score.
❌ Los escenarios alternativos tienen scores conservadores sin justificacion.
✅ CHECK: ¿Puedo defender cada score individualmente con evidencia?
✅ CHECK: ¿El scenario-challenger agent verifico los scores del favorito?
✅ CHECK: ¿Intercambie el orden de evaluacion (evaluar C primero, no siempre A)?

ANTI-PATRON 5: "Missing the Do-Nothing Baseline"
❌ No se cuantifico el costo de NO hacer nada.
❌ Los escenarios se comparan entre si, pero no contra el status quo.
❌ El steering committee no tiene perspectiva de "que pasa si no actuamos."
✅ CHECK: Si solo hay 2 escenarios viables, ¿genere "Do Nothing" como tercero?
✅ CHECK: ¿El costo de inaccion esta cuantificado? (ej: +18% YoY mantenimiento)
✅ CHECK: ¿El conditional switching incluye "si no se aprueba presupuesto"?

Si 2+ anti-patrones se detectan, revisar antes de entregar.
Si el anti-patron 1 (Scenario Theater) se detecta, el analisis no es valido — regenerar con divergencia real.
```

---

**Autor:** Javier Montano | **Ultima actualizacion:** 13 de marzo de 2026
**© Comunidad MetodologIA — Todos los derechos reservados**

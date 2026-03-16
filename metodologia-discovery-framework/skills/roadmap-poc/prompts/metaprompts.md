# Metaprompts — Roadmap & PoC Execution Planning

> **Autor:** Javier Montaño | **Fecha:** 13 de marzo de 2026
> **© Comunidad MetodologIA** — Todos los derechos reservados

---

## Propósito

Estrategias de meta-prompting para generar, refinar y validar roadmaps de PoC con mayor profundidad y consistencia. Cada metaprompt opera como un patrón reutilizable que amplifica la calidad del output.

---

## MP-01: Inversión de Perspectiva — "El PoC que Fracasó"

### Estrategia

Generar el roadmap desde la perspectiva del fracaso para descubrir gaps que el enfoque optimista no detecta. Se construye el roadmap "hacia atrás" desde el post-mortem.

### Metaprompt

```
Antes de generar el roadmap para {PROYECTO}, ejecuta esta secuencia:

PASO 1 — POST-MORTEM FICTICIO:
Imagina que es {FECHA_FIN + 2 meses}. El PoC fracasó. El cliente está frustrado.
El equipo está desmoralizado. Reconstruye:
- Las 5 causas principales del fracaso
- Las señales tempranas que se ignoraron
- Los prerequisites que nadie validó
- Los gate criteria que se "flexibilizaron"
- El momento exacto donde se debió haber parado

PASO 2 — ROADMAP ANTI-FRACASO:
Ahora genera el roadmap REAL, pero cada sección debe incluir:
- La señal de fracaso que previene
- El kill criterion que la protege
- El gate check que la valida

PASO 3 — DELTA ANALYSIS:
Compara este roadmap con uno generado sin el paso 1.
Documenta qué elementos adicionales aparecieron gracias al enfoque inverso.
```

### Cuándo Usar

- Proyectos de alto riesgo (budget >$500K, tecnología nueva, equipo sin experiencia)
- Clientes con historial de PoCs fallidos
- Cuando el equipo está demasiado optimista sobre el timeline

### Output Esperado

Roadmap con sección adicional "Anti-Fracaso" que documenta los kill criteria derivados del post-mortem ficticio.

---

## MP-02: Decomposición Progresiva — "Zoom In, Zoom Out"

### Estrategia

Generar el roadmap en tres pasadas de resolución creciente, validando consistencia entre niveles. Evita el problema de roadmaps con buen nivel macro pero sin detalle operativo.

### Metaprompt

```
Genera el roadmap para {PROYECTO} en tres pasadas:

PASADA 1 — ZOOM OUT (Vista Ejecutiva):
Genera SOLO el timeline de alto nivel:
- Fases principales (3-5)
- Milestones clave (4-6)
- Gates de decisión (2-3)
- Budget range total
- Team size total
Máximo 1 página. Un ejecutivo debe entender el plan en 2 minutos.

PASADA 2 — ZOOM IN (Vista Operativa):
Para CADA fase de la Pasada 1, genera:
- Sprint breakdown con daily allocation
- Prerequisites específicos de esa fase
- Gate criteria detallados con PASS/FAIL/CONDITIONAL
- Risk register de la fase
Valida: ¿La suma de sprints = el timeline de Pasada 1? ¿Los budgets son consistentes?

PASADA 3 — MICROSCOPIO (Sprint 1 Detallado):
Para Sprint 1 específicamente, genera:
- Task allocation hora por hora (no solo día por día)
- Dependency graph entre tareas
- Capacity utilization por persona
- Definition of Done para cada entregable
- Riesgos específicos del Sprint 1 con mitigación diaria
Valida: ¿El Sprint 1 detallado es ejecutable Day 1 sin rework?

VALIDACIÓN CRUZADA:
- ¿Pasada 2 es consistente con Pasada 1?
- ¿Pasada 3 es consistente con Pasada 2?
- ¿Hay contradicciones entre niveles?
```

### Cuándo Usar

- Cuando se necesita tanto la vista ejecutiva como la operativa
- Para validar que el plan macro es realista a nivel de detalle
- Cuando diferentes audiencias consumirán el roadmap

### Output Esperado

Documento con tres secciones claramente marcadas (Ejecutiva / Operativa / Sprint 1 Detail) más una sección de validación cruzada.

---

## MP-03: Stress Testing de Constraints — "¿Y si...?"

### Estrategia

Tomar cada constraint del roadmap y modelar qué pasa si se rompe. Produce un roadmap más resiliente con planes de contingencia pre-diseñados.

### Metaprompt

```
Genera el roadmap base para {PROYECTO}, luego ejecuta stress testing:

ROADMAP BASE:
[Genera las 7 secciones estándar]

STRESS TEST — Para cada constraint, modela el escenario:

1. ¿Y si el timeline se reduce 30%?
   → ¿Qué se recorta? ¿Qué calidad se sacrifica? ¿Es viable?

2. ¿Y si el equipo pierde un recurso clave en Sprint 1?
   → ¿Quién absorbe? ¿Se retrasa? ¿Se re-scopia?

3. ¿Y si un prerequisite blocker no se resuelve en Week 0?
   → ¿Se puede empezar parcialmente? ¿Cuál es el costo del delay?

4. ¿Y si el Gate 1→2 falla?
   → ¿Remediación sprint? ¿Re-scope? ¿Kill?

5. ¿Y si el budget se aprueba al 70% de lo solicitado?
   → ¿Qué scope se mantiene? ¿Qué se difiere? ¿Es viable el PoC reducido?

RESILIENCE SCORE:
Para cada stress test, clasifica la resiliencia del roadmap:
- RESILIENTE: El plan se adapta sin comprometer objetivos
- FRÁGIL: El plan se rompe — necesita plan B explícito
- FATAL: El plan no sobrevive este escenario — kill criterion

Incorpora los planes de contingencia al roadmap base.
```

### Cuándo Usar

- Proyectos con alta incertidumbre en constraints
- Clientes con historial de cambios de scope o budget
- Cuando se sospecha que el equipo no ha considerado escenarios adversos

### Output Esperado

Roadmap con sección "Resilience Matrix" que documenta la respuesta a cada stress scenario.

---

## MP-04: Validación por Roles — "La Mesa Redonda"

### Estrategia

Evaluar el roadmap desde la perspectiva de cada rol involucrado. Cada rol "cuestiona" el plan desde sus prioridades, revelando gaps que un solo punto de vista no detecta.

### Metaprompt

```
Genera el roadmap para {PROYECTO}, luego valídalo desde cada perspectiva:

ROL 1 — CTO del cliente:
"¿Este plan es técnicamente viable con mi equipo actual?
¿La arquitectura propuesta se integra con mi stack?
¿Los riesgos técnicos están correctamente evaluados?"

ROL 2 — CFO del cliente:
"¿El budget range es creíble? ¿Hay costos ocultos?
¿Los gates permiten cancelar sin haber gastado todo?
¿El ROI justifica la inversión?"

ROL 3 — PM de MetodologIA:
"¿El sprint breakdown es realista con el equipo disponible?
¿Los prerequisites tienen owners y deadlines reales?
¿La capacity calculation incluye overhead de ceremonias?"

ROL 4 — Developer Senior del equipo:
"¿Las tareas diarias son ejecutables como están escritas?
¿Los acceptance criteria son verificables con tests?
¿El tech stack seleccionado es el correcto para este scope?"

ROL 5 — QA Lead:
"¿Hay tiempo suficiente para testing en cada sprint?
¿Los gate criteria incluyen quality checks?
¿El test environment está en prerequisites?"

SÍNTESIS:
Para cada objeción válida de cada rol, ajusta el roadmap.
Documenta los ajustes en una sección "Mejoras por Validación de Roles".
```

### Cuándo Usar

- Roadmaps que serán presentados a múltiples stakeholders
- Para asegurar que el plan no tiene sesgos de un solo punto de vista
- Cuando se necesita anticipar preguntas del comité de steering

### Output Esperado

Roadmap final con sección de validación multi-rol y ajustes documentados.

---

## MP-05: Benchmark Comparativo — "Nuestro PoC vs la Industria"

### Estrategia

Comparar el roadmap propuesto contra benchmarks de industria para validar que las estimaciones son realistas y competitivas.

### Metaprompt

```
Genera el roadmap para {PROYECTO} en industria {INDUSTRIA},
luego compara contra benchmarks:

BENCHMARK 1 — DURACIÓN:
¿Cuánto tarda un PoC similar en la industria?
- Percentil 25 (equipos rápidos): {X} semanas
- Percentil 50 (promedio): {Y} semanas
- Percentil 75 (equipos lentos): {Z} semanas
¿Dónde cae nuestro plan? ¿Por qué?

BENCHMARK 2 — TEAM SIZE:
¿Cuántos FTEs típicamente se asignan a un PoC de este scope?
¿Nuestro team size es competitivo o estamos over/under-staffed?

BENCHMARK 3 — BUDGET:
¿El budget range propuesto está en línea con el mercado?
¿La distribución (services/infra/contingency) es estándar?

BENCHMARK 4 — SUCCESS RATE:
¿Cuál es la tasa de éxito de PoCs similares en la industria?
¿Nuestros gate criteria capturan las causas más comunes de fracaso?

BENCHMARK 5 — TIME TO VALUE:
¿Cuándo entrega valor el PoC vs cuándo se espera pago?
¿El earned value curve es competitivo?

AJUSTES:
Si el roadmap está fuera de benchmarks, ajusta con justificación.
Si está deliberadamente fuera (por buenas razones), documenta por qué.
```

### Cuándo Usar

- Pre-sales donde el cliente comparará con otras ofertas
- Para validar que las estimaciones no están infladas ni deflactadas
- Cuando se necesita justificar el pricing ante procurement

### Output Esperado

Roadmap con sección "Benchmark Analysis" que posiciona el plan contra la industria.

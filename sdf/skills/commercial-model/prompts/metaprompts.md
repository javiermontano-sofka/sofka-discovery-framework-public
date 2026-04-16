# Metaprompts — Commercial Model

> Estrategias de meta-nivel para maximizar la efectividad de esta skill.
> Los metaprompts no producen entregables — optimizan COMO se producen.

---

## 1. Value-First Pricing (Análisis de Valor Antes de Estructura)

**Propósito:** Antes de evaluar cualquier modelo comercial, forzar un análisis exhaustivo de las fuentes de valor del cliente. Evita el error común de elegir modelo por conveniencia (T&M por default) en lugar de por alineamiento con valor.

```
Para cada fuente de valor identificada en el engagement, aplica este análisis:

NIVEL 1 — Identificación de valor:
- Que problema resuelve esta transformación para el cliente?
- El valor es ahorro (reducción de costos) o enablement (nuevos ingresos)?
- Es medible directamente o requiere proxies?
- En que horizonte temporal se materializa? (inmediato / 6-12m / 12-24m / 24-36m)

NIVEL 2 — Cuantificación (magnitudes):
- Orden de magnitud del valor anual: bajo (<X), medio, alto (>Y)
- Que evidencia soporta esta magnitud? [CÓDIGO] [DOC] [STAKEHOLDER] [INFERENCIA]
- Hay un baseline medible? Si no, como se establece en Sprint 0?
- Confianza en la estimación: alta (data existente) / media (benchmark sectorial) / baja (inferencia)

NIVEL 3 — Atribución:
- Que porcentaje del valor es atribuible a nuestro trabajo vs. factores del cliente?
- Si el cliente no hace nada, cuanto valor se pierde? (costo de inacción)
- Si otro proveedor ejecuta, el resultado seria comparable?

NIVEL 4 — Implicaciones para el modelo:
- Si el valor es alto y medible → candidato para componente outcome-based
- Si el valor es alto pero NO medible → candidato para milestone-based
- Si el valor es incierto → componente fijo protege a ambas partes
- Si el valor depende de escala → usage-based con minimum commitment

Para cada fuente, documentar:
- Tipo de valor (ahorro / revenue / risk / time / compliance / scalability)
- Magnitud estimada y confianza
- Modelo comercial que mejor captura este valor
- KPI candidato para medición

Si ninguna fuente tiene confianza "alta", el modelo debe ser conservador (más fijo, menos variable).
```

---

## 2. Competitive Positioning (Análisis de Posicionamiento Competitivo)

**Propósito:** Evaluar cómo se posiciona nuestra propuesta comercial vs. alternativas del mercado. Evita proponer modelos que el cliente ya rechazó con otros proveedores o que son commoditized en su industria.

```
Para la propuesta comercial en desarrollo, analiza el posicionamiento competitivo:

DIMENSIÓN 1 — Alternativas del cliente:
- Que otras opciones tiene el cliente? (otros proveedores, in-house, no hacer nada)
- Que modelo comercial ofrecen los competidores principales?
  - Competitor A: modelo, estructura, diferenciadores
  - Competitor B: modelo, estructura, diferenciadores
  - In-house: costo estimado (magnitud), timeline, riesgo
  - Status quo: costo de no hacer nada (magnitud anual)
- Nuestra propuesta, como se diferencia en ESTRUCTURA (no en precio)?

DIMENSIÓN 2 — Percepción del cliente:
- El cliente ha tenido experiencias previas con modelos similares?
  - Experiencias positivas: que modelo funcionó y por qué
  - Experiencias negativas: que modelo falló y por qué
  - Expectativas: que modelo espera el cliente? (alineado o contrario a nuestra recomendación)
- El cliente tiene sesgo hacia T&M? (por familiaridad o por malas experiencias con fixed)
- Hay un procurement process que favorece cierto tipo de modelo?

DIMENSIÓN 3 — Value differentiation:
- Que podemos ofrecer que ningún competidor puede? (IP, metodología, expertise sectorial)
- Ese diferenciador justifica un modelo premium?
- Si el diferenciador es perecedero (competitor puede replicar en 6-12m), como afecta el modelo?

DIMENSIÓN 4 — Positioning statement:
- En una oración: por que nuestra estructura comercial es mejor para este cliente?
- Que sacrificamos al elegir este posicionamiento? (trade-off explícito)
- Que objeciones anticipamos del decision-maker que preferiría la alternativa?

Para cada competidor/alternativa, documentar:
- Modelo comercial probable
- Fortaleza principal vs. nuestra propuesta
- Debilidad principal vs. nuestra propuesta
- Respuesta si el cliente menciona esta alternativa
```

---

## 3. Stakeholder-Aligned Modeling (Modelado Alineado con Stakeholders)

**Propósito:** Adaptar cómo se presenta el modelo comercial según el stakeholder que lo evalúa. El mismo modelo hybrid suena diferente para un CFO, un CTO, y un VP de Procurement. Evita presentar un modelo técnicamente sólido que fracasa políticamente.

```
Para cada stakeholder clave en la decisión comercial, adapta la narrativa:

STAKEHOLDER: CFO / Finance
- Preocupación principal: predictibilidad presupuestaria, ROI, cash flow impact
- Presenta el modelo en términos de:
  - Componente fijo como "inversión predecible por fase"
  - Componente variable como "upside compartido — solo pagamos más si ganamos más"
  - Gates de salida como "opcionalidad — cada fase es una opción, no un compromiso total"
  - Timeline del breakeven (magnitud, no cifra)
- Objeciones probables:
  - "Cuanto va a costar en total?" → Rango de magnitud con escenarios
  - "Que pasa si los KPIs no se cumplen?" → Floor mínimo + mecanismo de ajuste
  - "Por que no T&M que ya conocemos?" → Análisis de costo de desalineación de incentivos

STAKEHOLDER: CTO / Technology
- Preocupación principal: calidad técnica, arquitectura, deuda técnica, team capability
- Presenta el modelo en términos de:
  - Estructura que incentiva calidad (variable tied to technical KPIs, no solo business KPIs)
  - IP model que protege innovación técnica
  - Gates técnicos que aseguran arquitectura correcta antes de escalar
  - Team composition que el modelo permite (expertise vs. commodity)
- Objeciones probables:
  - "El componente variable incentiva corners?" → KPIs incluyen quality gates
  - "Quien es dueño del código?" → IP model transparente
  - "Que pasa si necesitamos cambiar scope?" → Change management process en deal canvas

STAKEHOLDER: VP Procurement / Legal
- Preocupación principal: compliance, risk mitigation, contract enforceability, vendor management
  - Presenta el modelo en términos de:
  - Protecciones contractuales claras para ambas partes
  - Governance model con mecanismos de escalation
  - Exit clauses definidas y razonables
  - Compliance con procurement policies del cliente
- Objeciones probables:
  - "Esto es mas complejo que un T&M standard" → Complejidad razonable que reduce riesgo
  - "Como medimos los KPIs objetivamente?" → Mecanismo de medición con auditor independiente
  - "Que pasa si hay disputa?" → Escalation path + dispute resolution

STAKEHOLDER: CEO / Board
- Preocupación principal: strategic alignment, competitive advantage, shareholder value
- Presenta como: inversión estratégica con retorno medible, no como gasto operativo
- Una slide, tres números (magnitudes), una decisión

Para cada stakeholder, documentar:
- Preocupación #1 y cómo el modelo la resuelve
- Objeción anticipada y respuesta preparada
- Narrativa en una oración
- Approval criteria: que necesita ver para decir "sí"
```

---

## 4. Anti-Patterns in Commercial Models (Detección de Anti-Patrones)

**Propósito:** Antes de finalizar el modelo comercial, recorrer sistemáticamente los anti-patrones mas comunes para verificar que la propuesta no cae en ninguno. Función de "red team" del modelo.

```
Para el modelo comercial propuesto, evalúa cada anti-patrón:

ANTI-PATRÓN 1 — T&M Disfrazado:
- El modelo se presenta como "hybrid" pero el componente variable es < 5% del total?
- Los KPIs del componente variable son tan fáciles que siempre se cumplen?
- Si eliminamos el componente variable, el deal se ve igual?
- SEÑAL: El modelo es T&M con un bonus cosmético. No alinea incentivos realmente.
- REMEDIO: Aumentar proporción variable a mínimo 15-20% o rediseñar KPIs con ambición.

ANTI-PATRÓN 2 — Outcome Sin Baseline:
- Se propone outcome-based pero no hay datos de baseline?
- Los KPIs "se definirán en Sprint 0" pero Sprint 0 no tiene presupuesto para medición?
- Se asume que el cliente tiene data que en realidad no tiene?
- SEÑAL: El modelo promete alineamiento de valor pero no puede medirlo.
- REMEDIO: Incluir baseline measurement como deliverable pagado de Phase 0. Sin baseline, no activar componente variable.

ANTI-PATRÓN 3 — Complejidad Innecesaria:
- El deal canvas tiene más de 5 KPIs para el componente variable?
- El modelo tiene más de 3 mecanismos de ajuste?
- El governance model requiere más de 2 committees?
- SEÑAL: La complejidad del modelo supera la capacidad de gestionarlo. Nadie va a medir 8 KPIs trimestralmente.
- REMEDIO: Simplificar a 2-3 KPIs máximo. Un mecanismo de ajuste. Un committee con dos frecuencias.

ANTI-PATRÓN 4 — Riesgo Asimétrico:
- Todo el riesgo del componente variable está de un solo lado?
- Si los KPIs fallan, solo una parte sufre las consecuencias?
- Los exit clauses protegen a una parte pero no a la otra?
- SEÑAL: El modelo genera resentimiento a largo plazo. La parte con más riesgo buscará salirse.
- REMEDIO: Asegurar que riesgo Y upside están distribuidos. Si hay floor para el proveedor, hay cap para el cliente. Simetría.

ANTI-PATRÓN 5 — Modelo Estático:
- El modelo es el mismo en Phase 1 y Phase 3?
- No hay evolución del ratio fijo/variable a lo largo del engagement?
- Los KPIs no se actualizan conforme el proyecto avanza?
- SEÑAL: El modelo no refleja la madurez creciente de la relación.
- REMEDIO: Diseñar evolución por fase: más fijo al inicio (incertidumbre), más variable al final (confianza + data).

ANTI-PATRÓN 6 — Ignorar al Procurement:
- El modelo es innovador pero incompatible con las políticas de procurement del cliente?
- El contrato requiere aprobaciones que el timeline no contempla?
- Se asume que procurement aceptará un modelo no-estándar sin resistencia?
- SEÑAL: El modelo perfecto en teoría que muere en procurement.
- REMEDIO: Validar con procurement ANTES de proponer. Diseñar el modelo dentro de los rails de procurement, no a pesar de ellos.

ANTI-PATRÓN 7 — Revenue Optimism:
- Las proyecciones de valor asumen el escenario optimista como base?
- No hay downside scenario en las magnitudes?
- El breakeven depende de que TODO salga según el plan?
- SEÑAL: El modelo solo funciona si el sol brilla. Un retraso de 3 meses lo rompe.
- REMEDIO: Modelar tres escenarios (conservador, base, optimista). El modelo debe ser viable en el escenario conservador.

Para cada anti-patrón, documentar:
- Presente en nuestra propuesta? (sí / parcial / no)
- Si sí o parcial: acción correctiva antes de presentar
- Riesgo si no se corrige (bajo / medio / alto)
```

---

**Autor:** Javier Montaño | **Última actualización:** 13 de marzo de 2026

# Metaprompts — Technical Feasibility: Fact-Checking & 6D Analysis

> Estrategias de meta-nivel para maximizar la efectividad de esta skill.
> Los metaprompts no producen entregables — optimizan CÓMO se producen.

---

## 1. Red Team Mindset (Mentalidad de Equipo Rojo)

**Propósito:** Adoptar la mentalidad de adversario que busca romper los claims del escenario. El feasibility analyst es el "último defensor" antes de comprometer presupuesto.

```
Antes de evaluar cualquier claim del escenario, activa el modo Red Team:

PRINCIPIO: Tu trabajo NO es confirmar que el escenario funciona.
Tu trabajo es encontrar DÓNDE FALLA — o confirmar que no falla.

Para cada claim:
1. ASUMIR FALSO hasta demostrar verdadero
   - "¿Qué evidencia necesitaría para creer esto?"
   - "¿Esa evidencia existe? ¿Dónde?"
   - Si no existe → UNVALIDATED, no VALIDATED por default

2. BUSCAR CONTRA-EVIDENCIA activamente
   - "¿Hay algo en el código que contradiga este claim?"
   - "¿Hay benchmarks que muestren lo contrario?"
   - "¿Hay postmortems de otros que intentaron esto y fracasaron?"

3. STRESS-TEST con escenarios extremos
   - "¿Funciona con 10x el volumen propuesto?"
   - "¿Funciona si el vendor cambia precios/API?"
   - "¿Funciona si 2 de los 5 devs se van?"
   - "¿Funciona si la regulación cambia en 12 meses?"

4. DOCUMENTAR AMBOS LADOS
   - Evidencia a favor + evidencia en contra
   - El veredicto refleja el balance, no solo un lado

El sesgo de confirmación es el enemigo #1 del feasibility.
Si todo parece VALIDATED, probablemente no estás buscando suficiente.
```

---

## 2. Evidence Chain Protocol (Protocolo de Cadena de Evidencia)

**Propósito:** Asegurar trazabilidad completa desde el claim hasta el veredicto. Cada paso debe estar documentado y ser auditable.

```
Para cada claim evaluado, construir la cadena de evidencia completa:

CLAIM: "{texto exacto del claim del escenario}"
  ↓
SOURCE: ¿Quién lo dijo? ¿En qué documento? ¿En qué contexto?
  → Phase 3 Scenario B, Sección 4, pág 12
  ↓
EVIDENCE SEARCH: ¿Dónde busqué evidencia?
  → [CÓDIGO] src/services/OrderService.java:142-189
  → [CONFIG] docker-compose.yml, k8s/deployment.yaml
  → [DOC] vendor-api-reference.pdf, Architecture Decision Record #14
  → [BENCHMARK] load-test-results-q4-2025.csv
  ↓
EVIDENCE FOUND: ¿Qué encontré?
  → "OrderService tiene 7 llamadas síncronas a PaymentService"
  → "No hay configuración de K8s — el equipo usa Docker Compose en producción"
  ↓
EVIDENCE ANALYSIS: ¿Qué significa?
  → El claim de "event-driven decouples order flow" requiere desacoplar
    7 llamadas síncronas. Es viable pero el effort es mayor al estimado.
  ↓
VERDICT: ⚠️ UNVALIDATED
  → "Viable en teoría pero sin evidencia de que el equipo ha hecho
    este tipo de migración antes. Spike recomendado."
  ↓
TAG: [CÓDIGO] + [INFERENCIA]

Si en cualquier paso la cadena se rompe (no hay evidencia),
documéntalo explícitamente y marca como [SUPUESTO].
```

---

## 3. Dimensional Balance Check (Verificación de Balance Dimensional)

**Propósito:** Evitar que el análisis se concentre desproporcionadamente en D1 (Technical) e ignore las dimensiones organizacionales, regulatorias y operacionales — que son las que realmente matan proyectos.

```
Después de completar el análisis 6D, ejecutar este balance check:

DISTRIBUCIÓN DE EVIDENCIA:
- ¿Cuántas evidencias tiene D1 (Technical)? → {N}
- ¿Cuántas evidencias tiene D2 (Organizational)? → {N}
- ¿Cuántas evidencias tiene D3 (Timeline)? → {N}
- ¿Cuántas evidencias tiene D4 (Financial)? → {N}
- ¿Cuántas evidencias tiene D5 (Regulatory)? → {N}
- ¿Cuántas evidencias tiene D6 (Operational)? → {N}

RED FLAGS DE DESBALANCE:
- D1 tiene > 3x evidencias que cualquier otra dimensión
  → Estás haciendo tech analysis, no feasibility. Profundizar en D2-D6.
- D2 tiene 0 evidencias directas
  → Preguntar al equipo o inferir de git log (¿quién contribuye? ¿con qué frecuencia?)
- D5 score = 5/5 sin haber verificado regulaciones específicas
  → No asumir "no hay regulación" — verificar activamente
- D6 score alto pero no hay monitoring ni CI/CD
  → ¿Quién va a operar esto? Si la respuesta es "el equipo de dev", D6 baja.

REGLA DE ORO:
Si alguna dimensión tiene score < 2/5, el veredicto NO puede ser FEASIBLE.
Puede ser FEASIBLE WITH CONDITIONS si hay plan de mitigación concreto.

ANTI-PATTERN:
"Compensar" una dimensión débil con una fuerte.
D1=5/5 NO compensa D2=1/5. Las dimensiones son AND, no OR.
```

---

## 4. Spike Design Protocol (Protocolo de Diseño de Spikes)

**Propósito:** Cuando un claim es UNVALIDATED o AT RISK, diseñar el spike/PoC mínimo que lo valide o lo descarte. Evitar spikes que "prueban todo" sin probar nada específico.

```
Para cada spike/PoC recomendado, aplicar este protocolo:

1. OBJETIVO ÚNICO:
   ❌ "Probar que la nueva arquitectura funciona"
   ✅ "Validar que OrderService puede procesar 50K eventos/hora con Kafka"
   → Un spike valida UN claim. Si tiene 3 objetivos, son 3 spikes.

2. SUCCESS CRITERIA (antes de empezar):
   ✅ "Éxito si: p99 latency < 200ms con 50K msg/h durante 1 hora"
   ✅ "Éxito si: datos migrados con < 0.01% de discrepancia en 500K registros"
   ❌ "Éxito si: funciona bien" (no medible)

3. KILL CRITERIA (antes de empezar):
   "Si el spike muestra {X}, descartamos esta tecnología/approach."
   ej: "Si p99 > 2 segundos bajo carga, descartamos Kafka y evaluamos RabbitMQ"

4. DATOS REALES:
   ✅ Usar datos de producción (anonimizados si necesario)
   ❌ Usar datos generados — no representan la distribución real

5. EFFORT Y TIMELINE:
   - MUST-DO spikes: max 1 sprint, ejecutar en Sprint 0
   - SHOULD-DO spikes: max 3 días, ejecutar en Sprint 0-1
   - COULD-DO spikes: deprioritizar si hay presión de timeline

6. RESULTADO → DECISIÓN:
   - Spike exitoso: claim pasa a VALIDATED, proceed
   - Spike falla parcialmente: ajustar scope/approach, retry o pivot
   - Spike falla: activar kill criteria, buscar alternativa

Documentar: objetivo + success criteria + kill criteria + effort + resultado esperado.
```

---

## 5. Anti-Patterns de Feasibility (Qué NO Hacer)

**Propósito:** Evitar los errores más comunes al ejecutar análisis de viabilidad técnica.

```
ANTI-PATRÓN 1: "El Optimismo Informado"
❌ "El equipo dice que puede hacerlo, así que D2 = 5/5"
✅ "El equipo dice que puede — pero ¿han hecho algo similar antes?
   ¿Qué evidencia del codebase respalda esa confianza?"
Por qué: Los equipos subestiman complejidad sistemáticamente (Kahneman:
planning fallacy). Validar con evidencia, no con intención.

ANTI-PATRÓN 2: "Feasibility por Checklist"
❌ "D1 ✓ D2 ✓ D3 ✓ D4 ✓ D5 ✓ D6 ✓ → FEASIBLE"
✅ "D1 4/5 porque... D2 3/5 porque... → FEASIBLE WITH CONDITIONS porque..."
Por qué: Un checkbox no captura matices. El score con rationale captura
la diferencia entre "probablemente viable" y "definitivamente viable".

ANTI-PATRÓN 3: "Ignorar Interdependencias"
❌ "D3 (Timeline) evaluado independientemente de D2 (Organization)"
✅ "D3 depende de D2: si el equipo necesita 2 meses de training (D2),
   el timeline efectivo es timeline propuesto - 2 meses (D3)"
Por qué: Las dimensiones no son independientes. El timeline depende de
skills, la viabilidad financiera depende del timeline, etc.

ANTI-PATRÓN 4: "Skip the Uncomfortable Questions"
❌ "No preguntamos sobre budget porque es tema sensible"
✅ "D4 score bajo — no hay información de budget disponible.
   UNVALIDATED. Requiere input del sponsor antes de proceder."
Por qué: La dimensión incómoda es la que mata el proyecto.
Escalarla es fortaleza, no debilidad.

ANTI-PATRÓN 5: "Feasibility como Trámite"
❌ "Ya decidimos hacer esto. El feasibility es para documentar."
✅ "El feasibility puede recomendar PIVOT o HOLD.
   Si el veredicto es predeterminado, no necesitas feasibility."
Por qué: Un feasibility que no puede decir NO no tiene valor.
El poder del feasibility está en que puede detener un proyecto
antes de que consuma presupuesto en algo inviable.
```

---

**Autor:** Javier Montaño | **Última actualización:** 13 de marzo de 2026
**© Comunidad MetodologIA — Todos los derechos reservados**

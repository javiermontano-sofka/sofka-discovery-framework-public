# Metaprompts — Data Mesh Strategy

> Estrategias de meta-nivel para maximizar la efectividad de esta skill.
> Los metaprompts no producen entregables — optimizan COMO se producen.

---

## 1. Organizational Readiness First (Readiness Organizacional Primero)

**Proposito:** Asegurar que la evaluacion de data mesh empieza por la organizacion (cultura, estructura, capacidad), no por la tecnologia. Evitar el error de disenar la plataforma antes de validar que la organizacion puede operar en modelo descentralizado.

```
Antes de evaluar CUALQUIER aspecto tecnico de data mesh, completa esta
evaluacion organizacional obligatoria:

1. DOMINIOS CLAROS
   - ¿Existen bounded contexts de negocio bien definidos?
   - ¿Los equipos estan organizados por dominio o por funcion?
   - ¿Quien es el owner de las decisiones de datos en cada dominio?
   - SI los dominios no son claros → STOP. Data mesh no funciona sin dominios.
     Recomendar ejercicio de domain decomposition (DDD) primero.

2. OWNERSHIP CULTURE
   - ¿Los equipos de dominio estan acostumbrados a "own" sus servicios end-to-end?
   - ¿O dependen de equipos centrales para infra, datos, operaciones?
   - ¿Existe el concepto de "you build it, you run it"?
   - SI no hay ownership culture → RIESGO ALTO. Data mesh amplifica la
     descentralizacion. Sin cultura de ownership, se convierte en "nadie es
     responsable de nada."

3. ENGINEERING CAPACITY
   - ¿Los equipos de dominio tienen ingenieros capaces de construir y
     mantener data products? (dbt, SQL, basic data engineering)
   - ¿O el 100% de la capacidad de data engineering esta centralizada?
   - SI capacity es 100% central → el primer paso es transferir capacidad,
     no construir plataforma. Plan de training + hiring + redistribucion.

4. EXECUTIVE SPONSORSHIP
   - ¿Hay un sponsor C-level que entiende que data mesh es cambio
     organizacional, no solo cambio tecnologico?
   - ¿Esta dispuesto a invertir en 12-24 meses de transformacion?
   - SI no hay sponsor → RIESGO CRITICO. Data mesh sin sponsorship muere
     en 6 meses cuando el primer conflicto de ownership emerge.

5. PAIN POINT REAL
   - ¿El data team centralizado es bottleneck medible? (queue >2 semanas)
   - ¿Los dominios necesitan datos analiticos que no obtienen?
   - ¿O el modelo centralizado "funciona ok" y mesh es aspiracional?
   - SI no hay pain point real → cuestionar la motivacion. ¿Mesh por moda
     o por necesidad? Recomendar mejoras incrementales al modelo actual.

VEREDICTO:
- 5/5 checks positivos → GO
- 3-4/5 positivos → GO CONDICIONAL (documentar gaps como prerequisites)
- 1-2/5 positivos → NO GO (recomendar alternativas)
- 0/5 positivos → DEFINITIVAMENTE NO (recomendar modelo centralizado mejorado)
```

---

## 2. Domain-by-Domain Expansion (Expansion Dominio por Dominio)

**Proposito:** Evitar el big-bang approach. Disenar la adopcion como una expansion gradual, validando hipotesis en cada dominio antes de escalar.

```
NUNCA diseñes data mesh para todos los dominios simultaneamente.
Usa esta estrategia de expansion controlada:

PASO 1 — CLASIFICAR DOMINIOS (antes de disenar nada)
Para cada dominio, evaluar 4 dimensiones (1-5):
- Team maturity: ¿puede construir y mantener data products?
- Data demand: ¿cuantos consumidores tiene? ¿es critico para otros dominios?
- Regulatory risk: ¿contiene datos regulados (PII, PCI, SOX)?
- Current pain: ¿sufre el bottleneck del data team centralizado?

SCORE = (maturity × 0.3) + (demand × 0.3) + (5 - risk × 0.2) + (pain × 0.2)

PASO 2 — SELECCIONAR PILOTO (Top 2 por score)
Requisitos adicionales para piloto:
- Los 2 dominios DEBEN interactuar (para validar cross-domain consumption)
- Al menos 1 debe tener un "data product estrella" (high-demand, clear SLA)
- Ninguno debe tener complejidad regulatoria extrema

PASO 3 — VALIDAR EN PILOTO (3-6 meses)
Hipotesis a validar:
- "Los equipos de dominio PUEDEN construir data products con la plataforma"
- "Los consumidores PREFIEREN usar data products vs pedir al equipo central"
- "La calidad de datos MEJORA con domain ownership vs centralizado"
- "El time-to-data REDUCE con self-serve vs request queue"
Medir ANTES y DESPUES. Si las hipotesis no se validan → no expandir.

PASO 4 — EXPANSION SELECTIVA (meses 7-12)
- Expandir a 2-3 dominios adicionales
- SOLO los que cumplen threshold de readiness
- Algunos dominios PUEDEN permanecer centralizados indefinidamente (y eso esta bien)

PASO 5 — MADUREZ (meses 13-24+)
- El equipo central de datos se convierte en platform team
- Los domain data teams son autonomos
- Continuous improvement: quarterly mesh health review

ANTI-PATRON: "Big Bang Mesh"
- Intentar migrar 10+ dominios en paralelo
- Resultado tipico: 0 dominios operativos despues de 12 meses
- Causa: cada dominio tiene problemas unicos que requieren atencion individual
```

---

## 3. Platform Capability Mapping (Mapeo de Capacidades de Plataforma)

**Proposito:** Sistematizar la evaluacion de la self-serve platform. Evitar el error de comprar herramientas sin entender las capabilities necesarias y su prioridad.

```
Evalua la plataforma en 3 capas, de abajo hacia arriba.
NUNCA empieces por la capa de UX — empieza por la infraestructura.

CAPA 1 — INFRAESTRUCTURA (prerequisito)
□ Storage: ¿donde viven los data products? (warehouse, lake, lakehouse)
□ Compute: ¿como se procesan? (dbt, Spark, SQL)
□ Streaming: ¿hay data products real-time? (Kafka, Kinesis)
□ Networking: ¿los dominios pueden acceder cross-domain sin friccion?
→ Si la CAPA 1 no existe, NO avanzar. Construir fundamentos primero.

CAPA 2 — GOVERNANCE & QUALITY (enablement)
□ Schema Registry: ¿como se garantiza compatibilidad de schemas?
□ Quality Gates: ¿como se valida calidad antes de publish?
□ Access Control: ¿como se gestiona quien puede consumir que?
□ Lineage: ¿como se traza el origen y transformaciones?
□ Policy Enforcement: ¿como se aplican las politicas automaticamente?
→ CAPA 2 es la "magia" de data mesh. Sin esto, es solo datos distribuidos sin governance.

CAPA 3 — DEVELOPER EXPERIENCE (adoption)
□ Data Product Template: ¿hay un boilerplate para crear un data product?
□ CI/CD Pipeline: ¿hay pipeline automatizado para test + deploy data products?
□ Catalog & Discovery: ¿como se descubren data products disponibles?
□ Documentation: ¿hay generacion automatica de docs?
□ Cost Visibility: ¿cada dominio sabe cuanto cuestan sus data products?
→ CAPA 3 es la diferencia entre "mesh funciona" y "mesh escala."

PARA CADA CAPABILITY:
Evaluar en esta matriz:

| Capability | Current State | Gap | Priority | Build/Buy/Extend |
|           | (0-5)         |     | P0/P1/P2 |                  |

REGLAS DE PRIORIDAD:
- P0: Sin esto, el piloto no puede funcionar
- P1: Sin esto, la expansion no puede funcionar
- P2: Nice-to-have, mejora experiencia

REGLA DE BUILD VS BUY:
- Si existe herramienta actual que cubre >60% → EXTEND
- Si no existe y hay OSS maduro → EVALUATE OSS
- Si no existe y el equipo es <5 personas → BUY
- Si no existe y el equipo es >10 personas y el budget es bajo → BUILD con OSS
```

---

## 4. Anti-Patterns in Data Mesh (Anti-Patrones en Data Mesh)

**Proposito:** Detectar proactivamente anti-patrones que llevan al fracaso de data mesh. Aplicar como checklist adversarial en cada seccion del entregable.

```
Despues de completar cada seccion del data mesh strategy,
ejecuta este checklist de anti-patrones:

ANTI-PATRON 1: "Mesh Theater"
□ ¿Se estan renombrando pipelines existentes como "data products" sin cambiar ownership?
□ ¿El equipo central sigue construyendo TODO, solo con nuevos nombres?
□ ¿Los dominios tienen REAL ownership o solo nominal?
→ SEÑAL DE ALERTA: Si el equipo central sigue siendo bottleneck, no es mesh.

ANTI-PATRON 2: "Platform Without Products"
□ ¿Se esta construyendo la plataforma sin un dominio piloto que la use?
□ ¿El timeline de plataforma es >6 meses antes del primer data product?
□ ¿El equipo de plataforma no tiene feedback loop con los dominios?
→ SEÑAL DE ALERTA: Plataforma sin usuarios = shelfware.
   CORRECCION: Product-first, platform-second. El piloto define los requirements de plataforma.

ANTI-PATRON 3: "Governance Vacuum"
□ ¿Se descentralizo sin definir politicas globales de naming, quality, PII?
□ ¿Cada dominio usa schemas incompatibles?
□ ¿No hay forma de saber que data products existen?
→ SEÑAL DE ALERTA: Descentralizacion sin governance = data silos 2.0.
   CORRECCION: Minimum viable governance ANTES del piloto.

ANTI-PATRON 4: "Domain Silos 2.0"
□ ¿Los dominios interpretan ownership como "mis datos, nadie los toca"?
□ ¿Es mas dificil acceder a datos DESPUES del mesh que ANTES?
□ ¿Los dominios no publican data products porque "no es mi prioridad"?
→ SEÑAL DE ALERTA: Ownership sin responsabilidad de servir.
   CORRECCION: Data product SLAs son OBLIGATORIOS, no opcionales.

ANTI-PATRON 5: "Premature Mesh"
□ ¿La organizacion tiene <5 dominios?
□ ¿No hay pain point real con el modelo centralizado?
□ ¿La motivacion principal es "es lo que todo el mundo esta haciendo"?
□ ¿No hay executive sponsor para cambio organizacional?
→ SEÑAL DE ALERTA: Mesh sin necesidad = complejidad innecesaria.
   CORRECCION: Recomendar mejoras al modelo centralizado. Reevaluar en 12 meses.

ANTI-PATRON 6: "Technology-First Mesh"
□ ¿La conversacion de mesh empezo por la herramienta (Databricks, Snowflake)?
□ ¿Se eligio plataforma antes de definir dominios y data products?
□ ¿El plan no incluye cambio organizacional?
→ SEÑAL DE ALERTA: Data mesh es 70% organizacional, 30% tecnico.
   CORRECCION: Empezar por S1 (readiness) y S7 (org change), no por S4 (platform).

REGLA: Si detectas 2+ anti-patrones en una seccion, DETENTE y
documenta el riesgo explicitamente en el entregable con recomendaciones
de mitigacion. No los escondas — el cliente necesita saberlo.
```

---

**Autor:** Javier Montaño | **Última actualización:** 13 de marzo de 2026

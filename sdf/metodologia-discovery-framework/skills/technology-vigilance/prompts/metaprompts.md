# Metaprompts — Technology Vigilance

> 5 meta-estrategias para potenciar la skill `technology-vigilance`. Cada metaprompt define una lente que transforma como se ejecuta la vigilancia tecnologica.

---

## Meta-estrategia 1: Source Diversity Checker

### Filosofia

Un reporte de vigilancia que solo cita una fuente no es vigilancia — es eco. La diversidad de fuentes es la base de la confianza. Esta meta-estrategia fuerza cobertura multi-tier y detecta sesgos de fuente.

### Prompt

```
Ejecuta la vigilancia tecnologica con lente Source Diversity Checker.

ANTES de emitir cualquier recomendacion, verificar cobertura de fuentes:

1. **Minimum Viable Sources por senal:**
   - Toda senal clasificada como MUST: minimo 3 fuentes de 2+ tiers
   - Toda senal clasificada como SHOULD: minimo 2 fuentes de 2+ tiers
   - Toda senal clasificada como COULD: minimo 1 fuente verificada

2. **Tier Balance Check:**
   - Verificar que el reporte NO este dominado por un solo tier
   - Si >60% de las senales vienen de Tier 1 (analyst): buscar validacion
     en Tier 3 (open source) y Tier 4 (thought leaders)
   - Si >60% vienen de Tier 3 (open source): buscar contexto en
     Tier 1 (analyst) y Tier 2 (academic)

3. **Bias Detection:**
   - Identificar fuentes con conflicto de interes (ej: vendor que patrocina
     reporte de analista)
   - Marcar senales que vienen exclusivamente de vendors como [VENDOR-DOC]
   - Buscar voces disidentes: si todo el mundo dice "Adopt", buscar quien
     dice "Hold" y por que

4. **Freshness Check:**
   - Verificar que las fuentes sean de los ultimos 18 meses
   - Marcar fuentes >24 meses como [DATED]
   - Para tecnologias de rapida evolucion (AI, cloud): solo fuentes <12 meses

5. **Source Diversity Score:**
   - Calcular para el reporte completo:
     Score = (tiers cubiertos / 4) x (fuentes unicas / senales) x freshness_factor
   - Target: Score >= 0.7
   - Si Score < 0.5: reporte insuficiente, ampliar fuentes antes de entregar

Output: Agregar seccion "Source Diversity Audit" al final del reporte con
score, gaps detectados, y acciones tomadas para cerrarlos.
```

### Cuando Usar

- En todo reporte de vigilancia como quality check final
- Cuando el cliente es esceptico y necesita evidencia multi-fuente robusta
- Cuando se trabaja en sectores regulados donde las decisiones tecnologicas deben estar bien fundamentadas
- Como antidoto contra el "Gartner says" sin validacion cruzada

---

## Meta-estrategia 2: Signal Strength Validator

### Filosofia

No todas las senales son iguales. Una mencion en un blog no tiene el mismo peso que un paper peer-reviewed o un proyecto CNCF graduado. Esta meta-estrategia pondera la fuerza de cada senal para evitar ruido.

### Prompt

```
Ejecuta la vigilancia tecnologica con lente Signal Strength Validator.

Para CADA senal detectada, calcular un Signal Strength Score (SSS) en escala 1-10:

1. **Evidence Quality (0-3 puntos):**
   - 0: Solo opinion/blog sin datos
   - 1: Reporte de analista sin metodologia transparente
   - 2: Datos cuantitativos de fuentes verificables (OSINT, surveys)
   - 3: Paper peer-reviewed o datos de produccion documentados

2. **Source Independence (0-2 puntos):**
   - 0: Una sola fuente
   - 1: Multiples fuentes pero del mismo tier
   - 2: Multiples fuentes de 2+ tiers convergentes

3. **Recency (0-2 puntos):**
   - 0: >24 meses
   - 1: 12-24 meses
   - 2: <12 meses

4. **Production Evidence (0-3 puntos):**
   - 0: Solo teoria/papers
   - 1: PoCs documentados
   - 2: Produccion en empresas comparables
   - 3: Produccion a escala en el sector del cliente

Clasificacion por SSS:
- SSS 8-10: Senal fuerte → puede fundamentar MUST
- SSS 5-7: Senal moderada → puede fundamentar SHOULD
- SSS 3-4: Senal debil → maximo COULD, requiere mas investigacion
- SSS 1-2: Ruido → no incluir en recomendaciones, solo en watchlist

Para senales con SSS < 5 que se incluyan en el reporte:
- Etiquetar explicitamente como [LOW-CONFIDENCE]
- Explicar que evidencia adicional se necesita para subir el SSS
- Nunca basar una recomendacion MUST en senales SSS < 7

Output: Agregar columna SSS a la tabla de senales. Incluir desglose del
scoring para las 3 senales de mayor SSS y las 2 de menor SSS.
```

### Cuando Usar

- Cuando hay muchas senales y se necesita separar senal de ruido
- En contextos de alta incertidumbre tecnologica (AI, quantum, blockchain) donde el hype distorsiona
- Cuando el equipo de decision necesita saber "que tan seguro estamos" de cada recomendacion
- Como defensa contra el FOMO tecnologico ("todos hablan de X, debemos adoptarlo")

---

## Meta-estrategia 3: Analyst Convergence Detector

### Filosofia

La convergencia entre fuentes independientes es la senal mas poderosa en vigilancia tecnologica. Cuando Gartner, ThoughtWorks, la academia y la comunidad open-source coinciden, la probabilidad de acertar es alta. Cuando divergen, hay oportunidad o riesgo oculto.

### Prompt

```
Ejecuta la vigilancia tecnologica con lente Analyst Convergence Detector.

Para cada tecnologia evaluada, construir la Convergence Matrix:

1. **Fuentes evaluadas (columnas):**
   - Gartner (Hype Cycle + MQ)
   - Forrester (Wave + TEI)
   - ThoughtWorks (Radar)
   - CNCF (Landscape status)
   - GitHub/Community (adoption metrics)
   - Academic (papers, HAI Index)
   - Thought Leaders (opinions publicadas)

2. **Normalizar posiciones a escala comun:**
   - Adopt/Leader/Plateau/Graduated/High-adoption/Mature/Recommended = POSITIVO
   - Trial/Strong-Performer/Slope/Incubating/Growing/Promising/Cautious = NEUTRAL
   - Assess/Contender/Peak-Trough/Sandbox/Low-adoption/Early/Mixed = CAUTELOSO
   - Hold/Niche/Trigger/N-A/Declining/Unproven/Negative = NEGATIVO

3. **Calcular Convergence Score:**
   - Full Convergence (todas POSITIVO o todas CAUTELOSO): "CONVERGENCIA FUERTE"
   - Majority Convergence (>60% alineados): "CONVERGENCIA MODERADA"
   - Split (50/50): "DIVERGENCIA — investigar"
   - Majority Divergence (<40% alineados): "DIVERGENCIA FUERTE — alto riesgo"
   - Counter-signal (1+ fuente NEGATIVO cuando otras POSITIVO): "SENAL CONTRARIA — validar"

4. **Para cada divergencia detectada:**
   - Identificar CUAL fuente diverge y POR QUE
   - Analizar: la fuente divergente tiene informacion que las otras no?
   - Hipotesis: la divergencia indica oportunidad o riesgo?
   - Recomendacion: investigar, PoC, o esperar convergencia?

5. **Patrones de divergencia tipicos:**
   - Analyst-ahead-of-community: posible vendor push
   - Community-ahead-of-analysts: posible early-mover opportunity
   - Practice-ahead-of-theory: funciona pero hay riesgo no modelado
   - Theory-ahead-of-practice: investigacion sin viabilidad comercial aun

Output: Convergence Matrix (tabla) + Divergence Analysis (por caso) +
Overall Convergence Score del reporte.
```

### Cuando Usar

- En todo reporte de vigilancia como herramienta central de analisis
- Cuando las fuentes se contradicen y se necesita entender por que
- Para detectar tecnologias sobre-hyped (todos los analistas dicen si, la comunidad dice no)
- Para detectar oportunidades early-mover (la comunidad adopta antes que los analistas cubran)
- Como defensa contra el groupthink: si todo converge "demasiado bien", buscar la voz disidente

---

## Meta-estrategia 4: Adoption Curve Classifier

### Filosofia

Posicionar una tecnologia en el Hype Cycle no es suficiente — necesitas saber donde esta en la curva de adopcion REAL (Rogers). El Hype Cycle mide atencion; la curva de adopcion mide uso. Esta meta-estrategia usa proxies cuantitativos para estimar la posicion real en la curva.

### Prompt

```
Ejecuta la vigilancia tecnologica con lente Adoption Curve Classifier.

Para cada tecnologia evaluada, estimar su posicion en la curva de Rogers
usando proxies cuantitativos:

1. **Proxies de Innovators (0-2.5% del mercado):**
   - Solo papers academicos, sin productos comerciales
   - GitHub repos con <100 stars, <5 contributors
   - Cero job postings en el mercado
   - TRL 1-3

2. **Proxies de Early Adopters (2.5-16% del mercado):**
   - Primeros productos comerciales (startups, no incumbents)
   - GitHub repos 100-5K stars, growing contributors
   - Job postings aparecen en tier-1 tech companies
   - Primeros case studies en conferencias
   - TRL 4-6

3. **Proxies de Early Majority (16-50% del mercado):**
   - Enterprise vendors ofrecen productos/servicios
   - GitHub repos 5K-50K stars, estable contributor base
   - Job postings en empresas mainstream (no solo tech)
   - Gartner Slope/Plateau, TW Adopt/Trial
   - Managed services disponibles (cloud providers)
   - TRL 7-8

4. **Proxies de Late Majority (50-84% del mercado):**
   - Commodity (multiples vendors, precio competitivo)
   - GitHub repos >50K stars, massive ecosystem
   - Job postings ubicuos, bootcamps ensenan la tecnologia
   - Gartner Plateau, TW Adopt (consolidado)
   - Default en plataformas cloud
   - TRL 9

5. **Proxies de Laggards (84-100%):**
   - Tecnologia madura al punto de commoditization total
   - Discusiones sobre "next generation" o reemplazo
   - Talento migra a alternativas

Para cada tecnologia, entregar:
- Posicion estimada en curva de Rogers (con justificacion)
- Distancia al "chasm" (Early Adopters → Early Majority)
- Si la tecnologia HA cruzado el chasm o NO
- Velocidad de adopcion estimada (rapida/normal/lenta)
- Implicacion para el proyecto: adoptar ahora es safe, early, o demasiado temprano?

Output: Tabla de posicionamiento Rogers + analisis del chasm por tecnologia
```

### Cuando Usar

- Para complementar posicionamiento de analistas con datos de adopcion real
- Cuando se necesita saber si una tecnologia es "safe to adopt" vs. "bleeding edge"
- Para organizaciones conservadoras que necesitan evidencia de produccion antes de adoptar
- Para detectar tecnologias que cruzan el chasm (moment optimo para Early Majority)

---

## Meta-estrategia 5: Sector Relevance Filter

### Filosofia

No toda tecnologia horizontal aplica igual a todo sector. Un blockchain que es irrelevante para retail puede ser critico para supply chain farmaceutico. Esta meta-estrategia filtra y pondera senales por relevancia sectorial.

### Prompt

```
Ejecuta la vigilancia tecnologica con lente Sector Relevance Filter.

Sector del cliente: {SECTOR}
Sub-sector: {SUB-SECTOR}

Para cada senal tecnologica detectada, evaluar relevancia sectorial:

1. **Sector Fit Score (0-10):**
   - 0-2: Tecnologia irrelevante para el sector
   - 3-4: Relevante tangencialmente (nice-to-have, no critical)
   - 5-6: Relevante como enabler horizontal (cloud, CI/CD, observability)
   - 7-8: Altamente relevante para el sector (impacto directo en operaciones)
   - 9-10: Sector-defining (cambia las reglas del juego en este sector)

2. **Criterios de evaluacion sectorial:**
   - Regulacion: la tecnologia facilita o complica compliance del sector?
   - Competidores: los competidores del sector ya la adoptaron?
   - Cadena de valor: la tecnologia impacta un eslabon critico de la cadena?
   - Clientes finales: los clientes del sector la demandan o la valoran?
   - Talento sectorial: hay talento en el sector con experiencia en esta tecnologia?

3. **Sector-specific signals:**
   - Buscar activamente senales del sector (no solo horizontales):
     * {banking}: BIAN framework, open banking APIs, fraud detection
     * {health}: FHIR, HL7, clinical decision support, HIPAA compliance
     * {retail}: composable commerce, unified commerce, clienteling
     * {SaaS}: PLG, usage-based billing, multi-tenancy patterns
     * {manufacturing}: digital twin, predictive maintenance, OT/IT convergence
     * {gov}: GovTech, interoperability frameworks, digital identity
     * {energy}: smart grid, DER management, carbon accounting
     * {telecom}: network slicing, edge computing, eSIM

4. **Filtrado por relevancia:**
   - Senales con Sector Fit < 3: excluir del reporte principal (mover a appendix)
   - Senales con Sector Fit 3-5: incluir pero marcar como "horizontal — no sector-specific"
   - Senales con Sector Fit > 5: priorizar en el reporte
   - Senales con Sector Fit > 8: destacar como "sector-critical"

5. **Cross-sector learning:**
   - Identificar tecnologias que otro sector adopto exitosamente y son transferibles
   - Ej: banking adopto event sourcing → aplicable a retail inventory management
   - Marcar como [CROSS-SECTOR] con referencia al sector de origen

Output: Tabla de senales con Sector Fit Score + analisis de senales
sector-specific + cross-sector opportunities.
```

### Cuando Usar

- Siempre que la vigilancia sea para un sector especifico (no horizontal)
- En sectores regulados (banking, health, gov) donde la relevancia sectorial es critica
- Para evitar recomendar tecnologias irrelevantes solo porque estan de moda
- Para detectar oportunidades de cross-pollination entre sectores

---

## Combinacion de Meta-estrategias

| Combinacion | Resultado | Caso de Uso |
|-------------|-----------|-------------|
| Source Diversity + Signal Strength | Reporte con alta confianza y evidencia robusta | Decisiones de inversion tecnologica de alto impacto |
| Convergence Detector + Adoption Curve | Mapa completo: que dicen los expertos + que pasa en la realidad | Pre-discovery para validar tecnologias propuestas |
| Sector Relevance + Convergence Detector | Senales filtradas por sector con validacion multi-fuente | Sectores regulados con restricciones especificas |
| Signal Strength + Adoption Curve | Scoring cuantitativo de madurez y confianza | Think Tank input — alimentar al technology-scout sage |
| Todas las 5 combinadas | Vigilancia exhaustiva de maxima calidad | Decisiones estrategicas de portfolio tecnologico (CTO-level) |

---

**Autor:** Javier Montano | **Ultima actualizacion:** 13 de marzo de 2026

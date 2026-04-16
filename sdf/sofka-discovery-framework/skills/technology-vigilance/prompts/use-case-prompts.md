# Use Case Prompts — Technology Vigilance

> 7 prompts listos para usar con la skill `technology-vigilance`. Copiar y adaptar segun contexto del proyecto.

---

## Prompt 1: Full Landscape Scan

```
Ejecuta un escaneo completo de vigilancia tecnologica para {PROYECTO}.

Contexto:
- Sector: {SECTOR}
- Tecnologias actuales: {STACK ACTUAL}
- Objetivo de negocio: {OBJETIVO}
- Horizonte temporal: {HORIZONTE: 1-3 anos / 3-5 anos}

Consultar las 4 tiers de fuentes:
- Tier 1 (Analyst): Gartner Hype Cycle, Magic Quadrant, Forrester Wave
- Tier 2 (Academic): Stanford HAI, IEEE, ACM, arXiv
- Tier 3 (Open Source): ThoughtWorks Radar, CNCF Landscape, GitHub Octoverse
- Tier 4 (Thought Leaders): Fowler, Caroli, Hohpe, Humble, Newman, etc.

Entregar:
- 8-12 senales clasificadas (urgencia, impacto, relevancia, confianza)
- Posicionamiento cruzado multi-fuente
- Analisis de convergencia/divergencia
- Recomendaciones MUST/SHOULD/COULD
- quadrantChart Mermaid de posicionamiento

Formato: markdown (con evidence tags [ANALYST], [ACADEMIC], [OPENSOURCE], [REFERENT])
```

**Cuando usar:** Escaneo integral previo a un discovery o decision estrategica de tecnologia. Ideal como input para Phase 0 (Ingesta) o como complemento del AS-IS analysis.

---

## Prompt 2: Single Technology Deep-Dive

```
Ejecuta un deep-dive de vigilancia tecnologica sobre {TECNOLOGIA}.

Evaluar contra todas las fuentes disponibles:
1. Posicion en Gartner Hype Cycle (fase + trayectoria)
2. Posicion en ThoughtWorks Radar (anillo + cuadrante)
3. Posicion en Forrester Wave (si aplica)
4. Madurez CNCF (sandbox/incubating/graduated, si aplica)
5. Metricas OSINT: GitHub stars, npm/PyPI downloads, contributors activos, trend
6. Papers academicos recientes (arXiv, IEEE, ACM)
7. Posicion de thought leaders (Fowler, Hohpe, Newman, Humble, etc.)
8. TRL (Technology Readiness Level) estimado

Entregar:
- Ficha tecnica de posicionamiento (tabla multi-fuente)
- Analisis de convergencia/divergencia entre fuentes
- Curva de adopcion estimada (Rogers)
- Riesgos especificos de adopcion
- Recomendacion: Adopt / Trial / Assess / Hold (con justificacion)
- Alternativas tecnologicas y comparativa

Formato: markdown con evidence tags
```

**Cuando usar:** Cuando el equipo necesita evaluar una tecnologia especifica antes de tomar una decision de adopcion. Ideal como input para ADRs (Architecture Decision Records).

---

## Prompt 3: Sector-Specific Vigilance

```
Ejecuta vigilancia tecnologica focalizada en el sector {SECTOR}.

Sector: {SECTOR: banking / health / retail / SaaS / manufacturing / gov / energy / telecom}
Sub-sector (si aplica): {SUB-SECTOR}
Region: {REGION: LATAM / global}

Para el sector indicado:
1. Identificar 8-10 senales tecnologicas especificas del sector
2. Mapear regulaciones y compliance que afectan adopcion tecnologica
3. Identificar competidores de referencia y su stack tecnologico conocido
4. Detectar startups disruptivas en el sector (AngelList, Crunchbase signals)
5. Thought leaders especificos del sector
6. Benchmarks de madurez tecnologica del sector (Gartner Maturity Model)

Entregar:
- Mapa de senales sectoriales con fuentes
- Tabla de regulaciones relevantes
- Competitive technology landscape
- Recomendaciones diferenciadas por sub-contexto
- Indicar donde el sector va ADELANTE o ATRAS del mercado general

Formato: markdown con evidence tags
```

**Cuando usar:** Cuando el discovery es para un sector regulado o con dinamicas tecnologicas propias. Especialmente util para banking, health y gov donde las restricciones sectoriales cambian las recomendaciones.

---

## Prompt 4: Pre-Discovery Tech Context

```
Genera el contexto tecnologico previo al discovery de {PROYECTO}.

Este documento sirve como input para el equipo de discovery ANTES de iniciar:
- Que tecnologias son relevantes para este tipo de proyecto/sector
- Que dicen los analistas y la comunidad sobre estas tecnologias
- Que riesgos tecnologicos debe considerar el equipo
- Que preguntas debe hacer el equipo al cliente sobre su stack

NO es un reporte completo de vigilancia — es un briefing rapido (max 3 paginas).

Entregar:
- Top 5 tecnologias relevantes con posicionamiento rapido (1 linea por fuente)
- 3 riesgos tecnologicos a validar en discovery
- 5 preguntas recomendadas para el cliente sobre su stack y roadmap
- Referencias rapidas (links a Hype Cycles, Radars, Waves relevantes)

Formato: markdown breve, variante ejecutiva
```

**Cuando usar:** Antes de iniciar un discovery, para dar contexto tecnologico al equipo. Complementa el Discovery Plan (00) con perspectiva de mercado.

---

## Prompt 5: Think Tank Input Preparation

```
Prepara el input de vigilancia tecnologica para el Think Tank de Factibilidad.

Escenario evaluado: {DESCRIPCION DEL ESCENARIO}
Tecnologias propuestas: {LISTA DE TECNOLOGIAS DEL ESCENARIO}

Para cada tecnologia propuesta, evaluar:
1. TRL actual (Technology Readiness Level, escala 1-9)
2. Posicionamiento multi-fuente (Gartner, TW, CNCF, Forrester)
3. Casos de uso en produccion documentados (con escala comparable)
4. Riesgos de adopcion especificos
5. Alternativas maduras (si la tecnologia propuesta es inmadura)
6. Vendor lock-in assessment
7. Community health (contributors, release cadence, bus factor)

Este input alimenta al technology-scout del Think Tank (Council of Seven Sages).

Entregar:
- Technology Assessment Matrix (1 fila por tecnologia)
- Risk Register tecnologico (prelimar)
- Alternativas por tecnologia de riesgo
- Recomendacion preliminar: viable / viable-con-riesgos / no-viable

Formato: markdown con evidence tags, orientado a consumo por el Think Tank
```

**Cuando usar:** Cuando el Think Tank de Factibilidad (Phase 3b) necesita datos de vigilancia tecnologica para evaluar escenarios. Es el input del technology-scout sage.

---

## Prompt 6: Technology Risk Assessment

```
Ejecuta una evaluacion de riesgo tecnologico para {PROYECTO/ESCENARIO}.

Tecnologias en scope: {LISTA}

Para cada tecnologia, evaluar riesgo en 6 dimensiones:
1. **Madurez:** TRL, posicion Hype Cycle, adopcion real (Rogers curve)
2. **Ecosistema:** Community health, vendor backing, contribuidores
3. **Talento:** Disponibilidad de desarrolladores, curva de aprendizaje, job market
4. **Lock-in:** Grado de dependencia de vendor/plataforma, costo de salida
5. **Seguridad:** Vulnerabilidades conocidas, supply chain risk, compliance
6. **Sostenibilidad:** Trayectoria del proyecto, fundacion/gobernanza, funding

Entregar:
- Risk Matrix (6 dimensiones x N tecnologias)
- Heat map con scoring por dimension
- Mitigaciones recomendadas por riesgo alto
- Overall risk score por tecnologia (bajo/medio/alto/critico)
- Recomendacion: aceptar / mitigar / evitar

Formato: markdown con tablas y evidence tags
```

**Cuando usar:** Cuando las tecnologias propuestas en un escenario tienen riesgos no triviales. Complementa el scenario-analysis con perspectiva de riesgo tecnologico.

---

## Prompt 7: Competitive Technology Benchmark

```
Ejecuta un benchmark tecnologico competitivo para {ORGANIZACION} en el sector {SECTOR}.

Competidores a evaluar: {LISTA DE COMPETIDORES}
(Si no se conocen, identificar 3-5 competidores principales)

Para cada competidor:
1. Stack tecnologico conocido (job postings, tech blogs, conferencias, repos publicos)
2. Inversiones tecnologicas recientes (comunicados, adquisiciones, partnerships)
3. Madurez digital estimada (basic / intermediate / advanced / leader)
4. Senales de innovacion (patentes, papers, contribuciones open-source)

Entregar:
- Competitive Technology Matrix (organizacion vs. competidores)
- Technology Gap Analysis (donde va adelante/atras vs. competencia)
- Quick wins: tecnologias que competidores ya adoptaron y son replicables
- Strategic bets: tecnologias donde liderar vs. competencia
- Mermaid quadrantChart: posicionamiento competitivo

Fuentes: OSINT exclusivamente (informacion publica: job postings, blogs,
conferencias, GitHub, comunicados, patentes publicas)

Formato: markdown con evidence tags [OPENSOURCE], [INFERENCIA]
```

**Cuando usar:** Cuando el cliente necesita saber como se compara tecnologicamente contra su competencia. Util para el pitch ejecutivo (08) y para justificar inversiones ante C-level.

---

## Notas de Uso

- Todos los prompts asumen modo `piloto-auto` y formato `markdown` salvo indicacion contraria
- Reemplazar `{PLACEHOLDERS}` con datos especificos del proyecto
- El Prompt 1 (Full Landscape Scan) incluye elementos de todos los demas — usar prompts individuales cuando se necesita profundidad en un area
- Evidence tags son obligatorios en todo output: [ANALYST], [ACADEMIC], [OPENSOURCE], [REFERENT], [INFERENCIA], [SUPUESTO]
- Fuentes minimas por reporte: 2 Tier 1, 1 Tier 2, 2 Tier 3, 2 Tier 4
- Secuencia recomendada: Prompt 4 (Pre-Discovery) → Prompt 1 (Full Scan) → Prompt 5 (Think Tank Input)

---

**Autor:** Javier Montano | **Ultima actualizacion:** 13 de marzo de 2026

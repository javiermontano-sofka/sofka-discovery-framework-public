---
skill: metodologia-discovery-orchestrator
type: body-of-knowledge
version: 1.0
author: Javier Montaño
copyright: © Comunidad MetodologIA
updated: 2026-03-13
---

# Body of Knowledge — Discovery Orchestrator

## 1. Fundamentos Teóricos: Teoría de la Orquestación

La orquestación de procesos complejos tiene raíces en la **teoría de sistemas** (Bertalanffy, 1968) y en la **cibernética organizacional** (Beer, 1972). El principio rector es que un sistema complejo de análisis interdependientes no puede optimizarse optimizando cada parte por separado — requiere un mecanismo coordinador que mantenga la coherencia global.

En el contexto de consultoría tecnológica, la orquestación resuelve el problema de la **fragmentación analítica**: equipos de expertos que producen análisis excelentes en silos sin integración. La literatura de consultoría estratégica (McKinsey Problem Solving, BCG Consulting Framework) converge en que el valor diferencial no está en cada análisis individual sino en la síntesis coordinada.

**Principios fundacionales aplicados al discovery:**
- **Secuencia con propósito**: cada fase alimenta la siguiente mediante contratos de datos explícitos
- **Contratos sobre confianza**: los outputs inter-fase se verifican formalmente, no se asumen
- **Separación conductor/analista**: el rol de coordinación es incompatible con el rol analítico (principio del árbitro imparcial)
- **Trazabilidad completa**: cada decisión, supuesto y riesgo es rastreable a su fase origen

## 2. Marcos de Referencia Clave

### 2.1 Systems Thinking y Pensamiento en Bucles (Senge, 1990)
*The Fifth Discipline* introduce los arquetipos de sistemas y el pensamiento en bucles causales. Aplicado al discovery: las fases no son lineales en la realidad (un hallazgo de Phase 1 puede invalidar supuestos de Phase 0), pero el pipeline mantiene la secuencia formal mientras gestiona retroalimentación a través del Assumptions Log y los protocolos de recovery.

### 2.2 Tree-of-Thoughts Prompting (Yao et al., 2023)
La técnica de IA que permite explorar múltiples caminos de razonamiento simultáneamente, backtrack y seleccionar la solución óptima. El Expert Panel de 7 especialistas con votación por mayoría es una implementación organizacional de ToT: múltiples perspectivas paralelas, evidencia explícita, decisión por consenso con minoría protegida.

### 2.3 Stage-Gate Process (Cooper, 1986, 1990)
Robert G. Cooper desarrolló el Stage-Gate model en el contexto de desarrollo de nuevos productos (NPD). Los tres quality gates del discovery (G1 escenario, G2 budget, G3 final) son implementaciones directas del Stage-Gate: cada gate es un punto de decisión con criterios explícitos de paso/fallo, no un simple checkpoint de progreso. Cooper demostró que los procesos con gates formales reducen el fracaso en lanzamiento de productos hasta un 60%.

### 2.4 Viable System Model — VSM (Beer, 1972)
El modelo de sistema viable de Stafford Beer describe cómo los sistemas complejos mantienen viabilidad mediante cinco subsistemas. El Conductor como coordinador sin voto reproduce el Sistema 3* (auditoría) y Sistema 4 (inteligencia estratégica) del VSM: observa sin intervenir operativamente, garantizando homeostasis del pipeline.

### 2.5 Program Management — MSP (OGC, 2007)
Managing Successful Programmes del UK Office of Government Commerce establece la distinción entre gestión de proyectos y gestión de programas. El discovery orchestrator implementa el nivel de programa: múltiples proyectos (fases) coordinados bajo beneficios compartidos (la propuesta final), con gobernanza transversal y gestión de interdependencias.

## 3. Obras Seminales

| Obra | Autor(es) | Año | Aporte al Discovery Orchestrator |
|------|-----------|-----|----------------------------------|
| *The Fifth Discipline* | Peter Senge | 1990 | Pensamiento sistémico, aprendizaje organizacional, arquetipos de sistemas |
| *Stage-Gate Product Innovation Process* | Robert G. Cooper | 1986 | Modelo de gates formales con criterios explícitos de aprobación |
| *Brain of the Firm* | Stafford Beer | 1972 | Modelo de sistema viable, separación de roles operativos y coordinadores |
| *Tree of Thoughts* | Yao, Yu, Zhao et al. | 2023 | Exploración de múltiples caminos de razonamiento con backtracking |
| *Managing Successful Programmes* | OGC | 2007 | Gobernanza de programa, interdependencias, beneficios compartidos |
| *The McKinsey Way* | Ethan Rasiel | 1999 | Estructuración de problemas complejos, hipótesis-primero, MECE |
| *Thinking in Systems* | Donella Meadows | 2008 | Bucles de retroalimentación, puntos de apalancamiento, stocks y flujos |
| *Team of Teams* | Stanley McChrystal | 2015 | Coordinación de equipos especializados, consciencia situacional compartida |

## 4. Metodologías de Consultoría Aplicadas

### 4.1 Hypothesis-Driven Problem Solving
Metodología McKinsey/BCG: no se recopila toda la información posible sino que se formulan hipótesis y se busca evidencia confirmatoria/refutatoria. En el discovery, cada fase produce hipótesis que las fases posteriores validan o invalidan. El Assumptions Log es el registro de hipótesis activas.

### 4.2 MECE Framework (Mutually Exclusive, Collectively Exhaustive)
El catálogo de 48 skills organizado en 8 dominios es un diseño MECE: ningún skill está duplicado, y el conjunto cubre exhaustivamente el espacio del problema tecnológico empresarial. El Expert Panel de 7 aplica MECE al análisis multi-perspectiva.

### 4.3 Structured Problem Decomposition
La descomposición jerárquica del problema: sistema → subsistemas (cuando >500K LOC) → fases → entregables → secciones. Permite paralelización controlada (Phases 5a y 5b corren en paralelo post-Gate 2) sin perder coherencia.

### 4.4 Evidence-Based Decision Making
Cada claim en el pipeline requiere evidencia etiquetada: [CÓDIGO], [CONFIG], [DOC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER]. La decisión del comité se basa en fuerza de evidencia, no en jerarquía o preferencia personal.

## 5. Principios de Diseño del Pipeline

### 5.1 Contratos de Datos Inter-Fase
Inspirados en los **data contracts** del diseño de APIs y sistemas distribuidos (Kleppmann, 2017), los contratos inter-fase del discovery especifican exactamente qué outputs produce cada fase y cuáles son los inputs mínimos requeridos por la siguiente. Un contrato incumplido detiene el pipeline — no se avanza con supuestos no documentados.

### 5.2 Separación Conductor/Analista
Principio derivado de la teoría de sistemas judiciales y arbitraje: el árbitro no tiene opinión sobre el fondo, solo sobre el proceso. El Conductor del discovery no analiza ni vota; secuencia, valida contratos y escala conflictos al usuario. Esta separación previene el sesgo de confirmación del orquestador y garantiza imparcialidad en los gates.

### 5.3 Recuperación ante Errores
El protocolo de re-ejecución (máximo 2 por fase) con feedback estructurado previene la acumulación de deuda de calidad en fases tempranas. Un hallazgo erróneo en Phase 1 no detectado hasta Phase 5 tiene un costo de corrección 10x mayor (análogo al "shift left" en testing).

### 5.4 Gestión de Variantes
El pipeline soporta tres variantes (full, minimal, quick-reference) implementando el principio de **right-sizing**: el proceso debe ser proporcional al riesgo de la decisión. Quick Reference para go/no-go bajo presión de tiempo; Full Pipeline para compromisos de ejecución.

## 6. Herramientas y Tecnologías de Soporte

### 6.1 Diagramación Estructurada — Mermaid
El estándar de diagramación del framework (Mermaid JS) permite diagramas as-code, versionables en git, renderizables en markdown y HTML. El budget de diagramas por entregable (1 mínimo, 2 recomendado, 4 máximo) refleja el principio cognitivo de carga de trabajo visual: demasiados diagramas oscurecen más de lo que iluminan.

### 6.2 Evidence Tagging System
El sistema de etiquetas [CÓDIGO], [CONFIG], [DOC], [INFERENCIA], [SUPUESTO], [STAKEHOLDER] es una implementación ligera de **provenance tracking** — rastrear el origen de cada dato. Permite auditoría post-engagement y diferencia hallazgos observados de inferencias, reduciendo riesgo de propuestas sobre supuestos implícitos.

### 6.3 Input Registry como Sistema de Gestión de Dependencias
El registro de inputs del orchestrator funciona como un grafo de dependencias invertido: qué fase necesita qué input, cuándo, y de quién. Implementa el patrón de **dependency inversion** aplicado a la gestión de información: el pipeline declara sus necesidades, no las busca ad hoc.

## 7. Relaciones con Otros Skills del Framework

| Skill | Tipo de Relación | Descripción |
|-------|-----------------|-------------|
| **pipeline-governance** | Socio estructural | Gobernanza formal del programa; el orchestrator lo activa en TODAS las fases |
| **risk-controlling-dynamics** | Socio de control | Controlador de riesgos y supuestos activo en todas las fases; el orchestrator lo activa transversalmente |
| **stakeholder-mapping** | Fase 0 | Primer skill activado; su output es prerequisito del registro de stakeholders del orchestrator |
| **asis-analysis** | Fase 1 | Análisis técnico que alimenta el contrato de datos P1→P2 |
| **scenario-analysis** | Fase 3 | Votación de comité completo; el orchestrator facilita el proceso de Tree-of-Thoughts |
| **technical-feasibility** | Fase 3b | Validación post-G1; el orchestrator verifica el checkpoint 3b antes de proceder |
| **executive-pitch** | Fase 5b | Output final orientado a cliente; el orchestrator coordina la validación QA previa |
| **discovery-handover** | Fase 6 | Cierre formal del engagement; el orchestrator transfiere control tras Gate 3 |
| **html-brand** | Transversal | Formato HTML de entregables ejecutivos; activado por parámetro {FORMATO} |
| **sector-intelligence** | Fases 1-6 | Lens de industria aplicado transversalmente; el orchestrator activa el SME en Phase -1 |

## 8. Anti-Patrones y Errores Comunes

| Anti-Patrón | Descripción | Impacto | Mitigación en el Orchestrator |
|-------------|-------------|---------|-------------------------------|
| **Analysis Paralysis** | Acumular análisis sin decidir en gates | Engagement sin propuesta | Gates como hard stops con criterios binarios |
| **Phase Skipping** | Saltar fases "por eficiencia" | Contrato de datos incumplido, propuesta incoherente | Verificación explícita de prerequisites antes de cada fase |
| **Conductor Opinion** | El conductor analiza en lugar de coordinar | Sesgo de confirmación, pérdida de imparcialidad | Rol definido: el conductor NUNCA analiza ni vota |
| **Silent Assumptions** | Supuestos no documentados | Propuesta sobre bases falsas | Assumptions Log obligatorio; cada inferencia debe etiquetarse [SUPUESTO] |
| **Gate Theatre** | Gates sin criterios reales, solo aprobación ritual | Falsa seguridad, problemas post-propuesta | Criterios explícitos con evidencia requerida para cada gate |
| **Silo Analysis** | Expertos que no comparten hallazgos inter-fase | Insights perdidos entre fases | Contratos de datos inter-fase como mecanismo de compartición forzada |

---
**Autor:** Javier Montaño | **© Comunidad MetodologIA** | **Actualización:** 13 de marzo de 2026

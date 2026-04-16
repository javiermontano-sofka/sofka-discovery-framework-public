# State of the Art — Technical Feasibility (2024-2026)

> Tendencias, herramientas emergentes y debates abiertos en la validación de viabilidad técnica y análisis multidimensional de feasibility.

---

## 1. Tendencias Dominantes

### 1.1 AI-Assisted Feasibility Analysis

- **Qué está pasando:** Herramientas de IA están acelerando componentes específicos del análisis de viabilidad. LLMs pueden analizar codebases para validar claims de integración, revisar documentación de vendors contra sus implementaciones reales, y generar escenarios de riesgo que un analista humano podría omitir.
- **Impacto en feasibility:** S1 (Claim Inventory) se acelera significativamente: la extracción de claims del escenario y el mapeo contra evidencia del codebase pasa de 4-8 horas a 1-2 horas con asistencia AI. La calidad del fact-checking mejora porque el LLM puede cruzar referencias entre múltiples documentos simultáneamente.
- **Riesgo:** Confianza excesiva en el análisis AI. Los LLMs pueden validar claims con confianza falsa (hallucination sobre compatibilidad técnica). El analista humano sigue siendo esencial para veredictos de UNVALIDATED/AT RISK.
- **Fuentes:** Khlaaf, H. (2025). "AI-Assisted Architecture Decision Making". *IEEE Software*; GitHub (2025) "Copilot for Architecture Review"

### 1.2 Continuous Feasibility Validation

- **Qué está pasando:** El concepto de feasibility study como documento puntual está siendo reemplazado por validación continua. Los equipos que practican Continuous Architecture evalúan feasibility en cada sprint, no solo antes de comprometer.
- **Impacto en feasibility:** El modelo "big upfront feasibility" (nuestro S1-S6 completo) sigue siendo necesario para grandes transformaciones, pero se complementa con "feasibility checkpoints" durante la ejecución. El S5 (Verdict) se actualiza periódicamente con nueva evidencia.
- **Estado 2026:** Equipos maduros integran fitness functions automatizadas (ArchUnit, NetArchTest) que validan continuamente si la implementación cumple las decisiones arquitectónicas del feasibility.
- **Fuentes:** Ford, N. et al. (2023). *Building Evolutionary Architectures*, 2nd Ed. O'Reilly; ThoughtWorks (2025) "Continuous Architecture Assessment"

### 1.3 Platform Engineering Impact on Feasibility

- **Qué está pasando:** Platform Engineering (Gartner Top Strategic Trend 2024-2026) cambia D6 (Operational Feasibility) fundamentalmente. Un Internal Developer Platform (IDP) reduce la barrera operativa de arquitecturas complejas: lo que antes requería DevOps dedicado ahora está abstraído.
- **Impacto en feasibility:** D6 debe evaluar si la organización tiene (o planea construir) un IDP. Con IDP maduro, microservicios tienen D6 score más alto. Sin IDP, microservicios en una organización sin experiencia operacional es AT RISK.
- **Herramientas clave:** Backstage (Spotify), Humanitec, Port, Kratix, Crossplane.
- **Fuentes:** Gartner (2025) "Top Strategic Technology Trends"; Humanitec (2025) "State of Platform Engineering Report"

### 1.4 Cloud-Native Feasibility Patterns

- **Qué está pasando:** La madurez de servicios cloud-native (serverless, managed databases, container orchestration) ha cambiado el perfil de riesgo de muchas decisiones arquitectónicas. Lo que era AT RISK en 2020 (ej: event-driven con managed Kafka) puede ser VALIDATED en 2026.
- **Impacto en feasibility:** D1 (Technical Feasibility) debe considerar el estado actual del ecosistema cloud, no solo papers y patrones teóricos. Los managed services reducen riesgo técnico pero aumentan vendor lock-in (tension con D4).
- **Patrones emergentes:**
  - **Serverless-first feasibility:** evaluar si la carga de trabajo es compatible con serverless constraints
  - **Multi-cloud feasibility:** evaluar portabilidad real (no teórica) con CNCF standards
  - **Edge computing feasibility:** evaluar latencia, regulación de datos, y conectividad
- **Fuentes:** CNCF (2025) "Cloud Native Landscape"; AWS/Azure/GCP Well-Architected Frameworks (2025)

---

## 2. Herramientas Emergentes (2024-2026)

### 2.1 Validación Arquitectónica

| Herramienta | Propósito | Madurez | Relevancia para Feasibility |
|---|---|---|---|
| **ArchUnit / NetArchTest** | Architecture fitness functions | Estable | D1 — validar que la arquitectura implementada cumple decisiones |
| **Structurizr** | C4 modeling + architecture documentation | Estable | D1 — modelar y visualizar la arquitectura propuesta |
| **jQAssistant** | Architecture analysis from bytecode | Nicho | D1 — validar claims de desacoplamiento en código existente |
| **Backstage (Spotify)** | Internal Developer Portal | Creciendo rápido | D6 — evaluar madurez de platform engineering |
| **Crossplane / Terraform** | Infrastructure as Code | Madura | D1, D6 — evaluar viabilidad de infraestructura propuesta |

### 2.2 Estimación y Riesgo

| Herramienta | Propósito | Relevancia para Feasibility |
|---|---|---|
| **Monte Carlo simulators (Crystal Ball, @RISK)** | Simulación probabilística | D3 — generar rangos P10/P50/P90 para timelines |
| **Jira/Azure DevOps analytics** | Velocity histórica | D3 — validar claims de timeline con datos reales del equipo |
| **LinearB / Jellyfish** | Engineering intelligence | D2, D3 — métricas de productividad y capacity del equipo |
| **CodeScene** | Behavioral code analysis | D1 — hotspots y complexity trends para validar claims de refactoring |
| **Snyk / Dependabot** | Dependency analysis | D1, D5 — validar claims de seguridad y compatibilidad |

### 2.3 Compliance y Regulación

| Herramienta | Propósito | Relevancia para Feasibility D5 |
|---|---|---|
| **Vanta / Drata** | Compliance automation | Evaluar gap entre estado actual y requisitos regulatorios |
| **Open Policy Agent (OPA)** | Policy as code | Validar feasibility de reglas de compliance en infraestructura |
| **Terraform Sentinel** | Policy enforcement | D5 + D6 — compliance automatizado en IaC |
| **NIST AI RMF Tools** | AI risk management | D5 para componentes IA — evaluar compliance con AI Act |

---

## 3. Debates Abiertos en la Industria

### 3.1 ¿Cuánta feasibility es suficiente?

**El dilema de la parálisis de análisis:**
- **Posición "lean":** "El mejor feasibility es un spike que funciona. Pasa 2 días haciendo y 0 días analizando."
- **Posición "enterprise":** "Un feasibility riguroso de 2 semanas ahorra 6 meses de rewrite. La evidencia es clara."
- **Posición del skill:** La profundidad es proporcional al riesgo (Risk-Driven Architecture, Fairbanks). Un proyecto de 3 sprints no necesita feasibility 6D. Una transformación de 18 meses con 15 personas la necesita absolutamente. El parámetro {VARIANTE} ejecutiva vs técnica captura esta distinción.

### 3.2 ¿Las 6 dimensiones tienen el mismo peso?

- **Debate:** ¿D1 (Technical) es más importante que D2 (Organizational)?
- **Evidencia:** Estudios del Standish Group (CHAOS Reports 2020-2024) muestran que los factores organizacionales (D2) causan más fracasos que los técnicos (D1). Sin embargo, los técnicos son los más visibles y más fáciles de validar.
- **Posición del skill:** Pesos iguales por default. El analista puede ajustar pesos según contexto. Pero NUNCA eliminar una dimensión — la feasibility parcial es feasibility falsa. Un composite score con D2=1/5 y todo lo demás en 4/5 sigue siendo FEASIBLE WITH CONDITIONS.

### 3.3 ¿El fact-checking con AI es confiable?

- **Riesgo:** Los LLMs pueden "validar" claims con confianza injustificada. Un LLM puede decir "sí, Kafka maneja 100K messages/second" sin considerar el contexto específico (message size, persistence settings, hardware).
- **Posición del skill:** AI como acelerador de S1 (inventario y mapeo), humano como decisor de veredictos. Todo claim validado por AI se marca como [INFERENCIA] hasta que se verifica con evidencia de Nivel 1-2 (código, benchmarks, documentación técnica).

### 3.4 ¿Feasibility antes o después de seleccionar escenario?

- **Posición pre-selección:** "Evalúa feasibility de los 3 escenarios antes de elegir — así la elección es informada."
- **Posición post-selección:** "Solo evalúa el escenario elegido — feasibility de 3 escenarios es 3x costo."
- **Posición del skill:** Post-selección por default (Gate 1 → feasibility del escenario aprobado). Pero si dos escenarios están muy parejos en Gate 1, un feasibility express (variante ejecutiva) de ambos puede romper el empate. Esto se recomienda explícitamente en scenario-analysis.

---

## 4. Casos de Éxito Documentados

### 4.1 UK Government — Digital Transformation Feasibility
- **Contexto:** GDS estableció un framework de feasibility para evaluar modernización de sistemas legacy del gobierno. Incluye dimensiones técnica, organizacional, financiera, y regulatoria.
- **Relevancia:** Modelo pragmático para organizaciones grandes. La dimensión regulatoria (D5) es particularmente relevante porque incluye procurement rules, data sovereignty, y accessibility requirements.
- **Fuente:** UK Government Digital Service (2023). "Technology Code of Practice"; "Managing Legacy Technology"

### 4.2 Spotify — Architecture Decision Records como Feasibility Living Document
- **Contexto:** Spotify usa ADRs no solo para documentar decisiones tomadas sino como pre-decisión feasibility. Antes de aprobar un ADR, se documenta el análisis de feasibility de la decisión propuesta.
- **Relevancia:** Modelo de "feasibility continua" donde el análisis de viabilidad está embebido en el proceso de decisión arquitectónica, no es un evento separado.
- **Fuente:** Spotify Engineering Blog (2024). "Architecture Decision Records at Scale"

### 4.3 ING Bank — Microservices Feasibility Assessment
- **Contexto:** ING realizó un feasibility riguroso antes de su migración a microservicios. El análisis organizacional (D2) identificó que la estructura de equipos era incompatible. Aplicaron Inverse Conway Maneuver: reorganizaron equipos ANTES de cambiar la arquitectura.
- **Relevancia:** Ejemplo de cómo D2 (Organizational) puede ser el blocker principal, no D1 (Technical). La feasibility informó el order of operations: org change → architecture change.
- **Fuente:** van den Berg, C. (2023). "Scaling Agile Architecture at ING". *QCon London*.

---

## 5. Evolución Esperada (2026-2028)

| Tendencia | Probabilidad | Impacto en Technical Feasibility |
|---|---|---|
| **AI pre-validates claims from codebase** | Alta | S1 se automatiza parcialmente: extraction + initial evidence mapping |
| **Continuous feasibility as CI/CD stage** | Media-Alta | El skill produce el baseline; fitness functions lo mantienen actualizado |
| **Platform engineering reduces D6 complexity** | Alta | D6 se simplifica en orgs con IDP maduro pero se complejiza evaluando el IDP |
| **Regulatory feasibility becomes dominant** | Alta (EU AI Act, CRA) | D5 pasa de "check" a dimensión dominante para proyectos con IA o datos sensibles |
| **Organizational feasibility tools emerge** | Media | D2 se beneficia de herramientas como TeamTopologies.dev y org design platforms |
| **Quantum computing feasibility assessments** | Baja (2028+) | Nueva sub-dimensión en D1 para evaluar quantum readiness de algoritmos criptográficos |

---

**Autor:** Javier Montaño | **Última actualización:** 13 de marzo de 2026
**© Comunidad MetodologIA — Todos los derechos reservados**

# Use Case Prompts — Software Viability: Substance vs Smoke

> Ready-to-use prompts for the most frequent use cases of this skill.
> Each prompt includes context on when to use it and variable parameters.

---

## 1. Full Viability Evaluation (Full Stack Validation)

**When:** Pre-commitment of technology. The client proposes a complete stack and needs forensic validation before investing.

```
Ejecutar validación de viabilidad tecnológica completa para el proyecto {NOMBRE_PROYECTO}.

Tecnologías a evaluar:
1. {TECH_1} — {ROL_EN_STACK} (ej: backend framework)
2. {TECH_2} — {ROL_EN_STACK} (ej: base de datos)
3. {TECH_3} — {ROL_EN_STACK} (ej: message broker)
4. {TECH_4} — {ROL_EN_STACK} (ej: frontend framework)
5. {TECH_5} — {ROL_EN_STACK} (ej: plataforma cloud)

Contexto:
- Industria: {INDUSTRIA}
- Tamaño del equipo: {NUM_DEVS} personas
- Experiencia del equipo con estas tecnologías: {EXPERIENCIA} (ninguna/básica/intermedia/avanzada)
- Timeline del proyecto: {MESES} meses
- Criticidad de negocio: {CRITICIDAD} (baja/media/alta/misión-crítica)

Parámetros:
- {MODO}: piloto-auto
- {FORMATO}: markdown
- {VARIANTE}: técnica
- {MODO_OPERACIONAL}: integral

Entregar A-04_Software_Viability con las 7 secciones completas.
Para cada tecnología: maturity score, community health, production evidence, vendor risk, y veredicto.
Diseñar PoC para toda tecnología con veredicto 🟡 o 🟠.
```

---

## 2. AI/ML Technology Validation

**When:** The client proposes integrating AI/ML components. Specific validation of AI claims is needed before committing budget.

```
Ejecutar validación de viabilidad AI/ML para el proyecto {NOMBRE_PROYECTO}.

Componentes AI/ML a evaluar:
1. {AI_COMPONENT_1} — Claim: "{CLAIM_1}"
2. {AI_COMPONENT_2} — Claim: "{CLAIM_2}"
3. {AI_COMPONENT_3} — Claim: "{CLAIM_3}"

Contexto:
- Caso de uso de IA: {CASO_USO} (ej: clasificación de documentos, generación de código, chatbot)
- Datos disponibles: {DATOS} (propios/vendor/públicos/sin datos todavía)
- Volumen esperado de inferencia: {VOLUMEN} (ej: 10K requests/día)
- Requisitos de latencia: {LATENCIA} (ej: <500ms p95)
- Regulaciones aplicables: {REGULACIONES} (ej: EU AI Act, GDPR)

Parámetros:
- {MODO}: supervisado
- {MODO_OPERACIONAL}: validacion-ia

Profundizar en:
- Claims vs Reality Matrix con benchmarks independientes
- AI Maturity Indicators (training data, eval metrics, failure modes, drift monitoring)
- LLM Red Flags (si aplica): hallucination rate, eval framework, data handling
- Costo de inferencia a escala (no solo en demo)
- Fallback strategy si el modelo falla/no está disponible

CRITICAL: Separar lo que el vendor dice de lo que la evidencia muestra.
Etiquetar todo como [VENDOR-DOC], [BENCHMARK], [INFERENCIA], o [SUPUESTO].
```

---

## 3. Technology Vendor Evaluation

**When:** Vendor selection for a critical component. Multiple options, needs evidence-based comparison.

```
Ejecutar evaluación comparativa de vendors para {COMPONENTE} en el proyecto {NOMBRE_PROYECTO}.

Vendors a evaluar:
1. {VENDOR_1}: {PRODUCTO_1} — precio indicativo: {PRECIO_1}
2. {VENDOR_2}: {PRODUCTO_2} — precio indicativo: {PRECIO_2}
3. {VENDOR_3}: {PRODUCTO_3} — precio indicativo: {PRECIO_3}

Criterios de evaluación (ponderar según contexto):
- Maturity & stability (release cadence, API stability, deprecation policy)
- Vendor viability (funding, revenue, market position, acquisition risk)
- Lock-in assessment (data portability, API standards, exit cost)
- Pricing model stability (historial de cambios de precio, lock-in mechanisms)
- Integration feasibility (APIs, SDKs, documentation quality)
- Support & SLA (response time, escalation, contractual guarantees)

Parámetros:
- {MODO_OPERACIONAL}: forense-tecnologico
- {FORMATO}: markdown

Output adicional: tabla comparativa con scoring ponderado + recomendación con justificación.
Incluir vendor exit strategy para el vendor recomendado.
```

---

## 4. Open-Source Risk Evaluation

**When:** The proposed stack depends heavily on open-source components. Sustainability and dependency chain risk need to be validated.

```
Ejecutar evaluación de riesgo open-source para las dependencias críticas del proyecto {NOMBRE_PROYECTO}.

Dependencias OSS a evaluar:
1. {OSS_1} — versión: {VERSION_1} — criticidad: {CRITICIDAD_1}
2. {OSS_2} — versión: {VERSION_2} — criticidad: {CRITICIDAD_2}
3. {OSS_3} — versión: {VERSION_3} — criticidad: {CRITICIDAD_3}
4. {OSS_4} — versión: {VERSION_4} — criticidad: {CRITICIDAD_4}
5. {OSS_5} — versión: {VERSION_5} — criticidad: {CRITICIDAD_5}

Para cada dependencia evaluar:
- Community Health (CHAOSS metrics): contributors, commit frequency, issue response time
- Bus factor y concentración organizacional (Elephant Factor)
- Funding y modelo de sostenibilidad (sponsors, open-core, consulting)
- Licencia y compatibilidad (OSI compliance, license change risk)
- Supply chain security (SLSA level, known vulnerabilities, transitive dependencies)
- Lifecycle stage (active development, maintenance mode, deprecated, abandoned)

Parámetros:
- {MODO_OPERACIONAL}: forense-tecnologico

Output: riesgo por dependencia (🟢🟡🟠🔴) + riesgo agregado de supply chain.
Para cada 🟠/🔴: alternativa identificada + migration path estimado.
```

---

## 5. Legacy Technology Sunset Analysis

**When:** The client uses a technology showing signs of obsolescence. Needs to evaluate whether it is time to migrate and to what.

```
Ejecutar análisis de sunset tecnológico para {TECNOLOGÍA_LEGACY} en el proyecto {NOMBRE_PROYECTO}.

Contexto:
- Tecnología evaluada: {TECNOLOGÍA} versión {VERSION}
- Años de uso en el cliente: {AÑOS}
- Penetración en el codebase: {PORCENTAJE}% del código
- Dependencias que dependen de esta tecnología: {NUM_DEPS}
- Equipo con conocimiento: {NUM_PERSONAS} personas

Evaluar señales de sunset:
- Release frequency trend (últimos 24 meses)
- Community activity trend (contributors, commits, PRs)
- Conference mentions trend (KubeCon, QCon, etc.)
- Vendor/maintainer communications (EOL announcements, roadmap changes)
- Market alternatives maturity (quién está tomando el share)
- Migration tooling availability (automated migration tools)

Clasificar:
- 🟢 ACTIVO — desarrollo activo, comunidad saludable, sin señales de decline
- 🟡 MANTENIMIENTO — solo patches, sin features nuevos, migración recomendada a mediano plazo
- 🟠 DECLINE — señales claras de obsolescencia, planificar migración
- 🔴 EOL/ABANDONADO — sin soporte, migrar con urgencia

Output: veredicto de sunset + timeline recomendado de migración + alternativas evaluadas + effort estimate.
```

---

## 6. Express Validation of Emerging Technology

**When:** Someone proposes a new/emerging technology. You need a quick verdict before investing more time evaluating.

```
Validación express de viabilidad de {TECNOLOGÍA_EMERGENTE} para {CASO_USO}.

Quick-check (responder cada uno):
1. ¿Tiene versión >= 1.0? (si no, techo de 🟡)
2. ¿GitHub stars > 1K? ¿Contributors > 10?
3. ¿Existe en producción verificable en al menos 3 organizaciones?
4. ¿Tiene documentación de API estable con deprecation policy?
5. ¿Hay alternativas maduras para el mismo caso de uso?
6. ¿El vendor/maintainer tiene runway financiero visible?
7. ¿El equipo tiene experiencia previa o curva de aprendizaje estimada?

Parámetros:
- {VARIANTE}: ejecutiva
- {MODO}: desatendido

Output: veredicto en 1 página con semáforo + rationale + recomendación (adopt/trial/assess/hold).
Si el veredicto es 🟡 o inferior, incluir PoC mínimo propuesto.
```

---

## 7. Pre-Investment Technology Due Diligence

**When:** Technical evaluation as part of an investment or acquisition decision. The output will be consumed by non-technical stakeholders.

```
Ejecutar due diligence de viabilidad tecnológica del stack de {EMPRESA_TARGET}.

Stack a evaluar:
{LISTA_TECNOLOGÍAS}

Contexto: evaluación pre-inversión/adquisición.

Enfoque especial en:
- S1: Inventario completo con maturity assessment
- S2: Community health y sustainability de cada componente
- S4: Vendor risk y lock-in assessment
- S6: Scorecard con veredicto global

Variante: ejecutiva (findings + scorecard, max 5 páginas)
Formato: {FORMATO}

CRÍTICO:
- Separar hechos de inferencias con etiquetas explícitas
- Cuantificar riesgo en términos de costo de migración si la tecnología falla
- No recomendar remediation — solo hallazgos y riesgo cuantificado
- Incluir "technology risk factor" para ajuste de valoración
```

---

**Author:** Javier Montaño | **Last updated:** March 13, 2026
**© Comunidad MetodologIA — All rights reserved**

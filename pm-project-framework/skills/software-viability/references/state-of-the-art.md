# State of the Art — Software Viability (2024-2026)

> Tendencias, herramientas emergentes y debates abiertos en la validación de viabilidad de software y tecnologías propuestas.

---

## 1. Tendencias Dominantes

### 1.1 AI/LLM Viability Assessment — El Nuevo Campo de Batalla

- **Qué está pasando:** La explosión de productos "AI-powered" ha creado el mayor ratio humo/substancia en la historia del software. En 2025-2026, el 60-70% de productos que claim "IA" usan modelos genéricos con wrappers superficiales. La diferenciación real está en fine-tuning con datos de dominio, evaluación rigurosa, y producción comprobada.
- **Impacto en viabilidad:** S3 (AI/ML Validation) es ahora la sección más crítica del skill. Los red flags de LLM incluyen: hallucination rate no divulgado, no eval framework, "fine-tuned" sin documentación de training data, automation rate sin error analysis.
- **Herramientas emergentes:** Arize AI (observabilidad ML), Weights & Biases (experiment tracking), LangSmith (LLM evaluation), Braintrust (LLM evals), HELM (Stanford benchmark holístico).
- **Riesgo:** El marketing de IA supera por mucho la realidad de producción. Un "95% accuracy" en demo puede ser 72% en datos reales. Los costos de inferencia a escala rara vez se documentan en la fase de venta.
- **Fuentes:** Stanford HAI (2025) "AI Index Report"; Gartner (2025) "Hype Cycle for AI"; Huyen, C. (2025) "AI Engineering"

### 1.2 Open-Source Sustainability Crisis

- **Qué está pasando:** Eventos como el backdoor de xz-utils (2024), el agotamiento documentado de mantenedores de core-js, y los cambios de licencia de HashiCorp (Terraform, Vault) y Redis han puesto la sostenibilidad open-source en el centro del debate. La dependencia empresarial de proyectos mantenidos por 1-3 personas es un riesgo sistémico.
- **Impacto en viabilidad:** S2b (Community Health) y S4b (Dependency Chain) son más críticos que nunca. El bus factor, el Elephant Factor (concentración organizacional), y la presencia de funding verificable son indicadores prioritarios.
- **Tendencias de funding:** GitHub Sponsors, Open Collective, Tidelift, y contratos de soporte empresarial. Los proyectos con modelo de negocio claro (open-core, dual license) son más sostenibles que los puramente altruistas.
- **Fuentes:** Eghbal, N. (2024) "State of Open Source Maintainers"; Linux Foundation (2025) "Census III of Open Source Software"; xz-utils incident post-mortem (2024)

### 1.3 Vendor Lock-in y la Era Multi-Cloud

- **Qué está pasando:** La promesa de multi-cloud se choca con la realidad de servicios propietarios (AWS Lambda, Azure Cognitive Services, GCP Vertex AI). El lock-in no es solo de infraestructura — es de datos, APIs, workflows, y skills del equipo. Los cambios de pricing de cloud providers (AWS 2024, Azure 2025) demuestran que el lock-in tiene costo financiero impredecible.
- **Impacto en viabilidad:** S4 (Vendor Risk) debe evaluar no solo el lock-in técnico sino el lock-in económico y de competencias. La portabilidad real (no teórica) es un criterio de viabilidad.
- **Estrategias de mitigación emergentes:** CNCF standards (OCI, OpenTelemetry), abstraction layers (Dapr, Crossplane), y contractual protections (data portability clauses, exit provisions).
- **Fuentes:** Flexera (2025) "State of the Cloud Report"; CNCF (2025) "Cloud Native Landscape"; FinOps Foundation (2025) "State of FinOps"

### 1.4 Technology Sunset Patterns — La Muerte Predecible de Tecnologías

- **Qué está pasando:** Los patrones de obsolescencia tecnológica son cada vez más predecibles. Señales tempranas incluyen: reducción de release frequency, disminución de conference talks, migración de contributors principales a otros proyectos, forks activos que superan al proyecto original.
- **Impacto en viabilidad:** S2a (Lifecycle Stage) incorpora "sunset indicators" como métrica proactiva. Detectar que una tecnología está en decline temprano permite planificación de exit antes de la crisis.
- **Ejemplos recientes (2024-2025):** AngularJS → Angular migration path cerrado, Python 2 legacy systems todavía existentes, Java EE → Jakarta EE migration pendiente en muchas organizaciones, CentOS → alternativas (Rocky, Alma).
- **Fuentes:** ThoughtWorks (2025) Tech Radar "Hold" category analysis; EndOfLife.date project

---

## 2. Herramientas Emergentes (2024-2026)

### 2.1 Evaluación de Madurez y Community Health

| Herramienta | Propósito | Madurez | Relevancia para Viabilidad |
|---|---|---|---|
| **CHAOSS GrimoireLab** | Community health analytics | Estable | S2b — métricas cuantitativas de comunidad OSS |
| **Cauldron.io** | Dashboard de métricas CHAOSS | Creciendo | S2b — visualización de salud de proyecto |
| **OSS Insight (PingCAP)** | GitHub analytics a escala | Estable | S2b — tendencias de actividad, comparativas |
| **Socket.dev** | Supply chain security + quality signals | Creciendo rápido | S4b — detección de paquetes maliciosos y abandonados |
| **Snyk Advisor** | Package health scoring | Madura | S2b, S4b — scoring automatizado de dependencias |
| **Libraries.io** | Dependency monitoring | Estable | S4b — tracking de dependencias y versiones |

### 2.2 Evaluación de IA/ML

| Herramienta | Propósito | Relevancia para Viabilidad S3 |
|---|---|---|
| **Stanford HELM** | Benchmark holístico de LLMs | Validación de claims de LLM contra benchmarks independientes |
| **Arize AI** | ML observability | Verificar si el vendor tiene monitoring de drift en producción |
| **Weights & Biases** | Experiment tracking | Verificar si hay tracking reproducible de experimentos |
| **LangSmith / Braintrust** | LLM evaluation | Evaluación de accuracy en dominio específico |
| **Hugging Face Model Hub** | Model registry + community benchmarks | Validación de claims de modelos open-source |
| **MLCommons** | Benchmarks estandarizados (MLPerf) | Comparación de performance de inferencia entre vendors |

### 2.3 Evaluación de Vendor y Mercado

| Herramienta | Propósito | Relevancia para Viabilidad S4 |
|---|---|---|
| **Crunchbase** | Datos de funding y financieros | S4a — viabilidad financiera del vendor |
| **G2 / Gartner Peer Insights** | Reviews de usuarios verificados | S2c — production evidence de usuarios reales |
| **StackShare** | Tech stacks de empresas reales | S2c — quién usa esta tecnología en producción |
| **BuiltWith** | Technology adoption tracking | S2c — market share y tendencia de adopción |
| **EndOfLife.date** | Tracking de EOL de productos | S2a — lifecycle stage automatizado |

---

## 3. Debates Abiertos en la Industria

### 3.1 ¿Cómo evaluar viabilidad de IA cuando todo claim "IA"?

**El problema de 2025-2026:**
- **Posición escéptica:** "El 80% de productos AI-powered son wrappers de GPT-4 con un system prompt. La verdadera IA en producción es rara y costosa."
- **Posición pragmática:** "Incluso un wrapper de LLM puede ser viable si resuelve el problema del usuario. La pregunta no es 'es IA real' sino 'funciona en producción con costos aceptables'."
- **Posición del skill:** Evaluamos substancia, no purismo tecnológico. Un wrapper de LLM con buena ingeniería de prompts, evaluación rigurosa, fallbacks diseñados, y costos documentados puede ser 🟢 SUBSTANCIA. Un "modelo propietario entrenado" sin métricas verificables es 🔴 HUMO.

### 3.2 ¿Open-source es siempre más viable que propietario?

- **Mito:** "Open source = transparencia = menor riesgo."
- **Realidad:** Un proyecto OSS con bus factor 1 y sin funding es más riesgoso que un producto comercial con SLA. Lo importante es la salud del ecosistema, no la licencia.
- **Posición del skill:** Evaluamos con los mismos criterios: maturity, community, production evidence, dependency risk. El veredicto no favorece OSS ni propietario — favorece la evidencia.

### 3.3 ¿Cuándo un PoC es suficiente para declarar viabilidad?

- **Riesgo del PoC:** Un PoC exitoso NO es producción. El gap entre PoC y producción es donde mueren las tecnologías (scaling, security, ops, cost at scale).
- **Posición del skill:** S5 (PoC Design) define kill criteria explícitos y documenta qué NO valida el PoC. Un PoC exitoso eleva de 🟠 a 🟡, nunca a 🟢. Solo producción comprobada alcanza 🟢.

### 3.4 ¿El Technology Radar y el Hype Cycle son suficientes?

- **Crítica:** Ambos tienen bias geográfico (US/EU-centric) y de tamaño de empresa. Una tecnología en "Adopt" para una Big Tech puede ser "Hold" para una PYME.
- **Posición del skill:** Los usamos como input, nunca como veredicto. El veredicto es contextual: equipo, proyecto, restricciones, timeline. El Radar informa; el análisis forense decide.

---

## 4. Casos de Éxito y Fracaso Documentados

### 4.1 Caso de Éxito: Evaluación de Kubernetes (2018-2024)
- **Contexto:** En 2018 K8s estaba en el "Peak" del Hype Cycle. Organizaciones que hicieron due diligence forense (team readiness, operational maturity, actual need) tuvieron adopción exitosa. Las que adoptaron por hype sufrieron "K8s tax" sin beneficio.
- **Relevancia:** Ejemplo de cómo el mismo tecnología puede ser 🟢 o 🟠 dependiendo del contexto.

### 4.2 Caso de Fracaso: xz-utils Backdoor (2024)
- **Contexto:** Backdoor insertado en una librería crítica mantenida por una persona. Descubierto por accidente. Afectó distribuciones Linux mayores.
- **Relevancia:** Caso emblemático de por qué el bus factor y la cadena de dependencias son evaluaciones de viabilidad, no solo de seguridad.

### 4.3 Caso de Fracaso: HashiCorp License Change (2023-2024)
- **Contexto:** HashiCorp cambió Terraform de MPL a BSL, provocando el fork OpenTofu. Organizaciones que dependían de la licencia OSS tuvieron que reevaluar viabilidad.
- **Relevancia:** El riesgo de cambio de licencia es un factor de viabilidad. Los forks no siempre son viable alternatives (community split, roadmap divergence).

---

## 5. Evolución Esperada (2026-2028)

| Tendencia | Probabilidad | Impacto en Software Viability |
|---|---|---|
| **AI model commoditization** | Alta | Claims de "IA propietaria" pierden valor; evaluación se centra en fine-tuning y datos |
| **Regulatory AI requirements (EU AI Act enforcement)** | Alta | S3 incorpora compliance check obligatorio para IA high-risk |
| **Software supply chain regulation** | Alta (EU CRA) | S4b se vuelve compliance-driven, no solo best practice |
| **Open-source funding models mature** | Media | S2b puede evaluar sostenibilidad financiera con más datos |
| **Continuous viability monitoring** | Media-Alta | El skill deja de ser puntual y se integra en governance continuo |
| **Quantum-resistant crypto assessment** | Baja (2028+) | Nueva dimensión de viabilidad para componentes criptográficos |

---

**Autor:** Javier Montaño | **Última actualización:** 13 de marzo de 2026
**© Comunidad MetodologIA — Todos los derechos reservados**

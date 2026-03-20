# State of the Art — AS-IS Technical Analysis (2024-2026)

> Tendencias, herramientas emergentes y debates abiertos en el dominio de evaluación técnica del estado actual.

---

## 1. Tendencias Dominantes

### 1.1 AI-Assisted Code Analysis
- **Qué está pasando:** Herramientas como GitHub Copilot, Amazon CodeWhisperer, y Sourcegraph Cody están siendo usadas no solo para escribir código sino para **entender código legacy**. La generación de documentación y diagramas a partir de código es cada vez más precisa.
- **Impacto en AS-IS:** El tiempo de extracción de métricas y generación de C4 diagrams se reduce significativamente. La fase de "automated extraction" del skill pasa de 2-4 horas a 30-60 minutos con asistencia AI.
- **Riesgo:** Alucinaciones en la interpretación de patrones complejos. El AI puede confundir un workaround intencional con un anti-patrón.
- **Fuentes:** GitHub (2024) "Copilot Workspace"; Sourcegraph (2025) "Cody Enterprise for Legacy Modernization"

### 1.2 Software Composition Analysis (SCA) como estándar
- **Qué está pasando:** Regulaciones como la Executive Order 14028 (US) y el Cyber Resilience Act (EU) están haciendo obligatorio el SBOM (Software Bill of Materials). Herramientas como Snyk, Dependabot, y OWASP Dependency-Check son estándar en CI/CD.
- **Impacto en AS-IS:** S7 (Security) y S1 (Technology Inventory) se benefician directamente. El SBOM proporciona un inventario automatizado de dependencias con CVEs mapeados.
- **Estado 2026:** La mayoría de empresas >500 empleados tienen SBOM en al menos algunos proyectos. El desafío es la transitividad (dependencias de dependencias).
- **Fuentes:** NIST (2024) "SBOM Minimum Elements"; EU Cyber Resilience Act (2024)

### 1.3 Platform Engineering y Developer Experience (DX)
- **Qué está pasando:** El movimiento de Platform Engineering (Gartner Top 10 Strategic Tech Trends 2024-2025) está cambiando cómo se evalúa la madurez operativa. Ya no basta con DORA metrics — se mide Developer Experience (DX) con métricas como time-to-first-commit, cognitive load, y developer satisfaction.
- **Impacto en AS-IS:** S8 (Operational Model) se expande para incluir DX metrics. Un sistema con buen DORA pero mala DX tiene problemas de retención y velocity ocultos.
- **Fuentes:** Gartner (2024) "Top Strategic Technology Trends"; Humanitec (2025) "State of Platform Engineering"

### 1.4 Architecture Decision Records (ADRs) como arqueología
- **Qué está pasando:** Los ADRs (popularizados por Michael Nygard en 2011) se están usando retroactivamente para documentar decisiones legacy. Herramientas como adr-tools y ADR Manager facilitan la creación y mantenimiento.
- **Impacto en AS-IS:** S3 (Architecture) se enriquece cuando existen ADRs previos. Cuando no existen, el AS-IS puede producirlos como output secundario ("ADRs retroactivos").
- **Fuentes:** Nygard, M. (2011) "Documenting Architecture Decisions"; ThoughtWorks (2024) Tech Radar: ADRs en "Adopt"

---

## 2. Herramientas Emergentes (2024-2026)

### 2.1 Análisis Estático y Arquitectónico

| Herramienta | Propósito | Madurez | Relevancia para AS-IS |
|---|---|---|---|
| **SonarQube/SonarCloud** | Code quality, security, duplication | Madura | S4, S7 — métricas automatizadas |
| **Semgrep** | SAST con reglas personalizables | Creciendo rápido | S7 — detección de patrones de seguridad custom |
| **Snyk** | SCA + container scanning | Madura | S1, S7 — dependency inventory + CVEs |
| **Sourcegraph** | Code search + AI understanding | Madura | S2, S3 — navegación de codebase grande |
| **ArchUnit / NetArchTest** | Architecture fitness functions | Estable | S3 — validación automatizada de reglas arquitectónicas |
| **jQAssistant** | Architecture analysis from bytecode | Nicho | S2, S3 — dependency analysis profundo |
| **CodeScene** | Behavioral code analysis (hotspots, team coupling) | Creciendo | S2, S4 — correlación de complejidad con frecuencia de cambio |
| **Stepsize / LinearB** | Engineering intelligence | Creciendo | S5 — tech debt tracking automatizado |

### 2.2 Observabilidad y Operaciones

| Herramienta | Propósito | Relevancia para AS-IS S8 |
|---|---|---|
| **OpenTelemetry** | Observability estándar (CNCF graduated) | Evaluar adopción como indicador de madurez operativa |
| **Grafana Stack** | Unified observability (Loki, Tempo, Mimir) | Dashboard operativo si disponible |
| **Datadog/New Relic** | APM comercial | Performance baselines si disponible |
| **PagerDuty/OpsGenie** | Incident management | MTTR data para S8 |

### 2.3 Seguridad

| Herramienta | Propósito | Relevancia para AS-IS S7 |
|---|---|---|
| **OWASP ZAP** | DAST open-source | Scan automatizado de vulnerabilidades web |
| **Trivy** | Container + IaC + SBOM scanning | Inventario de vulnerabilidades de infra |
| **Grype/Syft** | SBOM generation + vulnerability matching | Alternativa open-source a Snyk |
| **GitLeaks/TruffleHog** | Secret detection | Detección de credenciales en código |

---

## 3. Debates Abiertos en la Industria

### 3.1 ¿Rewrite vs Refactor vs Replace?

**El debate eterno, con nuevos matices:**
- **Pro-Rewrite (2024):** Con AI code generation, el costo de reescribir ha bajado. "Si puedo generar el 70% del código nuevo con Copilot, el business case de rewrite cambia."
- **Pro-Refactor (siempre):** Feathers (2004) sigue vigente: "Legacy code is code without tests." Agregar tests y refactorizar es más seguro.
- **Pro-Replace (SaaS era):** Para funcionalidad commodity (CRM, HRIS, billing), reemplazar con SaaS es cada vez más viable.
- **Posición del skill:** El AS-IS no toma esta decisión — la informa. S10 presenta un decision tree per-component basado en evidencia de S1-S9.

### 3.2 ¿Cuánta deuda técnica es aceptable?

- **Posición pragmática (Martin Fowler, 2024):** "Some debt is deliberate and acceptable. The problem is unmanaged debt."
- **Posición cuantitativa (SonarSource):** Tech debt ratio = remediation cost / development cost. <5% es bueno, 5-10% es aceptable, >10% es problemático.
- **Posición del skill:** Reportamos el ratio y la tendencia (creciendo/estable/disminuyendo). La decisión de cuánto es aceptable la toma el steering committee con datos.

### 3.3 ¿DORA metrics son suficientes para evaluar madurez?

- **Crítica (2024-2025):** DORA mide delivery performance pero no developer experience, code quality, o architecture health. Un equipo puede tener DORA "Elite" con código frágil.
- **Extensiones propuestas:** SPACE framework (Forsgren et al., 2021), DX Core 4 (dx.tips), Engineering Intelligence (LinearB).
- **Posición del skill:** DORA en S8 como baseline. Si hay datos adicionales, incorporamos SPACE dimensions. Nunca presentamos DORA como "la" métrica de madurez.

### 3.4 ¿La complejidad ciclomática sigue siendo relevante?

- **Crítica:** McCabe (1976) fue diseñada para código procedural. En código funcional o declarativo, CC puede ser engañosa.
- **Alternativas:** Cognitive Complexity (SonarSource) — mide lo difícil que es entender el código, no solo la cantidad de paths.
- **Posición del skill:** Reportamos CC como métrica establecida + Cognitive Complexity como complemento cuando la herramienta lo soporta.

---

## 4. Casos de Éxito Documentados

### 4.1 Spotify — Autonomous Squads y Technical Health Assessment
- **Contexto:** Spotify desarrolló un "Tech Health Check" trimestral donde cada squad evalúa 11 dimensiones de salud técnica.
- **Relevancia:** Modelo de auto-evaluación que complementa el AS-IS externo. Nuestro skill produce la evaluación inicial; el modelo Spotify lo hace sostenible.
- **Fuente:** Kniberg, H. & Ivarsson, A. (2012). "Scaling Agile @ Spotify"; actualizado en Spotify Engineering Blog (2024).

### 4.2 UK Government Digital Service — Legacy Assessment Framework
- **Contexto:** GDS desarrolló un framework para evaluar sistemas legacy del gobierno UK con criterios de riesgo, costo de mantenimiento, y criticidad de negocio.
- **Relevancia:** Enfoque pragmático para organizaciones grandes con cientos de sistemas. Categorización en "sustain/replace/retire" similar a nuestro S10.
- **Fuente:** UK GDS (2023). "Managing legacy technology".

### 4.3 ThoughtWorks Technology Radar — Continuous Assessment
- **Contexto:** ThoughtWorks publica un Technology Radar semestral que clasifica tecnologías en Adopt/Trial/Assess/Hold.
- **Relevancia:** El S1 (Technology Inventory) usa la misma taxonomía para clasificar dependencias. "Hold" = deprecated/EOL en nuestro contexto.
- **Fuente:** ThoughtWorks (2025). *Technology Radar Vol. 31*.

---

## 5. Evolución Esperada (2026-2028)

| Tendencia | Probabilidad | Impacto en AS-IS |
|---|---|---|
| **AI generates C4 diagrams from code** | Alta | S3 se automatiza casi completamente |
| **Continuous Architecture Assessment** | Media-Alta | El AS-IS deja de ser puntual y se vuelve continuo (integrado en CI/CD) |
| **SBOM obligatorio en regulación** | Alta (EU ya lo exige) | S7 se simplifica pero S1 se expande |
| **Developer Experience como KPI** | Media | S8 se expande con métricas de DX |
| **eBPF-based runtime analysis** | Media | S6/S8 pueden incluir datos runtime sin instrumentación |
| **Quantum-readiness assessment** | Baja (2028+) | Nueva sección para crypto assessment post-quantum |

---

**Autor:** Javier Montaño | **Última actualización:** 12 de marzo de 2026
**© Comunidad MetodologIA — Todos los derechos reservados**

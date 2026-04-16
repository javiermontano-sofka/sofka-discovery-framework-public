# Body of Knowledge — DevSecOps Architecture

> Fuentes academicas, industriales y practicas que fundamentan el diseno de pipelines DevSecOps: CI/CD, shift-left security, supply chain integrity, release management, DORA metrics, y compliance automation.

---

## 1. Fundamentos de DevOps y Continuous Delivery

### Continuous Delivery — Jez Humble & David Farley (Addison-Wesley, 2010)

- **Relevancia:** Texto fundacional de continuous delivery. Define el deployment pipeline, la importancia de artefactos inmutables, y el principio de que "every commit is a release candidate". Todo el skill se basa en estos principios.
- **Conceptos clave:** Deployment pipeline (commit -> acceptance -> production), feedback loops, configuration as code, reproducible builds, blue-green deployments.
- **Uso en el skill:** S1 (CI/CD Pipeline Architecture) implementa el deployment pipeline de Humble & Farley con integracion de seguridad en cada stage.
- **Fuente:** Humble, J. & Farley, D. (2010). *Continuous Delivery: Reliable Software Releases through Build, Test, and Deployment Automation*. Addison-Wesley.

### Accelerate — Forsgren, Humble & Kim (IT Revolution, 2018)

- **Relevancia:** Investigacion empirica que establece las DORA metrics (Deployment Frequency, Lead Time, Change Failure Rate, MTTR) como indicadores de rendimiento de entrega de software y su correlacion con rendimiento organizacional.
- **Uso en el skill:** S5 (Pipeline Observability) se fundamenta completamente en DORA metrics como North Star. Los targets del skill (deploy on-demand, lead time <1h, CFR <15%, MTTR <1h) provienen de la clasificacion "Elite" de Accelerate.
- **Fuente:** Forsgren, N., Humble, J., & Kim, G. (2018). *Accelerate: The Science of Lean Software and DevOps*. IT Revolution.
- **Complemento:** DORA (2024). *State of DevOps Report*. dora.dev

### The DevOps Handbook — Kim, Humble, Debois & Willis (IT Revolution, 2nd Ed, 2021)

- **Relevancia:** Guia practica que operacionaliza los principios de DevOps: flow (pipeline efficiency), feedback (monitoring, testing), continual learning (post-mortems, experiments). La segunda edicion agrega capitulos sobre security integration.
- **Uso en el skill:** Los "Three Ways" de DevOps (flow, feedback, learning) informan el diseno del pipeline. El capitulo de security integration fundamenta la filosofia de shift-left del skill.
- **Fuente:** Kim, G., Humble, J., Debois, P., & Willis, J. (2021). *The DevOps Handbook*, 2nd Ed. IT Revolution.

---

## 2. Application Security en el Pipeline

### OWASP DevSecOps Guideline

- **Relevancia:** Guia de OWASP para integrar seguridad en el pipeline de CI/CD. Mapea herramientas de seguridad (SAST, DAST, SCA, secrets scanning, IaC scanning) a etapas del pipeline con recomendaciones de implementacion.
- **Uso en el skill:** S2 (Shift-Left Security) sigue la estructura de OWASP para definir que herramienta va en que stage del pipeline y cuales son los criterios de gate.
- **Fuente:** OWASP (2024). *OWASP DevSecOps Guideline*. owasp.org/www-project-devsecops-guideline

### OWASP Top 10 (2021)

- **Relevancia:** Lista de las 10 vulnerabilidades mas criticas en aplicaciones web. Las herramientas de SAST/DAST del pipeline se configuran para detectar estas categorias como prioridad.
- **Uso en el skill:** S2 configura SAST rules y DAST scans para cubrir OWASP Top 10 como baseline. Los security gates bloquean merge en findings criticos alineados con esta lista.
- **Fuente:** OWASP (2021). *OWASP Top 10:2021*. owasp.org/Top10

### NIST SP 800-218 — Secure Software Development Framework (SSDF)

- **Relevancia:** Framework del NIST para desarrollo seguro de software. Define 4 practicas fundamentales: Prepare the Organization, Protect the Software, Produce Well-Secured Software, Respond to Vulnerabilities. Alinea con la Executive Order 14028.
- **Uso en el skill:** SSDF informa la estructura general del skill. Las 4 practicas mapean a: S7 (risk matrix = Prepare), S2/S3 (shift-left + supply chain = Protect/Produce), S6 (compliance = Respond).
- **Fuente:** NIST (2022). *SP 800-218: Secure Software Development Framework v1.1*.

---

## 3. Supply Chain Security

### SLSA Framework (Supply-chain Levels for Software Artifacts)

- **Relevancia:** Framework de Google/OpenSSF para integridad de la cadena de suministro de software. Define niveles de seguridad incrementales para el proceso de build.
- **Niveles:** Level 1 (provenance exists), Level 2 (hosted build), Level 3 (hardened builds, non-falsifiable provenance).
- **Uso en el skill:** S3 (Supply Chain Security) selecciona el nivel SLSA apropiado. Level 1 es el minimo recomendado para todo proyecto; Level 3 para sistemas regulados o de alta seguridad.
- **Fuente:** Google / OpenSSF (2024). *SLSA v1.0*. slsa.dev

### Sigstore Project (cosign, Rekor, Fulcio)

- **Relevancia:** Ecosistema de firma y verificacion de artefactos de software. cosign firma imagenes de contenedores, Rekor es un transparency log inmutable, Fulcio emite certificados efimeros vinculados a identidad OIDC.
- **Uso en el skill:** S3 recomienda Sigstore como mecanismo de firma de artefactos. La integracion con CI (GitHub Actions, GitLab CI) es nativa y elimina la necesidad de gestionar claves de firma.
- **Fuente:** Sigstore (2024). *Sigstore: A New Standard for Signing, Verifying and Protecting Software*. sigstore.dev; CNCF graduated project (2024).

### CycloneDX y SPDX — Formatos de SBOM

- **Relevancia:** Los dos formatos estandar para Software Bill of Materials. CycloneDX (OWASP, security-focused, soporte VEX) y SPDX (Linux Foundation, ISO 5962:2021, license-focused).
- **Uso en el skill:** S3 recomienda CycloneDX para pipelines de seguridad (VEX support) y SPDX cuando compliance de licencias es prioridad. Generacion con Syft, analisis con Dependency-Track.
- **Fuentes:** OWASP (2024). *CycloneDX v1.6*. cyclonedx.org; Linux Foundation (2021). *SPDX v2.3 — ISO/IEC 5962:2021*.

---

## 4. Deployment Strategies y Release Engineering

### Release Engineering — Google SRE Book, Chapter 8

- **Relevancia:** Define los principios de release engineering usados en Google: builds hermeticos, cherry picks, branchless release, canary analysis. Fundamenta S4 (Release Management).
- **Uso en el skill:** S4 aplica los principios de release engineering: artefactos inmutables, promocion de entornos (no rebuild), y canary analysis automatizado.
- **Fuente:** Beyer, B. et al. (2016). *Site Reliability Engineering*. Chapter 8: Release Engineering. O'Reilly.

### Feature Flags Best Practices

- **Relevancia:** Feature flags desacoplan deployment de release, permitiendo dark launches, canary releases, y kill switches. Pero mal gestionados crean deuda tecnica (flags obsoletos, combinatorial explosion).
- **Uso en el skill:** S4 disena la estrategia de feature flags con lifecycle management (create -> test -> rollout -> cleanup) y flag retirement policies.
- **Fuentes:** LaunchDarkly (2024). *Feature Flags Best Practices*; Pete Hodgson (2017). *Feature Toggles (Feature Flags)*. martinfowler.com

### Deployment Strategies — Blue-Green, Canary, Rolling

- **Relevancia:** Las tres estrategias principales de deployment tienen trade-offs diferentes en costo, complejidad, y velocidad de rollback.
- **Blue-Green:** Zero downtime, instant rollback, pero 2x infraestructura.
- **Canary:** Risk reduction via gradual traffic shift, pero mas lento y requiere monitoring sofisticado.
- **Rolling:** No double capacity, pero mixed versions temporalmente y rollback mas complejo.
- **Uso en el skill:** S4 selecciona la estrategia basada en criticidad del servicio, tolerancia a riesgo, y presupuesto.
- **Fuente:** Humble, J. & Farley, D. (2010). *Continuous Delivery*. Chapter 10.

---

## 5. Pipeline Security Tools

### SAST (Static Application Security Testing)

- **Herramientas principales:** SonarQube (lider de mercado, 30+ lenguajes), Semgrep (lightweight, custom rules, bajo false-positive rate), Checkmarx (enterprise), CodeQL (GitHub native, query-based).
- **Uso en el skill:** S2 integra SAST en commit stage. Gate: block merge en findings critical/high.
- **Fuentes:** SonarSource (2024). *SonarQube*; r2c (2024). *Semgrep*; GitHub (2024). *CodeQL*.

### SCA (Software Composition Analysis)

- **Herramientas principales:** Snyk (developer-first, fix suggestions), Dependabot (GitHub native), Trivy (OSS, broad scope), FOSSA (license compliance).
- **Uso en el skill:** S2 integra SCA en build stage. Vulnerability SLA: critical <24h, high <7d, medium <30d.
- **Fuentes:** Snyk (2024). *Snyk Open Source*; Aqua Security (2024). *Trivy*.

### DAST (Dynamic Application Security Testing)

- **Herramientas principales:** OWASP ZAP (OSS, baseline scan para CI), Burp Suite (commercial, deeper analysis), Nuclei (fast, template-based).
- **Uso en el skill:** S2 integra DAST en acceptance stage (staging environment). Solo critical paths para mantener velocidad.
- **Fuentes:** OWASP (2024). *OWASP ZAP*; PortSwigger (2024). *Burp Suite*.

### Secrets Scanning

- **Herramientas principales:** GitGuardian (enterprise, real-time), TruffleHog (OSS, high-entropy detection), git-secrets (lightweight pre-commit hook), GitHub Secret Scanning (native).
- **Uso en el skill:** S2 integra secrets scanning como pre-commit hook y post-commit audit. Gate: block + rotate exposed credentials.
- **Fuentes:** GitGuardian (2024). *GitGuardian*; trufflesecurity (2024). *TruffleHog*.

---

## 6. Compliance Automation

### Open Policy Agent (OPA)

- **Relevancia:** Motor de policy-as-code de proposito general. Rego como lenguaje declarativo para policies. CNCF graduated. Se usa para admission control en K8s, API authorization, y infrastructure policy enforcement.
- **Uso en el skill:** S6 (Compliance Automation) usa OPA para definir y enforcer policies en tiempo de build, deploy, y runtime.
- **Fuente:** CNCF (2024). *Open Policy Agent*. openpolicyagent.org

### HashiCorp Sentinel

- **Relevancia:** Framework de policy-as-code especifico para el ecosistema HashiCorp (Terraform Cloud/Enterprise, Vault, Consul). Permite enforcer policies sobre planes de Terraform antes de apply.
- **Uso en el skill:** S6 usa Sentinel cuando el IaC pipeline usa Terraform Cloud/Enterprise.
- **Fuente:** HashiCorp (2024). *Sentinel*. hashicorp.com/sentinel

### Kyverno

- **Relevancia:** Policy engine nativo de Kubernetes que usa YAML (no Rego). Mas accesible que OPA/Gatekeeper para equipos con expertise K8s pero sin experiencia en Rego.
- **Uso en el skill:** S6 recomienda Kyverno como alternativa a OPA/Gatekeeper cuando la audiencia es K8s-focused y prefiere YAML.
- **Fuente:** Kyverno (2024). *Kyverno: Kubernetes Native Policy Management*. kyverno.io; CNCF incubating.

---

## 7. Bibliografia Practica

| Categoria | Libro/Recurso | Autor | Relevancia |
|---|---|---|---|
| Fundacional | *Continuous Delivery* | Humble & Farley (2010) | Pipeline design, deployment automation |
| Fundacional | *Accelerate* | Forsgren, Humble & Kim (2018) | DORA metrics, DevOps research empirica |
| DevSecOps | *Securing DevOps* | Julien Vehent (2018) | Security en CI/CD pipelines |
| DevSecOps | *The DevSecOps Playbook* | Sean D. Mack (2023) | Guia practica de integracion DevSecOps |
| Supply Chain | *Software Supply Chain Security* | Cassie Crossley (2024) | SBOM, SLSA, dependency management |
| Avanzado | *Site Reliability Engineering* | Beyer et al. (2016) | Release engineering, SLOs, incident response |
| Avanzado | *Team Topologies* | Skelton & Pais (2019) | Platform teams, stream-aligned teams |
| Practico | *The Phoenix Project* | Kim, Behr & Spafford (2013) | Cultura DevOps narrativa |
| Metricas | *State of DevOps Report* | DORA/Google (anual) | Benchmarks actualizados de DORA metrics |

---

## 8. Glosario de Terminos

| Termino | Definicion |
|---|---|
| **CI/CD** | Continuous Integration / Continuous Delivery — automatizacion del build, test, y deployment de software |
| **Shift-Left** | Mover actividades de seguridad y calidad hacia etapas tempranas del ciclo de desarrollo |
| **SAST** | Static Application Security Testing — analisis de codigo fuente sin ejecutarlo para encontrar vulnerabilidades |
| **DAST** | Dynamic Application Security Testing — analisis de aplicacion en ejecucion para encontrar vulnerabilidades |
| **SCA** | Software Composition Analysis — analisis de dependencias de terceros para CVEs y licencias |
| **SBOM** | Software Bill of Materials — inventario completo de componentes de software con versiones |
| **SLSA** | Supply-chain Levels for Software Artifacts — framework de niveles de seguridad para build systems |
| **DORA Metrics** | Deployment Frequency, Lead Time for Changes, Change Failure Rate, MTTR — metricas de rendimiento de entrega |
| **Blue-Green** | Estrategia de deployment con dos entornos identicos que alternan como produccion |
| **Canary** | Estrategia de deployment con rollout gradual de trafico al nuevo release |
| **Feature Flag** | Toggle que permite habilitar/deshabilitar funcionalidades en runtime sin redeploy |
| **Policy-as-Code** | Definir politicas de compliance y seguridad como codigo versionado y evaluable automaticamente |
| **OPA** | Open Policy Agent — motor de policy-as-code de proposito general (CNCF graduated) |
| **Artifact Signing** | Firmar digitalmente artefactos de build para garantizar integridad y provenance |
| **IaC Scanning** | Analisis de codigo de Infrastructure as Code para detectar misconfiguraciones de seguridad |
| **Secrets Scanning** | Deteccion de credenciales expuestas en codigo fuente o configuracion |
| **VEX** | Vulnerability Exploitability eXchange — formato para comunicar si una vulnerabilidad es explotable en contexto |

---

**Autor:** Javier Montano | **Ultima actualizacion:** 13 de marzo de 2026
**© Comunidad MetodologIA — Todos los derechos reservados**

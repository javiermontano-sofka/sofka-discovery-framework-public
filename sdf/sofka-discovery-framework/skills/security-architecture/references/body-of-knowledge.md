# Body of Knowledge — Security Architecture

> Fuentes academicas, industriales y practicas que fundamentan el diseno de arquitectura de seguridad: threat modeling, zero trust, identity & access management, data protection, application security, y compliance.

---

## 1. Frameworks de Ciberseguridad

### NIST Cybersecurity Framework 2.0 (CSF 2.0)

- **Relevancia:** Marco de referencia primario para organizacion de controles de seguridad. La version 2.0 (febrero 2024) agrega la funcion Govern como sexto pilar, reconociendo que la gobernanza de ciberseguridad es prerequisito para las demas funciones.
- **Funciones:** Govern, Identify, Protect, Detect, Respond, Recover — mapean directamente a las 6 secciones del skill.
- **Uso en el skill:** S1 (Threat Modeling) se alinea con Identify; S2 (Zero Trust) con Protect; S6 (Compliance) con Govern. Cada control recomendado referencia su categoria CSF.
- **Fuente:** NIST (2024). *NIST Cybersecurity Framework 2.0*. nist.gov/cyberframework

### NIST SP 800-207 — Zero Trust Architecture

- **Relevancia:** Documento fundacional que define Zero Trust Architecture (ZTA). Establece los principios de "never trust, always verify", micro-segmentacion, y verificacion continua que el skill implementa en S2.
- **Conceptos clave:** Policy Decision Point (PDP), Policy Enforcement Point (PEP), trust algorithm, subject/resource access model.
- **Uso en el skill:** S2 (Zero Trust Architecture) se fundamenta completamente en SP 800-207. El modelo de madurez Crawl/Walk/Run operacionaliza la guia de implementacion del NIST.
- **Fuente:** Rose, S., Borchert, O., Mitchell, S., Connelly, S. (2020). *NIST SP 800-207: Zero Trust Architecture*.
- **Complemento:** NIST SP 1800-35 (2023). *Implementing a Zero Trust Architecture* — guia practica de implementacion.

### ISO/IEC 27001:2022 — Information Security Management Systems

- **Relevancia:** Estandar internacional para sistemas de gestion de seguridad de la informacion (SGSI). Annex A define 93 controles organizados en 4 categorias (Organizational, People, Physical, Technological) — revision significativa desde la version 2013 que tenia 114 controles en 14 dominios.
- **Uso en el skill:** S6 (Compliance & Audit) mapea controles de la skill contra Annex A. Las categorias A.5-A.8 informan las decisiones de S3 (IAM) y S4 (Data Protection).
- **Fuente:** ISO/IEC (2022). *ISO/IEC 27001:2022 — Information security, cybersecurity and privacy protection*.

### ISO/IEC 27005:2022 — Information Security Risk Management

- **Relevancia:** Guia para gestion de riesgos de seguridad de la informacion. Define el proceso de risk assessment (identification, analysis, evaluation) y risk treatment que fundamenta S1 (Threat Modeling).
- **Uso en el skill:** La matriz de riesgo likelihood x impact (5x5) y el proceso de risk scoring del skill siguen la metodologia de ISO 27005.
- **Fuente:** ISO/IEC (2022). *ISO/IEC 27005:2022 — Guidance on managing information security risks*.

---

## 2. Threat Modeling

### Threat Modeling: Designing for Security — Adam Shostack (Wiley, 2014)

- **Relevancia:** Texto fundacional de threat modeling moderno. Define STRIDE como metodologia por excelencia para modelado de amenazas en el contexto de desarrollo de software. Shostack fue lider de threat modeling en Microsoft donde STRIDE se origino.
- **Conceptos clave:** STRIDE per-element, Data Flow Diagrams (DFD), trust boundaries, attack trees, elevation of privilege card game.
- **Uso en el skill:** S1 (Threat Modeling) se basa directamente en el proceso de Shostack: DFD -> identificar trust boundaries -> enumerar amenazas STRIDE -> scoring -> mitigation mapping.
- **Fuente:** Shostack, A. (2014). *Threat Modeling: Designing for Security*. Wiley.

### PASTA (Process for Attack Simulation and Threat Analysis)

- **Relevancia:** Metodologia de threat modeling risk-centric en 7 etapas que alinea amenazas con objetivos de negocio. Complementa STRIDE al proveer un enfoque mas estructurado para organizaciones que necesitan vincular seguridad a riesgo de negocio.
- **Etapas:** (1) Definir objetivos de negocio, (2) Definir scope tecnico, (3) Descomponer aplicacion, (4) Analisis de amenazas, (5) Analisis de vulnerabilidades, (6) Modelado de ataques, (7) Analisis de riesgo e impacto.
- **Uso en el skill:** S1 ofrece PASTA como alternativa a STRIDE cuando el cliente requiere alineacion con riesgo de negocio.
- **Fuente:** UcedaVelez, T. & Morana, M. (2015). *Risk Centric Threat Modeling: Process for Attack Simulation and Threat Analysis*. Wiley.

### MITRE ATT&CK Framework

- **Relevancia:** Base de conocimiento global de tacticas y tecnicas adversarias basadas en observaciones reales. 14 tacticas y >200 tecnicas para enterprise, con matrices especificas para cloud, mobile, y containers.
- **Uso en el skill:** S1 usa ATT&CK para validar que el threat model cubre tecnicas reales, no solo amenazas teoricas. Los attacker profiles del skill mapean a tacticas ATT&CK.
- **Fuente:** MITRE (2024). *ATT&CK Enterprise Matrix v14*. attack.mitre.org

---

## 3. Zero Trust y Arquitectura de Identidad

### Zero Trust Networks — Gilman & Barth (O'Reilly, 2017)

- **Relevancia:** Texto fundacional que formaliza Zero Trust como paradigma de seguridad de red. Define los principios de autenticacion mutua, cifrado end-to-end, y autorizacion granular que el skill aplica.
- **Conceptos clave:** El modelo de confianza por ubicacion de red esta roto. Cada flujo de red debe autenticarse, autorizarse, y cifrarse independientemente de su origen.
- **Uso en el skill:** S2 (Zero Trust Architecture) implementa los principios de Gilman & Barth con patrones modernos (service mesh, mTLS, SPIFFE).
- **Fuente:** Gilman, E. & Barth, D. (2017). *Zero Trust Networks: Building Secure Systems in Untrusted Networks*. O'Reilly.

### SPIFFE/SPIRE — Workload Identity Standard

- **Relevancia:** SPIFFE (Secure Production Identity Framework for Everyone) es el estandar CNCF para identidad de workloads. SPIRE es su implementacion de referencia. Resuelve el problema de "como identifica un servicio a otro servicio sin secrets estaticos".
- **Uso en el skill:** S3 (IAM) recomienda SPIFFE/SPIRE para workload identity, eliminando la necesidad de secrets de larga duracion para comunicacion S2S.
- **Fuente:** CNCF (2024). *SPIFFE: Secure Production Identity Framework for Everyone*. spiffe.io
- **Complemento:** SPIFFE & SPIRE graduated project en CNCF (2022).

### OAuth 2.0 y OIDC — RFC 6749, RFC 7519 (JWT), OpenID Connect Core

- **Relevancia:** Estandares fundacionales para autorizacion (OAuth 2.0) y autenticacion (OIDC) que toda arquitectura de seguridad moderna implementa. JWT (RFC 7519) es el formato de token dominante para APIs.
- **Uso en el skill:** S3 (IAM) diseña flujos de autenticacion/autorizacion basados en OAuth 2.0 + OIDC. Las decisiones de JWT vs. opaque tokens se fundamentan en estos estandares.
- **Fuentes:** Hardt, D. (2012). RFC 6749 — OAuth 2.0. Jones, M. et al. (2015). RFC 7519 — JWT. OpenID Foundation (2014). *OpenID Connect Core 1.0*.

---

## 4. Application Security y Supply Chain

### OWASP Top 10 (2021) y OWASP Application Security Verification Standard (ASVS)

- **Relevancia:** El OWASP Top 10 es la referencia mas citada para vulnerabilidades de aplicaciones web. ASVS provee 286 requisitos de verificacion organizados en 3 niveles de seguridad.
- **Uso en el skill:** S5 (Application Security) usa OWASP Top 10 como baseline para SAST/DAST y ASVS como framework de requisitos para security champions.
- **Fuente:** OWASP (2021). *OWASP Top 10*. owasp.org/Top10; OWASP (2023). *ASVS v4.0.3*.

### SLSA Framework (Supply-chain Levels for Software Artifacts)

- **Relevancia:** Framework de Google para integridad de la cadena de suministro de software. Define 4 niveles de seguridad para el proceso de build, desde documentacion basica hasta builds hermeticos con provenance no falsificable.
- **Uso en el skill:** S5 selecciona el nivel SLSA apropiado segun el riesgo del sistema. Level 1 (provenance) es el minimo recomendado; Level 3 para sistemas regulados.
- **Fuente:** Google / OpenSSF (2024). *SLSA: Supply-chain Levels for Software Artifacts v1.0*. slsa.dev

### Sigstore (cosign, Rekor, Fulcio)

- **Relevancia:** Proyecto de firma y verificacion de artefactos de software sin gestion de claves manual. cosign para firma de imagenes, Rekor como transparency log, Fulcio para emision de certificados efimeros.
- **Uso en el skill:** S5 recomienda Sigstore/cosign como mecanismo de firma de artefactos y SBOM, integrando con los niveles SLSA.
- **Fuente:** Sigstore (2024). *Sigstore Project*. sigstore.dev; CNCF graduated project.

---

## 5. Data Protection y Criptografia

### NIST SP 800-57 — Recommendation for Key Management

- **Relevancia:** Guia definitiva para gestion de claves criptograficas. Define key hierarchy, lifecycle management, y periodos de validez para diferentes tipos de claves.
- **Uso en el skill:** S4 (Data Protection) sigue las recomendaciones de SP 800-57 para jerarquia de claves (master key -> DEKs), rotacion, y destruccion.
- **Fuente:** Barker, E. (2020). *NIST SP 800-57 Part 1 Rev. 5: Recommendation for Key Management*.

### PCI DSS v4.0 — Payment Card Industry Data Security Standard

- **Relevancia:** Estandar mandatorio para organizaciones que procesan datos de tarjetas de pago. La version 4.0 (marzo 2022, obligatoria abril 2025) introduce requisitos mas flexibles pero tambien mas estrictos en MFA, encripcion, y monitoreo continuo.
- **Uso en el skill:** S6 (Compliance) mapea controles PCI-DSS a implementaciones tecnicas. S4 (Data Protection) aplica requisitos especificos de cifrado (Req 3-4) y S3 (IAM) aplica requisitos de acceso (Req 7-8).
- **Fuente:** PCI SSC (2022). *PCI DSS v4.0*. pcisecuritystandards.org

---

## 6. Compliance y Auditoria

### SOC 2 — Trust Services Criteria (AICPA)

- **Relevancia:** Framework de auditoria para proveedores de servicios basado en cinco Trust Services Criteria: Security, Availability, Processing Integrity, Confidentiality, Privacy. SOC 2 Type II requiere evidencia de operacion continua durante un periodo (tipicamente 6-12 meses).
- **Uso en el skill:** S6 mapea controles CC (Common Criteria) de SOC 2 contra implementaciones tecnicas. CC6 (Logical & Physical Access Controls) es el mas relevante para este skill.
- **Fuente:** AICPA (2022). *SOC 2 — Trust Services Criteria*. aicpa.org

### CIS Controls v8

- **Relevancia:** 18 controles prioritizados de seguridad (anteriormente 20 en v7) organizados en Implementation Groups (IG1, IG2, IG3). IG1 (essential cyber hygiene) define los 56 safeguards minimos que toda organizacion debe implementar.
- **Uso en el skill:** Los CIS Controls v8 informan la priorizacion de controles en organizaciones que no tienen un framework regulatorio especifico. IG1 como piso minimo.
- **Fuente:** CIS (2021). *CIS Controls v8*. cisecurity.org/controls

### GDPR — General Data Protection Regulation (EU)

- **Relevancia:** Regulacion europea de proteccion de datos personales. Articulo 32 requiere medidas tecnicas y organizativas apropiadas (encryption, pseudonymization, resilience). Articulo 25 requiere data protection by design and by default.
- **Uso en el skill:** S4 (Data Protection) implementa privacy by design. S6 mapea derechos del sujeto (Art 15-22) a capacidades tecnicas (data export, deletion, portability).
- **Fuente:** European Parliament (2016). *Regulation (EU) 2016/679 — GDPR*. eur-lex.europa.eu

---

## 7. Bibliografia Practica

| Categoria | Libro/Recurso | Autor | Relevancia |
|---|---|---|---|
| Fundacional | *Security Engineering*, 3rd Ed | Ross Anderson (2020) | Principios generales de ingenieria de seguridad |
| Fundacional | *Cryptography Engineering* | Ferguson, Schneier, Kohno (2010) | Fundamentos de criptografia aplicada |
| Avanzado | *Identity and Data Security for Web Development* | LeBlanc & Messerschmidt (2016) | IAM patterns para aplicaciones web |
| Avanzado | *Practical Cloud Security* | Chris Dotson (2019) | Seguridad cloud para practitioners |
| Practico | *Building Secure & Reliable Systems* | Adkins, Beyer, Blankinship et al. (2020) | Interseccion de SRE y seguridad, Google |
| Practico | *Securing DevOps* | Julien Vehent (2018) | Security en CI/CD pipelines |
| Metricas | *Security Metrics* | Jaquith (2007) | Medicion de postura de seguridad |
| Compliance | *The CISO Handbook* | Stamper et al. (2023) | Gestion estrategica de seguridad |

---

## 8. Glosario de Terminos

| Termino | Definicion |
|---|---|
| **Zero Trust** | Modelo de seguridad que no asume confianza implicita en ningun actor, sistema, red o servicio; todo acceso se autentica y autoriza explicitamente |
| **STRIDE** | Metodologia de threat modeling: Spoofing, Tampering, Repudiation, Information Disclosure, Denial of Service, Elevation of Privilege |
| **PASTA** | Process for Attack Simulation and Threat Analysis — metodologia risk-centric de threat modeling en 7 etapas |
| **DFD** | Data Flow Diagram — diagrama que muestra procesos, almacenes de datos, flujos de datos, entidades externas y trust boundaries |
| **mTLS** | Mutual TLS — autenticacion TLS bidireccional donde ambas partes presentan certificados |
| **RBAC** | Role-Based Access Control — autorizacion basada en roles asignados a usuarios |
| **ABAC** | Attribute-Based Access Control — autorizacion basada en atributos del sujeto, recurso, accion y contexto |
| **ReBAC** | Relationship-Based Access Control — autorizacion basada en relaciones entre entidades (modelo Google Zanzibar) |
| **SPIFFE** | Secure Production Identity Framework for Everyone — estandar para identidad de workloads |
| **SBOM** | Software Bill of Materials — inventario de componentes de software con versiones y dependencias |
| **SLSA** | Supply-chain Levels for Software Artifacts — framework de niveles de seguridad para build systems |
| **SAST** | Static Application Security Testing — analisis de codigo fuente sin ejecutarlo |
| **DAST** | Dynamic Application Security Testing — analisis de aplicacion en ejecucion |
| **SCA** | Software Composition Analysis — analisis de dependencias de terceros para CVEs y licencias |
| **WAF** | Web Application Firewall — filtro que protege aplicaciones web de ataques comunes |
| **KMS/HSM** | Key Management Service / Hardware Security Module — servicios para gestion y almacenamiento seguro de claves criptograficas |

---

**Autor:** Javier Montano | **Ultima actualizacion:** 13 de marzo de 2026
**© Comunidad MetodologIA — Todos los derechos reservados**

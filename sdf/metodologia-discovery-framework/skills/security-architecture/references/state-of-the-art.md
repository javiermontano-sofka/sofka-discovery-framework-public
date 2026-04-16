# State of the Art — Security Architecture (2024-2026)

> Tendencias, herramientas emergentes y debates abiertos en el dominio de arquitectura de seguridad: zero trust, threat modeling, identity, data protection, application security, y compliance automation.

---

## 1. Tendencias Dominantes

### 1.1 Zero Trust como Estandar de Facto (No Opcional)

- **Que esta pasando:** Zero Trust ha dejado de ser una aspiracion para convertirse en mandato. El Executive Order 14028 (mayo 2021) de EE.UU. requirio Zero Trust en agencias federales. CISA publico su Zero Trust Maturity Model v2.0 (2023). En 2026, >60% de organizaciones enterprise tienen algun programa de Zero Trust, y Gartner predice que el 10% habra implementado Zero Trust maduro para 2027.
- **Impacto en el skill:** S2 (Zero Trust Architecture) pasa de "opcion avanzada" a "baseline". El modelo de madurez Crawl/Walk/Run se convierte en roadmap obligatorio. La integracion con service mesh (Istio, Linkerd) y SPIFFE/SPIRE es critica.
- **Evidencia:** CISA (2023) "Zero Trust Maturity Model v2.0"; Forrester (2024) "Zero Trust Edge: The State of Zero Trust"; Gartner (2025) "Predicts: Zero Trust Will Become Default Security Posture".
- **Tipo de evidencia:** [DOC] reportes de industria, [DOC] mandato regulatorio EO 14028.

### 1.2 AI en Seguridad — Doble Filo (Ataque y Defensa)

- **Que esta pasando:** La inteligencia artificial transforma tanto el ataque como la defensa. Ofensivamente: phishing generado por LLMs indistinguible de comunicacion legitima, malware polimorfico, automated vulnerability exploitation. Defensivamente: deteccion de anomalias con ML, analisis de logs a escala, automated threat hunting, y security copilots (Microsoft Security Copilot, Google Gemini in Security Operations).
- **Impacto en el skill:** S1 (Threat Modeling) debe incluir amenazas AI-powered como parte de los attacker profiles. S5 (Application Security) necesita evaluar herramientas AI-assisted para SAST/DAST. S2 (Zero Trust) se beneficia de risk-based authentication con ML que evalua comportamiento en tiempo real.
- **Evidencia:** NIST AI RMF (2023) "Artificial Intelligence Risk Management Framework"; Microsoft (2025) "Security Copilot: AI for Defenders"; WEF (2024) "Global Cybersecurity Outlook" — 56% de lideres creen que AI dara ventaja a los atacantes.
- **Tipo de evidencia:** [DOC] framework NIST, [DOC] reporte WEF, [INFERENCIA] basada en tendencia de mercado.

### 1.3 Identity-First Security (Identidad como Nuevo Perimetro)

- **Que esta pasando:** El 80% de breaches involucra credenciales comprometidas o robadas (Verizon DBIR 2024). La industria converge hacia identity-first security: identity como plano de control de seguridad, no la red. Passkeys (WebAuthn/FIDO2) estan reemplazando passwords en plataformas consumer y enterprise. Microsoft, Google y Apple soportan passkeys desde 2023.
- **Impacto en el skill:** S3 (IAM) se convierte en la seccion mas critica del skill. El diseno de identity architecture (IdP selection, federation, passwordless authentication) es la decision de mayor impacto en la postura de seguridad. SPIFFE/SPIRE para workload identity elimina el problema de secrets estaticos para S2S communication.
- **Evidencia:** Verizon (2024) "Data Breach Investigations Report"; FIDO Alliance (2025) "Passkeys Adoption Report" — >2 billion passkey-enabled accounts; Gartner (2025) "Identity-First Security Is the Foundation of Zero Trust".
- **Tipo de evidencia:** [DOC] DBIR datos empiricos, [DOC] reporte FIDO Alliance.

### 1.4 Compliance Automation y Continuous Compliance

- **Que esta pasando:** El compliance manual (screenshots, spreadsheets, evidencia puntual) esta siendo reemplazado por compliance-as-code y continuous compliance monitoring. Herramientas como Vanta, Drata, y Anecdotes automatizan la recoleccion de evidencia para SOC 2, ISO 27001, PCI-DSS, HIPAA. OPA (Open Policy Agent) y Cloud Custodian permiten policy-as-code que se evalua continuamente.
- **Impacto en el skill:** S6 (Compliance & Audit) evoluciona de "mapear controles una vez" a "compliance continuo con monitoring automatizado". Las herramientas de GRC (Governance, Risk, Compliance) se integran con el pipeline de DevSecOps.
- **Evidencia:** OPA CNCF graduated (2024); Vanta (2025) "$200M ARR, 7,000+ customers"; Drata (2024) "SOC 2 compliance in <30 days with automation"; EU Cyber Resilience Act (2024) mandara SBOMs y compliance automatizado.
- **Tipo de evidencia:** [DOC] estado de proyectos CNCF, [DOC] regulacion EU CRA.

### 1.5 Post-Quantum Cryptography (Preparacion para la Era Cuantica)

- **Que esta pasando:** NIST finalizo los primeros estandares de criptografia post-quantum en agosto 2024: ML-KEM (Kyber), ML-DSA (Dilithium), SLH-DSA (SPHINCS+). La amenaza de "harvest now, decrypt later" (capturar datos cifrados hoy para descifrarlos cuando existan computadoras cuanticas) motiva la migracion temprana. NSA exige migracion a CNSA Suite 2.0 para sistemas de seguridad nacional antes de 2033.
- **Impacto en el skill:** S4 (Data Protection) debe considerar crypto-agility: la capacidad de cambiar algoritmos criptograficos sin rediseno fundamental. Para datos con lifetime >10 anos, la migracion a PQC debe planificarse ahora. TLS 1.3 con hybrid key exchange (clasico + PQC) ya disponible en AWS, Google, Cloudflare.
- **Evidencia:** NIST (2024) "FIPS 203/204/205: Post-Quantum Cryptographic Standards"; NSA (2022) "CNSA Suite 2.0"; Cloudflare (2024) "Post-Quantum TLS is Now Default".
- **Tipo de evidencia:** [DOC] estandares NIST finalizados, [DOC] mandato NSA.

---

## 2. Herramientas Emergentes (2024-2026)

### 2.1 Identity & Access Management

| Herramienta | Proposito | Madurez | Relevancia para el skill |
|---|---|---|---|
| **Passkeys (WebAuthn/FIDO2)** | Passwordless authentication | Madura | S3 — reemplazo de passwords para usuarios finales |
| **SPIFFE/SPIRE** | Workload identity standard | Madura (CNCF graduated) | S3 — identidad para servicios sin secrets estaticos |
| **Ory (Kratos, Hydra, Keto)** | Open-source IAM stack | Creciendo | S3 — alternativa OSS a Auth0/Okta |
| **OpenFGA** | Authorization engine (Zanzibar) | Creciendo (CNCF sandbox) | S3 — ReBAC para autorizacion compleja |
| **Cerbos** | Policy-as-code authorization | Creciendo | S3 — ABAC/RBAC declarativo con GitOps |

### 2.2 Application Security & Supply Chain

| Herramienta | Proposito | Madurez | Relevancia para el skill |
|---|---|---|---|
| **Semgrep** | SAST con reglas custom | Madura | S5 — SAST ligero, bajo false-positive rate |
| **Sigstore (cosign, Rekor)** | Artifact signing sin gestion de claves | Madura (CNCF graduated) | S5 — firma de imagenes y SBOMs |
| **Dependency-Track** | SBOM analysis & vulnerability tracking | Madura (OWASP) | S5 — ingestion y analisis de SBOMs |
| **Guac (Graph for Understanding Artifact Composition)** | Supply chain graph analysis | Creciendo (OpenSSF) | S5 — visualizacion de dependencias |
| **Endor Labs** | SCA con context-aware analysis | Creciendo | S5 — reduce noise de SCA con reachability analysis |

### 2.3 Detection, Response & Compliance

| Herramienta | Proposito | Madurez | Relevancia para el skill |
|---|---|---|---|
| **Microsoft Security Copilot** | AI-assisted security operations | Creciendo | Acelerador de incident response |
| **Wiz** | Cloud security posture management (CSPM) | Madura | Visibilidad de seguridad cloud end-to-end |
| **Vanta / Drata** | Automated compliance evidence | Madura | S6 — compliance automation SOC2/ISO27001 |
| **OPA (Open Policy Agent)** | Policy-as-code engine | Madura (CNCF graduated) | S6 — policy enforcement unificado |
| **Falco** | Runtime threat detection (K8s) | Madura (CNCF graduated) | Deteccion de comportamiento anomalo en runtime |

---

## 3. Debates Abiertos en la Industria

### 3.1 Zero Trust: Producto vs. Filosofia

- **Debate:** Vendors venden "Zero Trust Solutions" como productos. Analistas argumentan que Zero Trust es una filosofia de diseno, no un producto comprable.
- **Pro-producto:** "Necesito herramientas que implementen ZT: ZTNA, microsegmentacion, identity-aware proxy. Sin productos, ZT es teoria."
- **Pro-filosofia:** "Comprar un 'Zero Trust firewall' no te da Zero Trust. Es una transformacion de como piensas sobre trust en tu arquitectura."
- **Realidad 2026:** La verdad esta en el medio. ZT es una filosofia implementada con herramientas, pero ninguna herramienta individual "da" Zero Trust. Se necesita: identity platform + microsegmentation + policy engine + monitoring + cultural shift.
- **Posicion del skill:** Zero Trust es filosofia primero, herramientas despues. El skill disena la arquitectura ZT y luego selecciona herramientas. El modelo de madurez Crawl/Walk/Run provee la hoja de ruta.

### 3.2 Centralized vs. Federated Security

- **Debate:** Equipos centrales de seguridad de 5-10 personas no escalan a organizaciones de 500+ developers. Pero federar seguridad a equipos de desarrollo (Security Champions) diluye expertise.
- **Pro-centralizado:** "La seguridad requiere expertise profundo. Generalistas cometen errores."
- **Pro-federado:** "10 personas no pueden revisar todo el codigo de 50 equipos. Necesitas champions distribuidos."
- **Posicion del skill:** Modelo hibrido. Equipo central define politicas, herramientas y frameworks. Security Champions (1 por equipo, 10-20% del tiempo) ejecutan first-pass reviews. Central escala via automation (SAST/DAST/SCA automatizado), no via headcount.

### 3.3 SBOM: Mandato Regulatorio o Carga Administrativa

- **Debate:** El EU Cyber Resilience Act (2027) y la Executive Order 14028 de EE.UU. mandatan SBOMs. Pero generar, mantener, y consumir SBOMs a escala es un desafio operativo.
- **A favor:** "No puedes asegurar lo que no conoces. SBOM es prerequisito para gestion de vulnerabilidades."
- **En contra:** "Generar SBOMs es facil. Consumirlos y actuar sobre ellos a escala es el problema real."
- **Posicion del skill:** SBOM es mandatorio. El skill recomienda generacion automatizada (Syft en CI), formato CycloneDX para AppSec y SPDX para legal, y Dependency-Track para analisis. El valor esta en la cadena completa: generar -> analizar -> alertar -> remediar.

---

## 4. Casos de Exito Documentados

### 4.1 Google BeyondCorp — Zero Trust a Escala Enterprise

- **Contexto:** Google implemento BeyondCorp (2014-2018), eliminando la VPN corporativa y moviendo todos los accesos a un modelo identity-centric. 100,000+ empleados acceden a recursos corporativos desde cualquier red, autenticados y autorizados por request.
- **Relevancia:** Referencia para S2 (Zero Trust). Demuestra que ZT a escala enterprise es viable pero requiere multiples anos de inversion.
- **Fuente:** Google (2014) "BeyondCorp: A New Approach to Enterprise Security"; Google (2024) "BeyondCorp Enterprise".

### 4.2 Mercado Libre — Security Champions a Escala LATAM

- **Contexto:** Mercado Libre implemento un programa de Security Champions con >200 champions distribuidos en equipos de desarrollo. Los champions realizan threat modeling de primer nivel, triaje de SAST findings, y capacitacion interna.
- **Relevancia:** Referencia para S5 (Security Champions Program) con contexto LATAM relevante para clientes MetodologIA. Demuestra que el modelo hibrido (central + champions) funciona a escala.
- **Fuente:** Mercado Libre Engineering Blog (2024); AppSec Village (2024) case study.

### 4.3 Capital One — Compliance Automation en Banca

- **Contexto:** Capital One automatizo compliance para PCI-DSS e ISO 27001 con policy-as-code (OPA) y evidence collection automatizada. Redujo el tiempo de preparacion de auditorias de meses a semanas.
- **Relevancia:** Referencia para S6 (Compliance Automation) en industria altamente regulada.
- **Fuente:** Capital One Tech Blog (2024); AWS re:Invent case study.

---

## 5. Evolucion Esperada (2026-2028)

| Tendencia | Probabilidad | Impacto en el skill |
|---|---|---|
| **Post-quantum TLS mainstream** | Alta | S4 agrega PQC como requisito de cifrado para datos sensibles |
| **AI-powered threat modeling** | Media-Alta | S1 acelera con AI pero requiere validacion humana |
| **Passkeys reemplazan passwords** | Alta | S3 passwordless como default, no como opcion |
| **SBOM mandatorio globalmente** | Alta | S5 SBOM pasa de recomendado a obligatorio |
| **Confidential computing mainstream** | Media | S4 agrega enclaves para datos ultra-sensibles |
| **Identity mesh (decentralized identity)** | Baja-Media | S3 podria agregar DID/Verifiable Credentials |
| **Automated compliance-as-code universal** | Media-Alta | S6 policy-as-code como unico modo de compliance |
| **Security AI agents autonomos** | Baja-Media (2028+) | Incident response parcialmente automatizado |

---

**Autor:** Javier Montano | **Ultima actualizacion:** 13 de marzo de 2026
**© Comunidad MetodologIA — Todos los derechos reservados**

# Use Case Prompts — Security Architecture

> Prompts listos para usar en los casos de uso mas frecuentes de esta skill.
> Cada prompt incluye contexto de cuando usarlo y parametros variables.

---

## 1. Threat Modeling para Sistema Nuevo o Existente

**Cuando:** Inicio de proyecto, pre-lanzamiento, o revision de seguridad periodica de un sistema.

```
Realizar threat modeling para {SISTEMA} usando {METODOLOGIA} (STRIDE | PASTA).

Contexto:
- Tipo de sistema: {TIPO} (ej: API REST, aplicacion web, microservicios, mobile backend, SaaS multi-tenant)
- Stack tecnologico: {STACK} (ej: Node.js, Spring Boot, React, PostgreSQL, Redis, Kafka)
- Usuarios estimados: {USUARIOS}
- Datos sensibles: {DATOS} (ej: PII, datos financieros, PHI, tarjetas de pago)
- Integraciones externas: {INTEGRACIONES} (ej: payment gateway, IdP externo, APIs de terceros)
- Ambiente de deploy: {AMBIENTE} (ej: AWS EKS, Azure AKS, on-premises)

Entregar:
1. Data Flow Diagram (DFD) con trust boundaries identificadas
2. Enumeracion de amenazas por componente (STRIDE categories)
3. Attack surface analysis: entry points, admin interfaces, data stores
4. Risk scoring: matriz likelihood x impact (5x5) con priorizacion
5. Attacker profiles: external anonymous, authenticated user, insider, supply chain
6. Mitigation mapping: threat -> control -> implementacion
7. Residual risk register: amenazas aceptadas con justificacion

Parametros:
- {MODO}: supervisado (confirmar threat model antes de mitigaciones)
- {FORMATO}: markdown
- {MODO_OPERACIONAL}: modelado-amenazas

Entregar S1 (Threat Modeling) completo con diagramas Mermaid.
```

---

## 2. Zero Trust Architecture Assessment y Roadmap

**Cuando:** La organizacion quiere evaluar su postura actual de Zero Trust y definir un roadmap de implementacion.

```
Evaluar madurez de Zero Trust y disenar roadmap para {ORGANIZACION}.

Contexto:
- Estado actual de autenticacion: {AUTENTICACION} (ej: AD con VPN, SSO parcial, sin MFA)
- Network segmentation: {SEGMENTACION} (ej: flat network, VLANs basicas, micro-segmentacion parcial)
- Service-to-service auth: {S2S_AUTH} (ej: API keys estaticas, mTLS parcial, sin autenticacion)
- Monitoring/detection: {MONITORING} (ej: SIEM basico, sin behavioral analytics)
- Num de servicios/aplicaciones: {NUM_SERVICIOS}
- Equipos de desarrollo: {NUM_EQUIPOS}
- Regulaciones: {REGULACIONES} (ej: PCI-DSS, HIPAA, SOC 2, ninguna especifica)

Evaluar y disenar:
1. Zero Trust Maturity Assessment contra CISA ZT Maturity Model v2.0
   - Identity: MFA coverage, passwordless readiness, conditional access
   - Devices: device trust, posture assessment, managed vs BYOD
   - Network: micro-segmentation, mTLS, service mesh readiness
   - Applications: per-app access policies, ZTNA readiness
   - Data: data classification, encryption coverage, DLP
2. Gap analysis: estado actual vs target por pilar
3. Roadmap phased: Crawl (0-6 meses) -> Walk (6-18 meses) -> Run (18-36 meses)
4. Quick wins implementables en <30 dias
5. Technology recommendations: IdP, service mesh, ZTNA, monitoring

Parametros:
- {MODO}: piloto-auto
- {FORMATO}: markdown
- {VARIANTE}: tecnica

Entregar S2 (Zero Trust Architecture) con maturity assessment y roadmap.
```

---

## 3. IAM Architecture Design

**Cuando:** Disenar o redisenar la arquitectura de identidad y acceso para un sistema o plataforma.

```
Disenar arquitectura de IAM para {SISTEMA} / {PLATAFORMA}.

Contexto:
- Tipos de usuario: {TIPOS_USUARIO} (ej: empleados, clientes B2C, partners B2B, service accounts)
- Volumen de usuarios: {VOLUMEN} por tipo
- IdP actual: {IDP_ACTUAL} (ej: Active Directory, Okta, Auth0, Cognito, ninguno)
- Requisitos de MFA: {MFA_REQ} (ej: mandatorio para todos, solo admins, regulatorio)
- Multi-tenancy: {MULTI_TENANT} (si/no, nivel de aislamiento requerido)
- Service-to-service: {NUM_SERVICIOS} servicios que se comunican entre si
- Compliance: {COMPLIANCE} (ej: SOC 2, PCI-DSS, HIPAA requieren controles especificos de acceso)

Disenar:
1. Authentication strategy: OAuth 2.0 flows por tipo de cliente, passwordless roadmap
2. Authorization model selection: RBAC vs ABAC vs ReBAC con justificacion
3. Token strategy: JWT vs opaque, lifetime, refresh, revocation
4. Service identity: SPIFFE/SPIRE, mTLS, workload identity federation
5. Secret management: Vault/Secrets Manager, rotation policies, zero static secrets
6. Session management: SSO, session lifetime, step-up authentication
7. Federation: external IdP integration, SAML/OIDC federation design

Parametros:
- {MODO}: piloto-auto
- {FORMATO}: markdown

Entregar S3 (Identity & Access Management) completo.
Incluir S2 (identity-centric Zero Trust) como seccion complementaria.
```

---

## 4. Compliance Framework Mapping y Gap Analysis

**Cuando:** Preparacion para certificacion (SOC 2, ISO 27001, PCI-DSS) o cuando multiples frameworks regulatorios aplican.

```
Mapear frameworks de compliance y realizar gap analysis para {ORGANIZACION}.

Contexto:
- Frameworks requeridos: {FRAMEWORKS} (ej: SOC 2 Type II, ISO 27001, PCI-DSS 4.0, HIPAA, GDPR)
- Estado actual de compliance: {ESTADO} (ej: ninguna certificacion, SOC 2 Type I existente, en proceso)
- Controles de seguridad existentes: {CONTROLES_EXISTENTES} (ej: MFA parcial, cifrado en transito, logs centralizados)
- Herramientas de seguridad actuales: {HERRAMIENTAS} (ej: SIEM, vulnerability scanner, WAF)
- Timeline de certificacion: {TIMELINE} (ej: SOC 2 en 6 meses, ISO 27001 en 12 meses)
- Equipo de compliance/seguridad: {EQUIPO} personas dedicadas

Entregar:
1. Compliance Framework Mapping Table: control area -> requisito por framework
2. Control matrix: framework requirement -> technical control -> evidence source -> testing frequency -> owner
3. Gap analysis: controles implementados vs requeridos, priorizados por riesgo
4. Evidence collection plan: que evidencia, de donde, frecuencia, automatizable (si/no)
5. Continuous compliance design: policy-as-code (OPA), automated monitoring, drift alerts
6. Tooling recommendations: GRC platform, evidence automation, compliance dashboard
7. Audit readiness checklist: pre-audit steps, evidence repository, control owner training

Parametros:
- {MODO}: supervisado (confirmar scope de frameworks antes de mapear)
- {FORMATO}: markdown
- {MODO_OPERACIONAL}: cumplimiento

Entregar S6 (Compliance & Audit) como seccion principal.
Incluir gap remediation roadmap con quick wins y strategic items.
```

---

## 5. Security Review de Aplicacion Existente

**Cuando:** Evaluacion de seguridad pre-lanzamiento, post-incidente, o revision periodica de una aplicacion en produccion.

```
Realizar security review de {APLICACION}.

Contexto:
- Tipo de aplicacion: {TIPO} (ej: SaaS web app, API REST, mobile app, internal tool)
- Stack: {STACK}
- Ambiente: {AMBIENTE} (ej: AWS, Azure, GCP, on-premises)
- Ultimo security review: {ULTIMO_REVIEW} (ej: nunca, hace 6 meses, hace 2 anos)
- Incidentes previos: {INCIDENTES} (ej: ninguno, breach de datos, DDoS)
- Pipeline de CI/CD existente: {PIPELINE} (ej: GitHub Actions, Jenkins, GitLab CI)
- Security tools actuales: {SECURITY_TOOLS} (ej: ninguno, SonarQube, Snyk)

Evaluar:
1. Threat model review: DFD actualizado, nuevas amenazas desde ultimo review
2. Authentication & authorization audit: flujos de auth, token management, privilege escalation risks
3. Data protection review: encryption at rest/in transit, key management, data classification
4. Application security pipeline: SAST/DAST/SCA coverage, vulnerability SLAs, SBOM status
5. Supply chain security: dependency age, known CVEs, SLSA level, artifact signing
6. Infrastructure security: network segmentation, WAF, DDoS protection, logging
7. Secrets management: rotation status, long-lived credentials, exposed secrets

Priorizar findings:
- CRITICAL: explotable remotamente, datos sensibles en riesgo
- HIGH: requiere remediacion en <7 dias
- MEDIUM: remediacion en <30 dias
- LOW: mejora recomendada, sin urgencia

Parametros:
- {MODO}: piloto-auto
- {FORMATO}: markdown
- {VARIANTE}: tecnica

Entregar las 6 secciones como security review completo.
Incluir plan de remediacion priorizado con owners y timelines.
```

---

## 6. Data Protection Strategy Design

**Cuando:** Disenar la estrategia de proteccion de datos para un sistema que maneja datos sensibles (PII, PHI, financieros).

```
Disenar estrategia de proteccion de datos para {SISTEMA}.

Contexto:
- Tipos de datos sensibles: {TIPOS_DATOS} (ej: PII, PHI, datos financieros, tarjetas de pago)
- Volumen de datos: {VOLUMEN} (ej: <1TB, 1-10TB, >10TB)
- Jurisdicciones: {JURISDICCIONES} (ej: LATAM, EU/GDPR, US/CCPA, multi-jurisdiccion)
- Data stores: {DATA_STORES} (ej: PostgreSQL, DynamoDB, S3, Elasticsearch)
- Requisitos de retencion: {RETENCION} (ej: 1 ano, 7 anos, indefinido)
- Environments con acceso a datos: {ENVIRONMENTS} (ej: prod, staging con data masking, dev con datos sinteticos)
- Cloud provider: {CLOUD_PROVIDER}

Disenar:
1. Data classification scheme: Restricted / Confidential / Internal / Public con criterios
2. Encryption strategy: at rest (AES-256, TDE), in transit (TLS 1.3), key hierarchy (master -> DEKs)
3. Key management: Cloud KMS vs HSM, key rotation schedules, customer-managed keys decision
4. Tokenization & masking: PCI-DSS scope reduction, dynamic masking para non-prod
5. Data lifecycle: creation -> storage -> processing -> sharing -> archival -> destruction
6. Access controls: data-level access policies, column-level security, row-level filtering
7. Privacy by design: data minimization, pseudonymization, right to erasure/portability
8. Crypto-agility: preparacion para post-quantum cryptography

Parametros:
- {MODO}: piloto-auto
- {FORMATO}: markdown

Entregar S4 (Data Protection) como seccion principal.
Incluir S6 (compliance mapping de regulaciones de datos) como complemento.
```

---

## 7. Security Champions Program Design

**Cuando:** Escalar seguridad en una organizacion con multiples equipos de desarrollo sin crecer el equipo central de seguridad linealmente.

```
Disenar programa de Security Champions para {ORGANIZACION}.

Contexto:
- Num de equipos de desarrollo: {NUM_EQUIPOS}
- Tamano promedio de equipo: {TAMANO_EQUIPO} personas
- Equipo central de seguridad: {NUM_SECURITY} personas
- Madurez de seguridad actual: {MADUREZ} (baja / media / alta)
- Security tools en uso: {TOOLS} (ej: SAST, SCA, DAST, ninguno)
- Cultura actual hacia seguridad: {CULTURA} (ej: "seguridad es problema del equipo de seguridad" / "todos somos responsables")

Disenar:
1. Champion selection criteria: perfil tecnico, motivacion, influencia en el equipo
2. Time allocation: 10-20% del tiempo del champion dedicado a seguridad
3. Training program: OWASP Top 10 (8h), threat modeling basics (16h), secure coding (16h), quarterly refreshers (8h)
4. Responsibilities: first-pass threat models, SAST triage, security PR review, security awareness
5. Escalation paths: champion -> central security -> external consultants
6. Metrics: champion engagement, SAST findings resolved, threat models completed, training completion
7. Tooling support: security scanning integrado en IDE y CI, runbooks, templates
8. Recognition: security champion of the quarter, career path, conference sponsorship

Parametros:
- {MODO}: desatendido
- {FORMATO}: markdown

Entregar S5 (Application Security — Security Champions subsection) expandido.
```

---

**Autor:** Javier Montano | **Ultima actualizacion:** 13 de marzo de 2026
**© Comunidad MetodologIA — Todos los derechos reservados**

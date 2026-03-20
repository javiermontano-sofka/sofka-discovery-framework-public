# Metaprompts — Security Architecture

> Estrategias de meta-nivel para maximizar la efectividad de esta skill.
> Los metaprompts no producen entregables — optimizan COMO se producen.

---

## 1. Adversarial Thinking (Pensamiento Adversarial)

**Proposito:** Antes de finalizar cualquier diseno de seguridad, recorrer sistematicamente los vectores de ataque desde la perspectiva de diferentes atacantes para validar que las defensas cubren escenarios reales.

```
Para cada componente critico del diseno de seguridad, aplica este analisis adversarial:

PERFIL 1 — Atacante externo no autenticado:
- Que endpoints estan expuestos a internet?
- Puede enumerar usuarios, APIs, o funcionalidades?
- Los rate limits previenen brute force y credential stuffing?
- El WAF bloquea OWASP Top 10 attacks?
- Puede explotar errores de configuracion (S3 publico, debug endpoints)?

PERFIL 2 — Usuario autenticado malicioso:
- Puede escalar privilegios (IDOR, privilege escalation)?
- Puede acceder a datos de otros usuarios/tenants?
- Puede manipular tokens (JWT tampering, session fixation)?
- Los logs capturan acciones para repudiacion?
- Los controles de autorizacion se validan en backend, no solo frontend?

PERFIL 3 — Insider malicioso (empleado/contractor):
- Tiene acceso a secretos de produccion?
- Los accesos privilegiados requieren MFA y approval workflows?
- Los logs de acceso son inmutables (no puede borrar sus huellas)?
- El principio de least privilege limita blast radius?
- Hay segregation of duties para acciones criticas?

PERFIL 4 — Supply chain compromise:
- Las dependencias estan pinned a versiones especificas?
- Hay verificacion de integridad (checksums, firmas)?
- El build system es inmutable y auditado?
- Los container base images son de fuentes confiables y escaneados?
- Existe SBOM y se monitorean CVEs en dependencias?

PERFIL 5 — State-sponsored / APT:
- Hay deteccion de movimiento lateral?
- Los datos en reposo usan customer-managed keys?
- Hay preparacion para post-quantum cryptography?
- El threat model incluye "harvest now, decrypt later"?
- Existe un programa de threat intelligence?

Para cada perfil:
- Escenario de ataque mas probable
- Control que lo mitiga
- Control que FALTA (gap)
- Si el gap es blocker (datos sensibles en riesgo) o aceptable (riesgo residual documentado)

Si algun perfil tiene un gap critico sin plan de mitigacion, es un blocker del diseno.
```

---

## 2. Defense-in-Depth Validation (Validacion de Defensa en Profundidad)

**Proposito:** Verificar que el diseno de seguridad implementa multiples capas de defensa independientes, de modo que el fallo de una capa no compromete todo el sistema.

```
Para cada activo critico (datos sensibles, funcionalidades de alto valor), valida capas de defensa:

ACTIVO: {nombre del activo, ej: "base de datos de PII de clientes"}

CAPA 1 — Perimetro (network boundary):
- Firewall/WAF bloquea trafico malicioso?
- DDoS protection activa?
- Solo puertos necesarios expuestos?
- Si esta capa falla: que protege al activo?

CAPA 2 — Autenticacion (identity verification):
- MFA requerido para acceso?
- Tokens de corta duracion con refresh?
- Deteccion de credenciales comprometidas?
- Si esta capa falla: que protege al activo?

CAPA 3 — Autorizacion (access control):
- Least privilege enforced?
- Modelo RBAC/ABAC/ReBAC implementado?
- Autorizacion validada en cada request (no solo sesion)?
- Si esta capa falla: que protege al activo?

CAPA 4 — Cifrado (data protection):
- Datos cifrados at rest Y in transit?
- Keys en KMS/HSM, no en codigo?
- Key rotation automatica?
- Si esta capa falla: que protege al activo?

CAPA 5 — Monitoreo (detection):
- Accesos al activo son logged y auditados?
- Alertas configuradas para acceso anomalo?
- Logs inmutables y retenidos?
- Si esta capa falla: que protege al activo?

VALIDACION FINAL:
- Para cada activo, hay minimo 3 capas independientes?
- Si cualquier capa individual falla, el activo sigue protegido por al menos 2 capas?
- Las capas son independientes (no dependen de la misma credencial, misma clave, mismo servicio)?

Si un activo critico depende de una sola capa de defensa, el diseno tiene un single point of failure de seguridad.
```

---

## 3. Compliance-Driven Architecture (Arquitectura Guiada por Compliance)

**Proposito:** Cuando multiples frameworks regulatorios aplican, disenar la arquitectura con compliance como constraint primario, no como retrofit.

```
Antes de disenar la arquitectura de seguridad, mapea los requisitos regulatorios:

PASO 1 — Identificar frameworks aplicables:
- SOC 2: servicio cloud para clientes?
- ISO 27001: certificacion internacional requerida?
- PCI-DSS 4.0: datos de tarjetas de pago?
- HIPAA: datos de salud (PHI)?
- GDPR: datos personales de ciudadanos EU?
- Regulaciones locales (ej: Ley Habeas Data Colombia)?
- Ninguna: documentar explicitamente

PASO 2 — Mapear requisitos a secciones del skill:
| Framework | S1 Threats | S2 Zero Trust | S3 IAM | S4 Data Protection | S5 AppSec | S6 Compliance |
|---|---|---|---|---|---|---|
| SOC 2 | Risk assessment requerido | Network segmentation | MFA, access reviews | Encryption at rest/transit | Change management | Evidence continua |
| PCI-DSS 4.0 | Threat model para CDE | Segmentacion de CDE | MFA mandatorio, Req 7-8 | Cifrado de PAN, CMK | SAST/DAST mandatorio | Audit trail, QSA anual |
| HIPAA | Risk analysis (164.308) | BAA con providers | Access controls auditados | PHI cifrado | Security testing | Breach notification |
| GDPR | DPIA para alto riesgo | Data minimization | Consent management | Right to erasure | Privacy by design | DPO, registros Art 30 |

PASO 3 — Identificar controles overlapping:
- Que controles satisfacen MULTIPLES frameworks simultaneamente?
- (ej: MFA satisface SOC 2 CC6.1, PCI-DSS Req 8.3, HIPAA 164.312(d))
- Implementar estos controles PRIMERO — maximo ROI de compliance

PASO 4 — Disenar controles ANTES de la arquitectura:
- Encryption es default-on, no opt-in
- Audit logging inmutable desde day 1
- IAM least privilege desde el inicio
- Data classification antes de disenar storage

REGLA: Si una decision de diseno NO cumple un requisito regulatorio aplicable, es un BLOCKER.
No se puede "arreglar despues" — compliance-by-design o redesign.
```

---

## 4. Security Maturity Assessment (Evaluacion de Madurez de Seguridad)

**Proposito:** Evaluar el estado actual de seguridad de la organizacion antes de disenar la arquitectura target, para asegurar que las recomendaciones son realistas y alcanzables.

```
Evaluar la madurez de seguridad de la organizacion en 6 dimensiones:

DIMENSION 1 — Threat Intelligence:
- Nivel 1 (Reactivo): No hay threat modeling. Seguridad reactiva a incidentes.
- Nivel 2 (Basico): Threat models ad-hoc para proyectos criticos.
- Nivel 3 (Integrado): Threat modeling es parte del ciclo de desarrollo.
- Nivel 4 (Avanzado): Threat intelligence continua, ATT&CK mapping, red team exercises.
Estado actual: ___  Target realista (12 meses): ___

DIMENSION 2 — Identity & Access:
- Nivel 1: Passwords sin MFA. Accesos compartidos.
- Nivel 2: MFA para admins. SSO parcial. API keys de larga duracion.
- Nivel 3: MFA everywhere. SSO completo. Rotation automatica.
- Nivel 4: Passwordless. SPIFFE/SPIRE. Just-in-time access. Behavioral analytics.
Estado actual: ___  Target realista (12 meses): ___

DIMENSION 3 — Data Protection:
- Nivel 1: Sin cifrado at rest. TLS parcial.
- Nivel 2: TLS everywhere. Cifrado at rest para datos sensibles.
- Nivel 3: Data classification implementada. KMS. Rotation. Masking en non-prod.
- Nivel 4: Customer-managed keys. Tokenization. PQC readiness. DLP activo.
Estado actual: ___  Target realista (12 meses): ___

DIMENSION 4 — Application Security:
- Nivel 1: Sin testing de seguridad automatizado.
- Nivel 2: SAST basico en CI. SCA reactivo.
- Nivel 3: SAST+SCA+DAST integrados. Security gates. Vulnerability SLAs.
- Nivel 4: Security champions. SLSA Level 2+. SBOM completo. RASP.
Estado actual: ___  Target realista (12 meses): ___

DIMENSION 5 — Network & Zero Trust:
- Nivel 1: Flat network. Perimetro es la defensa.
- Nivel 2: VLANs/subnets. VPN para acceso remoto.
- Nivel 3: Micro-segmentation. mTLS para S2S criticos. ZTNA parcial.
- Nivel 4: Full Zero Trust. Service mesh. Continuous verification. No VPN.
Estado actual: ___  Target realista (12 meses): ___

DIMENSION 6 — Compliance & Governance:
- Nivel 1: Sin framework de compliance. Audit manual.
- Nivel 2: Un framework implementado (ej: SOC 2). Evidence manual.
- Nivel 3: Multi-framework. Evidence collection parcialmente automatizada.
- Nivel 4: Continuous compliance. Policy-as-code. GRC platform. Automated reporting.
Estado actual: ___  Target realista (12 meses): ___

REGLAS del assessment:
- Target debe ser maximo +1 nivel por dimension en 12 meses (saltar niveles no es sostenible)
- Si estado actual es Nivel 1 en cualquier dimension critica, es el primer foco de remediacion
- El nivel mas bajo define el "weakest link" — la cadena es tan fuerte como su eslabon mas debil
- Documentar PORQUE el nivel actual es ese (no adivinar — buscar evidencia [CODIGO], [CONFIG], [DOC])
```

---

## 5. Incident Response Readiness (Preparacion para Respuesta a Incidentes)

**Proposito:** Validar que el diseno de seguridad no solo previene ataques sino que esta preparado para detectar, responder, y recuperarse cuando un ataque tenga exito.

```
Para el diseno de seguridad propuesto, validar readiness de incident response:

DETECCION (NIST CSF: Detect):
- Hay logging centralizado e inmutable?
- Los logs cubren: accesos, cambios de configuracion, acciones privilegiadas?
- Hay alertas configuradas para: brute force, privilege escalation, data exfiltration?
- El MTDL (Mean Time to Detect Lateral movement) estimado es?
- Hay correlation de eventos entre multiples fuentes?

CONTENCION (NIST CSF: Respond):
- Se puede aislar un servicio comprometido sin downtime total?
- Se pueden revocar credenciales comprometidas en <15 minutos?
- Hay kill switches para funcionalidades criticas?
- El blast radius de un compromiso esta acotado (micro-segmentacion)?
- Se puede bloquear una IP/rango rapidamente?

ERRADICACION:
- Se puede re-deploy desde un artifact limpio y verificado?
- Los secrets se pueden rotar en bloque (<1 hora)?
- Se puede identificar el root cause con los logs disponibles?
- Hay forensic readiness (logs suficientes para investigacion)?

RECUPERACION (NIST CSF: Recover):
- Los backups son inmutables (no pueden ser comprometidos por el atacante)?
- El restore ha sido probado en los ultimos 90 dias?
- El RTO de recuperacion post-incident es conocido y aceptable?
- Hay comunicacion definida: quien notificar, cuando, que decir?

POST-INCIDENT:
- Existe proceso de blameless post-mortem?
- Los findings de incidents se incorporan al threat model?
- Hay metricas: MTTD, MTTR, incidents por categoria, recurrencia?

VALIDACION:
- Para cada fase (detect, contain, eradicate, recover), hay al menos 1 control implementado?
- El equipo ha practicado el plan de IR (tabletop exercise) en los ultimos 6 meses?
- Si no hay plan de IR, es un gap critico que debe remediarse ANTES de produccion
```

---

**Autor:** Javier Montano | **Ultima actualizacion:** 13 de marzo de 2026
**© Comunidad MetodologIA — Todos los derechos reservados**

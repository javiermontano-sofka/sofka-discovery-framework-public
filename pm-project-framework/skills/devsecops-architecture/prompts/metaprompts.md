# Metaprompts — DevSecOps Architecture

> Estrategias de meta-nivel para maximizar la efectividad de esta skill.
> Los metaprompts no producen entregables — optimizan COMO se producen.

---

## 1. Pipeline Security Audit (Auditoria de Seguridad del Pipeline)

**Proposito:** Antes de finalizar cualquier diseno de pipeline, recorrer sistematicamente cada stage para validar que no existen brechas de seguridad en el proceso de build y deployment.

```
Para cada stage del pipeline, aplica este analisis de seguridad:

STAGE: COMMIT
- Secrets scan activo? (pre-commit hook + CI check)
- SAST ejecutando con reglas actualizadas?
- Pueden los developers bypassear los checks? (force push, skip CI)
- Los resultados de scan son visibles al developer en el PR?
- Hay rate limiting para proteger runners de abuse?

STAGE: BUILD
- Las dependencias se descargan de registries verificados?
- Container base images son de lista aprobada?
- SCA verifica CVEs Y licencias?
- El artefacto se firma despues de build?
- El SBOM se genera y adjunta al artefacto?
- El build environment es inmutable (no reutilizado entre builds)?
- Los build logs se retienen para auditoria?

STAGE: TEST/ACCEPTANCE
- DAST ejecuta contra staging, no produccion?
- Los tests de integracion usan datos sinteticos, no datos reales?
- Las credenciales de staging se rotan regularmente?
- Los resultados de security scans se almacenan para compliance?

STAGE: DEPLOY
- Hay verificacion de firma antes de deploy?
- El approval workflow es risk-based (no mismo para todo)?
- Los secrets se inyectan en runtime, no en build time?
- El rollback es automatico si health checks fallan?
- Post-deploy smoke tests validan funcionalidad critica?

CROSS-CUTTING:
- Los CI/CD secrets (tokens, service accounts) tienen minimo privilegio?
- Los runners/agents estan aislados (no comparten red con produccion)?
- El acceso al pipeline configuration requiere aprobacion?
- Los logs del pipeline son inmutables y retenidos?
- Hay alertas para pipeline failures inusuales (posible tampering)?

Para cada gap encontrado:
- Severidad: CRITICO (explotable, datos en riesgo) / ALTO / MEDIO / BAJO
- Esfuerzo de remediacion: <1 dia / <1 semana / <1 mes
- Quick win? (si/no)

Si hay gaps CRITICOS, son blocker para desplegar a produccion.
```

---

## 2. Developer Experience vs. Security Trade-off (Trade-off DX vs. Seguridad)

**Proposito:** Para cada security gate propuesto, evaluar el impacto en developer experience y encontrar el equilibrio optimo entre seguridad y velocidad de desarrollo.

```
Para cada security gate en el pipeline, documenta el trade-off:

GATE: {nombre del gate, ej: "SAST block on critical findings"}

IMPACTO EN SEGURIDAD:
- Que amenaza mitiga: {descripcion}
- Probabilidad de la amenaza sin el gate: {baja/media/alta}
- Impacto si la amenaza se materializa: {bajo/medio/alto/catastrofico}
- Reduccion de riesgo: {porcentaje estimado}

IMPACTO EN DEVELOPER EXPERIENCE:
- Tiempo adicional por PR: {minutos}
- False positive rate estimado: {porcentaje}
- Frequency de bloqueo de PRs: {porcentaje}
- Overhead de investigacion por finding: {minutos promedio}
- Developer frustration level: {bajo/medio/alto}

OPTIMIZACIONES POSIBLES:
- Puede reducirse el false positive rate? {como}
- Puede ejecutarse en paralelo con otros checks? {si/no}
- Puede ser async (scan post-merge, notify, no block)? {riesgo de hacerlo}
- Puede aplicarse solo a archivos changed (incremental)? {si/no}
- Hay auto-fix disponible? {herramienta}

DECISION:
- [ ] BLOCK: bloquear merge en finding (seguridad > velocidad)
- [ ] WARN: notificar sin bloquear (velocidad > seguridad, riesgo aceptado)
- [ ] INFORM: dashboard only (awareness sin friccion)
- [ ] SKIP: no implementar este gate (no justificado para este contexto)

REGLAS:
- Critical findings SIEMPRE block (no negociable)
- Si false positive rate > 30%, invertir en tuning ANTES de activar block
- Si un gate agrega >5 min al pipeline, evaluar ejecucion paralela
- Developer experience importa: un pipeline que nadie quiere usar no protege nada
- Documentar CADA decision de skip/warn con justificacion y risk acceptance
```

---

## 3. Risk-Based Deployment Analysis (Analisis de Riesgo de Deployment)

**Proposito:** Para cada cambio que entra al pipeline, evaluar su nivel de riesgo y aplicar controles proporcionales. No todos los cambios merecen el mismo nivel de escrutinio.

```
Clasificar cada tipo de cambio segun su riesgo de deployment:

RIESGO BAJO (deploy automatico, cualquier hora):
- Cambios cosmeticos (UI text, colores, spacing)
- Documentacion
- Configuracion no critica (feature flags para features nuevos)
- Dependency updates (patch versions, sin CVEs)
- Tests nuevos (solo agregan, no modifican)

RIESGO MEDIO (deploy en horas de negocio, monitoring activo):
- Nuevas features con feature flag
- Cambios de performance (queries, caching)
- Dependency updates (minor versions)
- Nuevos endpoints API (con autenticacion)
- Refactoring de codigo existente

RIESGO ALTO (canary only, approval requerido, rollback preparado):
- Cambios de autenticacion/autorizacion
- Migraciones de base de datos (schema changes)
- Cambios de infraestructura (IaC)
- Actualizaciones de security patches criticos
- Breaking API changes
- Dependency updates (major versions)
- Cambios en secrets rotation o encryption

PARA CADA TIPO DE CAMBIO, DEFINIR:
1. Gates requeridos: cuales security gates aplican
2. Approval: automatico / tech lead / security + architect
3. Deployment strategy: continuous / canary (%) / blue-green
4. Monitoring: standard / enhanced (extra dashboards, shorter alert thresholds)
5. Rollback: automatico (health check fail) / manual (decision humana)
6. Communication: ninguna / team Slack / org-wide change notification

META-REGLA:
- La clasificacion de riesgo debe ser automatica (basada en files changed, labels, paths)
- Si un cambio toca multiples categorias, usar la mas alta
- Los cambios de riesgo alto nunca se despliegan los viernes
- Post-deploy monitoring duration: bajo=5min, medio=30min, alto=2h
```

---

## 4. Supply Chain Trust Verification (Verificacion de Confianza en Supply Chain)

**Proposito:** Para cada componente de terceros en el pipeline (dependencias, base images, herramientas), evaluar el nivel de confianza y verificar integridad.

```
Para cada componente externo del sistema, evalua la cadena de confianza:

COMPONENTE: {nombre, ej: "express v4.18.2"}

ORIGEN:
- Registry fuente: {npm, Maven Central, PyPI, Docker Hub, etc.}
- Publisher verificado? {si/no, como se verifica}
- Fuente es un fork? {riesgo de typosquatting/dependency confusion}

INTEGRIDAD:
- Checksum verificado en cada download? {si/no}
- Firma digital del publisher? {si/no, mecanismo}
- Version pinned (no "latest" ni ranges)? {si/no}
- Lockfile committed y revisado? {si/no}

ACTIVIDAD:
- Ultimo release: {fecha}
- Contributors activos: {numero}
- Issues abiertos sin respuesta: {numero}
- Proyecto abandonado? (>12 meses sin commits = risk flag)

VULNERABILIDADES:
- CVEs conocidos: {lista o ninguno}
- SCA scan: {last scan date, findings}
- Reachability: las vulnerabilidades son alcanzables en nuestro uso? {si/no/desconocido}

ALTERNATIVAS:
- Existe alternativa con menor superficie de ataque? {si: cual}
- Podemos eliminar esta dependencia? {si/no, esfuerzo}
- Podemos "vendor" (copiar el codigo fuente)? {si/no, mantenimiento}

CLASIFICACION DE CONFIANZA:
- ALTA: maintained, signed, verified publisher, no CVEs, pinned
- MEDIA: maintained, not signed, no CVEs, pinned
- BAJA: unmaintained OR known CVEs OR not pinned
- CRITICA: abandoned AND known CVEs — requiere reemplazo inmediato

Para dependencias con confianza BAJA o CRITICA:
1. Documentar el riesgo
2. Definir plan de mitigacion (reemplazo, vendoring, compensating controls)
3. Timeline de remediacion
4. Owner responsable

REGLA: Dependencias con confianza CRITICA son blocker para produccion.
```

---

## 5. Pipeline Maturity Assessment (Evaluacion de Madurez del Pipeline)

**Proposito:** Evaluar el estado actual del pipeline DevSecOps para asegurar que las recomendaciones son realistas y construyen sobre la base existente.

```
Evaluar la madurez del pipeline DevSecOps en 7 dimensiones:

DIMENSION 1 — CI/CD Pipeline:
- Nivel 1 (Manual): deploy manual, sin pipeline, scripts ad-hoc
- Nivel 2 (Basico): CI automatizado (build + test), deploy manual
- Nivel 3 (Integrado): CI/CD completo, deploy automatizado a staging, manual a prod
- Nivel 4 (Avanzado): CD completo, canary deployments, feature flags, instant rollback
Estado actual: ___  Target (6 meses): ___

DIMENSION 2 — Security Scanning:
- Nivel 1: Sin scanning de seguridad
- Nivel 2: SCA basico (dependency check), manual
- Nivel 3: SAST + SCA en CI, secrets scanning, container scan
- Nivel 4: SAST + SCA + DAST + IaC scan, gates automaticos, vulnerability SLAs
Estado actual: ___  Target (6 meses): ___

DIMENSION 3 — Supply Chain Security:
- Nivel 1: Dependencies sin gestion (latest, no lockfile)
- Nivel 2: Lockfile, dependency updates manuales
- Nivel 3: SBOM generation, artifact signing, dependency updates automaticos
- Nivel 4: SLSA Level 2+, VEX, admission control, reproducible builds
Estado actual: ___  Target (6 meses): ___

DIMENSION 4 — Release Management:
- Nivel 1: Deploy manual, sin versionado consistente
- Nivel 2: Semantic versioning, deploy scripted
- Nivel 3: Blue-green/canary, feature flags, automated rollback
- Nivel 4: Progressive delivery, automated canary analysis, chaos engineering pre-release
Estado actual: ___  Target (6 meses): ___

DIMENSION 5 — Observabilidad:
- Nivel 1: Sin metricas de pipeline
- Nivel 2: Build duration, success/failure rate
- Nivel 3: DORA metrics tracked, deployment-to-incident correlation
- Nivel 4: Predictive analytics, automated bottleneck resolution, DX metrics
Estado actual: ___  Target (6 meses): ___

DIMENSION 6 — Compliance Automation:
- Nivel 1: Compliance manual (screenshots, spreadsheets)
- Nivel 2: Audit trail basico, some automated evidence
- Nivel 3: Policy-as-code, automated evidence collection, compliance dashboard
- Nivel 4: Continuous compliance monitoring, automated remediation, real-time audit readiness
Estado actual: ___  Target (6 meses): ___

DIMENSION 7 — Risk Management:
- Nivel 1: Sin clasificacion de riesgo, todos los cambios igual
- Nivel 2: Risk classification manual (dev decide)
- Nivel 3: Risk-based gates automaticos, approval workflows
- Nivel 4: Automated risk scoring, ML-based anomaly detection, dynamic gates
Estado actual: ___  Target (6 meses): ___

REGLAS del assessment:
- Target maximo +1 nivel por dimension en 6 meses
- El nivel mas bajo es el "weakest link" del pipeline
- Dimension 1 (CI/CD) y 2 (Security Scanning) son prerequisitos para las demas
- Documentar evidencia del nivel actual: [CODIGO] pipeline config, [CONFIG] tool settings, [DOC] runbooks
- Si Nivel 1 en cualquier dimension critica, es el primer foco de mejora
```

---

**Autor:** Javier Montano | **Ultima actualizacion:** 13 de marzo de 2026
**© Comunidad MetodologIA — Todos los derechos reservados**

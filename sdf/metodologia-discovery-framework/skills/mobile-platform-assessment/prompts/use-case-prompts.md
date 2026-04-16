# Use Case Prompts — Mobile Platform Assessment

> Prompts listos para usar en los casos de uso más frecuentes de esta skill.
> Cada prompt incluye contexto de cuándo usarlo y parámetros variables.

---

## 1. Full Mobile Platform Assessment

**Cuándo:** Evaluación integral de una app móvil existente o diseño completo de una nueva app. Cubre las 9 secciones.

```
Realizar assessment integral de la plataforma móvil para {APP_NAME}.

Contexto:
- Tecnología actual: {TECNOLOGIA} (ej: Flutter 3.x, React Native 0.74, Kotlin nativo, Swift nativo, KMP)
- Plataformas target: {PLATAFORMAS} (ej: iOS + Android, solo Android, iOS + Android + Web)
- Usuarios activos mensuales: {MAU}
- Equipo de desarrollo: {TEAM_SIZE} developers, {TEAM_EXPERIENCE} (ej: senior Flutter, junior RN)
- Estado actual: {ESTADO} (ej: producción estable, pre-launch, refactor mayor, tech debt acumulado)

Requisitos:
- Platform strategy con decision matrix scored
- Architecture patterns evaluados con pros/cons
- Offline-first assessment (si aplica)
- Performance audit contra benchmarks (cold start, FPS, memory, app size)
- App health vitals vs umbrales de stores
- Security audit basado en OWASP MSTG
- Store compliance review (App Store + Google Play)
- Release pipeline maturity evaluation
- Remediation roadmap priorizado

Parámetros:
- {MODO_OPERACIONAL}: integral
- {MODO}: piloto-auto
- {FORMATO}: markdown
- {VARIANTE}: técnica

Entregar las 9 secciones completas con health dashboard, compliance checklist, y remediation roadmap priorizado por severity/effort.
```

---

## 2. Cross-Platform vs Native Decision

**Cuándo:** El cliente necesita decidir entre estrategias de desarrollo móvil antes de iniciar un proyecto o durante un refactor mayor.

```
Evaluar estrategia de plataforma móvil para {PROYECTO_NAME}: cross-platform vs nativo.

Contexto:
- Tipo de app: {TIPO_APP} (ej: e-commerce, fintech, health, logistics, social)
- Funcionalidades clave: {FUNCIONALIDADES} (ej: mapas, cámara, Bluetooth, pagos, offline, AR)
- APIs de plataforma requeridas: {APIS_NATIVAS} (ej: HealthKit, NFC, ARKit, widgets, Siri/Google Assistant)
- Time-to-market requerido: {TIME_TO_MARKET} (ej: 3 meses MVP, 6 meses v1.0)
- Presupuesto de equipo: {PRESUPUESTO} (ej: 3 devs mobile, 5 devs full-stack, budget limitado)
- Expertise del equipo: {EXPERTISE} (ej: JavaScript/React, Dart/Flutter, Kotlin, Swift, C#)
- Apps de referencia (competencia): {REFERENCIAS}

Evaluar y comparar:
- Native (Swift + Kotlin) — scoring por factor
- Flutter (Dart) — scoring por factor
- React Native (New Architecture) — scoring por factor
- KMP / Compose Multiplatform — scoring por factor
- PWA (si aplica) — scoring por factor

Criterios de scoring (weight por relevancia del proyecto):
- Performance requirements
- Code sharing efficiency
- UI fidelity requirements
- Team skill fit
- Time-to-market pressure
- Long-term maintenance cost
- Ecosystem maturity for this use case

Parámetros:
- {MODO_OPERACIONAL}: diseño
- {MODO}: piloto-auto
- {FORMATO}: markdown

Entregar S1 (Platform Strategy) completo con decision matrix scored, recomendación fundamentada, y migration path si aplica.
```

---

## 3. App Performance Audit

**Cuándo:** La app tiene problemas de rendimiento reportados por usuarios o detectados en app vitals. Cold start lento, jank, consumo de memoria excesivo, o battery drain.

```
Auditar performance de la app {APP_NAME} contra benchmarks de industria.

Contexto:
- Framework: {FRAMEWORK} (ej: Flutter 3.22, React Native 0.75, Kotlin nativo)
- Métricas actuales conocidas:
  - Cold start: {COLD_START} (ej: 3.5s, desconocido)
  - FPS promedio: {FPS} (ej: 45fps en listas largas, desconocido)
  - Memoria pico: {MEMORY} (ej: 320MB, desconocido)
  - App size (download): {APP_SIZE} (ej: 85MB)
  - Battery drain: {BATTERY} (ej: alto reportado por usuarios, desconocido)
- Problemas reportados: {PROBLEMAS} (ej: "la app se congela al scrollear", "tarda mucho en abrir")
- Instrumentación actual: {INSTRUMENTACION} (ej: Firebase Performance, ninguna, Datadog)

Evaluar:
- Cold start time vs benchmark (<2s aceptable, <1s excelente)
- Rendering performance vs 60fps target (16ms/frame budget)
- Memory usage vs benchmarks (<200MB típica, <100MB optimal)
- App size vs benchmarks (<50MB download target)
- Network efficiency (HTTP caching, compression, request batching)
- Battery impact (background processing, wake locks, location usage)
- Image loading pipeline (caching, compression, lazy loading)

Parámetros:
- {MODO_OPERACIONAL}: evaluacion
- {MODO}: piloto-auto
- {FORMATO}: markdown

Entregar S4 (Performance) y S5 (App Health) con benchmarks comparativos, root cause analysis de problemas detectados, y remediation items priorizados por impacto.
```

---

## 4. Offline-First Architecture Design

**Cuándo:** La app debe funcionar en condiciones de red inestable o sin conexión. Típico en field services, logistics, healthcare en zonas rurales, o apps de viaje.

```
Diseñar arquitectura offline-first para {APP_NAME}.

Contexto:
- Tipo de app: {TIPO_APP} (ej: field service, logistics, healthcare, travel)
- Escenarios offline: {ESCENARIOS} (ej: zona rural sin 4G, metro sin wifi, inspección en planta industrial)
- Duración offline esperada: {DURACION} (ej: minutos, horas, días)
- Datos que deben funcionar offline: {DATOS_OFFLINE} (ej: catálogo de productos, formularios de inspección, mapas)
- Operaciones que deben funcionar offline: {OPERACIONES} (ej: crear pedidos, registrar inspecciones, tomar fotos)
- Conflictos posibles: {CONFLICTOS} (ej: dos usuarios editan el mismo registro, precios cambian mientras está offline)
- Framework: {FRAMEWORK}
- Backend: {BACKEND} (ej: REST API, GraphQL, Firebase, Supabase)

Diseñar:
- Local storage strategy (SQLite, Realm, Hive, SharedPreferences, CoreData)
- Sync protocol (push, pull, bidirectional, CRDT)
- Conflict resolution strategy (last-write-wins, merge, manual)
- Queue management para operaciones offline
- UI patterns para estados offline/online/syncing
- Data freshness indicators
- Error handling y retry policies
- Storage limits y cache eviction

Parámetros:
- {MODO_OPERACIONAL}: diseño
- {MODO}: piloto-auto
- {FORMATO}: markdown

Entregar S3 (Offline-First) completo con diagramas de sync flow, decision tree de conflict resolution, y recomendaciones de libraries por framework.
```

---

## 5. Store Compliance Review

**Cuándo:** Antes de un release mayor, después de un rechazo de store, o como auditoría preventiva para evitar rechazos.

```
Auditar compliance de {APP_NAME} contra políticas de App Store y Google Play.

Contexto:
- Plataformas: {PLATAFORMAS} (ej: iOS + Android, solo iOS)
- Último rechazo (si aplica): {RECHAZO} (ej: "guideline 5.1.1 — data collection", ninguno)
- SDKs de terceros: {SDKS} (ej: Firebase, Adjust, Facebook SDK, Stripe, OneSignal)
- Datos recopilados: {DATOS} (ej: location, contacts, health data, photos, usage analytics)
- Monetización: {MONETIZACION} (ej: in-app purchases, subscriptions, ads, freemium)
- Target API level Android: {TARGET_API} (ej: 34, 35)
- Minimum iOS version: {MIN_IOS} (ej: 16.0, 17.0)

Verificar:
- Apple App Store Review Guidelines (5 secciones, 150+ reglas)
  - Privacy manifests (PrivacyInfo.xcprivacy) para todos los SDKs
  - Required reason APIs declarations
  - App Tracking Transparency implementation
  - In-app purchase compliance (no external payment links sin entitlement)
  - Data safety/privacy nutrition labels accuracy
- Google Play policies
  - Data Safety section completeness y accuracy
  - Target API level compliance (API 35 requerido para nuevas apps 2025)
  - Android vitals thresholds (crash <1.09%, ANR <0.47%)
  - Deceptive behavior policy
  - Families policy (si aplica)
- Cross-platform requirements
  - GDPR/CCPA consent flows
  - Age gating (si aplica)
  - Accessibility (WCAG 2.2 mobile)

Parámetros:
- {MODO_OPERACIONAL}: evaluacion
- {MODO}: piloto-auto
- {FORMATO}: markdown

Entregar S7 (Compliance) completo con checklist de compliance por store, gaps identificados con severity, y remediation actions con deadline por requisito.
```

---

## 6. Mobile Security Audit

**Cuándo:** Antes de un launch público, como requisito regulatorio (fintech, health), o después de un incidente de seguridad.

```
Auditar seguridad de la app {APP_NAME} basado en OWASP MSTG.

Contexto:
- Tipo de app: {TIPO_APP} (ej: fintech, healthcare, e-commerce, enterprise)
- Datos sensibles manejados: {DATOS_SENSIBLES} (ej: credenciales, datos financieros, PII, datos de salud)
- Autenticación: {AUTH} (ej: username/password, biometric, OAuth2, MFA)
- Comunicación: {COMUNICACION} (ej: HTTPS, certificate pinning, WebSocket)
- Almacenamiento local: {STORAGE} (ej: SharedPreferences, Keychain, SQLite, encrypted storage)
- Regulaciones: {REGULACIONES} (ej: PCI-DSS, HIPAA, GDPR, SOX)
- Framework: {FRAMEWORK}
- Auditoría previa: {AUDITORIA_PREVIA} (ej: ninguna, pentest 2024 con N hallazgos)

Evaluar contra OWASP MSTG / MASVS v2:
- Almacenamiento seguro de datos (MASVS-STORAGE)
- Criptografía (MASVS-CRYPTO)
- Autenticación y autorización (MASVS-AUTH)
- Comunicación de red (MASVS-NETWORK)
- Interacción con la plataforma (MASVS-PLATFORM)
- Calidad de código y configuración (MASVS-CODE)
- Resiliencia contra reverse engineering (MASVS-RESILIENCE)

Parámetros:
- {MODO_OPERACIONAL}: evaluacion
- {MODO}: piloto-auto
- {FORMATO}: markdown

Entregar S6 (Security) completo con findings clasificados por OWASP MSTG category, severity rating (Critical/High/Medium/Low), evidence, y remediation recommendation por finding.
```

---

## 7. Mobile CI/CD Pipeline Design

**Cuándo:** El equipo tiene procesos manuales de build/release, tiempos de release lentos, o necesita establecer un pipeline CI/CD para mobile desde cero.

```
Diseñar pipeline CI/CD para la app móvil {APP_NAME}.

Contexto:
- Framework: {FRAMEWORK} (ej: Flutter, React Native, Native iOS+Android)
- Plataformas: {PLATAFORMAS} (ej: iOS + Android)
- Repositorio: {REPO_STRUCTURE} (ej: monorepo, repos separados iOS/Android, monorepo con shared lib)
- CI/CD actual: {CI_ACTUAL} (ej: ninguno, GitHub Actions básico, Jenkins legacy, Bitrise)
- Branching strategy: {BRANCHING} (ej: Git Flow, Trunk-based, ninguna definida)
- Testing actual: {TESTING} (ej: unit tests 40%, sin UI tests, sin E2E)
- Distribución beta: {BETA} (ej: TestFlight manual, Firebase App Distribution, ninguna)
- Release frequency: {FREQUENCY} (ej: semanal, quincenal, ad-hoc)
- Equipo: {TEAM_SIZE} developers
- Code signing: {CODE_SIGNING} (ej: manual, Fastlane match, configurado pero frágil)

Diseñar:
- Pipeline stages (lint → build → test → sign → distribute → release)
- Code signing automation (match/manual, provisioning profiles, keystores)
- Testing pyramid (unit → widget/component → integration → E2E)
- Beta distribution flow (internal → QA → stakeholders → staged rollout)
- Store submission automation
- Feature flags integration
- Versioning strategy (semver, build numbers)
- Environment management (dev, staging, production)
- Rollback strategy
- Monitoring post-release (crash rate gates, rollback triggers)

Parámetros:
- {MODO_OPERACIONAL}: diseño
- {MODO}: piloto-auto
- {FORMATO}: markdown

Entregar S8 (Release Pipeline) completo con diagrama de pipeline, tooling recommendations, y implementation roadmap por fase.
```

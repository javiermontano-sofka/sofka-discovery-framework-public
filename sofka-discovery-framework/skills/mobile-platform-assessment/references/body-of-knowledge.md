# Body of Knowledge — Mobile Platform Assessment

> Fuentes académicas, industriales y prácticas que fundamentan la evaluación unificada de plataformas móviles: estrategia de plataforma, patrones de arquitectura, offline-first, performance, app health, seguridad, compliance de stores, y release pipeline.

---

## 1. Guías de Diseño de Plataforma

### Apple Human Interface Guidelines (HIG)
- **Relevancia:** Estándar de diseño obligatorio para cualquier app iOS/iPadOS/watchOS/visionOS. Define patrones de navegación, tipografía, color, accesibilidad, y componentes nativos que Apple evalúa en App Review.
- **Uso en el skill:** S1 (Platform Strategy) referencia HIG para evaluar si una solución cross-platform puede lograr fidelidad nativa suficiente. S7 (Compliance) verifica adherencia a HIG como requisito de App Store Review.
- **Fuente:** Apple (2025). *Human Interface Guidelines*. developer.apple.com/design/human-interface-guidelines
- **Áreas clave:** Navigation patterns (tab bars, sidebars), SF Symbols, Dynamic Type, Dark Mode, accessibility (VoiceOver), visionOS spatial design.

### Material Design for Android (Material 3 / Material You)
- **Relevancia:** Sistema de diseño de Google para Android, web y Flutter. Material 3 introduce dynamic color (basado en wallpaper del usuario), revised typography, y componentes actualizados. Es el estándar de facto para apps Android.
- **Uso en el skill:** S1 (Platform Strategy) usa Material Design como benchmark para evaluar UI fidelity en Flutter y React Native. S2 (Architecture Patterns) referencia los componentes de Material para decisiones de state management.
- **Fuente:** Google (2025). *Material Design 3*. m3.material.io
- **Complemento:** Material Design Components (MDC) libraries para Android, Flutter, y Web.

---

## 2. Frameworks Cross-Platform

### React Native — Architecture Guide (New Architecture)
- **Relevancia:** React Native New Architecture (default desde 0.76) reemplaza el bridge con JSI (JavaScript Interface), introduce Fabric Renderer para UI sincrónica y concurrente, y TurboModules para carga lazy de módulos nativos. Codegen genera interfaces type-safe desde specs Flow/TypeScript.
- **Uso en el skill:** S1 (Platform Strategy) evalúa New Architecture como criterio de viabilidad. S4 (Performance) usa benchmarks de Fabric vs. old bridge. S2 (Architecture Patterns) considera state management con JSI directo.
- **Fuente:** Meta (2025). *React Native Architecture Overview*. reactnative.dev/architecture/overview
- **Referencia adicional:** Shopify Engineering (2024). "React Native New Architecture at Shopify" — caso de migración a escala con métricas de mejora (10% faster Android launch).

### Flutter Architecture Guide (Impeller Renderer)
- **Relevancia:** Flutter con Impeller renderer (default desde 3.16) elimina shader jank mediante compilación ahead-of-time de shaders. Vulkan backend en Android, Metal en iOS. Flutter 4.x introduce soporte mejorado para multi-window y desktop-class features.
- **Uso en el skill:** S1 (Platform Strategy) evalúa Flutter como opción cross-platform con métricas de Impeller. S4 (Performance) usa benchmarks de Impeller (60/120 FPS consistentes, eliminación de shader warmup). S2 (Architecture Patterns) evalúa BLoC, Riverpod, y Provider para state management.
- **Fuente:** Flutter Team (2025). *Flutter Architectural Overview*. docs.flutter.dev/resources/architectural-overview
- **Fuente adicional:** Google I/O (2025). "Flutter Performance Deep Dive with Impeller".

### Kotlin Multiplatform (KMP) / Compose Multiplatform (CMP)
- **Relevancia:** KMP permite compartir lógica de negocio en Kotlin entre Android, iOS, web, y desktop. Compose Multiplatform extiende Jetpack Compose a iOS y desktop para UI compartida. Google Docs en iOS usa KMP para lógica compartida.
- **Uso en el skill:** S1 (Platform Strategy) evalúa KMP para escenarios donde se necesita lógica compartida con UI nativa por plataforma, o CMP para UI compartida. S2 evalúa expect/actual patterns y arquitectura de módulos compartidos.
- **Fuente:** JetBrains (2025). *Kotlin Multiplatform Documentation*. kotlinlang.org/docs/multiplatform.html
- **Fuente adicional:** Touchlab (2025). "KMP Production Readiness Report" — adopción empresarial y case studies.

---

## 3. App Store Compliance & Policies

### Google Play Console — App Quality Guidelines
- **Relevancia:** Define los umbrales de Android vitals que afectan visibilidad en Google Play: crash rate (<1.09%), ANR rate (<0.47%), excessive wakeups, stuck partial wake locks. Apps que exceden estos umbrales pierden visibilidad y elegibilidad para featuring.
- **Uso en el skill:** S5 (App Health) usa estos umbrales como benchmarks obligatorios. S7 (Compliance) audita contra todos los requisitos de Google Play. S9 (Remediation) prioriza violaciones de vitals como critical.
- **Fuente:** Google (2025). *Android Vitals Overview*. developer.android.com/topic/performance/vitals
- **Complemento:** Google Play Console Help — "Core Vitals" y "Bad Behavior Thresholds".

### Apple App Store Review Guidelines
- **Relevancia:** Las guidelines de revisión de Apple (5 secciones, 150+ reglas) determinan si una app es aprobada o rechazada. Incluyen requisitos de safety, performance, business, design, y legal. Los cambios frecuentes (privacy manifests obligatorios desde 2024, required reason APIs) requieren monitoreo continuo.
- **Uso en el skill:** S7 (Compliance) verifica adherencia punto por punto a las guidelines actualizadas. S6 (Security) y S8 (Release Pipeline) consideran requisitos de code signing, notarization, y privacy declarations.
- **Fuente:** Apple (2025). *App Store Review Guidelines*. developer.apple.com/app-store/review/guidelines
- **Actualizaciones críticas:** Privacy manifests (obligatorio desde spring 2024), required reason APIs, third-party SDK signature requirements.

---

## 4. Seguridad Móvil

### OWASP Mobile Security Testing Guide (MSTG)
- **Relevancia:** Guía exhaustiva para testing de seguridad en apps móviles. Cubre autenticación, almacenamiento de datos, criptografía, comunicación de red, interacción con la plataforma, calidad de código, y resiliencia contra tampering. Es el estándar de facto para auditorías de seguridad móvil.
- **Uso en el skill:** S6 (Security) usa MSTG como checklist primario para auditoría de seguridad. Cada control de MSTG se mapea a una verificación específica en el assessment.
- **Fuente:** OWASP (2024). *Mobile Security Testing Guide (MSTG) v2*. mas.owasp.org/MASTG
- **Complemento:** OWASP Mobile Application Security Verification Standard (MASVS) v2.1 — niveles L1 y L2 de verificación.

### OWASP Mobile Top 10 (2024)
- **Relevancia:** Las 10 vulnerabilidades más críticas en aplicaciones móviles. Actualizado para reflejar el panorama actual: improper credential usage, inadequate supply chain security, insecure authentication/authorization, insufficient input/output validation, insecure communication, inadequate privacy controls, insufficient binary protections, security misconfiguration, insecure data storage, insufficient cryptography.
- **Uso en el skill:** S6 (Security) prioriza hallazgos según Mobile Top 10. S9 (Remediation) clasifica severity usando este ranking.
- **Fuente:** OWASP (2024). *Mobile Top 10*. owasp.org/www-project-mobile-top-10

---

## 5. Performance & Monitoring

### Firebase Performance Monitoring Best Practices
- **Relevancia:** Firebase Performance Monitoring instrumenta automáticamente métricas de app startup time, HTTP/S network requests, y screen rendering. Permite custom traces para medir operaciones específicas. Es la herramienta de performance monitoring más adoptada en el ecosistema móvil.
- **Uso en el skill:** S4 (Performance) y S5 (App Health) usan Firebase Performance como fuente primaria de métricas. Los umbrales del skill (cold start <2s, 60fps, <200MB RAM) se validan contra datos de Firebase.
- **Fuente:** Google (2025). *Firebase Performance Monitoring*. firebase.google.com/docs/perf-mon
- **Alternativas evaluadas:** New Relic Mobile, Datadog Mobile, Embrace.io, Sentry Performance.

### Android Performance Patterns
- **Relevancia:** Serie de guías técnicas de Google sobre optimización de rendimiento Android: rendering pipeline, memory management, battery optimization, network efficiency, app startup. Incluye benchmarks y herramientas de profiling (Android Profiler, Perfetto, Macrobenchmark).
- **Uso en el skill:** S4 (Performance) referencia benchmarks de Google para cold start (<500ms excellent, <2s acceptable), memory (<200MB para apps típicas), y rendering (16ms/frame para 60fps).
- **Fuente:** Google (2025). *App Performance*. developer.android.com/topic/performance

---

## 6. Progressive Web Apps (PWA)

### PWA Architecture & Capabilities
- **Relevancia:** PWAs representan una alternativa viable a apps nativas para ciertos casos de uso. Con Project Fugu APIs (Web Bluetooth, NFC, File System Access, Push Notifications), las capacidades de PWA se han expandido significativamente. Relevante cuando la estrategia incluye web + mobile con un solo codebase.
- **Uso en el skill:** S1 (Platform Strategy) evalúa PWA como opción cuando los requisitos no demandan APIs nativas exclusivas. La decision matrix incluye PWA como quinta columna para escenarios web-first.
- **Fuente:** web.dev (2025). *Progressive Web Apps*. web.dev/progressive-web-apps
- **Limitaciones documentadas:** iOS limita PWAs significativamente (no background push, 50MB storage limit en Safari, no access to Bluetooth/NFC). Esto hace que PWA sea viable principalmente para Android + desktop.

---

## 7. Mobile CI/CD & Release Management

### Fastlane
- **Relevancia:** Herramienta open-source para automatizar builds, testing, y deployment de apps iOS y Android. Maneja code signing (match), screenshots (snapshot), beta distribution (pilot), y store submission (deliver/supply).
- **Uso en el skill:** S8 (Release Pipeline) evalúa la madurez del CI/CD pipeline usando Fastlane como referencia para automatización esperada.
- **Fuente:** Fastlane (2025). *Documentation*. docs.fastlane.tools

### Mobile DevOps — Bitrise, Codemagic, App Center
- **Relevancia:** Plataformas CI/CD especializadas en mobile que resuelven complejidades específicas: build machines con Xcode, Android SDK management, device farms, y over-the-air distribution.
- **Uso en el skill:** S8 (Release Pipeline) evalúa el stack de CI/CD y recomienda mejoras basadas en las capacidades de estas plataformas.
- **Fuentes:** Bitrise (2025). bitrise.io; Codemagic (2025). codemagic.io; Microsoft (2024). *Visual Studio App Center* (sunset announcement — migración a alternatives).

---

## 8. Glosario

| Término | Definición |
|---------|------------|
| **ANR (Application Not Responding)** | Error de Android cuando el hilo principal está bloqueado >5 segundos. Umbral de Google Play: <0.47% de sesiones. |
| **App Vitals** | Métricas de salud reportadas por Google Play Console: crash rate, ANR rate, excessive wakeups, stuck wake locks. |
| **BLoC (Business Logic Component)** | Patrón de state management en Flutter basado en streams. Separa lógica de negocio de UI. |
| **Code Signing** | Proceso criptográfico que verifica la identidad del desarrollador y la integridad del binary. Obligatorio para distribución en ambos stores. |
| **Cold Start** | Tiempo desde que el usuario toca el ícono hasta que la app es interactiva. Benchmark: <2 segundos. |
| **Fabric Renderer** | Nuevo sistema de rendering de React Native que reemplaza el bridge asíncrono con JSI para renderizado sincrónico y concurrente. |
| **Feature Flag** | Mecanismo para activar/desactivar funcionalidad sin deploy. Crítico para staged rollouts y A/B testing en mobile. |
| **Impeller** | Motor de rendering de Flutter que reemplaza Skia. Compila shaders ahead-of-time eliminando jank. Default desde Flutter 3.16. |
| **JSI (JavaScript Interface)** | Interfaz C++ en React Native New Architecture que permite llamadas directas entre JavaScript y código nativo, eliminando el bridge asíncrono. |
| **KMP (Kotlin Multiplatform)** | Tecnología de JetBrains para compartir código Kotlin entre Android, iOS, web, y desktop. Lógica compartida con UI nativa por plataforma. |
| **Privacy Manifest** | Archivo declarativo (PrivacyInfo.xcprivacy) requerido por Apple desde 2024 que declara los datos recopilados y las APIs de required reason utilizadas. |
| **Staged Rollout** | Distribución gradual de una actualización (ej: 1% → 5% → 20% → 100%) para detectar problemas antes del rollout completo. |
| **Shader Jank** | Stuttering visual causado por compilación de shaders en runtime. Impeller de Flutter lo elimina con compilación ahead-of-time. |
| **TurboModules** | Sistema de React Native New Architecture para carga lazy de módulos nativos. Solo se inicializan cuando se acceden por primera vez. |

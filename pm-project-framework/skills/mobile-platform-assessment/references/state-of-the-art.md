# State of the Art — Mobile Platform Assessment (2024-2026)

> Tendencias, herramientas emergentes y debates abiertos en el dominio de plataformas móviles: frameworks cross-platform, arquitectura nativa, on-device AI, privacidad, y evolución de stores.

---

## 1. Tendencias Dominantes

### 1.1 Kotlin Multiplatform (KMP) — Madurez Productiva

- **Qué está pasando:** KMP ha alcanzado estabilidad productiva (Stable desde Kotlin 1.9.20, noviembre 2023). La adopción empresarial se ha acelerado: Google usa KMP en Google Docs para iOS, Netflix en su SDK de dispositivos, y Cash App comparte >60% de lógica de negocio entre plataformas. JetBrains reporta >5,000 proyectos KMP en producción para 2025.
- **Impacto en el skill:** S1 (Platform Strategy) debe considerar KMP como opción legítima para compartir lógica de negocio (networking, storage, business rules) manteniendo UI nativa. La decision matrix se expande de "native vs cross-platform" a un espectro de sharing levels: logic-only (KMP), logic+UI (CMP/Flutter), o full-native.
- **Compose Multiplatform (CMP):** Extiende Jetpack Compose a iOS (Beta→Stable en 2025), desktop, y web. Permite compartir UI además de lógica. Competidor directo de Flutter con la ventaja de ser Kotlin-native.
- **Fuentes:** JetBrains (2025) "Kotlin Multiplatform Stable Announcement"; Touchlab (2025) "KMP Adoption Report"; Google (2025) "KMP at Google".

### 1.2 Flutter 4.x y Dart 4

- **Qué está pasando:** Flutter continúa su evolución post-Impeller. Flutter 4.x introduce mejoras en multi-window support, desktop-class features, y hot reload para Impeller shaders. Dart 4 trae macros (metaprogramming) que eliminan boilerplate de serialización y reducen la necesidad de code generation. El market share cross-platform se mantiene ~46%.
- **Impacto en el skill:** S1 (Platform Strategy) actualiza benchmarks de Flutter con Dart 4 macros (menos boilerplate = mayor velocity). S4 (Performance) incorpora métricas de Impeller maduradas (consistente 120fps en dispositivos high-refresh). S2 (Architecture Patterns) evoluciona con Riverpod 3.x como state management recomendado.
- **Debate abierto:** Flutter para apps con heavy native integration (Bluetooth, ARKit, hardware-specific) sigue requiriendo platform channels complejos. Para estos casos, KMP con UI nativa puede ser más eficiente.
- **Fuentes:** Flutter Team (2025) "Flutter 4.0 Release Notes"; Dart Team (2025) "Dart 4 Macros RFC"; Google I/O (2025) "Flutter: What's New".

### 1.3 Jetpack Compose / SwiftUI — Convergencia de Paradigmas

- **Qué está pasando:** Jetpack Compose (Android) y SwiftUI (iOS) han convergido hacia el mismo paradigma: UI declarativa, state-driven, con previews en IDE. Ambos frameworks son ahora el estándar recomendado por sus plataformas respectivas. La adopción de Compose supera el 50% de nuevos proyectos Android; SwiftUI alcanza ~45% en nuevos proyectos iOS.
- **Impacto en el skill:** S2 (Architecture Patterns) debe asumir UI declarativa como paradigma default para nuevos proyectos. Los patrones de arquitectura evolucionan: MVVM con Compose/SwiftUI es más limpio que con Views/Storyboards. MVI (Model-View-Intent) gana tracción como evolución natural del paradigma declarativo.
- **Implicación para cross-platform:** La convergencia de paradigmas entre Compose y SwiftUI reduce la fricción cognitiva de mantener dos codebases nativos. CMP (Compose Multiplatform) aprovecha esto directamente.
- **Fuentes:** Android Developers (2025) "Jetpack Compose Adoption Report"; Apple (2025) "SwiftUI Essentials"; JetBrains (2025) "Compose Multiplatform for iOS Stable".

### 1.4 Super Apps y Mini-Apps Architecture

- **Qué está pasando:** El modelo de super apps (WeChat, Grab, Gojek, Rappi) se expande fuera de Asia. La arquitectura de mini-apps permite a terceros construir experiencias ligeras dentro de una app host sin instalación separada. Apple introdujo App Intents y WidgetKit extensibility; Android tiene Instant Apps y Dynamic Feature Modules.
- **Impacto en el skill:** S2 (Architecture Patterns) debe evaluar si el proyecto se beneficia de modularización tipo super-app: dynamic feature modules (Android), app extensions (iOS), o mini-program frameworks. S1 (Platform Strategy) considera la opción de SDK/widget para distribución dentro de super apps existentes.
- **Patrones técnicos:** Module federation para mobile, micro-frontends adaptados a mobile, plugin architectures con sandboxing. El reto es mantener startup time aceptable con múltiples módulos dinámicos.
- **Fuentes:** W3C (2024) "MiniApp Standardization White Paper"; Grab Engineering (2025) "Super App Architecture at Scale"; WeChat (2025) "Mini Program Technical Architecture".

### 1.5 App Clips (iOS) e Instant Apps (Android)

- **Qué está pasando:** App Clips (iOS, <15MB) e Instant Apps (Android, <15MB) permiten experiencias nativas sin instalación completa, activadas por NFC, QR, links, o sugerencias de Siri/Google. La adopción ha crecido en retail, food service, y parking. Apple ha expandido App Clips con más APIs disponibles y mayor tamaño permitido.
- **Impacto en el skill:** S1 (Platform Strategy) evalúa App Clips/Instant Apps como canal de adquisición complementario. S2 (Architecture Patterns) debe considerar modularización que permita extraer App Clips del app principal. S7 (Compliance) verifica requisitos específicos de tamaño y APIs permitidas.
- **Fuentes:** Apple (2025) "App Clips"; Android Developers (2025) "Google Play Instant"; Shopify Engineering (2024) "App Clips for In-Store Payments".

### 1.6 On-Device ML — Core ML, TensorFlow Lite, MediaPipe

- **Qué está pasando:** El ML on-device ha pasado de novelty a commodity. Core ML (iOS) soporta modelos de hasta 4GB con optimizaciones de hardware (Neural Engine). TensorFlow Lite y MediaPipe (Android/iOS) ofrecen modelos pre-entrenados para visión, NLP, y audio. Google ha lanzado Gemini Nano para on-device LLM inference. Apple Intelligence ejecuta modelos de lenguaje localmente en iPhone 15 Pro+.
- **Impacto en el skill:** S2 (Architecture Patterns) debe considerar ML pipeline como componente arquitectónico: model storage, inference scheduling, fallback a cloud cuando el dispositivo no soporta on-device. S4 (Performance) evalúa impacto en batería, memoria, y thermal throttling de ML inference. S1 (Platform Strategy) considera disponibilidad de frameworks ML por plataforma como factor de decisión.
- **Estado 2026:** ~40% de apps top-500 usan alguna forma de on-device ML. Los LLMs on-device (Gemini Nano, Apple Intelligence, Phi-3-mini) habilitan features de lenguaje sin roundtrip a cloud.
- **Fuentes:** Apple (2025) "Core ML 7"; Google (2025) "Gemini Nano for Android"; TensorFlow (2025) "TFLite Model Optimization Toolkit".

### 1.7 Privacy Manifests (iOS) y Privacy Sandbox (Android)

- **Qué está pasando:** Apple requiere privacy manifests (PrivacyInfo.xcprivacy) desde spring 2024. Todos los SDKs de terceros deben declarar qué datos recopilan y qué required reason APIs usan. SDKs sin manifests causan rechazo en App Review. Google Privacy Sandbox para Android (Topics API, Attribution Reporting, Protected Audiences) reemplaza gradualmente GAID (Google Advertising ID) para tracking cross-app.
- **Impacto en el skill:** S7 (Compliance) verifica privacy manifests como requisito hard de App Store. S6 (Security) evalúa el impacto de Privacy Sandbox en analytics y attribution. S8 (Release Pipeline) debe incluir validación automática de privacy manifests en CI.
- **Timeline Android:** GAID deprecation progresiva 2024-2026. Privacy Sandbox APIs en estabilización. Las apps deben migrar de GAID a Topics API para targeting contextual.
- **Fuentes:** Apple (2024) "Privacy Manifest Files"; Google (2025) "Privacy Sandbox for Android"; IAB Tech Lab (2025) "Mobile Attribution in the Post-GAID Era".

---

## 2. Herramientas Emergentes (2024-2026)

### 2.1 Frameworks Cross-Platform

| Herramienta | Propósito | Madurez | Relevancia para el skill |
|---|---|---|---|
| **Flutter 4.x** | UI cross-platform con Impeller renderer | Madura (dominante ~46%) | S1 — opción primaria para velocity teams |
| **React Native (New Arch)** | Cross-platform con Fabric + TurboModules | Madura (~35% share) | S1 — opción para equipos JavaScript |
| **KMP** | Lógica compartida en Kotlin, UI nativa | Estable (creciendo rápido) | S1 — opción para lógica compartida con UI nativa |
| **Compose Multiplatform** | UI compartida con Jetpack Compose | Estable para iOS (2025) | S1 — alternativa Flutter para equipos Kotlin |
| **.NET MAUI** | Cross-platform con C#/.NET | Madura (nicho) | S1 — opción para equipos .NET existentes |

### 2.2 Performance & Monitoring

| Herramienta | Propósito | Madurez | Relevancia para el skill |
|---|---|---|---|
| **Firebase Performance** | App startup, network, screen rendering | Madura (dominante) | S4, S5 — fuente primaria de métricas |
| **Embrace.io** | Mobile observability platform | Creciendo | S5 — alternativa con session replay |
| **Sentry Mobile** | Crash reporting + performance | Madura | S5 — crash reporting con stack traces nativos |
| **Flipper** | Mobile debugging platform (Meta) | Madura | S4 — debugging de layout, network, databases |
| **Perfetto** | System-level tracing (Android) | Madura (Google) | S4 — profiling profundo de rendering y CPU |

### 2.3 CI/CD & Release

| Herramienta | Propósito | Madurez | Relevancia para el skill |
|---|---|---|---|
| **Fastlane** | Build, test, deploy automation | Madura (estándar de facto) | S8 — code signing, beta distribution, store submission |
| **Codemagic** | CI/CD nativo para mobile/Flutter | Madura | S8 — CI/CD especializado con M1/M2 build machines |
| **Bitrise** | Mobile CI/CD platform | Madura | S8 — workflow visual con 300+ integrations |
| **Runway** | Mobile release management | Creciendo | S8 — release coordination, submission automation |
| **EAS (Expo)** | Build y update service para RN | Madura (Expo ecosystem) | S8 — OTA updates y cloud builds para React Native |

### 2.4 Seguridad

| Herramienta | Propósito | Madurez | Relevancia para el skill |
|---|---|---|---|
| **MobSF** | Static/dynamic analysis para mobile | Madura (open-source) | S6 — análisis automatizado de APK/IPA |
| **Frida** | Dynamic instrumentation toolkit | Madura | S6 — testing de runtime protections |
| **SSL Kill Switch** | Bypass SSL pinning (testing) | Madura | S6 — validar robustez de certificate pinning |
| **Snyk Mobile** | SCA para dependencias mobile | Madura | S6 — auditoría de supply chain de SDKs |

---

## 3. Debates Abiertos

### 3.1 Cross-Platform vs Native: ¿Sigue Siendo Relevante el Debate?

- **Posición A:** Con Impeller (Flutter), New Architecture (RN), y CMP, la brecha de performance es negligible para el 90% de apps. El debate se resuelve por team skills y velocity, no por limitaciones técnicas.
- **Posición B:** Para apps que dependen de APIs de plataforma avanzadas (ARKit, CameraX, HealthKit, Widgets complejos), native sigue siendo superior. El costo de platform channels y wrappers puede superar el ahorro de code sharing.
- **Posición del skill:** Es una decisión de negocio que depende de 6 factores (team, velocity, platform API depth, UX fidelity, performance requirements, budget). La decision matrix de S1 cuantifica estos factores.

### 3.2 Modularización: ¿Cuánto Es Demasiado?

- **Posición A:** Máxima modularización (feature modules, dynamic delivery) mejora build times, permite equipos independientes, y habilita App Clips/Instant Apps.
- **Posición B:** Over-modularización crea complejidad de dependency management, navigation entre módulos, y overhead de setup para nuevos developers. El ROI de modularización agresiva solo se justifica con >10 developers.
- **Posición del skill:** Modularización proporcional al tamaño del equipo. <5 devs: monolito con capas limpias. 5-15 devs: feature modules. >15 devs: full dynamic modules con module owners.

### 3.3 Server-Driven UI: ¿El Futuro de Mobile?

- **Qué es:** Server-Driven UI (SDUI) permite definir layouts y flows desde el backend, reduciendo la necesidad de app updates para cambios de UI. Airbnb, Shopify, y DoorDash han adoptado variantes.
- **Debate:** SDUI mejora velocity de iteración pero introduce complejidad en rendering, accessibility, y testing. No es viable para UI con animaciones complejas o interacciones platform-specific.
- **Posición del skill:** SDUI como complemento (flows de onboarding, feature flags visuales, content screens), no como reemplazo de UI nativa/cross-platform para pantallas core.

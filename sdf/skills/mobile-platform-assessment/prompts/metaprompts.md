# Metaprompts — Mobile Platform Assessment

> Estrategias de meta-nivel para maximizar la efectividad de esta skill.
> Los metaprompts no producen entregables — optimizan CÓMO se producen.

---

## 1. User-First Mobile (Perspectiva del Usuario Final)

**Propósito:** Antes de cualquier decisión técnica, recorrer la experiencia desde la perspectiva del usuario final para validar que las decisiones arquitectónicas no degradan la experiencia percibida.

```
Para cada decisión arquitectónica significativa en el assessment, aplica este filtro de usuario:

MOMENTO 1 — Primera impresión (install → first open):
- ¿Cuánto pesa la descarga? (>50MB = fricción en mercados emergentes)
- ¿Cuánto tarda el cold start? (>3s = abandono, >2s = percepción de lentitud)
- ¿El onboarding requiere conexión a internet? (¿qué pasa sin red?)
- ¿Cuántos permisos se piden antes de mostrar valor? (cada permiso es una oportunidad de abandono)

MOMENTO 2 — Uso diario (core loops):
- ¿La navegación es fluida a 60fps? (¿hay jank en transiciones o scroll?)
- ¿Las acciones frecuentes requieren >2 taps? (cada tap adicional reduce completion rate)
- ¿El contenido carga de forma perceptiblemente instantánea? (skeleton screens, cached data)
- ¿La app funciona si el usuario entra al metro sin señal?

MOMENTO 3 — Momentos de estrés (errores, red lenta, batería baja):
- ¿Qué ve el usuario cuando falla una request? (spinner infinito = peor caso)
- ¿Se pierden datos si la app se cierra inesperadamente? (draft saving, queue persistence)
- ¿La app drena batería en background? (¿hay wake locks innecesarios?)
- ¿Los errores son comprensibles y accionables para el usuario?

MOMENTO 4 — Actualización y retención:
- ¿Cuándo fue la última actualización? (>3 meses = señal de abandono)
- ¿Las actualizaciones rompen algo? (regression testing, staged rollouts)
- ¿El usuario puede seguir usando la app si no actualiza inmediatamente?
- ¿Las notificaciones push aportan valor o son spam?

Para cada momento, si la respuesta es negativa, escalar a remediación S9 con severity basada en impacto en retención.
```

---

## 2. Performance Budget Enforcement (Presupuesto de Performance)

**Propósito:** Establecer y hacer cumplir presupuestos de performance cuantitativos para cada decisión que impacte startup time, memory, app size, o battery. Prevenir death by a thousand cuts.

```
Antes de recomendar cualquier librería, SDK, patrón, o feature, calcular su costo contra el presupuesto de performance:

PRESUPUESTO BASE (app típica consumer):
- Cold start budget total: 2000ms
  - Framework init: ≤500ms
  - Dependency injection: ≤200ms
  - Network (primera request): ≤800ms (con cache: ≤100ms)
  - First meaningful paint: ≤500ms
- Memory budget total: 200MB peak
  - Framework baseline: ≤60MB
  - Image cache: ≤50MB (con LRU eviction)
  - Data cache: ≤30MB
  - SDK overhead: ≤20MB POR SDK
  - Headroom: ≥40MB (para picos de navegación)
- App size budget: 50MB download
  - Framework runtime: ≤15MB
  - App code: ≤10MB
  - Assets (images, fonts): ≤15MB
  - SDKs de terceros: ≤10MB total
- Battery: ≤2% drain por hora de uso activo; ≤0.1% por hora en background

PROCESO DE EVALUACIÓN:
1. Para cada SDK/librería recomendada:
   - ¿Cuánto agrega al app size? (>2MB requiere justificación)
   - ¿Cuánto agrega al cold start? (>100ms requiere justificación)
   - ¿Cuánta memoria consume en idle? (>10MB requiere justificación)
   - ¿Tiene background processing? (wake locks = battery drain)

2. Para cada feature arquitectónica:
   - ¿La modularización agrega overhead de startup? (lazy loading mitiga)
   - ¿El state management introduce memory leaks? (subscriptions sin dispose)
   - ¿El offline storage crece sin bound? (eviction policy obligatoria)

3. Budget accounting:
   - Mantener tabla acumulativa de budget consumed por componente
   - Si el total excede el 80% del presupuesto en cualquier dimensión, es WARNING
   - Si excede el 100%, es CRITICAL y requiere trade-off explícito

Si una recomendación excede el presupuesto, documentar qué se sacrifica y por qué el trade-off es aceptable.
```

---

## 3. Platform Parity Assessment (Evaluación de Paridad entre Plataformas)

**Propósito:** Para apps que existen en iOS y Android (o que se van a construir para ambas), evaluar sistemáticamente las diferencias de experiencia, funcionalidad, y calidad entre plataformas. Evitar el antipatrón de "Android es el ciudadano de segunda clase" (o viceversa).

```
Para cada sección del assessment, evaluar paridad entre iOS y Android:

DIMENSIÓN 1 — Feature parity:
- ¿Todas las features están disponibles en ambas plataformas?
- Si hay gaps, ¿están documentados y justificados? (ej: HealthKit solo existe en iOS)
- ¿Los gaps de features son decisiones conscientes o deuda técnica?
- Timeline para cerrar gaps injustificados

DIMENSIÓN 2 — UX parity:
- ¿La navegación sigue los patrones de cada plataforma? (tab bar iOS vs bottom nav Android, back gesture vs back button)
- ¿Los componentes nativos se sienten nativos? (date pickers, alerts, sheets)
- ¿La tipografía y spacing respetan las guidelines de cada plataforma? (SF Pro vs Roboto, 44pt touch targets iOS vs 48dp Android)
- ¿Las animaciones y transiciones son fluidas en ambas plataformas?

DIMENSIÓN 3 — Performance parity:
- Cold start: ¿diferencia >500ms entre plataformas? (flag como issue)
- Memory: ¿diferencia >30% entre plataformas? (probable memory leak en una)
- FPS: ¿ambas mantienen 60fps en los mismos flows? (jank en una = rendering issue)
- App size: ¿diferencia >20% sin justificación técnica?

DIMENSIÓN 4 — Quality parity:
- Crash-free rate: ¿diferencia >0.5% entre plataformas?
- Test coverage: ¿misma cobertura para iOS y Android?
- Release frequency: ¿una plataforma recibe updates con retraso?
- Bug backlog: ¿una plataforma acumula más bugs sin resolver?

DIMENSIÓN 5 — Compliance parity:
- ¿Privacy manifests están completos para iOS?
- ¿Data Safety section está completa para Android?
- ¿Target API level de Android está actualizado?
- ¿Minimum iOS version permite acceso al 95%+ del mercado target?

SCORING:
- Para cada dimensión, score 1-5 por plataforma
- Diferencia >1 punto en cualquier dimensión = remediation item
- Diferencia >2 puntos = critical parity gap

Documentar gaps de paridad en S9 (Remediation) con esfuerzo estimado para cerrar cada gap.
```

---

## 4. Store Compliance Gate (Gate de Compliance de Stores)

**Propósito:** Usar como gate obligatorio antes de recomendar cualquier release. Verificar que la app cumple todos los requisitos de Apple App Store y Google Play que pueden causar rechazo o removal. Un solo gap de compliance puede bloquear semanas de trabajo.

```
Antes de aprobar cualquier recomendación de release, ejecutar este gate:

GATE A — Apple App Store (blockers de rechazo):
□ Privacy manifest (PrivacyInfo.xcprivacy) presente y completo
□ Todos los SDKs de terceros tienen privacy manifests firmados
□ Required reason APIs declaradas con justificación válida
□ App Tracking Transparency implementado correctamente (si aplica)
□ In-app purchases usan StoreKit (no pagos externos sin entitlement)
□ No se usa UIWebView (deprecated, rechazado desde 2020)
□ Login con Apple implementado si hay login social
□ Minimum deployment target ≥ iOS 16 (recomendado iOS 17)
□ No hay APIs privadas en uso
□ Las screenshots en App Store Connect reflejan la UI actual
□ Privacy nutrition labels (App Privacy) son precisas y actualizadas

GATE B — Google Play (blockers de removal):
□ Target API level ≥ 35 (requerimiento 2025 para nuevas apps)
□ Data Safety section completa y precisa
□ Crash rate <1.09% (umbral de bad behavior)
□ ANR rate <0.47% (umbral de bad behavior)
□ No hay deceptive behavior (dark patterns, hidden functionality)
□ Permissions declarados con justificación en Data Safety
□ Foreground service types declarados correctamente (Android 14+)
□ Photo/video permissions migrados a photo picker (Android 14+)
□ No hay background location sin justificación aprobada
□ Families policy compliance (si la app es accesible a menores)

GATE C — Cross-platform (regulatorio):
□ GDPR consent flow implementado (si hay usuarios EU)
□ CCPA opt-out implementado (si hay usuarios California)
□ Age verification/gating implementado (si el contenido lo requiere)
□ Accessibility: contraste mínimo 4.5:1, touch targets ≥44pt/48dp
□ Localization completa para markets target

RESULTADO DEL GATE:
- PASS: Todos los items checked → release aprobado
- CONDITIONAL PASS: Items no-críticos pendientes → release con plan de remediación en <2 semanas
- FAIL: Cualquier blocker no-checked → release bloqueado hasta remediación

Para cada item que falla, documentar:
- Descripción del gap
- Riesgo (rechazo, removal, multa regulatoria)
- Esfuerzo de remediación (horas)
- Owner responsable
- Deadline

Este gate se ejecuta en S7 (Compliance) y sus resultados alimentan S9 (Remediation) como items de máxima prioridad.
```

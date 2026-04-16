# State of the Art — Design System v4

Tendencias, avances y dirección del ecosistema de design systems relevantes para el skill, período 2024–2026.

---

## 1. Design Tokens como Estándar W3C

**Estado:** El W3C Design Tokens Community Group (DTCG) avanzó su especificación de formato hacia *Candidate Recommendation* en 2025. El formato JSON con `$value`, `$type` y `$description` se consolida como el estándar interoperable.

**Impacto en el skill:**
- El skill ya usa CSS custom properties como target de tokens, alineado con la dirección del estándar.
- Oportunidad: migrar `brand-config.json` al formato DTCG para interoperabilidad con Figma Variables, Style Dictionary, y Tokens Studio.
- Herramientas como Style Dictionary 4.x y Cobalt UI generan tokens multi-plataforma (CSS, iOS, Android) desde un único source of truth.

**Señales:**
- Figma adoptó variables con resolución multi-modo (light/dark, brand A/brand B) en 2024.
- Tokens Studio alcanzó >500K usuarios en 2025 con sync nativo a GitHub.

---

## 2. AI-Assisted Design Systems (Figma AI, Design-to-Code)

**Estado:** La integración de IA en el flujo de diseño se aceleró significativamente. Figma AI (2024) genera componentes, sugiere variantes, y auto-documenta. GitHub Copilot y herramientas como v0 (Vercel) generan código de componentes desde descripciones naturales.

**Impacto en el skill:**
- El skill ya opera como generador AI de HTML con marca — está posicionado en esta tendencia.
- Oportunidad: integrar validación automática de tokens (¿el componente generado respeta el sistema?) como quality gate post-generación.
- Riesgo: generación AI sin constraints produce "design system drift" — componentes que parecen correctos pero violan tokens. El skill mitiga esto con reglas explícitas (nunca hex literals, siempre `var(--token)`).

**Señales:**
- Figma AI auto-sugiere componentes existentes del library antes de crear nuevos (reduce duplicación).
- Design-to-code pipelines (Anima, Locofy, Builder.io) maduran hacia producción en 2025.

---

## 3. Multi-Brand / White-Label Systems

**Estado:** Empresas con múltiples marcas o productos B2B2C adoptan arquitecturas de design system multi-tema. El patrón dominante: tokens en tres capas (global → brand → component) con theme switching vía CSS custom properties o design token sets.

**Impacto en el skill:**
- El skill ya soporta white-label via `brand-config.json` — cambiar marca = cambiar un archivo.
- Oportunidad: soportar múltiples `brand-config.json` simultáneos para comparación side-by-side o generación batch multi-marca.
- Referencia: Salesforce Lightning, Shopify Polaris, y IBM Carbon todos implementaron multi-theme en 2024-2025.

**Señales:**
- CSS `@layer` adoption permite cascada controlada entre brand tokens y component tokens.
- Container queries complementan media queries para componentes truly responsive al contexto.

---

## 4. Design System as Product (Internal Platform)

**Estado:** El modelo de "design system como producto interno" se consolidó. Equipos dedicados con product owner, roadmap, métricas de adopción (component coverage, token compliance), y versioning semántico.

**Impacto en el skill:**
- El skill funciona como el "design system product" para deliverables de discovery MetodologIA.
- Métricas relevantes: % de deliverables que pasan validación, tiempo medio de generación, número de componentes reutilizados.
- Governance: el `operations-guide.md` ya define acceptance criteria y extension protocol.

**Señales:**
- zeroheight, Supernova, y Knapsack dominan como plataformas de documentación de design systems.
- Design system health dashboards (component usage, deprecation tracking) se vuelven estándar en equipos >50 devs.
- InnerSource model: equipos consumidores contribuyen componentes al sistema central.

---

## 5. Accessibility Automation (axe-core, Lighthouse CI)

**Estado:** La accesibilidad pasó de auditoría manual a pipeline automatizado. axe-core 4.x detecta >80% de issues WCAG programáticamente. Lighthouse CI integra scoring de accesibilidad en cada PR/deploy.

**Impacto en el skill:**
- El skill implementa WCAG AA estático (contrast ratios, skip link, focus states, ARIA labels).
- Oportunidad: integrar `validate_html.sh` con axe-core para detección automática de regresiones de accesibilidad.
- La European Accessibility Act (EAA) entra en vigor en junio 2025, haciendo accesibilidad un requisito legal en la UE.

**Señales:**
- axe-core + Playwright = testing de accesibilidad end-to-end en CI/CD.
- WCAG 3.0 (Silver) en desarrollo: modelo de scoring continuo vs. pass/fail binario.
- Color contrast algorithms evolucionan: APCA (Advanced Perceptual Contrast Algorithm) como alternativa al ratio clásico.

---

## 6. Micro-Frontend Design System Integration

**Estado:** Arquitecturas micro-frontend requieren design systems que funcionen como paquetes independientes importables por cada micro-app. Web Components, Module Federation (webpack 5 / Rspack), y CSS-in-JS con scope isolation son los patrones dominantes.

**Impacto en el skill:**
- El skill genera HTML monolítico (deliverables completos), no micro-frontends. Pero los patrones de token distribution y scope isolation son relevantes.
- Oportunidad: exportar tokens como paquete NPM o CSS module para equipos que consumen el design system fuera de deliverables HTML.
- El patrón de CSS custom properties en `:root` que usa el skill es compatible con micro-frontend consumption.

**Señales:**
- Web Components + design tokens = componentes portables cross-framework (Lit, Stencil, Shoelace).
- Module Federation 2.0 permite shared design system chunks entre micro-apps.
- CSS `@scope` (Chromium 2024) permite scoping nativo sin Shadow DOM.

---

## Horizonte 2026+

| Tendencia Emergente | Madurez | Relevancia para el Skill |
|---------------------|---------|--------------------------|
| WCAG 3.0 (Silver) con scoring continuo | Draft | Alta — cambiará cómo se mide compliance |
| CSS Anchor Positioning | Shipping | Media — tooltips y popovers sin JS |
| View Transitions API | Shipping | Baja — el skill genera documentos estáticos |
| Design tokens in CSS nativo (`@property`) | Stable | Alta — typing y animación de tokens |
| AI-generated component variants | Emergente | Alta — generación automática de variantes responsive |
| Accessibility overlays regulados/prohibidos | Legislación activa | Media — confirma que accesibilidad debe ser nativa, no overlay |

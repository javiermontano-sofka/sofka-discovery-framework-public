# State of the Art — Design System & Visual Identity (2024-2026)

## Tendencia 1: Design Tokens as Code
Los design tokens migran de documentos estáticos a código versionado: JSON/YAML tokens que compilan a CSS custom properties, iOS Swift, Android XML. Cambios de design system se propagan automáticamente a todos los outputs. [PLAN]

## Tendencia 2: AI-Generated Component Variants
Herramientas como Figma AI y V0 by Vercel generan variantes de componentes a partir de prompts. Un PM puede describir un KPI card y obtener HTML/CSS listo para usar, respetando el design system configurado. [INFERENCIA]

## Tendencia 3: Dark Mode como Estándar
Todos los design systems modernos incluyen dark mode como first-class citizen. Tokens semánticos (--color-surface vs --color-surface-dark) permiten switch automático sin rediseñar componentes. [PLAN]

## Tendencia 4: Micro-Animations para Data Storytelling
Transiciones sutiles en charts, counters que se animan al cargar, progress bars con easing functions. Mejoran la comprensión de datos sin añadir complejidad cognitiva. APEX puede beneficiarse en dashboards HTML. [INFERENCIA]

## Tendencia 5: Inclusive Design Beyond A11y
Diseño que va más allá de WCAG: consideración de neurodiversidad (reducir cognitive load), low-bandwidth contexts (versiones ligeras), y cultural sensitivity en paletas de color y iconografía. [SUPUESTO]

## Implicaciones para PMO-APEX

| Tendencia | Impacto en APEX | Acción Recomendada |
|-----------|-----------------|-------------------|
| Tokens as code | Tokens versionados y compilables | Mantener tokens.json como source of truth |
| AI components | Generación rápida de variants | Crear prompt library para component generation |
| Dark mode | Soporte dual-theme | Definir tokens semánticos light/dark |
| Micro-animations | Dashboards más efectivos | CSS animations en HTML deliverables |
| Inclusive design | Reach más amplio | Audit contra neurodiversity guidelines |

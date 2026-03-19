# Use Case Prompts — Design System & Visual Identity

## Caso de Uso 1: Generación de Token Reference Completo

**Contexto**: Nuevo proyecto APEX necesita la referencia completa de tokens CSS para comenzar a producir entregables con branding correcto.

**Prompt Template**:
```
Genera la referencia completa de design tokens APEX para el proyecto {proyecto}:
- Color tokens: primary, secondary, accent, danger, dark, surface, border, text, muted
- Typography: font family, sizes (H1-H4, body, small, caption), weights, line heights
- Spacing: escala 4px base (space-1 through space-12)
- Shadows: elevation levels (card, dropdown, modal)
- Border radius: small (4px), medium (8px), large (12px), pill (9999px)
- Formato: CSS custom properties (:root block)
- Incluir: dark mode variants
```

**Output Esperado**: Bloque CSS :root con todos los tokens definidos, más bloque @media (prefers-color-scheme: dark).

## Caso de Uso 2: Librería de Componentes PM

**Contexto**: Se necesitan componentes HTML reutilizables para dashboards y reportes APEX.

**Prompt Template**:
```
Crea la librería de componentes PM para APEX usando los design tokens canónicos:
- RAG Card: Blue/Amber/Red status con icono, título, y descripción
- KPI Card: valor numérico, trend arrow, comparación vs target
- Risk Heatmap Cell: 5×5 matrix con color gradient
- Milestone Badge: completed/at-risk/overdue states
- Evidence Tag: [PLAN], [METRIC], [SUPUESTO], etc. con color coding
- Budget Burn Bar: actual vs planned con porcentaje
- Cada componente: HTML + CSS usando solo APEX tokens
```

**Output Esperado**: HTML + CSS para cada componente, copy-pasteable, usando CSS custom properties APEX.

## Caso de Uso 3: Auditoría de Accesibilidad del Design System

**Contexto**: Verificar que todas las combinaciones de color del design system cumplen WCAG AA.

**Prompt Template**:
```
Ejecuta auditoría de accesibilidad WCAG 2.1 AA sobre el design system APEX:
- Verificar: contraste de cada color de texto contra cada background posible
- Calcular: ratio de contraste para cada combinación
- Clasificar: Pass AA, Pass AAA, Fail
- Identificar: combinaciones que fallan y proponer ajustes
- Verificar: componentes no usan color como único indicador
- Output: Tabla de contrast ratios + lista de fails + correcciones propuestas
```

**Output Esperado**: Tabla exhaustiva de combinaciones con ratios, flag de fails, y paleta ajustada para cumplimiento.

## Caso de Uso 4: Override Layer para Branding de Cliente

**Contexto**: Cliente requiere que los entregables usen sus colores corporativos en lugar de APEX defaults.

**Prompt Template**:
```
Genera override layer de design tokens para el cliente {cliente}:
- Colores del cliente: primary={hex}, secondary={hex}, accent={hex}
- Preservar: estructura APEX (spacing, typography, components)
- Override: solo color tokens, manteniendo semántica
- Verificar: nuevos colores cumplen WCAG AA
- Si no cumplen: proponer ajustes al cliente con justificación
- Output: CSS override file + accessibility report + side-by-side comparison
```

**Output Esperado**: Archivo CSS con overrides, reporte de accesibilidad, y comparación visual APEX vs. cliente.

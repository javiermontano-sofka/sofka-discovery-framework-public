# PPTX Output Specification — AS-IS Technical Analysis

> Spec para generar la versión PowerPoint del AS-IS (variante ejecutiva para steering committee).

---

## Cuándo Producir PPTX

- Cuando `{FORMATO}=pptx` o el usuario solicita presentación para steering committee
- Solo aplica a la **variante ejecutiva** (S0 + S5 + S9 + S10)
- El full 10-section NUNCA se entrega en PPTX (demasiado denso)

## Estructura de Slides

### Slide 1: Portada
- Logo MetodologIA (esquina superior derecha)
- Título: "Análisis Técnico AS-IS — {NOMBRE_PROYECTO}"
- Subtítulo: "Evaluación del Estado Actual"
- Fecha y nombre del cliente
- Color de fondo: #1A1A2E

### Slide 2: Health Score (S0)
- Indicador circular grande (1-10) con color semáforo
- 4 métricas clave en cards: LOC, Módulos, Dependencias, Años en producción
- Tech stack en una línea visual
- Layout: indicador central, métricas en la parte inferior

### Slide 3: Top 5 Hallazgos
- 5 cards con ícono de severidad (🔴🟡🟢)
- Cada card: título + impacto de negocio en 1 línea
- Sin detalles técnicos — solo "so what?" de negocio
- Layout: 5 rows, icono + titulo + impacto

### Slide 4: Deuda Técnica (S5)
- Gráfico de barras horizontal: top 5 items de deuda por prioridad
- Cada barra coloreada por categoría (design/code/test/infra/dependency)
- Eje X: esfuerzo de remediación (eng-days)
- Nota al pie: tech debt ratio %

### Slide 5: NFR Heatmap (S6)
- Radar chart con 7 dimensiones
- Línea actual (naranja #6366F1) vs target (amarillo #22D3EE)
- Tabla debajo: dimensión | score actual | target | gap
- Layout: chart arriba, tabla abajo

### Slide 6: Risk Heatmap (S9)
- Matriz 5×5 de probabilidad × impacto
- Top 5 riesgos posicionados en la matriz con números
- Leyenda: riesgo # | descripción | mitigation en 1 línea
- Colores: rojo (critical), naranja (high), amarillo (medium), verde (low)

### Slide 7: Recomendaciones (S10)
- 2 columnas: Quick Wins (izquierda) | Strategic (derecha)
- Quick Wins: 3-5 items, cada uno < 5 eng-days, impacto inmediato
- Strategic: 3-5 items con timeline (corto/medio/largo plazo)
- Cada item: título + esfuerzo + impacto esperado

### Slide 8: Próximos Pasos
- 3 decisiones que necesitamos del comité
- Timeline propuesto para Phase 2 (Flow Mapping)
- Call to action claro
- Contacto del equipo de delivery

### Slide 9: Anexo — Architecture Overview (opcional)
- C4 Context diagram (simplificado para no-técnicos)
- Leyenda de colores y sistemas

## Reglas de Diseño

| Elemento | Especificación |
|---|---|
| **Font headings** | Clash Grotesk Bold, 28pt |
| **Font body** | Inter Regular, 16pt |
| **Primary color** | #6366F1 |
| **Dark background** | #1A1A2E |
| **Success indicator** | #22D3EE (NUNCA verde) |
| **Error indicator** | #DC2626 |
| **Max texto por slide** | 6 líneas + visual |
| **Diagrams** | Mermaid renderizado como imagen PNG |

## Producción

Como Claude Code no puede generar archivos .pptx directamente, el output es:
1. Un markdown con la estructura slide-by-slide (este spec)
2. Speaker notes para cada slide
3. Los datos para cada visual (tablas, métricas, scores)
4. Diagramas Mermaid renderizables

El equipo de delivery usa esta spec + una plantilla .pptx de MetodologIA para producir la presentación final.

---

**Autor:** Javier Montaño | **Última actualización:** 12 de marzo de 2026

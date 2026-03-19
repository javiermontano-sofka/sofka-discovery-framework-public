# Metaprompts — Design System & Visual Identity

## Metaprompt 1: Generador de Componentes APEX

**Propósito**: Generar cualquier componente PM siguiendo el design system APEX.

```
Eres un design system engineer especializado en componentes PM. Dado el siguiente requerimiento de componente "{componente}":

1. Identifica el propósito del componente en contexto de gestión de proyectos
2. Define la estructura HTML semántica (usar elementos apropiados, no divs genéricos)
3. Aplica EXCLUSIVAMENTE tokens APEX (--apex-primary, --apex-accent, etc.) — NUNCA hardcode colores
4. Implementa estados: default, hover, active, disabled (si aplica)
5. Implementa variantes: Blue (healthy), Amber (warning), Red (critical) donde aplique
6. Verifica accesibilidad: roles ARIA, contraste, keyboard navigation
7. Genera código HTML + CSS limpio, documentado, copy-pasteable

Reglas duras:
- NUNCA usar verde — usar azul para estados positivos
- NUNCA hardcode colores — solo CSS custom properties
- SIEMPRE incluir focus styles para keyboard navigation
- Font: Inter con fallbacks system
```

## Metaprompt 2: Auditor de Consistencia Visual

**Propósito**: Verificar que un entregable cumple con el design system APEX.

```
Eres un auditor de consistencia visual APEX. Dado el siguiente entregable HTML/Markdown {entregable}:

1. **Colores**: ¿Usa exclusivamente tokens APEX? ¿Hay colores hardcodeados? ¿Usa verde (prohibido)?
2. **Typography**: ¿Font es Inter? ¿Tamaños siguen la escala definida? ¿Weights correctos?
3. **Spacing**: ¿Padding/margin siguen la escala 4px? ¿Consistente entre secciones?
4. **Componentes**: ¿Usa componentes estándar APEX o inventa nuevos sin necesidad?
5. **RAG system**: ¿Blue/Amber/Red en lugar de Green/Yellow/Red?
6. **Accessibility**: ¿Contraste cumple AA? ¿Alt text en imágenes? ¿Heading hierarchy correcta?
7. Genera report card con score por categoría (0-100)

Compliance Score = promedio de categorías. Target: ≥90%.
Etiqueta: [PLAN] para cumplimientos, [METRIC] para scores, issues como correcciones.
```

## Metaprompt 3: Token Migration Assistant

**Propósito**: Migrar entregables existentes de colores hardcodeados a tokens APEX.

```
Eres un migration specialist de design systems. Dado un entregable con colores hardcodeados {entregable}:

1. Escanea todos los valores de color (hex, rgb, named colors)
2. Para cada color encontrado, identifica el token APEX equivalente más cercano
3. Si el color es verde: reemplazar con --apex-primary (azul)
4. Si no hay equivalente exacto: proponer el token más cercano con justificación
5. Genera versión migrada del entregable usando solo tokens APEX
6. Genera diff mostrando cada reemplazo realizado
7. Verifica que el resultado mantiene legibilidad y cumple WCAG AA

Output: Entregable migrado + diff de cambios + accessibility check post-migration.
```

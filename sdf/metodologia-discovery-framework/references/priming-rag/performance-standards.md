# Estándares de Performance Web (v1.0.0)

Guía técnica para asegurar tiempos de carga rápidos (`TBT < 300ms`, `LCP < 2.5s`) y optimización de recursos en `site-metodologia`.

## 1. Fuentes (Typography)

### 1.1 Selección de Pesos
Limitar estrictamente los pesos de fuentes importados para reducir el payload.

| Fuente | Pesos Permitidos | Uso |
| :--- | :--- | :--- |
| **Poppins** | 400, 500, 600, 700 | Títulos, Botones, UI |
| **Montserrat** | 300, 400, 500 | Párrafos, Textos largos |

**Total máximo:** 7 variantes.

### 1.2 Estrategia de Carga (`<head>`)
1.  **Preconnect**: Establecer conexión temprana con Google Fonts.
2.  **Display Swap**: Evitar texto invisible durante la carga.

```html
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500&family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
```

## 2. Iconografía (SVG)

### 2.1 Cero Scripts Externos
**PROHIBIDO:** Usar `lucide.js` o librerías de iconos via CDN que requieran parseo en cliente.

**ESTÁNDAR:**
1.  **SVG Inline**: Para iconos críticos en el `above-the-fold` (LCP).
2.  **Sistema JS Local (`js/icons.js`)**: Para iconos dinámicos o repetitivos fuera del viewport inicial.

## 3. Scripts y Dependencias

### 3.1 Limpieza
Mantener el `<head>` libre de blocking scripts. HTML y CSS deben renderizar el sitio visualmente completo antes de que ejecute cualquier JS.

### 3.2 Snippets Prohibidos
- No usar `unpkg` para librerías triviales.
- No usar jQuery u otros frameworks pesados innecesarios.

## 4. Imágenes y Media

### 4.1 Formatos
- Usar **WebP** o **SVG** siempre que sea posible.
- **Lazy Loading**: `loading="lazy"` en todas las imágenes que no estén en el viewport inicial.

### 4.2 Dimensiones
Siempre especificar `width` y `height` explícitos para evitar *Cumulative Layout Shift (CLS)*.

```html
<img src="logo.svg" width="40" height="40" alt="Logo" loading="lazy">
```

# HTML Ebook Patterns — Structure and CSS

## HTML5 Base Structure

```html
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>{Asignatura} {Grado} — Ebook</title>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
  <style>
    /* All CSS inline — self-contained */
  </style>
</head>
<body>
  <nav id="sidebar"><!-- TOC --></nav>
  <main id="content"><!-- Units --></main>
  <footer><!-- Branding --></footer>
  <script>
    /* Minimal JS — dark mode, collapsible, progress */
  </script>
</body>
</html>
```

## CSS Variables (from brand-config.json)

```css
:root {
  --primary: #6366F1;
  --accent: #22D3EE;
  --bg: #EFEAE4;
  --text: #1E293B;
  --surface: #FFFFFF;
  --border: #E2E8F0;
  --font-body: 'Inter', sans-serif;
  --font-heading: 'Inter', sans-serif;
  --radius: 8px;
  --shadow: 0 2px 8px rgba(0,0,0,0.08);
}

[data-theme="dark"] {
  --bg: #1A1A2E;
  --text: #E2E8F0;
  --surface: #16213E;
  --border: #334155;
}
```

## Navigation Sidebar Pattern

```html
<nav id="sidebar">
  <div class="sidebar-header">
    <h2>{Asignatura}</h2>
    <button id="theme-toggle" aria-label="Toggle dark mode">
  </div>
  <ul class="toc">
    <li><a href="#unit-1">Unidad 1: {Title}</a></li>
    <li><a href="#unit-2">Unidad 2: {Title}</a></li>
  </ul>
  <div class="progress-bar">
    <div class="progress-fill" id="progress"></div>
  </div>
</nav>
```

## Collapsible Section Pattern

```html
<details class="phase">
  <summary>
    <span class="phase-icon">icon</span>
    Experiencia Concreta
  </summary>
  <div class="phase-content">
    <!-- Activities, content -->
  </div>
</details>
```

## Activity Visual Differentiation

```css
.activity[data-type="individual"] {
  border-left: 4px solid var(--primary);
}
.activity[data-type="grupal"] {
  border-left: 4px solid var(--accent);
}
.activity[data-type="cooperativa"] {
  border-left: 4px solid #22C55E;
}
```

## DZ-Ref Badge Pattern

```html
<span class="dz-badge" title="Destreza: {description}">
  DZ-{code}
</span>
```

```css
.dz-badge {
  display: inline-block;
  background: var(--primary);
  color: white;
  font-size: 0.7rem;
  padding: 2px 6px;
  border-radius: 10px;
  cursor: help;
  vertical-align: super;
}
```

## Responsive Breakpoints

| Breakpoint | Layout |
|-----------|--------|
| <768px | Sidebar hidden, hamburger toggle, full-width content |
| 768px-1024px | Sidebar collapsed (icons only), content with margins |
| >1024px | Sidebar visible (240px), content centered (max 800px) |

## Print Mode

```css
@media print {
  #sidebar, #theme-toggle, .progress-bar { display: none; }
  details { open; }  /* Expand all sections */
  details[open] summary { page-break-after: avoid; }
  .phase-content { display: block !important; }
  body { font-size: 10pt; color: black; background: white; }
}
```

## Accessibility Checklist

- [ ] All interactive elements have aria-labels
- [ ] Color contrast meets WCAG AA (4.5:1 for text, 3:1 for large text)
- [ ] Keyboard navigation functional (Tab, Enter, Escape)
- [ ] Focus indicators visible
- [ ] Skip-to-content link present
- [ ] Images have alt text
- [ ] Tables have caption and th scope attributes

## Performance Budget

| Metric | Target | Max |
|--------|--------|-----|
| File size | <500KB | <1MB |
| DOM elements | <5000 | <10000 |
| Inline JS | <10KB | <20KB |
| First paint | <1s | <2s |

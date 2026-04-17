# Sofka Design System v5 — Reference

Canonical tokens and components used by `brand-html-render`.

## Color tokens

```css
--o:#FF7E08    /* naranja primario — acento, hero, énfasis */
--ol:#FF9E42   /* naranja claro — hover, links inline */
--od:#CC6506   /* naranja oscuro — texto sobre fondo claro */
--odm:rgba(255,126,8,.1)  /* naranja matte — row hover */
--bk:#000      /* negro — hero, footer, verdicts */
--wh:#FFF
--bg:#EFEAE4   /* fondo principal (warm gray) */
--pos:#FFD700  /* dorado = success/high confidence */
--warn:#D97706 /* warning */
--crit:#DC2626 /* crítico */
--info:#2563EB /* info */
--violet:#9747FF
--teal:#06C8C8
--g50..g900    /* escala neutros */
```

> **Regla brand**: verde PROHIBIDO. Usar `--pos` (dorado) para success.

## Componentes

| Clase | Rol |
|-------|-----|
| `.hero` | banner negro con borde inferior naranja 8px |
| `.nav` | sticky nav blanco con underlines naranjas |
| `.sh + .sn + .st2` | section header con número en cuadro negro |
| `.qb` | blockquote naranja (citas de stakeholder) |
| `.card + .cl` | tarjeta con etiqueta uppercase |
| `.expert-a/b/c/rc` + `.dot-a/b/c/rc` | cards de experto con top-border + dot coloreado |
| `.co / .co-i/.co-w/.co-c/.co-p` | callouts (info/warn/crit/positive) con border-left |
| `.tw + table` | tabla en wrapper scrollable, th=gris700 |
| `.t td/.t ta/.t tx/.t ti/.t ts` | evidence pills (CÓDIGO/STAKEHOLDER/ADJUNTO/INFERENCIA/SUPUESTO) |
| `.verdict` | bloque negro con borde naranja — veredicto final |
| `.g2 / .g3` | grids 2/3 columnas (colapsan @768px) |
| `.conf-h/.conf-m` | confidence pills |
| `.meta-box` | metadata de razonamiento (fondo g50) |
| `.ft` | footer negro con borde superior naranja 6px |

## Tipografía

- Familia: `Inter` (Google Fonts)
- Base: 1rem / 1.65 line-height
- H1 hero: clamp(1.4rem, 3vw, 2.2rem)
- H2 section: 1.35rem
- H3 subsection: .92rem con borde inferior g200
- Body: .86rem

## Accesibilidad

- `*:focus-visible { outline: 2px solid var(--o) }`
- Skip link oculto salvo focus
- Print styles quitan nav y sombras
- Responsive @768px grids colapsan

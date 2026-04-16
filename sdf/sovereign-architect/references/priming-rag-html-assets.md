# HTML Assets — RAG Priming Index

> **TL;DR**: Documentation of SA's interactive HTML assets — landing page and prompt library — with JM Labs branding tokens and capabilities.

## Purpose

This RAG file documents the interactive HTML assets that SA can generate and maintain. These assets provide visual, browser-based interfaces for navigating the plugin's capabilities.

---

## Interactive Assets

### landing.html — Plugin Landing Page

An interactive single-page HTML document that presents the SA ecosystem visually.

**Capabilities**:
- Hero section with SA identity and version
- Component census (agents, skills, commands counts)
- Movement cards (CREATE, REVIEW, EVOLVE, REPAIR)
- Phase workflow visualization (5 phases + 4 gates)
- Agent tier visualization (Triad → Core → Specialists)
- Quick-start command reference
- Responsive design (mobile → desktop)
- Dark mode support via `prefers-color-scheme`

**Sections**:
1. Hero with tagline and version
2. Quick Start commands
3. The 4 Movements (interactive cards)
4. The 5 Phases (workflow diagram)
5. Agent Roster (collapsible by tier)
6. Skills by Movement (filterable)
7. Quality Gates summary
8. Footer with branding

### prompt-library.html — Searchable Prompt Catalog

An interactive catalog of all prompts across SA skills, searchable and filterable.

**Capabilities**:
- Full-text search across prompt titles and descriptions
- Filter by movement (Discovery, Diagnosis, Design, Planning)
- Filter by agent owner
- Copy-to-clipboard for each prompt
- Prompt metadata (skill, agent, use case tags)
- Responsive card layout

**Data Structure per Prompt**:
```
{
  "title": "Security Threat Model",
  "skill": "security-threat-modeler",
  "agent": "security-specialist",
  "movement": "Diagnosis",
  "tags": ["security", "STRIDE", "threat-modeling"],
  "prompt": "Analyze the attack surface of..."
}
```

---

## JM Labs Branding Tokens

SA uses the JM Labs brand identity for all visual assets:

### Colors

| Token | Value | Usage |
|-------|-------|-------|
| `--jm-primary` | `#6366F1` | Primary indigo — headers, CTAs |
| `--jm-primary-dark` | `#4F46E5` | Hover states, active elements |
| `--jm-primary-light` | `#A5B4FC` | Backgrounds, subtle accents |
| `--jm-secondary` | `#F59E0B` | Amber accent — highlights, badges |
| `--jm-bg` | `#0F172A` | Dark background (slate-900) |
| `--jm-bg-card` | `#1E293B` | Card background (slate-800) |
| `--jm-bg-light` | `#F8FAFC` | Light mode background |
| `--jm-text` | `#F1F5F9` | Primary text on dark |
| `--jm-text-muted` | `#94A3B8` | Secondary text (slate-400) |
| `--jm-text-dark` | `#1E293B` | Primary text on light |
| `--jm-success` | `#10B981` | Success states, passed gates |
| `--jm-warning` | `#F59E0B` | Warning states, assumptions |
| `--jm-error` | `#EF4444` | Error states, critical risks |
| `--jm-info` | `#3B82F6` | Info states, evidence tags |

### Typography

| Token | Value | Usage |
|-------|-------|-------|
| `--jm-font-sans` | `'Inter', system-ui, sans-serif` | Body text |
| `--jm-font-mono` | `'JetBrains Mono', 'Fira Code', monospace` | Code, commands |
| `--jm-font-size-base` | `16px` | Body text |
| `--jm-font-size-sm` | `14px` | Captions, metadata |
| `--jm-font-size-lg` | `20px` | Section headers |
| `--jm-font-size-xl` | `28px` | Page headers |
| `--jm-font-size-hero` | `48px` | Hero title |

### Spacing and Layout

| Token | Value | Usage |
|-------|-------|-------|
| `--jm-radius` | `8px` | Card corners |
| `--jm-radius-lg` | `16px` | Section containers |
| `--jm-shadow` | `0 4px 6px -1px rgba(0,0,0,0.1)` | Card shadows |
| `--jm-max-width` | `1200px` | Content container |
| `--jm-gap` | `24px` | Grid gap |

### Movement Colors

| Movement | Color | Token |
|----------|-------|-------|
| CREATE | Green | `--jm-create: #10B981` |
| REVIEW | Blue | `--jm-review: #3B82F6` |
| EVOLVE | Purple | `--jm-evolve: #8B5CF6` |
| REPAIR | Red | `--jm-repair: #EF4444` |

---

## Generation Guidelines

When generating HTML assets:
1. Use semantic HTML5 elements
2. Include all CSS inline (single-file distribution)
3. Use CSS custom properties for all tokens
4. Ensure WCAG 2.1 AA contrast ratios
5. Support both dark and light modes
6. Include print-friendly styles
7. No external dependencies (CDN-free)

---

*Sovereign Architect — Visual interfaces for technical depth.*
*JM Labs · Javier Montano.*

# Handover Templates & Formats

## Template 1: Resumen Ejecutivo de Transición

```
┌──────────────────────────────────────────────────────────────┐
│  RESUMEN EJECUTIVO DE TRANSICIÓN                             │
│  Discovery: {Nombre del Proyecto}                            │
│  Cliente: {Nombre del Cliente}                               │
│  Fecha de Cierre: {DD/MM/YYYY}                               │
├──────────────────────────────────────────────────────────────┤
│                                                              │
│  ESTADO DEL DESCUBRIMIENTO                                   │
│  ┌──────────┐ ┌──────────┐ ┌──────────┐ ┌──────────┐       │
│  │ Phase 0  │→│ Phase 1  │→│ Phase 2  │→│ Phase 3  │       │
│  │ ✅ Done  │ │ ✅ Done  │ │ ✅ Done  │ │ ✅ Done  │       │
│  └──────────┘ └──────────┘ └──────────┘ └──────────┘       │
│       ↓ [GATE 1: ✅ Aprobado {fecha}]                       │
│  ┌──────────┐      ┌──────────┐ ┌──────────┐               │
│  │ Phase 4  │  →   │ Phase 5a │ │ Phase 5b │               │
│  │ ✅ Done  │      │ ✅ Done  │ │ ✅ Done  │               │
│  └──────────┘      └──────────┘ └──────────┘               │
│       ↓ [GATE 2: ✅ Aprobado {fecha}]                       │
│       ↓ [GATE 3: ✅ Aprobado {fecha}]                       │
│                                                              │
│  ESCENARIO APROBADO: {Nombre}                                │
│  Score: {X.X}/5.0 | Inversión: ${X,XXX,XXX}                 │
│  Timeline: {XX} meses | Equipo: {N} FTE                     │
│                                                              │
│  PRÓXIMOS PASOS INMEDIATOS                                   │
│  1. {Acción} — Owner: {Nombre} — Deadline: {fecha}          │
│  2. {Acción} — Owner: {Nombre} — Deadline: {fecha}          │
│  3. {Acción} — Owner: {Nombre} — Deadline: {fecha}          │
│                                                              │
│  RIESGOS CRÍTICOS ACTIVOS                                    │
│  🔴 {Riesgo 1}: {mitigación} — Owner: {Nombre}              │
│  🟡 {Riesgo 2}: {mitigación} — Owner: {Nombre}              │
│  🟡 {Riesgo 3}: {mitigación} — Owner: {Nombre}              │
└──────────────────────────────────────────────────────────────┘
```

---

## Template 2: Pricing Structure

```html
<table class="pricing-table">
  <thead>
    <tr>
      <th>Fase</th>
      <th>Duración</th>
      <th>Equipo</th>
      <th>Inversión</th>
      <th>Gate</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><strong>Foundation</strong></td>
      <td>{X} meses</td>
      <td>{N} FTE</td>
      <td>${XXX,XXX}</td>
      <td>Go/No-Go → Build</td>
    </tr>
    <tr>
      <td><strong>Build</strong></td>
      <td>{X} meses</td>
      <td>{N} FTE</td>
      <td>${XXX,XXX}</td>
      <td>Go/No-Go → Integrate</td>
    </tr>
    <tr>
      <td><strong>Integrate</strong></td>
      <td>{X} meses</td>
      <td>{N} FTE</td>
      <td>${XXX,XXX}</td>
      <td>Go/No-Go → Optimize</td>
    </tr>
    <tr>
      <td><strong>Optimize</strong></td>
      <td>{X} meses</td>
      <td>{N} FTE</td>
      <td>${XXX,XXX}</td>
      <td>Go/No-Go → Scale</td>
    </tr>
    <tr>
      <td><strong>Scale</strong></td>
      <td>{X} meses</td>
      <td>{N} FTE</td>
      <td>${XXX,XXX}</td>
      <td>Cierre</td>
    </tr>
    <tr class="total-row">
      <td><strong>TOTAL</strong></td>
      <td><strong>{XX} meses</strong></td>
      <td></td>
      <td><strong>${X,XXX,XXX}</strong></td>
      <td></td>
    </tr>
    <tr class="contingency-row">
      <td colspan="3">Contingencia ({XX}%)</td>
      <td>${XXX,XXX}</td>
      <td></td>
    </tr>
  </tbody>
</table>
```

---

## Template 3: Operations Readiness Checklist

```html
<div class="readiness-section">
  <h3>Equipo</h3>
  <table>
    <tr><th>Rol</th><th>Qty</th><th>Status</th><th>Owner Contratación</th><th>Deadline</th></tr>
    <tr>
      <td>{Rol}</td><td>{N}</td>
      <td><span class="status-pending">⏳ Pendiente</span></td>
      <td>{Nombre}</td><td>{Fecha}</td>
    </tr>
  </table>

  <h3>Infraestructura</h3>
  <table>
    <tr><th>Componente</th><th>Spec</th><th>Status</th><th>Owner</th><th>Deadline</th></tr>
    <tr>
      <td>{Componente}</td><td>{Spec}</td>
      <td><span class="status-ready">✅ Listo</span></td>
      <td>{Nombre}</td><td>{Fecha}</td>
    </tr>
  </table>

  <h3>Accesos y Permisos</h3>
  <ul class="checklist">
    <li><input type="checkbox"> Repositorios de código — Owner: {Nombre}</li>
    <li><input type="checkbox"> Ambientes dev/staging/prod — Owner: {Nombre}</li>
    <li><input type="checkbox"> CI/CD pipeline — Owner: {Nombre}</li>
    <li><input type="checkbox"> Acceso a datos y APIs — Owner: {Nombre}</li>
    <li><input type="checkbox"> VPN / acceso remoto — Owner: {Nombre}</li>
    <li><input type="checkbox"> Herramientas (JIRA/Linear, Slack, Confluence) — Owner: {Nombre}</li>
  </ul>
</div>
```

---

## Template 4: Plan de 90 Días (Gantt Simplificado)

```
Semana  1  2  3  4  5  6  7  8  9  10  11  12  13  14
        ├──Sprint 0──┤
        │  Setup     │
        │  Onboard   │
        │  Ambientes │
        │  Spike     │
                     ├────Sprint 1────┤
                     │  MVP Module #1 │
                     │  Use Cases 1-3 │
                                      ├────Sprint 2────┤
                                      │  MVP Module #2 │
                                      │  Integration   │
                                                       ├────Sprint 3────┤
                                                       │  MVP Module #3 │
                                                       │  Perf Testing  │
                                                                        ├──S4──┤
                                                                        │ Gate │
        ├── Foundation Phase ─────────────────────────────────────────────┤
```

---

## Template 5: Governance Transition Matrix

```html
<table class="governance-matrix">
  <thead>
    <tr>
      <th>Rol Discovery</th>
      <th>→</th>
      <th>Rol Ejecución</th>
      <th>Nuevo Responsable</th>
      <th>Knowledge Transfer</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Discovery Conductor</td>
      <td>→</td>
      <td>PMO Lead / Scrum Master</td>
      <td>{Asignar}</td>
      <td>Sesión 2h: pipeline, gates, riesgos</td>
    </tr>
    <tr>
      <td>Technical Architect</td>
      <td>→</td>
      <td>Solution Architect</td>
      <td>{Mismo o nuevo}</td>
      <td>Sesión 4h: C4, ADRs, tech debt</td>
    </tr>
    <tr>
      <td>Domain Analyst</td>
      <td>→</td>
      <td>Product Owner / BA</td>
      <td>{Asignar}</td>
      <td>Sesión 3h: flujos, reglas de negocio</td>
    </tr>
    <tr>
      <td>Quality Guardian</td>
      <td>→</td>
      <td>QA Lead</td>
      <td>{Asignar}</td>
      <td>Sesión 2h: criterios, NFRs, gates</td>
    </tr>
    <tr>
      <td>Delivery Manager</td>
      <td>→</td>
      <td>Project / Eng Manager</td>
      <td>{Mismo o nuevo}</td>
      <td>Sesión 2h: roadmap, budget, risks</td>
    </tr>
    <tr>
      <td>Data Strategist</td>
      <td>→</td>
      <td>Data Architect</td>
      <td>{Mismo o nuevo}</td>
      <td>Sesión 2h: modelo datos, governance</td>
    </tr>
    <tr>
      <td>Change Catalyst</td>
      <td>→</td>
      <td>Change Manager</td>
      <td>{Asignar}</td>
      <td>Sesión 2h: stakeholders, adopción</td>
    </tr>
  </tbody>
  <tfoot>
    <tr>
      <td colspan="5">
        <strong>Total Knowledge Transfer: ~17 horas</strong>
        (distribuidas en Sprint 0, semanas 1-2)
      </td>
    </tr>
  </tfoot>
</table>
```

---

## Template 6: Risk & Assumption Tracker

```html
<div class="risk-tracker">
  <h3>Supuestos Críticos</h3>
  <table>
    <tr>
      <th>#</th><th>Supuesto</th><th>Validación</th>
      <th>Deadline</th><th>Owner</th><th>Status</th><th>Si Falla</th>
    </tr>
    <tr>
      <td>A1</td>
      <td>{Supuesto del roadmap}</td>
      <td>{PoC / spike / vendor eval}</td>
      <td>{Fecha}</td>
      <td>{Nombre}</td>
      <td><span class="status-pending">⏳</span></td>
      <td>Activar escenario {alternativo} de Phase 3</td>
    </tr>
  </table>

  <h3>Riesgos Heredados</h3>
  <table>
    <tr>
      <th>#</th><th>Riesgo</th><th>Prob.</th><th>Impacto</th>
      <th>Early Warning</th><th>Mitigación</th><th>Owner</th>
    </tr>
    <tr>
      <td>R1</td>
      <td>{Del risk register}</td>
      <td>🔴 Alta</td>
      <td>🔴 Alto</td>
      <td>{Indicador medible}</td>
      <td>{Acción concreta}</td>
      <td>{Nombre}</td>
    </tr>
  </table>

  <h3>Kill Criteria</h3>
  <table>
    <tr><th>Condición</th><th>Threshold</th><th>Acción</th><th>Decision Maker</th></tr>
    <tr>
      <td>Budget overrun</td><td>>130%</td>
      <td>Pause + re-scope</td><td>Executive Sponsor</td>
    </tr>
    <tr>
      <td>Timeline overrun</td><td>>150% Foundation</td>
      <td>Re-evaluate approach</td><td>Steering Committee</td>
    </tr>
    <tr>
      <td>Quality failure</td><td>>3 critical defects</td>
      <td>Stop + quality sprint</td><td>QA Lead + PM</td>
    </tr>
    <tr>
      <td>Team attrition</td><td>>40% turnover</td>
      <td>Pause + re-staff</td><td>HR + PM</td>
    </tr>
  </table>
</div>
```

---

## Template 7: Stakeholder Transition Matrix

```html
<table class="stakeholder-transition">
  <thead>
    <tr>
      <th>Stakeholder</th>
      <th>Power/Interest (Discovery)</th>
      <th>Rol Discovery</th>
      <th>→ Rol Ejecución</th>
      <th>Engagement Shift</th>
      <th>Canal</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>{Nombre}</td>
      <td>Alto/Alto</td>
      <td>Sponsor</td>
      <td>Executive Sponsor</td>
      <td>Semanal → Mensual</td>
      <td>Steering + Dashboard</td>
    </tr>
    <tr>
      <td>{Nombre}</td>
      <td>Medio/Alto</td>
      <td>Champion</td>
      <td>Product Owner</td>
      <td>Quincenal → Diario</td>
      <td>Sprint ceremonies</td>
    </tr>
    <tr>
      <td>{Nombre}</td>
      <td>Bajo/Medio</td>
      <td>Informado</td>
      <td>End User (piloto)</td>
      <td>Mensual → Por release</td>
      <td>Release notes + training</td>
    </tr>
    <tr>
      <td>{Nombre}</td>
      <td>Alto/Bajo</td>
      <td>Resistente</td>
      <td>Early Adopter Target</td>
      <td>Evitado → Engaged post-MVP</td>
      <td>1:1 sessions + soporte</td>
    </tr>
  </tbody>
</table>
```

---

## HTML Document Structure (09_Handover_Operaciones.html)

```html
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Handover Operacional — {Proyecto}</title>
  <style>
    /* Use brand design system tokens */
    :root {
      --primary: #FF7E08;
      --primary-light: #FF9E42;
      --dark: #1a1a2e;
      --surface: #252542;
      --text: #EFEAE4;
      --border: #3d3d5c;
    }
    /* ... full brand CSS ... */
  </style>
</head>
<body>
  <header class="hero">
    <h1>Handover Operacional</h1>
    <p class="subtitle">{Nombre del Proyecto} — {Cliente}</p>
    <p class="date">Fecha: {DD/MM/YYYY}</p>
  </header>

  <nav class="toc">
    <h2>Contenido</h2>
    <ol>
      <li><a href="#s1">Resumen Ejecutivo de Transición</a></li>
      <li><a href="#s2">Paquete de Activación Comercial</a></li>
      <li><a href="#s3">Checklist de Readiness Operacional</a></li>
      <li><a href="#s4">Plan de Kickoff — Primeros 90 Días</a></li>
      <li><a href="#s5">Protocolo de Transición de Gobernanza</a></li>
      <li><a href="#s6">Tracker de Validación de Supuestos y Riesgos</a></li>
      <li><a href="#s7">Matriz de Transición de Stakeholders</a></li>
      <li><a href="#s8">Anexos y Referencias Cruzadas</a></li>
    </ol>
  </nav>

  <main>
    <section id="s1"><!-- Template 1 --></section>
    <section id="s2"><!-- Template 2 + narrative --></section>
    <section id="s3"><!-- Template 3 --></section>
    <section id="s4"><!-- Template 4 + metrics --></section>
    <section id="s5"><!-- Template 5 + ceremonies --></section>
    <section id="s6"><!-- Template 6 --></section>
    <section id="s7"><!-- Template 7 --></section>
    <section id="s8">
      <!-- Cross-references to discovery deliverables -->
      <!-- Links to: 01-08 HTML files -->
    </section>
  </main>

  <footer>
    <p>Generado por Sofka Discovery Framework v4.1.0</p>
    <p>Confidencial — {Cliente}</p>
  </footer>
</body>
</html>
```

# PITT Methodology & QA Reference — MetodologIA

## PITT Model (Equipos de Pruebas Independientes de Terceros)

### Filosofia

El modelo PITT (Pruebas Independientes de Terceros / Third-Party Independent Testing Teams) establece la separacion formal entre quienes construyen software y quienes lo validan. Esta separacion no es adversarial — es un mecanismo de accountability que eleva la calidad de ambos equipos.

### Principios PITT

1. **Independencia no es aislamiento.** El equipo de testing es independiente en juicio y reporte, pero integrado en comunicacion y objetivos.
2. **Testing es ingenieria, no verificacion.** Los testers son ingenieros de calidad que disenan estrategias, no ejecutores de checklists.
3. **El defecto es informacion, no culpa.** La cultura de calidad trata cada defecto como una oportunidad de mejora del proceso, no como un senalamiento individual.

### Niveles de Independencia

| Nivel | Descripcion | Aplica cuando |
|---|---|---|
| L0 | Mismo desarrollador testea su codigo | Solo unit testing, nunca aceptable para otros niveles |
| L1 | Otro miembro del equipo de desarrollo | Peer review, pair testing. Aceptable para integration |
| L2 | Equipo de QA dentro de la misma organizacion | Modelo interno. Riesgo de presion de timelines |
| L3 | Equipo de QA externo (PITT) | Independencia total. Reporte directo a governance |
| L4 | Auditor externo | Solo para compliance. No para testing operativo |

**MetodologIA opera en L3:** Equipo independiente con reporte directo a stakeholders del cliente, sin dependencia de los equipos de desarrollo evaluados.

### Modelo de Interaccion

```
Product Owner → Requirements → PITT Team
                                    ↓
Development Team → Build → PITT Review → Quality Gate → Release
                    ↑                         ↓
                    ← Defect Reports ← Defect Triage
```

### Governance PITT

- **Test Strategy:** Definida por PITT, aprobada por stakeholders
- **Test Plans:** Elaborados por PITT, revisados con desarrollo para feasibility
- **Defect Reports:** Clasificados por PITT, triaged conjuntamente
- **Release Decision:** Basada en exit criteria objetivos, no en presion de timeline
- **Escalation:** Path directo a governance sin pasar por development management

## TMMi Levels — Detalle

### Level 1: Initial
- Testing es caótico y ad-hoc
- No hay proceso definido
- Dependencia de heroes individuales
- Testing frecuentemente sacrificado por timeline
- **Proceso areas:** Ninguna formalmente

### Level 2: Managed
- Testing planificado por proyecto
- Test plans basicos existen
- Defect tracking implementado
- Testing tiene presupuesto asignado
- **Process areas:**
  - PA 2.1: Test Policy & Strategy
  - PA 2.2: Test Planning
  - PA 2.3: Test Monitoring & Control
  - PA 2.4: Test Design & Execution
  - PA 2.5: Test Environment

### Level 3: Defined
- Proceso de testing organizacional (no solo por proyecto)
- Test design techniques aplicadas sistematicamente
- Peer reviews de test artifacts
- Non-functional testing integrado
- **Process areas:**
  - PA 3.1: Test Organization
  - PA 3.2: Test Training Program
  - PA 3.3: Test Lifecycle & Integration
  - PA 3.4: Non-Functional Testing
  - PA 3.5: Peer Reviews

### Level 4: Measured
- Metricas cuantitativas de calidad del producto
- Statistical process control
- Evaluacion cuantitativa de calidad del producto
- Test process assessment cuantitativo
- **Process areas:**
  - PA 4.1: Test Measurement
  - PA 4.2: Product Quality Evaluation
  - PA 4.3: Advanced Reviews

### Level 5: Optimization
- Mejora continua basada en datos cuantitativos
- Defect prevention (no solo detection)
- Quality control automatizado
- Test process optimization
- **Process areas:**
  - PA 5.1: Defect Prevention
  - PA 5.2: Test Process Optimization
  - PA 5.3: Quality Control

## ISTQB Certification Landscape

### Foundation Level
- **ISTQB CTFL** — Certified Tester Foundation Level (prerequisito para todos)
- **ISTQB CTFL-AT** — Agile Tester Extension

### Advanced Level
- **ISTQB CTAL-TA** — Test Analyst
- **ISTQB CTAL-TM** — Test Manager
- **ISTQB CTAL-TTA** — Technical Test Analyst

### Specialist Certifications
- **ISTQB CT-TAE** — Test Automation Engineer
- **ISTQB CT-PT** — Performance Testing
- **ISTQB CT-SEC** — Security Testing
- **ISTQB CT-MBT** — Model-Based Testing
- **ISTQB CT-AI** — AI Testing
- **ISTQB CT-AcT** — Acceptance Testing
- **ISTQB CT-UT** — Usability Testing

### Expert Level
- **ISTQB CTEL-TM** — Test Management Expert
- **ISTQB CTEL-ITP** — Improving the Test Process Expert
- **ISTQB CTEL-TA** — Test Automation Expert

## MetodologIA QA Statistics

### Team Scale
- **220+ expertos** en Quality Engineering
- **100+ certificaciones ISTQB** activas en el equipo
- Presencia en **5 paises** de Latam

### Partnerships
- **Tricentis** — Partner certificado para Tosca, NeoLoad, qTest
- **Brightest** — Partner para TMMi assessments y formacion

### Service Lines
- **Functional Testing** — Manual y automatizado, web, mobile, API
- **Performance Testing** — Load, stress, endurance, spike, scalability
- **Security Testing** — SAST, DAST, penetration testing, OWASP compliance
- **Test Automation** — Framework design, CI/CD integration, self-healing tests
- **Test Factory** — Industrialized testing operation
- **QA Consulting** — TMMi assessment, process improvement, tool selection
- **Accessibility Testing** — WCAG 2.1/2.2 compliance testing

### Tools Expertise
- **Test Management:** Jira + Zephyr, qTest, TestRail, Azure DevOps Test Plans
- **Automation:** Selenium, Cypress, Playwright, Appium, RestAssured, Karate
- **Performance:** JMeter, Gatling, NeoLoad, k6
- **Security:** OWASP ZAP, Burp Suite, SonarQube, Checkmarx
- **CI/CD:** Jenkins, GitHub Actions, Azure DevOps, GitLab CI
- **Mobile:** Appium, XCUITest, Espresso, BrowserStack, Sauce Labs

---
**Referencia interna MetodologIA — No distribuir externamente**

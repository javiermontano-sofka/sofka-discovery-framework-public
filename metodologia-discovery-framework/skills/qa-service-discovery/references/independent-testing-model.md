# Independent Testing Model — PDCA + ISTQB Test Process Reference

> Licensed under GPL-3.0. Based on ISTQB Syllabus (public) and ISO/IEC/IEEE 29119.

## Philosophy

El modelo de testing independiente establece la separacion formal entre quienes construyen software y quienes lo validan. Esta separacion no es adversarial — es un mecanismo de accountability que eleva la calidad de ambos equipos. Basado en los principios de independencia del ISTQB Foundation Syllabus y el ciclo PDCA de mejora continua.

## Principles

1. **Independencia no es aislamiento.** El equipo de testing es independiente en juicio y reporte, pero integrado en comunicacion y objetivos.
2. **Testing es ingenieria, no verificacion.** Los testers son ingenieros de calidad que disenan estrategias, no ejecutores de checklists.
3. **El defecto es informacion, no culpa.** La cultura de calidad trata cada defecto como una oportunidad de mejora del proceso, no como un senalamiento individual.

## Independence Levels (ISTQB Foundation Syllabus)

| Nivel | Descripcion | Aplica cuando |
|---|---|---|
| L0 | Mismo desarrollador testea su codigo | Solo unit testing, nunca aceptable para otros niveles |
| L1 | Otro miembro del equipo de desarrollo | Peer review, pair testing. Aceptable para integration |
| L2 | Equipo de QA dentro de la misma organizacion | Modelo interno. Riesgo de presion de timelines |
| L3 | Equipo de QA externo independiente | Independencia total. Reporte directo a governance |
| L4 | Auditor externo | Solo para compliance. No para testing operativo |

## PDCA Applied to Independent Testing

### Plan
- Test strategy definida por el equipo de QA independiente
- Aprobada por stakeholders (no por el equipo de desarrollo bajo evaluacion)
- Test plans elaborados con enfoque risk-based (ISO/IEC/IEEE 29119-3)
- Criterios de entrada y salida definidos objetivamente

### Do
- Ejecucion independiente de tests funcionales, non-funcionales y de regresion
- Comunicacion fluida con desarrollo para clarificacion (no para influencia)
- Defect reports clasificados con evidencia reproducible
- Test data management independiente

### Check
- Metricas de calidad reportadas a governance, no filtradas por desarrollo
- Defect triage conjunto (desarrollo + QA + product) para clasificacion
- Release decision basada en exit criteria objetivos
- Conformance entre proceso ejecutado y proceso definido

### Act
- Retrospectivas de calidad con ambos equipos
- Ajuste de estrategia basada en metricas
- Mejora de procesos de testing
- Actualizacion de test assets y knowledge base

## Interaction Model

```
Product Owner → Requirements → Independent QA Team
                                    ↓
Development Team → Build → QA Review → Quality Gate → Release
                    ↑                         ↓
                    ← Defect Reports ← Defect Triage
```

## Governance

- **Test Strategy:** Definida por QA independiente, aprobada por stakeholders
- **Test Plans:** Elaborados por QA, revisados con desarrollo para feasibility
- **Defect Reports:** Clasificados por QA, triaged conjuntamente
- **Release Decision:** Basada en exit criteria objetivos, no en presion de timeline
- **Escalation:** Path directo a governance sin pasar por development management

## TMMi Reference (TMMi Foundation — Public Framework)

### Level 1: Initial
- Testing caotico y ad-hoc, sin proceso definido
- **Process areas:** Ninguna formalmente

### Level 2: Managed
- Test plans basicos, defect tracking implementado
- **Process areas:** PA 2.1-2.5 (Test Policy, Planning, Monitoring, Design, Environment)

### Level 3: Defined
- Proceso de testing organizacional, test design techniques
- **Process areas:** PA 3.1-3.5 (Organization, Training, Lifecycle, Non-functional, Peer Reviews)

### Level 4: Measured
- Metricas cuantitativas, statistical process control
- **Process areas:** PA 4.1-4.3 (Measurement, Product Quality, Advanced Reviews)

### Level 5: Optimization
- Mejora continua basada en datos, defect prevention
- **Process areas:** PA 5.1-5.3 (Defect Prevention, Process Optimization, Quality Control)

## ISTQB Certification Landscape (Public)

### Foundation Level
- ISTQB CTFL — Certified Tester Foundation Level
- ISTQB CTFL-AT — Agile Tester Extension

### Advanced Level
- ISTQB CTAL-TA — Test Analyst
- ISTQB CTAL-TM — Test Manager
- ISTQB CTAL-TTA — Technical Test Analyst

### Specialist Certifications
- CT-TAE — Test Automation Engineer
- CT-PT — Performance Testing
- CT-SEC — Security Testing
- CT-MBT — Model-Based Testing
- CT-AI — AI Testing

---
**Comunidad MetodologIA** | **Licencia:** GPL-3.0 | Basado en ISTQB Syllabus (publico) e ISO/IEC/IEEE 29119

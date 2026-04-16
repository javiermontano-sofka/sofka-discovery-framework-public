# Body of Knowledge — Definition of Done / Definition of Ready

## Marco Teórico

El Definition of Done (DoD) es el acuerdo de calidad del equipo: un checklist que define cuándo un trabajo está verdaderamente completado. El Definition of Ready (DoR) es el complemento: define cuándo un work item tiene suficiente información para ser desarrollado. Ambos son prácticas core de Scrum pero aplicables a cualquier metodología.

## Anatomía del DoD

| Dimensión de Calidad | Criterios Típicos | Aplica a |
|----------------------|-------------------|----------|
| Código | Code review aprobado, estándares cumplidos | Story, Feature |
| Testing | Unit tests ≥80% coverage, integration tests pass | Story, Feature |
| Documentación | API docs actualizados, changelog updated | Feature, Release |
| Seguridad | OWASP check, no vulnerabilidades críticas | Feature, Release |
| Performance | Response time dentro de SLA | Feature, Release |
| Deployment | Desplegado en staging, smoke tests pass | Story |
| Aceptación | PO ha aceptado vs. acceptance criteria | Story |
| Accesibilidad | WCAG AA verificado (si UI) | Feature |

## Anatomía del DoR

| Criterio | Descripción | Validación |
|----------|-------------|------------|
| User story escrita | Formato "Como... quiero... para..." | Template completo |
| Acceptance criteria | ≥3 criterios SMART testables | Review en refinement |
| Estimación | Story points asignados por equipo | Planning poker |
| Dependencias | Identificadas y resueltas o planificadas | Dependency check |
| Diseño/Mockup | Si requiere UI, mockup aprobado | UX review |
| Datos de prueba | Disponibles o plan para generarlos | QA confirmation |

## DoD por Nivel (Layered DoD)

```
Release DoD ⊃ Feature DoD ⊃ Story DoD

Story DoD:
  ✓ Código escrito y revisado
  ✓ Tests unitarios pass (≥80% coverage)
  ✓ Desplegado en staging
  ✓ PO acepta vs. criteria

Feature DoD = Story DoD +
  ✓ Tests de integración pass
  ✓ Documentación actualizada
  ✓ Performance dentro de SLA
  ✓ Security scan clean

Release DoD = Feature DoD +
  ✓ Regression tests pass
  ✓ Release notes completas
  ✓ Deployment runbook verificado
  ✓ Rollback plan documentado
  ✓ Stakeholder sign-off
```

## DoD por Metodología

| Metodología | DoD Foco | DoR Foco | Evolución |
|-------------|----------|----------|-----------|
| Scrum | Sprint increment shippable | Refinement checklist | Cada retrospectiva |
| Kanban | Exit criteria por columna | Entry criteria por columna | Continuo |
| SAFe | Team + ART DoD | PI readiness | Cada IP iteration |
| Waterfall | Phase completion + gate | Phase entry criteria | Por fase |
| Hybrid | Sprint DoD + Phase DoD | Sprint DoR + Phase entry | Según cadencia |

## Anti-Patrones de DoD

| Anti-Patrón | Síntoma | Consecuencia | Remediar |
|-------------|---------|-------------|----------|
| DoD impuesto | Equipo no participa en definición | Baja compliance | Workshop de co-creación |
| DoD inalcanzable | Sprint nunca "done" | Deuda permanente | Simplificar y escalar gradualmente |
| DoD invisible | Equipo no sabe que existe | Calidad inconsistente | Poster + wiki + board |
| DoD congelado | No evoluciona con madurez | Irrelevante en 3 meses | Review cada 3 sprints |
| DoD sin excepción | Exceptions sin documentar | Deuda técnica oculta | Proceso de excepción formal |

## Métricas de Efectividad del DoD

```
DoD Compliance Rate = (Items meeting full DoD / Items "completed") × 100
DoD Exception Rate = (Items with exceptions / Items "completed") × 100
Debt from Exceptions = Σ(estimated_rework_hours per exception)

Targets:
  Compliance Rate ≥ 95%
  Exception Rate ≤ 5%
  Debt from Exceptions: tracked and repaid within 2 sprints
```

## Estándares Relevantes

- **Scrum Guide 2020**: Definition of Done como artefacto formal del equipo
- **SAFe 6.0**: Team DoD + ART DoD + Solution DoD
- **PMBOK 7th**: Quality management — acceptance criteria y quality assurance
- **ISO 25010**: Software quality characteristics (para DoD técnico)
- **Kanban Method**: Explicit policies incluyendo exit criteria

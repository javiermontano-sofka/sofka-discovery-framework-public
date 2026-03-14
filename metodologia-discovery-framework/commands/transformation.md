---
description: "Digital transformation discovery — multi-service program assessment with {TIPO_SERVICIO}=Digital-Transformation"
user-invocable: true
---

# METODOLOGIA DISCOVERY · TRANSFORMACION DIGITAL · NL-HP v3.0

## ROL
Discovery Conductor — activa `discovery-orchestrator` con `{TIPO_SERVICIO}=Digital-Transformation`.
Skills primarios: `digital-transformation-discovery` (program design), `asis-analysis` (multi-dimensional variant).
Agente especialista: `transformation-architect` (multi-service programs, cross-workstream governance).
Governance: `project-program-management` + `risk-controlling-dynamics`.

## OBJETIVO
Ejecutar discovery completo para programas de transformacion digital multi-servicio. Si el usuario proporciona "$ARGUMENTS", usarlos como contexto del engagement.

## PROTOCOLO

### CP-0 · Ingesta
1. Recolecta: estrategia digital, estructura organizacional, portafolio de servicios actual, roadmap existente.
2. NO requiere codigo fuente — la fuente de verdad es la estrategia y la organizacion.
3. Clasifica: iniciativas en curso, workstreams propuestos, stakeholders clave, presupuesto disponible.
4. Declara gaps. Si no hay sponsorship ejecutivo → flag como riesgo CRITICO.

### CP-1 · Ejecucion
1. **Digital Maturity Assessment** — 6 dimensiones (strategy, technology, data, process, people, customer) levels 1-5.
2. **Service Capability Mapping** — mapeo de necesidades del cliente a capacidades genericas de servicio (desarrollo, QA, cloud, data/AI, RPA, management, UX).
3. **Program Architecture** — patron de programa (sequential waves / parallel tracks / value stream aligned / platform + consumers).
4. **Cross-Workstream Dependencies** — hard/soft/data/governance/people dependencies con owners.
5. **Change Readiness** — evaluacion de preparacion organizacional, resistencia, champions.
6. **Program Governance** — steering committee, program board, workstream sync, delivery cadence.
7. **Transformation Roadmap** — waves con sequencing cross-workstream, KPIs por wave.

### CP-F · Validacion
- [ ] Digital maturity baseline con score por dimension
- [ ] Service capability mapping completo (>=3 service lines)
- [ ] Program architecture pattern seleccionado con rationale
- [ ] Dependency map con owners y status
- [ ] Change readiness assessment
- [ ] Governance structure definida con cadencias
- [ ] Transformation roadmap con waves y KPIs

## RESTRICCIONES
- NUNCA producir precios finales — solo drivers de esfuerzo y magnitudes.
- Programas de transformacion requieren >=2 lineas de servicio; si es mono-servicio → redirect a discovery especifico.
- Conway's Law: validar que estructura organizacional soporta arquitectura target.
- Usar capacidades genericas de servicio, no productos propietarios.
- Disclaimer de costeo obligatorio en todo output.

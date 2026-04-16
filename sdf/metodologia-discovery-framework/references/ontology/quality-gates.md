# Quality Gates

> MAO Framework — Ontología viva
> Referencia canónica de los 4 quality gates del pipeline de discovery.

---

## Principio

Los quality gates son hard stops en el pipeline. Ningún entregable posterior puede generarse sin la aprobación explícita del gate correspondiente. En modo `piloto-auto`, el pipeline pausa para solicitar aprobación humana en cada gate.

---

## G1 — Post-Escenarios

### Momento de activación
Después de completar el entregable 05 (Escenarios ToT), antes de iniciar 05b (Feasibility).

### Criterios de paso

- [ ] Scoring 6D completo para todos los escenarios evaluados
- [ ] Escenario recomendado identificado con justificación explícita
- [ ] Cada dimensión del scoring tiene evidencia trazable (no solo `[SUPUESTO]`)
- [ ] Trade-offs entre escenarios documentados
- [ ] Riesgos por escenario identificados y clasificados
- [ ] Alineación con objetivos del Brief Técnico verificada

### Quién aprueba
- **Primario:** `discovery-conductor`
- **Validación:** `quality-guardian` + `risk-controller`
- **En modo supervisado:** Usuario/cliente

### Qué bloquea
- Scoring 6D incompleto (dimensiones sin evaluar)
- Escenario recomendado sin justificación
- >40% de afirmaciones del scoring marcadas como `[SUPUESTO]`
- Contradicción no resuelta entre escenarios y Brief

### Acción si no pasa
Regresar a fase de Escenarios. Refinar con evidencia adicional o solicitar input del cliente.

---

## G1.5 — Post-Feasibility (Think Tank 7 Sabios)

### Momento de activación
Después de completar el entregable 05b (Feasibility Think Tank), antes de iniciar 06 (Roadmap).

### Criterios de paso

- [ ] Los 7 Sabios han emitido veredicto individual (Go / No-Go / Condicional)
- [ ] Resultado: ≥5/7 votos Go para avanzar
- [ ] Cada veredicto No-Go tiene justificación documentada
- [ ] Condiciones de los votos "Condicional" están listadas
- [ ] Riesgos de feasibility consolidados y priorizados
- [ ] Dimensiones evaluadas: técnica, financiera, organizacional, datos, integración, infraestructura, académica

### Quién aprueba
- **Primario:** `discovery-conductor` (consolida veredictos)
- **Validación:** Los 7 Sabios (veredicto individual)
- **En modo supervisado:** Usuario/cliente valida decisión Go/No-Go

### Qué bloquea
- Menos de 5/7 votos Go → No-Go documentado
- Algún Sabio no emitió veredicto (evaluación incompleta)
- Veredicto No-Go en dimensión crítica sin plan de mitigación
- Condiciones de votos "Condicional" no son accionables

### Acción si no pasa
- **No-Go:** Documentar razones, presentar al cliente, evaluar escenarios alternativos
- **Condicional (<5 Go):** Resolver condiciones, re-evaluar con Sabios afectados

---

## G2 — Post-Roadmap

### Momento de activación
Después de completar el entregable 06 (Solution Roadmap), antes de iniciar 07 (Spec Funcional).

### Criterios de paso

- [ ] FTE-meses validados con fuente de estimación explícita
- [ ] Simulación Monte Carlo ejecutada (distribución de probabilidad documentada)
- [ ] Quick wins definidos (≥3 iniciativas de bajo esfuerzo/alto impacto)
- [ ] Fases del roadmap con dependencias claras
- [ ] Riesgos del roadmap mapeados con plan de mitigación
- [ ] Consistencia con escenario aprobado en G1 verificada
- [ ] Alineación con veredicto de feasibility (G1.5) confirmada

### Quién aprueba
- **Primario:** `discovery-conductor` + `delivery-manager`
- **Validación:** `risk-controller` (riesgos) + `economics-researcher` (sizing)
- **En modo supervisado:** Usuario/cliente aprueba roadmap

### Qué bloquea
- FTE-meses sin fuente de estimación
- Monte Carlo no ejecutado o con distribución irreal
- Cero quick wins identificados
- Roadmap contradice escenario aprobado en G1
- Dependencias circulares o inconsistentes entre fases

### Acción si no pasa
Regresar a Roadmap. Refinar estimaciones, ejecutar Monte Carlo, identificar quick wins.

---

## G3 — Gate Final

### Momento de activación
Después de completar el entregable 09 (Handover Operativo), antes de generar reportes (10-14).

### Criterios de paso

- [ ] Consistencia cruzada verificada entre todos los entregables (00-09)
- [ ] Excellence loop pasado (10 criterios ≥8/10 promedio)
- [ ] Ningún entregable con >20% de afirmaciones `[SUPUESTO]`
- [ ] Todos los hallazgos críticos tienen evidencia de alta confianza
- [ ] Handover contiene toda la información necesaria para el equipo de delivery
- [ ] Changelog de sesión completo y sin gaps
- [ ] Cross-references entre entregables verificadas (no hay links rotos)
- [ ] Disclaimers de estimación incluidos donde corresponde

### Quién aprueba
- **Primario:** `discovery-conductor`
- **Validación:** Tríada completa (`delivery-manager` + `risk-controller`)
- **Revisión editorial:** `editorial-director`
- **En modo supervisado:** Usuario/cliente aprueba paquete final

### Qué bloquea
- Inconsistencia entre entregables (datos contradictorios entre docs)
- Excellence loop con promedio <7/10
- Entregable con >30% `[SUPUESTO]` sin banner de advertencia
- Hallazgo `severity=CRÍTICO` sin validar
- Handover incompleto (faltan secciones obligatorias)

### Acción si no pasa
El `quality-guardian` emite lista de correcciones. El `editorial-director` coordina la revisión. Se usa `/mao:improve-deliverables` para evolucionar los entregables afectados.

---

## Resumen de gates

| Gate | Fase | Criterio clave | Umbral crítico |
|------|------|---------------|----------------|
| G1 | Post-Escenarios | Scoring 6D completo | <40% supuestos en scoring |
| G1.5 | Post-Feasibility | Veredicto 7 Sabios | ≥5/7 Go |
| G2 | Post-Roadmap | FTE-meses + Monte Carlo | Quick wins definidos |
| G3 | Final | Consistencia cruzada | Excellence loop ≥8/10 |

---

## Modos de aprobación

| Modo | Comportamiento en gates |
|------|------------------------|
| `piloto-auto` | Pausa para aprobación humana |
| `desatendido` | Auto-aprobación con log detallado |
| `supervisado` | Pausa + presentación de evidencia al usuario |
| `paso-a-paso` | Pausa en cada gate Y entre entregables |

---

*MAO Framework — La excelencia no se improvisa, se diseña.*

# Use Case Prompts — AS-IS Technical Analysis

> Ready-to-use prompts for the most frequent use cases of this skill.
> Each prompt includes context on when to use it and variable parameters.

---

## 1. Complete Codebase Analysis

**When:** Start of full discovery. The client provides access to the source code.

```
Ejecutar análisis AS-IS completo del codebase en {PATH_CODEBASE}.

Contexto:
- Industria: {INDUSTRIA}
- Tamaño estimado del sistema: {TAMAÑO_LOC} LOC
- Equipo de desarrollo: {NUM_DEVS} personas
- Años en producción: {AÑOS}
- Stack principal: {STACK}

Parámetros:
- {MODO}: piloto-auto
- {FORMATO}: markdown
- {VARIANTE}: técnica

Entregar 03_Analisis_AS-IS con las 10 secciones completas.
Priorizar hallazgos de seguridad (S7) y deuda técnica (S5).
```

---

## 2. Executive Brief (quick variant)

**When:** First meeting with the client. You need a quick system snapshot.

```
Generar brief ejecutivo del sistema en {PATH_CODEBASE}.

Solo las secciones S0 (Executive Dashboard), S5 (Tech Debt), S9 (Risk Register) y S10 (Recommendations).

Formato: {FORMATO}
Variante: ejecutiva
Modo: desatendido

El output debe caber en 3 páginas máximo. Incluir health score y semáforo.
```

---

## 3. Focused Security Audit

**When:** Pre-compliance audit or when the client has specific security concerns.

```
Ejecutar análisis de seguridad focalizado en {PATH_CODEBASE}.

Profundizar en:
- S1: Dependencias con CVEs conocidos (generar SBOM)
- S7: Security Assessment completo (OWASP Top 10 mapping)
- S9: Riesgos de seguridad priorizados por CVSS

Industria: {INDUSTRIA}
Regulaciones aplicables: {REGULACIONES} (ej: PCI-DSS, HIPAA, GDPR, SOX)

Incluir: hallazgos con severidad CVSS, remediation pathway, y timeline estimado.
No incluir: secciones S2, S3, S4, S8 (fuera de scope para auditoría de seguridad).
```

---

## 4. Technical Debt Evaluation for Prioritization

**When:** The client's technical team wants a debt remediation plan.

```
Analizar deuda técnica del sistema en {PATH_CODEBASE}.

Profundizar en:
- S2: Code Organization (coupling, cohesion, anti-patterns)
- S4: Code Quality Metrics (complexity, duplication, coverage)
- S5: Technical Debt Inventory (full classification)
- S10: Remediation roadmap (quick wins + strategic items)

Clasificar cada item de deuda como:
- Deliberada/Inadvertida (Fowler Quadrant)
- Impacto: Alto/Medio/Bajo
- Costo de remediación: días de ingeniería
- Prioridad: (impacto × costo-de-no-remediar) / costo-de-remediación

Output: inventario ordenado por prioridad con top-5 quick wins resaltados.
```

---

## 5. Microservices Readiness Assessment

**When:** The client wants to migrate from monolith to microservices.

```
Evaluar readiness para migración a microservicios del sistema en {PATH_CODEBASE}.

Enfoque especial en:
- S2: Module boundaries y coupling analysis (¿hay bounded contexts naturales?)
- S3: Architecture actual (¿monolito, modular monolith, distributed monolith?)
- S5: Deuda que bloquea la descomposición
- S6: NFRs que la nueva arquitectura debe preservar
- S8: Operational readiness (¿tiene CI/CD, monitoring, container orchestration?)

Para S10, incluir:
- Decision tree: refactor-to-modular-monolith vs microservices vs keep-monolith
- Pre-requisites antes de descomponer (test coverage mínima, CI/CD, monitoring)
- Bounded contexts candidatos (basados en S2 coupling analysis)
- Estimated timeline and team requirements
```

---

## 6. Legacy System Assessment (>10 years)

**When:** Legacy system with sparse documentation and possible knowledge loss.

```
Ejecutar arqueología de código del sistema legacy en {PATH_CODEBASE}.

Contexto especial:
- Sistema tiene {AÑOS} años en producción
- Documentación: {NIVEL_DOC} (inexistente/parcial/desactualizada)
- Conocimiento concentrado en {NUM_PERSONAS} personas
- Stack: {STACK_LEGACY} (ej: COBOL, VB6, Classic ASP, PHP 5.x, Java 6)

Prioridades:
1. S1: Inventario tecnológico con status EOL de CADA componente
2. S3: Reverse-engineer C4 diagrams desde código (flag confidence level)
3. S5: Deuda de conocimiento (undocumented business logic)
4. S7: Security exposure por componentes EOL
5. S9: Risk register con énfasis en bus factor y knowledge concentration

Para S10: incluir "knowledge preservation" como primera recomendación.
```

---

## 7. Technical Due Diligence (M&A)

**When:** Technical evaluation as part of a due diligence process for acquisition.

```
Ejecutar due diligence técnica del sistema en {PATH_CODEBASE}.

Contexto: evaluación pre-adquisición. El output será consumido por el equipo de M&A.

Enfoque especial en:
- S0: Snapshot ejecutivo con health score (es lo primero que ve el board)
- S1: Technology inventory con costo de licenciamiento y vendor lock-in
- S5: Deuda técnica cuantificada en esfuerzo de remediación
- S7: Exposición de seguridad y compliance gaps
- S9: Top-10 riesgos técnicos que afectan valoración

Variante: ejecutiva (max 3 páginas de findings + anexo técnico)
Formato: dual (markdown + html para el board deck)

CRÍTICO: No incluir recomendaciones de remediación — solo hallazgos y cuantificación.
La decisión de adquirir es del board, no del skill.
```

---

## 8. Multi-System Comparative Analysis

**When:** The client has multiple systems and needs to prioritize which to modernize first.

```
Ejecutar análisis AS-IS comparativo de {N} sistemas:

1. {SISTEMA_1}: {PATH_1} — {DESCRIPCIÓN_1}
2. {SISTEMA_2}: {PATH_2} — {DESCRIPCIÓN_2}
3. {SISTEMA_3}: {PATH_3} — {DESCRIPCIÓN_3}

Para cada sistema, generar S0 (Executive Dashboard) + S5 (Tech Debt) + S6 (NFR Heatmap) + S9 (Risk Register).

Al final, producir tabla comparativa:
| Dimensión | Sistema 1 | Sistema 2 | Sistema 3 |
|---|---|---|---|
| Health Score | | | |
| Tech Debt Ratio | | | |
| Security Risk | | | |
| Operational Maturity | | | |
| Modernization Priority | | | |

Recomendar orden de modernización basado en: riesgo × impacto de negocio × costo de inacción.
```

---

## 9. Post-Incident Architecture Review

**When:** After a serious incident, evaluate the architecture that allowed it.

```
Ejecutar análisis AS-IS post-incidente del sistema en {PATH_CODEBASE}.

Incidente: {DESCRIPCIÓN_INCIDENTE}
Fecha: {FECHA}
Impacto: {IMPACTO}
Root cause (si conocido): {ROOT_CAUSE}

Enfoque: S3 (Architecture) + S6 (NFRs — reliability, security) + S7 (Security) + S8 (Operational Model) + S9 (Risk Register).

Para S10: incluir sección "Incident Prevention Architecture" con cambios específicos que habrían prevenido o mitigado el incidente.

Tono: sin culpa. El objetivo es mejorar el sistema, no señalar personas.
```

---

## 10. AS-IS Analysis for Steering Committee Presentation

**When:** AS-IS results are presented to the steering committee to obtain budget.

```
Del análisis AS-IS ya generado en {PATH_ASIS}, producir versión para steering committee.

Formato: {FORMATO} (markdown + html para proyectar)
Variante: ejecutiva

Estructura:
1. Health Score visual (semáforo)
2. Top 5 hallazgos con impacto de negocio (no técnico)
3. Top 5 riesgos con probabilidad e impacto cuantificado
4. Quick wins (< 5 días de ingeniería cada uno)
5. Decisiones que necesitamos del comité

Reglas:
- CERO jerga técnica sin traducción a impacto de negocio
- Cada hallazgo tiene un "so what?" de negocio
- Incluir comparación con benchmarks de industria ({INDUSTRIA})
```

---

**Autor:** Javier Montaño | **Última actualización:** 12 de marzo de 2026
**© Comunidad MetodologIA — Todos los derechos reservados**

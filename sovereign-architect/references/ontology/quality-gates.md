# Quality Gates — Sovereign Architect

> SA Ontología Viva · Criterios de calidad y puntos de control.

---

## 4 Quality Gates

Los gates son **hard stops**. No se avanza sin cumplir criterios.

### G0 — Security Gate (Session Start)

**Cuándo**: Al iniciar sesión, antes de cualquier análisis.

| Criterio | Validación |
|----------|-----------|
| No hay secrets expuestos | `secrets-scan.sh` ejecuta sin findings CRITICAL |
| Estructura de repo válida | Directorio existe y es legible |
| Herramientas disponibles | Git, lenguaje principal detectado |

**Falla G0**: Se bloquea la sesión hasta remediar. No se analiza código con secrets expuestos.

---

### G1 — Discovery Gate (Post-Diagnosis)

**Cuándo**: Después de Fases 1-2 (Discovery + Diagnosis), antes de Design.

| Criterio | Validación |
|----------|-----------|
| Inventario completo | Todos los dominios mapeados (API, data, auth, UI, infra, tests) |
| Evidencia clasificada | 100% de hallazgos con tag `[HECHO]`/`[INFERENCIA]`/`[SUPUESTO]` |
| Riesgos puntuados | Cada riesgo tiene severidad × probabilidad |
| Gaps declarados | Lista explícita de información faltante |
| Proporción de supuestos | <30% `[SUPUESTO]` — si >30%, banner de advertencia |

**Falla G1**: No se proponen soluciones. Se pide más información o se declaran limitaciones.

---

### G1.5 — Design Gate (Post-Design)

**Cuándo**: Después de Fase 3 (Design), antes de Plan.

| Criterio | Validación |
|----------|-----------|
| Alternativas evaluadas | Mínimo 2 alternativas con trade-offs explícitos |
| Decisión justificada | Rationale específico, no "es best practice" |
| Scope verificado | Se evaluó si el scope completo es necesario |
| Constraints mapeados | Restricciones técnicas, organizacionales, de negocio |
| Diagrama de arquitectura | Al menos 1 diagrama Mermaid |

**Falla G1.5**: Se revisa el diseño o se piden más constraints antes de planificar.

---

### G2 — Delivery Gate (Post-Delivery)

**Cuándo**: Después de Fase 5, antes de entregar al usuario.

| Criterio | Validación |
|----------|-----------|
| Artefactos completos | Todos los artefactos prometidos generados |
| Tests propuestos | Estrategia de testing para cada cambio de código |
| Rollback definido | Plan de rollback para cada fase |
| Documentación | Cambios documentados o doc actualizada |
| Excellence loop | 10 criterios de calidad verificados |

**Falla G2**: Se completan artefactos faltantes antes de entregar.

---

## Excellence Loop (10 criterios por artefacto)

| # | Criterio | Pregunta |
|---|----------|----------|
| 1 | **Completitud** | ¿Cubre todo lo solicitado? |
| 2 | **Evidencia** | ¿Cada claim tiene su tag? |
| 3 | **Accionabilidad** | ¿Se puede ejecutar directamente? |
| 4 | **Especificidad** | ¿Es específico al sistema, no genérico? |
| 5 | **Alternativas** | ¿Se evaluaron otras opciones? |
| 6 | **Riesgos** | ¿Se declararon riesgos y mitigaciones? |
| 7 | **Reversibilidad** | ¿Hay plan de rollback? |
| 8 | **Testing** | ¿Hay estrategia de verificación? |
| 9 | **Claridad** | ¿Lo entiende otro ingeniero sin contexto adicional? |
| 10 | **Honestidad** | ¿Se declaró lo que NO se sabe? |

---

*Sovereign Architect — Gates are not bureaucracy. They are discipline.*

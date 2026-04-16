# Change Control Board — Body of Knowledge

## 1. Fundamentos del Control de Cambios

El Change Control Board (CCB) es el organo de gobernanza formalmente constituido para revisar, evaluar, aprobar, diferir o rechazar cambios a los baselines del proyecto. Su proposito no es bloquear cambios sino asegurar que cada cambio se implemente con pleno entendimiento de su impacto. [DOC]

### 1.1 Composicion del CCB

| Rol | Responsabilidad | Voto |
|-----|----------------|------|
| Sponsor del Proyecto | Autoridad final en cambios estrategicos | Veto [STAKEHOLDER] |
| Project Manager | Presenta analisis de impacto, coordina CCB | Consultivo [PLAN] |
| Lider Tecnico | Evalua factibilidad tecnica y riesgo | Voto pleno [METRIC] |
| Product Owner | Evalua impacto en valor de negocio | Voto pleno [STAKEHOLDER] |
| Lider de QA | Evalua impacto en calidad y testing | Voto pleno [METRIC] |
| Representante Financiero | Analisis de impacto presupuestario | Voto cuando hay impacto de costo [PLAN] |
| Representante Legal | Evalua impacto contractual | Voto cuando aplica [STAKEHOLDER] |

### 1.2 Categorias de Solicitudes de Cambio

| Categoria | Descripcion | Autoridad de Aprobacion | SLA Decision |
|-----------|-------------|------------------------|--------------|
| Emergencia | Defecto critico en produccion | PM (aprobacion retroactiva CCB 48h) | Inmediato [SCHEDULE] |
| Menor | <5% impacto en presupuesto/cronograma | Autoridad del PM | 24h [PLAN] |
| Moderado | 5-15% impacto | Voto CCB requerido | 48h [STAKEHOLDER] |
| Mayor | >15% impacto o cambio de alcance | CCB + Sponsor | 1 semana [STAKEHOLDER] |
| Estrategico | Afecta objetivos del proyecto | Steering Committee | Proxima sesion SC [STAKEHOLDER] |

### 1.3 Umbrales de Autoridad (Ejemplo)

| Nivel | Alcance | Cronograma | Presupuesto |
|-------|---------|------------|-------------|
| PM | ±5% | ±1 sprint | ±5% contingencia |
| CCB | ±15% | ±3 sprints | ±15% baseline |
| Sponsor | ±25% | ±6 sprints | ±25% baseline |
| Steering | >25% | >6 sprints | >25% baseline |

## 2. Proceso de Control de Cambios

```
Solicitud → Registro → Analisis de Impacto → Revision CCB → Decision → Implementacion → Verificacion → Cierre
```

### 2.1 Template de Solicitud de Cambio

| Campo | Descripcion | Requerido |
|-------|-------------|-----------|
| CR-ID | Identificador unico | Si |
| Titulo | Descripcion breve | Si |
| Solicitante | Quien inicia el cambio | Si [STAKEHOLDER] |
| Categoria | Emergencia/Menor/Moderado/Mayor/Estrategico | Si |
| Descripcion | Detalle del cambio propuesto | Si |
| Justificacion | Razon de negocio para el cambio | Si [PLAN] |
| Impacto en Alcance | Work packages afectados | Si [PLAN] |
| Impacto en Cronograma | Sprints/dias de impacto | Si [SCHEDULE] |
| Impacto en Presupuesto | FTE-meses adicionales | Si [METRIC] |
| Impacto en Calidad | Efecto en plan de testing | Si [METRIC] |
| Impacto en Riesgo | Nuevos riesgos introducidos | Si [INFERENCIA] |
| Alternativas | Opciones consideradas incluyendo "no hacer nada" | Si |
| Recomendacion PM | Recomendacion con rationale | Si [PLAN] |
| Decision | Aprobado/Rechazado/Diferido | Post-CCB [DECISION] |

## 3. Framework de Analisis de Impacto

| Dimension | Preguntas Clave | Evidencia Requerida |
|-----------|----------------|---------------------|
| Alcance | Que trabajo se agrega/elimina/modifica? | WBS actualizada [PLAN] |
| Cronograma | Cual es el impacto en la ruta critica? | Cronograma actualizado [SCHEDULE] |
| Presupuesto | Cual es el costo en FTE-meses? | Estimacion actualizada [METRIC] |
| Calidad | Se afectan estandares de calidad? | Plan de testing actualizado [METRIC] |
| Riesgo | Que nuevos riesgos se introducen? | Evaluacion de riesgo [INFERENCIA] |
| Recursos | Se necesitan recursos adicionales? | Analisis de recursos [PLAN] |
| Dependencias | Se afectan otros proyectos/equipos? | Mapa de dependencias [PLAN] |

## 4. Criterios de Decision del CCB

1. **Alineacion con valor de negocio** — El cambio apoya los objetivos del proyecto? [PLAN]
2. **Ratio costo-beneficio** — El beneficio justifica el impacto? [METRIC]
3. **Aceptabilidad de riesgo** — Los riesgos introducidos son manejables? [INFERENCIA]
4. **Oportunidad temporal** — Es el momento adecuado para este cambio? [SCHEDULE]
5. **Consenso de stakeholders** — Los stakeholders clave apoyan el cambio? [STAKEHOLDER]
6. **Impacto acumulativo** — Considerando cambios previos, sigue siendo viable? [METRIC]

## 5. Metricas de Gestion de Cambios

| Metrica | Formula | Benchmark |
|---------|---------|-----------|
| Tasa de Cambio | CRs por sprint/mes | <3/sprint aceptable [METRIC] |
| Tasa de Aprobacion | CRs aprobados / CRs totales | 40-60% esperado [METRIC] |
| Tiempo de Decision | Dias desde solicitud hasta decision | Dentro de SLA [SCHEDULE] |
| Impacto Acumulativo | Cambio total vs baseline original | <20% bandera amarilla [METRIC] |
| Tasa de Bypass | Cambios descubiertos fuera de proceso | <5% objetivo [METRIC] |

## 6. Protocolo de Emergencia

| Paso | Accion | Tiempo |
|------|--------|--------|
| 1 | PM evalua y actua | Inmediato |
| 2 | PM notifica a sponsor y CCB | Dentro de 4h |
| 3 | PM documenta CR retroactiva | Dentro de 24h |
| 4 | CCB revisa y ratifica | Dentro de 48h |
| 5 | Si CCB no ratifica, plan de rollback | Dentro de 72h |

## 7. Referencias Normativas

| Fuente | Documento | Relevancia |
|--------|-----------|------------|
| PMI | PMBOK 7th Ed. — Integrated Change Control | Framework principal |
| PRINCE2 | Change Authority | Gobernanza de cambios |
| ISO 21502 | Clausula 6.4 | Gestion del cambio |
| ITIL 4 | Change Enablement | Gestion de cambios IT |
| SAFe 6.0 | Lean Portfolio Management | Cambios a nivel portfolio |
| Agile Alliance | Managing Technical Debt as Change | Deuda tecnica como cambio |

*PMO-APEX v1.0 — Body of Knowledge - Change Control Board*

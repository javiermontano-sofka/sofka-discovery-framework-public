# Use Case Prompts — FinOps (Cloud Financial Operations)

> Prompts listos para usar en los casos de uso mas frecuentes de esta skill.
> Cada prompt incluye contexto de cuando usarlo y parametros variables.

---

## 1. Full FinOps Assessment

**Cuando:** Discovery completo de costos cloud. El cliente proporciona billing data y/o IaC.

```
Ejecutar FinOps assessment completo para {CLIENTE}.

Contexto:
- Cloud provider(s): {PROVIDERS} (AWS/Azure/GCP/multi-cloud)
- Gasto mensual estimado: {MAGNITUD_GASTO} (rango)
- Numero de cuentas cloud: {NUM_CUENTAS}
- Servicios principales: {SERVICIOS_TOP}
- Tiene equipo FinOps: {SI/NO}
- IaC disponible: {PATH_IAC}
- Billing exports disponibles: {SI/NO}

Parametros:
- {MODO}: piloto-auto
- {FORMATO}: markdown
- {MODO_OPERACIONAL}: assessment
- {VARIANTE}: tecnica

Entregar las 8 secciones completas con:
- Maturity scoring con evidencia observable
- Waste identification cuantificado en magnitudes
- Optimization roadmap en 3 tiers (quick wins, medium, strategic)
- Unit economics framework con metricas de negocio
```

---

## 2. Quick Waste Scan

**Cuando:** Necesitas un snapshot rapido del desperdicio cloud. No hay billing data, solo IaC o descripcion de arquitectura.

```
Ejecutar waste scan rapido de la infraestructura cloud de {CLIENTE}.

Input disponible:
- {PATH_IAC_O_DESCRIPCION}

Solo las secciones S3 (Waste) y S4 (Quick Wins, Tier 1).
No necesito maturity scoring ni governance model.

Parametros:
- {MODO}: desatendido
- {FORMATO}: markdown
- {VARIANTE}: ejecutiva

Para cada recurso con waste potencial, indicar:
- Categoria de waste
- Magnitud estimada (rango mensual)
- Accion correctiva
- Esfuerzo y riesgo
```

---

## 3. Reservation / Savings Plan Optimization

**Cuando:** El cliente tiene commitments existentes (RI/SP/CUD) y quiere optimizar la estrategia.

```
Analizar estrategia de rate optimization para {CLIENTE}.

Datos de commitments actuales:
- {DESCRIPCION_COMMITMENTS} (tipos, coverage, utilizacion)
- Cloud provider(s): {PROVIDERS}
- Gasto on-demand mensual: {MAGNITUD}
- Workloads elegibles para spot: {DESCRIPCION}

Solo la seccion S6 (Rate Optimization Strategy) en profundidad.

Incluir:
- Coverage actual vs optima
- Analisis de utilizacion de commitments existentes
- Recomendaciones de nuevos commitments (tipo, termino, payment option)
- Estrategia de spot/preemptible
- Timeline de implementacion
```

---

## 4. Kubernetes Cost Analysis

**Cuando:** El cliente tiene workloads en Kubernetes y quiere visibilidad y optimizacion de costos K8s.

```
Analizar costos de Kubernetes para {CLIENTE}.

Contexto K8s:
- Provider: {EKS/AKS/GKE/self-managed}
- Numero de clusters: {NUM_CLUSTERS}
- Nodos totales: {NUM_NODOS}
- Tipo de nodos: {TIPOS_INSTANCIA}
- Namespaces productivos: {NUM_NAMESPACES}
- Herramienta de cost allocation: {KUBECOST/OPENCOST/NINGUNA}

Foco en:
- Cost allocation por namespace/deployment
- Over-provisioned requests/limits
- Cluster autoscaling efficiency
- Spot/preemptible node pools
- Recomendaciones de rightsizing (VPA/HPA)

Parametros:
- {FORMATO}: markdown
- {VARIANTE}: tecnica
```

---

## 5. Multi-Cloud Cost Comparison

**Cuando:** El cliente opera en multiples clouds y quiere entender la distribucion y oportunidades cross-cloud.

```
Comparativa de costos multi-cloud para {CLIENTE}.

Contexto:
- AWS: {MAGNITUD_AWS}/mes — servicios: {SERVICIOS_AWS}
- Azure: {MAGNITUD_AZURE}/mes — servicios: {SERVICIOS_AZURE}
- GCP: {MAGNITUD_GCP}/mes — servicios: {SERVICIOS_GCP}

Analizar:
- Distribucion de gasto por provider y servicio
- Oportunidades de workload placement optimization
- Commitment strategies por provider (SP vs CUD vs reservations)
- Herramienta de gestion multi-cloud recomendada
- Riesgos de vendor lock-in vs cost optimization

Parametros:
- {FORMATO}: markdown
- {VARIANTE}: tecnica
```

---

## 6. FinOps Practice Setup (Greenfield)

**Cuando:** La organizacion no tiene practica FinOps y quiere establecer una desde cero.

```
Disenar practica FinOps para {CLIENTE} desde cero.

Contexto organizacional:
- Tamano: {NUM_EMPLEADOS} empleados
- Equipos de ingenieria: {NUM_EQUIPOS}
- Gasto cloud actual: {MAGNITUD}/mes
- Cloud provider(s): {PROVIDERS}
- Tagging strategy existente: {SI/NO}
- Herramientas de cost management actuales: {HERRAMIENTAS}

Solo las secciones S1 (Maturity baseline), S7 (Governance design), S8 (Operating Model).
Modo: framework (no assessment ni optimization).

Entregar:
- Maturity baseline scoring
- Modelo de governance en 3 niveles
- Estructura de equipo recomendada (CoE vs embedded vs hibrido)
- RACI para decisiones de costo
- Plan de herramientas
- Plan de training
- Roadmap de adopcion (3-6-12 meses)
```

---

## 7. Executive Cost Report

**Cuando:** Necesitas un reporte mensual ejecutivo para CTO/CFO.

```
Generar reporte ejecutivo de costos cloud para {CLIENTE}, mes de {MES_ANO}.

Datos disponibles:
- {DATOS_BILLING_O_DESCRIPCION}
- Gasto total del mes: {MAGNITUD}
- Gasto mes anterior: {MAGNITUD_ANTERIOR}

Parametros:
- {FORMATO}: html
- {VARIANTE}: ejecutiva

Incluir:
- KPI dashboard (gasto total, variacion MoM, waste %, unit economics)
- Top 5 servicios por gasto con tendencia
- Top 3 anomalias del mes
- Estado de optimizaciones en progreso
- Commitment coverage actualizado
- Recomendacion de accion inmediata (1 sola, la mas impactante)

Maximo 2 paginas. Visual, con graficos y semaforos.
```

---

## 8. Post-Migration Cost Validation

**Cuando:** Despues de una migracion cloud, validar que los costos estan dentro de lo proyectado.

```
Validar costos post-migracion para {CLIENTE}.

Contexto de migracion:
- Tipo: {ON-PREM_A_CLOUD / CLOUD_A_CLOUD / MODERNIZACION}
- Fecha de migracion: {FECHA}
- Costo proyectado: {MAGNITUD_PROYECTADA}/mes
- Costo real actual: {MAGNITUD_REAL}/mes
- Desviacion: {PORCENTAJE}%

Analizar:
- Causa raiz de la desviacion (si >10%)
- Recursos provisionados vs planificados
- Optimizaciones post-migracion no ejecutadas
- Ajustes de rightsizing necesarios
- Impacto en unit economics (antes vs despues)
- Plan de correccion si costo excede proyeccion

Parametros:
- {FORMATO}: markdown
- {VARIANTE}: tecnica
```

---

**Autor:** Javier Montaño | **Última actualización:** 13 de marzo de 2026

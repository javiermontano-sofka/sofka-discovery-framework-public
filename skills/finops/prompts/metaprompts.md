# Metaprompts — FinOps (Cloud Financial Operations)

> Estrategias de meta-nivel para maximizar la efectividad de esta skill.
> Los metaprompts no producen entregables — optimizan COMO se producen.

---

## 1. Unit Economics First (Economia Unitaria Primero)

**Proposito:** Anclar TODO el analisis de costos en metricas de negocio antes de hablar de infraestructura. Evita el error comun de reportar "$X en EC2" sin conectar con el valor de negocio.

```
Antes de analizar cualquier servicio cloud o recurso individual, establece primero:

1. METRICAS DE NEGOCIO: ¿Cuales son las unidades de valor del cliente?
   - Transacciones procesadas
   - Usuarios activos
   - API calls servidas
   - GB de datos procesados
   - Otro: {METRICA_NEGOCIO}

2. LINEA BASE: ¿Cual es el costo por unidad actual?
   - Si hay datos: calcular directamente
   - Si no hay datos: estimar con benchmark de industria + [INFERENCIA]

3. BENCHMARK: ¿Como se compara con la industria?
   - SaaS: infrastructure 5-10% of revenue
   - E-commerce: $0.01-$0.05 per transaction
   - Fintech: $0.005-$0.02 per transaction
   - Data platform: $0.05-$0.15 per GB

4. ANCHORING: Cada hallazgo de waste u optimizacion debe responder:
   "Si implementamos esto, ¿como cambia el costo por {UNIDAD_NEGOCIO}?"

REGLA: Nunca reportes un ahorro en dolares absolutos sin tambien
reportar el impacto en unit economics.
```

---

## 2. Waste Hunting Protocol (Protocolo de Caza de Desperdicio)

**Proposito:** Sistematizar la identificacion de waste para no dejar dinero en la mesa. Sigue un orden de probabilidad de hallazgo (de mas comun a menos comun).

```
Ejecuta el waste hunting en este orden preciso. Cada paso tiene un
"probability score" de encontrar waste significativo:

PASO 1 — Non-prod left on (95% probabilidad)
- Staging/Dev instances running 24/7 sin schedule
- RDS Multi-AZ en non-prod
- Clusters de prueba olvidados
- Si encuentras esto: magnitud tipica = 15-25% del gasto non-prod

PASO 2 — Oversized instances (90% probabilidad)
- EC2: utilization <30% en promedio
- RDS: CPU <20% promedio, memory <50%
- ElastiCache: memory <40%
- Si encuentras esto: magnitud tipica = 20-40% del costo del recurso

PASO 3 — Orphaned resources (85% probabilidad)
- EBS volumes sin attach
- Elastic IPs sin asociar
- Snapshots >90 dias sin politica
- Load balancers sin targets
- NAT Gateways en subnets sin trafico
- Si encuentras esto: magnitud tipica = $500-$5K/mes por categoria

PASO 4 — Over-provisioned K8s (80% si usa K8s)
- Requests muy por encima del usage real
- Limits sin relacion con requests
- Nodos con baja utilizacion de CPU/memory
- Si encuentras esto: magnitud tipica = 25-40% del gasto K8s

PASO 5 — Rate optimization gaps (75% probabilidad)
- Coverage <50% con uso estable
- RIs con baja utilizacion (<70%)
- Sin Savings Plans
- Sin spot para workloads elegibles
- Si encuentras esto: magnitud tipica = 15-30% del gasto compute

PASO 6 — Data transfer y logging (60% probabilidad)
- Cross-AZ data transfer excesivo
- CloudWatch log retention indefinida
- S3 sin lifecycle policies
- Si encuentras esto: magnitud tipica = $1K-$10K/mes

PARA CADA HALLAZGO:
- Categorizar: {idle | oversized | orphaned | over-provisioned | misconfigured | unoptimized-rate}
- Cuantificar: rango de magnitud mensual
- Evidenciar: [CONFIG] si hay dato, [INFERENCIA] si es estimacion
- Remediar: accion concreta + esfuerzo + riesgo
```

---

## 3. Commitment Optimization Ladder (Escalera de Optimizacion de Compromisos)

**Proposito:** Sistematizar la estrategia de rate optimization. Evitar el error comun de comprar RIs/SPs prematuramente sin haber optimizado el uso primero.

```
REGLA FUNDAMENTAL: Nunca recomiendes comprar commitments sobre
recursos con waste. Primero reduce, luego compromete.

ESCALON 1 — Limpiar (prerequisito)
Antes de CUALQUIER commitment:
- Eliminar waste identificado (S3)
- Implementar rightsizing (S4 Tier 1)
- Establecer schedules non-prod
- VALIDAR: el baseline de uso es representativo del futuro

ESCALON 2 — Analizar patrones
Con el baseline limpio:
- Identificar "steady state" compute (usage minimo constante)
- Identificar "variable" compute (picos, batch, estacional)
- Identificar "ephemeral" compute (CI/CD, testing, one-off)
- REGLA: Solo comprometer sobre steady state

ESCALON 3 — Seleccionar instrumentos
Para steady state:
- AWS: Compute Savings Plans (primero) > EC2 Savings Plans > RIs
- Azure: Savings Plans (primero) > Reservations
- GCP: Spend-based CUDs (primero) > Resource-based CUDs
- REGLA: Preferir instrumentos flexibles sobre especificos

Para variable:
- Spot/Preemptible para workloads tolerantes a interrupcion
- Auto-scaling agresivo para el resto
- REGLA: Nunca comprometer sobre uso variable

ESCALON 4 — Calibrar parametros
- Termino: 1 ano (por defecto) vs 3 anos (solo si uso >95% predecible)
- Payment: No Upfront (default) vs Partial (si cash flow permite) vs All (maximo descuento)
- Coverage target: 55-65% commitment + 15-20% spot + 20-30% on-demand
- REGLA: Empezar conservador, incrementar trimestralmente

ESCALON 5 — Automatizar y monitorear
- Implementar alertas de utilizacion de commitments (<80%)
- Review trimestral de coverage y mix
- Considerar herramienta de auto-commitment (ProsperOps, etc.) en Run maturity
```

---

## 4. FinOps Maturity Progression (Progresion de Madurez FinOps)

**Proposito:** Disenar el camino de madurez FinOps realista para la organizacion. Evitar el error de proponer "Run" maturity a una organizacion en "Pre-Crawl".

```
Antes de proponer mejoras de madurez, diagnostica el punto de partida
HONESTAMENTE. Usa esta escala extendida:

PRE-CRAWL (Score 1/5):
- Nadie mira los costos cloud
- No hay tagging
- No hay budgets
- Cada equipo despliega lo que quiere
→ PRESCRIPCION: Visibility first. Cost Explorer + tags basicos + alerta mensual al CTO.
   Meta: llegar a Crawl en 3 meses. NO proponer governance compleja.

CRAWL (Score 2/5):
- Alguien mira los costos (pero no es su responsabilidad principal)
- Tags parciales, budgets a nivel cuenta
- Optimization reactiva ("cuando la factura sorprende")
→ PRESCRIPCION: Quick wins + tagging enforcement + cost review mensual.
   Meta: llegar a Walk en 6 meses. Nombrar un FinOps Lead (part-time).

WALK (Score 3/5):
- FinOps Lead dedicado (al menos part-time)
- Cost allocation por equipo/producto
- Budgets por equipo, alertas configuradas
- Optimization proactiva (backlog de rightsizing)
→ PRESCRIPCION: Unit economics + commitment strategy + governance automation.
   Meta: llegar a Run en 12 meses. Embedded FinOps champions.

RUN (Score 4-5/5):
- Equipo FinOps maduro (CoE + champions)
- Real-time visibility, automated governance
- Unit economics integrados en decision-making
- Commitment management optimizado
→ PRESCRIPCION: GreenOps, advanced automation, cross-team benchmarking.
   Meta: continuous improvement. Evangelizacion interna.

REGLA DE ORO: Solo avanzar 1 nivel por ciclo (6 meses).
Saltar niveles genera fracaso y frustracion.

ANTI-PATRONES DE PROGRESION:
- Comprar herramienta enterprise (Apptio) sin tener cultura → tool shelfware
- Implementar chargeback sin showback previo → resistencia politica
- Automatizar governance sin buy-in de engineering → shadow IT
- Proponer unit economics sin visibilidad basica → metricas sin sentido
```

---

**Autor:** Javier Montaño | **Última actualización:** 13 de marzo de 2026

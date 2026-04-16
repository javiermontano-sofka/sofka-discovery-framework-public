# Body of Knowledge — FinOps (Cloud Financial Operations)

> Fuentes academicas, industriales y practicas que fundamentan la metodologia de analisis financiero cloud.

---

## 1. Frameworks Fundacionales

### FinOps Foundation Framework v1.0 (J.R. Storment & Mike Fuller)
- **Relevancia:** Marco de referencia principal. Define las 3 fases (Inform, Optimize, Operate), el modelo de madurez (Crawl/Walk/Run), y los 6 dominios de capacidad que estructuran las 8 secciones del skill.
- **Uso en el skill:** El modelo Crawl/Walk/Run fundamenta S1 (Maturity Assessment). Las 3 fases organizan la logica de las secciones S2-S8. Los 6 dominios (Understand, Quantify, Optimize, Govern, Organize, Culture) son los ejes de evaluacion.
- **Fuente:** Storment, J.R. & Fuller, M. (2023). *Cloud FinOps*, 2nd Edition. O'Reilly Media.
- **Referencia complementaria:** FinOps Foundation (2024). "FinOps Framework". finops.org/framework

### AWS Well-Architected Framework — Cost Optimization Pillar
- **Relevancia:** Define 5 best practices para optimizacion de costos en AWS: practice cloud financial management, expenditure and usage awareness, cost-effective resources, manage demand and supply, optimize over time.
- **Uso en el skill:** Fundamenta S4 (Optimization) y S6 (Rate Optimization) para workloads AWS. Los 5 principios son checklist items en la evaluacion.
- **Fuente:** AWS (2024). "Cost Optimization Pillar — AWS Well-Architected Framework". docs.aws.amazon.com

### Azure Cost Management Best Practices
- **Relevancia:** Framework de Microsoft para gestion financiera cloud: cost analysis, budgets, advisor recommendations, export automation.
- **Uso en el skill:** Referencia para S2 (Visibility) y S7 (Governance) en entornos Azure. Azure Advisor recommendations alimentan S4.
- **Fuente:** Microsoft (2024). "Azure Cost Management best practices". learn.microsoft.com

### GCP Cost Optimization Guide
- **Relevancia:** Guia de Google Cloud para committed use discounts (CUDs), sustained use discounts (SUDs), active assist recommendations, BigQuery slot optimization.
- **Uso en el skill:** Referencia para S6 (Rate Optimization) en entornos GCP. CUDs y SUDs tienen dinamica distinta a AWS RI/SP.
- **Fuente:** Google Cloud (2024). "Cost optimization on Google Cloud". cloud.google.com

---

## 2. Modelos de Madurez y Gobernanza

### FinOps Maturity Model (Crawl/Walk/Run)
- **Relevancia:** Modelo de madurez en 3 niveles aplicado a 6 dominios de capacidad. Permite evaluar el estado actual y definir el roadmap de mejora.
- **Crawl:** Reporting basico, costos agregados, conciencia limitada.
- **Walk:** Allocation automatizada, budgets activos, optimization reactiva.
- **Run:** Real-time visibility, automated governance, unit economics integrados en decision-making.
- **Fuente:** FinOps Foundation (2024). "FinOps Maturity Model". finops.org/framework/maturity-model

### ITIL 4 — Financial Management Practice
- **Relevancia:** Complementa el framework FinOps con la perspectiva ITSM: budgeting, accounting, charging (showback/chargeback).
- **Uso en el skill:** S7 (Governance) y S8 (Operating Model) toman conceptos de ITIL para la integracion con procesos IT existentes.
- **Fuente:** AXELOS (2019). *ITIL 4: Create, Deliver and Support*. Chapter 5.

### Gartner Cloud Cost Optimization Guide
- **Relevancia:** Perspectiva analista. Identifica que las organizaciones desperdician 25-35% de su gasto cloud. Define 6 pilares: rightsizing, scheduling, coverage, architecture, waste elimination, governance.
- **Uso en el skill:** El dato de 25-35% waste es benchmark para S3. Los 6 pilares complementan el framework de la FinOps Foundation.
- **Fuente:** Gartner (2024). "How to Optimize Your Cloud Costs". ID: G00XXXXXX.

---

## 3. Cost Allocation y Unit Economics

### Tagging Strategy Best Practices (Multi-cloud)
- **Relevancia:** La base de la visibilidad de costos. Sin tags correctos, la allocation es imposible.
- **Taxonomia recomendada:** Owner, Environment, Project/Product, CostCenter, Application, Team, Compliance.
- **Enforcement:** Tag policies (AWS Organizations), Azure Policy, GCP Organization Policy.
- **Fuente:** FinOps Foundation (2024). "Tagging and Labeling". finops.org/framework/capabilities/tagging-labeling

### Unit Economics for Cloud (FinOps Foundation)
- **Relevancia:** Concepto clave de S5. Transforma gasto absoluto en metricas de negocio: cost-per-transaction, cost-per-customer, cost-per-API-call, cost-per-GB-processed.
- **Uso en el skill:** S5 define las metricas de unit economics y establece el framework de medicion continua.
- **Fuente:** FinOps Foundation (2024). "Unit Economics". finops.org/framework/capabilities/unit-economics

---

## 4. Rate Optimization y Commitment Management

### AWS Savings Plans & Reserved Instances
- **Relevancia:** Mecanismos de descuento por compromiso en AWS. Savings Plans (Compute SP, EC2 SP, SageMaker SP) ofrecen flexibilidad. RIs ofrecen mayor descuento con menor flexibilidad.
- **Uso en el skill:** S6 analiza coverage ratio, utilization rate, y recomienda mix optimo de SP/RI/On-Demand.
- **Fuente:** AWS (2024). "Savings Plans User Guide". docs.aws.amazon.com

### Azure Reservations & Savings Plans
- **Relevancia:** Azure ofrece reservations (1-3 anos) y Azure Savings Plans. La dinamica es similar a AWS pero con diferencias en flexibilidad y scope.
- **Fuente:** Microsoft (2024). "Azure Reservations". learn.microsoft.com

### GCP Committed Use Discounts (CUDs)
- **Relevancia:** GCP ofrece CUDs resource-based y spend-based. Ademas, Sustained Use Discounts (SUDs) se aplican automaticamente.
- **Fuente:** Google Cloud (2024). "Committed use discounts". cloud.google.com

---

## 5. Certificaciones y Formacion

### FinOps Certified Practitioner (FOCP)
- **Relevancia:** Certificacion base de la FinOps Foundation. Cubre los fundamentos del framework, las 3 fases, los 6 dominios, y las mejores practicas.
- **Uso en el skill:** El curriculo del FOCP define el "minimo viable" de conocimiento FinOps que el skill debe cubrir.
- **Fuente:** FinOps Foundation (2024). "FinOps Certified Practitioner". learn.finops.org

### FinOps Certified Engineer (FOCE)
- **Relevancia:** Certificacion tecnica. Profundiza en implementacion: tagging automation, cost APIs, custom dashboards, RI/SP management tools.
- **Fuente:** FinOps Foundation (2024). "FinOps Certified Engineer". learn.finops.org

---

## 6. Glosario

| Termino | Definicion |
|---------|-----------|
| **FinOps** | Cloud Financial Operations — practica cultural y disciplina que combina sistemas, mejores practicas y cultura para aumentar la capacidad de una organizacion de entender costos cloud y tomar decisiones informadas |
| **Crawl/Walk/Run** | Modelo de madurez de 3 niveles de la FinOps Foundation |
| **Showback** | Reportar costos a los equipos sin cobro real (visibilidad) |
| **Chargeback** | Cobrar costos reales a los centros de costo responsables |
| **Unit Economics** | Costo por unidad de negocio (transaccion, usuario, API call) |
| **Rightsizing** | Ajustar el tamano de recursos cloud al uso real |
| **Reserved Instance (RI)** | Compromiso de uso de 1-3 anos a cambio de descuento (AWS/Azure) |
| **Savings Plan (SP)** | Compromiso de gasto por hora a cambio de descuento flexible (AWS/Azure) |
| **Committed Use Discount (CUD)** | Equivalente a RI/SP en GCP |
| **Sustained Use Discount (SUD)** | Descuento automatico de GCP por uso continuo mensual |
| **Spot Instance** | Capacidad cloud sobrante a precio reducido (hasta 90% descuento), interrumpible |
| **Preemptible VM** | Equivalente a spot en GCP (max 24h) |
| **Waste** | Gasto cloud que no genera valor de negocio (idle, oversized, zombie) |
| **Zombie Resource** | Recurso cloud activo que nadie usa ni mantiene |
| **Tagging** | Etiquetado de recursos cloud para allocation y governance |
| **Cost Anomaly** | Desviacion significativa del patron de gasto normal |
| **EDP** | Enterprise Discount Program (AWS) — descuento global por compromiso de gasto |
| **PPA** | Private Pricing Agreement — acuerdo de precios negociado con cloud provider |
| **Blended Rate** | Tarifa promedio que combina on-demand, RI, SP y spot |
| **Amortized Cost** | Costo que distribuye el pago upfront de RI/SP a lo largo del periodo |
| **GreenOps** | Extension de FinOps que incluye impacto ambiental (emisions de carbono) |

---

**Autor:** Javier Montaño | **Última actualización:** 13 de marzo de 2026

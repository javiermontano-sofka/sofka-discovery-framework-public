# Body of Knowledge — Data Mesh Strategy

> Fuentes academicas, industriales y practicas que fundamentan la metodologia de evaluacion y diseño de data mesh.

---

## 1. Frameworks Fundacionales

### Zhamak Dehghani — Data Mesh: Delivering Data-Driven Value at Scale (O'Reilly, 2022)
- **Relevancia:** Texto canonico que define los 4 principios de data mesh. Es la referencia primaria para TODA la skill.
- **4 Principios:**
  1. **Domain Ownership:** Los dominios de negocio son dueños y responsables de sus datos analíticos, no solo los operacionales.
  2. **Data as a Product:** Los datos se tratan como productos con usuarios, SLAs, documentacion, y calidad garantizada.
  3. **Self-Serve Data Platform:** Infraestructura que reduce la friccion cognitiva para que los dominios publiquen y consuman data products.
  4. **Federated Computational Governance:** Politicas globales implementadas de forma automatizada, con autonomia local para los dominios.
- **Uso en el skill:** Los 4 principios son los ejes de evaluacion de S1 (Readiness) y la estructura de S2-S5. El modelo de adoption de Dehghani informa S6 (Roadmap).
- **Fuente:** Dehghani, Z. (2022). *Data Mesh: Delivering Data-Driven Value at Scale*. O'Reilly Media.

### Zhamak Dehghani — How to Move Beyond a Monolithic Data Lake (ThoughtWorks, 2019)
- **Relevancia:** Articulo seminal que introdujo el concepto de data mesh. Describe el problema de los data lakes monoliticos y propone la descentralizacion.
- **Fuente:** Dehghani, Z. (2019). "How to Move Beyond a Monolithic Data Lake to a Distributed Data Mesh". martinfowler.com

### Martin Fowler — Data Mesh Principles and Logical Architecture
- **Relevancia:** Articulo que formaliza la arquitectura logica de data mesh: data product quantum, sidecar, data product developer experience plane, mesh supervision plane.
- **Uso en el skill:** Informa S4 (Platform Requirements) con la arquitectura de referencia.
- **Fuente:** Fowler, M. (2022). "Data Mesh Principles and Logical Architecture". martinfowler.com

---

## 2. Data Management

### DAMA-DMBOK2 — Data Management Body of Knowledge
- **Relevancia:** Framework de referencia para data management que cubre 11 areas de conocimiento. Data mesh no reemplaza DMBOK — lo complementa con un modelo organizacional descentralizado.
- **11 Knowledge Areas:** Data Governance, Data Architecture, Data Modeling, Data Storage, Data Security, Data Integration, Document & Content, Reference & Master Data, Data Warehousing & BI, Metadata, Data Quality.
- **Uso en el skill:** S5 (Federated Governance) se fundamenta en DMBOK para las politicas globales. S3 (Data Product) usa DMBOK Data Quality dimensions.
- **Fuente:** DAMA International (2017). *DAMA-DMBOK: Data Management Body of Knowledge*, 2nd Edition. Technics Publications.

### Andrew Jones — Data Contracts
- **Relevancia:** Concepto emergente que complementa data mesh. Un data contract es un acuerdo formal entre productor y consumidor de datos que define schema, quality, SLAs, y semantica.
- **Uso en el skill:** S3 (Data Product Design) integra data contracts como mecanismo de interoperabilidad entre data products.
- **Fuente:** Jones, A. (2023). *Driving Data Quality with Data Contracts*. O'Reilly Media.
- **Complemento:** PayPal Engineering (2023). "The next big data challenge: Data Contracts".

---

## 3. Domain-Driven Design

### Eric Evans — Domain-Driven Design (2003)
- **Relevancia:** Base conceptual para el Principio 1 (Domain Ownership). Los bounded contexts de DDD son la base para la descomposicion de dominios en data mesh.
- **Conceptos clave:** Bounded Context, Ubiquitous Language, Context Map, Anti-Corruption Layer, Aggregate.
- **Uso en el skill:** S2 (Domain Decomposition) aplica DDD bounded contexts para identificar dominios de datos. El Context Map informa las interacciones entre data products.
- **Fuente:** Evans, E. (2003). *Domain-Driven Design: Tackling Complexity in the Heart of Software*. Addison-Wesley.

### Vaughn Vernon — Implementing Domain-Driven Design (2013)
- **Relevancia:** Guia practica de implementacion de DDD. Detalla como identificar bounded contexts y diseñar aggregates.
- **Uso en el skill:** Complementa S2 cuando la organizacion no tiene experiencia con DDD.
- **Fuente:** Vernon, V. (2013). *Implementing Domain-Driven Design*. Addison-Wesley.

---

## 4. Organizacion y Equipos

### Team Topologies — Matthew Skelton & Manuel Pais (2019)
- **Relevancia:** Framework de diseño organizacional que define 4 tipos de equipos: Stream-aligned, Enabling, Platform, Complicated Subsystem. Directamente aplicable a la estructura de equipos de data mesh.
- **Uso en el skill:** S7 (Org Change Requirements) usa Team Topologies para recomendar estructura: Stream-aligned teams = domain teams, Platform team = data platform team, Enabling team = data mesh enablement.
- **Fuente:** Skelton, M. & Pais, M. (2019). *Team Topologies: Organizing Business and Technology Teams for Fast Flow*. IT Revolution Press.

### ThoughtWorks Technology Radar
- **Relevancia:** Radar bianual que trackea la adopcion y madurez de data mesh y conceptos relacionados.
- **Estado 2025-2026:** Data mesh en "Adopt" (para organizaciones con >5 dominios y madurez suficiente). Data contracts en "Trial". Data products en "Adopt".
- **Fuente:** ThoughtWorks (2025). "Technology Radar Vol. 32". thoughtworks.com/radar

---

## 5. Data Quality

### Data Quality Dimensions (DAMA & ISO 8000)
- **Relevancia:** Definen las dimensiones de calidad que cada data product debe garantizar.
- **6 Dimensiones Core:** Accuracy, Completeness, Timeliness (Freshness), Consistency, Uniqueness, Validity.
- **Uso en el skill:** S3 (Data Product Design) incluye quality dimensions en la spec de cada data product. S5 (Governance) define umbrales globales minimos.
- **Fuente:** ISO 8000:2011 — Data Quality. DAMA-DMBOK Chapter 13.

### Great Expectations & dbt Tests
- **Relevancia:** Herramientas para automatizar validacion de data quality. Representan el estado del arte en quality-as-code.
- **Uso en el skill:** S4 (Platform Requirements) recomienda herramientas de data quality automation como parte de la self-serve platform.
- **Fuente:** Great Expectations (2024). "Open Source Data Quality". greatexpectations.io

---

## 6. Glosario

| Termino | Definicion |
|---------|-----------|
| **Data Mesh** | Enfoque socio-tecnico descentralizado para la gestion de datos analiticos, basado en 4 principios: domain ownership, data as a product, self-serve platform, federated governance |
| **Data Product** | Unidad autonoma de datos con dueno, SLAs, documentacion, schema, y calidad garantizada. Es consumible de forma independiente |
| **Domain Ownership** | Principio que asigna la responsabilidad de datos analiticos al dominio de negocio que los genera, no a un equipo central |
| **Bounded Context** | Concepto de DDD que define el limite logico de un modelo de dominio. En data mesh, define los limites de un dominio de datos |
| **Self-Serve Data Platform** | Infraestructura que abstrae la complejidad tecnica para que los dominios publiquen y consuman data products sin depender de un equipo central |
| **Federated Computational Governance** | Modelo de governance que define politicas globales (naming, quality, security) implementadas de forma automatizada, con autonomia local |
| **Data Contract** | Acuerdo formal entre productor y consumidor de un data product que define schema, quality expectations, SLAs, y semantica |
| **Data Product Owner** | Rol responsable del data product: define prioridades, SLAs, calidad, y roadmap del producto de datos |
| **Data Product Quantum** | Termino de Dehghani para la unidad arquitectonica minima de un data product: code + data + infrastructure |
| **Sidecar** | Componente que provee capacidades transversales al data product (governance, observability, discovery) sin acoplamiento |
| **Context Map** | Diagrama de DDD que muestra las relaciones entre bounded contexts. En data mesh, muestra relaciones entre dominios de datos |
| **Schema Registry** | Servicio centralizado que almacena y versiona los schemas de data products para garantizar interoperabilidad |
| **Data Catalog** | Repositorio de metadata que permite descubrir, entender y acceder a data products disponibles |
| **Data Lineage** | Trazabilidad end-to-end del origen, transformaciones y destinos de los datos |
| **Policy-as-Code** | Practica de expresar politicas de governance como codigo ejecutable y versionable |
| **CDC (Change Data Capture)** | Tecnica para capturar cambios en bases de datos operacionales como eventos, util para alimentar data products |
| **Data Lakehouse** | Arquitectura que combina data lake (storage flexible) con data warehouse (query optimizado). Complementaria a data mesh |
| **Showback/Chargeback (data)** | Asignacion de costos de infraestructura de datos a los dominios que la consumen |

---

**Autor:** Javier Montaño | **Última actualización:** 13 de marzo de 2026

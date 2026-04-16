# BI Architecture — Body of Knowledge

## Core Concepts
- **Semantic Layer**: Abstraction between raw data and business users that defines metrics, dimensions, and relationships
- **Metrics Catalog**: Centralized registry of all business metrics with definitions, owners, and calculation logic
- **Self-Service Analytics**: Enabling business users to explore data and create their own analyses without engineering support
- **KPI Hierarchy**: Structured relationship between strategic outcomes, tactical measures, and operational inputs
- **Dashboard Taxonomy**: Classification of dashboards by audience and purpose (strategic, tactical, operational)
- **Row-Level Security (RLS)**: Restricting data access at the row level based on user identity or role

## Patterns
- **Headless BI**: Semantic layer decoupled from visualization, serving metrics via API to any consumer
- **OLAP Cube Pre-Aggregation**: Pre-computing common aggregations for sub-second dashboard performance
- **Embedded Analytics**: Integrating BI visualizations directly into operational applications
- **Metric Trees**: Hierarchical decomposition of top-level KPIs into driver metrics
- **Data Storytelling**: Combining data visualization with narrative context for executive communication

## Tools & Frameworks
- **Looker / Cube.js / MetricFlow**: Semantic layer and metrics definition platforms
- **Tableau / Power BI / Superset**: BI visualization and dashboard platforms
- **dbt Metrics / Lightdash**: dbt-native metrics layer and BI integration
- **Preset / Metabase**: Open-source self-service BI tools
- **Monte Carlo / Sifflet**: Data observability for BI data reliability

## References
- Ralph Kimball — *The Data Warehouse Toolkit* (3rd ed., 2013) — Dimensional modeling for BI
- Brent Dykes — *Effective Data Storytelling* (2019)
- Thoughtspot — *The Modern Analytics Stack* (2023)
- dbt Labs — *The Semantic Layer Guide*

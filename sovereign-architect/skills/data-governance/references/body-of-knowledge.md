# Data Governance — Body of Knowledge

## Core Concepts
- **Data Catalog**: Centralized inventory of data assets with metadata, lineage, and quality information
- **Data Mesh**: Domain-oriented decentralized data ownership and architecture
- **Data Classification**: Categorizing data by sensitivity level to apply appropriate controls and policies
- **Data Retention**: Policies governing how long data is stored, archived, and eventually deleted
- **PII (Personally Identifiable Information)**: Data that can identify an individual, subject to privacy regulations
- **Data Product**: A self-describing, quality-assured, discoverable dataset with an owner and SLA
- **Right to be Forgotten**: GDPR requirement for organizations to delete personal data upon request

## Patterns
- **Federated Governance**: Domain teams own their data with centralized standards and tooling
- **Data Contracts**: Schema + quality + SLA agreements between data producers and consumers
- **Privacy by Design**: Building privacy controls into systems from the start rather than retrofitting
- **Column-Level Security**: Fine-grained access control at the column level for sensitive fields
- **Data Virtualization**: Providing a unified view across data sources without physical movement

## Tools & Frameworks
- **DataHub / Apache Atlas / Amundsen**: Open-source data catalog and metadata platforms
- **Collibra / Alation**: Enterprise data governance and catalog platforms
- **BigID / OneTrust**: PII discovery and privacy compliance automation
- **Apache Ranger / AWS Lake Formation**: Fine-grained data access control
- **Open Data Contract Standard**: Specification for data contracts between producers and consumers

## References
- Zhamak Dehghani — *Data Mesh* (2022)
- DAMA International — *DMBOK: Data Management Body of Knowledge* (2nd ed., 2017)
- GDPR — General Data Protection Regulation (EU 2016/679)
- NIST Privacy Framework v1.0

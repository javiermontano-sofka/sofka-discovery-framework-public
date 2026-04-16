# Cloud Migration — Body of Knowledge

## Core Concepts
- **7R Framework**: Rehost (lift-and-shift), Replatform (lift-and-optimize), Refactor (re-architect), Repurchase (replace with SaaS), Retire (decommission), Retain (keep on-prem), Relocate (hypervisor-level move)
- **Migration Wave**: A batch of workloads migrated together, sequenced by dependency and risk
- **Cutover Window**: The time period during which traffic is switched from source to target environment
- **Data Replication Strategy**: One-time bulk transfer vs. continuous replication (CDC) for database migration
- **Landing Zone**: Pre-configured cloud environment with networking, security, and governance ready for workloads
- **Migration Factory**: Repeatable, assembly-line approach to migrating workloads at scale

## Patterns
- **Strangler Fig Migration**: Incrementally route traffic from legacy to new system behind a facade
- **Blue-Green Cutover**: Run both environments simultaneously, switch traffic atomically
- **Database-Last Migration**: Migrate application tier first, keep database on-prem with hybrid connectivity
- **Dual-Write**: Write to both old and new systems during transition (requires conflict resolution)
- **Phased Rollout**: Migrate by user segment or geography to limit blast radius

## Tools & Frameworks
- **AWS Migration Hub / Azure Migrate / GCP Migrate**: Cloud-native migration assessment and tracking
- **AWS DMS / Azure DMS**: Database Migration Services for continuous replication
- **CloudEndure / Zerto**: Server replication for rehost migrations
- **Terraform / Pulumi**: Infrastructure as code for landing zone provisioning
- **Apache Kafka / Debezium**: Change data capture for real-time data sync during migration

## References
- AWS Cloud Adoption Framework — Migration methodology
- Google Cloud Migration Center — Assessment and planning guides
- Gregor Hohpe — *The Software Architect Elevator* (2020) — Migration strategy chapters
- Gartner 7R Migration Framework documentation

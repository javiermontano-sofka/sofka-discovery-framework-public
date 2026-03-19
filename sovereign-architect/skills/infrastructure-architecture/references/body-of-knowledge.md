# Infrastructure Architecture — Body of Knowledge

## Core Concepts
- **Landing Zone**: Pre-configured cloud environment with networking, security, IAM, and governance ready for workloads
- **Infrastructure as Code (IaC)**: Declarative definition of infrastructure that is version-controlled and reproducible
- **High Availability (HA)**: System design that eliminates single points of failure across compute, network, and storage
- **Disaster Recovery (DR)**: Strategy and procedures for recovering systems after catastrophic failure (RTO/RPO-driven)
- **Network Segmentation**: Dividing networks into zones with controlled traffic flow between segments
- **Capacity Planning**: Forecasting resource needs based on growth projections, traffic patterns, and seasonal peaks

## Patterns
- **Multi-AZ Deployment**: Distribute workloads across availability zones for resilience against zone failures
- **Hub-and-Spoke Network**: Central hub VPC for shared services with spoke VPCs per workload/team
- **Immutable Infrastructure**: Replace rather than update — deploy new instances instead of patching in place
- **Blue-Green Infrastructure**: Maintain two identical environments for zero-downtime deployments
- **Policy-as-Code Guardrails**: Automated compliance checks on infrastructure changes before deployment

## Tools & Frameworks
- **Terraform / OpenTofu**: Multi-cloud infrastructure as code with state management
- **Pulumi / CDK**: Infrastructure as code using general-purpose programming languages
- **Spacelift / Atlantis**: Terraform automation and collaboration platforms
- **AWS Control Tower / Azure Landing Zones**: Managed landing zone implementations
- **Checkov / tfsec**: Static analysis for IaC security and compliance

## References
- AWS Well-Architected Framework — Reliability and Performance Efficiency pillars
- Google Cloud Architecture Framework — Infrastructure design principles
- Kief Morris — *Infrastructure as Code* (2nd ed., 2020)
- Betsy Beyer et al. — *Site Reliability Engineering* (2016)

# Trade-Off Analyzer — Use Case Prompts

## Prompt 1: Cloud Provider Selection
> We're migrating from on-premises to cloud. Evaluate AWS, Azure, and GCP for our healthcare SaaS platform. Key drivers: HIPAA compliance maturity (weight 0.30), managed Kubernetes offering quality (0.25), data residency options in Latin America (0.20), cost at our scale of 200 VMs equivalent (0.15), and team existing certifications — 4 AWS, 1 Azure, 0 GCP (0.10). Produce a weighted decision matrix with sensitivity analysis on the top two drivers.

## Prompt 2: Monolith vs. Microservices vs. Modular Monolith
> Our 5-person startup has a Django monolith serving 10K DAU. We need to decide whether to stay monolithic, adopt a modular monolith architecture, or begin microservices decomposition. Criteria: development velocity (0.35), operational complexity (0.25), scalability runway to 500K DAU (0.20), hiring/onboarding ease (0.20). Include a reversibility analysis for each option.

## Prompt 3: Real-Time Data Pipeline Technology
> Compare Apache Kafka, AWS Kinesis, and Redpanda for our IoT telemetry pipeline handling 1M events/second. Drivers: throughput at target scale (0.25), exactly-once semantics support (0.25), operational simplicity (0.20), ecosystem/connector availability (0.15), cost per GB processed (0.15). Run sensitivity analysis varying the throughput and cost weights by +/-15%.

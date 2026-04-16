# Microservices Decomposer — Use Case Prompts

## Prompt 1: E-Commerce Monolith Decomposition
> We have a Django monolith handling: product catalog, user accounts, shopping cart, checkout, payments, inventory, shipping, reviews, and recommendations. The main pain points are: the payments team can't deploy without the catalog team's approval, inventory updates cause lock contention affecting checkout, and the recommendations engine is CPU-intensive and slows down the entire application. Identify bounded contexts, produce a Context Map, and recommend a decomposition order with justification.

## Prompt 2: Healthcare Platform Service Boundaries
> A healthcare SaaS handles: patient registration, appointment scheduling, electronic health records (EHR), lab results, prescriptions, billing, and insurance claims. Regulatory requirements demand that EHR data never leaves a specific compliance boundary. Identify bounded contexts considering both domain and regulatory boundaries. Define integration patterns between services, paying special attention to data that crosses compliance boundaries.

## Prompt 3: FinTech Lending Platform
> Our lending platform monolith manages: loan applications, credit scoring, underwriting decisions, loan servicing, payment processing, collections, and regulatory reporting. The credit scoring module needs to call 5 external bureau APIs and takes 3-15 seconds per application. Decompose into services with special attention to: the long-running credit scoring process, the strong consistency requirement between underwriting decisions and loan creation, and the regulatory requirement that all decision data be immutable and auditable for 7 years.

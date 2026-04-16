# ADR Generator — Use Case Prompts

## Prompt 1: Database Selection Decision
> We need to choose between PostgreSQL, MongoDB, and DynamoDB for our new order-management service. The system handles ~50K orders/day, requires ACID transactions for payment processing, and must support flexible product catalogs. Generate an ADR that evaluates all three options against our drivers: consistency, schema flexibility, operational cost, and team expertise (currently strong in SQL).

## Prompt 2: Retroactive Monolith-to-Microservices Decision
> Six months ago we decided to decompose our monolithic billing system into three microservices (invoicing, payments, dunning). Document this as a retroactive ADR. The main drivers were independent scaling of the payments module during peak periods and enabling the dunning team to deploy independently. We considered: full decomposition, modular monolith, and the hybrid approach we chose (three services sharing a database initially).

## Prompt 3: Frontend Framework Migration
> Our React 16 application needs to be modernized. The team is evaluating: upgrading to React 19 with Server Components, migrating to Next.js App Router, or adopting Astro with React islands. Decision drivers are: SEO performance (currently poor), bundle size (currently 2.1 MB), developer onboarding speed, and backward compatibility with our existing component library (200+ components). Generate the ADR with a weighted scoring matrix.

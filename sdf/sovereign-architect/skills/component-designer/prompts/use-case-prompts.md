# Component Designer — Use Case Prompts

## Prompt 1: E-Commerce Platform Decomposition
> Design the component architecture for an e-commerce platform that handles product catalog, shopping cart, checkout, payments, inventory management, and customer notifications. Define clear boundaries, public interfaces for each component, and specify which components communicate synchronously vs. asynchronously. The system is built in TypeScript with a NX monorepo.

## Prompt 2: Legacy CRM Modularization
> We have a 300K-line Java Spring Boot monolith CRM. The main pain point is that changes to the "contact management" module frequently break "opportunity tracking" because they share database tables and domain models. Design a component boundary strategy that untangles these two areas while keeping them in the same deployable unit (modular monolith approach). Include interface contracts and a migration sequence.

## Prompt 3: Multi-Tenant SaaS Component Catalog
> Design the component architecture for a multi-tenant B2B SaaS platform that needs: tenant isolation, per-tenant configuration, shared infrastructure services (auth, billing, notifications), and a plugin system for tenant-specific extensions. Produce a component catalog with dependency rules and a Mermaid diagram.

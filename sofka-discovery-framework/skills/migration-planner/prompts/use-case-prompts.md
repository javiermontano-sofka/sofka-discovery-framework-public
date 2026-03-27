# Migration Planner — Use Case Prompts

## Prompt 1: Monolith to Microservices via Strangler Fig
> Plan a Strangler Fig migration for a 500K-line Java monolith serving a banking core system. The first module to extract is "Loan Origination" which handles 2K applications/day. The monolith uses Oracle DB with 200+ stored procedures. Constraints: zero-downtime requirement, regulatory audit trail must be maintained throughout, and the team can only dedicate 3 engineers to the migration. Produce a phased plan with rollback procedures.

## Prompt 2: On-Premises to Cloud Data Migration
> Plan the migration of 15TB of PostgreSQL data from on-premises servers to AWS Aurora PostgreSQL. The database serves a real-time analytics platform with 5-second SLA for dashboard queries. Requirements: maximum 2 hours of planned downtime, data validation with row-count and checksum verification, and a rehearsal schedule. The source database receives ~500 writes/second during peak hours.

## Prompt 3: Legacy Frontend Re-Platform
> Plan the migration of a jQuery + server-rendered JSP application to a React SPA with a BFF API layer. The application has 150 pages, 40 forms, and 3 third-party widget integrations. The approach should allow incremental migration (some pages on React, others still on JSP) during the transition. Include a feature-parity tracking mechanism and user acceptance testing strategy.

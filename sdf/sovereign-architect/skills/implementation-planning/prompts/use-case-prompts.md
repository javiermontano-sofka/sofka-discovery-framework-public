# Implementation Planning — Use Case Prompts

## Prompt 1: Authentication System Migration
> "We decided to migrate from session-based auth to JWT tokens. We have 15 API endpoints, a React frontend, and a mobile app consuming the same API. Create a phased implementation plan with rollback strategy for each phase. The system cannot have downtime."

## Prompt 2: Database Schema Refactoring
> "We need to split our monolithic `users` table into separate `accounts`, `profiles`, and `preferences` tables. We have 3 services reading from this table and 2 writing to it. Plan the migration in phases that maintain backward compatibility at every step."

## Prompt 3: Monorepo Extraction
> "We're extracting our shared component library from a monorepo into its own npm package. 4 internal apps depend on it. Create a file change plan for each phase, including the CI/CD pipeline changes needed and the rollback procedure if the extracted package breaks consumers."

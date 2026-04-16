# Rollback Strategy — Use Case Prompts

## Prompt 1: Database Schema Migration Rollback
> We are adding a `preferences` JSONB column to the `users` table and migrating data from 5 legacy preference tables into it. The table has 2M rows. Design a rollback strategy that handles partial migration failure, includes data validation, and identifies the point-of-no-return. Include exact SQL for compensating migrations.

## Prompt 2: Microservice Version Rollback
> Our payment service v3.2 introduced a new event schema that downstream consumers (billing, analytics, notifications) have adapted to. If v3.2 fails in production, design the rollback plan covering the payment service itself and all downstream services. Address event schema backward compatibility and in-flight transaction handling.

## Prompt 3: Infrastructure Rollback
> We are migrating from a self-managed Kubernetes cluster to EKS with Terraform. The migration happens over a weekend with a 4-hour maintenance window. Design the rollback strategy if EKS fails health checks at any point during the migration. Include DNS cutover reversal, persistent volume handling, and secret re-mapping.

# Acceptance Criteria Writer — Use Case Prompts

## Prompt 1: E-Commerce Feature
> Write acceptance criteria for: "As a customer, I want to apply a promotional discount code during checkout so that I receive the advertised discount." Cover: valid codes, expired codes, already-used codes, minimum order amount requirements, stacking rules, and the UI feedback for each scenario.

## Prompt 2: API Endpoint
> Write acceptance criteria for a new `POST /api/v2/users/bulk-invite` endpoint that allows admins to invite up to 50 users at once via email. Cover: valid invitations, duplicate emails, invalid email formats, exceeding the limit, rate limiting, partial success handling, authorization, and the response payload structure.

## Prompt 3: Data Migration
> Write acceptance criteria for migrating user addresses from a single `address` text field to structured fields (street, city, state, zip, country). Cover: successful parsing, unparseable addresses, international formats, data validation, idempotency (running migration twice), rollback verification, and zero-downtime requirements.

# File Change Planner — Use Case Prompts

## Prompt 1: Feature Addition
> I need to add a user notification preferences module to our Node.js backend. The system currently has a `users` service, an `email` service, and a `notifications` service. Generate a complete file change manifest showing every file I need to create, modify, or touch — including tests, migrations, configs, and documentation. Score the blast radius and provide an execution order.

## Prompt 2: Library Migration
> We are migrating from Moment.js to date-fns across our React frontend. There are approximately 45 files importing Moment. Produce a phased file change plan that lets us migrate incrementally without breaking the app at any intermediate step. Include test file changes and any config/build changes needed.

## Prompt 3: API Endpoint Deprecation
> We need to deprecate and eventually remove the `/api/v1/reports/legacy` endpoint. It is consumed by 3 internal services and 2 external partners. Plan the file changes across all repositories involved, including versioning headers, deprecation notices, client migration guides, and the final deletion timeline. Tag each change with its risk level.

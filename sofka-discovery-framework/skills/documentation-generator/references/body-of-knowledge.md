# Documentation Generator — Body of Knowledge

## Core Concepts
- **README as Onboarding**: The README is the front door to a project — it must answer "what is this, how do I run it, how do I contribute" in under 2 minutes.
- **Architecture Decision Records (ADRs)**: Lightweight documents capturing the context, decision, and consequences of architecturally significant choices.
- **Runbooks**: Step-by-step operational procedures that enable any team member to perform critical tasks without tribal knowledge.
- **API Documentation**: Describes the contract between a service and its consumers — endpoints, parameters, responses, errors.
- **Documentation as Code**: Docs live in the repository, versioned with the code, reviewed in PRs, and built in CI.
- **Progressive Disclosure**: Layer documentation from overview (README) → usage (API docs) → operations (runbooks) → decisions (ADRs).

## Patterns & Practices
- **Nygard ADR Template**: Title, Status (proposed/accepted/deprecated/superseded), Context, Decision, Consequences.
- **Diátaxis Framework**: Four documentation modes — Tutorials, How-To Guides, Reference, Explanation.
- **Environment Variable Tables**: Name | Description | Default | Required | Example — standardized across all projects.
- **Executable Documentation**: Code snippets in docs are tested in CI (doctest, mdx-test, snippet-runner).
- **Changelog Conventions**: Keep a Changelog format with Added/Changed/Deprecated/Removed/Fixed/Security categories.

## Tools & Technologies
- **API Docs**: Swagger/OpenAPI, Redoc, Stoplight, Postman Collections.
- **Code Docs**: TypeDoc, JSDoc, Sphinx, Godoc, Rustdoc.
- **Static Sites**: Docusaurus, MkDocs, VitePress, GitBook.
- **ADR Tools**: adr-tools CLI, MADR template, Log4brains.
- **Diagram Tools**: Mermaid.js, PlantUML, Structurizr for C4 diagrams.

## References
- Michael Nygard, "Documenting Architecture Decisions" — ADR origin article.
- Diátaxis Documentation Framework — daniele.procida.net/documentation.
- Tom Preston-Werner, "Readme Driven Development" — README-first approach.
- Write the Docs Community — Best practices for technical writing.

# Documentation Auditor — Body of Knowledge

## Core Concepts
- **Docs-as-code**: Documentation versioned, reviewed, and tested alongside source code `[HECHO]`
- **Architecture Decision Records (ADRs)**: Lightweight documents capturing the context, decision, and consequences of architectural choices
- **Diátaxis framework**: Four documentation types — tutorials, how-to guides, reference, explanation — each serving different user needs `[HECHO]`
- **Documentation decay**: Docs degrade at a rate proportional to code change velocity; unmonitored docs become liabilities
- **Runbooks**: Step-by-step operational procedures for incident response; must be tested regularly
- **Code comments vs. documentation**: Comments explain "why"; docs explain "how to use" and "how it works"

## Patterns & Practices
- **README-driven development**: Write the README before writing code to clarify the user experience
- **Living documentation**: Auto-generated from code annotations, tests, or specs to prevent drift
- **Doc linting**: Vale, markdownlint, write-good for consistent style and grammar
- **Broken link detection**: Automated CI checks for internal and external link validity
- **Changelog automation**: Conventional commits + auto-generated changelogs (semantic-release, changesets)

## Tools & Technologies
- **Static site generators**: Docusaurus, MkDocs, VitePress, Nextra, mdBook
- **API doc generators**: Typedoc, Javadoc, Sphinx, Swagger/Redoc
- **Linters**: Vale (prose), markdownlint, remark-lint, alex (inclusive language)
- **Link checkers**: markdown-link-check, lychee, htmltest

## References
- Diátaxis documentation framework — divio.com/blog/documentation
- Michael Nygard — "Documenting Architecture Decisions" (ADR format)
- Google developer documentation style guide
- Write the Docs community — writethedocs.org

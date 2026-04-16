# Code Review Framework — Body of Knowledge

## Core Concepts
- **Review Dimensions**: The categories against which code is evaluated — correctness, design, readability, performance, security, testability.
- **Severity Classification**: BLOCKER (must fix before merge), WARNING (should fix, can be deferred with ticket), SUGGESTION (optional improvement).
- **Automated vs. Human Review**: Automate what machines do well (formatting, linting, coverage) so humans focus on design and correctness.
- **PR Size**: Smaller PRs get better reviews. Google's data shows review quality degrades significantly above 400 lines changed.
- **Review SLA**: A commitment to provide first feedback within a defined time window (typically 4-8 business hours).
- **Knowledge Distribution**: Reviews spread codebase knowledge across the team, reducing bus factor.

## Patterns & Practices
- **Conventional Comments**: Prefix review comments with labels: `blocker:`, `nit:`, `question:`, `suggestion:`, `praise:`.
- **Ship/Show/Ask**: Categorize PRs by risk — ship (auto-merge), show (merge then review), ask (review before merge).
- **Stacked PRs**: Break large changes into a series of small, dependent PRs that are reviewed incrementally.
- **Review Checklist Template**: A lightweight checklist embedded in the PR template for self-review before requesting peer review.
- **Author-Reviewer Contract**: Authors provide context (what, why, how to test); reviewers provide timely, constructive feedback.
- **Pair Programming as Review**: For complex changes, pair during implementation instead of reviewing after.

## Tools & Technologies
- **Linters**: ESLint, Prettier, Ruff, golangci-lint, RuboCop, ktlint.
- **SAST**: Semgrep, CodeQL, SonarQube, Snyk Code.
- **PR Automation**: Danger.js, Probot, GitHub Actions, CODEOWNERS.
- **Review Analytics**: LinearB, Sleuth, Haystack for review cycle metrics.

## References
- Google Engineering Practices — "How to do a code review" guide.
- Michaela Greiler, "Code Review Best Practices" — awesomecodereviews.com.
- Forsgren et al., "Accelerate" — Code review as a predictor of software delivery performance.
- Conventional Comments — conventionalcomments.org.

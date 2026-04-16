# Code Smell Detector — Use Case Prompts

## Prompt 1: Pre-Refactoring Smell Audit
> "We have a sprint dedicated to refactoring. Scan this codebase and identify the top 10 most impactful code smells — prioritized by blast radius and change frequency. For each smell, tell me exactly which files are affected and what refactoring operation would address it."

## Prompt 2: God Class Detection
> "I suspect we have several God Classes in our backend. Find all classes or modules that have too many responsibilities — measured by method count, line count, import fan-out, and number of unrelated public methods. Show me the evidence."

## Prompt 3: Duplication and Copy-Paste Audit
> "We keep finding bugs where a fix in one place doesn't get applied to the duplicated code elsewhere. Scan for structural duplication across the codebase — not just identical lines, but similar patterns that should probably be extracted into shared utilities."

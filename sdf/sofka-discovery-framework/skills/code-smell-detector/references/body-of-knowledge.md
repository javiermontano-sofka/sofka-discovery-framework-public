# Code Smell Detector — Body of Knowledge

## Core Concepts
- **Code smell definition**: A surface indication that usually corresponds to a deeper problem in the system. Coined by Kent Beck and popularized by Martin Fowler — smells are heuristics, not rules
- **Smell taxonomy**: Fowler's 5 categories (Bloaters, OO Abusers, Change Preventers, Dispensables, Couplers) provide a systematic scanning framework rather than ad-hoc "this looks bad"
- **Quantitative thresholds**: Smells become actionable when measured — function length in lines, cyclomatic complexity score, parameter count, nesting depth, file size. Without numbers, smell detection is subjective
- **Change coupling**: Files that always change together but are not in the same module reveal hidden coupling that no static analysis tool catches — only git history reveals it
- **Smell interaction**: Smells rarely exist in isolation. A God Class typically exhibits Feature Envy, Long Methods, and Shotgun Surgery simultaneously. Treating each independently misses the root cause
- **Context sensitivity**: Framework conventions (Rails controllers, React components, GraphQL resolvers) have different "normal" thresholds than general-purpose code. A 200-line React component with JSX is different from a 200-line utility function
- **Refactoring catalog alignment**: Each smell maps to specific refactoring operations — Extract Method, Move Method, Replace Conditional with Polymorphism. Detection without refactoring guidance is incomplete

## Patterns & Practices
- **Hotspot-first scanning**: Prioritize files with high complexity AND high change frequency (from git log). These are the highest-ROI targets for refactoring
- **Smell density mapping**: Calculate smells-per-file or smells-per-module to identify the most problematic areas of the codebase rather than individual instances
- **Threshold calibration**: Adjust thresholds per project — a 50-line function threshold that generates 500 findings is too aggressive; adjust to 80 lines and focus on the worst offenders
- **Temporal smell detection**: Track smell density over time (per commit or per sprint) to determine if code quality is improving or degrading
- **Dead code identification**: Combine static analysis (unreachable code, unused exports) with dynamic analysis (code coverage gaps) to confirm dead code before removing it

## Tools & Technologies
- **JavaScript/TypeScript**: ESLint with complexity rules, ts-prune (unused exports), dependency-cruiser (coupling), jscpd (copy-paste detection)
- **Multi-language**: SonarQube (cognitive complexity, duplications, code smells), Semgrep (pattern-based detection), CodeClimate
- **Git-based analysis**: git-of-theseus (codebase evolution), code-maat (change coupling and hotspots), git log mining scripts
- **Complexity metrics**: radon (Python), rubocop-metrics (Ruby), PMD (Java), Go vet + staticcheck (Go)
- **Duplication detection**: jscpd, CPD (PMD's Copy-Paste Detector), Simian, flay (Ruby)

## References
- "Refactoring" — Martin Fowler (canonical smell catalog and refactoring recipes)
- "Clean Code" — Robert C. Martin (function length, naming, SRP-based smell identification)
- "Your Code as a Crime Scene" — Adam Tornhill (combining complexity with change frequency for hotspot analysis)
- "Working Effectively with Legacy Code" — Michael Feathers (smell detection in untested codebases, seam identification)

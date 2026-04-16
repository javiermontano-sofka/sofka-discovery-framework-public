# Quality Engineering — Body of Knowledge

## Core Concepts
- **ISO 25010 Quality Model**: Eight quality characteristics — functional suitability, performance, compatibility, usability, reliability, security, maintainability, portability
- **Quality Gates**: Automated checkpoints in the delivery pipeline that enforce quality criteria before promotion
- **Defect Escape Rate**: Percentage of defects that reach production vs. total defects found (lower is better)
- **Shift-Left Quality**: Moving quality activities earlier in the SDLC (design, code) for faster feedback
- **Quality Metrics**: Leading indicators (predict quality) and lagging indicators (measure outcomes)
- **Continuous Quality**: Quality embedded in every step of development rather than a separate phase
- **Quality Champions**: Developers who advocate for quality practices within their teams

## Patterns
- **Quality Scorecard**: Aggregated quality score per service/team combining multiple metrics
- **Risk-Based Testing**: Prioritizing test effort based on business risk and change frequency
- **Chaos Engineering**: Deliberately injecting failures to verify system resilience
- **Quality Feedback Loop**: Metrics from production feeding back into development practices
- **Progressive Quality Gates**: Increasingly strict criteria as code moves toward production

## Tools & Frameworks
- **SonarQube / SonarCloud**: Code quality analysis, coverage, and quality gate enforcement
- **Codecov / Coveralls**: Code coverage tracking and PR integration
- **Percy / Chromatic**: Visual regression testing for UI components
- **axe-core / Pa11y**: Accessibility testing automation
- **Allure / TestRail**: Test management and reporting platforms

## References
- ISO/IEC 25010:2011 — Systems and software quality models
- Lisa Crispin & Janet Gregory — *Agile Testing Condensed* (2019)
- Michael Bolton & James Bach — *Rapid Software Testing* methodology
- Google Testing Blog — *Testing at Scale* practices

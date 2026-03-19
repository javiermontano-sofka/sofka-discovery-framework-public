# Dynamic SME — Body of Knowledge

## Core Concepts

1. **Domain Calibration**: The process of adjusting analytical depth, vocabulary, and frameworks to match the specific domain under review. A database SME thinks differently than a security SME.
2. **Mental Model Activation**: Loading the relevant set of heuristics, trade-offs, and patterns that an expert in this domain would apply. Each domain has its own decision frameworks.
3. **T-Shaped Expertise**: Broad knowledge across software engineering with deep expertise in the specific domain at hand. The dynamic SME shifts the "deep" axis as context changes.
4. **Heuristic Assessment**: Applying domain-specific rules of thumb to quickly identify issues. Experts recognize patterns; novices analyze from first principles.
5. **Expertise Boundary Awareness**: Knowing the limits of domain knowledge and explicitly flagging when a finding requires deeper specialist consultation.
6. **Domain-Specific Trade-offs**: Every domain has characteristic tensions (consistency vs availability, security vs usability, throughput vs latency) that shape architectural decisions.

## Patterns

1. **Domain Pattern Language**: Each technical domain has a vocabulary of named patterns and anti-patterns. The SME applies these as diagnostic tools.
2. **Severity Calibration**: What constitutes "critical" varies by domain. A SQL injection is critical in security; a missing index is critical in performance; a circular dependency is critical in architecture.
3. **Framework Selection**: Choosing the right assessment framework for the domain (OWASP for security, DORA for DevOps, 12-Factor for cloud-native, SOLID for design).
4. **Tooling Ecosystem Awareness**: Recommendations must reference tools and approaches that are standard in the domain, not generic alternatives.

## Tools

1. **Domain Assessment Frameworks**: OWASP, DORA, TOGAF, 12-Factor, SOLID, CAP theorem, etc.
2. **Pattern Catalogs**: Gang of Four, Enterprise Integration Patterns, Cloud Design Patterns, Microservices Patterns.
3. **Benchmark Databases**: Industry-specific performance and maturity benchmarks.
4. **Domain-Specific Linters/Scanners**: SonarQube (code quality), OWASP ZAP (security), Lighthouse (web performance).

## References

1. Evans, E. — *Domain-Driven Design* (Addison-Wesley, 2003).
2. Feynman, R. — *Surely You're Joking, Mr. Feynman!* — On the importance of understanding vs superficial knowledge.
3. Dreyfus, H. & Dreyfus, S. — *Mind Over Machine* (Free Press, 1986) — Five-stage model of skill acquisition.

---
name: sofka-testing-strategy
description: >
  Test strategy design — pyramid, automation, E2E, contract testing, shift-left, test data management.
  Use when the user asks to "design test strategy", "build test automation", "implement contract testing",
  "manage test data", "define quality gates", or mentions test pyramid, Pact, Playwright, Cypress, coverage targets, flaky tests, chaos engineering.
model: opus
context: fork
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
---

# Testing Strategy: Quality Assurance Architecture & Automation Design

Testing strategy defines how quality is verified, automated, and measured across the software delivery lifecycle. The skill produces comprehensive test architectures covering shape selection, automation frameworks, contract testing, performance and chaos testing, test data management, and quality metrics that shift quality left while maintaining production confidence.

## Principio Rector

**Un test que no puede fallar no protege nada.** La estrategia de testing no se mide por el porcentaje de coverage — se mide por la confianza que genera para hacer deploy un viernes a las 5pm.

### Filosofía de Testing Strategy

1. **Test pyramid is a guide, not a rule.** La forma correcta (pyramid, trophy, honeycomb, diamond) depende de la arquitectura del sistema, no de un dogma de la industria.
2. **Contract testing for microservices.** Si tienes N servicios con M consumidores, E2E entre todos es O(N*M). Contract testing reduce eso a O(N+M).
3. **Test data management is architecture.** Datos compartidos entre tests = flakiness garantizada. Cada test crea, usa, y limpia sus propios datos.

## Inputs

The user provides a project or system name as `$ARGUMENTS`. Parse `$1` as the **project/system name** used throughout all output artifacts.

**Parameters:**
- `{MODO}`: `piloto-auto` (default) | `desatendido` | `supervisado` | `paso-a-paso`
  - **piloto-auto**: Auto para shape selection y tool matrix, HITL para contract testing decisions y chaos engineering scope.
  - **desatendido**: Cero interrupciones. Estrategia completa con supuestos documentados.
  - **supervisado**: Autónomo con checkpoint en pyramid design y contract testing setup.
  - **paso-a-paso**: Confirma cada test shape, framework selection, contract scope, y chaos plan.
- `{FORMATO}`: `markdown` (default) | `html` | `dual`
- `{VARIANTE}`: `ejecutiva` (~40% — S1 pyramid + S3 contracts + S6 metrics) | `técnica` (full 6 sections, default)

Before generating strategy, detect the codebase context:

```
!find . -name "*.test.*" -o -name "*.spec.*" -o -name "*test*" -type d -o -name "jest*" -o -name "pytest*" -o -name "cypress*" | head -20
```

Use detected testing frameworks, languages, and existing test structure to tailor recommendations.

If reference materials exist, load them:

```
Read ${CLAUDE_SKILL_DIR}/references/testing-patterns.md
```

---

## When to Use

- Designing test strategy for new projects or test infrastructure overhaul
- Establishing test automation frameworks and CI integration
- Implementing contract testing for microservices or API consumers
- Introducing performance testing and chaos engineering practices
- Building test data management and environment strategies
- Defining quality metrics, coverage targets, and quality gates
- Reducing flaky tests and improving test suite reliability

## When NOT to Use

- Application code architecture and design patterns
- CI/CD pipeline design and deployment automation
- Production monitoring and incident response
- Load testing and capacity planning as primary focus

---

## Delivery Structure: 6 Sections

### S1: Test Shape Selection & Pyramid Design

Define the test architecture shape with ratio targets and ROI-based prioritization.

**Shape selection decision matrix:**

| System Type | Recommended Shape | Ratio (Unit:Integration:E2E) | Rationale |
|---|---|---|---|
| Backend API, business logic-heavy | **Pyramid** (Fowler) | 70:20:10 | Pure functions, fast unit tests dominate |
| Frontend SPA, UI-heavy | **Trophy** (Kent C. Dodds) | 20:50:20 + static 10 | Integration tests provide best ROI for component interactions |
| Microservices, many boundaries | **Honeycomb** | 10:70:20 | Integration across service boundaries matters most |
| Monolith, legacy | **Ice cream cone** (invert it) | Start E2E, add unit as refactored | Characterization tests first, unit tests on new code |

**Testing Trophy (Kent C. Dodds):** Static analysis at base, then unit, then *integration as the largest layer*, then E2E at top. The trophy argues integration tests provide the best confidence-to-cost ratio — they combine realistic coverage with reasonable speed. "Write tests. Not too many. Mostly integration." As E2E tooling matures (Playwright, Vitest Browser Mode), the trophy's top layer grows increasingly cost-effective.

**Produce:**
- Chosen test shape with justification for the system type
- Layer definitions: what each test level covers, what it trusts from the layer below
- ROI-based prioritization: test what breaks most often, costs most when broken, or changes most frequently
- Shift-left strategy: testing earlier (IDE, pre-commit, PR gate) reduces fix cost 10-100x
- Coverage targets: 80% line coverage for business logic, 60% overall — floors, not ceilings

**Key decisions:**
- Coverage as gate vs. guide: gate for critical paths (>80%), guide for everything else
- Test-first vs. test-after: TDD for complex business logic, test-after for CRUD and integration
- Maintenance budget: allocate 15-20% of development time to test maintenance

### S2: Test Automation Framework

Design the automation infrastructure including tool selection, patterns, and execution strategy.

**Tool selection matrix:**

| Language/Platform | Unit | Integration | E2E | Visual Regression |
|---|---|---|---|---|
| JavaScript/TypeScript | Vitest, Jest | Testing Library, Supertest | Playwright | Chromatic, Percy |
| Python | pytest | pytest + Testcontainers | Playwright | Percy |
| Java/Kotlin | JUnit 5, jqwik | Spring Boot Test, Testcontainers | Playwright, Selenium | Percy |
| .NET | xUnit, NUnit | WebApplicationFactory | Playwright | Percy |
| Mobile (iOS) | XCTest | XCUITest | Detox, Appium | Percy |
| Mobile (Android) | JUnit, Espresso | Espresso | Detox, Appium | Percy |

**Produce:**
- Page Object Model / Screen Object: encapsulate UI interactions, isolate selector changes
- Test data factories: builder pattern for test fixtures, avoid shared mutable state
- Parallel execution: test isolation enables parallel runs, reducing CI time
- Test categorization: fast (unit, <1s), medium (integration, <10s), slow (E2E, <60s)
- CI trigger mapping: unit on every push, integration on PR, E2E on merge to main
- Local developer experience: tests run in <30s for the module being changed

### S3: Contract & API Testing

Ensure service interfaces remain compatible through consumer-driven contracts and schema validation.

**Produce:**
- Consumer-driven contracts: consumers define expected interactions; providers verify compatibility
- Pact workflow: consumer writes Pact test --> generates contract --> provider verifies --> Pact Broker stores
- Specmatic/OpenAPI: schema-first contract testing from API specifications
- Schema validation: request/response validation against OpenAPI/JSON Schema in CI
- Backward compatibility: breaking change detection before deployment
- can-i-deploy checks before promoting to production
- Event contract testing: schema registry (Avro, Protobuf) for message-driven contracts

**Contract testing decision matrix:**

| Scenario | Approach | Tool |
|---|---|---|
| Internal microservices, multiple consumers | Consumer-driven | Pact |
| Public API, schema-first | Provider-driven | Specmatic, Prism |
| Event-driven, async messaging | Schema registry | Confluent Schema Registry, AWS Glue |
| GraphQL | Schema validation | Apollo Studio, GraphQL Inspector |

### S4: Performance & Chaos Testing

Integrate performance validation and failure injection into the testing lifecycle.

**Produce:**
- Load testing in CI for critical paths (every release candidate, not every build)
- Performance budgets: response time per endpoint; regression alert when p95 degrades >10%
- Chaos engineering: inject failures in controlled environments. Define steady state hypothesis first.
- Fault injection patterns: pod termination, network latency, disk pressure, dependency unavailability
- Game days: scheduled chaos exercises, simulate production incidents in staging
- Blast radius control: start small (single pod), expand to zone, then region

**Chaos maturity model:**

| Level | Practice | Environment |
|---|---|---|
| 1 - Learning | Manual fault injection, document results | Staging only |
| 2 - Automated | Scheduled chaos experiments in CI | Staging |
| 3 - Production | Canary chaos with automatic rollback | Production canary |
| 4 - Advanced | Continuous chaos, GameDays, cross-team | Production |

Tools: Chaos Monkey, Litmus, Gremlin, or custom fault injection. Require automatic rollback if safety thresholds exceeded.

### S5: Test Data Management

Design strategies for creating, managing, and cleaning test data across environments.

**Produce:**
- Synthetic data generation: factories producing realistic fake data (Faker, custom generators)
- Data anonymization: production data scrubbed of PII for realistic test datasets
- Environment strategy: ephemeral environments per PR (ideal), shared staging (common)
- Seed and reset patterns: database seeded before suite, reset between runs, no shared state
- Test isolation: each test creates its own data, cleans up after, never depends on others' data
- Compliance: test data must not contain real customer data in non-production environments

**Database strategy per test level:**

| Test Level | Strategy | Tools |
|---|---|---|
| Unit | In-memory, mocked | H2, SQLite, mocks |
| Integration | Containerized, real engine | Testcontainers |
| E2E | Seeded staging or ephemeral | Terraform, Docker Compose |
| Performance | Production-scale anonymized | Custom ETL, Faker at scale |

### S6: Advanced Techniques & Quality Metrics

Incorporate modern testing approaches and define measurable quality indicators.

**Property-based testing:** Define properties that must hold for *all* inputs instead of hand-writing examples (e.g., "encode then decode returns original"). Generate hundreds of random inputs; shrink failures to minimal reproducible cases. Particularly effective for parsers, serializers, algorithms, and state machines.

| Language | Tool | Integration |
|---|---|---|
| JS/TS | fast-check | Jest, Vitest |
| Python | Hypothesis | pytest |
| Java | jqwik | JUnit 5 |
| Scala | ScalaCheck | ScalaTest |
| Haskell | QuickCheck | HSpec |

**Mutation testing:** Seed small faults (mutants) into production code and verify tests catch them. Line coverage measures quantity; mutation testing measures quality.

| Language | Tool | Target Score | CI Cadence |
|---|---|---|---|
| Java | PIT/pitest | >80% on critical paths | Nightly |
| JS/TS/.NET | Stryker | >80% on critical paths | Nightly |
| Python | mutmut | >80% on critical paths | Nightly |

Run on CI nightly, not per-commit (too slow). Focus on critical business logic modules, not the entire codebase.

**Visual regression testing:** Capture screenshots of UI components/pages, compare against baselines pixel-by-pixel or perceptually.

| Tool | Strength | Best For |
|---|---|---|
| Chromatic | Storybook-native, component-level | Design systems, component libraries |
| Percy | Cross-browser, full-page | Multi-browser apps, full pages |
| Playwright screenshots | Free, CI-integrated | Budget-conscious, custom pipelines |
| BackstopJS | Open source, self-hosted | Self-hosted requirement |

**Test impact analysis:** Map code changes to affected tests using coverage data. Run only tests that exercise changed code paths. Tools: Launchable, Gradle Enterprise predictive test selection. Reduces CI time 40-70% in large codebases while maintaining confidence.

**Quality metrics — track these:**
- Coverage trends: line, branch, and mutation coverage over time (not point-in-time)
- Defect escape rate: defects found in production vs. found in testing (lower = better)
- Flaky test rate: quarantine after 2 flakes, fix within sprint, delete if unfixable after 2 sprints
- Test execution time: total run time, pass rate, failure categories
- Quality gates: PR merge requires passing tests + coverage threshold + no critical vulnerabilities

---

## Trade-off Matrix

| Decision | Enables | Constrains | When to Use |
|---|---|---|---|
| **Heavy unit testing** | Fast feedback, cheap maintenance | Misses integration issues | Business logic-heavy, pure functions |
| **E2E-heavy strategy** | Catches user-facing bugs | Slow, flaky, expensive | Small apps, critical journeys only |
| **Contract testing** | Decoupled deployment, fast verification | Setup overhead, team coordination | Microservices, multi-team consumers |
| **Chaos engineering** | Reveals hidden failures | Risk of impact, needs monitoring | Production-ready with observability |
| **Mutation testing** | Validates test quality | Slow, high compute | Critical business logic modules |
| **Property-based testing** | Finds edge cases humans miss | Learning curve, slower tests | Parsers, serializers, algorithms |

---

## Assumptions

- Codebase is under version control with CI/CD pipeline available
- Team has testing experience or is willing to invest in upskilling
- Test environments can be provisioned (local, CI, staging)
- Quality targets are aligned with business risk tolerance

## Limits

- Does not design application architecture
- Does not build CI/CD pipelines
- Does not monitor production systems
- Coverage numbers alone do not guarantee quality; test quality matters more than quantity
- Strategy effectiveness depends on team discipline and maintenance investment

---

## Edge Cases

**Greenfield Project:**
Start with unit test framework from day one. Add integration tests as external dependencies emerge. Defer E2E until user journeys stabilize. Establish conventions early.

**Legacy System with No Tests:**
Start with characterization tests (capture current behavior). Add integration tests around critical paths. Introduce unit tests for new code only. Do not attempt 80% coverage retroactively.

**Microservices with Many Consumers:**
Contract testing is essential. Set up Pact Broker or schema registry. Establish can-i-deploy gates. Each team owns their consumer tests.

**Monorepo with Multiple Teams:**
Use test impact analysis: detect changed modules, run only related tests. Shared test utilities in a common package. Team-owned suites with cross-team integration tests.

**Regulated Environment:**
Test evidence is a compliance artifact. Document test plans, link tests to requirements, archive results. Maintain a traceability matrix: requirement --> test case --> execution result.

---

## Validation Gate

Before finalizing delivery, verify:

- [ ] Test shape selected with justification for the system type
- [ ] Automation framework selected with team skill alignment
- [ ] Test categorization (fast/medium/slow) defined with CI trigger mapping
- [ ] Contract testing covers all cross-service boundaries
- [ ] Performance testing integrated into release process
- [ ] Test data strategy addresses isolation, compliance, and scale
- [ ] Flaky test management policy defined
- [ ] Quality gates are specific and measurable
- [ ] Mutation testing planned for critical business logic (>80% score target)
- [ ] Test maintenance budget explicitly allocated (15-20%)

## Cross-References

- **sofka-quality-engineering:** Strategic quality framework — maturity assessment, quality gates, shift-left practices
- **sofka-devsecops-architecture:** CI/CD pipeline where tests execute and gates are enforced
- **sofka-observability:** Production monitoring that validates test strategy effectiveness
- **sofka-software-architecture:** System architecture that determines test shape selection

## Output Format Protocol

| Format | Default | Description |
|--------|---------|-------------|
| `markdown` | Yes | Rich Markdown + Mermaid diagrams. Token-efficient. |
| `html` | On demand | Branded HTML (Design System). Visual impact. |
| `dual` | On demand | Both formats. |

Default output is Markdown with embedded Mermaid diagrams. HTML generation requires explicit `{FORMATO}=html` parameter.

## Output Artifact

**Primary:** `A-01_Testing_Strategy.html` — Executive summary, test shape design, automation framework, contract testing setup, chaos engineering plan, test data strategy, quality metrics dashboard.

**Secondary:** Test framework configuration files, Pact contract examples, quality gate definitions, flaky test management runbook.

---
**Autor:** Javier Montaño | **Última actualización:** 12 de marzo de 2026

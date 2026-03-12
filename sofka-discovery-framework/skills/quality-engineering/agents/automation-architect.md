# Automation Architect Agent

## Role

The **Automation Architect** evaluates test framework options, designs test automation architecture (framework selection, design patterns, CI/CD integration), and creates a detailed automation blueprint for the organization.

## Inputs Required

```
1. Technology Stack
   - Primary language(s): Java / JavaScript / Python / Go / C# / etc.
   - Frameworks: Spring Boot / Node.js / Django / ASP.NET / etc.
   - Databases: PostgreSQL / MongoDB / DynamoDB / etc.
   - Integration style: REST APIs / gRPC / Event Streams / SOAP

2. Test Scope & Strategy (from Quality Strategist output)
   - Test types needed: unit / integration / contract / API / E2E / performance
   - Test pyramid/diamond: recommended ratios (% unit, % integration, % E2E)
   - Execution frequency: per commit / per PR / nightly / weekly
   - Target test execution time: e.g., "PR gate must run in <15 min"

3. Current Automation Maturity
   - Frameworks in use: if any (JUnit, Jest, pytest, Cypress, etc.)
   - Test coverage: current baseline %
   - Automation experience: team skill level
   - Infrastructure: CI/CD tool (GitHub Actions, Jenkins, GitLab CI, etc.)

4. Constraints & Preferences
   - Team preferences: "We want to use Playwright if possible"
   - Budget constraints: "Prefer open-source tools"
   - Performance requirements: "Tests must complete in <15 minutes"
   - Scalability: "Need to run 500+ tests in parallel"

5. Existing Test Codebase (if any)
   - Lines of test code
   - Framework(s) used
   - Test coverage by type (unit %, integration %, E2E %)
   - Known pain points (flaky tests, slow tests, maintenance overhead)
```

## Assessment Activities

### 1. Framework Evaluation

For each test type, evaluate candidate frameworks:

| Framework | Language | Pros | Cons | Recommendation |
|-----------|----------|------|------|-----------------|
| **JUnit 5** | Java | industry standard, powerful assertions, parameterized tests | verbose setup | ✓ for Java unit tests |
| **Jest** | JavaScript | all-in-one (test runner + assertions + mocking), great DX | slower than Mocha | ✓ for JavaScript unit tests |
| **pytest** | Python | simple syntax, fixtures, plugins, fast | less strict typing | ✓ for Python unit tests |
| **RestAssured** | Java | fluent API, HTTP assertions, schema validation | Java-specific | ✓ for Java API tests |
| **Supertest** | JavaScript | minimal DSL, integrates with Express | Node.js only | ✓ for Node.js API tests |
| **Playwright** | Multi-language | fast, reliable, cross-browser, best DX | newer than Cypress | ✓ for modern E2E tests |
| **Cypress** | JavaScript | great DX, time-travel debugging, video | JavaScript only, flaky network tests | ✓ for React/Vue/Angular tests |
| **Selenium** | Multi-language | multi-browser support, mature | slow, flaky, poor DX | For legacy support only |
| **k6** | JavaScript + Go | cloud-native, easy to script, metrics-first | new tool, smaller ecosystem | ✓ for performance testing |
| **Gatling** | Scala | powerful DSL, async native, realistic load | Scala learning curve | For enterprise load testing |

### 2. Design Patterns Selection

Recommend patterns based on codebase:

- **Page Object Model**: For UI automation (locators in one place)
- **Screenplay Pattern**: For behavior-driven tests (human-readable)
- **Test Data Factory**: For test data generation (Builder pattern)
- **Golden Master**: For legacy systems (characterization tests)
- **Consumer-Driven Contract Testing**: For microservices (Pact)
- **Testcontainers**: For integration tests (real services in containers)

### 3. Architecture Decisions

Document:
- **Folder structure**: Where do tests live? (same repo vs separate repo)
- **Test data management**: Factories vs fixtures vs databases
- **Assertion libraries**: Built-in vs external (AssertJ, Chai, etc.)
- **Mocking libraries**: Mockito vs WireMock vs test doubles
- **Parallel execution**: How to run tests in parallel? (thread-safe? data isolation?)
- **Test reporting**: JUnit XML → CI integration; HTML reports; dashboard

### 4. CI/CD Integration

Design:
- **Test execution flow**: Which tests run when? (commit gate / PR gate / nightly)
- **Timeout policies**: Unit tests <5 min, Integration <15 min, E2E <60 min
- **Failure handling**: What triggers a gate to fail? (all pass, or 95% pass?)
- **Reporting**: Test results → JUnit XML → CI dashboard
- **Notifications**: Slack alerts for failures? (PR gate only, not nightly)

### 5. Repository Structure

Recommend folder structure:

```
project-root/
├── src/
│   ├── main/          (production code)
│   └── test/          (test code)
│       ├── unit/      (unit tests)
│       ├── integration/ (integration tests)
│       ├── contract/  (contract tests)
│       ├── api/       (API tests)
│       ├── e2e/       (E2E tests)
│       ├── fixtures/  (shared test data)
│       └── utils/     (test utilities, page objects, factories)
├── test-reports/      (generated test reports)
├── docker-compose.test.yml (test environment - databases, services)
└── pom.xml or package.json (test dependencies)
```

---

## Deliverable: Automation Architecture Document

Output format: **`01d_Automation_Architecture.html`**

### Document Sections

1. **Executive Summary** (1 page)
   - Framework recommendations per test type
   - Estimated effort to implement (weeks)
   - Key risks and mitigation

2. **Test Framework Selection** (3 pages)
   - Unit test framework: language-specific recommendation
   - Integration test framework: with fixtures/containers approach
   - API test framework: REST-specific tool
   - E2E framework: Playwright vs Cypress decision
   - Performance framework: k6 vs Gatling decision
   - Justification for each choice

3. **Design Patterns & Best Practices** (3 pages)
   - Page Object Model example (UI automation)
   - Test Data Factory example (data generation)
   - Consumer-Driven Contract Testing example
   - Testcontainers example (integration tests)
   - Code examples per pattern

4. **CI/CD Integration Architecture** (2 pages)
   - Pipeline stages with test execution flow
   - Test execution timeout per stage
   - Parallel execution strategy
   - Reporting integration (JUnit XML format)
   - Dashboard/notification setup

5. **Repository Structure & Standards** (1 page)
   - Folder hierarchy
   - Naming conventions (test class naming, test method naming)
   - Code organization standards
   - Dependency management

6. **Test Data Management** (2 pages)
   - Test data factory implementation approach
   - Data masking strategy (if needed)
   - Database reset strategy between tests
   - Production data handling (never use for testing)

7. **Implementation Roadmap** (1 page)
   - Week-by-week framework setup
   - Team training plan
   - Migration path (if replacing existing frameworks)
   - Success metrics

8. **Tool Configuration Templates** (2 pages)
   - Example `pom.xml` (for Maven projects)
   - Example `package.json` (for npm projects)
   - Example `pytest.ini` (for pytest)
   - CI/CD YAML template (GitHub Actions / GitLab CI / Jenkins)

---

## Key Recommendations Framework

### Decision Tree: Which Framework to Use?

```
IF testing JavaScript/TypeScript code:
  IF UI automation (React/Vue/Angular):
    RECOMMEND Playwright (if no IE11 support)
    ALTERNATIVE Cypress (if better DX preferred and JS-only OK)
  ELSE IF API testing (Node.js backend):
    RECOMMEND Supertest (if same project)
    ALTERNATIVE Postman + Newman (if non-developers doing testing)
  ELSE IF unit tests:
    RECOMMEND Jest (all-in-one, great DX)
    ALTERNATIVE Mocha + Chai (if simpler setup preferred)

ELSE IF testing Java code:
  IF unit tests:
    RECOMMEND JUnit 5 + Mockito
  ELSE IF API testing:
    RECOMMEND RestAssured (fluent API)
  ELSE IF integration tests:
    RECOMMEND JUnit 5 + Testcontainers (real database)

ELSE IF testing Python code:
  IF unit tests:
    RECOMMEND pytest (simple, powerful fixtures)
  ELSE IF API testing:
    RECOMMEND Requests library + pytest

ELSE IF testing performance/load:
  IF scripting needed (custom logic):
    RECOMMEND k6 (JavaScript-based, cloud-native)
  ELSE IF enterprise features needed:
    RECOMMEND Gatling (powerful DSL, realistic load)
  ELSE IF simple HTTP load test:
    RECOMMEND k6 or Apache Bench

ELSE IF testing microservices:
  ALWAYS ADD consumer-driven contract testing (Pact)
  REDUCE E2E tests (replace with contract tests)
```

---

## Patterns & Examples

### Pattern 1: Page Object Model (UI Automation)

```java
// ❌ BAD: Test directly manipulates locators
@Test
public void testLogin() {
  driver.findElement(By.id("username")).sendKeys("user@example.com");
  driver.findElement(By.id("password")).sendKeys("password123");
  driver.findElement(By.xpath("//button[@type='submit']")).click();
  assertEquals("Dashboard", driver.findElement(By.tagName("h1")).getText());
}

// ✓ GOOD: Page object encapsulates locators and interactions
class LoginPage {
  private WebDriver driver;
  private By usernameField = By.id("username");
  private By passwordField = By.id("password");
  private By loginButton = By.xpath("//button[@type='submit']");

  public LoginPage(WebDriver driver) {
    this.driver = driver;
  }

  public void fillUsername(String username) {
    driver.findElement(usernameField).sendKeys(username);
  }

  public void fillPassword(String password) {
    driver.findElement(passwordField).sendKeys(password);
  }

  public DashboardPage clickLogin() {
    driver.findElement(loginButton).click();
    return new DashboardPage(driver);
  }
}

@Test
public void testLogin() {
  LoginPage loginPage = new LoginPage(driver);
  loginPage.fillUsername("user@example.com");
  loginPage.fillPassword("password123");
  DashboardPage dashboard = loginPage.clickLogin();
  assertTrue(dashboard.isDisplayed());
}
```

### Pattern 2: Test Data Factory (Data Generation)

```java
// ❌ BAD: Hardcoded test data
@Test
public void testCreateUser() {
  User user = new User("john@example.com", "password123", "John");
  User created = userService.create(user);
  assertEquals("john@example.com", created.getEmail());
}

// ✓ GOOD: Data factory generates unique data
class UserFactory {
  private static int counter = 0;

  public static User createDefault() {
    counter++;
    return User.builder()
      .email("test-" + counter + "@example.com")  // Unique email
      .password("Test123!")
      .name("Test User " + counter)
      .build();
  }

  public static User createAdmin() {
    return createDefault().toBuilder()
      .role(Role.ADMIN)
      .build();
  }
}

@Test
public void testCreateUser() {
  User user = UserFactory.createDefault();
  User created = userService.create(user);
  assertEquals(user.getEmail(), created.getEmail());
}
```

### Pattern 3: Consumer-Driven Contract Testing (Pact)

```javascript
// Consumer test: Validates provider will return expected response
const { Matchers } = require('@pact-foundation/pact');

describe('User Service Consumer', () => {
  it('fetches user by ID', async () => {
    // Arrange: Define contract
    await provider
      .addInteraction({
        state: 'user 1 exists',
        uponReceiving: 'a request for user 1',
        withRequest: {
          method: 'GET',
          path: '/users/1',
        },
        willRespondWith: {
          status: 200,
          body: {
            id: 1,
            email: Matchers.email(),  // Any valid email
            name: Matchers.string(),   // Any string
          },
        },
      });

    // Act: Call API
    const user = await userServiceClient.getUser(1);

    // Assert: Contract validated
    expect(user.id).toBe(1);
  });
});

// Provider test: Validates provider meets contract
describe('User Service Provider', () => {
  // Verify provider responses match contract expectations
  // This runs consumer expectations against real provider
});
```

### Pattern 4: Testcontainers (Integration Tests)

```java
// ✓ GOOD: Real database in container; auto-cleanup

class UserRepositoryIntegrationTest {
  @Container
  static PostgreSQLContainer<?> database =
    new PostgreSQLContainer<>("postgres:13")
      .withDatabaseName("testdb")
      .withUsername("testuser")
      .withPassword("testpass");

  @BeforeEach
  void setup(JdbcConnectionDetails connectionDetails) {
    // Database is automatically started
    // Use connectionDetails to configure application
  }

  @Test
  void testUserPersistence() {
    // Use real database; no mocks
    User saved = userRepository.save(new User("john@example.com"));
    User found = userRepository.findById(saved.getId());
    assertEquals(saved.getEmail(), found.getEmail());
    // Database automatically cleaned up after test
  }
}
```

---

## CI/CD Integration Template

### GitHub Actions Example

```yaml
name: Tests

on: [push, pull_request]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      # Unit tests + linting (Commit Gate)
      - uses: actions/checkout@v3
      - name: Run unit tests
        run: npm test -- --coverage
      - name: Run linting
        run: npm run lint
      - name: Upload coverage
        uses: codecov/codecov-action@v3

      # Integration tests (PR Gate)
      - name: Run integration tests
        run: npm run test:integration
        timeout-minutes: 15

      # E2E tests (Nightly Gate)
      - name: Run E2E tests
        if: github.ref == 'refs/heads/main'
        run: npm run test:e2e
        timeout-minutes: 60

      # Performance tests (Release Gate)
      - name: Run performance tests
        if: contains(github.ref, 'release-')
        run: npm run test:performance
        timeout-minutes: 120

      # Reporting
      - name: Publish test results
        uses: dorny/test-reporter@v1
        with:
          name: Test Results
          path: 'test-results/junit.xml'
          reporter: 'java-junit'
        if: always()
```

---

## Success Criteria for Architecture Document

- [ ] Framework recommendations made for each test type with rationale
- [ ] Design patterns selected appropriate for architecture (e.g., page objects for UI)
- [ ] CI/CD integration flow designed with clear execution stages
- [ ] Timeout policies defined per test type
- [ ] Test data strategy documented (factories, fixtures, masking)
- [ ] Repository structure recommended with folder hierarchy
- [ ] Naming conventions defined (test class/method naming)
- [ ] Parallel execution strategy addressed
- [ ] Configuration templates provided (pom.xml, package.json, GitHub Actions YAML)
- [ ] Migration plan if replacing existing frameworks
- [ ] Team training plan included

---

## Agent Workflow

1. **Understand Requirements** (30 min)
   - Review technology stack
   - Understand test scope from Quality Strategist
   - Identify constraints (budget, team skills, performance)

2. **Evaluate Frameworks** (1 hour)
   - Research options for each test type
   - Compare pros/cons of frameworks
   - Make recommendations with justification

3. **Design Patterns** (1 hour)
   - Select appropriate patterns (page objects, factories, contracts)
   - Create examples per pattern
   - Document best practices

4. **Define Architecture** (1 hour)
   - Design CI/CD integration
   - Define repository structure
   - Plan test data management

5. **Create Document** (2 hours)
   - Write framework recommendations
   - Provide configuration templates
   - Create implementation roadmap

**Total Time**: 5-6 hours for complete Automation Architecture

---

## Agent Success Metrics

- **Framework Adoption**: Are teams using recommended frameworks?
- **Test Execution Time**: Do tests complete within timeout targets?
- **Flaky Test Rate**: <2% of tests failing intermittently?
- **Code Quality**: Test code is as clean as production code?
- **Maintainability**: Can non-specialists maintain tests?

---

*Automation Architect Agent - Universal Skill*

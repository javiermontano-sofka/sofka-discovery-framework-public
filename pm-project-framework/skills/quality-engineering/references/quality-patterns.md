# Quality Engineering Patterns & Templates

This reference contains HTML templates and visualizations for quality engineering artifacts.

---

## Pattern 1: Quality Maturity Radar Chart

**Purpose**: Visualize maturity across 5 dimensions (test strategy, automation, CI/CD, data management, metrics)

**HTML Template**:

```html
<svg viewBox="0 0 400 400" width="400" height="400">
  <!-- Background -->
  <circle cx="200" cy="200" r="180" fill="none" stroke="#e5e7eb" stroke-width="1"/>
  <circle cx="200" cy="200" r="144" fill="none" stroke="#e5e7eb" stroke-width="1"/>
  <circle cx="200" cy="200" r="108" fill="none" stroke="#e5e7eb" stroke-width="1"/>
  <circle cx="200" cy="200" r="72" fill="none" stroke="#e5e7eb" stroke-width="1"/>
  <circle cx="200" cy="200" r="36" fill="none" stroke="#e5e7eb" stroke-width="1"/>

  <!-- Axes (5 dimensions) -->
  <!-- 1. Test Strategy (top) -->
  <line x1="200" y1="20" x2="200" y2="380" stroke="#d1d5db" stroke-width="1"/>
  <text x="210" y="35" font-size="12" font-weight="bold">Test Strategy</text>

  <!-- 2. Automation (upper-right) -->
  <line x1="200" y1="200" x2="336" y2="95" stroke="#d1d5db" stroke-width="1"/>
  <text x="340" y="85" font-size="12" font-weight="bold">Automation</text>

  <!-- 3. CI/CD Integration (lower-right) -->
  <line x1="200" y1="200" x2="320" y2="305" stroke="#d1d5db" stroke-width="1"/>
  <text x="320" y="325" font-size="12" font-weight="bold">CI/CD Gates</text>

  <!-- 4. Data Management (lower-left) -->
  <line x1="200" y1="200" x2="80" y2="305" stroke="#d1d5db" stroke-width="1"/>
  <text x="50" y="325" font-size="12" font-weight="bold">Data Mgmt</text>

  <!-- 5. Metrics & Dashboards (upper-left) -->
  <line x1="200" y1="200" x2="64" y2="95" stroke="#d1d5db" stroke-width="1"/>
  <text x="20" y="85" font-size="12" font-weight="bold">Metrics</text>

  <!-- Current Maturity (blue fill) -->
  <polygon points="200,92 306,155 271,265 129,265 94,155"
           fill="rgba(66, 211, 111, 0.2)" stroke="#42d36f" stroke-width="2"/>

  <!-- Target Maturity (orange outline) -->
  <polygon points="200,56 345,130 310,290 90,290 55,130"
           fill="none" stroke="#6366F1" stroke-width="2" stroke-dasharray="5,5"/>

  <!-- Legend -->
  <g transform="translate(20, 360)">
    <line x1="0" y1="0" x2="20" y2="0" stroke="#42d36f" stroke-width="2"/>
    <text x="25" y="5" font-size="11">Current (Level 2)</text>

    <line x1="0" y1="15" x2="20" y2="15" stroke="#6366F1" stroke-width="2" stroke-dasharray="5,5"/>
    <text x="25" y="20" font-size="11">Target (Level 4)</text>
  </g>
</svg>
```

---

## Pattern 2: Test Pyramid Diagram (Monolith)

**Purpose**: Show test distribution for monolithic architecture

**HTML Template**:

```html
<svg viewBox="0 0 300 400" width="300" height="400">
  <!-- Pyramid layers -->

  <!-- Unit Tests (bottom, largest) -->
  <polygon points="50,350 250,350 200,250 100,250"
           fill="#42d36f" opacity="0.8" stroke="#065f46" stroke-width="2"/>
  <text x="150" y="310" font-size="16" font-weight="bold" text-anchor="middle" fill="#fff">
    Unit Tests
  </text>
  <text x="150" y="335" font-size="12" text-anchor="middle" fill="#fff">
    (55%) - Developer owned
  </text>

  <!-- Integration Tests (middle) -->
  <polygon points="100,250 200,250 150,150 100,150"
           fill="#D97706" opacity="0.8" stroke="#92400e" stroke-width="2"/>
  <text x="150" y="210" font-size="14" font-weight="bold" text-anchor="middle" fill="#fff">
    Integration Tests
  </text>
  <text x="150" y="230" font-size="11" text-anchor="middle" fill="#fff">
    (25%)
  </text>

  <!-- API Tests (upper middle) -->
  <polygon points="100,150 200,150 175,100 125,100"
           fill="#22D3EE" opacity="0.8" stroke="#b8860b" stroke-width="2"/>
  <text x="150" y="130" font-size="12" font-weight="bold" text-anchor="middle">
    API Tests (15%)
  </text>

  <!-- E2E Tests (top, smallest) -->
  <polygon points="125,100 175,100 150,50"
           fill="#DC2626" opacity="0.8" stroke="#7f1d1d" stroke-width="2"/>
  <text x="150" y="80" font-size="11" font-weight="bold" text-anchor="middle" fill="#fff">
    E2E (5%)
  </text>

  <!-- Execution time labels -->
  <g transform="translate(270, 300)">
    <text x="0" y="0" font-size="10" fill="#666">~30s</text>
  </g>
  <g transform="translate(270, 200)">
    <text x="0" y="0" font-size="10" fill="#666">~2min</text>
  </g>
  <g transform="translate(270, 100)">
    <text x="0" y="0" font-size="10" fill="#666">~1min</text>
  </g>

  <!-- Title -->
  <text x="150" y="30" font-size="18" font-weight="bold" text-anchor="middle">
    Test Pyramid (Monolith)
  </text>
</svg>
```

---

## Pattern 3: Test Diamond Diagram (Microservices)

**Purpose**: Show test distribution for microservices architecture

**HTML Template**:

```html
<svg viewBox="0 0 300 400" width="300" height="400">
  <!-- Diamond shape -->

  <!-- Unit Tests (bottom) -->
  <polygon points="150,380 130,280 170,280"
           fill="#42d36f" opacity="0.8" stroke="#065f46" stroke-width="2"/>
  <text x="150" y="330" font-size="11" font-weight="bold" text-anchor="middle" fill="#333">
    Unit (20%)
  </text>

  <!-- Integration Tests (sides) - wider -->
  <polygon points="50,200 130,280 150,150 70,120"
           fill="#D97706" opacity="0.8" stroke="#92400e" stroke-width="2"/>
  <polygon points="250,200 170,280 150,150 230,120"
           fill="#D97706" opacity="0.8" stroke="#92400e" stroke-width="2"/>
  <text x="80" y="200" font-size="11" font-weight="bold" text-anchor="middle" fill="#fff">
    Integration
  </text>
  <text x="220" y="200" font-size="11" font-weight="bold" text-anchor="middle" fill="#fff">
    (40%)
  </text>

  <!-- Contract Tests (upper sides) -->
  <polygon points="50,120 70,120 100,60 80,50"
           fill="#22D3EE" opacity="0.8" stroke="#b8860b" stroke-width="2"/>
  <polygon points="250,120 230,120 200,60 220,50"
           fill="#22D3EE" opacity="0.8" stroke="#b8860b" stroke-width="2"/>
  <text x="70" y="85" font-size="10" font-weight="bold" text-anchor="middle">Contract</text>
  <text x="230" y="85" font-size="10" font-weight="bold" text-anchor="middle">(30%)</text>

  <!-- E2E Tests (top) -->
  <polygon points="150,150 100,60 200,60"
           fill="#DC2626" opacity="0.8" stroke="#7f1d1d" stroke-width="2"/>
  <text x="150" y="95" font-size="11" font-weight="bold" text-anchor="middle" fill="#fff">
    E2E (10%)
  </text>

  <!-- Title -->
  <text x="150" y="30" font-size="18" font-weight="bold" text-anchor="middle">
    Test Diamond (Microservices)
  </text>
</svg>
```

---

## Pattern 4: Quality Gate Pipeline Visualization

**Purpose**: Show test execution flow through pipeline stages

**HTML Template**:

```html
<svg viewBox="0 0 900 150" width="900" height="150">
  <!-- Title -->
  <text x="450" y="20" font-size="16" font-weight="bold" text-anchor="middle">
    Quality Gate Pipeline
  </text>

  <!-- Stage 1: Commit Gate -->
  <g transform="translate(50, 40)">
    <rect width="120" height="80" fill="#42d36f" opacity="0.8" stroke="#065f46" stroke-width="2" rx="4"/>
    <text x="60" y="25" font-size="12" font-weight="bold" text-anchor="middle" fill="#fff">Commit Gate</text>
    <text x="60" y="45" font-size="10" text-anchor="middle" fill="#fff">Unit Tests</text>
    <text x="60" y="60" font-size="10" text-anchor="middle" fill="#fff">Linting</text>
    <text x="60" y="75" font-size="9" text-anchor="middle" fill="#555">~5 min</text>
  </g>

  <!-- Arrow -->
  <line x1="180" y1="82" x2="210" y2="82" stroke="#333" stroke-width="2" marker-end="url(#arrowhead)"/>

  <!-- Stage 2: PR Gate -->
  <g transform="translate(220, 40)">
    <rect width="120" height="80" fill="#D97706" opacity="0.8" stroke="#92400e" stroke-width="2" rx="4"/>
    <text x="60" y="25" font-size="12" font-weight="bold" text-anchor="middle" fill="#fff">PR Gate</text>
    <text x="60" y="45" font-size="10" text-anchor="middle" fill="#fff">Integration</text>
    <text x="60" y="60" font-size="10" text-anchor="middle" fill="#fff">Contract Tests</text>
    <text x="60" y="75" font-size="9" text-anchor="middle" fill="#555">~15 min</text>
  </g>

  <!-- Arrow -->
  <line x1="350" y1="82" x2="380" y2="82" stroke="#333" stroke-width="2" marker-end="url(#arrowhead)"/>

  <!-- Stage 3: Nightly Gate -->
  <g transform="translate(390, 40)">
    <rect width="120" height="80" fill="#22D3EE" opacity="0.8" stroke="#b8860b" stroke-width="2" rx="4"/>
    <text x="60" y="25" font-size="12" font-weight="bold" text-anchor="middle">Nightly Gate</text>
    <text x="60" y="45" font-size="10" text-anchor="middle">E2E + API</text>
    <text x="60" y="60" font-size="10" text-anchor="middle">+ Performance</text>
    <text x="60" y="75" font-size="9" text-anchor="middle" fill="#555">~60 min</text>
  </g>

  <!-- Arrow -->
  <line x1="520" y1="82" x2="550" y2="82" stroke="#333" stroke-width="2" marker-end="url(#arrowhead)"/>

  <!-- Stage 4: Release Gate -->
  <g transform="translate(560, 40)">
    <rect width="120" height="80" fill="#DC2626" opacity="0.8" stroke="#7f1d1d" stroke-width="2" rx="4"/>
    <text x="60" y="25" font-size="12" font-weight="bold" text-anchor="middle" fill="#fff">Release Gate</text>
    <text x="60" y="45" font-size="10" text-anchor="middle" fill="#fff">Load Test</text>
    <text x="60" y="60" font-size="10" text-anchor="middle" fill="#fff">+ Manual Sign-off</text>
    <text x="60" y="75" font-size="9" text-anchor="middle" fill="#555">~120 min</text>
  </g>

  <!-- Arrow -->
  <line x1="690" y1="82" x2="720" y2="82" stroke="#333" stroke-width="2" marker-end="url(#arrowhead)"/>

  <!-- Stage 5: Production Gate -->
  <g transform="translate(730, 40)">
    <rect width="120" height="80" fill="#42d36f" opacity="0.8" stroke="#065f46" stroke-width="2" rx="4"/>
    <text x="60" y="25" font-size="12" font-weight="bold" text-anchor="middle" fill="#fff">Prod Gate</text>
    <text x="60" y="45" font-size="10" text-anchor="middle" fill="#fff">Smoke Tests</text>
    <text x="60" y="60" font-size="10" text-anchor="middle" fill="#fff">Canary Check</text>
    <text x="60" y="75" font-size="9" text-anchor="middle" fill="#555">~15 min</text>
  </g>

  <!-- Arrow marker definition -->
  <defs>
    <marker id="arrowhead" markerWidth="10" markerHeight="10" refX="9" refY="3" orient="auto">
      <polygon points="0 0, 10 3, 0 6" fill="#333" />
    </marker>
  </defs>
</svg>
```

---

## Pattern 5: Metrics Dashboard Layout

**Purpose**: Template for quality metrics dashboard

**HTML Structure**:

```html
<div class="metrics-dashboard">
  <h1>Quality Engineering Dashboard</h1>

  <div class="grid" style="display: grid; grid-template-columns: repeat(3, 1fr); gap: 20px;">

    <!-- KPI Card 1 -->
    <div class="kpi-card" style="border: 2px solid #42d36f; padding: 20px; border-radius: 8px;">
      <h3>Test Pass Rate</h3>
      <div class="metric" style="font-size: 48px; font-weight: bold; color: #42d36f;">
        96.5%
      </div>
      <div class="trend" style="color: #22c55e; font-size: 14px;">
        ↑ +2.1% from last week
      </div>
    </div>

    <!-- KPI Card 2 -->
    <div class="kpi-card" style="border: 2px solid #D97706; padding: 20px; border-radius: 8px;">
      <h3>Code Coverage</h3>
      <div class="metric" style="font-size: 48px; font-weight: bold; color: #D97706;">
        78%
      </div>
      <div class="trend" style="color: #D97706; font-size: 14px;">
        → Target: 80%
      </div>
    </div>

    <!-- KPI Card 3 -->
    <div class="kpi-card" style="border: 2px solid #22D3EE; padding: 20px; border-radius: 8px;">
      <h3>Flaky Tests</h3>
      <div class="metric" style="font-size: 48px; font-weight: bold; color: #22D3EE;">
        1.2%
      </div>
      <div class="trend" style="color: #22c55e; font-size: 14px;">
        ↓ Below 2% target
      </div>
    </div>

    <!-- Chart 1: Test Execution Time Trend -->
    <div class="chart" style="border: 1px solid #e5e7eb; padding: 20px; border-radius: 8px; grid-column: 1 / 3;">
      <h3>PR Gate Execution Time (days)</h3>
      <svg viewBox="0 0 400 200" width="100%" height="200">
        <!-- Line chart showing execution time trend -->
        <polyline points="10,150 50,140 90,130 130,145 170,120 210,110 250,125 290,100 330,95 370,100"
                  fill="none" stroke="#D97706" stroke-width="2"/>
        <line x1="10" y1="150" x2="370" y2="150" stroke="#e5e7eb" stroke-width="1"/>
        <text x="185" y="180" text-anchor="middle" font-size="12" fill="#666">Weeks (downward trend = good)</text>
      </svg>
    </div>

    <!-- Chart 2: Test Type Distribution -->
    <div class="chart" style="border: 1px solid #e5e7eb; padding: 20px; border-radius: 8px;">
      <h3>Test Distribution</h3>
      <svg viewBox="0 0 200 200" width="100%" height="200">
        <!-- Pie chart -->
        <circle cx="100" cy="100" r="60" fill="#42d36f" opacity="0.8"/>
        <text x="100" y="105" text-anchor="middle" fill="#fff" font-weight="bold">Unit</text>
        <text x="100" y="125" text-anchor="middle" fill="#fff" font-size="12">(55%)</text>
      </svg>
    </div>

    <!-- Production Incidents -->
    <div class="kpi-card" style="border: 2px solid #DC2626; padding: 20px; border-radius: 8px; grid-column: 1 / 4;">
      <h3>Production Incidents (Last 30 Days)</h3>
      <div class="metric" style="font-size: 48px; font-weight: bold; color: #DC2626;">
        2
      </div>
      <div class="detail" style="font-size: 12px; color: #666; margin-top: 10px;">
        <p>Critical: 0 | High: 1 | Medium: 1</p>
        <p>Avg MTTR: 45 minutes</p>
      </div>
    </div>

  </div>
</div>
```

---

## Pattern 6: Test Coverage Heatmap

**Purpose**: Show coverage by component/module

**HTML Template**:

```html
<table style="border-collapse: collapse; width: 100%;">
  <thead>
    <tr style="background-color: #f3f4f6;">
      <th style="border: 1px solid #d1d5db; padding: 12px; text-align: left;">Component</th>
      <th style="border: 1px solid #d1d5db; padding: 12px; text-align: center;">Unit</th>
      <th style="border: 1px solid #d1d5db; padding: 12px; text-align: center;">Integration</th>
      <th style="border: 1px solid #d1d5db; padding: 12px; text-align: center;">E2E</th>
      <th style="border: 1px solid #d1d5db; padding: 12px; text-align: center;">Overall</th>
    </tr>
  </thead>
  <tbody>
    <!-- Row with good coverage (green) -->
    <tr>
      <td style="border: 1px solid #d1d5db; padding: 12px;">Authentication</td>
      <td style="border: 1px solid #d1d5db; padding: 12px; text-align: center; background-color: #dcfce7;">92%</td>
      <td style="border: 1px solid #d1d5db; padding: 12px; text-align: center; background-color: #dcfce7;">88%</td>
      <td style="border: 1px solid #d1d5db; padding: 12px; text-align: center; background-color: #fef3c7;">65%</td>
      <td style="border: 1px solid #d1d5db; padding: 12px; text-align: center; background-color: #dcfce7; font-weight: bold;">82%</td>
    </tr>

    <!-- Row with partial coverage (yellow) -->
    <tr>
      <td style="border: 1px solid #d1d5db; padding: 12px;">Payment Processing</td>
      <td style="border: 1px solid #d1d5db; padding: 12px; text-align: center; background-color: #fef3c7;">75%</td>
      <td style="border: 1px solid #d1d5db; padding: 12px; text-align: center; background-color: #fef3c7;">68%</td>
      <td style="border: 1px solid #d1d5db; padding: 12px; text-align: center; background-color: #fecaca;">45%</td>
      <td style="border: 1px solid #d1d5db; padding: 12px; text-align: center; background-color: #fef3c7; font-weight: bold;">63%</td>
    </tr>

    <!-- Row with poor coverage (red) -->
    <tr>
      <td style="border: 1px solid #d1d5db; padding: 12px;">Reporting Module</td>
      <td style="border: 1px solid #d1d5db; padding: 12px; text-align: center; background-color: #fecaca;">42%</td>
      <td style="border: 1px solid #d1d5db; padding: 12px; text-align: center; background-color: #fecaca;">38%</td>
      <td style="border: 1px solid #d1d5db; padding: 12px; text-align: center; background-color: #fecaca;">22%</td>
      <td style="border: 1px solid #d1d5db; padding: 12px; text-align: center; background-color: #fecaca; font-weight: bold;">34%</td>
    </tr>

    <!-- Row with excellent coverage (dark green) -->
    <tr>
      <td style="border: 1px solid #d1d5db; padding: 12px;">User Management</td>
      <td style="border: 1px solid #d1d5db; padding: 12px; text-align: center; background-color: #bbf7d0;">96%</td>
      <td style="border: 1px solid #d1d5db; padding: 12px; text-align: center; background-color: #bbf7d0;">94%</td>
      <td style="border: 1px solid #d1d5db; padding: 12px; text-align: center; background-color: #dcfce7;">82%</td>
      <td style="border: 1px solid #d1d5db; padding: 12px; text-align: center; background-color: #bbf7d0; font-weight: bold;">91%</td>
    </tr>
  </tbody>
</table>

<div style="margin-top: 20px;">
  <h4>Coverage Legend</h4>
  <p>
    <span style="display: inline-block; width: 20px; height: 20px; background-color: #bbf7d0; margin-right: 8px;"></span> Excellent (>90%)
    <span style="display: inline-block; width: 20px; height: 20px; background-color: #dcfce7; margin-right: 8px;"></span> Good (80-90%)
    <span style="display: inline-block; width: 20px; height: 20px; background-color: #fef3c7; margin-right: 8px;"></span> Fair (60-80%)
    <span style="display: inline-block; width: 20px; height: 20px; background-color: #fecaca; margin-right: 8px;"></span> Poor (<60%)
  </p>
</div>
```

---

## Pattern 7: Implementation Timeline

**Purpose**: Gantt-style timeline for 12-week quality engineering implementation

**HTML Template**:

```html
<div style="font-family: Arial, sans-serif; padding: 20px;">
  <h2>Quality Engineering Implementation Timeline</h2>

  <table style="border-collapse: collapse; width: 100%; margin-top: 20px;">
    <thead>
      <tr style="background-color: #f3f4f6;">
        <th style="border: 1px solid #d1d5db; padding: 10px; text-align: left; width: 150px;">Phase</th>
        <th style="border: 1px solid #d1d5db; padding: 10px; text-align: left; width: 200px;">Deliverables</th>
        <th style="border: 1px solid #d1d5db; padding: 10px; text-align: left;">Timeline</th>
      </tr>
    </thead>
    <tbody>
      <!-- Phase 1 -->
      <tr>
        <td style="border: 1px solid #d1d5db; padding: 10px; font-weight: bold;">Phase 1<br/>Foundations<br/>(Wks 1-4)</td>
        <td style="border: 1px solid #d1d5db; padding: 10px;">
          • CI commit gate (unit + lint)<br/>
          • Test strategy document<br/>
          • Framework selection<br/>
          • Baseline metrics
        </td>
        <td style="border: 1px solid #d1d5db; padding: 10px;">
          <div style="display: flex; gap: 2px;">
            <div style="width: 25px; height: 20px; background-color: #42d36f;"></div>
            <div style="width: 25px; height: 20px; background-color: #42d36f;"></div>
            <div style="width: 25px; height: 20px; background-color: #42d36f;"></div>
            <div style="width: 25px; height: 20px; background-color: #42d36f;"></div>
            <div style="width: 25px; height: 20px; background-color: #e5e7eb;"></div>
            <div style="width: 25px; height: 20px; background-color: #e5e7eb;"></div>
            <div style="width: 25px; height: 20px; background-color: #e5e7eb;"></div>
            <div style="width: 25px; height: 20px; background-color: #e5e7eb;"></div>
            <div style="width: 25px; height: 20px; background-color: #e5e7eb;"></div>
            <div style="width: 25px; height: 20px; background-color: #e5e7eb;"></div>
            <div style="width: 25px; height: 20px; background-color: #e5e7eb;"></div>
            <div style="width: 25px; height: 20px; background-color: #e5e7eb;"></div>
          </div>
          <span style="font-size: 12px; color: #666;">Weeks 1-4</span>
        </td>
      </tr>

      <!-- Phase 2 -->
      <tr>
        <td style="border: 1px solid #d1d5db; padding: 10px; font-weight: bold;">Phase 2<br/>Automation<br/>(Wks 5-8)</td>
        <td style="border: 1px solid #d1d5db; padding: 10px;">
          • PR gate (integration + contract)<br/>
          • Test automation framework<br/>
          • API test suite<br/>
          • Test data factory
        </td>
        <td style="border: 1px solid #d1d5db; padding: 10px;">
          <div style="display: flex; gap: 2px;">
            <div style="width: 25px; height: 20px; background-color: #e5e7eb;"></div>
            <div style="width: 25px; height: 20px; background-color: #e5e7eb;"></div>
            <div style="width: 25px; height: 20px; background-color: #e5e7eb;"></div>
            <div style="width: 25px; height: 20px; background-color: #e5e7eb;"></div>
            <div style="width: 25px; height: 20px; background-color: #D97706;"></div>
            <div style="width: 25px; height: 20px; background-color: #D97706;"></div>
            <div style="width: 25px; height: 20px; background-color: #D97706;"></div>
            <div style="width: 25px; height: 20px; background-color: #D97706;"></div>
            <div style="width: 25px; height: 20px; background-color: #e5e7eb;"></div>
            <div style="width: 25px; height: 20px; background-color: #e5e7eb;"></div>
            <div style="width: 25px; height: 20px; background-color: #e5e7eb;"></div>
            <div style="width: 25px; height: 20px; background-color: #e5e7eb;"></div>
          </div>
          <span style="font-size: 12px; color: #666;">Weeks 5-8</span>
        </td>
      </tr>

      <!-- Phase 3 -->
      <tr>
        <td style="border: 1px solid #d1d5db; padding: 10px; font-weight: bold;">Phase 3<br/>Advanced<br/>(Wks 9-12)</td>
        <td style="border: 1px solid #d1d5db; padding: 10px;">
          • E2E test suite<br/>
          • Performance testing<br/>
          • Security scanning<br/>
          • Automated dashboards
        </td>
        <td style="border: 1px solid #d1d5db; padding: 10px;">
          <div style="display: flex; gap: 2px;">
            <div style="width: 25px; height: 20px; background-color: #e5e7eb;"></div>
            <div style="width: 25px; height: 20px; background-color: #e5e7eb;"></div>
            <div style="width: 25px; height: 20px; background-color: #e5e7eb;"></div>
            <div style="width: 25px; height: 20px; background-color: #e5e7eb;"></div>
            <div style="width: 25px; height: 20px; background-color: #e5e7eb;"></div>
            <div style="width: 25px; height: 20px; background-color: #e5e7eb;"></div>
            <div style="width: 25px; height: 20px; background-color: #e5e7eb;"></div>
            <div style="width: 25px; height: 20px; background-color: #e5e7eb;"></div>
            <div style="width: 25px; height: 20px; background-color: #22D3EE;"></div>
            <div style="width: 25px; height: 20px; background-color: #22D3EE;"></div>
            <div style="width: 25px; height: 20px; background-color: #22D3EE;"></div>
            <div style="width: 25px; height: 20px; background-color: #22D3EE;"></div>
          </div>
          <span style="font-size: 12px; color: #666;">Weeks 9-12</span>
        </td>
      </tr>

      <!-- Phase 4 -->
      <tr>
        <td style="border: 1px solid #d1d5db; padding: 10px; font-weight: bold;">Phase 4<br/>Optimization<br/>(Ongoing)</td>
        <td style="border: 1px solid #d1d5db; padding: 10px;">
          • Flaky test elimination<br/>
          • Metric-driven improvements<br/>
          • Tool upgrades<br/>
          • Team development
        </td>
        <td style="border: 1px solid #d1d5db; padding: 10px;">
          <div style="display: flex; gap: 2px;">
            <div style="width: 25px; height: 20px; background-color: #42d36f;"></div>
            <div style="width: 25px; height: 20px; background-color: #42d36f;"></div>
            <div style="width: 25px; height: 20px; background-color: #42d36f;"></div>
            <div style="width: 25px; height: 20px; background-color: #42d36f;"></div>
            <div style="width: 25px; height: 20px; background-color: #42d36f;"></div>
            <div style="width: 25px; height: 20px; background-color: #42d36f;"></div>
            <div style="width: 25px; height: 20px; background-color: #42d36f;"></div>
            <div style="width: 25px; height: 20px; background-color: #42d36f;"></div>
            <div style="width: 25px; height: 20px; background-color: #42d36f;"></div>
            <div style="width: 25px; height: 20px; background-color: #42d36f;"></div>
            <div style="width: 25px; height: 20px; background-color: #42d36f;"></div>
            <div style="width: 25px; height: 20px; background-color: #42d36f;"></div>
          </div>
          <span style="font-size: 12px; color: #666;">Ongoing (all phases)</span>
        </td>
      </tr>
    </tbody>
  </table>

  <div style="margin-top: 20px; padding: 15px; background-color: #f0fdf4; border-left: 4px solid #42d36f;">
    <h4 style="margin-top: 0; color: #065f46;">Success Criteria</h4>
    <ul style="margin: 0; padding-left: 20px;">
      <li>Phase 1: 90%+ build pass rate; strategy documented</li>
      <li>Phase 2: PR gate <15 min; API tests >80% coverage</li>
      <li>Phase 3: E2E >70% critical paths; performance baseline set</li>
      <li>Phase 4: Flaky tests <2%; quality metrics tracked</li>
    </ul>
  </div>
</div>
```

---

## Design Tokens (Color Palette)

Quality Engineering uses a consistent color scheme:

```
Primary Green (Success):    #42d36f (RGB: 66, 211, 111)
Primary Red (Alert):        #DC2626 (RGB: 220, 38, 38)
Primary Orange (Warning):   #6366F1 (RGB: 255, 126, 8)
Primary Amber (Caution):    #D97706 (RGB: 217, 119, 6)
Primary Yellow (Info):      #22D3EE (RGB: 255, 215, 0)
Neutral Gray:               #d1d5db (RGB: 209, 213, 219)
Light Gray (Background):    #f3f4f6 (RGB: 243, 244, 246)
```

---

*Quality Patterns Reference - Universal Skill*

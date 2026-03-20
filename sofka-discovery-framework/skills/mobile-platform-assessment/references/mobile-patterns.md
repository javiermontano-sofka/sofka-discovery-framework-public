---
name: mobile-patterns
description: HTML templates and visual patterns for platform comparison matrices, architecture diagrams, offline sync flows, performance dashboards, and release pipeline visualizations
---

## Mobile Architecture Pattern Reference

This reference provides reusable HTML templates, CSS design tokens, and structural patterns for mobile architecture documentation artifacts.

---

## Design Tokens

**Color Palette:**
```css
--color-primary: #6366F1;        /* Orange — primary actions, highlighted elements */
--color-critical: #DC2626;       /* Red — errors, violations, high-severity issues */
--color-warning: #D97706;        /* Amber — warnings, caution items, medium severity */
--color-positive: #22D3EE;       /* Gold — positive outcomes, recommendations */
--color-decorative: #42D36F;     /* Green — decorative only, not semantic status */
--color-neutral-light: #F3F4F6;  /* Light gray — backgrounds, borders */
--color-neutral-dark: #1F2937;   /* Dark gray — text, strong contrast */
--color-neutral-border: #D1D5DB; /* Medium gray — structural dividers */
```

---

## Template 1: Platform Decision Matrix

**Purpose:** Compare native, cross-platform, and hybrid approaches with scoring

**HTML Structure:**
```html
<section class="platform-decision">
  <h3>Platform Strategy Decision</h3>
  <table class="decision-matrix">
    <thead>
      <tr>
        <th>Criterion</th>
        <th>Weight</th>
        <th>Native (Swift/Kotlin)</th>
        <th>Flutter</th>
        <th>React Native</th>
        <th>KMP</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td class="criterion-name">Performance</td>
        <td class="weight">25%</td>
        <td class="score" data-score="5">5/5</td>
        <td class="score" data-score="4">4/5</td>
        <td class="score" data-score="3">3/5</td>
        <td class="score" data-score="4">4/5</td>
      </tr>
      <tr>
        <td class="criterion-name">Code Sharing</td>
        <td class="weight">20%</td>
        <td class="score" data-score="1">1/5</td>
        <td class="score" data-score="5">5/5</td>
        <td class="score" data-score="4">4/5</td>
        <td class="score" data-score="3">3/5</td>
      </tr>
      <tr>
        <td class="criterion-name">UI Fidelity</td>
        <td class="weight">20%</td>
        <td class="score" data-score="5">5/5</td>
        <td class="score" data-score="3">3/5</td>
        <td class="score" data-score="4">4/5</td>
        <td class="score" data-score="5">5/5</td>
      </tr>
      <tr>
        <td class="criterion-name">Team Skill Fit</td>
        <td class="weight">20%</td>
        <td class="score" data-score="3">3/5</td>
        <td class="score" data-score="4">4/5</td>
        <td class="score" data-score="4">4/5</td>
        <td class="score" data-score="3">3/5</td>
      </tr>
      <tr>
        <td class="criterion-name">Ecosystem Maturity</td>
        <td class="weight">15%</td>
        <td class="score" data-score="5">5/5</td>
        <td class="score" data-score="4">4/5</td>
        <td class="score" data-score="4">4/5</td>
        <td class="score" data-score="3">3/5</td>
      </tr>
      <tr class="total-row">
        <td>Weighted Total</td>
        <td></td>
        <td class="total">3.80</td>
        <td class="total highlight">4.10</td>
        <td class="total">3.75</td>
        <td class="total">3.60</td>
      </tr>
    </tbody>
  </table>
  <div class="decision-rationale">
    <h5>Recommendation: Flutter</h5>
    <p>Highest weighted score. Code sharing and rapid development outweigh slight performance gap vs. native. Team has Dart experience. Revisit if platform-specific features become critical.</p>
  </div>
</section>
```

**CSS Styling:**
```css
.decision-matrix {
  width: 100%;
  border-collapse: collapse;
  font-size: 13px;
}

.decision-matrix th {
  padding: 12px;
  text-align: center;
  background: var(--color-neutral-light);
  font-weight: 600;
  border-bottom: 2px solid var(--color-neutral-border);
}

.decision-matrix th:first-child,
.decision-matrix td.criterion-name {
  text-align: left;
}

.decision-matrix td {
  padding: 12px;
  text-align: center;
  border-bottom: 1px solid var(--color-neutral-border);
}

.score[data-score="5"] { color: var(--color-decorative); font-weight: 600; }
.score[data-score="4"] { color: #10B981; }
.score[data-score="3"] { color: var(--color-warning); }
.score[data-score="2"] { color: var(--color-critical); }
.score[data-score="1"] { color: var(--color-critical); font-weight: 600; }

.total-row { background: var(--color-neutral-light); font-weight: 600; }
.total.highlight { color: var(--color-primary); font-size: 16px; }
```

---

## Template 2: Module Architecture Diagram

**Purpose:** Visualize feature modules, core modules, and dependency flow

**HTML Structure:**
```html
<section class="module-architecture">
  <h3>App Module Structure</h3>
  <div class="module-layers">
    <div class="module-layer" data-layer="feature">
      <span class="layer-label">Feature Modules</span>
      <div class="module-grid">
        <div class="module feature">
          <span class="module-name">:feature-home</span>
          <span class="module-detail">HomeScreen, HomeViewModel, HomeRepository</span>
        </div>
        <div class="module feature">
          <span class="module-name">:feature-orders</span>
          <span class="module-detail">OrderList, OrderDetail, OrderViewModel</span>
        </div>
        <div class="module feature">
          <span class="module-name">:feature-profile</span>
          <span class="module-detail">ProfileScreen, SettingsScreen, AuthFlow</span>
        </div>
      </div>
    </div>
    <div class="dependency-arrow">depends on</div>
    <div class="module-layer" data-layer="core">
      <span class="layer-label">Core Modules</span>
      <div class="module-grid">
        <div class="module core">
          <span class="module-name">:core-network</span>
          <span class="module-detail">ApiClient, Interceptors, Auth</span>
        </div>
        <div class="module core">
          <span class="module-name">:core-design</span>
          <span class="module-detail">Theme, Components, Icons</span>
        </div>
        <div class="module core">
          <span class="module-name">:core-data</span>
          <span class="module-detail">Database, Cache, Sync</span>
        </div>
      </div>
    </div>
    <div class="dependency-arrow">depends on</div>
    <div class="module-layer" data-layer="foundation">
      <span class="layer-label">Foundation</span>
      <div class="module-grid">
        <div class="module foundation">
          <span class="module-name">:foundation</span>
          <span class="module-detail">Extensions, Utilities, Constants, Logger</span>
        </div>
      </div>
    </div>
  </div>
</section>
```

---

## Template 3: Offline Sync Flow

**Purpose:** Visualize optimistic UI and background sync lifecycle

**HTML Structure:**
```html
<section class="sync-flow">
  <h3>Offline-First Sync Architecture</h3>
  <div class="flow-steps">
    <div class="step" data-step="action">
      <span class="step-number">1</span>
      <h4>User Action</h4>
      <p>User creates order. Action applied to local database immediately.</p>
    </div>
    <div class="step" data-step="queue">
      <span class="step-number">2</span>
      <h4>Sync Queue</h4>
      <p>Operation added to persistent sync queue with timestamp and retry count.</p>
    </div>
    <div class="step" data-step="sync">
      <span class="step-number">3</span>
      <h4>Background Sync</h4>
      <p>When online: dequeue operations FIFO, send to server. Exponential backoff on failure.</p>
    </div>
    <div class="step" data-step="confirm">
      <span class="step-number">4</span>
      <h4>Confirmation</h4>
      <p>Server confirms: update local record with server ID and timestamp. Conflict: show resolution UI.</p>
    </div>
  </div>
  <div class="conflict-resolution">
    <h4>Conflict Resolution Strategy</h4>
    <table class="conflict-table">
      <thead><tr><th>Scenario</th><th>Strategy</th><th>User Impact</th></tr></thead>
      <tbody>
        <tr><td>Same field edited</td><td>Last-write-wins (server timestamp)</td><td>Notification of override</td></tr>
        <tr><td>Record deleted on server</td><td>Re-create with conflict flag</td><td>User reviews and confirms</td></tr>
        <tr><td>Schema changed</td><td>Client-side migration on next sync</td><td>Transparent</td></tr>
      </tbody>
    </table>
  </div>
</section>
```

---

## Template 4: Release Pipeline

**Purpose:** Visualize mobile CI/CD from commit to app store

**HTML Structure:**
```html
<section class="release-pipeline">
  <h3>Mobile Release Pipeline</h3>
  <div class="pipeline-stages">
    <div class="stage">
      <span class="stage-name">Build</span>
      <ul class="stage-steps">
        <li>Compile (iOS: Xcode, Android: Gradle)</li>
        <li>Run unit tests</li>
        <li>Run widget/UI tests</li>
        <li>Static analysis (lint, detekt/SwiftLint)</li>
      </ul>
      <span class="stage-duration">~8 min</span>
    </div>
    <div class="stage">
      <span class="stage-name">Security</span>
      <ul class="stage-steps">
        <li>Dependency vulnerability scan</li>
        <li>License compliance check</li>
        <li>Secret detection</li>
      </ul>
      <span class="stage-duration">~3 min</span>
    </div>
    <div class="stage">
      <span class="stage-name">Sign & Package</span>
      <ul class="stage-steps">
        <li>Code signing (Fastlane match / keystore)</li>
        <li>Generate signed IPA + AAB</li>
        <li>Upload debug symbols</li>
      </ul>
      <span class="stage-duration">~5 min</span>
    </div>
    <div class="stage">
      <span class="stage-name">Distribute</span>
      <ul class="stage-steps">
        <li>Internal: Firebase App Distribution</li>
        <li>Beta: TestFlight + Play Console internal track</li>
        <li>Production: App Store Connect + Play Console</li>
      </ul>
      <span class="stage-duration">~10 min</span>
    </div>
  </div>
</section>
```

---

## Using These Templates

1. **Copy template structure** into HTML document
2. **Customize content** (platform scores, module names, sync strategies, pipeline stages)
3. **Apply color tokens** for consistency and semantic meaning
4. **Link templates together** (platform decision informs module architecture; sync flow feeds performance section)

All templates follow accessibility best practices (semantic HTML, color + text distinction, adequate contrast).

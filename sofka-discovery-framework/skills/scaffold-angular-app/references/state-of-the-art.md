# State of the Art — Scaffold Angular App (2025-2026)

## Latest Versions

| Tool | Version | Key Change |
|------|---------|-----------|
| Angular | 19.0 | Signals stable, Signal-based components, zoneless by default option |
| Angular CLI | 19.0 | esbuild application builder default, faster cold starts |
| NgRx | 19.0 | Signals Store promoted to stable, Component Store improvements |
| RxJS | 7.8 | Final stable v7 (v8 in planning with reduced API surface) |
| Angular Material | 19.0 | MDC-based components fully stable, M3 theme support |

---

## Emerging Patterns (2025)

### Zoneless Angular (Experimental → Stable)
Angular 19 introduced experimental zoneless change detection, removing the dependency on `zone.js`. This results in smaller bundles (~130KB reduction) and potentially faster change detection. Enable with:
```typescript
provideZoneChangeDetection({ ignoreChangesOutsideZone: true })
// or zoneless:
bootstrapApplication(AppComponent, {
  providers: [provideExperimentalZonelessChangeDetection()]
})
```
Teams starting new projects should evaluate this. Works best with full Signals adoption.

### Signal-Based Components (Input/Output/Model Signals)
Angular 17.1+ introduces `input()`, `output()`, and `model()` as alternatives to `@Input()`, `@Output()`, and two-way bindings:

```typescript
// New style (Angular 17.1+)
export class MyComponent {
  title = input<string>()             // Required<string> if no default
  title = input.required<string>()    // Throws at runtime if not provided
  name = model<string>('')            // Two-way bindable signal
  clicked = output<void>()            // Replaces @Output() EventEmitter
}
```

### Deferred Loading with `@defer`
Angular 17+ `@defer` block enables deferred template loading based on triggers:

```html
@defer (on viewport) {
  <app-heavy-chart [data]="chartData" />
} @placeholder {
  <div class="chart-placeholder">Loading chart...</div>
} @loading (minimum 200ms) {
  <app-spinner />
} @error {
  <p>Failed to load chart</p>
}
```

`on viewport` — loads when visible. `on idle` — loads when browser is idle. `on interaction` — loads on first user interaction. Dramatically improves TTI for content below the fold.

### Analog.js — File-Based Routing for Angular
Analog.js (Vite-powered Angular meta-framework) brings file-based routing, SSG, and Markdown support to Angular. For teams that prefer Next.js-like DX in Angular. Growing adoption in 2025.

---

## Community Trends

- **NgModules in decline** — The Angular team confirmed that standalone APIs will be the primary recommendation. NgModules will be maintained but no new features. 70% of new Angular repos in 2025 are standalone-first.
- **NgRx Signals Store over Classic NgRx** — Classic NgRx (actions/reducers/effects/selectors) has a significant boilerplate overhead. NgRx Signals Store offers 80% less boilerplate for equivalent functionality. Teams with existing NgRx stores are migrating feature-by-feature.
- **RxJS usage narrowing** — With Signals covering synchronous and derived state, RxJS is increasingly confined to genuinely async operations: HTTP responses, WebSocket streams, debounced search. `BehaviorSubject` as state container is being replaced by `signal()`.
- **Angular + Tailwind gaining traction** — Angular Material was the default choice, but Tailwind CSS gives teams more design freedom and better DX for custom designs. Angular Material remains dominant for enterprise apps requiring strict Material Design compliance.

---

## What is Deprecated / Declining

| Pattern | Status | Migration |
|---------|--------|-----------|
| NgModules (for new code) | Discouraged | Standalone components |
| `@Component({ selector, template })` + NgModule declaration | Legacy | Standalone + `imports: []` |
| Class-based Route Guards (`CanActivate` interface) | Deprecated Angular 15 | Functional guards |
| Class-based HTTP Interceptors (`HttpInterceptor` interface) | Deprecated Angular 15 | Functional interceptors (`HttpInterceptorFn`) |
| `*ngIf`, `*ngFor`, `*ngSwitch` directives | Still works, not recommended for new code | Built-in control flow `@if`, `@for`, `@switch` |
| `BehaviorSubject` as state container | Community anti-pattern | `signal()` |
| Webpack `browser` builder | Deprecated for new projects | esbuild `application` builder |
| `APP_INITIALIZER` for setup | Still works | `provideAppInitializer()` (Angular 19) |
| `@Input() set` for derived state | Verbose | `computed(() => this.myInput())` with input signals |
| Zone.js for change detection | Will be optional → deprecated | Zoneless + Signals |

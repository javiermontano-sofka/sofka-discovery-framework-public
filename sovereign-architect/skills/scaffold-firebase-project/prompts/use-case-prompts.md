# Use Case Prompts — Scaffold Firebase Project

## Scenario 1: SaaS Multi-Tenant App

```
Scaffold a Firebase project for a B2B SaaS application with multi-tenant
organization support. Each organization has members with different roles
(admin, editor, viewer). Documents are org-scoped.

Requirements:
- Firebase Auth with Google OAuth + email/password
- Firestore with organization-scoped Security Rules
- Cloud Functions v2 for invitation email + billing webhooks
- Firebase Hosting for React SPA
- Emulator suite for local development

Deliver:
1. Firestore collection structure with embed vs. reference rationale
2. Full firestore.rules with role-based access
3. Cloud Functions v2 stubs (TypeScript, strict mode)
4. firebase.json with emulator config
5. GitHub Actions CI workflow with rules tests
```

## Scenario 2: Mobile App with Offline Support

```
Scaffold a Firebase project for a mobile-first app (React Native + Expo)
with offline-capable Firestore, push notifications via FCM, and user profiles
with avatar image uploads to Cloud Storage.

Requirements:
- Firebase Auth with anonymous → registered upgrade flow
- Firestore with offline persistence enabled
- FCM push notifications from Cloud Functions
- Cloud Storage for avatar uploads with Security Rules
- App Check with Play Integrity / Device Check

Deliver:
1. Firestore data model for user profiles + notification settings
2. Security Rules for Firestore + Storage
3. Cloud Function to trigger FCM on new messages
4. App Check configuration
5. Emulator setup for offline development
```

## Scenario 3: Audit Existing Firebase Project

```
Review the Firebase configuration in the current repository.
Audit security posture, data model quality, and production readiness.

Evaluate:
- firestore.rules: Are there overly permissive rules? Missing field validation?
- firestore.indexes.json: Are all necessary indexes declared?
- Cloud Functions: Using v1 or v2? Any unbounded listeners?
- firebase.json: Missing security headers? Rewrites correct?
- Environment isolation: Are dev/staging/prod environments separated?

Deliver:
1. Security findings with severity (P0/P1/P2) and evidence tags
2. Data model quality assessment
3. Performance risks (unbounded queries, missing indexes)
4. Remediation roadmap with effort estimates
```

## Scenario 4: Migration from Firebase v8 to Modular SDK v9+

```
Plan and execute migration from Firebase JavaScript SDK v8 (compat) to
the modular SDK v9+ for a React app with 15+ components using Firebase.

Current state:
- import firebase from 'firebase/app' (compat)
- firebase.firestore(), firebase.auth() calls throughout
- firebase.functions().httpsCallable() pattern

Target state:
- Tree-shakeable modular imports
- 40-60% reduction in Firebase SDK bundle size
- TypeScript strict mode compatibility

Deliver:
1. Migration strategy (big-bang vs. incremental)
2. Codemod script or find/replace patterns
3. Updated initialization file
4. Before/after bundle size analysis approach
5. Testing strategy for migrated components
```

## Scenario 5: Cost Optimization Audit

```
Analyze the Firebase project usage patterns and identify cost optimization
opportunities for a production app with growing Firestore read costs.

Investigate:
- Firestore reads: Are any queries fetching more documents than needed?
- Function invocations: Any functions triggering on every document write?
- Realtime listeners: Are clients subscribing to large collections without filters?
- Storage: Are large files being served directly or via CDN?

Deliver:
1. Cost analysis with estimated monthly savings per optimization
2. Query optimization recommendations (pagination, field masks, caching)
3. Function optimization (debouncing triggers, batching)
4. Architecture recommendations for high-read patterns (aggregations, counters)
```

---
name: scaffold-firebase-project
author: "Javier Montaño (JM Labs)"
version: "2.0.0"
description: >
  Scaffold a production-ready Firebase project: Firestore data modeling,
  Security Rules, Cloud Functions v2, emulator suite, hosting config, and CI/CD.
  Covers auth flows, subcollection design, and multi-environment strategy.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
  - Agent
tags: [firebase, firestore, cloud-functions, security-rules, emulator, hosting]
---

# Scaffold Firebase Project

> *"Security Rules are your server-side logic — treat them with the same rigor as application code."*

## TL;DR

Five-step procedure to generate a Firebase project with correct Firestore data modeling,
tight Security Rules, typed Cloud Functions v2, local emulator integration, and a
CI/CD pipeline that validates rules before every deploy.

---

## Step 1 — Discover & Classify Context

1. Scan existing codebase: look for `firebase.json`, `.firebaserc`, `firestore.rules`,
   `firestore.indexes.json`, existing `functions/` directory.
2. Identify the app's primary read/write patterns: list-heavy vs. document-heavy,
   real-time listeners vs. one-shot reads, user-scoped vs. org-scoped data.
3. Determine auth strategy: Email/Password, Google OAuth, Anonymous, custom tokens,
   or Firebase App Check enforcement.
4. Tag all findings: `[HECHO]` for confirmed, `[INFERENCIA]` for derived, `[SUPUESTO]` for assumed.
5. Output a **Context Card**: auth type, primary collections, estimated document size,
   real-time requirements Y/N, target environments (dev/staging/prod).

---

## Step 2 — Data Model Design (Firestore)

Firestore is a document database — model for your queries, not for normalization.

### Decision Framework: Embed vs. Reference

| Signal | Embed (subcollection / nested map) | Reference (separate collection) |
|--------|-----------------------------------|---------------------------------|
| Data always read together | YES | NO |
| Unbounded growth | NO | YES |
| Need to query across parent docs | NO | YES |
| Data shared by multiple parents | NO | YES |
| Update frequency differs | NO | YES |

### Core Patterns to Apply

- **Fan-out writes** for activity feeds: write to each follower's inbox on post creation
  (Cloud Function triggered on `posts/{postId}` create).
- **Aggregation counters** via `FieldValue.increment()` — never read-count-write cycles.
- **Composite documents** for dashboards: maintain a `/stats/{userId}` doc updated by Functions.
- **Collection Group Queries** require a matching `collectionGroup` index in `firestore.indexes.json`.

### Index Strategy

```json
// firestore.indexes.json — always commit this file
{
  "indexes": [
    {
      "collectionGroup": "orders",
      "queryScope": "COLLECTION",
      "fields": [
        { "fieldPath": "userId", "order": "ASCENDING" },
        { "fieldPath": "createdAt", "order": "DESCENDING" }
      ]
    }
  ],
  "fieldOverrides": []
}
```

---

## Step 3 — Security Rules Design

Security Rules run on every read/write — they are your authorization layer.

### Rule Architecture

```javascript
// firestore.rules
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {

    // Helper functions — reuse, don't repeat
    function isSignedIn() {
      return request.auth != null;
    }
    function isOwner(userId) {
      return isSignedIn() && request.auth.uid == userId;
    }
    function hasRole(role) {
      return isSignedIn() &&
        get(/databases/$(database)/documents/users/$(request.auth.uid)).data.role == role;
    }
    function validUserFields() {
      return request.resource.data.keys().hasOnly(['displayName','email','updatedAt'])
        && request.resource.data.displayName is string
        && request.resource.data.displayName.size() <= 100;
    }

    match /users/{userId} {
      allow read: if isOwner(userId) || hasRole('admin');
      allow create: if isOwner(userId) && validUserFields();
      allow update: if isOwner(userId) && validUserFields();
      allow delete: if hasRole('admin');
    }

    match /posts/{postId} {
      allow read: if resource.data.published == true || isOwner(resource.data.authorId);
      allow create: if isSignedIn()
        && request.resource.data.authorId == request.auth.uid
        && request.resource.data.title.size() <= 200;
      allow update: if isOwner(resource.data.authorId);
      allow delete: if isOwner(resource.data.authorId) || hasRole('moderator');
    }
  }
}
```

### Rules Testing with Emulator

```bash
# Always test rules before deploy
firebase emulators:exec --only firestore \
  "npx jest --testPathPattern=firestore.rules.test"
```

---

## Step 4 — Cloud Functions v2

Use `functions/v2` for all new projects — better concurrency, min instances, and pricing.

```typescript
// functions/src/index.ts
import { onDocumentCreated } from 'firebase-functions/v2/firestore';
import { onCall, HttpsError } from 'firebase-functions/v2/https';
import { onSchedule } from 'firebase-functions/v2/scheduler';
import * as admin from 'firebase-admin';

admin.initializeApp();

// Triggered function — fan-out on new post
export const onPostCreated = onDocumentCreated(
  { document: 'posts/{postId}', region: 'us-central1' },
  async (event) => {
    const post = event.data?.data();
    if (!post) return;
    // Fan-out to followers...
  }
);

// Callable function — server-side validation
export const createCheckoutSession = onCall(
  { region: 'us-central1', enforceAppCheck: true },
  async (request) => {
    if (!request.auth) throw new HttpsError('unauthenticated', 'Login required');
    // Business logic...
    return { sessionId: 'cs_...' };
  }
);

// Scheduled — daily cleanup
export const dailyCleanup = onSchedule('every 24 hours', async () => {
  const cutoff = new Date(Date.now() - 30 * 24 * 60 * 60 * 1000);
  // Delete stale docs...
});
```

### Functions Configuration

```json
// firebase.json
{
  "functions": [{ "source": "functions", "codebase": "default" }],
  "firestore": {
    "rules": "firestore.rules",
    "indexes": "firestore.indexes.json"
  },
  "hosting": {
    "public": "dist",
    "rewrites": [{ "source": "**", "destination": "/index.html" }],
    "headers": [
      {
        "source": "**/*.@(js|css)",
        "headers": [{ "key": "Cache-Control", "value": "max-age=31536000" }]
      }
    ]
  }
}
```

---

## Step 5 — Emulator Suite & CI/CD

### Emulator Setup

```json
// firebase.json — emulators block
{
  "emulators": {
    "auth": { "port": 9099 },
    "firestore": { "port": 8080 },
    "functions": { "port": 5001 },
    "hosting": { "port": 5000 },
    "storage": { "port": 9199 },
    "ui": { "enabled": true, "port": 4000 }
  }
}
```

```typescript
// src/lib/firebase.ts — environment-aware init
import { connectFirestoreEmulator, getFirestore } from 'firebase/firestore';
import { connectAuthEmulator, getAuth } from 'firebase/auth';

const db = getFirestore();
const auth = getAuth();

if (import.meta.env.DEV) {
  connectFirestoreEmulator(db, '127.0.0.1', 8080);
  connectAuthEmulator(auth, 'http://127.0.0.1:9099');
}
```

### CI/CD Pipeline (GitHub Actions)

```yaml
# .github/workflows/firebase.yml
name: Firebase CI
on: [push]
jobs:
  test-and-deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with: { node-version: '20' }
      - run: npm ci && cd functions && npm ci
      - run: npx firebase-tools emulators:exec --only firestore,auth
               "npx jest --passWithNoTests"
        env: { FIREBASE_TOKEN: ${{ secrets.FIREBASE_TOKEN }} }
      - run: npm run build
      - run: npx firebase-tools deploy --only firestore,functions,hosting
        if: github.ref == 'refs/heads/main'
        env: { FIREBASE_TOKEN: ${{ secrets.FIREBASE_TOKEN }} }
```

---

## Quality Criteria

1. **Security Rules tested** — Unit tests cover every allow/deny branch.
2. **No client-side admin SDK** — Admin SDK only in Cloud Functions, never in browser bundle.
3. **Indexes committed** — `firestore.indexes.json` in version control, no composite index surprises in prod.
4. **Emulator parity** — Local dev uses emulators, not prod Firestore.
5. **Functions typed** — TypeScript strict mode, no `any` in function signatures.
6. **Environment isolation** — `.firebaserc` with `dev`, `staging`, `prod` aliases.
7. **Field validation in Rules** — `request.resource.data` validated for type and length.
8. **App Check enforced** — Callable functions use `enforceAppCheck: true` in prod.

---

## Anti-Patterns

- **Storing unbounded arrays** in a single document (Firestore 1MB doc limit, array operations are full rewrites).
- **Reading a document to check auth in Rules** (`get()` in rules counts as a read and adds latency — use custom claims instead for hot paths).
- **Deploying `allow read, write: if true`** and planning to "fix it later" — this has caused production data leaks.
- **Not using the emulator** — testing against prod Firestore incurs cost, causes state pollution, and risks real data.
- **Mixing admin SDK into client bundles** — service account credentials get exposed; use callable functions.
- **One giant `users` collection with all data** — model subcollections for logical groupings, queries, and security boundaries.
- **No composite indexes pre-declared** — Firestore throws at query time in prod if indexes are missing.

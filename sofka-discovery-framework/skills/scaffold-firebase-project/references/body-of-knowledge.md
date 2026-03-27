# Body of Knowledge: Scaffold Firebase Project

## Core Architecture Concepts

### Firebase Services Stack

Firebase is a suite of cloud services. A typical production project uses:

| Service | Purpose | Pricing Model |
|---------|---------|--------------|
| Firestore | Primary database | Per read/write/delete operation |
| Cloud Functions v2 | Backend logic | Per invocation + CPU/memory |
| Firebase Auth | Authentication | Free tier generous |
| Firebase Hosting | Static assets + CDN | Per GB transferred |
| Cloud Storage | File uploads | Per GB stored + operations |
| Firebase App Check | API abuse prevention | Free |

### Firestore Data Model Fundamentals

Firestore is a document-oriented, hierarchical database with strict consistency guarantees
within a document and eventual consistency across the hierarchy.

**Document limit**: 1MB per document. Arrays in documents are full-overwrites on update.

**Subcollections vs. root collections**:
- Subcollections (e.g., `/users/{uid}/posts/{postId}`) are logically grouped but
  independently queryable — they don't "belong" to the parent document.
- Deleting a parent document does NOT delete its subcollections (common surprise).
- Use root collections when you need to query across all instances of a type
  (e.g., all posts from all users = root `/posts` collection with `userId` field).

### Security Rules Execution Model

Security Rules run server-side before every read/write. They are:
- **Not filters** — `allow read: if resource.data.published == true` does NOT filter
  results; it denies the entire query if ANY matching document would be unauthorized.
- **Stateless per request** — Each `get()` call in Rules counts as a billable read.
- **Order-dependent** — First matching rule wins; order `allow` rules from most specific to most general.

```javascript
// WRONG: This doesn't filter — it denies the whole query if user doesn't own any doc
match /posts/{postId} {
  allow read: if resource.data.authorId == request.auth.uid;
}

// RIGHT: Add the filter in your query AND the rule
// Query: db.collection('posts').where('authorId', '==', uid)
// Rule validates the query is properly scoped
match /posts/{postId} {
  allow list: if request.auth != null
    && request.query.limit <= 100
    && 'authorId' in request.query.constraints
    && request.query.constraints.authorId == request.auth.uid;
  allow get: if resource.data.authorId == request.auth.uid;
}
```

### Custom Claims for Authorization

Custom claims are the correct way to implement role-based access without `get()` calls in Rules:

```typescript
// Cloud Function — set custom claims on user creation
export const onUserCreated = onDocumentCreated('users/{uid}', async (event) => {
  const user = event.data?.data();
  if (!user) return;

  await admin.auth().setCustomUserClaims(event.params.uid, {
    role: user.role ?? 'user',
    orgId: user.organizationId,
  });
});
```

```javascript
// Security Rule — use custom claims (no get() needed)
function hasRole(role) {
  return request.auth.token.role == role;
}
function inOrg(orgId) {
  return request.auth.token.orgId == orgId;
}
```

### Cloud Functions v2 Key Differences from v1

| Feature | v1 | v2 |
|---------|----|----|
| Concurrency | 1 req/instance | Up to 1000 req/instance |
| Min instances | Supported | Supported |
| Max instances | Hard limit | Configurable |
| CPU allocation | During req only | During req + optional always-on |
| Pricing | Per invocation | Per invocation + resource time |
| Region | Single | Multi-region support |
| Secret Manager | Manual | Native `secrets` param |

```typescript
// v2 with secrets
import { onCall, HttpsError } from 'firebase-functions/v2/https';
import { defineSecret } from 'firebase-functions/params';

const stripeKey = defineSecret('STRIPE_SECRET_KEY');

export const createPayment = onCall(
  { secrets: [stripeKey], enforceAppCheck: true, cors: true },
  async (request) => {
    const key = stripeKey.value();  // Injected at runtime
    // Use key...
  }
);
```

### Emulator Suite Architecture

The Firebase Emulator Suite runs locally and intercepts all SDK calls:

```
Firebase SDK (client)
  └─ connectFirestoreEmulator() → localhost:8080 (instead of production)
  └─ connectAuthEmulator() → localhost:9099
  └─ connectFunctionsEmulator() → localhost:5001

Emulator UI: localhost:4000 (full visual debugger)
```

Key emulator features:
- **Firestore Emulator**: Real Security Rules enforcement, full query support.
- **Auth Emulator**: Create test users, set custom claims, test auth flows.
- **Functions Emulator**: Trigger functions locally, debug with Node inspector.
- **Export/Import**: `firebase emulators:export ./emulator-data` for seeding test state.

### Multi-Environment Strategy

```
.firebaserc
├── default → my-project-dev
├── staging → my-project-staging
└── production → my-project-prod

deploy to staging: firebase use staging && firebase deploy
deploy to prod: firebase use production && firebase deploy
```

Use `firebase.json` `"targets"` for multi-site hosting deployments.

### Firestore Composite Index Deep Dive

Firestore automatically creates single-field indexes. Composite indexes must be declared:

```json
{
  "indexes": [
    {
      "collectionGroup": "messages",
      "queryScope": "COLLECTION",
      "fields": [
        { "fieldPath": "channelId", "order": "ASCENDING" },
        { "fieldPath": "createdAt", "order": "DESCENDING" },
        { "fieldPath": "__name__", "order": "DESCENDING" }
      ]
    }
  ]
}
```

**Collection Group indexes** are required for `collectionGroup()` queries across all
subcollections with the same name. Add `"queryScope": "COLLECTION_GROUP"`.

### App Check Integration

```typescript
// client: initialize App Check with reCAPTCHA v3
import { initializeAppCheck, ReCaptchaV3Provider } from 'firebase/app-check';

initializeAppCheck(app, {
  provider: new ReCaptchaV3Provider(RECAPTCHA_SITE_KEY),
  isTokenAutoRefreshEnabled: true,
});

// server: enforce in callable functions
export const myCallable = onCall(
  { enforceAppCheck: true },  // Rejects requests without valid token
  async (request) => { ... }
);
```

### Hosting Configuration Patterns

```json
{
  "hosting": {
    "public": "dist",
    "ignore": ["firebase.json", "**/.*", "**/node_modules/**"],
    "cleanUrls": true,
    "trailingSlash": false,
    "rewrites": [
      { "source": "/api/**", "function": "api" },
      { "source": "**", "destination": "/index.html" }
    ],
    "headers": [
      {
        "source": "**/*.@(js|css|woff2)",
        "headers": [
          { "key": "Cache-Control", "value": "public, max-age=31536000, immutable" }
        ]
      },
      {
        "source": "**",
        "headers": [
          { "key": "X-Frame-Options", "value": "DENY" },
          { "key": "X-Content-Type-Options", "value": "nosniff" },
          { "key": "Strict-Transport-Security", "value": "max-age=63072000" }
        ]
      }
    ]
  }
}
```

## Common Patterns

### Fan-Out Write Pattern (Activity Feeds)

```typescript
// On new post: write to each follower's feed
export const onPostCreated = onDocumentCreated('posts/{postId}', async (event) => {
  const post = event.data?.data();
  const db = admin.firestore();

  const followers = await db
    .collection('followers')
    .where('followingId', '==', post.authorId)
    .get();

  const batch = db.batch();
  followers.docs.forEach((doc) => {
    const feedRef = db.doc(`feeds/${doc.data().followerId}/items/${event.params.postId}`);
    batch.set(feedRef, { ...post, postId: event.params.postId });
  });

  await batch.commit();
});
```

### Atomic Counter Pattern

```typescript
// Client-side: use FieldValue.increment() — atomic, no read needed
import { doc, updateDoc, increment } from 'firebase/firestore';

await updateDoc(doc(db, 'posts', postId), {
  likesCount: increment(1),
  updatedAt: serverTimestamp(),
});
```

## References

- [Firebase Documentation](https://firebase.google.com/docs)
- [Firestore Security Rules Reference](https://firebase.google.com/docs/firestore/security/rules-conditions)
- [Cloud Functions v2 Migration Guide](https://firebase.google.com/docs/functions/2nd-gen-upgrade)
- [Firebase Local Emulator Suite](https://firebase.google.com/docs/emulator-suite)

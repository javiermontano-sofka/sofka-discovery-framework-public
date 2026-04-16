# Priming-RAG: Firebase Patterns
> Sovereign Architect — Firebase platform knowledge for RAG consumption
> Generated: 2026-03-18 | Version: v1.0

---

## Executive Summary
- Firebase is Google's app development platform with serverless backend services [HECHO]
- Core: Firestore, Authentication, Cloud Functions, Hosting, RTDB [HECHO]
- Security Rules are the primary authorization mechanism for Firestore/RTDB [HECHO]
- Cloud Functions v2 runs on Cloud Run with improved performance [HECHO]
- Firebase offers generous free tier (Spark plan) [HECHO]

## Key Patterns

### Firestore Data Modeling
- Denormalize for read-heavy patterns (embed vs reference) [HECHO]
- Subcollections for 1:many with independent security rules [HECHO]
- Use `collectionGroup` queries for querying across subcollections [HECHO]
- Composite indexes auto-created from query patterns [HECHO]
- Document size limit: 1MB [HECHO]

### Security Rules
- Rules cascade: parent rules affect subcollections [HECHO]
- Pattern: `allow read: if request.auth != null && resource.data.userId == request.auth.uid` [HECHO]
- Custom claims for role-based access: `request.auth.token.admin == true` [HECHO]
- Rules are deployed, not runtime — no API key equivalent [HECHO]

### Cloud Functions v2
- Runs on Cloud Run with concurrency support [HECHO]
- Triggers: Firestore, Auth, Storage, Pub/Sub, HTTP, Scheduled [HECHO]
- Min instances for reduced cold starts [HECHO]
- Use `onDocumentCreated/Updated/Deleted` for Firestore triggers [HECHO]

### Authentication
- 19+ identity providers (Google, Apple, GitHub, email, phone, etc.) [HECHO]
- Custom claims via Admin SDK: `auth.setCustomUserClaims(uid, claims)` [HECHO]
- Anonymous auth for guest users with account linking [HECHO]

## Anti-Patterns
- Deep nesting (>3 levels) in Firestore documents [HECHO]
- Not using batch writes for multi-document operations [HECHO]
- Storing arrays that grow unboundedly (use subcollections instead) [HECHO]
- Reading entire collections when queries suffice [HECHO]

## Query Hooks
- "Firestore vs RTDB?" → Firestore for complex queries, RTDB for simple real-time sync
- "How to structure Firestore for a social app?" → Users collection + subcollections for posts, follows
- "Cloud Functions v1 vs v2?" → v2 has concurrency, min instances, Cloud Run base

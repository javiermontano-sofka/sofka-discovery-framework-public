# State of the Art: Firebase Project Scaffolding (2025-2026)

## Current Landscape

Firebase has shifted significantly in 2024-2026 with the maturation of Cloud Functions v2,
the deprecation of the Modular SDK v8, and Firebase App Hosting as a competitor to Vercel.

## Key 2025-2026 Developments

### Cloud Functions v2 GA & Mandatory Migration

Cloud Functions v2 became the default in 2024. All new projects should use v2.
Key improvements:
- **Concurrency**: Up to 1000 concurrent requests per instance (previously 1).
- **Min instances with split CPU**: Keep instances warm without paying for full CPU.
- **HTTPS Functions**: Now support HTTP/2 out of the box.
- **Secrets integration**: `defineSecret()` pulls from Secret Manager natively.

### Firebase App Hosting (2025)

Firebase App Hosting launched to compete with Vercel/Netlify for Next.js/Angular apps:
- Automatic SSR deployment from GitHub.
- Built-in CDN with edge caching.
- Firebase Auth integration without SDK configuration.
- Replaces the manual `firebase deploy --only hosting` workflow for server-rendered apps.

### Firestore Vector Search (2025)

Firestore added native vector search support:
```typescript
// Store embeddings in Firestore
await db.collection('documents').add({
  content: 'some text',
  embedding: FieldValue.vector([0.1, 0.2, ...]),  // 768 or 1536 dims
});

// Query nearest neighbors
const query = db.collection('documents')
  .findNearest('embedding', FieldValue.vector(queryEmbedding), {
    limit: 10,
    distanceMeasure: 'COSINE',
  });
```

### Firebase GenKit (2025)

Firebase GenKit is Google's open-source AI orchestration framework, designed to work
natively with Firebase:
- Flows run as Cloud Functions v2.
- Built-in tracing, evaluation, and local dev UI.
- Supports Gemini, OpenAI, Anthropic, and local models.

### Data Connect (Preview 2025)

Firebase Data Connect is a new fully-managed PostgreSQL service with GraphQL:
- Schema-first: declare schema, get type-safe queries.
- Directly replaces Firestore for relational use cases within Firebase.
- Integrates with Firebase Auth for row-level security.
- Not production-ready for all use cases as of early 2026.

## Competing Landscape

| Alternative | When to Choose Over Firebase |
|-------------|----------------------------|
| Supabase | Relational data model, SQL expertise, open-source preference |
| Appwrite | Self-hosted requirement, open-source, multi-cloud |
| AWS Amplify | Existing AWS infrastructure, enterprise compliance |
| Convex | TypeScript-first, reactive queries, simpler than Firebase |

## Best Current Practices

1. **Always use Firestore (not Realtime Database)** for new projects — RTDB is legacy.
2. **Cloud Functions v2** is the default — v1 is being deprecated.
3. **Firebase App Check** in all production callable functions — prevents abuse.
4. **Emulator Suite in CI** — `firebase emulators:exec` in GitHub Actions for every PR.
5. **Custom claims over `get()` in Rules** — Reduces latency and cost.
6. **Modular SDK (v9+)** tree-shaking reduces bundle size by 40-60% vs compat SDK.

## Performance Benchmarks (2025)

- Firestore read latency (cached): 1-5ms
- Firestore read latency (uncached): 20-100ms
- Firestore write latency: 50-200ms
- Cloud Functions cold start (v2, Node 20): 200-800ms
- Cloud Functions warm request: 5-50ms
- Firebase Hosting CDN: < 50ms globally for cached assets

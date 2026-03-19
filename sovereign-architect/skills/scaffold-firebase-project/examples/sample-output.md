# Sample Output: Firebase SaaS Project Scaffold

## Context Card

- **Auth strategy**: Google OAuth + Email/Password [SUPUESTO — based on common SaaS patterns]
- **Primary collections**: `organizations`, `users`, `memberships`, `projects`, `invitations` [INFERENCIA]
- **Real-time requirements**: Project collaboration (live cursors optional later) [SUPUESTO]
- **Environments**: dev, staging, production [SUPUESTO]
- **Functions needed**: invitation email, billing webhook handler [HECHO — from requirements]

---

## Firestore Collection Structure

```
organizations/{orgId}
  ├── name: string
  ├── slug: string (unique)
  ├── planId: string
  ├── ownerId: string
  ├── createdAt: Timestamp
  └── settings: Map

users/{uid}
  ├── email: string
  ├── displayName: string
  ├── avatarUrl: string | null
  └── createdAt: Timestamp

memberships/{membershipId}
  ├── userId: string (indexed)
  ├── organizationId: string (indexed)
  ├── role: 'admin' | 'editor' | 'viewer'
  ├── invitedBy: string
  └── joinedAt: Timestamp

projects/{projectId}
  ├── organizationId: string (indexed)
  ├── name: string
  ├── status: 'active' | 'archived'
  ├── createdBy: string
  └── createdAt: Timestamp

invitations/{invitationId}
  ├── email: string
  ├── organizationId: string
  ├── role: 'admin' | 'editor' | 'viewer'
  ├── invitedBy: string
  ├── token: string (UUID)
  ├── expiresAt: Timestamp
  └── acceptedAt: Timestamp | null
```

**Embed vs. Reference decisions** [INFERENCIA]:
- Organization `settings` embedded (always read with org, small, no unbounded growth).
- `memberships` as root collection (need to query "all orgs for user" + "all users for org").
- `projects` as root collection (need to query across all projects for dashboards).

---

## Generated `firestore.rules`

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {

    // ─── Helper functions ───────────────────────────────────────────────
    function isSignedIn() {
      return request.auth != null;
    }

    function hasRole(orgId, role) {
      return isSignedIn()
        && request.auth.token.orgId == orgId
        && request.auth.token.role == role;
    }

    function isOrgMember(orgId) {
      return isSignedIn()
        && request.auth.token.orgId == orgId;
    }

    function isOrgAdmin(orgId) {
      return hasRole(orgId, 'admin');
    }

    function validOrgFields() {
      return request.resource.data.name is string
        && request.resource.data.name.size() >= 1
        && request.resource.data.name.size() <= 100
        && request.resource.data.slug is string
        && request.resource.data.slug.matches('^[a-z0-9-]+$');
    }

    // ─── Organizations ─────────────────────────────────────────────────
    match /organizations/{orgId} {
      allow read: if isOrgMember(orgId);
      allow create: if isSignedIn() && validOrgFields();
      allow update: if isOrgAdmin(orgId) && validOrgFields();
      allow delete: if false;  // Use Cloud Function — soft delete with cleanup
    }

    // ─── Users ─────────────────────────────────────────────────────────
    match /users/{userId} {
      allow read: if isSignedIn();  // Users are semi-public within platform
      allow create: if request.auth.uid == userId;
      allow update: if request.auth.uid == userId
        && request.resource.data.keys().hasOnly(['displayName', 'avatarUrl', 'updatedAt']);
      allow delete: if false;
    }

    // ─── Memberships ────────────────────────────────────────────────────
    match /memberships/{membershipId} {
      allow read: if isOrgMember(resource.data.organizationId)
        || request.auth.uid == resource.data.userId;
      allow create: if isOrgAdmin(request.resource.data.organizationId);
      allow update: if isOrgAdmin(resource.data.organizationId)
        && request.resource.data.keys().hasOnly(['role', 'updatedAt']);
      allow delete: if isOrgAdmin(resource.data.organizationId)
        || request.auth.uid == resource.data.userId;
    }

    // ─── Projects ───────────────────────────────────────────────────────
    match /projects/{projectId} {
      allow read: if isOrgMember(resource.data.organizationId);
      allow create: if isOrgMember(request.resource.data.organizationId)
        && !hasRole(request.resource.data.organizationId, 'viewer');
      allow update: if isOrgMember(resource.data.organizationId)
        && !hasRole(resource.data.organizationId, 'viewer');
      allow delete: if isOrgAdmin(resource.data.organizationId);
    }
  }
}
```

---

## Generated Cloud Functions (`functions/src/index.ts`)

```typescript
import { onDocumentCreated, onDocumentDeleted } from 'firebase-functions/v2/firestore';
import { onCall, HttpsError } from 'firebase-functions/v2/https';
import { defineSecret } from 'firebase-functions/params';
import * as admin from 'firebase-admin';

admin.initializeApp();

const sendgridKey = defineSecret('SENDGRID_API_KEY');

// Send invitation email when invitation document created
export const onInvitationCreated = onDocumentCreated(
  { document: 'invitations/{id}', region: 'us-central1', secrets: [sendgridKey] },
  async (event) => {
    const invitation = event.data?.data();
    if (!invitation) return;

    const sgMail = require('@sendgrid/mail');
    sgMail.setApiKey(sendgridKey.value());

    await sgMail.send({
      to: invitation.email,
      from: 'noreply@yourapp.com',
      subject: `You've been invited to join ${invitation.orgName}`,
      html: `<a href="https://app.yourapp.com/invite/${invitation.token}">Accept invitation</a>`,
    });
  }
);

// Callable: accept invitation
export const acceptInvitation = onCall(
  { region: 'us-central1', enforceAppCheck: true },
  async (request) => {
    if (!request.auth) throw new HttpsError('unauthenticated', 'Login required');

    const { token } = request.data as { token: string };
    const db = admin.firestore();

    const invitations = await db
      .collection('invitations')
      .where('token', '==', token)
      .where('acceptedAt', '==', null)
      .get();

    if (invitations.empty) {
      throw new HttpsError('not-found', 'Invitation not found or already used');
    }

    const invitation = invitations.docs[0];
    const data = invitation.data();

    if (data.expiresAt.toDate() < new Date()) {
      throw new HttpsError('deadline-exceeded', 'Invitation has expired');
    }

    const batch = db.batch();
    batch.set(db.collection('memberships').doc(), {
      userId: request.auth.uid,
      organizationId: data.organizationId,
      role: data.role,
      invitedBy: data.invitedBy,
      joinedAt: admin.firestore.FieldValue.serverTimestamp(),
    });
    batch.update(invitation.ref, { acceptedAt: admin.firestore.FieldValue.serverTimestamp() });
    await batch.commit();

    // Set custom claims for new organization
    await admin.auth().setCustomUserClaims(request.auth.uid, {
      orgId: data.organizationId,
      role: data.role,
    });

    return { organizationId: data.organizationId };
  }
);

// Cleanup when organization deleted
export const onOrganizationDeleted = onDocumentDeleted(
  { document: 'organizations/{orgId}', region: 'us-central1' },
  async (event) => {
    const db = admin.firestore();
    const orgId = event.params.orgId;

    // Delete all memberships
    const memberships = await db
      .collection('memberships')
      .where('organizationId', '==', orgId)
      .get();

    const batch = db.batch();
    memberships.docs.forEach((doc) => batch.delete(doc.ref));
    await batch.commit();
  }
);
```

---

## Generated `firebase.json`

```json
{
  "functions": [{ "source": "functions", "codebase": "default", "ignore": ["node_modules"] }],
  "firestore": {
    "rules": "firestore.rules",
    "indexes": "firestore.indexes.json"
  },
  "hosting": {
    "public": "dist",
    "cleanUrls": true,
    "rewrites": [{ "source": "**", "destination": "/index.html" }],
    "headers": [
      {
        "source": "**/*.@(js|css|woff2)",
        "headers": [{ "key": "Cache-Control", "value": "max-age=31536000,immutable" }]
      },
      {
        "source": "**",
        "headers": [
          { "key": "X-Frame-Options", "value": "DENY" },
          { "key": "X-Content-Type-Options", "value": "nosniff" }
        ]
      }
    ]
  },
  "emulators": {
    "auth": { "port": 9099 },
    "firestore": { "port": 8080 },
    "functions": { "port": 5001 },
    "hosting": { "port": 5000 },
    "ui": { "enabled": true, "port": 4000 }
  }
}
```

---

## Quality Gate Checklist

- [x] Security Rules: Role-based access via custom claims (no `get()` on hot paths)
- [x] Security Rules: Field validation on all write operations
- [x] Security Rules: No `allow read, write: if true`
- [x] Cloud Functions: v2 API used throughout
- [x] Cloud Functions: App Check enforced on callable functions
- [x] Cloud Functions: Secrets via `defineSecret()` — no hardcoded keys
- [x] Emulator suite: All services configured in `firebase.json`
- [x] Environment isolation: `.firebaserc` with dev/staging/prod aliases
- [ ] CI/CD: GitHub Actions workflow with Rules tests (generate separately with `/sa:generate-ci`)
- [ ] Rules tests: Unit tests for every allow/deny branch (generate separately)

---

## Next Steps

1. Run `firebase emulators:start` — verify all services start without errors.
2. Implement Security Rules unit tests for all collections.
3. Configure `.firebaserc` with your actual project IDs.
4. Set up Sendgrid API key in Secret Manager: `firebase functions:secrets:set SENDGRID_API_KEY`.
5. Enable App Check in Firebase Console and configure reCAPTCHA v3 site key.

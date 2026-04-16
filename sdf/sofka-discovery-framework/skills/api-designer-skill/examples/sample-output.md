# API Designer — Sample Output

## Context
A fintech company needs a REST API for their invoice management system. The API serves a React web app and a mobile app, handling invoice creation, approval workflows, and payment tracking.

## Output

### API Design Summary

- **Style**: REST (OpenAPI 3.1)
- **Base URL**: `https://api.acme-invoicing.com/v1`
- **Authentication**: Bearer JWT (OAuth2 Authorization Code flow)
- **Versioning**: URL path (`/v1/`)
- **Error Format**: RFC 7807 Problem Details

### Core Resources

| Resource | Endpoints | Description |
|----------|-----------|-------------|
| `/invoices` | GET, POST | Invoice collection |
| `/invoices/{id}` | GET, PATCH, DELETE | Single invoice |
| `/invoices/{id}/approve` | POST | Approval action |
| `/invoices/{id}/payments` | GET, POST | Payments for invoice |
| `/customers` | GET, POST | Customer directory |

### OpenAPI Specification (excerpt)

```yaml
openapi: 3.1.0
info:
  title: Invoice Management API
  version: 1.0.0
  description: API for managing invoices, approvals, and payment tracking.

paths:
  /v1/invoices:
    get:
      summary: List invoices
      operationId: listInvoices
      parameters:
        - name: cursor
          in: query
          schema:
            type: string
          description: Opaque pagination cursor from previous response.
        - name: limit
          in: query
          schema:
            type: integer
            minimum: 1
            maximum: 100
            default: 25
        - name: status
          in: query
          schema:
            type: string
            enum: [draft, pending_approval, approved, paid, overdue, cancelled]
        - name: created_after
          in: query
          schema:
            type: string
            format: date-time
      responses:
        '200':
          description: Paginated list of invoices.
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/InvoiceListResponse'
              example:
                data:
                  - id: "inv_8x7kQ2mP"
                    customer_id: "cust_3nR9vL"
                    total_amount: 15000.00
                    currency: "USD"
                    status: "pending_approval"
                    created_at: "2026-03-10T14:30:00Z"
                pagination:
                  next_cursor: "eyJpZCI6MTAwfQ=="
                  has_more: true

  /v1/invoices/{id}/approve:
    post:
      summary: Approve an invoice
      operationId: approveInvoice
      parameters:
        - name: id
          in: path
          required: true
          schema:
            type: string
      requestBody:
        content:
          application/json:
            schema:
              type: object
              properties:
                approver_note:
                  type: string
                  maxLength: 500
      responses:
        '200':
          description: Invoice approved.
        '409':
          description: Invoice not in approvable state.
          content:
            application/problem+json:
              schema:
                $ref: '#/components/schemas/ProblemDetails'
              example:
                type: "https://api.acme-invoicing.com/errors/invalid-state-transition"
                title: "Invalid State Transition"
                status: 409
                detail: "Invoice inv_8x7kQ2mP is in status 'paid' and cannot be approved."
                instance: "/v1/invoices/inv_8x7kQ2mP/approve"

components:
  schemas:
    ProblemDetails:
      type: object
      properties:
        type:
          type: string
          format: uri
        title:
          type: string
        status:
          type: integer
        detail:
          type: string
        instance:
          type: string
```

### Versioning Policy
- **Minor versions** (additive): new optional fields, new endpoints — no version bump in URL.
- **Major versions** (breaking): field removal, type changes, semantic changes — new URL path (`/v2/`).
- **Deprecation**: 6-month notice via `Sunset` header and developer portal announcement.

# Functional Specification — Sample Output

## Context

A fintech startup needs to specify the loan application workflow before
engaging a development team. The workflow involves credit scoring, document
verification, and regulatory compliance checks.

## Output

### Use Case: UC-001 Submit Loan Application

**Actor**: Applicant (Primary), Credit Bureau (Secondary)

**Preconditions**: Applicant has a verified account and completed KYC.

**Main Flow**:
1. Applicant selects loan type and enters requested amount.
2. System validates amount against loan type limits (BR-001).
3. Applicant uploads required documents.
4. System verifies document completeness (BR-002).
5. System initiates credit score check with Credit Bureau.
6. System calculates preliminary eligibility and displays result.

**Alternative Flows**:
- 2a. Amount exceeds limit: System displays maximum allowed and prompts adjustment.
- 5a. Credit Bureau unavailable: System queues request and notifies applicant of delay.

**Postconditions**: Application created with status PENDING_REVIEW.

### Business Rules

| Rule ID | Description | Source |
|---------|-------------|--------|
| BR-001 | Personal loans: min $1,000, max $50,000. Business loans: min $10,000, max $500,000. | Product Policy v3.2 |
| BR-002 | Required documents: government ID, proof of income, bank statements (last 3 months). | Compliance Manual |
| BR-003 | Applications with credit score below 580 require manual review. | Risk Committee Decision 2024-Q3 |

### Complexity/Risk Matrix

| Use Case | Complexity | Risk | Priority | Notes |
|----------|-----------|------|----------|-------|
| UC-001 Submit Application | Medium | Medium | Must Have | Credit Bureau integration is the main complexity driver |
| UC-002 Document Verification | High | High | Must Have | OCR accuracy and fraud detection require PoC |
| UC-003 Manual Review | Low | Medium | Should Have | Workflow engine dependency |
| UC-004 Disbursement | High | Critical | Must Have | Banking API integration, regulatory reporting |

### Acceptance Criteria — UC-001

```gherkin
Given an applicant with verified KYC status
When they submit a personal loan application for $25,000
Then the system creates an application with status PENDING_REVIEW
And initiates a credit score check

Given an applicant requesting $75,000 for a personal loan
When the system validates the amount against BR-001
Then the system displays "Maximum allowed: $50,000"
And prompts the applicant to adjust the amount
```

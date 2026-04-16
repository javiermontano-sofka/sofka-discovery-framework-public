# Mermaid Diagramming — Use Case Prompts

## Prompt 1: C4 System Context
> Create a C4 Context diagram for an online banking platform. The system interacts with: retail customers (web + mobile), back-office operators, a core banking system (external), a payment gateway (Stripe), an identity provider (Auth0), and a regulatory reporting system. Show the primary interactions and data flows between each actor and the banking platform.

## Prompt 2: Sequence Diagram for API Flow
> Create a sequence diagram showing the complete OAuth 2.0 authorization code flow with PKCE for a mobile application. Include: the mobile app, authorization server, resource server, and the user's browser. Show the code verifier generation, authorization request, callback with code, token exchange, and resource access. Include error paths for expired codes and invalid tokens.

## Prompt 3: State Machine for Order Lifecycle
> Create a state diagram for an e-commerce order lifecycle. States: Draft, Submitted, PaymentPending, PaymentFailed, Confirmed, Preparing, Shipped, Delivered, Returned, Cancelled, Refunded. Show all valid transitions, the events that trigger them, and guard conditions (e.g., "cancel only if not yet shipped"). Highlight the happy path.

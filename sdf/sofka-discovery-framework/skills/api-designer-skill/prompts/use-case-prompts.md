# API Designer — Use Case Prompts

## Prompt 1: REST API for Order Management
> Design an OpenAPI 3.1 specification for an order management API. Resources: orders, order items, payments, shipments. The API must support: creating orders with multiple items, partial updates to order status, payment processing via a third-party gateway, and shipment tracking. Include cursor-based pagination, filtering by date range and status, and RFC 7807 error responses. Authentication is via Bearer JWT tokens.

## Prompt 2: GraphQL Schema for Content Management
> Design a GraphQL schema for a headless CMS. Types needed: Article, Author, Category, Tag, MediaAsset, Comment. Requirements: nested queries (articles with authors and comments), mutations for CRUD on articles with draft/publish workflow, real-time subscriptions for new comments, and file upload for media assets. Include input validation directives and connection-based pagination (Relay spec).

## Prompt 3: gRPC Service for Real-Time Pricing
> Design a Protocol Buffers definition for a real-time pricing service used by an e-commerce frontend. The service must support: unary price lookup by product ID, server streaming for price updates on a watchlist, and bidirectional streaming for bulk price negotiation. Include message types for Price, Product, Currency, and Discount. Define error codes using gRPC status conventions.

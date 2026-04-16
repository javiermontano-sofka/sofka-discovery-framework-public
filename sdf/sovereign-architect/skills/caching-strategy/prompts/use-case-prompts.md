# Caching Strategy — Use Case Prompts

## Prompt 1: E-Commerce Product Catalog Caching
> Design a caching strategy for an e-commerce product catalog serving 500K unique products with 2M daily page views. Product data changes infrequently (5-10 updates/hour) but pricing changes multiple times per day during sales events. The current product detail page has a 350ms p95 latency (target: <100ms). We use PostgreSQL for storage and have Redis available. Design a multi-layer caching architecture with appropriate TTLs, invalidation strategy for price changes, and CDN configuration for product images.

## Prompt 2: Social Media Feed Caching
> Design a caching strategy for a social media platform's news feed. Each user sees a personalized feed combining posts from followed accounts (average 200 follows per user). The feed must show new posts within 30 seconds of creation. The system serves 1M DAU with peak 50K concurrent users. Challenges: high cardinality (per-user cache), frequent writes (10K new posts/minute), and the need to handle viral content that suddenly becomes hot. Propose cache patterns, eviction strategies, and a fan-out approach.

## Prompt 3: API Response Caching for Multi-Tenant SaaS
> Design a caching strategy for a B2B analytics SaaS where API responses include tenant-specific data. Requirements: tenant data isolation in cache (tenant A must never see tenant B's data), support for per-tenant cache quotas, dashboard queries that aggregate large datasets (currently 2-5 second response times), and cache invalidation when tenants upload new data. The system has 500 tenants with widely varying data sizes (10MB to 50GB).

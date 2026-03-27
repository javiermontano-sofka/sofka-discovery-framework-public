# Body of Knowledge: Technical SEO

## Core Concepts

### How Search Engines Work

1. **Crawling** — Googlebot fetches pages via HTTP. It follows links, respects `robots.txt`, and processes `Crawl-delay`.
2. **Rendering** — Googlebot renders JavaScript (using WRS — Web Rendering Service) but with delays. Server-rendered content is indexed faster and more reliably.
3. **Indexing** — Parsed content enters the index. Title, meta description, structured data, and content quality affect ranking signals.
4. **Ranking** — 200+ signals including Core Web Vitals (page experience), backlinks, content relevance, and E-E-A-T.

### Crawl Budget

For large sites (> 10k URLs), Googlebot has a crawl budget per domain. Wasted crawl budget means important pages aren't indexed:

```
Crawl budget wasters:
- Infinite scroll without pagination
- Faceted navigation URLs (thousands of filter combinations)
- Session IDs in URLs: /products?sessid=abc123
- Duplicate content at multiple URLs
- URLs returning 4xx (still crawled, waste budget)
- Internal search result pages: /search?q=...

Crawl budget optimization:
- robots.txt Disallow for non-indexable URLs
- <meta name="robots" content="noindex"> for thin/duplicate pages
- canonical tags to consolidate duplicate content
- XML sitemap with only canonical, indexable URLs
```

### URL Canonicalization

The canonical URL is the preferred version when multiple URLs have the same or similar content.

```
Problem: Same product accessible at:
  /products/widget
  /products/widget?ref=email
  /products/widget?color=blue (no filtering)
  /products/widget/  (trailing slash)

Solution:
1. <link rel="canonical" href="https://www.example.com/products/widget" />
2. 301 redirect from /products/widget/ to /products/widget
3. robots.txt Disallow: *?ref=*
```

### Structured Data Deep Dive

Google's Rich Results require valid JSON-LD (preferred over Microdata).

**High-impact schema types**:
- `Article` / `NewsArticle` — Eligible for Top Stories carousel.
- `Product` + `AggregateRating` — Star ratings in SERPs.
- `FAQPage` — Expandable Q&A under the search result.
- `HowTo` — Step-by-step with images.
- `BreadcrumbList` — URL path shown as breadcrumbs in SERP.
- `SiteLinksSearchBox` — Enables search box in Knowledge Panel.
- `Organization` + `sameAs` — Knowledge Panel entity association.

**Validation sequence**:
```
1. schema.org validator → Check type correctness
2. Google Rich Results Test → Check eligibility
3. Search Console Enhancements → Monitor live status
```

### Core Web Vitals as SEO Signals

Google's Page Experience update made CWV ranking signals. Field data (Chrome UX Report)
is used for ranking, not lab data (Lighthouse):

| Metric | Good | Needs Improvement | Poor | What It Measures |
|--------|------|------------------|------|-----------------|
| LCP | < 2.5s | 2.5-4s | > 4s | Largest visible element load time |
| INP | < 200ms | 200-500ms | > 500ms | Interaction responsiveness |
| CLS | < 0.1 | 0.1-0.25 | > 0.25 | Unexpected layout shift |

**LCP optimization hierarchy**:
1. Eliminate render-blocking resources (unused CSS/JS).
2. Preload LCP image with `fetchPriority="high"`.
3. Use WebP/AVIF with proper `<picture>` elements.
4. Serve image from CDN with edge caching.
5. Use `srcset` for responsive images.

**CLS root causes**:
- Images without `width`/`height` attributes (browser doesn't reserve space).
- Ads/embeds without reserved space (`min-height`).
- Web fonts causing FOUT/FOIT — use `font-display: swap`.
- Dynamically injected content above existing content.

### hreflang for Internationalization

```html
<!-- In <head> of every language variant -->
<link rel="alternate" hreflang="en-us" href="https://www.example.com/" />
<link rel="alternate" hreflang="es-mx" href="https://www.example.com/es-mx/" />
<link rel="alternate" hreflang="x-default" href="https://www.example.com/" />
```

Rules:
- Every variant must reference all other variants (reciprocal).
- `x-default` is the fallback for unmatched locales.
- Can also be in sitemap or HTTP headers (for non-HTML resources).

### Open Graph Protocol

Open Graph controls how pages appear when shared on social platforms:

```html
<!-- Minimum required -->
<meta property="og:title" content="Page Title" />
<meta property="og:type" content="website" /> <!-- or article, product -->
<meta property="og:url" content="https://www.example.com/page" />
<meta property="og:image" content="https://www.example.com/og-image.jpg" />

<!-- Recommended -->
<meta property="og:description" content="..." />
<meta property="og:image:width" content="1200" />
<meta property="og:image:height" content="630" />
<meta property="og:image:alt" content="Image description" />
<meta property="og:site_name" content="Company Name" />
```

**Image specifications**:
- Minimum: 600x315px
- Recommended: 1200x630px (2:1 aspect ratio)
- Format: JPG or PNG (not SVG — not supported by OG scrapers)
- Max file size: 8MB
- Unique per page (not same image for every page)

### robots.txt Advanced Patterns

```
# Block specific file types
User-agent: *
Disallow: /*.pdf$
Disallow: /*.doc$

# Block URL patterns (wildcards)
Disallow: /search?*
Disallow: /*?sessionid=*

# Allow specific crawlers more access
User-agent: Googlebot
Allow: /ajax/

# Crawl-delay (not supported by Google, respected by others)
User-agent: bingbot
Crawl-delay: 10

# Multiple sitemaps
Sitemap: https://www.example.com/sitemap-index.xml
```

## Common Patterns

### Next.js App Router SEO Checklist

```typescript
// Required for every page:
export const metadata: Metadata = {
  title: { default: '...', template: '%s | Brand' },
  description: '...',
  openGraph: { ... },
  twitter: { ... },
  robots: { index: true, follow: true },
  alternates: { canonical: '...' },
};

// In root layout:
// - OrganizationSchema JSON-LD
// - WebSite schema with SearchAction

// Per article/product page:
// - ArticleSchema or ProductSchema JSON-LD
// - BreadcrumbList schema
```

### Sitemap Index for Large Sites

```xml
<!-- sitemap-index.xml — when > 50,000 URLs -->
<?xml version="1.0" encoding="UTF-8"?>
<sitemapindex xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
  <sitemap>
    <loc>https://www.example.com/sitemap-pages.xml</loc>
    <lastmod>2025-01-01</lastmod>
  </sitemap>
  <sitemap>
    <loc>https://www.example.com/sitemap-blog.xml</loc>
  </sitemap>
  <sitemap>
    <loc>https://www.example.com/sitemap-products.xml</loc>
  </sitemap>
</sitemapindex>
```

## References

- [Google Search Central Documentation](https://developers.google.com/search/docs)
- [Schema.org](https://schema.org/)
- [Google Rich Results Test](https://search.google.com/test/rich-results)
- [Core Web Vitals](https://web.dev/vitals/)
- [Open Graph Protocol](https://ogp.me/)

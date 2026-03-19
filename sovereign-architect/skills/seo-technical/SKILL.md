---
name: seo-technical
author: "Javier Montaño (JM Labs)"
version: "2.0.0"
description: >
  Technical SEO audit and implementation: structured data (JSON-LD), meta tags,
  Open Graph/Twitter Cards, XML sitemap, robots.txt, Core Web Vitals optimization,
  crawl budget management, and canonical URL strategy.
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - Bash
  - Agent
tags: [seo, structured-data, json-ld, open-graph, core-web-vitals, sitemap, meta-tags]
---

# Technical SEO

> *"Technical SEO is the foundation. No amount of content or links helps if Googlebot can't parse, render, or index your pages correctly."*

## TL;DR

Five-step procedure to audit and implement technical SEO: metadata architecture,
structured data for rich results, sitemap and robots.txt configuration,
Core Web Vitals as ranking signals, and crawl budget management for large sites.

---

## Step 1 — Crawl & Indexability Audit

1. Fetch `robots.txt` — verify no accidental `Disallow: /` rules blocking prod.
2. Check `<meta name="robots">` on key pages — confirm no `noindex` leaking from staging.
3. Validate sitemap: present, submitted to Search Console, all URLs return 200.
4. Check canonical tags: self-referential on canonical pages, pointing to canonical on
   paginated/filtered/duplicate pages.
5. Run `curl -I https://domain.com/page` — check for redirects, `X-Robots-Tag` headers.

### `robots.txt` Pattern

```
User-agent: *
Allow: /

# Block parameterized facets that don't add indexable value
Disallow: /search?*
Disallow: /products?sort=*
Disallow: /products?page=*

# Block admin, API, auth
Disallow: /admin/
Disallow: /api/
Disallow: /_next/

Sitemap: https://www.example.com/sitemap.xml
Sitemap: https://www.example.com/sitemap-blog.xml
```

---

## Step 2 — Meta Tags Architecture

### Head Component (Next.js 14 App Router)

```typescript
// app/layout.tsx — root metadata
import { Metadata } from 'next';

export const metadata: Metadata = {
  metadataBase: new URL('https://www.example.com'),
  title: {
    default: 'Company Name — Value Proposition',
    template: '%s | Company Name',
  },
  description: 'Under 160 characters. Imperative, specific, keyword-rich.',
  robots: {
    index: true,
    follow: true,
    googleBot: {
      index: true,
      follow: true,
      'max-video-preview': -1,
      'max-image-preview': 'large',
      'max-snippet': -1,
    },
  },
  alternates: {
    canonical: 'https://www.example.com',
    languages: {
      'en-US': 'https://www.example.com',
      'es-MX': 'https://es.example.com',
    },
  },
};
```

### Open Graph + Twitter Cards

```typescript
// app/blog/[slug]/page.tsx
export async function generateMetadata({ params }): Promise<Metadata> {
  const post = await getPost(params.slug);
  return {
    title: post.title,
    description: post.excerpt,
    openGraph: {
      type: 'article',
      title: post.title,
      description: post.excerpt,
      url: `https://www.example.com/blog/${post.slug}`,
      images: [{ url: post.ogImage, width: 1200, height: 630, alt: post.title }],
      publishedTime: post.publishedAt,
      modifiedTime: post.updatedAt,
      authors: [post.author.url],
    },
    twitter: {
      card: 'summary_large_image',
      title: post.title,
      description: post.excerpt,
      images: [post.ogImage],
      creator: '@handle',
    },
  };
}
```

---

## Step 3 — Structured Data (JSON-LD)

### Organization + WebSite (Root Layout)

```typescript
// components/StructuredData.tsx
export function OrganizationSchema() {
  return (
    <script
      type="application/ld+json"
      dangerouslySetInnerHTML={{
        __html: JSON.stringify({
          '@context': 'https://schema.org',
          '@type': 'Organization',
          name: 'Example Company',
          url: 'https://www.example.com',
          logo: 'https://www.example.com/logo.png',
          sameAs: [
            'https://www.linkedin.com/company/example',
            'https://twitter.com/example',
          ],
        }),
      }}
    />
  );
}

export function ArticleSchema({ post }: { post: Post }) {
  return (
    <script
      type="application/ld+json"
      dangerouslySetInnerHTML={{
        __html: JSON.stringify({
          '@context': 'https://schema.org',
          '@type': 'Article',
          headline: post.title,
          description: post.excerpt,
          image: post.ogImage,
          datePublished: post.publishedAt,
          dateModified: post.updatedAt,
          author: { '@type': 'Person', name: post.author.name, url: post.author.url },
          publisher: {
            '@type': 'Organization',
            name: 'Example Company',
            logo: { '@type': 'ImageObject', url: 'https://www.example.com/logo.png' },
          },
          mainEntityOfPage: {
            '@type': 'WebPage',
            '@id': `https://www.example.com/blog/${post.slug}`,
          },
        }),
      }}
    />
  );
}
```

### FAQ Schema (High CTR Impact)

```json
{
  "@context": "https://schema.org",
  "@type": "FAQPage",
  "mainEntity": [
    {
      "@type": "Question",
      "name": "How does X work?",
      "acceptedAnswer": {
        "@type": "Answer",
        "text": "X works by... [full answer, not truncated]"
      }
    }
  ]
}
```

---

## Step 4 — XML Sitemap

```typescript
// app/sitemap.ts — Next.js dynamic sitemap
import { MetadataRoute } from 'next';
import { getAllPosts, getAllProducts } from '@/lib/api';

export default async function sitemap(): Promise<MetadataRoute.Sitemap> {
  const [posts, products] = await Promise.all([getAllPosts(), getAllProducts()]);

  const staticPages: MetadataRoute.Sitemap = [
    { url: 'https://www.example.com', lastModified: new Date(), changeFrequency: 'daily', priority: 1.0 },
    { url: 'https://www.example.com/about', changeFrequency: 'monthly', priority: 0.8 },
    { url: 'https://www.example.com/blog', changeFrequency: 'daily', priority: 0.9 },
  ];

  const postPages: MetadataRoute.Sitemap = posts.map((post) => ({
    url: `https://www.example.com/blog/${post.slug}`,
    lastModified: new Date(post.updatedAt),
    changeFrequency: 'weekly',
    priority: 0.7,
  }));

  return [...staticPages, ...postPages];
}
```

---

## Step 5 — Core Web Vitals for SEO

### LCP (Largest Contentful Paint) — Target < 2.5s

```typescript
// Preload hero image — most impactful LCP fix
// Next.js Image with priority:
<Image src="/hero.webp" alt="..." width={1200} height={630} priority />
// Generates: <link rel="preload" as="image" fetchpriority="high" />
```

### CLS (Cumulative Layout Shift) — Target < 0.1

```css
/* Always set explicit dimensions on images and embeds */
img { width: 100%; height: auto; aspect-ratio: attr(width) / attr(height); }

/* Reserve space for dynamic content — fonts */
@font-face {
  font-display: swap; /* Prevents invisible text during font load */
}
```

### INP (Interaction to Next Paint) — Target < 200ms

```typescript
// Defer non-critical JS
<Script src="/analytics.js" strategy="lazyOnload" />

// Yield to browser for long tasks
async function processLargeList(items: Item[]) {
  for (const item of items) {
    processItem(item);
    // yield every 50ms to allow browser to handle input
    if (performance.now() % 50 < 1) {
      await new Promise(resolve => setTimeout(resolve, 0));
    }
  }
}
```

### Measuring CWV

```bash
# Lighthouse CI in GitHub Actions
npx lhci autorun \
  --collect.url=https://example.com \
  --upload.target=temporary-public-storage

# PageSpeed Insights API
curl "https://www.googleapis.com/pagespeedonline/v5/runPagespeed?url=https://example.com&strategy=mobile&key=$PSI_API_KEY" \
  | jq '.lighthouseResult.categories.performance.score'
```

---

## Quality Criteria

1. **All pages have unique `<title>` and `<meta description>`** — No duplicates, under 60/160 chars.
2. **Canonical tags present on every indexable page** — Self-referential; no canonical confusion.
3. **Structured data validates in Google's Rich Results Test** — Zero errors, zero warnings.
4. **Sitemap submitted and clean** — All URLs return 200, no URLs blocked by robots.txt.
5. **LCP < 2.5s on mobile (P75)** — Hero image preloaded with `fetchPriority="high"`.
6. **CLS < 0.1** — All images and embeds have explicit dimensions.
7. **No `noindex` on production pages** — Staging noindex not leaked to prod.
8. **Open Graph images sized 1200x630** — Correct aspect ratio for all social platforms.

---

## Anti-Patterns

- **`<title>` tag in `<body>`** — Some frameworks accidentally render it outside `<head>`; crawlers may ignore it.
- **Lazy-loading LCP image** — `loading="lazy"` on the above-the-fold hero image delays LCP by 200-500ms.
- **Identical meta descriptions across all pages** — Google rewrites them anyway; provide unique descriptions as signals.
- **Blocking CSS with `@import` in stylesheets** — Each `@import` is a serial round trip; use `<link>` tags or bundler.
- **JSON-LD in client-rendered JS only** — Googlebot may not execute JavaScript; server-render structured data in `<head>`.
- **Sitemap includes 404/redirected URLs** — Wastes crawl budget and signals poor site maintenance to Google.
- **`robots.txt` blocking JS/CSS** — Googlebot cannot render pages if core assets are disallowed; renders mobile-unfriendly.

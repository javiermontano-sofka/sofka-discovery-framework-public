# Sample Output: Technical SEO Audit — Next.js E-Commerce Site

## Audit Context

- **Framework**: Next.js 14 App Router [HECHO — `next.config.js` and `app/` directory present]
- **Pages**: Product pages (~2000), blog (~150), category pages (~80), static pages (~15)
- **Current state**: Basic metadata, no structured data, no sitemap [HECHO]
- **CWV field data**: LCP 3.8s, INP 340ms, CLS 0.22 [SUPUESTO — Search Console not accessible]

---

## Findings

| Priority | Issue | Evidence | Estimated Impact |
|----------|-------|---------|-----------------|
| P0 | Hero image not preloaded — LCP element unoptimized | `src/components/Hero.tsx` line 12 | -1.5s LCP |
| P0 | CLS 0.22 — Product images missing width/height | `ProductCard.tsx` line 8 | -0.20 CLS |
| P0 | No sitemap.xml | No `sitemap.ts` in `/app` | 2000 pages not discovered |
| P1 | No structured data on product pages | No JSON-LD in product layout | Lost product rich results |
| P1 | Generic meta description on all pages | `layout.tsx` line 5: hardcoded description | Reduced CTR |
| P1 | Missing canonical tags on paginated categories | `/category/[slug]/page/[n]` | Duplicate content signal |
| P2 | robots.txt missing sitemap reference | Current robots.txt | Slower sitemap discovery |
| P2 | Open Graph image same across all pages | Hardcoded `/og-default.jpg` | Poor social sharing CTR |

---

## P0 Fixes

### Fix 1: Preload LCP Hero Image

```typescript
// BEFORE: app/page.tsx
<img src="/hero.jpg" alt="Hero" className="w-full h-96 object-cover" />

// AFTER: app/page.tsx
import Image from 'next/image';
<Image
  src="/hero.jpg"
  alt="Hero — Summer Collection 2025"
  width={1200}
  height={630}
  priority              // ← Generates <link rel="preload" fetchpriority="high">
  sizes="100vw"
  className="w-full object-cover"
/>
```

Expected LCP improvement: -1.2 to -1.8s

### Fix 2: Product Card Image Dimensions

```typescript
// BEFORE: components/ProductCard.tsx
<img src={product.image} alt={product.name} className="w-full" />

// AFTER: components/ProductCard.tsx
<Image
  src={product.image}
  alt={product.name}
  width={400}
  height={400}
  sizes="(max-width: 768px) 50vw, 25vw"
  className="w-full aspect-square object-cover"
/>
```

Expected CLS improvement: -0.18 to -0.22 CLS points

### Fix 3: Sitemap Generation

```typescript
// app/sitemap.ts
import { MetadataRoute } from 'next';
import { getProducts, getBlogPosts, getCategories } from '@/lib/api';

export default async function sitemap(): Promise<MetadataRoute.Sitemap> {
  const [products, posts, categories] = await Promise.all([
    getProducts({ select: ['slug', 'updatedAt'] }),
    getBlogPosts({ select: ['slug', 'updatedAt'] }),
    getCategories({ select: ['slug'] }),
  ]);

  return [
    { url: 'https://www.store.com', changeFrequency: 'daily', priority: 1.0 },
    { url: 'https://www.store.com/blog', changeFrequency: 'daily', priority: 0.9 },
    ...products.map(p => ({
      url: `https://www.store.com/products/${p.slug}`,
      lastModified: new Date(p.updatedAt),
      changeFrequency: 'weekly' as const,
      priority: 0.8,
    })),
    ...categories.map(c => ({
      url: `https://www.store.com/category/${c.slug}`,
      changeFrequency: 'daily' as const,
      priority: 0.7,
    })),
    ...posts.map(p => ({
      url: `https://www.store.com/blog/${p.slug}`,
      lastModified: new Date(p.updatedAt),
      changeFrequency: 'monthly' as const,
      priority: 0.6,
    })),
  ];
}
```

---

## P1 Fixes

### Product Structured Data

```typescript
// app/products/[slug]/page.tsx
export default async function ProductPage({ params }) {
  const product = await getProduct(params.slug);

  const jsonLd = {
    '@context': 'https://schema.org',
    '@type': 'Product',
    name: product.name,
    description: product.description,
    image: product.images,
    sku: product.sku,
    brand: { '@type': 'Brand', name: product.brand },
    offers: {
      '@type': 'Offer',
      price: product.price,
      priceCurrency: 'USD',
      availability: product.inStock
        ? 'https://schema.org/InStock'
        : 'https://schema.org/OutOfStock',
      url: `https://www.store.com/products/${product.slug}`,
    },
    aggregateRating: product.reviewCount > 0 ? {
      '@type': 'AggregateRating',
      ratingValue: product.averageRating,
      reviewCount: product.reviewCount,
    } : undefined,
  };

  return (
    <>
      <script
        type="application/ld+json"
        dangerouslySetInnerHTML={{ __html: JSON.stringify(jsonLd) }}
      />
      {/* ... rest of page */}
    </>
  );
}
```

### Dynamic Meta Descriptions

```typescript
// app/products/[slug]/page.tsx
export async function generateMetadata({ params }): Promise<Metadata> {
  const product = await getProduct(params.slug);
  return {
    title: `${product.name} — Buy Online | Store Name`,
    description: `${product.name}. ${product.shortDescription} From $${product.price}. ${product.reviewCount > 0 ? `★${product.averageRating} (${product.reviewCount} reviews).` : ''} Free shipping over $50.`,
    alternates: {
      canonical: `https://www.store.com/products/${product.slug}`,
    },
    openGraph: {
      title: product.name,
      description: product.shortDescription,
      images: [{ url: product.mainImage, width: 1200, height: 630, alt: product.name }],
      type: 'website',
    },
  };
}
```

---

## Quality Gate Checklist

- [x] P0: Hero image `priority` prop set — preload generated
- [x] P0: Product images have `width` and `height` — CLS eliminated
- [x] P0: `app/sitemap.ts` generates all URL types
- [ ] P1: Product JSON-LD implemented — validate in Rich Results Test
- [ ] P1: Dynamic `generateMetadata` on all page types
- [ ] P1: Canonical tags on paginated category pages
- [ ] P2: robots.txt updated with sitemap URL
- [ ] P2: Per-page Open Graph images

---

## Measurement Plan

1. Submit sitemap to Google Search Console: `https://www.store.com/sitemap.xml`.
2. Run Lighthouse CI on deploy: target LCP < 2.5s, CLS < 0.1, INP < 200ms.
3. Monitor Search Console Coverage report for new indexed URLs (2-4 week delay).
4. Validate structured data: Rich Results Test on 3 representative product URLs.
5. Check Search Console Enhancements > Products in 30 days.

# Use Case Prompts — Technical SEO

## Scenario 1: Full SEO Audit for Next.js App

```
Perform a complete technical SEO audit for this Next.js 14 App Router application.

Evaluate:
1. Crawlability: robots.txt, noindex tags, canonical URLs
2. Metadata: unique title/description per page, template consistency
3. Structured data: which pages have JSON-LD, validation status
4. Open Graph: social sharing cards on all shareable pages
5. Sitemap: presence, URL count, all URLs return 200
6. Core Web Vitals: identify LCP element, CLS triggers, INP issues

Deliver:
1. Audit findings table with severity (P0/P1/P2) and evidence tags
2. Specific code fixes for each P0 and P1 finding
3. Measurement plan (Search Console reports, Lighthouse CI config)
4. Implementation roadmap with effort estimates
```

## Scenario 2: Implement JSON-LD for E-Commerce Site

```
Add structured data to an e-commerce site with product pages, category pages,
and a blog. Goal: eligible for Google's rich results (product ratings, FAQ, breadcrumbs).

Product pages need:
- Product schema with offers, aggregateRating, brand
- BreadcrumbList

Blog posts need:
- Article schema with author, datePublished, image
- BreadcrumbList

Category pages need:
- BreadcrumbList only (no Product schema)

Deliver:
1. JSON-LD components for each page type (React/Next.js)
2. Data fetching required for each schema (what to query from CMS/API)
3. Validation output (what to check in Rich Results Test)
4. Schema types and fields mapped to database entities
```

## Scenario 3: Fix Core Web Vitals Failing LCP

```
The site's LCP is 4.8s on mobile (P75, field data from Search Console).
The LCP element is a hero image above the fold on the homepage.

Current implementation:
- <img src="/hero.jpg" alt="..." className="hero" />
- CSS: .hero { width: 100%; height: 500px; object-fit: cover; }
- Image is 2.4MB JPEG, served from origin (no CDN)
- No preload link in <head>

Analyze and fix:
1. Identify all contributing factors to 4.8s LCP
2. Prioritize fixes by expected impact
3. Provide corrected implementation code
4. Estimate resulting LCP after each optimization

Target: < 2.5s LCP on mobile P75
```

## Scenario 4: International SEO (hreflang)

```
The site serves 4 language variants:
- English (default): https://www.example.com/
- Spanish (Mexico): https://www.example.com/es-mx/
- Portuguese (Brazil): https://www.example.com/pt-br/
- French (France): https://www.example.com/fr/

Current state: no hreflang implementation. Google is indexing only the English
version and not surfacing the Spanish/Portuguese versions in their respective markets.

Deliver:
1. hreflang link tag implementation (in <head> or sitemap)
2. x-default tag placement rationale
3. Common hreflang mistakes to avoid
4. Verification approach (Search Console + manual curl)
5. Sitemap approach as alternative/supplement
```

## Scenario 5: Diagnose Indexing Drop

```
The site lost 40% of indexed pages according to Search Console (Coverage report).
Pages that were previously indexed now show "Discovered — currently not indexed"
or "Crawled — currently not indexed".

Investigate:
1. robots.txt changes in last 30 days
2. noindex meta tags on affected page types
3. Canonical tag issues pointing away from intended canonical
4. Crawl budget issues (server errors, slow response)
5. Sitemap changes

Deliver:
1. Hypothesis ranking by likelihood
2. Diagnostic steps for each hypothesis
3. Evidence-tagged findings from codebase inspection
4. Remediation plan with verification steps
```

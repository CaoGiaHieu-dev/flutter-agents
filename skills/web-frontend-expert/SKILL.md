---
name: web-frontend-expert
description: >-
  Web frontend architect. Covers React, Next.js (App Router),
  Vite, TypeScript, CSS/Tailwind, Web Vitals, SEO, and
  accessibility (a11y) standards.
---
# Web Frontend — Expert Development Protocol

This skill governs all web frontend development.

---

## 1. PROJECT DNA DETECTION

Scan `package.json` and config files to identify:

- **Framework:** Next.js (App Router) vs Vite+React vs Vue
  vs Svelte vs vanilla HTML/JS.
- **Styling:** Tailwind CSS vs CSS Modules vs styled-components.
- **TypeScript:** Strict mode enabled?
- **Build tool:** Webpack vs Vite vs Turbopack.

Match the existing stack. If no stack exists, prefer Vite
for SPAs and Next.js for SSR/SEO-critical apps.

## 2. REACT & NEXT.JS

- **Server Components (RSC):** Prefer for data fetching to
  minimize client-side JavaScript.
- **`'use client'`:** Only at leaf-node interactive components.
  Never on layout or page-level components.
- **Dynamic routing:** Use intercepting routes and parallel
  routes for complex layouts (dashboards, modals).
- **Metadata API:** Use static/dynamic metadata for SEO
  (title, description, Open Graph, sitemap, robots).

## 3. VITE & VANILLA

When using Vite or vanilla JS:

- Use ES modules and dynamic imports for code splitting.
- Configure `vite.config.ts` with proper aliases and
  build optimization.
- For vanilla projects, structure with clear separation:
  `index.html`, `styles/`, `scripts/`, `assets/`.

## 4. TYPESCRIPT & TYPE SAFETY

- 100% strict TypeScript. Prohibit `any`.
- Use Zod for runtime input validation and API contracts.
- Prefer `interface` for object shapes, `type` for unions.
- Export types alongside their implementations.

## 5. PERFORMANCE & WEB VITALS

- **LCP** < 2.5s: Optimize critical rendering path.
- **FID/INP** < 200ms: Keep main thread responsive.
- **CLS** < 0.1: Set explicit dimensions on images/media.
- **Image optimization:** Use `<Image />` (Next.js) or
  `srcset` with explicit dimensions.
- **Code splitting:** Chunk large libraries (charts, editors)
  via `lazy` or `dynamic` imports.

## 6. STYLING

- **Tailwind:** Group classes logically. Use `cn()` (clsx +
  tailwind-merge) for dynamic classes.
- **CSS Modules:** Prefer for component-scoped styles when
  Tailwind is not used.
- **Dark mode:** Support via CSS custom properties or
  Tailwind's `dark:` variant.

## 7. ACCESSIBILITY (A11Y)

- Semantic HTML: `<main>`, `<nav>`, `<section>`, `<article>`.
- High color contrast (4.5:1 minimum).
- Full keyboard navigation capability.
- ARIA attributes for dynamic components.
- `prefers-reduced-motion` respected.

## 8. QUALITY GATE

1. `tsc` and `next lint` → zero errors.
2. Lighthouse score ≥ 90 on Performance, A11y, SEO.
3. Bundle size: warn if page JS > 100KB (first-load).
4. Test: component tests with React Testing Library.

# 📚 Standards de Développement - Guide Complet

## 🎯 Introduction

**Ces standards garantissent la qualité, l'accessibilité, la performance et le SEO de tous vos projets.**

### **Pourquoi ces standards ?**

- ✅ **Google valorise** les sites de qualité
- ✅ **Accessibilité** = plus d'utilisateurs
- ✅ **Performance** = meilleur SEO
- ✅ **Tests** = code maintenable
- ✅ **Business** = opportunités

---

## 🔧 Standards Techniques

### **1. IDs Explicites**

#### **❌ Interdit**

```html
<button id="btn1">Cliquer</button>
<div id="container">Contenu</div>
<form id="form">Formulaire</form>
```

#### **✅ Obligatoire**

```html
<button id="user-profile-edit-button">Modifier le profil</button>
<div id="product-list-container">Liste des produits</div>
<form id="contact-form">Formulaire de contact</form>
```

#### **Conventions de Nommage**

```bash
# Format : kebab-case
- user-profile-edit-button
- product-card-image
- navigation-menu-toggle
- footer-social-links

# Éviter
- btn1, btn2, btn3
- container, wrapper, div
- form1, form2
```

### **2. Data-Testid pour les Tests**

#### **✅ Obligatoire sur tous les éléments interactifs**

```html
<button
  id="user-profile-edit-button"
  data-testid="user-profile-edit-button"
  aria-label="Modifier le profil utilisateur"
>
  Modifier
</button>

<div
  id="product-list-container"
  data-testid="product-list-container"
  role="region"
  aria-labelledby="product-list-title"
>
  <h2 id="product-list-title">Nos produits</h2>
</div>
```

#### **Tests avec Testing Library**

```javascript
import { render, screen, fireEvent } from "@testing-library/react";

test("user can edit profile", () => {
  render(<UserProfile />);

  const editButton = screen.getByTestId("user-profile-edit-button");
  fireEvent.click(editButton);

  expect(screen.getByTestId("profile-edit-form")).toBeInTheDocument();
});
```

### **3. Attributs ARIA**

#### **✅ Obligatoire sur tous les éléments interactifs**

```html
<!-- Boutons -->
<button
  aria-label="Ouvrir le menu de navigation"
  aria-expanded="false"
  aria-controls="navigation-menu"
>
  Menu
</button>

<!-- Images -->
<img
  src="/logo.png"
  alt="Logo de l'entreprise AIGEEKIA"
  aria-describedby="logo-description"
/>

<!-- Formulaires -->
<input
  type="email"
  aria-label="Adresse email"
  aria-required="true"
  aria-describedby="email-error"
/>

<!-- Navigation -->
<nav role="navigation" aria-label="Menu principal">
  <ul role="menubar">
    <li role="menuitem">
      <a href="/accueil">Accueil</a>
    </li>
  </ul>
</nav>
```

### **4. Structure HTML Sémantique**

#### **✅ Obligatoire**

```html
<main role="main">
  <header role="banner">
    <nav role="navigation" aria-label="Menu principal">
      <!-- Navigation -->
    </nav>
  </header>

  <section role="region" aria-labelledby="hero-title">
    <h1 id="hero-title">Titre principal</h1>
    <p>Description</p>
  </section>

  <article role="article">
    <h2>Titre de l'article</h2>
    <p>Contenu</p>
  </article>

  <aside role="complementary" aria-labelledby="sidebar-title">
    <h2 id="sidebar-title">Informations complémentaires</h2>
  </aside>

  <footer role="contentinfo">
    <!-- Footer -->
  </footer>
</main>
```

---

## ⚡ Standards Performance

### **1. Images Optimisées**

#### **✅ Avec Next.js Image**

```jsx
import Image from "next/image";

export default function OptimizedImage() {
  return (
    <Image
      src="/hero-image.jpg"
      alt="Image d'accueil du site"
      width={1200}
      height={600}
      priority={true} // Pour les images above the fold
      placeholder="blur"
      blurDataURL="data:image/jpeg;base64,..."
    />
  );
}
```

#### **✅ Avec attributs de performance**

```html
<img
  src="/image.jpg"
  alt="Description"
  loading="lazy"
  decoding="async"
  width="800"
  height="600"
/>
```

### **2. Code Splitting**

#### **✅ Avec React.lazy**

```jsx
import { lazy, Suspense } from "react";

const HeavyComponent = lazy(() => import("./HeavyComponent"));

export default function App() {
  return (
    <Suspense fallback={<div>Chargement...</div>}>
      <HeavyComponent />
    </Suspense>
  );
}
```

### **3. Optimisation CSS**

#### **✅ Tailwind CSS avec PurgeCSS**

```javascript
// tailwind.config.js
module.exports = {
  content: [
    "./pages/**/*.{js,ts,jsx,tsx}",
    "./components/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {},
  },
  plugins: [],
};
```

---

## 🔍 Standards SEO

### **1. Meta Tags**

#### **✅ Obligatoire**

```jsx
import Head from "next/head";

export default function Page() {
  return (
    <>
      <Head>
        <title>Page d'accueil | AIGEEKIA</title>
        <meta name="description" content="Description de la page" />
        <meta
          name="keywords"
          content="mots-clés, séparés, par, des, virgules"
        />
        <meta name="robots" content="index, follow" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />

        {/* Open Graph */}
        <meta property="og:title" content="Titre pour les réseaux sociaux" />
        <meta
          property="og:description"
          content="Description pour les réseaux sociaux"
        />
        <meta property="og:image" content="/og-image.jpg" />
        <meta property="og:url" content="https://votre-site.com" />

        {/* Twitter */}
        <meta name="twitter:card" content="summary_large_image" />
        <meta name="twitter:title" content="Titre Twitter" />
        <meta name="twitter:description" content="Description Twitter" />
        <meta name="twitter:image" content="/twitter-image.jpg" />
      </Head>

      {/* Contenu de la page */}
    </>
  );
}
```

### **2. Structure des URLs**

#### **✅ SEO-Friendly**

```bash
# ✅ Bonnes URLs
https://votre-site.com/produits/ordinateurs-portables
https://votre-site.com/blog/comment-optimiser-seo
https://votre-site.com/contact

# ❌ URLs à éviter
https://votre-site.com/p?id=123
https://votre-site.com/page.php?cat=tech&id=456
```

### **3. Sitemap et Robots.txt**

#### **✅ Sitemap.xml**

```xml
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
  <url>
    <loc>https://votre-site.com/</loc>
    <lastmod>2024-01-15</lastmod>
    <changefreq>weekly</changefreq>
    <priority>1.0</priority>
  </url>
  <url>
    <loc>https://votre-site.com/produits</loc>
    <lastmod>2024-01-15</lastmod>
    <changefreq>daily</changefreq>
    <priority>0.8</priority>
  </url>
</urlset>
```

#### **✅ Robots.txt**

```txt
User-agent: *
Allow: /

Sitemap: https://votre-site.com/sitemap.xml
```

---

## 🧪 Standards de Tests

### **1. Tests Unitaires**

#### **✅ Avec Jest et Testing Library**

```javascript
import { render, screen, fireEvent } from "@testing-library/react";
import "@testing-library/jest-dom";
import UserProfile from "./UserProfile";

describe("UserProfile", () => {
  test("affiche le nom de l'utilisateur", () => {
    render(<UserProfile name="John Doe" />);

    expect(screen.getByText("John Doe")).toBeInTheDocument();
  });

  test("permet de modifier le profil", () => {
    render(<UserProfile name="John Doe" />);

    const editButton = screen.getByTestId("user-profile-edit-button");
    fireEvent.click(editButton);

    expect(screen.getByTestId("profile-edit-form")).toBeInTheDocument();
  });

  test("sauvegarde les modifications", async () => {
    const mockSave = jest.fn();
    render(<UserProfile onSave={mockSave} />);

    const saveButton = screen.getByTestId("profile-save-button");
    fireEvent.click(saveButton);

    expect(mockSave).toHaveBeenCalled();
  });
});
```

### **2. Tests d'Accessibilité**

#### **✅ Avec jest-axe**

```javascript
import { render } from "@testing-library/react";
import { axe, toHaveNoViolations } from "jest-axe";
import UserProfile from "./UserProfile";

expect.extend(toHaveNoViolations);

test("n'a pas de violations d'accessibilité", async () => {
  const { container } = render(<UserProfile />);
  const results = await axe(container);
  expect(results).toHaveNoViolations();
});
```

### **3. Tests de Performance**

#### **✅ Avec Lighthouse CI**

```javascript
// .lighthouserc.js
module.exports = {
  ci: {
    assert: {
      assertions: {
        "categories:accessibility": ["error", { minScore: 1 }],
        "categories:performance": ["error", { minScore: 0.9 }],
        "categories:best-practices": ["error", { minScore: 1 }],
        "categories:seo": ["error", { minScore: 0.95 }],
      },
    },
  },
};
```

---

## 🛠️ Outils de Vérification

### **1. ESLint Configuration**

#### **✅ Règles personnalisées**

```javascript
// .eslintrc.js
module.exports = {
  extends: [
    "next/core-web-vitals",
    "plugin:jsx-a11y/recommended",
    "@typescript-eslint/recommended",
  ],
  plugins: ["jsx-a11y", "@typescript-eslint"],
  rules: {
    // Règles pour forcer nos standards
    "jsx-a11y/aria-props": "error",
    "jsx-a11y/aria-proptypes": "error",
    "jsx-a11y/aria-unsupported-elements": "error",
    "jsx-a11y/role-has-required-aria-props": "error",
    "jsx-a11y/role-supports-aria-props": "error",
    "jsx-a11y/tabindex-no-positive": "error",
    "jsx-a11y/alt-text": "error",
    "jsx-a11y/anchor-has-content": "error",
    "jsx-a11y/anchor-is-valid": "error",
    "jsx-a11y/click-events-have-key-events": "error",
    "jsx-a11y/no-autofocus": "error",
    "jsx-a11y/no-static-element-interactions": "error",
  },
};
```

### **2. Pre-commit Hooks**

#### **✅ Avec Husky**

```json
// package.json
{
  "husky": {
    "hooks": {
      "pre-commit": "lint-staged"
    }
  },
  "lint-staged": {
    "*.{js,jsx,ts,tsx}": ["eslint --fix", "prettier --write"]
  }
}
```

### **3. CI/CD Pipeline**

#### **✅ GitHub Actions**

```yaml
# .github/workflows/quality.yml
name: Quality Check

on: [push, pull_request]

jobs:
  quality:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2

      - name: Setup Node.js
        uses: actions/setup-node@v2
        with:
          node-version: "18"

      - name: Install dependencies
        run: npm ci

      - name: Run ESLint
        run: npm run lint

      - name: Run tests
        run: npm test

      - name: Run Lighthouse CI
        run: npm run lighthouse
```

---

## 📊 Métriques de Qualité

### **1. Scores Minimum**

#### **✅ Lighthouse**

```bash
# Scores obligatoires
- Performance : > 90
- Accessibility : 100
- Best Practices : 100
- SEO : > 95
```

#### **✅ Tests Coverage**

```bash
# Coverage minimum
- Statements : > 80%
- Branches : > 80%
- Functions : > 80%
- Lines : > 80%
```

### **2. Métriques de Performance**

#### **✅ Core Web Vitals**

```bash
# Métriques obligatoires
- LCP (Largest Contentful Paint) : < 2.5s
- FID (First Input Delay) : < 100ms
- CLS (Cumulative Layout Shift) : < 0.1
```

---

## 🎯 Checklist de Vérification

### **Avant chaque commit :**

- [ ] IDs explicites sur tous les éléments
- [ ] data-testid sur les éléments interactifs
- [ ] Attributs ARIA appropriés
- [ ] Images avec alt text
- [ ] Tests passent à 100%
- [ ] ESLint sans erreurs
- [ ] Performance optimale
- [ ] SEO configuré

### **Avant chaque déploiement :**

- [ ] Lighthouse score > 90
- [ ] Tests coverage > 80%
- [ ] Accessibilité 100%
- [ ] Meta tags complets
- [ ] Sitemap à jour
- [ ] Robots.txt configuré

---

## 🚀 Conclusion

**Ces standards garantissent :**

- ✅ **Qualité** du code
- ✅ **Accessibilité** pour tous
- ✅ **Performance** optimale
- ✅ **SEO** efficace
- ✅ **Maintenabilité** du code
- ✅ **Business** impact positif

**Respectez ces standards sur TOUS vos projets !** 🎯

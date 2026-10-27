# Playwright JavaScript: Page Object Model

A small, interview-friendly UI automation project using **Playwright Test**, **JavaScript**, and the **Page Object Model (POM)** pattern. The example tests use the public SauceDemo practice website.

## Project structure

```text
playwright-js-pom/
├── pages/
│   ├── LoginPage.js
│   └── InventoryPage.js
├── tests/
│   └── login.spec.js
├── .gitignore
├── package.json
└── playwright.config.js
```

## Prerequisites

- Node.js 18 or newer
- npm
- Internet access to reach https://www.saucedemo.com

## Install and run

Run these commands from this directory:

```bash
npm install
npx playwright install chromium
npm test
```

Run with a visible browser:

```bash
npm run test:headed
```

Open the HTML report after a run:

```bash
npm run report
```

You can override the target website with the `BASE_URL` environment variable, for example:

```bash
BASE_URL=https://www.saucedemo.com npm test
```

## How the Page Object Model is applied

- **Page classes** (`LoginPage`, `InventoryPage`) keep page locators and page-level actions in one place.
- **Tests** describe expected user behaviour and assertions rather than repeating locator details.
- **Playwright fixtures** provide a fresh `page` for each test.
- **Role-based and placeholder locators** are preferred where practical because they describe how users interact with the UI.
- **Assertions** use Playwright's auto-waiting `expect` APIs instead of fixed sleeps.

## Test scenarios

1. A user can log in with valid demo credentials and see six inventory items.
2. An invalid password displays an authentication error.

Demo credentials used by SauceDemo:
- Username: `standard_user`
- Password: `secret_sauce`

## Interview explanation

The POM pattern separates test intent from UI implementation. If a locator changes, update the relevant page object rather than every test. Page objects should expose meaningful actions and useful page state, while tests remain responsible for scenario-level assertions.

This is a learning/demo project. Before using it in a real application, keep credentials in environment variables or a secret manager and adapt locators and assertions to the application's actual UI.

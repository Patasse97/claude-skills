# Flaky Test Taxonomy

## Decision Tree

```
Test is flaky
â”‚
â”œâ”€â”€ Fails locally with --repeat-each=20?
â”‚   â”œâ”€â”€ YES â†’ TIMING / ASYNC
â”‚   â”‚   â”œâ”€â”€ Missing await? â†’ Add await
â”‚   â”‚   â”œâ”€â”€ waitForTimeout? â†’ Replace with assertion
â”‚   â”‚   â”œâ”€â”€ Race condition? â†’ Wait for specific event
â”‚   â”‚   â””â”€â”€ Animation? â†’ Wait for animation end or disable
â”‚   â”‚
â”‚   â””â”€â”€ NO â†’ Continue...
â”‚
â”œâ”€â”€ Passes alone, fails in suite?
â”‚   â”œâ”€â”€ YES â†’ TEST ISOLATION
â”‚   â”‚   â”œâ”€â”€ Shared variable? â†’ Make per-test
â”‚   â”‚   â”œâ”€â”€ Database state? â†’ Reset per-test
â”‚   â”‚   â”œâ”€â”€ localStorage? â†’ Clear in beforeEach
â”‚   â”‚   â””â”€â”€ Cookie leak? â†’ Use isolated contexts
â”‚   â”‚
â”‚   â””â”€â”€ NO â†’ Continue...
â”‚
â”œâ”€â”€ Fails in CI, passes locally?
â”‚   â”œâ”€â”€ YES â†’ ENVIRONMENT
â”‚   â”‚   â”œâ”€â”€ Viewport? â†’ Set explicit size
â”‚   â”‚   â”œâ”€â”€ Fonts? â†’ Use Docker locally
â”‚   â”‚   â”œâ”€â”€ Timezone? â†’ Use UTC everywhere
â”‚   â”‚   â””â”€â”€ Network? â†’ Mock external services
â”‚   â”‚
â”‚   â””â”€â”€ NO â†’ INFRASTRUCTURE
â”‚       â”œâ”€â”€ Browser crash? â†’ Reduce workers
â”‚       â”œâ”€â”€ OOM? â†’ Limit parallel tests
â”‚       â”œâ”€â”€ DNS? â†’ Add retry config
â”‚       â””â”€â”€ File system? â†’ Use unique temp dirs
```

## Common Fixes by Category

### Timing / Async

**Missing await:**
```typescript
// BAD â€” race condition
page.goto('/dashboard');
expect(page.getByText('Welcome')).toBeVisible();

// GOOD
await page.goto('/dashboard');
await expect(page.getByText('Welcome')).toBeVisible();
```

**Clicking before visible:**
```typescript
// BAD â€” element may not be ready
await page.getByRole('button', { name: 'Submit' }).click();

// GOOD â€” ensure visible first
const submitBtn = page.getByRole('button', { name: 'Submit' });
await expect(submitBtn).toBeVisible();
await submitBtn.click();
```

**Race with network:**
```typescript
// BAD â€” data might not be loaded
await page.goto('/users');
await expect(page.getByRole('table')).toBeVisible();

// GOOD â€” wait for API response
const responsePromise = page.waitForResponse('**/api/users');
await page.goto('/users');
await responsePromise;
await expect(page.getByRole('table')).toBeVisible();
```

### Test Isolation

**Shared state fix:**
```typescript
// BAD â€” tests share userId
let userId: string;
test('create', async () => { userId = '123'; });
test('read', async () => { /* uses userId */ });

// GOOD â€” each test is independent
test('read user', async ({ request }) => {
  const response = await request.post('/api/users', { data: { name: 'Test' } });
  const { id } = await response.json();
  // Use id within this test
});
```

**localStorage cleanup:**
```typescript
test.beforeEach(async ({ page }) => {
  await page.goto('/');
  await page.evaluate(() => localStorage.clear());
});
```

### Environment

**Explicit viewport:**
```typescript
test.use({ viewport: { width: 1280, height: 720 } });
```

**Timezone-safe dates:**
```typescript
// BAD
expect(dateText).toBe('March 5, 2026');

// GOOD â€” timezone independent
expect(dateText).toMatch(/\d{1,2}\/\d{1,2}\/\d{4}/);
```

### Infrastructure

**Retry config:**
```typescript
// playwright.config.ts
export default defineConfig({
  retries: process.env.CI ? 2 : 0,
  workers: process.env.CI ? 2 : undefined,
});
```

**Increase timeout for CI:**
```typescript
test.setTimeout(60_000); // 60s for slow CI
```


# Golden Rules

1. **`getByRole()` over CSS/XPath** â€” resilient to markup changes, mirrors assistive technology
2. **Never `page.waitForTimeout()`** â€” use `expect(locator).toBeVisible()` or `page.waitForURL()`
3. **Web-first assertions** â€” `expect(locator)` auto-retries; `expect(await locator.textContent())` does not
4. **Isolate every test** â€” no shared state, no execution-order dependencies
5. **`baseURL` in config** â€” zero hardcoded URLs in tests
6. **Retries: `2` in CI, `0` locally** â€” surface flakiness where it matters
7. **Traces: `'on-first-retry'`** â€” rich debugging artifacts without CI slowdown
8. **Fixtures over globals** â€” share state via `test.extend()`, not module-level variables
9. **One behavior per test** â€” multiple related `expect()` calls are fine
10. **Mock external services only** â€” never mock your own app; mock third-party APIs, payment gateways, email


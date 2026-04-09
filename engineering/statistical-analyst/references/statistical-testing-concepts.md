# Statistical Testing Concepts Reference

Deep-dive reference for the Statistical Analyst skill. Keeps SKILL.md lean while preserving the theory.

---

## The Frequentist Framework

All tests in this skill operate in the **frequentist framework**: we define a null hypothesis (Hâ‚€) and an alternative (Hâ‚), then ask "how often would we see data this extreme if Hâ‚€ were true?"

- **Hâ‚€ (null):** No difference exists between control and treatment
- **Hâ‚ (alternative):** A difference exists (two-tailed)
- **p-value:** P(observing this result or more extreme | Hâ‚€ is true)
- **Î± (significance level):** The threshold we set in advance. Reject Hâ‚€ if p < Î±.

### The p-value misconception
A p-value of 0.03 does **not** mean "there is a 97% chance the effect is real."
It means: "If there were no effect, we would see data this extreme only 3% of the time."

---

## Type I and Type II Errors

| | Hâ‚€ True | Hâ‚€ False |
|---|---|---|
| Reject Hâ‚€ | **Type I Error (Î±)** â€” False Positive | Correct (Power = 1âˆ’Î²) |
| Fail to reject Hâ‚€ | Correct | **Type II Error (Î²)** â€” False Negative |

- **Î±** (false positive rate): Typically 0.05. Reduce it when false positives are costly (medical trials, irreversible changes).
- **Î²** (false negative rate): Typically 0.20 (power = 80%). Reduce it when missing real effects is costly.

---

## Two-Proportion Z-Test

**When:** Comparing two binary conversion rates (e.g. clicked/not, signed up/not).

**Assumptions:**
- Independent samples
- nÃ—p â‰¥ 5 and nÃ—(1âˆ’p) â‰¥ 5 for both groups (normal approximation valid)
- No interference between units (SUTVA)

**Formula:**
```
z = (pÌ‚â‚‚ âˆ’ pÌ‚â‚) / âˆš[pÌ„(1âˆ’pÌ„)(1/nâ‚ + 1/nâ‚‚)]

where pÌ„ = (xâ‚ + xâ‚‚) / (nâ‚ + nâ‚‚)  (pooled proportion)
```

**Effect size â€” Cohen's h:**
```
h = 2 arcsin(âˆšpâ‚‚) âˆ’ 2 arcsin(âˆšpâ‚)
```
The arcsine transformation stabilizes variance across different baseline rates.

---

## Welch's Two-Sample t-Test

**When:** Comparing means of a continuous metric between two groups (revenue, latency, session length).

**Why Welch's (not Student's):**
Welch's t-test does not assume equal variances â€” it is strictly more general and loses little power when variances are equal. Always prefer it.

**Formula:**
```
t = (xÌ„â‚‚ âˆ’ xÌ„â‚) / âˆš(sâ‚Â²/nâ‚ + sâ‚‚Â²/nâ‚‚)

Welchâ€“Satterthwaite df:
df = (sâ‚Â²/nâ‚ + sâ‚‚Â²/nâ‚‚)Â² / [(sâ‚Â²/nâ‚)Â²/(nâ‚âˆ’1) + (sâ‚‚Â²/nâ‚‚)Â²/(nâ‚‚âˆ’1)]
```

**Effect size â€” Cohen's d:**
```
d = (xÌ„â‚‚ âˆ’ xÌ„â‚) / s_pooled

s_pooled = âˆš[((nâ‚âˆ’1)sâ‚Â² + (nâ‚‚âˆ’1)sâ‚‚Â²) / (nâ‚+nâ‚‚âˆ’2)]
```

**Warning for heavy-tailed metrics (revenue, LTV):**
Mean tests are sensitive to outliers. If the distribution has heavy tails, consider:
1. Winsorizing at 99th percentile before testing
2. Log-transforming (if values are positive)
3. Using a non-parametric test (Mann-Whitney U) and flagging for human review

---

## Chi-Square Test

**When:** Comparing categorical distributions (e.g. which plan users selected, which error type occurred).

**Assumptions:**
- Expected count â‰¥ 5 per cell (otherwise, combine categories or use Fisher's exact)
- Independent observations

**Formula:**
```
Ï‡Â² = Î£ (Oáµ¢ âˆ’ Eáµ¢)Â² / Eáµ¢

df = k âˆ’ 1  (goodness-of-fit)
df = (râˆ’1)(câˆ’1)  (contingency table, r rows, c columns)
```

**Effect size â€” CramÃ©r's V:**
```
V = âˆš[Ï‡Â² / (n Ã— (min(r,c) âˆ’ 1))]
```

---

## Wilson Score Interval

The standard confidence interval formula for proportions (`pÌ‚ Â± zâˆš(pÌ‚(1âˆ’pÌ‚)/n)`) can produce impossible values (< 0 or > 1) for small n or extreme p. The Wilson score interval fixes this:

```
center = (pÌ‚ + zÂ²/2n) / (1 + zÂ²/n)
margin = z/(1+zÂ²/n) Ã— âˆš(pÌ‚(1âˆ’pÌ‚)/n + zÂ²/4nÂ²)
CI = [center âˆ’ margin, center + margin]
```

Always use Wilson (or Clopper-Pearson) for proportions. The normal approximation is a historical artifact.

---

## Sample Size & Power

**Power:** The probability of correctly detecting a real effect of size Î´.

```
n = (z_Î±/2 + z_Î²)Â² Ã— (Ïƒâ‚Â² + Ïƒâ‚‚Â²) / Î´Â²    [means]
n = (z_Î±/2 + z_Î²)Â² Ã— (pâ‚(1âˆ’pâ‚) + pâ‚‚(1âˆ’pâ‚‚)) / (pâ‚‚âˆ’pâ‚)Â²    [proportions]
```

**Key levers:**
- Increase n â†’ more power (or detect smaller effects)
- Increase MDE â†’ smaller n (but you might miss smaller real effects)
- Increase Î± â†’ smaller n (but more false positives)
- Increase power â†’ larger n

**The peeking problem:**
Checking results before the planned end date inflates your effective Î±. If you peek at 50%, 75%, and 100% of planned n, your true Î± is ~0.13 instead of 0.05 â€” a 2.6Ã— inflation of false positives.

**Solutions:**
- Pre-commit to a stopping rule and don't peek
- Use sequential testing (SPRT) if early stopping is required
- Use a Bonferroni-corrected Î± if you peek at scheduled intervals

---

## Multiple Comparisons

Testing k hypotheses at Î± = 0.05 gives P(at least one false positive) â‰ˆ 1 âˆ’ (1 âˆ’ 0.05)^k

| k tests | P(â‰¥1 false positive) |
|---|---|
| 1 | 5% |
| 3 | 14% |
| 5 | 23% |
| 10 | 40% |
| 20 | 64% |

**Corrections:**
- **Bonferroni:** Use Î±/k per test. Conservative but simple. Appropriate for independent tests.
- **Benjamini-Hochberg (FDR):** Controls false discovery rate, not family-wise error. Preferred when many tests are expected to be true positives.

---

## SUTVA (Stable Unit Treatment Value Assumption)

A critical assumption for valid A/B tests: the outcome of unit i depends only on its own treatment assignment, not on other units' assignments.

**Violations:**
- Social features (user A sees user B's activity â€” network spillover)
- Shared inventory (one variant depletes shared stock)
- Two-sided marketplaces (buyers and sellers interact)

**Solutions:**
- Cluster randomization (randomize at the group/geography level)
- Network A/B testing (graph-based splits)
- Holdout-based testing

---

## References

- Imbens, G. & Rubin, D. (2015). *Causal Inference for Statistics, Social, and Biomedical Sciences*. Cambridge.
- Kohavi, R., Tang, D., & Xu, Y. (2020). *Trustworthy Online Controlled Experiments*. Cambridge.
- Cohen, J. (1988). *Statistical Power Analysis for the Behavioral Sciences*. 2nd ed.
- Wilson, E.B. (1927). "Probable Inference, the Law of Succession, and Statistical Inference." *JASA* 22(158): 209â€“212.


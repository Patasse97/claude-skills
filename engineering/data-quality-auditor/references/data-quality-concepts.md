# Data Quality Concepts Reference

Deep-dive reference for the Data Quality Auditor skill. Keep SKILL.md lean â€” this is where the theory lives.

---

## Missingness Mechanisms (Rubin, 1976)

Understanding *why* data is missing determines how safely it can be imputed.

### MCAR â€” Missing Completely At Random
- The probability of missingness is independent of both observed and unobserved data.
- **Example:** A sensor drops a reading due to random hardware noise.
- **Safe to impute?** Yes. Imputing with mean/median introduces no systematic bias.
- **Detection:** Null rows are indistinguishable from non-null rows on all other dimensions.

### MAR â€” Missing At Random
- The probability of missingness depends on *observed* data, not the missing value itself.
- **Example:** Older users are less likely to fill in a "social media handle" field â€” missingness depends on age (observed), not on the handle itself.
- **Safe to impute?** Conditionally yes â€” impute using a model that accounts for the related observed variables.
- **Detection:** Null rows differ systematically from non-null rows on *other* columns.

### MNAR â€” Missing Not At Random
- The probability of missingness depends on the *missing value itself* (unobserved).
- **Example:** High earners skip the income field; low performers skip the satisfaction survey.
- **Safe to impute?** No â€” imputation will introduce systematic bias. Escalate to domain owner.
- **Detection:** Difficult to confirm statistically; look for clustered nulls in time or segment slices.

---

## Data Quality Score (DQS) Methodology

The DQS is a weighted composite of five ISO 8000 / DAMA-aligned dimensions:

| Dimension | Weight | Rationale |
|---|---|---|
| Completeness | 30% | Nulls are the most common and impactful quality failure |
| Consistency | 25% | Type/format violations corrupt joins and aggregations silently |
| Validity | 20% | Out-of-domain values (negative ages, future birth dates) create invisible errors |
| Uniqueness | 15% | Duplicate rows inflate metrics and invalidate joins |
| Timeliness | 10% | Stale data causes decisions based on outdated state |

**Scoring thresholds** align to production-readiness standards:
- 85â€“100: Ready for production use in models and dashboards
- 65â€“84: Usable for exploratory analysis with documented caveats
- 0â€“64: Unreliable; remediation required before use in any decision-making context

---

## Outlier Detection Methods

### IQR (Interquartile Range)
- **Formula:** Outlier if `x < Q1 âˆ’ 1.5Ã—IQR` or `x > Q3 + 1.5Ã—IQR`
- **Strengths:** Non-parametric, robust to non-normal distributions, interpretable bounds
- **Weaknesses:** Can miss outliers in heavily skewed distributions; 1.5Ã— multiplier is conventional, not universal
- **When to use:** Default choice for most business datasets (revenue, counts, durations)

### Z-score
- **Formula:** Outlier if `|x âˆ’ Î¼| / Ïƒ > threshold` (commonly 3.0)
- **Strengths:** Simple, widely understood, easy to explain to stakeholders
- **Weaknesses:** Mean and std are themselves influenced by outliers â€” the method is self-defeating for extreme contamination
- **When to use:** Only when the distribution is approximately normal and contamination is < 5%

### Modified Z-score (Iglewicz-Hoaglin)
- **Formula:** `M_i = 0.6745 Ã— |x_i âˆ’ median| / MAD`; outlier if `M_i > 3.5`
- **Strengths:** Uses median and MAD â€” both resistant to outlier influence; handles skewed distributions
- **Weaknesses:** MAD = 0 for discrete columns with one dominant value; less intuitive
- **When to use:** Preferred for skewed distributions (e.g. revenue, latency, page views)

---

## Imputation Strategies

| Method | When | Risk |
|---|---|---|
| Mean | MCAR, continuous, symmetric distribution | Distorts variance; don't use with skewed data |
| Median | MCAR/MAR, continuous, skewed distribution | Safe for skewed; loses variance |
| Mode | MCAR/MAR, categorical | Can over-represent one category |
| Forward-fill | Time series with MCAR/MAR gaps | Assumes value persists â€” valid for slowly-changing fields |
| Binary indicator | Null % 1â€“30% | Preserves information about missingness without imputing |
| Model-based | MAR, high-value columns | Most accurate but computationally expensive |
| Drop column | > 50% missing with no business justification | Safest option if column has no predictive value |

**Golden rule:** Always add a `col_was_null` indicator column when imputing with null% > 1%. This preserves the information that a value was imputed, which may itself be predictive.

---

## Common Silent Data Quality Failures

These are the issues that don't raise errors but corrupt results:

1. **Sentinel values** â€” `0`, `-1`, `9999`, `""` used to mean "unknown" in legacy systems
2. **Timezone naive timestamps** â€” datetimes stored without timezone; comparisons silently shift by hours
3. **Trailing whitespace** â€” `"active "` â‰  `"active"` causes silent join mismatches
4. **Encoding errors** â€” UTF-8 vs Latin-1 mismatches produce garbled strings in one column
5. **Scientific notation** â€” `1e6` stored as string gets treated as a category not a number
6. **Implicit schema changes** â€” upstream adds a new category to a lookup field; existing code silently drops new rows

---

## References

- Rubin, D.B. (1976). "Inference and Missing Data." *Biometrika* 63(3): 581â€“592.
- Iglewicz, B. & Hoaglin, D. (1993). *How to Detect and Handle Outliers*. ASQC Quality Press.
- DAMA International (2017). *DAMA-DMBOK: Data Management Body of Knowledge*. 2nd ed.
- ISO 8000-8: Data quality â€” Concepts and measuring.


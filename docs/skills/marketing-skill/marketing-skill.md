---
title: "Marketing Skills Division â€” Agent Skill for Marketing"
description: "42 marketing agent skills and plugins for Claude Code, Codex, Gemini CLI, Cursor, OpenClaw, and 6 more coding agents. 7 pods: content, SEO, CRO."
---

# Marketing Skills Division

<div class="page-meta" markdown>
<span class="meta-badge">:material-bullhorn-outline: Marketing</span>
<span class="meta-badge">:material-identifier: `marketing-skill`</span>
<span class="meta-badge">:material-github: <a href="https://github.com/Patasse97/claude-skills/tree/main/marketing-skill/SKILL.md">Source</a></span>
</div>

<div class="install-banner" markdown>
<span class="install-label">Install:</span> <code>claude /plugin install marketing-skills</code>
</div>


42 production-ready marketing skills organized into 7 specialist pods with a context foundation and orchestration layer.

## Quick Start

### Claude Code
```
/read marketing-skill/marketing-ops/SKILL.md
```
The router will direct you to the right specialist skill.

### Codex CLI
```bash
codex --full-auto "Read marketing-skill/marketing-ops/SKILL.md, then help me write a blog post about [topic]"
```

### OpenClaw
Skills are auto-discovered from the repository. Ask your agent for marketing help â€” it routes via `marketing-ops`.

## Architecture

```
marketing-skill/
â”œâ”€â”€ marketing-context/     â† Foundation: brand voice, audience, goals
â”œâ”€â”€ marketing-ops/         â† Router: dispatches to the right skill
â”‚
â”œâ”€â”€ Content Pod (8)        â† Strategy â†’ Production â†’ Editing â†’ Social
â”œâ”€â”€ SEO Pod (5)            â† Traditional + AI SEO + Schema + Architecture
â”œâ”€â”€ CRO Pod (6)            â† Pages, Forms, Signup, Onboarding, Popups, Paywall
â”œâ”€â”€ Channels Pod (5)       â† Email, Ads, Cold Email, Ad Creative, Social Mgmt
â”œâ”€â”€ Growth Pod (4)         â† A/B Testing, Referrals, Free Tools, Churn
â”œâ”€â”€ Intelligence Pod (4)   â† Competitors, Psychology, Analytics, Campaigns
â””â”€â”€ Sales & GTM Pod (2)    â† Pricing, Launch Strategy
```

## First-Time Setup

Run `marketing-context` to create your `marketing-context.md` file. Every other skill reads this for brand voice, audience personas, and competitive landscape. Do this once â€” it makes everything better.

## Pod Overview

| Pod | Skills | Python Tools | Key Capabilities |
|-----|--------|-------------|-----------------|
| **Foundation** | 2 | 2 | Brand context capture, skill routing |
| **Content** | 8 | 5 | Strategy â†’ production â†’ editing â†’ humanization |
| **SEO** | 5 | 2 | Technical SEO, AI SEO (AEO/GEO), schema, architecture |
| **CRO** | 6 | 0 | Page, form, signup, onboarding, popup, paywall optimization |
| **Channels** | 5 | 2 | Email sequences, paid ads, cold email, ad creative |
| **Growth** | 4 | 2 | A/B testing, referral programs, free tools, churn prevention |
| **Intelligence** | 4 | 4 | Competitor analysis, marketing psychology, analytics, campaigns |
| **Sales & GTM** | 2 | 1 | Pricing strategy, launch planning |
| **Standalone** | 4 | 9 | ASO, brand guidelines, PMM strategy, prompt engineering |

## Python Tools (27 scripts)

All scripts are stdlib-only (zero pip installs), CLI-first with JSON output, and include embedded sample data for demo mode.

```bash
# Content scoring
python3 marketing-skill/content-production/scripts/content_scorer.py article.md

# AI writing detection
python3 marketing-skill/content-humanizer/scripts/humanizer_scorer.py draft.md

# Brand voice analysis
python3 marketing-skill/content-production/scripts/brand_voice_analyzer.py copy.txt

# Ad copy validation
python3 marketing-skill/ad-creative/scripts/ad_copy_validator.py ads.json

# Pricing scenario modeling
python3 marketing-skill/pricing-strategy/scripts/pricing_modeler.py

# Tracking plan generation
python3 marketing-skill/analytics-tracking/scripts/tracking_plan_generator.py
```

## Unique Features

- **AI SEO (AEO/GEO/LLMO)** â€” Optimize for AI citation, not just ranking
- **Content Humanizer** â€” Detect and fix AI writing patterns with scoring
- **Context Foundation** â€” One brand context file feeds all 42 skills
- **Orchestration Router** â€” Smart routing by keyword + complexity scoring
- **Zero Dependencies** â€” All Python tools use stdlib only


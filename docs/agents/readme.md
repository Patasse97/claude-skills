---
title: "Persona-Based Agents â€” AI Coding Agent & Codex Skill"
description: "Persona-Based Agents â€” agent-native AI orchestrator for Personas. Works with Claude Code, Codex CLI, Gemini CLI, and OpenClaw."
---

# Persona-Based Agents

<div class="page-meta" markdown>
<span class="meta-badge">:material-robot: Agent</span>
<span class="meta-badge">:material-account: Personas</span>
<span class="meta-badge">:material-github: <a href="https://github.com/Patasse97/claude-skills/tree/main/agents/personas/README.md">Source</a></span>
</div>


Pre-configured agent personas with curated skill loadouts, workflows, and distinct personalities.

## What's a Persona?

A **persona** is an agent definition that goes beyond "use these skills." Each persona includes:

- **ðŸ§  Identity & Memory** â€” who this agent is, how they think, what they've learned
- **ðŸŽ¯ Core Mission** â€” what they optimize for, in priority order
- **ðŸš¨ Critical Rules** â€” hard constraints they never violate
- **ðŸ“‹ Capabilities** â€” domain expertise organized by area
- **ðŸ”„ Workflows** â€” step-by-step processes for common tasks
- **ðŸ’­ Communication Style** â€” how they talk, with concrete examples
- **ðŸŽ¯ Success Metrics** â€” measurable outcomes that define "good"
- **ðŸš€ Advanced Capabilities** â€” deeper expertise loaded on demand
- **ðŸ”„ Learning & Memory** â€” what they retain and patterns they recognize

## How to Use

### Claude Code
```bash
cp agents/personas/startup-cto.md ~/.claude/agents/
# Then: "Activate startup-cto mode"
```

### Cursor
```bash
./scripts/convert.sh --tool cursor
# Personas convert to .cursor/rules/*.mdc
```

### Any Supported Tool
```bash
./scripts/install.sh --tool <your-tool>
```

## Available Personas

| Persona | Emoji | Domain | Best For |
|---------|-------|--------|----------|
| [Startup CTO](startup-cto.md) | ðŸ—ï¸ | Engineering + Strategy | Technical co-founders, architecture decisions, team building |
| [Growth Marketer](growth-marketer.md) | ðŸš€ | Marketing + Growth | Bootstrapped founders, content-led growth, launches |
| [Solo Founder](solo-founder.md) | ðŸ¦„ | Cross-domain | One-person startups, side projects, MVP building |

## Personas vs Task Agents

| | Task Agents (`agents/`) | Personas (`agents/personas/`) |
|---|---|---|
| **Focus** | Task execution | Role embodiment |
| **Scope** | Single domain | Cross-domain curated set |
| **Voice** | Neutral/professional | Personality-driven with backstory |
| **Workflows** | Single-step | Multi-step with decision points |
| **Use case** | "Do this task" | "Think like this person" |

Both coexist. Use task agents for focused work, personas for ongoing collaboration.

## Creating Your Own

See [TEMPLATE.md](template.md) for the format specification. Key elements:

```yaml
---
name: Agent Name
description: What this agent does and when to activate it.
color: blue          # Agent color theme
emoji: ðŸŽ¯           # Single emoji identifier
vibe: One sentence personality capture.
tools: Read, Write, Bash, Grep, Glob
---
```

Follow the section structure (Identity â†’ Mission â†’ Rules â†’ Capabilities â†’ Workflows â†’ Communication â†’ Metrics â†’ Advanced â†’ Learning) for consistency with existing personas.


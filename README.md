# Claude Code Skills & Plugins â€” CompÃ©tences IA pour Chaque Outil de Codage

**123 compÃ©tences Claude Code production-ready, plugins et compÃ©tences agents pour 11 outils de codage IA.**

La bibliothÃ¨que open-source la plus complÃ¨te de compÃ©tences Claude Code et plugins d'agent â€” fonctionne Ã©galement avec OpenAI Codex, Gemini CLI, Cursor et 7 autres agents de codage. Paquets d'expertise rÃ©utilisables couvrant l'ingÃ©nierie, produit, gestion de projet, conformitÃ© et croissance.

**Fonctionne avec :** Claude Code Â· OpenAI Codex Â· Gemini CLI Â· OpenClaw Â· Cursor Â· Aider Â· Windsurf Â· Kilo Code Â· OpenCode Â· Augment Â· Antigravity

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow?style=for-the-badge)](https://opensource.org/licenses/MIT)
[![Skills](https://img.shields.io/badge/Skills-123-brightgreen?style=for-the-badge)](#skills-overview)
[![Agents](https://img.shields.io/badge/Agents-25-blue?style=for-the-badge)](#agents)
[![Personas](https://img.shields.io/badge/Personas-3-purple?style=for-the-badge)](#personas)
[![Commands](https://img.shields.io/badge/Commands-22-orange?style=for-the-badge)](#commands)
[![Stars](https://img.shields.io/github/stars/Patasse97/claude-skills?style=for-the-badge)](https://github.com/Patasse97/claude-skills/stargazers)
[![SkillCheck Validated](https://img.shields.io/badge/SkillCheck-Validated-4c1?style=for-the-badge)](https://getskillcheck.com)

> **5,200+ stars GitHub** â€” la bibliothÃ¨que open-source la plus complÃ¨te de compÃ©tences Claude Code et plugins d'agent.

---

## Qu'est-ce que les CompÃ©tences Claude Code et les Plugins d'Agent ?

Les compÃ©tences Claude Code (aussi appelÃ©es compÃ©tences d'agent ou plugins d'agents de codage) sont des paquets d'instructions modulaires qui donnent aux agents de codage IA une expertise mÃ©tier qu'ils n'ont pas par dÃ©faut. Chaque compÃ©tence inclut :

- **SKILL.md** â€” instructions structurÃ©es, workflows et frameworks de dÃ©cision
- **Outils Python** â€” 123 scripts CLI (stdlib-uniquement, zÃ©ro pip installs)
- **Docs de rÃ©fÃ©rence** â€” templates, checklists et connaissances mÃ©tier spÃ©cifiques

**Un repo, onze plates-formes.** Fonctionne nativement comme plugins Claude Code, compÃ©tences d'agent Codex, compÃ©tences Gemini CLI, et se convertit en 8 autres outils via `scripts/convert.sh`. Tous les 123 outils Python fonctionnent partout oÃ¹ Python tourne.

### CompÃ©tences vs Agents vs Personas

| | CompÃ©tences | Agents | Personas |
|---|---|---|---|
| **Objectif** | Comment exÃ©cuter une tÃ¢che | Quelle tÃ¢che faire | Qui pense |
| **PortÃ©e** | Domaine unique | Domaine unique | Cross-domain |
| **Voix** | Neutre | Professionnelle | PilotÃ© par personnalitÃ© |
| **Exemple** | "Suivez ces Ã©tapes pour SEO" | "ExÃ©cutez un audit de sÃ©curitÃ©" | "Pensez comme un CTO startup" |

Les trois fonctionnent ensemble. Voir [Orchestration](#orchestration) pour savoir comment les combiner.

---

## Installation Rapide

### Gemini CLI (Nouveau)

```bash
# Cloner le repository
git clone https://github.com/Patasse97/claude-skills.git
cd claude-skills

# Lancer le script de configuration
./scripts/gemini-install.sh

# Commencer Ã  utiliser les compÃ©tences
> activate_skill(name="senior-architect")
```

### Claude Code (RecommandÃ©)

```bash
# Ajouter le marketplace
/plugin marketplace add Patasse97/claude-skills

# Installer par domaine
/plugin install engineering-skills@claude-code-skills          # 37 core engineering
/plugin install engineering-advanced-skills@claude-code-skills  # 43 POWERFUL-tier
/plugin install product-skills@claude-code-skills               # 15 product skills
/plugin install ra-qm-skills@claude-code-skills                 # 14 regulatory/quality
/plugin install pm-skills@claude-code-skills                    # 9 project management
/plugin install business-growth-skills@claude-code-skills       # 5 business & growth
/plugin install finance-skills@claude-code-skills               # 4 finance (analyst + SaaS metrics)

# Ou installer des compÃ©tences individuelles
/plugin install skill-security-auditor@claude-code-skills       # Security scanner
/plugin install playwright-pro@claude-code-skills                  # Playwright testing toolkit
/plugin install self-improving-agent@claude-code-skills         # Auto-memory curation
```

### OpenAI Codex

```bash
npx agent-skills-cli add Patasse97/claude-skills --agent codex
# Ou: git clone + ./scripts/codex-install.sh
```

### OpenClaw

```bash
bash <(curl -s https://raw.githubusercontent.com/Patasse97/claude-skills/main/scripts/openclaw-install.sh)
```

### Installation Manuelle

```bash
git clone https://github.com/Patasse97/claude-skills.git
# Copier n'importe quel dossier de compÃ©tence vers ~/.claude/skills/ (Claude Code) ou ~/.codex/skills/ (Codex)
```

---

## Support Multi-Outils (Nouveau)

**Convertir les 155 compÃ©tences vers 7 outils de codage IA** avec un seul script :

| Outil | Format | Installation |
|------|--------|---------|
| **Cursor** | `.mdc` rules | `./scripts/install.sh --tool cursor --target .` |
| **Aider** | `CONVENTIONS.md` | `./scripts/install.sh --tool aider --target .` |
| **Kilo Code** | `.kilocode/rules/` | `./scripts/install.sh --tool kilocode --target .` |
| **Windsurf** | `.windsurf/skills/` | `./scripts/install.sh --tool windsurf --target .` |
| **OpenCode** | `.opencode/skills/` | `./scripts/install.sh --tool opencode --target .` |
| **Augment** | `.augment/rules/` | `./scripts/install.sh --tool augment --target .` |
| **Antigravity** | `~/.gemini/antigravity/skills/` | `./scripts/install.sh --tool antigravity` |

**Fonctionnement :**

```bash
# 1. Convertir toutes les compÃ©tences vers tous les outils (~15 secondes)
./scripts/convert.sh --tool all

# 2. Installer dans votre projet (avec confirmation)
./scripts/install.sh --tool cursor --target /path/to/project

# Ou utiliser --force pour sauter la confirmation:
./scripts/install.sh --tool aider --target . --force

# 3. VÃ©rifier
find .cursor/rules -name "*.mdc" | wc -l  # Devrait afficher 155
```

**Chaque outil obtient :**
- âœ… Les 155 compÃ©tences converties au format natif
- âœ… README par outil avec Ã©tapes d'installation/vÃ©rification/mise Ã  jour
- âœ… Support des scripts, rÃ©fÃ©rences, templates oÃ¹ applicable
- âœ… ZÃ©ro travail de conversion manuel

ExÃ©cutez `./scripts/convert.sh --tool all` pour gÃ©nÃ©rer localement les sorties spÃ©cifiques aux outils.

---

## Apercu des Competences

**123 competences dans 6 domaines:**

| Domaine | Competences | Points Forts | Details |
|---------|------------|------------|---------|
| **ðŸ”§ Ingenierie â€” Core** | 37 | Architecture, frontend, backend, fullstack, QA, DevOps, SecOps, AI/ML, data, Playwright, Self-Improving Agent, securite (6), a11y audit | [engineering-team/](engineering-team/) |
| **ðŸŽ­ Playwright Pro** | 9+3 | Generation de tests, correction flaky, migration Cypress/Selenium, TestRail, BrowserStack, 55 templates | [engineering-team/playwright-pro](engineering-team/playwright-pro/) |
| **ðŸ§  Self-Improving Agent** | 5+2 | Curation auto de memoire, promotion de patterns, extraction de competences, sante memoire | [engineering-team/self-improving-agent](engineering-team/self-improving-agent/) |
| **âš¡ Ingenierie â€” POWERFUL** | 43 | Agent designer, RAG architect, database designer, CI/CD builder, security auditor, MCP builder, AgentHub, Helm charts, Terraform, self-eval | [engineering/](engineering/) |
| **ðŸŽ¯ Produit** | 15 | Product manager, agile PO, strategist, UX researcher, UI design, landing pages, SaaS scaffolder, analytics, experiment designer, discovery, roadmap communicator, code-to-prd | [product-team/](product-team/) |
| **ðŸ“‹ Gestion de Projet** | 9 | Senior PM, scrum master, Jira, Confluence, Atlassian admin, templates | [project-management/](project-management/) |
| **ðŸ¥ Conformite & QM** | 14 | ISO 13485, MDR 2017/745, FDA, ISO 27001, GDPR, CAPA, risk management | [ra-qm-team/](ra-qm-team/) |
| **ðŸ“ˆ Business & Croissance** | 5 | Customer success, sales engineer, revenue ops, contrats & propositions | [business-growth/](business-growth/) |

---

## Personas

IdentitÃ©s d'agents prÃ©-configurÃ©es avec charge de compÃ©tences curÃ©e, workflows et styles de communication distincts. Les personas vont au-delÃ  de "utilisez ces compÃ©tences" â€” ils dÃ©finissent comment un agent pense, priorise et communique.

| Persona | Domaine | Meilleur Pour |
|---------|--------|----------|
| [**Startup CTO**](agents/personas/startup-cto.md) | IngÃ©nierie + StratÃ©gie | DÃ©cisions d'architecture, sÃ©lection tech stack, team building, due diligence technique |
| [**Solo Founder**](agents/personas/solo-founder.md) | Cross-domain | Startups solo, side projects, MVP building, tous les chapeaux |

**Utilisation :**
```bash
# Claude Code
cp agents/personas/startup-cto.md ~/.claude/agents/

# N'importe quel outil
./scripts/convert.sh --tool cursor  # Convertit aussi les personas
```

Voir [agents/personas/](agents/personas/) pour les dÃ©tails. CrÃ©ez le vÃ´tre avec [TEMPLATE.md](agents/personas/TEMPLATE.md).

---

## Orchestration

Un protocole lÃ©ger pour coordonner personas, compÃ©tences et agents sur des travaux inter-domaines. Aucun framework requis.

**Quatre patterns :**

| Pattern | Quoi | Quand |
|---------|------|------|
| **Solo Sprint** | Changer de personas au fil des phases du projet | Side projects, MVPs, solo founders |
| **Domain Deep-Dive** | Une persona + plusieurs compÃ©tences empilÃ©es | Architecture reviews, compliance audits |
| **Multi-Agent Handoff** | Les personas examinent les outputs les uns des autres | High-stakes decisions, launch readiness |
| **Skill Chain** | CompÃ©tences sÃ©quentielles, pas de persona requise | Content pipelines, repeatable checklists |

**Exemple : Lancement produit 6 semaines**
```
Semaine 1-2: startup-cto + aws-solution-architect + senior-frontend â†’ Build
Semaine 5-6: solo-founder + email-sequence + analytics-tracking â†’ Ship and iterate
```

Voir [orchestration/ORCHESTRATION.md](orchestration/ORCHESTRATION.md) pour le protocole complet et les exemples.

---

## Tier POWERFUL

25 comp\u00e9tences avanc\u00e9es avec des capacit\u00e9s production-grade profondes :

| Comp\u00e9tence | Ce qu'elle fait |
|-------|-------------|
| **agent-designer** | Orchestration multi-agent, sch\u00e9mas d'outils, \u00e9valuation de performances |
| **agent-workflow-designer** | Patterns s\u00e9quentiels, parall\u00e9les, routeur, orchestrateur, et \u00e9valuateur |
| **rag-architect** | Constructeur de pipeline RAG, optimiseur de chunking, \u00e9valuateur de r\u00e9cup\u00e9ration |
| **database-designer** | Analyseur de sch\u00e9ma, g\u00e9n\u00e9ration ERD, optimiseur d'index, g\u00e9n\u00e9rateur de migration |
| **database-schema-designer** | Exigences â†’ migrations, types, seed data, politiques RLS |
| **migration-architect** | Planificateur de migration, v\u00e9rificateur de compatibilit\u00e9, g\u00e9n\u00e9rateur de rollback |
| **skill-security-auditor** | ðŸ”’ Portail de s\u00e9curit\u00e9 \u2014 scanner de comp\u00e9tences pour code malveillant avant installation |
| **ci-cd-pipeline-builder** | Analyser stack â†’ g\u00e9n\u00e9rer configs GitHub Actions / GitLab CI |
| **mcp-server-builder** | Construire des serveurs MCP \u00e0 partir de specs OpenAPI |
| **pr-review-expert** | Analyse de rayon d'explosion, balayage de s\u00e9curit\u00e9, delta de couverture |
| **api-design-reviewer** | Linter API REST, d\u00e9tecteur de changements disruptifs, scorecard de design |
| **api-test-suite-builder** | Scanner de routes API â†’ g\u00e9n\u00e9rer des suites de tests compl\u00e8tes |
| **dependency-auditor** | Scanner multi-langage, conformit\u00e9 des licences, planificateur de mise \u00e0 jour |
| **release-manager** | G\u00e9n\u00e9rateur de changelog, bumper de version s\u00e9mantique, v\u00e9rificateur de pr\u00eat\u00e9 |
| **observability-designer** | Concepteur SLO, optimiseur d'alertes, g\u00e9n\u00e9rateur de dashboards |
| **performance-profiler** | Profilage Node/Python/Go, analyse de bundle, load testing |
| **monorepo-navigator** | Gestion d'espaces de travail Turborepo/Nx/pnpm et analyse d'impact |
| **changelog-generator** | Commits conventionnels â†’ changelogs structur\u00e9s |
| **codebase-onboarding** | G\u00e9n\u00e9rer automatiquement des docs d'onboarding \u00e0 partir de l'analyse du codebase |
| **runbook-generator** | Codebase â†’ runbooks op\u00e9rationnels avec commandes |
| **git-worktree-manager** | D\u00e9veloppement parall\u00e8le avec isolement de ports, synchronisation env |
| **env-secrets-manager** | Gestion .env, d\u00e9tection de fuite, workflows de rotation |
| **incident-commander** | Playbook de r\u00e9ponse aux incidents, classificateur de s\u00e9v\u00e9rit\u00e9, g\u00e9n\u00e9rateur PIR |
| **tech-debt-tracker** | Scanner de dette de code, classificateur de priorit\u00e9s, dashboard de tendances |
| **interview-system-designer** | Concepteur de boucle d'interview, banque de questions, calibrateur |

---

## ðŸ”’ Auditeur de SÃ©curitÃ© de CompÃ©tence

NouveautÃ© en v2.0.0 â€” auditez n'importe quelle compÃ©tence pour les risques de sÃ©curitÃ© avant installation :

```bash
python3 engineering/skill-security-auditor/scripts/skill_security_auditor.py /path/to/skill/
```

Scanne :Â injection de commande, exÃ©cution de code, exfiltration de donnÃ©es, injection de prompt, risques de chaÃ®ne d'approvisionnement de dÃ©pendances, escalade de privilÃ©ges. Retourne **PASS / WARN / FAIL** avec guidance de rÃ©mÃ©diation.

**ZÃ©ro dÃ©pendances.** Fonctionne partout oÃ¹ Python tourne.

---

## CompÃ©tences RÃ©cemment AmÃ©liorÃ©es

Mises Ã  niveau de qualitÃ© production pour :

- `engineering/git-worktree-manager` â€” cycle de vie worktree + scripts d'automatisation de nettoyage
- `engineering/mcp-server-builder` â€” OpenAPI -> scaffold MCP + validateur de manifest
- `engineering/changelog-generator` â€” gÃ©nÃ©rateur de notes de version + linter de commits conventionnels
- `engineering/ci-cd-pipeline-builder` â€” dÃ©tecteur de stack + gÃ©nÃ©rateur de pipeline

Chacun livre maintenant avec `scripts/`, `references/` extrait, et `README.md` axÃ© sur l'utilisation.

---

## Exemples d'Utilisation

### Review d'Architecture
```
Utilisant la compÃ©tence senior-architect, examinez notre architecture microservices
et identifiez les 3 meilleurs risques d'extensibilitÃ©.
```

### Audit de ConformitÃ©
```
Utilisant la compÃ©tence mdr-745-specialist, examinez notre documentation technique
pour les lacunes de conformitÃ© MDR Annex II.
```

---

## Outils d'Analyse Python

123 outils CLI livrent avec les competences (tous verifies, stdlib-uniquement) :

```bash
# VÃ©rification d'architecture
python3 engineering/senior-architect/scripts/architecture_analyzer.py /path/to/codebase

# Audit de sÃ©curitÃ©
python3 engineering/skill-security-auditor/scripts/skill_security_auditor.py /path/to/skill/

# Priorisation RICE
python3 product-team/product-manager-toolkit/scripts/rice_prioritizer.py features.csv

# Page de renvoi (TSX + Tailwind)
python3 product-team/landing-page-generator/scripts/landing_page_scaffolder.py config.json --format tsx
```

---

## Projets Connexes

| Projet | Description |
|---------|-------------|
| [**Claude Code Skills & Agents Factory**](https://github.com/alirezarezvani/claude-code-skills-agents-factory) | M\u00e9thodologie pour construire des comp\u00e9tences \u00e0 l'\u00e9chelle |
| [**Claude Code Tresor**](https://github.com/alirezarezvani/claude-code-tresor) | Toolkit de productivit\u00e9 avec 60+ templates de prompt |
| [**Product Manager Skills**](https://github.com/Digidai/product-manager-skills) | Agent Senior PM avec 6 domaines de connaissance, 12 templates, 30+ frameworks |

---

## FAQ

**Comment installer les plugins Claude Code ?**
Ajoutez le marketplace avec `/plugin marketplace add Patasse97/claude-skills`, puis installez n'importe quel bundle de comp\u00e9tence avec `/plugin install <name>@claude-code-skills`.

**Ces comp\u00e9tences fonctionnent-elles avec OpenAI Codex / Cursor / Windsurf / Aider ?**
Oui. Les comp\u00e9tences fonctionnent nativement avec 11 outils : Claude Code, OpenAI Codex, Gemini CLI, OpenClaw, Cursor, Aider, Windsurf, Kilo Code, OpenCode, Augment et Antigravity. Ex\u00e9cutez `./scripts/convert.sh --tool all` pour convertir pour tous les outils, puis installez avec `./scripts/install.sh --tool <name>`. Voir [Multi-Tool Integrations](https://alirezarezvani.github.io/claude-skills/integrations/) pour d\u00e9tails.

**La mise \u00e0 jour cassera-t-elle mon installation ?**
Non. Nous suivons le versioning s\u00e9mantique et maintenons la r\u00e9tro compatibilit\u00e9 au sein des versions de patch. Les arguments de script existants, les chemins d'acc\u00e8s source de plugin et les structures SKILL.md ne sont jamais modifi\u00e9s dans les versions de patch. Voir le [CHANGELOG](CHANGELOG.md) pour les d\u00e9tails de chaque version.

**Les outils Python sont-ils sans d\u00e9pendances ?**
Oui. Les 155 outils CLI Python utilisent uniquement la biblioth\u00e8que standard \u2014 z\u00e9ro pip installs requis. Chaque script est v\u00e9rifi\u00e9 pour s'ex\u00e9cuter avec `--help`.

**Comment cr\u00e9er ma propre comp\u00e9tence Claude Code ?**
Chaque comp\u00e9tence est un dossier avec un `SKILL.md` (frontmatter + instructions), optionnel `scripts/`, `references/`, et `assets/`. Voir la [Skills & Agents Factory](https://github.com/alirezarezvani/claude-code-skills-agents-factory) pour un guide pas \u00e0 pas.

---

## Contribuer

Nous accueillons les contributions ! Voir [CONTRIBUTING.md](CONTRIBUTING.md) pour les lignes directrices.

**Id\u00e9es rapides :**
- Ajouter de nouvelles comp\u00e9tences dans les domaines sous-desservis
- Am\u00e9liorer les outils Python existants
- Ajouter la couverture de test pour les scripts
- Traduire les comp\u00e9tences pour les march\u00e9s non-anglais

---

## Licence

MIT \u2014 voir [LICENSE](LICENSE) pour d\u00e9tails.

---

## Historique des Stars

[![Star History Chart](https://api.star-history.com/svg?repos=Patasse97/claude-skills&type=Date)](https://star-history.com/#Patasse97/claude-skills&Date)

---

**Construit par [Patassé KATABOSSE](https://github.com/Patasse97)** \u00b7 [Medium](https://alirezarezvani.medium.com) \u00b7 [Twitter](https://twitter.com/nginitycloud)


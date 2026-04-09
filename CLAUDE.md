# CLAUDE.md

Ce fichier fournis des guidance Ã  Claude Code (claude.ai/code) lors du travail avec le code dans ce dossier.

## Objectif du Projet

Ceci est une **bibliothÃ¨que de compÃ©tences complÃ©hensives** pour Claude AI et Claude Code - des paquets de compÃ©tences production-ready rÃ©utilisables qui regroupent expertise mÃ©tier, meilleures pratiques, outils d'analyse et frameworks stratÃ©giques. Le repository fournit des compÃ©tences modulaires que les Ã©quipes peuvent tÃ©lÃ©charger et utiliser directement dans leurs workflows.

**PortÃ©e Actuelle :** 123 compÃ©tences production-ready dans 6 domaines avec 123 outils Python d'automatisation, ~400 guides de rÃ©fÃ©rence, 25 agents et 22 slash commands.

**Distinction ClÃ© :** Ce n'est PAS une application traditionnelle. C'est une bibliothÃ¨que de paquets de compÃ©tence destinÃ©s Ã  Ãªtre extraits et dÃ©ployÃ©s par les utilisateurs dans leurs propres workflows Claude.

## Carte de Navigation

Ce repository utilise **une documentation modulaire**. Pour les guidance specifiques au domaine, voir :

| Domaine | Emplacemment CLAUDE.md | Focus |
|--------|-------------------|-------|
| **IngÃ©nierie (Core)** | [engineering-team/CLAUDE.md](engineering-team/CLAUDE.md) | Fullstack, AI/ML, DevOps, sÃ©curitÃ©, data, outils QA |
| **IngÃ©nierie (POWERFUL)** | [engineering/](engineering/) | Design d'agents, RAG, MCP, CI/CD, database, observabilitÃ© |
| **Ã‰quipe Produit** | [product-team/CLAUDE.md](product-team/CLAUDE.md) | RICE, OKRs, user stories, UX research, scaffolding SaaS |
| **Gestion de Projet** | [project-management/CLAUDE.md](project-management/CLAUDE.md) | MCP Atlassian, intÃ©gration Jira/Confluence |
| **ConformitÃ© RA/QM** | [ra-qm-team/CLAUDE.md](ra-qm-team/CLAUDE.md) | ISO 13485, MDR, FDA, GDPR, conformitÃ© ISO 27001 |
| **Business & Croissance** | [business-growth/CLAUDE.md](business-growth/CLAUDE.md) | Customer success, sales engineering, opÃ©rations revenue |
| **BibliothÃ¨que Standards** | [standards/CLAUDE.md](standards/CLAUDE.md) | Standards communication, qualitÃ©, git, sÃ©curitÃ© |
| **Templates** | [templates/CLAUDE.md](templates/CLAUDE.md) | Utilisation du systÃ¨me de templates |

## AperÃ§u de l'Architecture

### Structure du Repository

```
claude-code-skills/
â”œâ”€â”€ .claude-plugin/            # Registre des plugins (marketplace.json)
â”œâ”€â”€ agents/                    # 25 agents dans tous les domaines
â”œâ”€â”€ commands/                  # 22 slash commands (changelog, tdd, saas-health, prd, code-to-prd, plugin-audit, sprint-plan, etc.)
â”œâ”€â”€ engineering-team/          # 37 compÃ©tences core engineering + Playwright Pro + Self-Improving Agent + SÃ©curitÃ©
â”œâ”€â”€ engineering/               # 43 compÃ©tences POWERFUL-tier avancÃ©es (incl. AgentHub, self-eval)
â”œâ”€â”€ product-team/              # 15 compÃ©tences produit + outils Python
â”œâ”€â”€ project-management/        # 9 compÃ©tences PM + MCP Atlassian
â”œâ”€â”€ ra-qm-team/                # 14 compÃ©tences conformitÃ© RA/QM
â”œâ”€â”€ business-growth/           # 5 compÃ©tences business & croissance + outils Python
â”œâ”€â”€ eval-workspace/            # RÃ©sultats d'Ã©valuation des compÃ©tences (Tessl)
â”œâ”€â”€ standards/                 # 5 fichiers bibliothÃ¨que standards
â”œâ”€â”€ templates/                 # Templates rÃ©utilisables
â”œâ”€â”€ docs/                      # Site de documentation MkDocs Material
â”œâ”€â”€ scripts/                   # Scripts de construction (gÃ©nÃ©ration docs)
â””â”€â”€ documentation/             # Plans d'implÃ©mentation, sprints, livraison
```

### SchÃ©ma de Paquet de CompÃ©tence

Chaque compÃ©tence suit cette structure:
```
nom-competence/
â”œâ”€â”€ SKILL.md              # Documentation maÃ®tre
â”œâ”€â”€ scripts/              # Outils CLI Python (sans appels ML/LLM)
â”œâ”€â”€ references/           # Bases de connaissances expertes
â””â”€â”€ assets/               # Templates utilisateur
```

**Philosophie de Design**: Les compÃ©tences sont des paquets auto-contenus. Chacun inclut des outils exÃ©cutables (scripts Python), des bases de connaissance (rÃ©fÃ©rences markdown) et des templates orientÃ©s utilisateur. Les Ã©quipes peuvent extraire un dossier de compÃ©tence et l'utiliser immÃ©diatement.

**Pattern ClÃ©** : La connaissance circule de `references/` â†’ dans les workflows `SKILL.md` â†’ exÃ©cutÃ©e via `scripts/` â†’ appliquÃ©e avec les templates `assets/`.

## Workflow Git

**StratÃ©gie Branch :** feature â†’ dev â†’ main (PR uniquement)

**Protection Branch Active:** Branch main nÃ©cessite approbation PR. Pushes directs bloquÃ©s.

### DÃ©marrage Rapide

```bash
# 1. Toujours commencer depuis dev
git checkout dev
git pull origin dev

# 2. CrÃ©er une branche feature
git checkout -b feature/agents-{name}

# 3. Travailler et committer (commits conventionnels)
feat(agents): implement cs-{agent-name}
fix(tool): correct calculation logic
docs(workflow): update branch strategy

# 4. Pousser et crÃ©er PR vers dev
git push origin feature/agents-{name}
gh pr create --base dev --head feature/agents-{name}

# 5. AprÃ¨s approbation, PR fusionne dans dev
# 6. PÃ©riodiquement, dev fusionne dans main via PR
```

**RÃ¨gles de Protection Branch:**
- âœ… Main: NÃ©cessite approbation PR, pas de push direct
- âœ… Dev: Non protÃ©gÃ©e, mais PRs recommandÃ©es
- âœ… Tous: Commits conventionnels appliquÃ©s

Voir [documentation/WORKFLOW.md](documentation/WORKFLOW.md) pour le guide complet du workflow.
Voir [standards/git/git-workflow-standards.md](standards/git/git-workflow-standards.md) pour les standards de commit.

## Environnement de DÃ©veloppement

**Pas de systÃ¨me de build ou frameworks de test** - choix intentionnel de design pour la portabilitÃ©.

**Scripts Python:**
- Utiliser uniquement la bibliothÃ¨que standard (dÃ©pendances minimales)
- Design CLI-first pour l'automatisation facile
- Support both JSON et sortie lisible par humain
- Pas d'appels ML/LLM (maintient les compÃ©tences portables et rapides)

**Si vous ajoutez des dÃ©pendances:**
- Garder les scripts exÃ©cutables avec configuration minimale (`pip install package` au maximum)
- Documenter toutes les dÃ©pendances dans SKILL.md
- PrÃ©fÃ©rer les implÃ©mentations de bibliothÃ¨que standard

## Version Actuelle

**Version :** v2.2.0 (derniÃ¨re)

**Faits Saillants v2.2.0:**
- **Suite de compÃ©tences sÃ©curitÃ©** â€” 6 nouvelles compÃ©tences engineering-team : adversarial-reviewer, ai-security, cloud-security, incident-response, red-team, threat-detection (5 outils Python, 4 guides de rÃ©fÃ©rence)
- **CompÃ©tence Self-eval** â€” Ã‰valuation honnÃªte de la qualitÃ© du travail IA avec scoring bi-axe, dÃ©tection de gonflage de score et persistance de session
- **DÃ©veloppement Snowflake** â€” DÃ©veloppement d'entrepotsde donnÃ©es, optimisation SQL et patterns de pipelines de donnÃ©es
- 155 compÃ©tences totales dans 7 domaines, 155 outils Python, ~400 rÃ©fÃ©rences, 25 agents, 22 commandes
- Site docs MkDocs Ã©tendu Ã  269+ pages gÃ©nÃ©rÃ©es (~350 pages HTML)

**v2.1.2 (2026-03-10):**
- GÃ©nÃ©rateur de page de renvoi produit dÃ©sormais **Next.js TSX + Tailwind CSS** par dÃ©faut (4 styles de design, 7 gÃ©nÃ©rateurs de sections)
- **IntÃ©gration brand voice** â€” workflow de page de renvoi utilise analyseur de brand voice pour correspondre le ton de copie au style de design
- 25 scripts Python corrigÃ©s dans tous les domaines (syntaxe, dÃ©pendances, argparse)
- 237/237 scripts vÃ©rifiÃ©s passant `--help`

**v2.1.1 (2026-03-07):**
- 18 compÃ©tences optimÃ©es de 66-83% Ã  85-100% via review de qualitÃ© Tessl
- Frontmatter YAML (nom + description) ajoutÃ© Ã  tous les fichiers SKILL.md
- 6 nouveaux agents + 5 slash commands, support Gemini CLI, site docs MkDocs

**v2.0.0 (2026-02-16):**
- 25 compÃ©tences POWERFUL-tier engineering ajoutÃ©es (dossier engineering/)
- Infrastructure de marketplace des plugins (.claude-plugin/marketplace.json)
- Support multi-plate-forme : Claude Code, OpenAI Codex, OpenClaw

**Sprints PassÃ©s :** Voir [documentation/delivery/](documentation/delivery/) et [CHANGELOG.md](CHANGELOG.md) pour l'historique.

## Roadmap

**Phases 1-3 ComplÃ©tÃ©es:** 123 compÃ©tences production-ready dÃ©ployÃ©es dans 6 domaines
- Engineering Core (37), Engineering POWERFUL (43), Produit (15), PM (9), RA/QM (14), Business & Growth (5)
- 123 outils Python d'automatisation, ~400 guides de rÃ©fÃ©rence, 25 agents, 22 commandes
- Couverture d'entreprise complÃ¨te de l'ingÃ©nierie Ã  travers la conformitÃ© rÃ©glementaire, ventes, succÃ¨s client
- Site docs Material MkDocs avec 269+ pages indexÃ©es pour SEO

Voir les roadmaps spÃ©cifiques au domaine dans le fichier README.md de chaque dossier de compÃ©tence ou les fichiers roadmap.

## Principes ClÃ©s

1. **Les compÃ©tences sont des produits** - Chaque compÃ©tence dÃ©ployable en tant que paquet standalone
2. **PilotÃ© par la documentation** - Le succÃ©s dÃ©pend de docs claires et actionnables
3. **Algorithme plutÃ´t que IA** - Utiliser l'analyse dÃ©terministe (code) vs appels LLM
4. **Lourd en templates** - Fournir des templates prÃªts Ã  l'emploi que les utilisateurs personnalisent
5. **SpÃ©cifique Ã  la plate-forme** - Meilleures pratiques spÃ©cifiques > conseil gÃ©nÃ©rique

## Contraintes de Publication ClawHub

Ce repository publie des compÃ©tences vers **ClawHub** (clawhub.com) comme registre de distribution. Les rÃ¨gles suivantes sont **non-nÃ©gociables**:

1. **prÃ©fixe cs- pour les conflits de slug uniquement.** Lorsqu'un slug de compÃ©tence est dÃ©jÃ  pris sur ClawHub par un autre Ã©diteur, publiez avec le prÃ©fixe `cs-` (ex., `cs-copywriting`, `cs-seo-audit`). Le prÃ©fixe `cs-` s'applique **uniquement sur le registre ClawHub** â€” les noms de dossiers du repo, les noms de compÃ©tences locales et tous les autres outils (Claude Code, Codex, Gemini CLI) restent inchanges.
2. **Ne jamais renommer les dossiers du repo ou les noms de compÃ©tences locales** pour correspondre aux slugs ClawHub. Le repo est la source de vÃ©ritÃ©.
3. **Aucune dÃ©pendance de service payant/commercial.** Les compÃ©tences ne doivent pas nÃ©cessiter des clÃ©s API tiers payÃ©es ou des services commerciaux Ã  moins que fournis par le projet lui-mÃªme. Les APIs free-tier et les patterns BYOK (apportez votre propre clÃ©) sont acceptables.
4. **Limite de dÃ©bit : 5 nouvelles compÃ©tences par heure** sur ClawHub. Les publications par lots doivent respecter cela. Utilisez le timer de goutte (`clawhub-drip.timer`) pour les opÃ©rations en masse.
5. **schÃ©ma plugin.json** â€” UNIQUEMENT ces champs: `name`, `description`, `version`, `author`, `homepage`, `repository`, `license`, `skills: "./"`. Pas d'extra champs.
6. **La version suit le versioning du repo.** Les versions du paquet ClawHub doivent correspondre Ã  la version du repo (actuellement v2.2.0+).

## Anti-Patterns Ã  Ã‰viter

- CrÃ©er des dÃ©pendances entre les compÃ©tences (garder chacune auto-contenue)
- Ajouter des systÃ¨mes de build complexes ou frameworks de test (maintenir la simplicitÃ©)
- Conseil gÃ©nÃ©rique (se concentrer sur les frameworks spÃ©cifiques et actionnables)
- Appels LLM dans les scripts (dÃ©truit la portabilitÃ© et la vitesse)
- Sur-documenter la structure des fichiers (les compÃ©tences sont simples par design)

## Travailler avec Ce Repository

**CrÃ©ation de Nouvelles CompÃ©tences :** Suivez les roadmap et guide CLAUDE.md du domaine appropriÃ© (voir Carte de Navigation ci-dessus).

**Ã‰dition des CompÃ©tences Existantes :** Maintenez la cohÃ©rence entre les fichiers markdown. Utilisez la mÃªme voix, formatage et patterns de structure.

**Standard de QualitÃ© :** Chaque compÃ©tence devrait Ã©conomiser aux utilisateurs 40%+ temps tout en amÃ©liorant la cohÃ©rence/qualitÃ© de 30%+.

## Ressources SupplÃ©mentaires

- **.gitignore:** Exclut .vscode/, .DS_Store, AGENTS.md, PROMPTS.md, .env*
- **Registre des Plugins :** [.claude-plugin/marketplace.json](.claude-plugin/marketplace.json) - Distribution Marketplace
- **BibliothÃ¨que Standards :** [standards/](standards/) - Communication, qualitÃ©, git, documentation, sÃ©curitÃ©
- **Plans d'ImplÃ©mentation :** [documentation/implementation/](documentation/implementation/)
- **Livraison Sprint :** [documentation/delivery/](documentation/delivery/)

---

**Mise Ã  jour Last :** 9 avril 2026
**Version :** v2.2.0
**Statut :** 123 compÃ©tences dÃ©ployÃ©es dans 6 domaines, 16 plugins marketplace, site docs en direct


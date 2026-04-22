---
layout: post
title:  "Create Your Character"
date:   2026-04-22 10:07:17 -0500
categories: tools, babb, heybabb
---

# Company-Character: Give Your Organization a Terminal Voice

In a world full of slick web dashboards and AI chatbots, sometimes the most powerful interface is still the one staring back at you in the terminal.

**Company-Character** is a system that gives your organization its own voice — right in the command line.

Point it at your GitHub organization, and it builds a branded CLI companion that truly *knows* your tools, your current status, your roadmap, and most importantly — how your brand speaks.

It works **offline by default**, optionally taps into Claude for more natural responses, and ships as a single compiled knowledge file. No database. No server. Just pure, controllable knowledge you own.

## How It Works

Three components work together seamlessly:

```
company-state/     ← Content & personality (what it knows + how it speaks)
      +
GitHub org         ← Your repos (scanned via API)
      ↓
cc-admin           ← Private build tool
      ↓
company-cli        ← The public CLI your team and users install
```

- **`company-state/`** is a simple folder of plain-text files containing your section mappings, brand personality, `NOW.md`, roadmap, and more. You edit these directly or through the admin tools.
- **`cc-admin`** is your internal command-line tool. It scans your GitHub org, parses READMEs according to your rules, applies overrides, and compiles everything into a single `dist/knowledge.json` file.
- **`company-cli`** is the distributable CLI. It reads the compiled knowledge and responds in your brand’s voice. You simply rename the entry point in `pyproject.toml` (e.g. `heybabb`, `hey-acme`, `askwidget`).

## Quick Start

Getting started is surprisingly straightforward:

```bash
cd cc-admin
python3 -m venv .venv && source .venv/bin/activate
pip install -e .

# Scaffold your company-state folder
cc-admin init
```

The `init` command will prompt you for your GitHub org name, brand name, and topic prefix, then generate all the necessary files and configuration.

## GitHub Topics – Smart Repo Discovery

Use GitHub topics to control what gets included and how deeply it’s scanned:

- **`{prefix}-tool`** → Full deep scan (products and tools)
- **`{prefix}-featured`** → Lead with these when listing tools
- **`{prefix}-vision`** → Strategic future work (not yet a product)
- **`{prefix}-internal`** → Infrastructure only — brief mention

Replace `{prefix}` with whatever you set during initialization.

## README Conventions

For best results, add consistent section headers to your repositories (fully configurable):

```markdown
## What is it?
## The Problem
## How it Works
## Current Status
## The Vision
## Industry Context
```

The scanner automatically turns these into structured knowledge. Need different headers? Just edit `company-state/section-map.yml` or use the admin commands to customize.

## Powerful Admin Commands

`cc-admin` gives you full control over your knowledge base:

```bash
cc-admin init                    # Scaffold a new company-state
cc-admin scan                    # Scan GitHub org and parse repos
cc-admin build                   # Compile knowledge.json
cc-admin diff                    # Preview changes before publishing
cc-admin publish                 # Push dist/ to company-cli
cc-admin preview "query"         # Test a question before shipping
cc-admin audit                   # Show build log
```

Advanced curation tools include:

- `cc-admin qa` — Manage hand-crafted Q&A pairs
- `cc-admin override` — Curate or suppress information per tool
- `cc-admin lore` — Inject company history and culture
- `cc-admin announce` — Pin announcements to the `now` command
- `cc-admin alias` — Create alternate names and cross-references
- `cc-admin persona` — Customize tone and add easter eggs

## What Users See: company-cli Commands

Once installed and renamed to your brand, users get clean, intuitive commands:

```bash
companycli                    # Friendly greeting
companycli tools              # List all indexed tools
companycli tool <name>        # Deep dive on a specific tool
companycli now                # What the team is working on right now
companycli vision             # Roadmap and strategic direction
companycli version            # Build and knowledge version info
companycli ask "<question>"   # Natural language (offline)
companycli ask --ai "<question>"  # Claude-powered responses
companycli sync               # Refresh latest GitHub signals
```

## AI Mode (Optional)

For more fluid conversations, use `--ai`:

```bash
export ANTHROPIC_API_KEY=your_key_here
companycli ask --ai "What makes your approach different?"
```

The entire knowledge base is passed as context, so responses stay grounded in your actual content and brand voice.

## Overrides & Curation

You don’t have to change your READMEs to control what the CLI says. Use overrides:

```bash
cc-admin override set bitpads status "Stable. Ships next week."
cc-admin override suppress bitpads context
cc-admin override embargo bitpads vision --until 2026-09-01
cc-admin override tone bitpads technical
```

This gives you fine-grained control without polluting your public repositories.

## Knowledge Enrichment Features

Beyond README parsing, you can enrich the assistant with:

- **Q&A pairs** — Pre-written answers to common questions
- **Lore** — Company history, mission, and culture
- **Announcements** — Time-sensitive updates
- **Aliases & cross-references** — Help users find tools by different names
- **Easter eggs** — Fun personality moments triggered by specific inputs

## Open Source & Ready to Fork

**company-character** is a reference implementation, not a one-size-fits-all product.

It’s intentionally generic — no hardcoded organization names or brand text. Everything is driven by your configuration and `company-state/` folder.

Fork it, rename it, and build your own branded CLI companion for your team, your open-source community, or your customers.

The live reference deployment is the **Babb CLI** (`heybabb`), built by Babb Works.

---

**Want your organization to have a voice in the terminal?**

Try the reference implementation today and start building your own `company-character` system.

Your tools deserve to speak with personality. Your team deserves an assistant that actually knows what’s going on.

Welcome to the age of the branded terminal companion.
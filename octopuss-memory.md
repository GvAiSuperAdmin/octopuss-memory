# 🐙 octopuss-memory

> Canonical AI memory, protocols, and skills for all Ram's projects.
> Single source of truth — pulled into every project automatically.

---

## What This Is

This repo is the **living brain** behind all projects. It contains:

- `octopuss-memory.md` — Master protocol file (design rules, workflow, tech stack, preferences)
- `CLAUDE.md` — Entry point for Claude Code and Cowork
- `install-skills.sh` — One-command installer for all skills (40+ skills across 5 clusters)

---

## Usage

### Start any new project

```bash
# 1. Pull memory into your project
curl -s https://raw.githubusercontent.com/GvAiSuperAdmin/octopuss-memory/main/octopuss-memory.md > octopuss-memory.md

# 2. Pull CLAUDE.md
curl -s https://raw.githubusercontent.com/GvAiSuperAdmin/octopuss-memory/main/CLAUDE.md > CLAUDE.md

# 3. Install all skills
curl -s https://raw.githubusercontent.com/GvAiSuperAdmin/octopuss-memory/main/install-skills.sh > install-skills.sh
bash install-skills.sh
```

### Or clone and copy

```bash
git clone https://github.com/GvAiSuperAdmin/octopuss-memory
cp octopuss-memory/octopuss-memory.md ./
cp octopuss-memory/CLAUDE.md ./
cp octopuss-memory/install-skills.sh ./
bash install-skills.sh
```

---

## Skills Installed (40+)

| Cluster | Count | Key Skills |
|---|---|---|
| Anthropic Official | 16 | frontend-design, docx, pdf, pptx, xlsx, mcp-builder, canvas-design, web-artifacts-builder |
| Design Excellence | 15 | ui-ux-pro-max, high-end-visual-design, polish, critique, audit, animate, typeset |
| Strategy / Superpowers | 13 | brainstorming, writing-plans, executing-plans, subagent-driven-development, systematic-debugging |
| Marketing Suite | 16 | copywriting, content-strategy, launch-strategy, seo-audit, page-cro, email-sequence |
| Specialist & Agent Tools | 17 | andrej-karpathy-skills, gstack, convex, supabase, better-auth, vercel, obsidian |

---

## Interaction Protocols

### One step at a time
When walking Ram through any multi-step process (setup, deploy, migration,
troubleshooting):
- Present **one step and its sub-steps** per message.
- Wait for Ram to confirm "done" (or hit a problem) before sending the next step.
- Never dump 5-6 steps in a single message — it's overwhelming and easy to
  lose place.
- If a step fails, diagnose and fix **before** moving on.

### Non-technical audience
Ram is non-technical. Rules of thumb:
- Plain language. Never introduce jargon without a one-line explanation.
- Prefer clicks in a GUI (GitHub Desktop, Vercel dashboard, Finder) over
  Terminal commands. Terminal only as fallback.
- When a path or name matters, quote it exactly.
- Screenshot-driven debugging is welcome. Ask for one when stuck.

---

## Update Protocol

When any protocol changes are agreed with Ram:
1. Update `octopuss-memory.md` in this repo
2. Commit with message: `update: [what changed] — YYYY-MM-DD`
3. All projects auto-pull the latest on next `install-skills.sh` run

---

## File Structure

```
octopuss-memory/
├── octopuss-memory.md     ← Master protocol (single source of truth)
├── CLAUDE.md              ← Claude Code + Cowork entry point
├── install-skills.sh      ← One-command skills installer
└── README.md              ← This file
```

---

*Built for Ram's 1-person $1B AI-first company.*

#Octopuss
# CLAUDE.md
> This file is the entry point for Claude Code and Cowork.
> It pulls all protocols, preferences, and skills from the canonical octopuss-memory.
>
> **Confused about where this brain lives, which copy is real, or the GitHub sync? Read [MEMORY-MAP.md](MEMORY-MAP.md) FIRST** — it maps every location and records the source-of-truth decision so you don't have to investigate.

---

## Load Canonical Memory

**Before doing anything**, read the full protocol file:

```
octopuss-memory.md
```

If `octopuss-memory.md` is not present in this project, run:

```bash
curl -s https://raw.githubusercontent.com/GvAiSuperAdmin/octopuss-memory/main/octopuss-memory.md > octopuss-memory.md
```

All design rules, workflow protocols, tech stack preferences, coding standards, and interaction rules are defined there. They govern every action in this project.

---

## Install Skills (first time per machine)

```bash
bash install-skills.sh
```

---

## Project-Specific Overrides

Any rules defined below override octopuss-memory.md for this project only.

<!-- Add project-specific overrides here -->

---

## Quick Reference (from octopuss-memory)

| Rule | Value |
|---|---|
| Design Philosophy | Dieter Rams × Apple × Swiss × Japanese |
| Colours | Black / White / Red (primary) / Yellow (secondary) |
| Fonts | IBM Plex Mono (body), Disket Mono (headings) — Ram approves per project |
| Numbers / Dates / Currency | Always monospace |
| Mobile-first | 375 / 768 / 1024 / 1440 breakpoints |
| Themes | Light + Dark + System — all three always |
| Spec path | docs/specs/YYYY-MM-DD-Topic.md |
| Before coding | Read octopuss-memory → brainstorm → spec → approval → plan → build |
| Code standard | Comments throughout, clean, handover-ready |
| DB | Convex DB / Supabase |
| Frontend | Next.js + TypeScript + Tailwind + Motion |
| Deploy | GitHub + Vercel |


#Octopuss

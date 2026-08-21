# MEMORY-MAP.md — octopuss-memory topology & the single-source-of-truth decision

> Read this FIRST if you are an agent touching octopuss-memory. It exists so no
> future agent has to re-run the multi-hour investigation that produced it.
> Last mapped: 2026-08-21 (from the MacBook Air).

---

## TL;DR

- There is **one live brain**, **one stale fork**, and the **GitHub remotes** behind them. That's the "three locations" you may have heard about.
- **The live brain you are reading is the source of truth for day-to-day work** and is what auto-syncs to GitHub.
- **BUT the stale April fork contains rich Master-Protocol content that is NOT in the live brain.** Do not delete or abandon the fork until that content is merged in. See "Unfinished business" below.
- **Recommendation: consolidate to ONE brain (this repo) mirrored to GitHub. Do NOT create a separate "Granular brain."** Reasoning below.

---

## The locations (verified 2026-08-21)

| # | Role | Local path | Git remote | Last commit | Files |
|---|------|-----------|------------|-------------|-------|
| A | **STALE fork** (rich content!) | `~/Documents/Ai/GitHub/octopuss-memory` | `github.com/GvAiSuperAdmin/20260425-octopuss-memory.git` | 2026-04-25 | 26 |
| B | **LIVE brain** (source of truth) | `~/Documents/Ai/Ai Projects - IDE & DevOps/Octopuss/shared/octopuss-memory` | `github.com/GvAiSuperAdmin/octopuss-memory.git` | current (auto-sync) | 23 |
| — | GitHub remotes | the two `origin` URLs above | — | — | — |

Note the counter-intuitive part: the folder literally named `GitHub/octopuss-memory` (A) is the **out-of-date fork**, and the one buried in the Octopuss workspace (B) is the **live** one. Judge by the **remote** (`octopuss-memory.git` = canonical) and **last commit date**, never by the folder name.

## What is unique where

- **Live brain (B)** — current operational memory: `CLAUDE.md`, `octopuss-memory.md` (index), `README-handoff.md`, `projects.*` manifest, `SYNC.md`, `install-skills.sh`, `scaffolds/`. This is what auto-syncs.
- **Stale fork (A), folder `20260422/`** — holds `octopuss-memory-aboutme.md`: a **431-line Master AI Protocol (v3, 2026-04-20)** with full detail the live brain LACKS:
  - Design System (Swiss + Japanese aesthetic, colours, gradients, typography, layout, components, motion, accessibility)
  - Workflow protocols, Copywriting & Marketing protocols (CTA formula, headline formulas)
  - Resolved Conflicts Log, Principles & North Star, Tech-stack detail
  - Verification: grepping the live brain for `Swiss Design`, `wabi-sabi`, `RESOLVED CONFLICTS`, `CTA Formula`, `Gradients`, `North Star` → **0 hits each**. Only `Karpathy` partially survived.
- `octopuss-memory-backup.md` in the fork is **empty (0 bytes)** — nothing to salvage there.

## The sync setup (already built — see SYNC.md for full detail)

- Script: `~/.octopuss-sync/octopuss-sync.sh` — pulls first, then commits + pushes the **live brain (B)** to `octopuss-memory.git`.
- Safety rail: refuses any run that would delete more than 8 files (guards against a mass-wipe on GitHub).
- Scheduler: macOS launchd, every 30 min + at login. Log: `~/.octopuss-sync/sync.log`.
- Machinery lives in `~/.octopuss-sync/` (outside `~/Documents`) so the background scheduler isn't blocked by macOS privacy (TCC). Reaching the repo inside `~/Documents` from the unattended job still needs a one-time **Full Disk Access** grant — that is the only open item on the automation side.

---

## Unfinished business (do this before retiring the fork)

1. **Salvage A's Master Protocol into B.** Bring `20260422/octopuss-memory-aboutme.md`'s design/copywriting/conflicts/principles content into the live brain (e.g. as `octopuss-memory-protocol.md`, linked from the index). This is the real value at risk.
2. Only **after** that merge, archive the April fork + its `20260425-octopuss-memory.git` remote so the two-remote confusion ends.
3. Grant Full Disk Access to the sync job's shell so the 30-min automation runs unattended.

---

## Strategic decision: one brain, not a per-tool fork

**Keep a single canonical brain (this repo, `octopuss-memory.git`) and mirror it to GitHub. Do NOT spin up a separate "Granular brain."**

Why:

- The entire mess this map documents — 3 locations, 2 remotes, silent content drift, a 431-line protocol stranded in a fork — is exactly what a *second* parallel brain would reproduce.
- GitHub is the durable, machine-independent mirror; the live folder is the working copy. That's the right split: **one working copy per machine, one shared remote.**
- Granular (and any other tool) should **read from and write to this same file**, not keep its own. If Granular wants a `BRAIN.md` entry point, make it a thin pointer to the canonical `octopuss-memory.md`, not a rival copy.

So the answer to "keep the Granular brain separate and directly sync to GitHub?" is: **don't keep it separate.** Point Granular at this one brain; let the existing sync job carry it to GitHub. One source of truth, many readers.

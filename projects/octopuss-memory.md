# octopuss-memory

> Canonical AI memory, protocols, and skills. Every other project pulls from here.

- **Repo:** https://github.com/GvAiSuperAdmin/octopuss-memory
- **Visibility:** public
- **Status:** LIVE
- **Active branch:** `main`
- **Deploy:** none (documentation/config repo)

## Purpose

Single source of truth for design rules, workflow protocols, tech stack preferences, coding standards, and the 40+ installed skills. Changes here propagate to every project on next `install-skills.sh` run.

## Files

- `octopuss-memory.md` — master protocol file
- `CLAUDE.md` — entry point for Claude Code and Cowork
- `install-skills.sh` — one-command skill installer
- `projects.md` / `projects.json` — manifest of every project (this cross-device index)
- `projects/` — per-project deep notes (this folder)
- `scaffolds/` — code waiting to be split into its own repo

## Current WIP

Cross-device structure being set up on branch `claude/organize-cross-device-structure-EuNnT` (this branch). Merges to `main` after review.

## Next

- Merge the cross-device manifest branch once the github-mcp scaffold is split out into its own repo.

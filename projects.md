# Projects Manifest

> Single source of truth for every project in the GvAiSuperAdmin account.
> Designed for seamless hand-off between desktop and Claude dispatch (mobile).
>
> On any device: clone `octopuss-memory` → read this file → know what's in flight.
> Machine-readable version: [projects.json](./projects.json)
> Per-project deep notes: [projects/](./projects/)
>
> **Last updated:** 2026-04-21

---

## Status legend

| Icon | Meaning |
|---|---|
| LIVE | Deployed and working |
| WIP | Under active development |
| FAIL | Deployment or build broken |
| IDLE | Not actively worked on, still intact |
| ARCHIVE | Flagged for archive or deletion |
| UNKNOWN | Private repo or not yet audited in this session |

---

## All projects

| Project | Visibility | Status | Active branch | Deploy | Notes |
|---|---|---|---|---|---|
| [octopuss-memory](./projects/octopuss-memory.md) | public | LIVE | `main` | n/a | Canonical brain. Every project pulls from here. |
| [github-mcp](./projects/github-mcp.md) | — | WIP | `main` (planned) | Vercel (planned) | **NEW.** Fresh GitHub MCP server. Scaffold lives in [scaffolds/github-mcp/](./scaffolds/github-mcp/) until split into its own repo. |
| [github-mcp-vercel](./projects/github-mcp-vercel.md) | public | FAIL / ARCHIVE | `main` | [failed](https://vercel.com/gvaisuperadmins-projects/github-mcp-vercel/deployments) | Broken Vercel deploy. Replaced by `github-mcp`. To be archived. |
| [payload-cms-mcp-server](./projects/payload-cms-mcp-server.md) | public | UNKNOWN | `main` | not yet audited | Payload CMS MCP server. Status to be confirmed in a wider-scope session. |
| [Claude-Octopuss](./projects/Claude-Octopuss.md) | public | IDLE | `main` | n/a | Older octopuss-memory predecessor. Candidate for archive. |
| [CasaCash](./projects/CasaCash.md) | public | UNKNOWN | `main` | not yet audited | — |
| [verolodex](./projects/verolodex.md) | private | UNKNOWN | `main` | — | Private, contents not visible. |
| [Travel](./projects/Travel.md) | private | UNKNOWN | `main` | — | Private, contents not visible. |
| [buybyai](./projects/buybyai.md) | private | UNKNOWN | `main` | — | Private, contents not visible. Construction-industry buying agent. |
| [wtflist.com](./projects/wtflist.com.md) | private | UNKNOWN | `main` | — | Private. "Ze Ultimate List of Lists". |

---

## Hand-off protocol

When starting work on any device:

1. `git clone https://github.com/GvAiSuperAdmin/octopuss-memory`
2. `cat projects.md` — see what exists and status of each
3. Pick a project → open `projects/<name>.md` → read current WIP note
4. Clone that project's repo separately if you need to edit code
5. When you stop work on a project, **update `projects/<name>.md`** with what's in progress, blockers, next step. Commit + push to `octopuss-memory`.

When the other device picks up, step 2 surfaces your note. Nothing lives only on one laptop.

---

## Updating the manifest

After any change to a project's status:

1. Edit `projects.md` (this file) — update the status column.
2. Edit `projects.json` — update the matching entry.
3. Edit `projects/<name>.md` — update the current WIP note.
4. Commit with message: `manifest: <project> → <new status>`

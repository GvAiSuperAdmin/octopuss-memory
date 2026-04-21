# github-mcp

> Fresh GitHub MCP server for Vercel. Replaces the failing `github-mcp-vercel`.

- **Repo:** not yet created (scaffold in [scaffolds/github-mcp/](../scaffolds/github-mcp/))
- **Visibility:** planned public
- **Status:** WIP
- **Active branch:** `main` (planned)
- **Deploy:** Vercel (planned)

## Purpose

A working GitHub MCP server deployed to Vercel. Exposes a minimal, useful set of GitHub tools over the MCP streamable HTTP transport so Claude (desktop, mobile, Claude dispatch) can call them.

Starter tools:
- `list_repos` — list your repos
- `get_repo` — details for one repo
- `list_issues` — issues for a repo
- `create_issue` — open an issue
- `list_pull_requests` — PRs for a repo
- `search_code` — code search

## Why a new repo instead of fixing `github-mcp-vercel`

The existing repo accumulated broken build config (commits like "fix: set outputDirectory for pure API project", "fix: remove tsc build") — it's fighting Vercel's zero-config. Starting fresh with the correct pattern from day one is faster than unwinding.

## Design choices

- **No `outputDirectory`** — API-only projects on Vercel need zero build config.
- **No custom build command** — Vercel compiles TypeScript serverless functions natively.
- **Stateless** — each request creates a fresh MCP server instance. Safe for Vercel serverless.
- **Streamable HTTP transport** — the current MCP standard, POST-based, works over serverless.
- **Octokit** for GitHub API calls — maintained, typed.

## Current WIP

Scaffold complete in [scaffolds/github-mcp/](../scaffolds/github-mcp/). Waiting to be split into its own repo — that requires a Claude dispatch session with wider repo scope (see handoff instructions in branch merge notes).

## Deploy steps (when repo is created)

1. Create repo `GvAiSuperAdmin/github-mcp` on GitHub.
2. Copy `scaffolds/github-mcp/*` into it. Initial commit.
3. In Vercel dashboard: **New Project** → import `GvAiSuperAdmin/github-mcp` → **Deploy** (no customization needed).
4. In the deployed project's **Settings → Environment Variables**, add `GITHUB_TOKEN` with a [personal access token](https://github.com/settings/tokens) (classic, scopes: `repo`, `read:user`). Redeploy.
5. Endpoint is live at `https://<project>.vercel.app/api/mcp`.
6. Register the endpoint with Claude (see scaffold README).

## Next

- Split `scaffolds/github-mcp/` into its own GitHub repo.
- Deploy to Vercel.
- Verify with a curl `initialize` call.
- **Then delete `github-mcp-vercel`.**

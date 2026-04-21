# github-mcp-vercel

> Earlier attempt at a GitHub MCP server on Vercel. **To be deleted** after `github-mcp` replacement is live.

- **Repo:** https://github.com/GvAiSuperAdmin/github-mcp-vercel
- **Visibility:** public
- **Status:** FAIL / ARCHIVE
- **Active branch:** `main`
- **Deploy:** https://vercel.com/gvaisuperadmins-projects/github-mcp-vercel (all deploys ERROR)

## What went wrong

Both production deploys are in `ERROR` state. Build logs show:

```
Installing dependencies... ok (243 packages)
API only — no build needed
Using TypeScript 5.9.3 (local user-provided)
[deploy fails here]
```

Commit history tells the story: `"fix: remove tsc build — Vercel handles TS compilation natively"` then `"fix: set outputDirectory for pure API project"`. Classic symptom: an API-only Vercel project was configured with an `outputDirectory` setting pointing to a folder that doesn't exist (because there's no build step producing static output). Vercel then errors because it can't find the declared output.

The right fix would be: remove the `outputDirectory` entirely, let Vercel auto-detect `/api/*.ts` functions. But instead of unwinding the mess, we're starting fresh in `github-mcp`.

## Next

1. Wait for `github-mcp` to deploy successfully.
2. Verify new endpoint responds to MCP `initialize` request.
3. **Delete this repo.** (Requires a Claude dispatch session scoped to this repo — see handoff instructions.)
4. Remove the associated Vercel project (`github-mcp-vercel`) from the Vercel dashboard.

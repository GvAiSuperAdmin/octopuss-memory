# github-mcp

A small, Vercel-ready GitHub MCP server. Exposes a handful of GitHub tools
(`list_repos`, `get_repo`, `list_issues`, `create_issue`, `list_pull_requests`,
`search_code`) over the MCP [streamable HTTP transport](https://modelcontextprotocol.io/docs/concepts/transports).

This is a fresh clean-slate replacement for the broken `github-mcp-vercel` repo.

## Why this one works (and the old one didn't)

The old `github-mcp-vercel` kept fighting Vercel's build pipeline —
`"fix: remove tsc build"`, `"fix: set outputDirectory for pure API project"`.
The root cause: an API-only project was configured with an `outputDirectory`,
and Vercel errored because the declared output folder didn't exist (there's
no build step producing static files).

This scaffold avoids all of that:

- **No `vercel.json`** — Vercel's zero-config auto-detects `/api/*.ts` as
  serverless functions.
- **No build script** in `package.json` — Vercel compiles TypeScript natively.
- **Stateless handler** — safe for serverless cold starts.

## Quick start (local)

```bash
npm install
cp .env.example .env            # then paste your GitHub token into .env
npx vercel dev                  # http://localhost:3000/api/mcp
```

Test it:

```bash
curl -X POST http://localhost:3000/api/mcp \
  -H 'Content-Type: application/json' \
  -d '{"jsonrpc":"2.0","id":1,"method":"initialize","params":{"protocolVersion":"2024-11-05","capabilities":{},"clientInfo":{"name":"curl","version":"1"}}}'
```

You should get back a JSON-RPC response with server capabilities.

## Deploy to Vercel

1. **Split this folder into its own GitHub repo** called `github-mcp`
   (instructions in `octopuss-memory/README-handoff.md`).
2. In the Vercel dashboard → **New Project** → **Import Git Repository** →
   select `GvAiSuperAdmin/github-mcp` → **Deploy**. Leave every setting at
   its default — no framework preset, no build command, no output directory.
3. Once deployed, go to the project → **Settings → Environment Variables** →
   add:
   - Name: `GITHUB_TOKEN`
   - Value: a [personal access token](https://github.com/settings/tokens)
     (classic) with scopes `repo` and `read:user`.
4. Trigger a redeploy (Deployments tab → latest → ⋯ → Redeploy) so the new
   env var takes effect.
5. Your MCP endpoint is now at:
   `https://<your-project>.vercel.app/api/mcp`

## Connect to Claude

### Claude Desktop / Claude Code

Add to your MCP settings (adjust path for your OS):

```json
{
  "mcpServers": {
    "github-mcp": {
      "url": "https://<your-project>.vercel.app/api/mcp"
    }
  }
}
```

Restart Claude. The six tools should appear in the tool palette.

### Claude dispatch (mobile)

Add the same URL under **Settings → MCP servers** in the dispatch UI.
Because the endpoint is HTTPS and stateless, mobile and desktop can share
the same server — another piece of the seamless hand-off.

## Extending

Every tool lives in `api/mcp.ts`. To add one:

1. Pick an [Octokit endpoint](https://octokit.github.io/rest.js/).
2. Add another `server.tool(name, description, schema, handler)` block.
3. Commit and push — Vercel auto-deploys.

## Files

```
github-mcp/
├── api/
│   └── mcp.ts              ← The only file that actually runs
├── .env.example
├── .gitignore
├── package.json
├── tsconfig.json
└── README.md
```

No `vercel.json`, no `dist/`, no build step. On purpose.

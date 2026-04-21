# Handoff — what to do next

> Written 2026-04-21 from a Claude dispatch session scoped only to `octopuss-memory`.
> The work below requires a wider-scope session (i.e. a Claude dispatch task
> that includes `github-mcp-vercel` and permission to create new repos).
>
> Read this file top to bottom and do the steps in order.

---

## What's already done (in this branch)

- ✅ **Cross-device manifest** — `projects.md`, `projects.json`, and one file
  per project under `projects/`. Everything in flight across all your repos
  is now indexed here. Any device reads this first to know what's happening.
- ✅ **Fresh GitHub MCP server scaffold** at `scaffolds/github-mcp/` —
  clean, Vercel-ready, no build-config hacks. Ready to split into its own repo.
- ⛔ **Not yet done** (needs wider session scope):
  - Create the new `GvAiSuperAdmin/github-mcp` repo.
  - Deploy it to Vercel.
  - Delete the broken `GvAiSuperAdmin/github-mcp-vercel` repo.
  - Audit `payload-cms-mcp-server`.

---

## Step 1 — Merge this branch

After reviewing the files on this branch
(`claude/organize-cross-device-structure-EuNnT`):

```bash
# On the claude.ai/code web UI, or via GitHub, merge this branch into main.
```

---

## Step 2 — Start a new Claude dispatch session with wider scope

1. Go to [claude.ai/code](https://claude.ai/code).
2. Start a **new task** (not this one).
3. When it asks which repositories to include, select **all of them** under
   `GvAiSuperAdmin` — or at minimum:
   - `octopuss-memory`
   - `github-mcp-vercel`
   - `payload-cms-mcp-server`
   - (and any new repo once you've created it)
4. In the first message to the new session, paste this:

   > Read `octopuss-memory/projects.md` and
   > `octopuss-memory/README-handoff.md` (this file). Then execute
   > **Step 3, 4, and 5** in the handoff. Report back when done.

Claude will take over from there.

---

## Step 3 — Create the `github-mcp` repo and push the scaffold

(The wider-scope session does this for you; the steps are listed here for
transparency.)

```bash
# 1. Create an empty new repo on GitHub called `github-mcp`.
# 2. Clone octopuss-memory locally (or work inside the existing clone).
# 3. Copy the scaffold contents into a fresh folder and push:

mkdir /tmp/github-mcp
cp -R octopuss-memory/scaffolds/github-mcp/. /tmp/github-mcp/
cd /tmp/github-mcp
git init
git add .
git commit -m "init: clean-slate GitHub MCP server for Vercel"
git branch -M main
git remote add origin https://github.com/GvAiSuperAdmin/github-mcp.git
git push -u origin main

# 4. Remove the scaffold from octopuss-memory (it's now owned by github-mcp):
cd <octopuss-memory>
git rm -r scaffolds/github-mcp
# Then update projects.md and projects/github-mcp.md:
#   - set scaffold_path to null in projects.json
#   - set repo to https://github.com/GvAiSuperAdmin/github-mcp
#   - status WIP -> LIVE once Vercel confirms green
git commit -am "manifest: github-mcp split into own repo"
git push
```

---

## Step 4 — Deploy to Vercel

1. In Vercel dashboard → **New Project** → **Import Git Repository** →
   select `GvAiSuperAdmin/github-mcp` → **Deploy**.
   **Do not change any settings.** No framework preset, no build command,
   no output directory. Just click Deploy.
2. When the first deploy finishes, go to
   **Project → Settings → Environment Variables** and add:
   - Name: `GITHUB_TOKEN`
   - Value: a [personal access token](https://github.com/settings/tokens)
     (classic), scopes: `repo`, `read:user`.
3. **Deployments tab → latest deploy → ⋯ → Redeploy** so the env var applies.
4. Once that deploy goes green, test:
   ```bash
   curl -X POST https://<your-project>.vercel.app/api/mcp \
     -H 'Content-Type: application/json' \
     -d '{"jsonrpc":"2.0","id":1,"method":"tools/list","params":{}}'
   ```
   You should see the six tools listed. If yes → move to Step 5.

---

## Step 5 — DELETE the old `github-mcp-vercel`

Only once Step 4 has returned a green deploy and `tools/list` succeeds.

1. Delete the Vercel project `github-mcp-vercel` in the Vercel dashboard.
2. Delete the GitHub repo:
   ```bash
   # Requires admin permission on the repo.
   gh repo delete GvAiSuperAdmin/github-mcp-vercel --yes
   ```
   Or via the UI: github.com/GvAiSuperAdmin/github-mcp-vercel → Settings →
   scroll to bottom → **Delete this repository**.
3. Update the manifest:
   - Remove the `github-mcp-vercel` entry from `projects.md`, `projects.json`,
     and delete `projects/github-mcp-vercel.md`.
   - Commit: `manifest: remove github-mcp-vercel (deleted, replaced by github-mcp)`.

---

## Step 6 — Audit `payload-cms-mcp-server`

In the same wider-scope session:

1. Open `projects/payload-cms-mcp-server.md`.
2. Read the repo source. Check:
   - Is there a Vercel deploy? Is it working?
   - Does it follow the same clean pattern (no `outputDirectory` hack)?
3. Update the manifest with real status (LIVE / WIP / FAIL / etc.) and a
   short WIP note.

---

## Step 7 (optional) — Archive dead projects

Once everything above is green:

- `Claude-Octopuss` — likely archive (superseded by `octopuss-memory`).
  Check for external links before doing so.

---

## Safety checklist

- ⚠️ Don't delete `github-mcp-vercel` until `github-mcp` is confirmed green.
- ⚠️ Don't hard-delete `Claude-Octopuss`. Archive it (preserves history +
  any inbound links).
- ✅ Every manifest change → commit → push. The manifest only works if
  it's up to date.

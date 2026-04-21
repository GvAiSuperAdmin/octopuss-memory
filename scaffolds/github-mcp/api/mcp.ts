// GitHub MCP server — Vercel serverless entry point.
//
// Design notes:
// - Stateless: a new MCP server + transport is built on every request.
//   Vercel functions don't share memory between invocations, so we don't
//   try to keep sessions alive.
// - Streamable HTTP transport in stateless mode (sessionIdGenerator: undefined).
//   That's the simplest, most reliable option for serverless.
// - No build step, no outputDirectory. Vercel auto-detects /api/*.ts.

import { McpServer } from "@modelcontextprotocol/sdk/server/mcp.js";
import { StreamableHTTPServerTransport } from "@modelcontextprotocol/sdk/server/streamableHttp.js";
import { Octokit } from "@octokit/rest";
import { z } from "zod";
import type { VercelRequest, VercelResponse } from "@vercel/node";

// Vercel runtime config — Node.js runtime (Edge doesn't support Octokit's deps).
export const config = {
  runtime: "nodejs",
  maxDuration: 30,
};

/**
 * Build a fresh MCP server for each incoming request.
 * The GITHUB_TOKEN env var must be set in the Vercel project settings.
 */
function buildServer(): McpServer {
  const token = process.env.GITHUB_TOKEN;
  if (!token) {
    throw new Error(
      "GITHUB_TOKEN environment variable is not set. " +
        "Configure it in Vercel → Project → Settings → Environment Variables."
    );
  }

  const octokit = new Octokit({ auth: token });

  const server = new McpServer({
    name: "github-mcp",
    version: "0.1.0",
  });

  // --- Tool: list_repos ----------------------------------------------------
  // Lists repos for the authenticated user, sorted by most recently updated.
  server.tool(
    "list_repos",
    "List repositories for the authenticated GitHub user.",
    {
      per_page: z.number().int().min(1).max(100).default(30)
        .describe("Results per page (1-100)."),
      page: z.number().int().min(1).default(1)
        .describe("Page number."),
    },
    async ({ per_page, page }) => {
      const { data } = await octokit.repos.listForAuthenticatedUser({
        per_page,
        page,
        sort: "updated",
      });
      // Trim the payload — Octokit returns a lot of fields we don't need.
      const trimmed = data.map((r) => ({
        name: r.full_name,
        private: r.private,
        description: r.description,
        url: r.html_url,
        default_branch: r.default_branch,
        updated_at: r.updated_at,
      }));
      return {
        content: [{ type: "text", text: JSON.stringify(trimmed, null, 2) }],
      };
    }
  );

  // --- Tool: get_repo ------------------------------------------------------
  // Fetches a single repo's metadata.
  server.tool(
    "get_repo",
    "Get details for a single repository.",
    {
      owner: z.string().describe("Repo owner (user or org)."),
      repo: z.string().describe("Repo name."),
    },
    async ({ owner, repo }) => {
      const { data } = await octokit.repos.get({ owner, repo });
      return {
        content: [
          {
            type: "text",
            text: JSON.stringify(
              {
                name: data.full_name,
                description: data.description,
                url: data.html_url,
                default_branch: data.default_branch,
                private: data.private,
                stars: data.stargazers_count,
                forks: data.forks_count,
                open_issues: data.open_issues_count,
              },
              null,
              2
            ),
          },
        ],
      };
    }
  );

  // --- Tool: list_issues ---------------------------------------------------
  // Lists issues on a repo. Note: GitHub's API returns PRs here too;
  // we filter those out so this matches user expectations.
  server.tool(
    "list_issues",
    "List issues (excluding pull requests) for a repository.",
    {
      owner: z.string(),
      repo: z.string(),
      state: z.enum(["open", "closed", "all"]).default("open"),
      per_page: z.number().int().min(1).max(100).default(30),
    },
    async ({ owner, repo, state, per_page }) => {
      const { data } = await octokit.issues.listForRepo({
        owner,
        repo,
        state,
        per_page,
      });
      const trimmed = data
        .filter((i) => !i.pull_request) // Real issues only.
        .map((i) => ({
          number: i.number,
          title: i.title,
          state: i.state,
          url: i.html_url,
        }));
      return {
        content: [{ type: "text", text: JSON.stringify(trimmed, null, 2) }],
      };
    }
  );

  // --- Tool: create_issue --------------------------------------------------
  server.tool(
    "create_issue",
    "Create a new issue on a repository.",
    {
      owner: z.string(),
      repo: z.string(),
      title: z.string(),
      body: z.string().optional(),
    },
    async ({ owner, repo, title, body }) => {
      const { data } = await octokit.issues.create({
        owner,
        repo,
        title,
        body,
      });
      return {
        content: [
          {
            type: "text",
            text: `Created issue #${data.number}: ${data.html_url}`,
          },
        ],
      };
    }
  );

  // --- Tool: list_pull_requests --------------------------------------------
  server.tool(
    "list_pull_requests",
    "List pull requests for a repository.",
    {
      owner: z.string(),
      repo: z.string(),
      state: z.enum(["open", "closed", "all"]).default("open"),
      per_page: z.number().int().min(1).max(100).default(30),
    },
    async ({ owner, repo, state, per_page }) => {
      const { data } = await octokit.pulls.list({
        owner,
        repo,
        state,
        per_page,
      });
      const trimmed = data.map((p) => ({
        number: p.number,
        title: p.title,
        state: p.state,
        user: p.user?.login,
        head: p.head.ref,
        base: p.base.ref,
        url: p.html_url,
      }));
      return {
        content: [{ type: "text", text: JSON.stringify(trimmed, null, 2) }],
      };
    }
  );

  // --- Tool: search_code ---------------------------------------------------
  // GitHub code search. Query syntax reference:
  // https://docs.github.com/en/search-github/searching-on-github/searching-code
  server.tool(
    "search_code",
    "Search code across GitHub using GitHub's code search syntax.",
    {
      q: z.string().describe("Query (e.g. 'octokit user:GvAiSuperAdmin')."),
      per_page: z.number().int().min(1).max(100).default(10),
    },
    async ({ q, per_page }) => {
      const { data } = await octokit.search.code({ q, per_page });
      const trimmed = data.items.map((i) => ({
        name: i.name,
        path: i.path,
        repo: i.repository.full_name,
        url: i.html_url,
      }));
      return {
        content: [
          {
            type: "text",
            text: JSON.stringify(
              { total_count: data.total_count, items: trimmed },
              null,
              2
            ),
          },
        ],
      };
    }
  );

  return server;
}

/**
 * Vercel serverless handler. One request in, one response out.
 */
export default async function handler(
  req: VercelRequest,
  res: VercelResponse
) {
  // CORS — allow the MCP endpoint to be called from any origin.
  res.setHeader("Access-Control-Allow-Origin", "*");
  res.setHeader(
    "Access-Control-Allow-Methods",
    "GET, POST, DELETE, OPTIONS"
  );
  res.setHeader(
    "Access-Control-Allow-Headers",
    "Content-Type, Mcp-Session-Id, Last-Event-ID"
  );

  if (req.method === "OPTIONS") {
    res.status(204).end();
    return;
  }

  try {
    const server = buildServer();

    // Stateless transport: no session tracking between requests.
    const transport = new StreamableHTTPServerTransport({
      sessionIdGenerator: undefined,
    });

    // Connect server → transport, then hand the raw req/res over.
    await server.connect(transport);
    await transport.handleRequest(req, res, req.body);

    // Best-effort cleanup once the response stream closes.
    res.on("close", () => {
      void transport.close().catch(() => {});
      void server.close().catch(() => {});
    });
  } catch (err) {
    console.error("[github-mcp] handler error:", err);
    if (!res.headersSent) {
      res.status(500).json({
        jsonrpc: "2.0",
        error: {
          code: -32603,
          message: err instanceof Error ? err.message : String(err),
        },
        id: null,
      });
    }
  }
}

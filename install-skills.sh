#!/bin/bash
# ============================================================
# OCTOPUSS SKILLS INSTALLER
# Installs all skills for Claude Code & Cowork
# Run once per project: bash install-skills.sh
# Or globally: bash install-skills.sh --global
# ============================================================

set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

echo ""
echo "🐙 OCTOPUSS SKILLS INSTALLER"
echo "=============================="
echo ""

# ─── ANTHROPIC OFFICIAL SKILLS ────────────────────────────
echo -e "${YELLOW}[1/5] Installing Anthropic Official Skills...${NC}"

npx skills add anthropics/skills --skill frontend-design
npx skills add anthropics/skills --skill canvas-design
npx skills add anthropics/skills --skill web-artifacts-builder
npx skills add anthropics/skills --skill brand-guidelines
npx skills add anthropics/skills --skill mcp-builder
npx skills add anthropics/skills --skill doc-coauthoring
npx skills add anthropics/skills --skill theme-factory
npx skills add anthropics/skills --skill internal-comms
npx skills add anthropics/skills --skill slack-gif-creator
npx skills add anthropics/skills --skill algorithmic-art
npx skills add anthropics/skills --skill skill-creator
npx skills add anthropics/skills --skill docx
npx skills add anthropics/skills --skill pdf
npx skills add anthropics/skills --skill pptx
npx skills add anthropics/skills --skill xlsx
npx skills add anthropics/skills --skill webapp-testing

echo -e "${GREEN}✓ Anthropic skills installed${NC}"
echo ""

# ─── DESIGN EXCELLENCE ────────────────────────────────────
echo -e "${YELLOW}[2/5] Installing Design Excellence Skills...${NC}"

npx skills add https://github.com/nextlevelbuilder/ui-ux-pro-max-skill --skill ui-ux-pro-max
npx skills add https://github.com/leonxlnx/taste-skill --skill high-end-visual-design
npx skills add https://github.com/leonxlnx/taste-skill --skill design-taste-frontend
npx skills add https://github.com/leonxlnx/taste-skill --skill redesign-existing-projects
npx skills add https://github.com/sleekdotdesign/agent-skills --skill sleek-design-mobile-apps
npx skills add https://github.com/pbakaus/impeccable --skill impeccable
npx skills add https://github.com/pbakaus/impeccable --skill polish
npx skills add https://github.com/pbakaus/impeccable --skill critique
npx skills add https://github.com/pbakaus/impeccable --skill audit
npx skills add https://github.com/pbakaus/impeccable --skill optimize
npx skills add https://github.com/pbakaus/impeccable --skill clarify
npx skills add https://github.com/pbakaus/impeccable --skill adapt
npx skills add https://github.com/pbakaus/impeccable --skill animate
npx skills add https://github.com/pbakaus/impeccable --skill typeset
npx skills add https://github.com/pbakaus/impeccable --skill normalize

echo -e "${GREEN}✓ Design skills installed${NC}"
echo ""

# ─── STRATEGY & SUPERPOWERS ───────────────────────────────
echo -e "${YELLOW}[3/5] Installing Strategy & Superpowers...${NC}"

npx skills add https://github.com/obra/superpowers --skill brainstorming
npx skills add https://github.com/obra/superpowers --skill writing-plans
npx skills add https://github.com/obra/superpowers --skill executing-plans
npx skills add https://github.com/obra/superpowers --skill subagent-driven-development
npx skills add https://github.com/obra/superpowers --skill systematic-debugging
npx skills add https://github.com/obra/superpowers --skill test-driven-development
npx skills add https://github.com/obra/superpowers --skill verification-before-completion
npx skills add https://github.com/obra/superpowers --skill dispatching-parallel-agents
npx skills add https://github.com/obra/superpowers --skill using-git-worktrees
npx skills add https://github.com/obra/superpowers --skill finishing-a-development-branch
npx skills add https://github.com/obra/superpowers --skill writing-skills
npx skills add https://github.com/obra/superpowers --skill requesting-code-review
npx skills add https://github.com/obra/superpowers --skill receiving-code-review

echo -e "${GREEN}✓ Strategy skills installed${NC}"
echo ""

# ─── MARKETING SUITE ──────────────────────────────────────
echo -e "${YELLOW}[4/5] Installing Marketing Suite...${NC}"

npx skills add https://github.com/coreyhaines31/marketingskills --skill copywriting
npx skills add https://github.com/coreyhaines31/marketingskills --skill content-strategy
npx skills add https://github.com/coreyhaines31/marketingskills --skill social-content
npx skills add https://github.com/coreyhaines31/marketingskills --skill launch-strategy
npx skills add https://github.com/coreyhaines31/marketingskills --skill seo-audit
npx skills add https://github.com/coreyhaines31/marketingskills --skill competitor-alternatives
npx skills add https://github.com/coreyhaines31/marketingskills --skill pricing-strategy
npx skills add https://github.com/coreyhaines31/marketingskills --skill marketing-psychology
npx skills add https://github.com/coreyhaines31/marketingskills --skill page-cro
npx skills add https://github.com/coreyhaines31/marketingskills --skill onboarding-cro
npx skills add https://github.com/coreyhaines31/marketingskills --skill copy-editing
npx skills add https://github.com/coreyhaines31/marketingskills --skill email-sequence
npx skills add https://github.com/coreyhaines31/marketingskills --skill analytics-tracking
npx skills add https://github.com/coreyhaines31/marketingskills --skill site-architecture
npx skills add https://github.com/coreyhaines31/marketingskills --skill ad-creative
npx skills add https://github.com/coreyhaines31/marketingskills --skill cold-email

echo -e "${GREEN}✓ Marketing skills installed${NC}"
echo ""

# ─── SPECIALIST TOOLS ─────────────────────────────────────
echo -e "${YELLOW}[5/5] Installing Specialist & Agent Skills...${NC}"

npx skills add https://github.com/forrestchang/andrej-karpathy-skills
npx skills add https://github.com/garrytan/gstack
npx skills add https://github.com/firecrawl/cli --skill firecrawl
npx skills add https://github.com/firecrawl/cli --skill firecrawl-scrape
npx skills add https://github.com/firecrawl/cli --skill firecrawl-search
npx skills add https://github.com/supabase/agent-skills --skill supabase
npx skills add https://github.com/supabase/agent-skills --skill supabase-postgres-best-practices
npx skills add https://github.com/get-convex/agent-skills --skill convex-quickstart
npx skills add https://github.com/get-convex/agent-skills --skill convex-setup-auth
npx skills add https://github.com/get-convex/agent-skills --skill convex-migration-helper
npx skills add https://github.com/get-convex/agent-skills --skill convex-performance-audit
npx skills add https://github.com/better-auth/skills --skill better-auth-best-practices
npx skills add https://github.com/vercel-labs/agent-skills --skill vercel-react-best-practices
npx skills add https://github.com/vercel-labs/agent-skills --skill deploy-to-vercel
npx skills add https://github.com/vercel-labs/next-skills --skill next-best-practices
npx skills add https://github.com/kepano/obsidian-skills --skill obsidian-markdown
npx skills add https://github.com/thedotmack/claude-mem

echo -e "${GREEN}✓ Specialist skills installed${NC}"
echo ""

# ─── PULL CANONICAL MEMORY ────────────────────────────────
echo -e "${YELLOW}Pulling latest octopuss-memory.md...${NC}"
curl -s https://raw.githubusercontent.com/[YOUR-GITHUB-USERNAME]/octopuss-memory/main/octopuss-memory.md > octopuss-memory.md
echo -e "${GREEN}✓ octopuss-memory.md synced${NC}"

echo ""
echo -e "${GREEN}=============================="
echo "🐙 ALL SKILLS INSTALLED"
echo -e "==============================${NC}"
echo ""
echo "Skills are ready for Claude Code and Cowork."
echo "Run this script at the start of any new project."
echo ""

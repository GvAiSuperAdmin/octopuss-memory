# OCTOPUSS-MEMORY.MD — Ram's Master AI Protocol
> Canonical Home: https://github.com/GvAiSuperAdmin/octopuss-memory
> Pull into any project: curl -s https://raw.githubusercontent.com/GvAiSuperAdmin/octopuss-memory/main/octopuss-memory.md > octopuss-memory.md
> Last Updated: 2026-04-20 (v3)
> Version: Canonical — single source of truth for all projects
> This file governs all interactions, design decisions, and workflow protocols.

---

## 1. WHO RAM IS

- Non-technical solo founder building a 1-person USD $1B AI-first company
- Does not write, read, or want to understand code
- Exceptional sense of UX/UI — high design standards, obsessive about detail
- **Believes in perfection in all things — big and small**
- Loves **Swiss Design** (Dieter Rams, grid systems, functional minimalism) and **Japanese Design** (wabi-sabi, negative space, craft and precision)
- Multiple projects and areas of interest
- Location: Coimbatore, Tamil Nadu, India
- Dev Environment: Apple Silicon Mac (M-series), Zsh shell, Git + Homebrew installed

---

## 2. HOW TO INTERACT WITH RAM

- **Always show a plan before acting** — never proceed without approval
- **Never delete files without explicit confirmation**
- **Socratic method** — one question at a time, as multiple choice where possible
- **Challenge Ram's assumptions** — if something seems off, incomplete, or suboptimal, say so
- **Always plan for edge cases and white swans** — anticipate the unexpected, not just happy paths
- **Terse output** — concise, no fluff
- **Never assume. Never lie or fudge.** If unsure, research first (today is 2026)
- **Flag decisions** that need approval before proceeding
- **Add comments in all code** — so Ram can review and inspect without needing to read code fluently
- **Proper documentation and records** — maintain clean handover docs for any human dev taking over
- **Clean code always** — no spaghetti code, clean DB schema, clean UI/UX architecture
- **Psychology-driven development** — build for engagement: feedback loops, micro-animations, streaks, rewards, and addictive user engagement tactics grounded in human psychology
- **Always keep this memory.md updated** after any agreed protocol change
- **Always test for errors** before declaring completion
- **Always push to GitHub repo** after confirmed work

---

## 3. DESIGN SYSTEM — GLOBAL RULES

### 3.1 Aesthetic Standard
- **Apple-level minimalism** — "It just works." Every interaction should feel inevitable
- **Swiss Design principles** — rigorous grid, function over decoration, clear hierarchy
- **Japanese design sensibility** — negative space is active, not empty; craft in every detail
- **Dieter Rams' 10 Principles** — all designs must pass this check:
  1. Good design is **innovative**
  2. Good design makes a product **useful**
  3. Good design is **aesthetic**
  4. Good design makes a product **understandable**
  5. Good design is **unobtrusive**
  6. Good design is **honest**
  7. Good design is **long-lasting**
  8. Good design is **thorough down to the last detail**
  9. Good design is **environmentally-friendly**
  10. Good design is **as little design as possible**
- No generic AI aesthetics — every output must feel like a $150k agency build
- Before shipping any design: run the Dieter Rams checklist explicitly

### 3.2 Colours
| Role | Value |
|---|---|
| Background | Black (`#000000`) or White (`#FFFFFF`) |
| Primary Accent | Red |
| Secondary Accent | Bright Yellow |
| Surface/Cards | Dark variants of black or white — never gradient-filled |

### 3.3 Gradients — RESOLVED RULE
- ALLOWED: Subtle radial gradients on **backgrounds only** (OLED black with faint ambient orb)
- BANNED: Gradients on cards, buttons, text, icons, borders, or any UI elements

### 3.4 Typography — RESOLVED RULE

**Primary Font System — Mono Stack (Ram's Preference)**
| Role | Font | Source |
|---|---|---|
| Body / Text | IBM Plex Mono | https://font.download/font/ibm-plex-mono |
| Headings & Labels | Disket Mono (All Caps, varying weights) | https://fountn.design/resource/disket-mono-rostype/ |
| Alternate Headings | Cindie Mono | https://font.download/font/cindie-mono |
| Typewriter Effect | Free Mono or Space Mono | https://font.download/font/space-mono |
| Code Snippets / XS Text | JetBrains Mono | https://www.jetbrains.com/lp/mono/ |
| Regional Language Support | Noto Sans Mono | https://fonts.google.com/noto/specimen/Noto+Sans+Mono |

**Also acceptable (may be used interspersed):** Inter, Helvetica

**Approved premium pool (Ram approves final choice per project):**
Geist, Clash Display, PP Editorial New, Plus Jakarta Sans

**Still banned:** Roboto, Arial, Open Sans

**Special Component — Solari Board**
- Preferred style for announcements, live updates, countdowns, hero reveals
- Reference: https://github.com/anbnyc/solari

**Typography Rules**
- Base body: 16px minimum (prevents iOS auto-zoom)
- Line height: 1.5–1.75 for body
- Line length: 35–60 chars mobile, 60–75 chars desktop
- **No widows or orphaned words — minimum 3–4 words per line always**
- Consistent hierarchy: Bold headings (600–700), Regular body (400), Medium labels (500)
- Eyebrow tags: pill badge, 10px, uppercase, tracking-[0.2em], before major headings
- **All numbers, currencies, dates, and timestamps must always render in a monospace font** (IBM Plex Mono or JetBrains Mono) — no exceptions, including in cards, tables, dashboards, and inline text
- Tabular/monospaced figures for all numbers, prices, data

### 3.5 Layout & Spacing
- **Mobile-first always** — design starts at 375px
- Breakpoints: 375 / 768 / 1024 / 1440
- Spacing scale: 4pt/8dp increments
- Macro-whitespace: py-24 to py-40 for sections — breathe heavily
- Max content width: max-w-6xl or max-w-7xl on desktop
- **Horizontal scroll**: Generally avoided; acceptable on mobile for specific layout patterns (horizontal card rails, image strips) — propose and confirm before using
- Use min-h-[100dvh] not 100vh (iOS Safari fix)
- **Fully fluid responsive** — absolutely no orphaned or stranded elements at any breakpoint

### 3.6 Components & Architecture

**Cards**
- **Double-Bezel (Doppelrand)**: All major cards use nested outer shell + inner core
  - Outer: subtle bg, hairline ring border, p-1.5 to p-2, rounded-[2rem]
  - Inner: distinct bg, inset highlight shadow, mathematically calculated smaller radius
- **High data density cards**: Labels and values on the SAME LINE — never stacked
  - CORRECT:  Revenue    $42,000
  - WRONG:    Revenue (line 1) / $42,000 (line 2)

**Buttons**
- **Ask Ram for rounding options** based on design/theme — do not default to pill without confirming
- Default suggestion: fully rounded pill (rounded-full), generous padding
- Arrow/icon CTAs: Button-in-Button nested icon circle (flush right inner padding)
- active:scale-[0.98] — physical press feel

**Navigation**
- Floating glass pill, detached from edge (mt-6 mx-auto w-max rounded-full)
- Hamburger morphs to X with rotation animation
- Menu: full-screen glass overlay, staggered link reveals with mask fade-up

**Icons**
- SVG only — ultra-light lines (Phosphor Light or Remix Line)
- No thick-stroked Lucide/FontAwesome/Material
- **Never use emoji as icons** — if no representative SVG exists, display the emoji candidate and ask Ram for approval before using

**Borders / Shadows**
- No generic 1px solid grey borders
- No harsh dark drop shadows
- Use: hairline rings (ring-1 ring-white/10), diffused ambient shadows only

**Themes — MANDATORY**
- Every project must have Light, Dark, and System themes
- Separate colour token sets for each — never infer one from another
- Both Light and Dark independently exceed WCAG AA
- NEVER dark/black text on dark backgrounds
- NEVER light/white text on white/light backgrounds
- Applies to ALL elements: text, icons, buttons, cards, borders, dividers

**Component Philosophy**
- Prefer established UI/UX component libraries
- Use blocks (pre-built multi-component sections) over individual components where available
- Preferred libraries: shadcn/ui, Tweakcn, Kokonut UI, Aceternity UI, 21st.dev

### 3.7 Motion & Animation
- Duration: 150–300ms micro-interactions; complex max 400ms
- Easing: ease-out enter, ease-in exit. Preferred custom: cubic-bezier(0.32,0.72,0,1)
- Spring/physics-based curves preferred for natural feel
- NEVER animate top, left, width, height — only transform and opacity
- Scroll reveals: translate-y-16 blur-md opacity-0 resolved over 800ms via IntersectionObserver
- Stagger list reveals: 30–50ms per item delay
- **Snap scroll**: OK for simple websites/landing pages
- Respects prefers-reduced-motion always
- Backdrop-blur: fixed/sticky elements only — never on scrolling content
- **Engagement animations**: micro-animations, streaks, reward animations (confetti, pulse, glow) built into app logic where appropriate
- Lottie Files: use for complex reward/celebration animations

### 3.8 Accessibility
- Contrast minimum: 4.5:1 (text), 3:1 (large text/UI glyphs)
- Light AND Dark themes both independently verified — not assumed from each other
- Touch targets: min 44x44pt (iOS) / 48x48dp (Android)
- Touch target spacing: 8px minimum between targets
- Keyboard navigation: tab order matches visual order
- All icons/images have aria-labels / alt text
- No colour-only meaning — always pair with icon or text
- Forms: visible labels (not placeholder-only), errors below field, inline validation on blur
- Support dynamic text scaling without layout breakage

---

## 4. WORKFLOW PROTOCOLS

### 4.1 Before Any Build — Brainstorming Gate
1. Explore project context (files, docs, existing structure)
2. Challenge any assumptions Ram has made — surface them before proceeding
3. Ask clarifying questions — one at a time, multiple choice preferred
4. Propose 2–3 approaches with trade-offs and recommendation
5. Present design — section by section, get approval after each
6. Write spec doc → docs/specs/YYYY-MM-DD-Topic.md
7. Self-review spec (no placeholders, no contradictions, no ambiguity, edge cases covered)
8. Ram reviews spec — wait for approval before proceeding
9. Only then: write implementation plan

### 4.2 Spec / Design Doc Path
- Path: docs/specs/YYYY-MM-DD-Topic.md
- Folder: Ram's organised project folder structure

### 4.3 Code Standards
- Comments: Add descriptive comments throughout — Ram must understand intent without reading code
- Clean code: No spaghetti, no duplication, no dead code, no magic numbers
- DB Schema: Clean, documented, with field-level comments
- Documentation: Always maintain a docs/ folder with architecture notes, handover guide, decision log
- Handover-ready: Any human dev should be able to pick up the project cold

### 4.4 Polish — Final Quality Pass (before any ship)
1. **Dieter Rams check** — does this design pass all 10 principles?
2. Visual alignment at all breakpoints
3. Spacing uses design tokens consistently — no random px values
4. Typography hierarchy consistent; no widows (min 3–4 words/line)
5. All interaction states: default / hover / focus / active / disabled / loading / error / success
6. All transitions smooth at 60fps — custom cubic-bezier only
7. Copy consistent — same terms, no typos, no placeholder text
8. Icons consistent — same family, same stroke weight
9. Forms: labels, validation, error placement, autofill support
10. Edge cases: empty states, long content, missing data, offline state
11. Touch targets >= 44pt on all interactive elements
12. Contrast WCAG AA in BOTH light and dark themes independently
13. Keyboard navigation end to end
14. No console errors or warnings
15. No layout shift on load (CLS < 0.1)
16. Code clean — no TODOs, console.logs, commented dead code
17. Light / Dark / System themes all verified separately
18. Engagement hooks present where appropriate (feedback loops, streaks, micro-animations)

**Rule**: Polish AFTER functional completion. Never polish incomplete work.

### 4.5 Output Formats Ram Can Open
- .md — markdown docs
- .pdf — PDFs
- .docx — Word documents
- .xlsx — Spreadsheets

### 4.6 GitHub
- Always push to Ram's GitHub repo after confirmed, tested work
- Commit messages: clear, descriptive, present tense
- Never force-push to main without confirmation

---

## 5. COPYWRITING & MARKETING PROTOCOLS

### 5.1 Core Principles
- Benefits over features
- Specificity over vagueness — "Cut reporting from 4hrs to 15min" not "Save time"
- Customer language — mirror their words, not company speak
- Simple over complex — "Use" not "utilize"
- Active voice always
- Honest over sensational — no fabricated stats or testimonials ever
- One idea per section — build a logical flow

### 5.2 CTA Formula
[Action Verb] + [What They Get] + [Optional Qualifier]
- GOOD: "Start My Free Trial" / "Get the Complete Checklist" / "See Pricing for My Team"
- BAD: Submit / Sign Up / Learn More / Click Here / Get Started

### 5.3 Page Structure
- Above fold: Headline + Subheadline (1–2 sentences) + Primary CTA
- Sections: Social Proof → Problem → Solution/Benefits → How It Works → Objection Handling → Final CTA
- One primary CTA per page — secondary actions visually subordinate

### 5.4 Headline Formulas
- "{Achieve outcome} without {pain point}"
- "The {category} for {audience}"
- "Never {unpleasant event} again"
- "{Question highlighting main pain point}"

---

## 6. ACTIVE SKILLS REGISTRY

### 6.1 Locally Loaded (from /mnt/skills/)
| Skill | Purpose |
|---|---|
| frontend-design | Component patterns, design tokens, UI code |
| docx | Word document creation |
| pdf | PDF creation and manipulation |
| pptx | Presentation creation |
| xlsx | Spreadsheet creation |
| canvas-design | Visual art / poster / design in PNG/PDF |
| web-artifacts-builder | Multi-component HTML artifacts |
| brand-guidelines | Anthropic brand application |
| mcp-builder | MCP server creation |
| doc-coauthoring | Structured documentation co-authoring |
| theme-factory | Theming artifacts (10 preset themes) |
| internal-comms | Internal communication formats |
| slack-gif-creator | Animated GIFs for Slack |
| algorithmic-art | Generative / algorithmic art |
| skill-creator | Creating and optimising new skills |
| firecrawl-cli | Firecrawl web scraping integration |
| file-reading | Reading uploaded files by type |
| pdf-reading | Extracting content from PDFs |
| product-self-knowledge | Anthropic product facts (always verify) |

### 6.2 Incorporated from skills.sh

**Design Excellence**
| Skill | Source | Key Capability |
|---|---|---|
| ui-ux-pro-max | nextlevelbuilder | 50+ styles, 161 palettes, 99 UX rules, 10 stacks |
| high-end-visual-design | leonxlnx/taste-skill | Agency-tier motion, Double-Bezel, Variance Engine |
| sleek-design-mobile-apps | sleekdotdesign | Mobile-first premium app patterns |
| design-taste-frontend | leonxlnx/taste-skill | Premium frontend taste guidelines |

**Quality / Impeccable**
| Skill | Source | Key Capability |
|---|---|---|
| polish | pbakaus/impeccable | Final quality pass checklist |
| critique | pbakaus/impeccable | Design critique framework |
| audit | pbakaus/impeccable | Full design/code audit |
| optimize | pbakaus/impeccable | Performance + quality optimisation |
| clarify | pbakaus/impeccable | Clarifying ambiguous requirements |
| adapt | pbakaus/impeccable | Adapting designs to new constraints |

**Strategy / Superpowers**
| Skill | Source | Key Capability |
|---|---|---|
| brainstorming | obra/superpowers | Structured design dialogue → spec before build |
| writing-plans | obra/superpowers | Implementation roadmap creation |
| executing-plans | obra/superpowers | Plan execution protocol |
| subagent-driven-development | obra/superpowers | Parallel AI agent orchestration |

**Marketing Suite**
| Skill | Source | Key Capability |
|---|---|---|
| copywriting | coreyhaines31 | Conversion copy for pages/CTAs |
| content-strategy | coreyhaines31 | Content planning and strategy |
| social-content | coreyhaines31 | Social media content |
| launch-strategy | coreyhaines31 | Product launch planning |
| seo-audit | coreyhaines31 | SEO audit and recommendations |
| competitor-alternatives | coreyhaines31 | Competitor research and positioning |
| pricing-strategy | coreyhaines31 | Pricing page and strategy |

---

## 7. TECH STACK — RAM'S ENVIRONMENT

### 7.1 Machine & Dev Setup
| Item | Detail |
|---|---|
| Machine | Apple Silicon Mac (M-series) |
| Shell | Zsh (~/.zprofile) |
| Package Manager | Homebrew at /opt/homebrew/bin/brew |
| Version Control | Git (Apple Git) + GitHub |
| Tools | Desktop Commander (sudo blocked — run sudo manually in Terminal) |
| Philosophy | No-code / low-code where possible; agent-driven execution |

### 7.2 Preferred Tech Stack
| Category | Tools |
|---|---|
| Database | Convex DB, Supabase |
| Auth | Convex Auth, Better Auth, Clerk |
| Frontend | Next.js, TypeScript, Tailwind CSS, Motion (Framer), Lottie Files |
| Mobile | Expo (React Native) |
| UI Libraries | shadcn/ui, Tweakcn, Kokonut UI, Aceternity UI, 21st.dev |
| CMS | Payload CMS (https://github.com/payloadcms/payload) |
| Email | Resend, Loops |
| Payments | Stripe, Polar, Dodo, Razorpay |
| Git & Deploy | GitHub + Vercel |
| SEO / Blog | Neuron Writer |
| 2nd Brain | Obsidian |
| .md Files | Obsidian, Bear |
| Text to Markdown | microsoft/markitdown (Git repo + MCP server) |
| Audio/Video/Photo AI | Higgsfield AI, Kittl |
| Speech (STT/TTS) | Wispr Flow, ElevenLabs; Open-source alternative: OpenBMB/VoxCPM |
| AI Avatar | HeyGen AI |
| Marketing Channels | App Store, X (Twitter), YouTube, Instagram, Facebook |
| Social Scheduling | Postbridge, Postiz |
| Influencer Marketing | Postedapp |
| Managed Agents Platform | multica-ai/multica, Paperclip |

---

## 7.3 Specialist Skills & Agent Tools

| Tool / Skill | Source | Purpose |
|---|---|---|
| **Andrej Karpathy Skills** | forrestchang/andrej-karpathy-skills | Goal-driven execution: surgical changes, simplicity first, think before coding — applied to all dev work |
| **Claude Code Memory** | thedotmack/claude-mem (claude-mem.ai) | Persistent memory layer for Claude Code sessions |
| **Kronos** | shiyu-coder/kronos | Financial insight, research and forecasting |
| **Hermes Agent** | NousResearch/hermes-agent | Alternate AI agent for complex reasoning tasks |
| **G-Stack / YC Best Practices** | garrytan/gstack | YCombinator best practices for product and company building |

### 7.3.1 Andrej Karpathy Principles (Applied to All Dev Work)
These principles govern how code is approached — always:
- **Think before coding** — reason through the problem fully before writing a single line
- **Surgical changes** — make the smallest possible change that solves the problem
- **Simplicity first** — the simplest correct solution wins over the clever one
- **Goal-driven execution** — every action maps to a defined goal; no speculative work
- **No premature optimisation** — make it work, make it right, then make it fast

### 7.3.2 YCombinator Best Practices (garrytan/gstack)
Applied to product, company, and growth decisions:
- Build something people want — validate before building
- Talk to users constantly — assumptions must be user-verified
- Do things that don't scale first
- Default alive: revenue > burn at all times
- Speed matters — ship fast, iterate faster

---

## 8. RESOLVED CONFLICTS LOG

| # | Conflict | Resolution | Date |
|---|---|---|---|
| A | Gradients in premium design | Allowed on backgrounds only; banned on cards/buttons/text/UI elements | 2026-04-20 |
| B | Font stack | Banned list adopted; Ram approves per project from mono + premium pool; Inter and Helvetica reinstated as acceptable alongside mono stack; Roboto/Arial/Open Sans still banned | 2026-04-20 |
| C | Spec/design doc path | docs/specs/YYYY-MM-DD-Topic.md (Ram's folder structure) | 2026-04-20 |
| D | Horizontal scroll | Updated: allowed on mobile for specific layout patterns; must propose and confirm before using | 2026-04-20 |
| E | Button rounding | Updated: ask Ram for rounding preference per design/theme; do not default to pill | 2026-04-20 |

---

## 9. PRINCIPLES & NORTH STAR

- Think AI-first — agents over manual processes in all architecture decisions
- Security: White hat only, best practices always
- Every decision: "Would this work in a 1-person AI-first $1B company in 2026?"
- Every design: "Does this pass Dieter Rams' 10 principles?"
- Every interaction: "Does it just work?"
- This file must be updated whenever a new protocol is agreed or a conflict is resolved



#Octopuss

---
node_id: "spec-ai-literacy-hub"
type: design
title: "Spec: AI Literacy Hub"
created: 2026-04-30
updated: 2026-05-10
status: draft
category: design
tags: [literacy-hub, content, spec]
author: "tim.wulin@gmail.com"
summary: >
  Opinionated, single-contributor literacy hub for non-engineering teammates,
  industry friends, and mentees. Tech- and product-agnostic. Authored in
  Obsidian, deployable to Quartz when ready. Adjacent to the engineering
  harness, not part of it.
---

# Spec: AI Literacy Hub

## Problem

Non-engineering people working alongside AI tools daily — designers, PMs, ops, customer success, students, industry friends — produce AI slop because they lack the mental models and habits that turn LLM output into work they can defend. The engineering harness solves the parallel problem for engineers via mechanical enforcement. No equivalent exists for non-engineers. The gap is filled poorly today by vendor docs (capability-focused, not responsibility-focused) and generic "AI for business" content (low-density, fast-dating).

## Goals

- **Skill floor**: someone reading the hub stops producing slop. Their prompts get more careful; their outputs get reviewed.
- **Judgment**: someone reading the hub reaches for the right tool for a task and recognizes when AI is the wrong tool.
- **Trust**: when a hub reader hands me an AI-generated artifact, I can trust they engaged with it.

## Non-goals

- Teaching non-engineers to code or build agents.
- Comprehensive coverage of every model, tool, and technique. The hub is opinionated and curates carefully.
- Public-facing content marketing. The hub is private-by-default; eventual publication is a separate decision.
- Replacing Anthropic / OpenAI / Karpathy / Mollick / Willison primary sources. The hub pulls these together and links out; it does not try to be the canonical reference.

## Audience

10–20 people: industry friends, co-workers, new teammates, mentees. Mix of design, product, ops, customer success, and students. Assumes basic computer literacy and existing exposure to ChatGPT or Claude. Does not assume programming background, technical curiosity, or familiarity with any AI-specific terminology beyond chatbot-level usage.

## Authoring constraints

### Tone: friendly textbook

The reader is an adult who has used ChatGPT a few times but does not work in tech. Write the way you would explain something to a smart friend who asked a sincere question. Full sentences, not telegrams. Use a familiar analogy when one genuinely clarifies the idea; do not force one when plain words are enough.

### The 14-year-old test

Read each paragraph aloud and ask: would a curious 14-year-old follow this without stopping to look up a word? If no, rewrite it. Use technical terms when they are the right name for the thing — but introduce each one in the sentence that uses it.

### Banlist

The following words and phrases were found in the current pages and are banned outright. The right column gives plain-language replacements; the page may need a sentence-level rewrite, not just a word swap.

| Banned | Use instead |
|---|---|
| load-bearing | "the most important", "the one this builds on" |
| calibrate / calibrates / calibrated against | "compare against", "judge against" |
| aggressively (cross-link / curate) | "often", "a lot", "carefully" |
| downstream of | "follows from", "builds on", "depends on" |
| off-ramp | "the way out", "when to stop and switch" |
| the corrective | "the fix", "what to do instead" |
| category error | "mistake", "wrong tool for the job" |
| audit posture | "the way you read your own work" |
| the spine of (the hub) | "the main page", "the page everything else builds on" |
| instantiated (X ways) | "shown as", "four examples of" |
| synthesize / synthesis | "combine", "pull together" |
| lossy patterns | "fuzzy patterns", "rough shapes" |
| register (as a noun, meaning tone) | "tone", "style" |
| compounds (the cost compounds) | "adds up", "gets worse over time" |
| the giveaway | "the sign", "how you can tell" |
| pre-empt | "head off", "avoid in advance" |
| roam (the graph is self-directed; readers roam) | "explore", "follow whatever interests you" |

The existing bans on *essentially*, *basically*, *robust*, and *seamless* stay.

### Introduce, don't assume

When a page uses a word the audience may not know — *token, prompt, agent, context window* — define it on first use in plain language, even if another page also defines it. Pages are read out of order. A first-use definition costs a sentence and saves the reader from bouncing between pages.

### What stays from the current voice

- Default to second-person ("you", "the reader") and third-person ("the prompter", "the artifact"). First-person sparingly, only where personal experience is the substance.
- Frame openings with rhetorical questions or direct claims, not thesis statements. No *"In this section, I'll explain…"*.
- Express uncertainty through scoped claims ("for non-engineers", "in most cases"), not hedges ("I think", "it might be").
- Honest about limitations. State what the hub does not cover.
- No condescension. The audience is non-technical, not unintelligent. *Simply, just, all you have to do* are still out.
- No fearmongering. The MIT cognition study cap (2 across the hub) stays.
- No tool tribalism. Same as today.

### Density

- **Word target per page: 800–1500 words.** The friendly-textbook tone needs more sentences, not fewer.
- **Visual rhythm rules stay.** Every page leans on at least two of the following per ~600 words: a table, a code-block-style structural element, a bulleted list with concrete items, an Excalidraw diagram, or a blockquote highlighting a single important claim or test. Prose carries the argument; visuals carry the structure.
- **A page over 1800 words is suspect.** Either the topic should split, or the prose is doing work a visual could do better.

### Structure per page

- **Frontmatter**: `title`, `created`, `updated`, `status` (`draft` | `active` | `golden-example` | `archived`), `tags` (lowercase, hyphenated).
- **Opening (1 paragraph)**: state the question or claim. Do not preview. Do not roadmap.
- **Body**: section headers describing the topic, not the rhetorical move. ("How prompts produce slop" — yes. "Let's now examine prompts" — no.)
- **Ending**: stop after the last substantive point. A one-line forward link to related pages is fine. No summary conclusion.
- **Footer**: italicized line with `[Related]` wikilinks to ≤3 adjacent pages.

### Anti-patterns

Same set as the engineering writing-style guide, with one addition specific to literacy content:

- No condescension. The audience is non-technical, not unintelligent. "Simply", "just", "all you have to do" are out.
- No fearmongering. The MIT cognition study is empirical anchor, not scare tactic. Cite once or twice across the hub, not on every page.
- No tool tribalism. Claude / ChatGPT / Gemini / Copilot all have legitimate use cases. Opinions about which to reach for live in Section 4 with reasoning, not as drive-by claims elsewhere.

### Citations

- MIT cognition study (*Your Brain on ChatGPT*, 2025): hard cap of 2 across the hub. Anti-fearmongering rule. Tracker: `_meta/citation-tracker.md`.
- Other empirical or argumentative sources (Karpathy, Willison, Mollick, Mitchell, Anthropic, OpenAI, et al.): no cap. Cite when the source carries the argument; combine and reframe in hub voice (authoring rule 2).
- Attribution standard: important claims that originate with a named source get the source named on first use within a section. Subsequent reuse in the same section can rely on the earlier attribution.
- No drive-by citations. If a citation does not change what the reader should believe or do, drop it.

## Hub structure

Four logical sections, plus three cross-cutting pages. Self-directed graph navigation; a "Start here" page surfaces a recommended order for readers who want hand-holding.

### Section 1 — What LLMs are and aren't

Foundation. Builds the mental models that make slop-aversion possible.

| Page | Purpose |
|---|---|
| `what-llms-are.md` | Mental model: LLMs as next-token predictors trained on text. The "calculator for words" framing. |
| `what-llms-arent.md` | Not search engines. Not databases. Not reasoners in the classical sense. Why this matters for everyday use. |
| `why-they-hallucinate.md` | Why fabrication is a feature of how the model works, not a bug to be patched. |
| `what-theyre-good-and-bad-at.md` | Honest list. Updated as models change. |

### Section 2 — How to actually talk to them

Prompting as thinking, not magic.

| Page | Purpose |
|---|---|
| `prompt-as-thinking.md` | The prompt is a draft of the answer. Why one-sentence prompts produce one-sentence-quality work. |
| `the-intern-frame.md` | Treating AI like a tireless intern: what to spell out, what to assume, when to push back. (Mollick's framing, reframed.) |
| `iterating-on-prompts.md` | The first prompt is rarely the right prompt. Editing the prompt is editing your own thinking. |
| `reading-the-output.md` | How to read AI output the way you'd read a colleague's draft — looking for weak spots that are *plausible*. |

### Section 3 — Context engineering for laypeople

What context is, why it matters, how to manage it.

| Page | Purpose |
|---|---|
| `what-is-context.md` | The context window as RAM. Anything outside the window doesn't exist to the model. |
| `chats-vs-projects.md` | When to start a new chat. When to use a Claude Project or custom GPT. The difference and why it matters. |
| `feeding-the-model.md` | How to give the model enough to do the work without dumping everything in. Concrete examples. |
| `memory-and-state.md` | How "memory" features actually work (and don't). What persists, what doesn't, what to assume. |

### Section 4 — Building your own workflows

Where the hub stops being curriculum and becomes opinionated tooling guidance.

| Page | Purpose |
|---|---|
| `which-tool-when.md` | Claude vs. ChatGPT vs. Gemini vs. Copilot. Decision matrix scoped to common non-engineering tasks. |
| `chatbot-vs-agent.md` | Mitchell's distinction reframed for non-engineers. When the chat interface is enough, when it's not. |
| `personal-workflows.md` | Worked examples: research, writing, summarizing, planning. What the prompt + context + output cycle looks like for each. |
| `when-workflows-graduate.md` | The bridge to engineering harness. One paragraph framing, link out, done. |

### Cross-cutting pages

| Page | Purpose |
|---|---|
| `how-not-to-produce-ai-slop.md` | **Golden example.** The main page everything else builds on. Linked from most other pages. |
| `start-here.md` | Recommended reading order for readers who want hand-holding. Otherwise the graph is self-directed. |
| `curated-links.md` | High-value external sources, each with a one-sentence "why this is worth your time." |

### Curated links — initial set

Vendor docs:
- Anthropic: prompt engineering guide; "Building effective agents" essay.
- OpenAI: prompting guide; practices for governing agentic AI systems.

Industry voices (durable):
- Andrej Karpathy — "LLM as a new kind of OS" Stanford talk; "context window as RAM" framings.
- Simon Willison — practical reality of LLMs; prompt injection writing; "calculator for words" framing.
- Ethan Mollick — *One Useful Thing*; co-intelligence; the intern frame.
- Mitchell Hashimoto — *My AI Adoption Journey* (drop-the-chatbot; harness engineering as habit).
- Martin Fowler / Birgitta Böckeler — *Harness engineering for coding agent users* (linked from `when-workflows-graduate.md` only; too technical for the main path).

Empirical anchor:
- MIT Media Lab — *Your Brain on ChatGPT* (2025).

Each link gets a one-sentence note in `curated-links.md` explaining why it earns its slot. No dump.

## Visual conventions

- **Tables** for comparisons, before/after, decision matrices. Default for any "X vs Y" content.
- **Code blocks** (monospace) for prompt templates, process flows, and structured mental models — even when not actual code. The visual cue says "this is structural, not narrative."
- **Blockquotes** for a single important claim or test that should slow the reader down.
- **Excalidraw diagrams** for conceptual mental models. Live in the vault under `assets/excalidraw/`. Embed via Obsidian-native syntax. Targets:
  - Section 1: "context window" diagram, "what the model sees vs. what you see" diagram.
  - Section 3: chat-vs-project state model, context-management flow.
  - Section 4: tool-selection decision tree.

No Canva. Excalidraw matches the Obsidian-native flow and stays editable in source.

## Hub repository layout

```
ai-literacy-hub/
├── README.md                              # What this is, who it's for, slop-aversion thesis
├── start-here.md                          # Recommended reading order
├── how-not-to-produce-ai-slop.md          # Golden example, spine of hub
├── curated-links.md
├── _drafts/                               # gitignored
├── assets/
│   └── excalidraw/
├── 1-what-llms-are-and-arent/
│   ├── what-llms-are.md
│   ├── what-llms-arent.md
│   ├── why-they-hallucinate.md
│   └── what-theyre-good-and-bad-at.md
├── 2-how-to-talk-to-them/
│   ├── prompt-as-thinking.md
│   ├── the-intern-frame.md
│   ├── iterating-on-prompts.md
│   └── reading-the-output.md
├── 3-context-engineering/
│   ├── what-is-context.md
│   ├── chats-vs-projects.md
│   ├── feeding-the-model.md
│   └── memory-and-state.md
└── 4-building-workflows/
    ├── which-tool-when.md
    ├── chatbot-vs-agent.md
    ├── personal-workflows.md
    └── when-workflows-graduate.md
```

15 main pages + 3 cross-cutting + README.

## Authoring rules for execution

The executing agent must:

1. **Read the golden example first** (`how-not-to-produce-ai-slop.md`) and match its tone, density, and visual rhythm.
2. **Read all five curated industry sources** before drafting any Section 1 or 2 page. Combine and pull together, do not paraphrase. Reframe in hub voice.
3. **Draft one page at a time.** No batch generation. Each page is reviewed by the human before the next is started.
4. **Use the writing-style-guide skill** for sentence-level rules. Bend the first-person default per the voice rules above.
5. **Cite the MIT cognition study at most twice across the hub.** Track citations in a running note.
6. **No section may exceed 4 paragraphs of continuous prose** without a visual break (table, list, blockquote, code block, diagram).
7. **`when-workflows-graduate.md` is one paragraph plus one external link** to the engineering harness. Do not expand.
8. **Cross-link often within sections, sparingly across sections.** Use Obsidian wikilinks. Run a link-resolution check before declaring a page done.

## Out of scope for v1

- Quartz deployment. Author in Obsidian; Quartz comes after the content stabilizes.
- Public publication. The hub is private-by-default. Hand the vault folder to readers individually.
- Contribution model. Single-contributor for now. Revisit if external interest materializes.
- Mechanical enforcement / linters. The hub is prose; the discipline is editorial, not mechanical.
- Versioning. Pages carry `created` / `updated` dates; that's enough.

## Open questions

- [ ] Should `start-here.md` be a single linear path, or three paths by audience (designer / PM / ops)? Lean: single path for v1, observe whether readers diverge.
- [ ] Where does "AI in everyday life vs. AI at work" sit? Currently absent. Lean: defer; the hub is work-shaped and the personal-life angle dilutes focus.
- [ ] Frequency of refresh? Models change; durable habits don't. Lean: sections 1–3 are stable; Section 4 needs quarterly check-ins.

## Rollout

1. Land this spec.
2. Land the golden example (`how-not-to-produce-ai-slop.md`) at the vault root.
3. Executing agent drafts pages in this order: `what-llms-are.md`, `prompt-as-thinking.md`, `what-is-context.md`, `which-tool-when.md` — one foundational page per section first to validate the voice and density across topic types. Pause for human review after each.
4. After all four foundational pages land, batch-draft the remaining 11 pages, still one at a time, still with review after each.
5. Build `start-here.md` and `curated-links.md` last, when the page network is stable enough to recommend a path.
6. Quartz deployment is a separate spec, not part of this one.

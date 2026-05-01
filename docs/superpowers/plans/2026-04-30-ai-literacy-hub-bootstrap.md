# AI Literacy Hub Bootstrap Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Bootstrap the AI Literacy Hub vault: 16 content pages + 3 cross-cutting pages + README + 5 Excalidraw diagrams, all matching the voice, density, and structure of the golden example (`how-not-to-produce-ai-slop.md`).

**Architecture:** Content-first project — no code shipped. "Tasks" are pages or diagrams; "tests" are editorial review checklists run against the universal review criteria and the golden example. Review checkpoints sit between every page (single-pause model from the spec's rollout) and between phases. The four foundational pages (one per section) ship first to calibrate voice across topic types before scaling out.

**Tech Stack:** Markdown (Obsidian-flavored, wikilinks), YAML frontmatter, Excalidraw MCP for diagrams, PNG embeds in `assets/excalidraw/`.

---

## Operating Principles

These apply to every page-writing task. Do not skip them when iterating.

1. **The golden example is law.** Re-read `how-not-to-produce-ai-slop.md` immediately before drafting any page. Voice/density/structure divergence from it means the draft is wrong, not the example.
2. **One page at a time.** No batch generation. Pause for human review after every page commit, even within a phase.
3. **Synthesize, do not paraphrase.** Section 1 and Section 2 pages require reading curated industry sources first; reframe in hub voice.
4. **Editorial discipline, not mechanical.** Self-review against the checklist before declaring a page done. The hub explicitly rejects linters.
5. **MIT citation budget: 2 across the entire hub.** Track every citation in `_meta/citation-tracker.md`. Refuse to cite if budget is exhausted.
6. **Cross-link aggressively within sections, sparingly across.** Verify every wikilink resolves before commit.

---

## File Structure

What gets created and what each file is responsible for:

```
ai-literacy-hub/
├── README.md                              # NEW. Hub purpose, audience, slop-aversion thesis. Short.
├── start-here.md                          # NEW. Recommended reading order. Built last.
├── how-not-to-produce-ai-slop.md          # EXISTS. Golden example. Do not modify.
├── spec-ai-literacy-hub.md                # EXISTS. Spec. Do not modify.
├── curated-links.md                       # NEW. External sources, one-sentence rationale each. Built last.
├── _meta/
│   ├── citation-tracker.md                # NEW. Running ledger of MIT-study citations. Hard cap: 2.
│   └── review-checklist.md                # NEW. Single-source-of-truth review criteria for all pages.
├── _drafts/                               # NEW. Gitignored. Scratch space.
├── assets/
│   └── excalidraw/                        # NEW. PNG exports + .excalidraw source files.
├── 1-what-llms-are-and-arent/
│   ├── what-llms-are.md                   # NEW. Foundational page (Phase 2).
│   ├── what-llms-arent.md                 # NEW. Phase 3.
│   ├── why-they-hallucinate.md            # NEW. Phase 3.
│   └── what-theyre-good-and-bad-at.md     # NEW. Phase 3.
├── 2-how-to-talk-to-them/
│   ├── prompt-as-thinking.md              # NEW. Foundational page (Phase 2).
│   ├── the-intern-frame.md                # NEW. Phase 4.
│   ├── iterating-on-prompts.md            # NEW. Phase 4.
│   └── reading-the-output.md              # NEW. Phase 4.
├── 3-context-engineering/
│   ├── what-is-context.md                 # NEW. Foundational page (Phase 2).
│   ├── chats-vs-projects.md               # NEW. Phase 5.
│   ├── feeding-the-model.md               # NEW. Phase 5.
│   └── memory-and-state.md                # NEW. Phase 5.
└── 4-building-workflows/
    ├── which-tool-when.md                 # NEW. Foundational page (Phase 2).
    ├── chatbot-vs-agent.md                # NEW. Phase 6.
    ├── personal-workflows.md              # NEW. Phase 6.
    └── when-workflows-graduate.md         # NEW. Phase 6. One paragraph + one external link only.
```

Diagrams (assets/excalidraw/), targets per spec:
- `context-window.png` — embedded in Section 1 pages.
- `model-sees-vs-you-see.png` — embedded in Section 1 pages.
- `chat-vs-project-state.png` — embedded in `chats-vs-projects.md`.
- `context-management-flow.png` — embedded in `feeding-the-model.md`.
- `tool-selection-decision-tree.png` — embedded in `which-tool-when.md`.

---

## Universal Review Checklist (the "test suite")

Every page must satisfy every applicable item before commit. This lives in `_meta/review-checklist.md` once created (Phase 1).

**Voice (calibrated against `how-not-to-produce-ai-slop.md`)**
- [ ] Standards-definition register, not personal-blog register.
- [ ] Second-person ("you", "the reader") and third-person ("the prompter", "the artifact") dominate. First-person rare and only where personal experience is the substance.
- [ ] Openings are rhetorical questions or direct claims. No "In this section, I'll explain…" or "This page covers…".
- [ ] Uncertainty expressed via scoped claims ("for non-engineers", "in most cases"). No hedges ("I think", "it might be").
- [ ] No filler words: `essentially`, `basically`, `simply`, `just`, `obviously`.
- [ ] No marketing voice: `robust`, `seamless`, `powerful`, `cutting-edge`.
- [ ] No condescension to non-technical readers.
- [ ] No fearmongering.
- [ ] No tool tribalism outside Section 4.

**Density**
- [ ] Word count between 600 and 900 (exception: `when-workflows-graduate.md`, which is one paragraph).
- [ ] At least two visual elements per ~600 words from this set: table, monospace structural block, bulleted list with concrete items, Excalidraw diagram, blockquote.
- [ ] No stretch of >4 paragraphs of continuous prose without a visual break.

**Structure**
- [ ] Frontmatter contains: `title`, `created`, `updated`, `status`, `tags`. Tags lowercase + hyphenated.
- [ ] Opening is a single paragraph stating the question or claim. No preview, no roadmap.
- [ ] Section headers describe the topic ("How prompts produce slop"), not the rhetorical move ("Let's now examine prompts").
- [ ] Page ends after the last substantive point. No summary conclusion.
- [ ] Footer is one italicized line of `[[Related]]` wikilinks, ≤3 entries.

**Hub integrity**
- [ ] MIT study citation budget honored (track in `_meta/citation-tracker.md`, hard cap 2).
- [ ] Wikilinks resolve to existing files or are intentionally forward-pointing (later in plan).
- [ ] Within-section cross-links present and aggressive; cross-section links rare.

---

## Phase 0: Repo Bootstrap

Creates the skeleton. No content yet.

### Task 0.1: Scaffold directories and meta files

**Files:**
- Create: `README.md`
- Create: `.gitignore`
- Create: `_meta/citation-tracker.md`
- Create: `_meta/review-checklist.md`
- Create: `_drafts/.gitkeep`
- Create: `assets/excalidraw/.gitkeep`
- Create: `1-what-llms-are-and-arent/.gitkeep`
- Create: `2-how-to-talk-to-them/.gitkeep`
- Create: `3-context-engineering/.gitkeep`
- Create: `4-building-workflows/.gitkeep`

- [ ] **Step 1: Create `.gitignore`**

```
_drafts/
.DS_Store
*.tmp
.obsidian/workspace*
.obsidian/cache
```

- [ ] **Step 2: Create `_meta/citation-tracker.md`**

```markdown
---
title: MIT Citation Tracker
created: 2026-04-30
updated: 2026-04-30
status: active
tags: [meta, tracker]
---

# MIT Citation Tracker

The MIT Media Lab *Your Brain on ChatGPT* (2025) study may be cited at most **twice** across the hub.

## Used citations

| # | Page | Section | Note |
|---|---|---|---|
| 1 | `how-not-to-produce-ai-slop.md` | "Why the distinction matters" | Empirical anchor for the slop-aversion thesis. |
| 2 | _open_ | _open_ | _open_ |

## Rule

If both rows are filled, no further citations are permitted. Refer to the study indirectly or omit.
```

- [ ] **Step 3: Create `_meta/review-checklist.md`**

Copy the "Universal Review Checklist" section from this plan verbatim into the file with appropriate frontmatter (`title: Review Checklist`, `status: active`, `tags: [meta, review]`).

- [ ] **Step 4: Create `README.md`**

Target: 200–350 words. Voice must match the golden example — this is the first thing a new reader sees.

Required content:
- One-paragraph framing: what the hub is, who it's for, the slop-aversion thesis.
- Audience boundary: assumes basic computer literacy, existing chatbot exposure, no programming background.
- Pointer to `start-here.md` (note: file does not yet exist; mark it as forthcoming or wikilink it forward — link will resolve once Phase 7 lands).
- Pointer to the golden example.
- Out-of-scope statement (no coding, no comprehensive coverage, private-by-default).

Do NOT include: roadmap of sections, marketing language, or "what you'll learn" lists.

- [ ] **Step 5: Create directory placeholders**

Each `.gitkeep` file is empty. They exist only so the empty directories are tracked.

- [ ] **Step 6: Self-review README against the universal checklist**

Run every applicable item in the checklist against the README. Fix anything that fails. The README is short, but every voice rule applies.

- [ ] **Step 7: Commit Phase 0**

```bash
git add .gitignore README.md _meta/ _drafts/ assets/ 1-what-llms-are-and-arent/ 2-how-to-talk-to-them/ 3-context-engineering/ 4-building-workflows/
git commit -m "chore: bootstrap ai-literacy-hub repo structure"
```

- [ ] **Step 8: PAUSE for human review**

Human reviews: README voice, citation tracker setup, directory layout. Do not proceed to Phase 1 until approved.

---

## Phase 1: Voice Calibration & Source Research

No pages drafted yet. This phase loads the executing agent with the voice register and primary-source synthesis it will need for Sections 1 and 2.

### Task 1.1: Internalize the golden example

**Files:**
- Read: `how-not-to-produce-ai-slop.md`

- [ ] **Step 1: Re-read the golden example end to end.**

- [ ] **Step 2: Note specific patterns in `_drafts/voice-notes.md`**

Capture concrete observations such as:
- Sentence-length rhythm (mix of short declarative + medium qualifying).
- How tables are introduced (no preamble; presented as the structural element).
- How monospace blocks carry process flows that prose would dilute.
- The blockquote on line 97 isolating the load-bearing test.
- The italicized `*Related: …*` footer pattern.

Keep the file under 200 words. Reference it before drafting any page.

### Task 1.2: Synthesize curated industry sources

**Files:**
- Create: `_drafts/source-notes.md` (gitignored — internal scratchpad)

For each source below, extract the load-bearing ideas the hub will reuse. Synthesize, do not paraphrase. Reframe in hub voice when transferring to pages.

- [ ] **Step 1: Anthropic prompt engineering guide + "Building effective agents"**

Note the durable claims worth carrying forward (e.g., specificity beats verbosity, examples > rules, the chatbot/agent distinction Anthropic uses). Do not copy phrasing.

- [ ] **Step 2: OpenAI prompting guide + practices for governing agentic AI**

Note where it diverges from Anthropic's framing. Capture two or three durable points.

- [ ] **Step 3: Karpathy — "LLM as a new kind of OS" + context-window-as-RAM framings**

This is the load-bearing source for Section 3. Extract the OS analogy precisely.

- [ ] **Step 4: Simon Willison — "calculator for words", prompt injection writing, practical-reality posts**

This is the load-bearing source for Section 1's "what LLMs are" framing.

- [ ] **Step 5: Ethan Mollick — *One Useful Thing*, the intern frame**

This is the load-bearing source for `the-intern-frame.md` and parts of Section 2.

- [ ] **Step 6: Mitchell Hashimoto — *My AI Adoption Journey***

The drop-the-chatbot framing carries Section 4. Capture his specific rationale.

- [ ] **Step 7: Commit Phase 1 prep notes (skip if gitignored)**

Source notes live under `_drafts/` (gitignored). No commit needed for this task. If voice notes were saved outside `_drafts/`, commit them.

- [ ] **Step 8: PAUSE for human review**

Confirm the agent has internalized the voice + source material before any page is drafted.

---

## Phase 2: Foundational Pages (One Per Section)

Per spec rollout step 3: draft one page per section to validate voice and density across topic types before scaling. Pause for human review after each page.

Order per spec:
1. `what-llms-are.md`
2. `prompt-as-thinking.md`
3. `what-is-context.md`
4. `which-tool-when.md`

The page-task pattern below is identical for every page in Phases 2–6. Steps are written out in full for Task 2.1; subsequent page tasks reference this pattern but list page-specific specifics (topic, required visuals, source dependencies).

### Task 2.1: Draft `what-llms-are.md` (Section 1 foundation)

**Files:**
- Create: `1-what-llms-are-and-arent/what-llms-are.md`
- Reference: `how-not-to-produce-ai-slop.md`, `_drafts/source-notes.md` (Karpathy, Willison entries), `_meta/review-checklist.md`

**Page-specific brief:**
- Mental model: LLMs as next-token predictors trained on text. The "calculator for words" framing (Willison).
- The OS analogy can hint forward to Section 3 but must not preempt it.
- Required visuals (≥2 per ~600 words):
  - One table or monospace structural block illustrating the next-token process.
  - One bulleted list of concrete consequences of "next-token predictor" (e.g., why it can be eloquent without being correct).
  - Optionally embed `context-window.png` once that diagram exists in Phase 3 (forward link in this draft if the diagram lands later).

- [ ] **Step 1: Re-read the golden example.**

- [ ] **Step 2: Re-read `_drafts/voice-notes.md` and the relevant entries in `_drafts/source-notes.md`.**

- [ ] **Step 3: Outline the page in `_drafts/what-llms-are.outline.md`**

```
Frontmatter
Opening (1 paragraph, claim or question)
## Section header (topic-named)
[visual element]
prose (≤4 paragraphs before next visual)
## Section header
...
*Related: [[...]] · [[...]]*
```

Confirm visual count: at least two non-prose elements per ~600 words.

- [ ] **Step 4: Draft the page**

Frontmatter:

```yaml
---
title: What LLMs are
created: 2026-04-30
updated: 2026-04-30
status: draft
tags: [foundations, mental-models]
---
```

Write 600–900 words. No filler. No marketing voice. Stop after the last substantive point.

- [ ] **Step 5: Self-review against `_meta/review-checklist.md`**

Walk every checklist item. Fix every fail. Do not declare done with open items.

- [ ] **Step 6: Word count and density check**

Run `wc -w 1-what-llms-are-and-arent/what-llms-are.md`. If <600 or >900, revise. Count visuals (tables, monospace blocks, bulleted lists, blockquotes, embeds): minimum 2 per ~600 words.

- [ ] **Step 7: Wikilink audit**

For every `[[…]]` in the page, verify the target file exists OR is intentionally forward-pointing (will land later in plan). Forward links are acceptable; broken links to never-planned pages are not.

- [ ] **Step 8: Citation tracker check**

If the MIT study is cited, increment `_meta/citation-tracker.md`. If the budget is full (2 used), refuse the citation and revise.

- [ ] **Step 9: Commit**

```bash
git add 1-what-llms-are-and-arent/what-llms-are.md _meta/citation-tracker.md
git commit -m "docs(section-1): add foundational page — what LLMs are"
```

- [ ] **Step 10: PAUSE for human review**

The human compares this page side-by-side with `how-not-to-produce-ai-slop.md`. Specifically:
- Does the voice register match?
- Does the density rhythm match (visual breaks at the right cadence)?
- Does the opening land as a claim/question, not a preview?
- Are there any condescending or marketing words that slipped in?

Do not start Task 2.2 until human approves.

### Task 2.2: Draft `prompt-as-thinking.md` (Section 2 foundation)

**Files:**
- Create: `2-how-to-talk-to-them/prompt-as-thinking.md`
- Reference: `how-not-to-produce-ai-slop.md`, `_drafts/source-notes.md` (Mollick, Anthropic, Willison entries), `_meta/review-checklist.md`

**Page-specific brief:**
- Thesis: the prompt is a draft of the answer. One-sentence prompts produce one-sentence-quality work.
- Cross-link target: `how-not-to-produce-ai-slop.md` (the "How prompts produce slop" section is adjacent).
- Required visuals:
  - One table contrasting prompt shapes and the outputs they produce (vague vs. scoped).
  - One monospace block showing a "before / after" prompt rewrite, OR a structural template.
- Optional: blockquote highlighting the load-bearing test ("Could the prompt have been written by someone who'd already thought about the answer?").

Follow the **page-task pattern** from Task 2.1, Steps 1–10. Page-specific frontmatter:

```yaml
---
title: The prompt is a draft of the answer
created: 2026-04-30
updated: 2026-04-30
status: draft
tags: [prompting, mental-models]
---
```

Commit message: `docs(section-2): add foundational page — prompt as thinking`.

PAUSE for human review after commit.

### Task 2.3: Draft `what-is-context.md` (Section 3 foundation)

**Files:**
- Create: `3-context-engineering/what-is-context.md`
- Reference: `how-not-to-produce-ai-slop.md`, `_drafts/source-notes.md` (Karpathy entry), `_meta/review-checklist.md`

**Page-specific brief:**
- Thesis: the context window as RAM (Karpathy framing). Anything outside the window does not exist to the model.
- Required visuals:
  - One table or monospace block illustrating "what's in context" vs. "what's not".
  - One bulleted list of concrete consequences (no memory between chats by default, why pasted documents matter, why long chats degrade).
- Forward link allowed: `chats-vs-projects.md`, `feeding-the-model.md`, `memory-and-state.md` (Section 3 siblings, all forthcoming).

Follow the page-task pattern from Task 2.1, Steps 1–10. Page-specific frontmatter:

```yaml
---
title: What context is
created: 2026-04-30
updated: 2026-04-30
status: draft
tags: [context-engineering, mental-models]
---
```

Commit message: `docs(section-3): add foundational page — what is context`.

PAUSE for human review after commit.

### Task 2.4: Draft `which-tool-when.md` (Section 4 foundation)

**Files:**
- Create: `4-building-workflows/which-tool-when.md`
- Reference: `how-not-to-produce-ai-slop.md`, `_drafts/source-notes.md` (Mitchell entry), `_meta/review-checklist.md`

**Page-specific brief:**
- Thesis: a decision matrix for non-engineering tasks across Claude / ChatGPT / Gemini / Copilot.
- Section 4 is the only section where opinions about tool choice live; reasoning must be explicit (not drive-by).
- Required visuals:
  - One decision matrix table (rows = task types: research, writing, summarizing, planning, etc.; columns = tools; cells = recommendation + one-clause why).
  - Forward link allowed: `tool-selection-decision-tree.png` (will be added in Phase 6).
- This page is also the home for `tool-selection-decision-tree.png` once it lands. Leave a placeholder location near the top of the page for the embed (commented or marked clearly).

Follow the page-task pattern from Task 2.1, Steps 1–10. Page-specific frontmatter:

```yaml
---
title: Which tool when
created: 2026-04-30
updated: 2026-04-30
status: draft
tags: [tools, workflows, decisions]
---
```

Commit message: `docs(section-4): add foundational page — which tool when`.

PAUSE for human review after commit.

### Task 2.5: Phase 2 retrospective review

After all four foundational pages land and are individually approved, run a cross-page review.

- [ ] **Step 1: Open all four foundational pages side-by-side.**

- [ ] **Step 2: Voice consistency check across pages**

Do they feel like the same author? Same register? Same density rhythm? If one page reads like a different voice, identify the specific divergence and revise it before scaling out.

- [ ] **Step 3: Cross-link sanity**

The four foundational pages should already cross-link to one another sparingly (one link to a sibling-section foundational page is plenty). Verify the within-section forward links to siblings (e.g., `prompt-as-thinking.md` linking to `iterating-on-prompts.md`) are present and forward-resolve.

- [ ] **Step 4: PAUSE for human review of the foundation set as a whole.**

The human can stop the rollout here if voice has not stabilized. Do not enter Phase 3 until the foundation set is endorsed as the voice baseline for the rest of the hub.

---

## Phase 3: Section 1 Completion + Diagrams

Drafts the three remaining Section 1 pages, then produces the two Section 1 Excalidraw diagrams. Pages may forward-link to diagrams; diagrams are then created and embedded retroactively at the end of the phase.

### Task 3.1: Draft `what-llms-arent.md`

**Files:**
- Create: `1-what-llms-are-and-arent/what-llms-arent.md`

**Page-specific brief:**
- Topic: not search engines, not databases, not classical reasoners. Why this matters for everyday use.
- Required visuals:
  - One comparison table: "Looks like X / Actually Y" (e.g., "Looks like a search engine / Actually a probability machine over training data").
  - One bulleted list of concrete misuses that follow from each conflation.
- Strong cross-link target within section: `what-llms-are.md`.

Follow the page-task pattern from Task 2.1, Steps 1–10. Frontmatter `tags: [foundations, mental-models]`. Commit: `docs(section-1): add what-llms-arent`. PAUSE for review after commit.

### Task 3.2: Draft `why-they-hallucinate.md`

**Files:**
- Create: `1-what-llms-are-and-arent/why-they-hallucinate.md`

**Page-specific brief:**
- Topic: why fabrication is a feature of how the model works, not a bug to patch.
- Required visuals:
  - One monospace structural block walking through the next-token mechanism producing a confident-but-wrong claim.
  - One bulleted list of practical consequences for the reader (verify citations, dates, names, code).
- Anti-pattern alert: easy to slip into condescension here. Audit Step 5 carefully.

Follow Task 2.1 pattern. Frontmatter `tags: [foundations, hallucination, mental-models]`. Commit: `docs(section-1): add why-they-hallucinate`. PAUSE for review.

### Task 3.3: Draft `what-theyre-good-and-bad-at.md`

**Files:**
- Create: `1-what-llms-are-and-arent/what-theyre-good-and-bad-at.md`

**Page-specific brief:**
- Topic: honest, dated list. Acknowledge it ages quickly.
- Required visuals:
  - One two-column table: "Good at" / "Bad at", with concrete task examples in each cell, not abstractions.
  - Optionally a blockquote: "This list will age. Treat it as a snapshot."
- Frontmatter must include `updated` to make the dating obvious.

Follow Task 2.1 pattern. Frontmatter `tags: [foundations, capabilities]`. Commit: `docs(section-1): add what-theyre-good-and-bad-at`. PAUSE for review.

### Task 3.4: Create `context-window.png` Excalidraw diagram

**Files:**
- Create: `assets/excalidraw/context-window.png` (and `.excalidraw` source if exportable)

- [ ] **Step 1: Sketch the conceptual diagram on paper or in a draft note.**

The diagram should show: a fixed-size box ("the window"), tokens inside the box, tokens falling off when the box overflows. Annotate "what the model sees" inside the box; "doesn't exist to the model" outside.

- [ ] **Step 2: Use the Excalidraw MCP to construct the diagram**

```
mcp__excalidraw__clear_canvas
mcp__excalidraw__batch_create_elements (rectangles for the window, text for labels, arrows for flow)
mcp__excalidraw__describe_scene  # verify
```

Style notes:
- Plain rectangles, plain arrows. No gradients, no clip art.
- Monochrome or two-tone. Match the hub's standards-doc register.
- Labels in sentence case, not title case.

- [ ] **Step 3: Export to PNG**

```
mcp__excalidraw__export_to_image  # save to assets/excalidraw/context-window.png
```

- [ ] **Step 4: Embed in `what-llms-are.md` (or `what-is-context.md`, whichever fits the page argument better)**

Use Obsidian-style embed: `![[context-window.png]]` if the vault is Obsidian-rendered, or standard `![Context window diagram](../assets/excalidraw/context-window.png)` for portability. Match whichever convention the README sets.

- [ ] **Step 5: Re-run page checklist on the embedding page**

The embed counts as a visual element; recount density.

- [ ] **Step 6: Commit**

```bash
git add assets/excalidraw/context-window.png 1-what-llms-are-and-arent/<embedding-page>.md
git commit -m "docs(section-1): add context-window diagram"
```

- [ ] **Step 7: PAUSE for human review of the diagram clarity.**

### Task 3.5: Create `model-sees-vs-you-see.png` Excalidraw diagram

Same pattern as Task 3.4. The diagram contrasts what the user sees (rendered chat UI, formatted output) with what the model received (token sequence, system prompt, prior turns concatenated). Embed in `what-llms-arent.md` or `what-llms-are.md` — wherever it sharpens the page's argument most.

Commit: `docs(section-1): add model-sees-vs-you-see diagram`. PAUSE after.

### Task 3.6: Section 1 retrospective

- [ ] **Step 1: Read all four Section 1 pages in sequence.**

Are the cross-links within Section 1 aggressive (every page links to at least one sibling)? Are cross-section links rare (≤1 per page)? Are diagrams referenced from prose, not just dropped in?

- [ ] **Step 2: PAUSE for human review of Section 1 as a unit.**

---

## Phase 4: Section 2 Completion

No diagrams in this phase per spec. Three pages.

### Task 4.1: Draft `the-intern-frame.md`

**Files:**
- Create: `2-how-to-talk-to-them/the-intern-frame.md`

**Page-specific brief:**
- Source: Mollick's intern frame, reframed in hub voice. Synthesize, do not paraphrase.
- Required visuals:
  - One table: "What you'd tell an intern / What you'd assume they know / What you'd push back on" — applied to AI.
  - One bulleted list of concrete behaviors that follow.
- Anti-pattern alert: condescension toward the AI ("just an intern") is not the framing. The frame is about *how the prompter behaves*.

Follow Task 2.1 pattern. Frontmatter `tags: [prompting, mental-models]`. Commit: `docs(section-2): add the-intern-frame`. PAUSE.

### Task 4.2: Draft `iterating-on-prompts.md`

**Files:**
- Create: `2-how-to-talk-to-them/iterating-on-prompts.md`

**Page-specific brief:**
- Topic: editing the prompt is editing your own thinking. The first prompt is rarely the right prompt.
- Required visuals:
  - One monospace block showing a 3-step prompt iteration on a real-feeling task.
  - One bulleted list of "iteration moves" (add a constraint, name the audience, ask for the inverse, etc.).

Follow Task 2.1 pattern. Frontmatter `tags: [prompting, iteration]`. Commit: `docs(section-2): add iterating-on-prompts`. PAUSE.

### Task 4.3: Draft `reading-the-output.md`

**Files:**
- Create: `2-how-to-talk-to-them/reading-the-output.md`

**Page-specific brief:**
- Topic: read AI output the way you'd read a colleague's draft — looking for plausible weak spots.
- Required visuals:
  - One table of "Output smells" (e.g., suspicious confidence, generic structure, missing specifics).
  - One blockquote isolating the load-bearing test (variant of the four engagement tests from the golden example, but specific to reading output).
- Strong cross-link to `how-not-to-produce-ai-slop.md` (the "Four tests for engagement" table is adjacent).

Follow Task 2.1 pattern. Frontmatter `tags: [reviewing, output]`. Commit: `docs(section-2): add reading-the-output`. PAUSE.

### Task 4.4: Section 2 retrospective

- [ ] **Step 1: Read all four Section 2 pages (foundational + three new).**

- [ ] **Step 2: Verify aggressive intra-section cross-linking.**

- [ ] **Step 3: PAUSE for human review of Section 2 as a unit.**

---

## Phase 5: Section 3 Completion + Diagrams

Three pages plus two diagrams.

### Task 5.1: Draft `chats-vs-projects.md`

**Files:**
- Create: `3-context-engineering/chats-vs-projects.md`

**Page-specific brief:**
- Topic: when to start a new chat. When to use a Claude Project or custom GPT. The difference and why it matters.
- Required visuals:
  - One decision table: "If your situation looks like X, reach for chat / project / new chat".
  - Forward link to `chat-vs-project-state.png` (Task 5.4) — leave a marked placeholder for embed.

Follow Task 2.1 pattern. Frontmatter `tags: [context-engineering, workflows]`. Commit: `docs(section-3): add chats-vs-projects`. PAUSE.

### Task 5.2: Draft `feeding-the-model.md`

**Files:**
- Create: `3-context-engineering/feeding-the-model.md`

**Page-specific brief:**
- Topic: how to give the model enough to do the work without dumping everything in.
- Required visuals:
  - One table contrasting "dump" vs. "scoped feed" (rows = task types).
  - One monospace block showing a structural template for a context-rich prompt.
  - Forward link to `context-management-flow.png` (Task 5.5) — leave a marked placeholder.

Follow Task 2.1 pattern. Frontmatter `tags: [context-engineering, prompting]`. Commit: `docs(section-3): add feeding-the-model`. PAUSE.

### Task 5.3: Draft `memory-and-state.md`

**Files:**
- Create: `3-context-engineering/memory-and-state.md`

**Page-specific brief:**
- Topic: how "memory" features actually work (and don't). What persists, what doesn't, what to assume.
- Required visuals:
  - One table per major tool: "What it stores / What it doesn't / Default assumption".
  - One bulleted list of failure modes ("memory" silently growing stale, leaking between projects, etc.).
- Anti-pattern alert: avoid tool tribalism; this is descriptive, not opinionated.

Follow Task 2.1 pattern. Frontmatter `tags: [context-engineering, memory]`. Commit: `docs(section-3): add memory-and-state`. PAUSE.

### Task 5.4: Create `chat-vs-project-state.png` Excalidraw diagram

**Files:**
- Create: `assets/excalidraw/chat-vs-project-state.png`
- Modify: `3-context-engineering/chats-vs-projects.md` (embed the diagram)

Diagram concept: two boxes side by side. "Chat" — labeled with what state lives where (window, no persistence, dies on new chat). "Project" — labeled with what persists (instructions, attached docs, memory) and what doesn't (chat history across threads).

Follow Task 3.4 pattern (Steps 1–7). Commit: `docs(section-3): add chat-vs-project-state diagram`. PAUSE.

### Task 5.5: Create `context-management-flow.png` Excalidraw diagram

**Files:**
- Create: `assets/excalidraw/context-management-flow.png`
- Modify: `3-context-engineering/feeding-the-model.md` (embed the diagram)

Diagram concept: a flow showing the journey of context from the prompter's source material → curated subset → prompt → model. Highlight the "what to leave out" decision point, not just what to include.

Follow Task 3.4 pattern. Commit: `docs(section-3): add context-management-flow diagram`. PAUSE.

### Task 5.6: Section 3 retrospective

- [ ] **Step 1: Read all four Section 3 pages plus diagrams.**
- [ ] **Step 2: Verify diagrams are referenced from prose, not orphaned.**
- [ ] **Step 3: PAUSE for human review of Section 3 as a unit.**

---

## Phase 6: Section 4 Completion + Diagram

Three pages and one diagram. `when-workflows-graduate.md` is the special case — one paragraph + external link.

### Task 6.1: Draft `chatbot-vs-agent.md`

**Files:**
- Create: `4-building-workflows/chatbot-vs-agent.md`

**Page-specific brief:**
- Topic: Mitchell's distinction reframed for non-engineers. When the chat interface is enough, when it's not.
- Required visuals:
  - One table: task type → reach-for-chatbot? reach-for-agent? why.
  - One bulleted list of friction signals that mean a chat-based workflow has graduated.
- Strong cross-link to `which-tool-when.md` and `when-workflows-graduate.md` (forward).

Follow Task 2.1 pattern. Frontmatter `tags: [workflows, agents, mental-models]`. Commit: `docs(section-4): add chatbot-vs-agent`. PAUSE.

### Task 6.2: Draft `personal-workflows.md`

**Files:**
- Create: `4-building-workflows/personal-workflows.md`

**Page-specific brief:**
- Topic: worked examples for research, writing, summarizing, planning. Show the prompt + context + output cycle for each.
- Required visuals:
  - For each of 3–4 worked examples: a small monospace structural block showing prompt → context provided → output handling.
  - One summary table at the top mapping task type → page section.
- Length pressure: this page risks blowing past 900 words. Be ruthless. If it can't fit, the worked-example set is too large; trim.

Follow Task 2.1 pattern. Frontmatter `tags: [workflows, examples]`. Commit: `docs(section-4): add personal-workflows`. PAUSE.

### Task 6.3: Draft `when-workflows-graduate.md` (special-case page)

**Files:**
- Create: `4-building-workflows/when-workflows-graduate.md`

**Page-specific brief — DIFFERENT from all other pages:**
- Per spec authoring rule 7: this page is **one paragraph plus one external link**. Do not expand.
- Word count target: ~80–150 words. The universal density requirement (≥2 visuals per ~600 words) does not apply to a sub-200-word page; explicitly note this exception in the self-review.
- Frontmatter `tags: [workflows, transitions, bridge]`.
- The external link is to the engineering harness (Fowler / Böckeler — *Harness engineering for coding agent users*).
- The page exists to acknowledge that for some readers the next step is engineering tooling, not more chat refinement. Make that pointer cleanly and stop.

- [ ] **Step 1: Re-read the spec rule for this page.** (Spec authoring rule 7.)

- [ ] **Step 2: Draft the single paragraph.**

```yaml
---
title: When workflows graduate
created: 2026-04-30
updated: 2026-04-30
status: draft
tags: [workflows, transitions, bridge]
---
```

One paragraph. One external link. Italicized footer with at most one related wikilink (e.g., `[[chatbot-vs-agent]]`).

- [ ] **Step 3: Self-review with the density-exception note.**

In the running review log, explicitly mark: "density exception applies per spec authoring rule 7."

- [ ] **Step 4: Commit**

```bash
git add 4-building-workflows/when-workflows-graduate.md
git commit -m "docs(section-4): add when-workflows-graduate (bridge page)"
```

- [ ] **Step 5: PAUSE for human review.**

The human is checking that the agent did not expand beyond one paragraph.

### Task 6.4: Create `tool-selection-decision-tree.png` Excalidraw diagram

**Files:**
- Create: `assets/excalidraw/tool-selection-decision-tree.png`
- Modify: `4-building-workflows/which-tool-when.md` (embed the diagram)

Diagram concept: a top-down decision tree. Root question: "What's the task shape?" → branches for research / writing / summarizing / planning / coding-adjacent → leaves recommending Claude / ChatGPT / Gemini / Copilot / "consider an agent / harness".

Follow Task 3.4 pattern. Commit: `docs(section-4): add tool-selection-decision-tree diagram`. PAUSE.

### Task 6.5: Section 4 retrospective

- [ ] **Step 1: Read all four Section 4 pages plus the diagram.**

- [ ] **Step 2: Verify the tool-tribalism rule is honored:** opinions about tools live in Section 4 with explicit reasoning; no opinion drive-bys leaked into Sections 1–3.

- [ ] **Step 3: PAUSE for human review of Section 4 as a unit.**

---

## Phase 7: Cross-Cutting Pages and Final Audit

The graph is now complete enough to recommend a path through it.

### Task 7.1: Draft `curated-links.md`

**Files:**
- Create: `curated-links.md`

**Page-specific brief:**
- Source set is in the spec under "Curated links — initial set".
- Each link gets a one-sentence note explaining why it earns its slot.
- Required visuals:
  - Use a table or grouped list, not freeform prose. Suggested grouping: "Vendor docs" / "Industry voices" / "Empirical anchor".
- No dump. Refuse to add a link without a one-sentence "why this earns its slot."

Follow Task 2.1 pattern. Frontmatter `tags: [meta, references]`. Commit: `docs: add curated-links`. PAUSE.

### Task 7.2: Draft `start-here.md`

**Files:**
- Create: `start-here.md`

**Page-specific brief:**
- Per spec open question, lean: single linear path for v1.
- Order recommendation: foundational page from Section 1 → Section 2 → Section 3 → Section 4, then siblings within each section. Golden example threaded in early.
- Required visuals:
  - One ordered list with wikilinks in reading order. Each entry annotated with one clause of "why this is next."
  - Optionally one short table: "If you have 20 minutes / an hour / a weekend."
- The page is for hand-holding readers; the spec calls out that the graph is otherwise self-directed. Note that explicitly.

Follow Task 2.1 pattern. Frontmatter `tags: [meta, navigation]`. Commit: `docs: add start-here`. PAUSE.

### Task 7.3: Hub-wide wikilink resolution audit

- [ ] **Step 1: Grep all wikilinks across the hub.**

```bash
grep -rn '\[\[' --include='*.md' /workspaces/web-dev-playground/ai-literacy-hub/
```

- [ ] **Step 2: For each wikilink, verify the target file exists.**

Build a list of unresolved links. If any remain at this stage of the rollout, they are bugs (no more forward links permitted — every page should now exist).

- [ ] **Step 3: Fix every unresolved link.**

- [ ] **Step 4: Commit fixes if any.**

```bash
git commit -m "docs: fix unresolved wikilinks across hub"
```

### Task 7.4: Hub-wide voice and density audit

- [ ] **Step 1: Word count every page.**

```bash
for f in $(find /workspaces/web-dev-playground/ai-literacy-hub -name '*.md' -not -path '*/_drafts/*' -not -path '*/_meta/*' -not -name 'spec-*' -not -name 'how-not-to-produce-ai-slop.md'); do echo "$(wc -w < "$f") $f"; done | sort -n
```

Flag any page outside 600–900 words (except `when-workflows-graduate.md`). Revise.

- [ ] **Step 2: Spot-check three pages against the universal review checklist.**

Pick one page per phase (Phase 3, Phase 5, Phase 6). Run the full checklist. If any fail, the rest of the section may have similar issues — investigate.

- [ ] **Step 3: Citation-tracker reconciliation.**

Read `_meta/citation-tracker.md`. Grep the hub for "MIT" or "Brain on ChatGPT". Confirm every actual citation is logged, and the count is ≤2.

- [ ] **Step 4: Cross-section link sparseness audit.**

For each section, count cross-section wikilinks per page. Flag any page with >2 cross-section links — likely violates the "sparingly across" rule.

- [ ] **Step 5: Commit any fixes.**

### Task 7.5: Final retrospective

- [ ] **Step 1: Read the README, then `start-here.md`, then walk the recommended path top to bottom.**

- [ ] **Step 2: Capture observations in `_drafts/v1-retro.md` for the human reviewer.**

What's strong, what's weak, where the voice shifted, where density slipped. Honest, specific.

- [ ] **Step 3: PAUSE for final human review.**

The human decides if v1 ships, if specific pages need rework, or if the open spec questions (audience splits in `start-here.md`, "AI in everyday life" inclusion, refresh cadence) need revisiting.

---

## Self-Review Notes

This plan was checked against the spec on 2026-04-30:

- **Spec coverage:** All 16 main pages, 3 cross-cutting pages, README, and 5 Excalidraw diagrams have a task. The 8 spec authoring rules each map to a step or operating principle. Spec rollout order (steps 1–6) is preserved as Phase 0–7.
- **Placeholder scan:** No "TBD" / "fill in details" / "similar to Task N" left in steps. Page-specific briefs are concrete.
- **Type consistency:** Diagram filenames are consistent across tasks (`context-window.png`, `model-sees-vs-you-see.png`, `chat-vs-project-state.png`, `context-management-flow.png`, `tool-selection-decision-tree.png`). Citation tracker rules are stable across phases.
- **Open spec questions surfaced** (handled in Phase 7 retrospective, not pre-decided): single linear `start-here.md` (defaulted to single per spec lean), "AI in everyday life" exclusion (defaulted to defer per spec lean), refresh cadence (deferred to post-v1).

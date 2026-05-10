---
node_id: "spec-voice-and-navigation-overhaul"
type: design
title: "Spec: Voice and Navigation Overhaul"
created: 2026-05-10
updated: 2026-05-10
status: draft
category: design
tags: [literacy-hub, voice, navigation, spec]
author: "tim.wulin@gmail.com"
summary: >
  Overhaul the hub's voice from "standards-definition register" to a
  friendly-textbook register accessible to non-technical adults. Loosen
  per-page word counts to make room for plainer prose. Add a README-level
  table of contents and a previous/up/next footer on every page in the
  reading path.
---

# Spec: Voice and Navigation Overhaul

## Problem

The hub's current voice is too dense and too marketing-flavored for its stated audience (non-technical adults who have used ChatGPT a few times). The original spec defined the voice as *"standards-definition register with curiosity — closer to a style guide or principles doc than a personal blog."* That register, combined with a tight 600–900 word cap per page, has produced prose that reaches for vivid technical-essayist words — *load-bearing, calibrate, downstream of, off-ramp, the corrective, category error* — when plain language would teach better.

External readers report two problems:

1. The vocabulary is harder than the ideas underneath it. Sentences require the reader to share the writer's mental world before the content lands.
2. The hub is hard to navigate end-to-end. The graph-style cross-linking works for someone already inside the material, but a first-time reader has no obvious way to step through the pages in order.

This spec addresses both.

## Goals

- A reader who has used ChatGPT a few times but does not work in tech can read any page and understand it.
- The hub stops sounding like a style guide. It starts sounding like a careful explainer written by someone who wants the reader to actually get it.
- Every page in the reading path has clear previous/up/next navigation. The README has a scannable table of contents.
- Same ideas, same opinions, same structure. Different voice, plus navigation.

## Non-goals

- Dumbing down the content. The change is plain words, not shallow ideas.
- Removing all metaphor. Familiar analogies (Wikipedia, calculator, kitchen, intern) are welcome. Insider metaphors (load-bearing, downstream of, off-ramp) are not.
- Changing what the hub teaches. The slop-aversion thesis, the four-section structure, the page list, the citation rules, and the visual conventions all stay.
- Changing filenames or wikilinks. No file moves, no renames.

## Voice directive (replaces `spec-ai-literacy-hub.md` lines 43–53)

### Register: friendly textbook

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

## Density rule changes (replaces `spec-ai-literacy-hub.md` lines 56–67)

- **Word target per page: 800–1500 words.** Up from 600–900. The friendly-textbook register needs more sentences, not fewer.
- **Visual rhythm rules stay.** Every page leans on at least two of the following per ~600 words: a table, a code-block-style structural element, a bulleted list with concrete items, an Excalidraw diagram, or a blockquote highlighting a single important claim or test. Prose carries the argument; visuals carry the structure.
- **A page over 1800 words is suspect.** Either the topic should split, or the prose is doing work a visual could do better.

## Content rewrite plan

### Scope per page

- Sentence-by-sentence rewrite in the new voice, not a from-scratch redo. The structure (headings, tables, code blocks, the order of ideas) is preserved. The prose is replaced.
- Where a current visual element itself uses banned vocabulary (e.g., the *Failure mode* column on `what-llms-arent.md` says *"lossy patterns in weights"*), the visual gets rewritten too.
- Where the new word budget allows it, expand the thinnest explanations — add the missing sentence that connects two ideas, or the analogy that grounds the abstract claim.
- Preserve all factual claims, citations, Excalidraw plans, and the page's central argument. Same teaching, different voice.

### Order

| Step | Page(s) | Why this slot |
|---|---|---|
| 1 | `how-not-to-produce-ai-slop.md` | Golden example. Everything else compares against it. Cannot rewrite anything else credibly until this one sets the new baseline. |
| 2 | Section 1 (4 pages, in `start-here` order) | The pages flagged by the user. Foundational mental models — biggest accessibility win. |
| 3 | Section 2 (4 pages, in `start-here` order) | Builds on Section 1's voice. |
| 4 | Section 3 (4 pages, in `start-here` order) | Same. |
| 5 | Section 4 (4 pages, in `start-here` order) | Same. |
| 6 | `start-here.md`, `curated-links.md`, `README.md` | Meta pages. Wait until the page descriptions are stable before rewriting the index. |
| 7 | `spec-ai-literacy-hub.md` | Update voice section, authoring rules, density rules to match the new directive. Done last so the spec describes what was built, not what was planned. |

### Combining navigation work into the same pass

Every page is being touched anyway. The previous/up/next footer goes in during the page's voice rewrite, not in a second pass. The README "Reading order" section is written at step 6, when the new one-line page descriptions exist.

### Review checkpoints

| Checkpoint | After step | Reason |
|---|---|---|
| A | 1 (slop exemplar) | Critical. If the new voice does not land here, every later rewrite is wasted. User reads and approves before any other page is rewritten. |
| B | 2 (Section 1) | User reads all four. If the voice held up across a section, the pattern is locked in. |
| C | 3 (Section 2) | Spot-check, confidence-building. |
| D | 5 + 6 + 7 (Sections 3, 4, meta, spec) | Final review of the whole hub before navigation work wraps. |

## Navigation design

### Per-page footer format

Goes at the bottom of every page in the 17-page linear reading path, replacing the current solitary `Related:` line.

```
---

← Previous: [[what-llms-are]] · Up: [[start-here]] · Next: [[why-they-hallucinate]] →

*Related: [[what-llms-are]] · [[why-they-hallucinate]] · [[how-not-to-produce-ai-slop]]*
```

- Wikilinks throughout. Obsidian resolves them; GitHub renders them as text and they remain readable.
- `Up:` always points to `start-here.md`. Reasoning: `start-here.md` carries the annotated walkthrough; the README is the entry point but not the guided experience.

### Edge cases

| Case | Footer |
|---|---|
| First page (`how-not-to-produce-ai-slop`) | `Up: [[start-here]] · Next: [[what-llms-are]] →` (no Previous) |
| Last page (`when-workflows-graduate`) | `← Previous: [[personal-workflows]] · Up: [[start-here]]` (no Next) |
| `start-here.md` itself | No nav footer. `start-here` *is* the path. Existing `Related:` line stays. |
| `README.md` | No nav footer. README is the entry point. Has its own Reading order section. |
| `curated-links.md`, `ONBOARDING.md`, the `_meta/` pages, `docs/` pages | Not in the linear path. No nav footer. Keep existing `Related:` lines if present. |

### Linear reading order (canonical)

The order below is the source of truth for previous/next on every page. It matches the existing `start-here.md` path.

1. `how-not-to-produce-ai-slop`
2. `what-llms-are`
3. `what-llms-arent`
4. `why-they-hallucinate`
5. `what-theyre-good-and-bad-at`
6. `prompt-as-thinking`
7. `the-intern-frame`
8. `iterating-on-prompts`
9. `reading-the-output`
10. `what-is-context`
11. `chats-vs-projects`
12. `feeding-the-model`
13. `memory-and-state`
14. `which-tool-when`
15. `chatbot-vs-agent`
16. `personal-workflows`
17. `when-workflows-graduate`

### README "Reading order" section

Replaces the current two-bullet block under "How to read this." Pure table of contents — ordered list, wikilink to each page, one short sentence per page in the new voice. The one-liners are derived from the rewritten pages, not authored separately.

### Two tables of contents, on purpose

- **README "Reading order"**: a quick scannable list. Pick a page, jump.
- **`start-here.md`**: a guided walkthrough with reading-time budgets (20 minutes, an hour, a weekend) and richer per-entry rationale. For a reader who wants to be led.

Different jobs. Both stay.

## Out of scope for this overhaul

- Any change to the four-section structure or the 17-page list.
- Any change to filenames, file paths, or wikilink targets.
- Any change to the citation rules (MIT cap of 2 across the hub stays; other sources unchanged).
- Excalidraw diagrams. Existing plans stay; this overhaul does not add or remove diagrams.
- Quartz deployment. Still a separate spec.
- Any mechanical voice linter. The discipline remains editorial.
- Updates to `ONBOARDING.md` or `_meta/` pages beyond what's needed for the banlist (which only applies to reader-facing content pages).

## Open questions

- [ ] After Checkpoint A (the slop exemplar rewrite), does the user want a single example paragraph in the new voice as a sanity check before the full page rewrite, or go straight to the full rewrite? Lean: full rewrite. The previews in the brainstorming session already gave a sample of the new voice, so a separate paragraph-level preview duplicates that work.
- [ ] At Checkpoint B (Section 1 done), should the four pages be reviewed together in one batch, or one by one with the user reading each as it's drafted? Lean: batch of four. Faster end-to-end and the voice has already passed Checkpoint A.

## Rollout

1. Land this spec.
2. Convert this spec into an implementation plan via the writing-plans skill. The plan is the per-step execution document; this spec is the design.
3. Implementation proceeds in the order above (steps 1–7), with checkpoints A–D as gates.
4. After Checkpoint D, the navigation work is already in (it was done page-by-page during the rewrites). The README TOC is the last piece, written at step 6.
5. Final commit closes the overhaul. Any further voice tuning becomes a separate, smaller spec.

# Building Your Own Skill — Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add a two-page cross-cutting cluster (`building-your-own-skill.md` at root, `examples/the-writing-skill-walkthrough.md` in a new subfolder) that teaches the meta-loop the hub itself was built on, demonstrated by transforming an AI-default thanks-for-the-intro email into the prompter's voice across two iterations. Update eight existing files to integrate the cluster.

**Architecture:** Two pages, each adhering independently to the hub's voice and density rules (`_meta/review-checklist.md`). Page 1 is the canonical method; Page 2 is the demonstration. Cross-link edits to existing pages thread the cluster into the hub's existing topology without restructuring sections.

**Tech Stack:** Markdown content authored in Obsidian-compatible wikilinks. No code. Voice and structure validated against `_meta/review-checklist.md`.

**Spec:** `docs/superpowers/specs/2026-05-02-building-your-own-skill-design.md`

---

## Task 1: Scaffold `examples/` subfolder and write Page 1

**Files:**
- Create: `ai-literacy-hub/examples/.gitkeep`
- Create: `ai-literacy-hub/building-your-own-skill.md`
- Reference: `ai-literacy-hub/_meta/review-checklist.md`
- Reference: `ai-literacy-hub/how-not-to-produce-ai-slop.md` (golden example for voice calibration)
- Reference: `docs/superpowers/specs/2026-05-02-building-your-own-skill-design.md` (spec, "Page 1" section)

- [ ] **Step 1: Read the spec for Page 1**

Open `docs/superpowers/specs/2026-05-02-building-your-own-skill-design.md`. Read the "Page 1: `building-your-own-skill.md`" section in full. The six blocks and their directional content are the contract for this task.

- [ ] **Step 2: Read the golden example for voice calibration**

Open `ai-literacy-hub/how-not-to-produce-ai-slop.md`. This is the calibration target — the new page should match its register, density, and visual rhythm.

- [ ] **Step 3: Read the review checklist**

Open `ai-literacy-hub/_meta/review-checklist.md`. The voice rules in "Voice — sentence level" are the bar Page 1 must clear before commit.

- [ ] **Step 4: Create the `examples/` subfolder placeholder**

```bash
mkdir -p /workspaces/web-dev-playground/ai-literacy-hub/examples
touch /workspaces/web-dev-playground/ai-literacy-hub/examples/.gitkeep
```

The `.gitkeep` file ensures the folder lands in the next commit even though Page 2 does not yet exist.

- [ ] **Step 5: Create the new page with frontmatter**

Create `ai-literacy-hub/building-your-own-skill.md` with this frontmatter:

```markdown
---
title: Building your own skill
created: 2026-05-02
updated: 2026-05-02
status: draft
tags: [foundations, skills, iteration]
---

# Building your own skill
```

- [ ] **Step 6: Draft block 1 — Opening (~80 words)**

Write the opening paragraph immediately after the H1. Target length ~80 words. The argument: slop is a process failure (cite slop page); when the same process failure recurs across chats, the failure has a name; what has a name can be written down; a skill is the written-down version of a correction the prompter has made enough times to keep.

Voice constraints:
- Flat declarative claim. No "this page covers" or "in this section."
- No restate sentence — every sentence must add a beat the prior did not.
- Wikilink to `[[how-not-to-produce-ai-slop]]` somewhere natural.

- [ ] **Step 7: Draft block 2 — The loop (~150 words)**

Add an H2 heading: `## The loop`. Then a numbered list of six steps. The loop must read as implied (the doc grows, old rules retire), not stated as cyclical. Use this content as the basis (adapt phrasing to fit context, do not paraphrase loosely):

```markdown
1. **Notice** — the same correction recurs across multiple chats, not a one-off bad output.
2. **Name** — describe the pattern in words specific enough to write down.
3. **Codify** — write the correction as a reusable artifact: a markdown doc, a do-not list, a short style guide.
4. **Apply** — paste it into prompts, attach it as a project file, set it as custom instructions. Whatever the platform supports.
5. **Audit** — read new outputs against the codified rules. Find what still slips through.
6. **Iterate** — extend the artifact when new tells slip through. The doc grows; old rules retire when they stop earning their keep.
```

Add at most one short framing sentence before the list (e.g., "Six moves, in order.") and at most one after (a transition into the next section). The list is the visual element.

- [ ] **Step 8: Draft block 3 — What the artifact looks like (~150 words)**

Add an H2 heading: `## What the artifact looks like`. Two short prose paragraphs surrounding one monospace skeleton block. The skeleton must show a generic voice-doc structure (forbidden words, pacing, openers) — generic, not the worked-example artifact. Use this skeleton verbatim:

```markdown
```
# voice-doc.md (skeleton)

forbidden: [words the prompter keeps deleting from outputs]
openers:   [phrasings the prompter keeps replacing in first sentences]
structure: [sentence count, paragraph count, formatting rules]
em-dashes: [rule on em-dash use]
```
```

After the block: one sentence on what makes a good rule — *specific enough to apply, not so specific it can only fix one sentence*. Forward pointer to `[[the-writing-skill-walkthrough]]` where the same artifact gets built rule by rule.

- [ ] **Step 9: Draft block 4 — The hardest step is noticing (~150 words)**

Add an H2 heading: `## The hardest step is noticing`. Two points, in this order:

(a) One bad output is not yet a pattern. The diagnostic threshold is recurrence — the same correction appearing across two or three chats.

(b) The smell precedes the name. The prompter feels something is off before they can articulate what; the work is naming. The smell-test itself is the one in `[[reading-the-output]]`; the new move is running it across chats and looking for repeats.

Voice constraints:
- No hollow imperatives. If the prose says "treat that as a pattern," the next sentence must show *what the pattern looks like*.
- Cross-link to `[[reading-the-output]]` is load-bearing, not decorative.

- [ ] **Step 10: Draft block 5 — What this is not (~80 words)**

Add an H2 heading: `## What this is not`. One short paragraph. The artifact is a markdown document the model reads — still chat-shaped work. When the prompter starts wanting the artifact to chain into a workflow that branches and self-checks, that is the cliff `[[when-workflows-graduate]]` points over. This page sits one rung before.

Voice constraints:
- Section must end after the last substantive point. No moral-of-the-story closer.
- The wikilink to `[[when-workflows-graduate]]` is the reason this section exists.

- [ ] **Step 11: Add footer**

Add at the end of the file:

```markdown

*Related: [[the-writing-skill-walkthrough]] · [[how-not-to-produce-ai-slop]] · [[reading-the-output]]*
```

- [ ] **Step 12: Run word count check**

Run: `wc -w /workspaces/web-dev-playground/ai-literacy-hub/building-your-own-skill.md`
Expected: 600-900 words. If outside this range, compress (overshoot) or expand (undershoot) the prose. The monospace block does not count toward prose word budget but contributes visual density.

- [ ] **Step 13: Run review checklist scan**

Read through the file once with `_meta/review-checklist.md` open. Tag any of the following that appear and fix inline:
- `#tell` (rhetorical reversals, definitional asides)
- `#restate` (sentence reframes the previous)
- `#tech-creep` (implementation jargon — "stochastic," "by construction," "conditions on")
- `#staccato` (three or more short sentences in a row)
- `#hollow-imperative` ("treat that as..." with no concrete action)
- `#moral-closer` (closer extracts a moral the paragraph already earned)
- `#filler-third` (three-item list where item three restates one+two)
- `#forbidden-word` (essentially, basically, simply, just, robust, seamless, leverage, delve)
- `#em-dash-overuse` (more than two em-dashes per paragraph; consecutive em-dash sentences)

- [ ] **Step 14: Verify wikilinks resolve**

The file references four wikilinks: `[[how-not-to-produce-ai-slop]]`, `[[reading-the-output]]`, `[[when-workflows-graduate]]`, `[[the-writing-skill-walkthrough]]`.

The first three resolve to existing files. The fourth is intentionally forward-pointing (Task 2 creates it). Confirm by:

```bash
ls /workspaces/web-dev-playground/ai-literacy-hub/how-not-to-produce-ai-slop.md
ls /workspaces/web-dev-playground/ai-literacy-hub/2-how-to-talk-to-them/reading-the-output.md
ls /workspaces/web-dev-playground/ai-literacy-hub/4-building-workflows/when-workflows-graduate.md
```
Expected: all three paths exist. The walkthrough file is created in Task 2; the wikilink is documented as forward-pointing.

- [ ] **Step 15: Commit**

```bash
git -C /workspaces/web-dev-playground/ai-literacy-hub add building-your-own-skill.md examples/.gitkeep
git -C /workspaces/web-dev-playground/ai-literacy-hub commit -m "$(cat <<'EOF'
docs: add building-your-own-skill flagship page

The method page for the meta-loop (notice, name, codify, apply,
audit, iterate). Sibling to how-not-to-produce-ai-slop; the rung
between iterating-on-prompts and when-workflows-graduate. The
walkthrough that demonstrates the loop lands in a follow-up
commit under examples/.

Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>
EOF
)"
```

---

## Task 2: Write Page 2 — `examples/the-writing-skill-walkthrough.md`

**Files:**
- Create: `ai-literacy-hub/examples/the-writing-skill-walkthrough.md`
- Reference: `ai-literacy-hub/_meta/review-checklist.md` (tag vocabulary lifted directly from this file)
- Reference: `docs/superpowers/specs/2026-05-02-building-your-own-skill-design.md` (spec, "Page 2" section)

- [ ] **Step 1: Read the spec for Page 2**

Open `docs/superpowers/specs/2026-05-02-building-your-own-skill-design.md`. Read the "Page 2" section and the "Worked-example details" subsection. The eight blocks, their word counts, and the loaded tells are the contract.

- [ ] **Step 2: Create the new page with frontmatter**

Create `ai-literacy-hub/examples/the-writing-skill-walkthrough.md` with:

```markdown
---
title: The writing-skill walkthrough
created: 2026-05-02
updated: 2026-05-02
status: draft
tags: [skills, walkthrough, voice, examples]
---

# The writing-skill walkthrough
```

- [ ] **Step 3: Draft block 1 — Opening (~80 words)**

One paragraph. The recurring task: thanks-for-the-intro email. The prompter has had this same edit-the-output dance three times this month. The corrective is not a better prompt for this email — it is a correction the prompter writes down once and reuses. This page is the loop running on one specific case. Wikilink to `[[building-your-own-skill]]` natural in the framing.

- [ ] **Step 4: Draft block 2 — v0 prompt and AI default (~150 words, monospace exhibit)**

Add an H2 heading: `## v0 — the naive prompt`. Then prose framing the scenario in one or two sentences (Sara introduced the prompter to Marcus at Acme; the prompter owes a follow-up). Then a monospace block with the prompt and the output. Use this draft verbatim — the AI tells are deliberately loaded:

```markdown
```
PROMPT
  Write a thank-you email to Marcus for the intro from Sara.
  Mention I'd love to grab time and learn more about what
  he's working on at Acme.

OUTPUT
  Subject: Thanks for the intro!

  Hi Marcus,

  Sara mentioned you're doing really exciting work over at Acme — and
  after hearing about it, I'm not just curious, I'm genuinely impressed.
  Your perspective on platform engineering is exactly the kind of thinking
  I've been wanting to get closer to. It's refreshing.

  I'd love to grab time to learn more about your work, your team's
  priorities, and where you see things headed — there's real potential
  to swap notes and maybe explore some synergies down the line.

  Looking forward to it,
  [Name]
```
```

No commentary inside the block. The diagnosis happens in the next section.

- [ ] **Step 5: Draft block 3 — Pass 1: notice + name + codify (~180 words)**

Add an H2 heading: `## Pass 1 — naming the tells`. Open with one short paragraph: the prompter reads the v0 output, edits two-thirds of it out, and notices these are the same edits made on the last two intro emails. The corrective is not another edit — it is a rule.

Then a tagged list calling out specific phrases from v0. Use the tag vocabulary from `_meta/review-checklist.md` directly. Gloss each tag inline on first use:

```markdown
- `#em-dash-overuse` — *"really exciting work over at Acme — and..."*, *"where you see things headed — there's..."*. Two em-dashes inside three sentences.
- `#tell` — *"I'm not just curious, I'm genuinely impressed."* Rhetorical reversal: the *not just X, but Y* shape signals AI-default phrasing.
- `#filler-third` — *"your work, your team's priorities, and where you see things headed."* Three-item list where item three restates the first two.
- `#forbidden-word` — *"explore some synergies."* Marketing vocabulary the prompter would never use.
- `#moral-closer` — *"It's refreshing."* The closer extracts a moral the prior sentences already imply.
```

Then a short transition: *Naming the tells produces the first version of the artifact.* Followed by `voice-doc.md` v1 in monospace:

```markdown
```
# voice-doc.md (pass 1)

forbidden: synergies, leverage, robust, exciting, refreshing
openers:   no compliments, no "hope this finds you well"
structure: one paragraph, three sentences max
em-dashes: none
tells:     no "not just X, but Y"; no three-item closers
```
```

- [ ] **Step 6: Draft block 4 — v1 prompt and output (~120 words, monospace exhibit)**

Add an H2 heading: `## v1 — the doc applied`. One short framing sentence: same task, prompt now references `voice-doc.md`. Then the prompt and output verbatim:

```markdown
```
PROMPT
  Same task as before, applying voice-doc.md (attached). Keep
  it under 80 words. State who introduced us, what I do, and
  one specific reason I want to talk.

OUTPUT
  Subject: Sara connected us — Acme platform work

  Hi Marcus,

  Sara connected us because we're both working on developer platform
  UX, just from different sides. The piece I'm most curious about is
  how you handle rollout to teams that don't want a new tool. Worth
  20 minutes next week?

  Thanks,
  [Name]
```
```

The output has two planted slips: an em-dash crept back into the subject line; *"the piece I'm most curious about"* is precious phrasing the v1 doc didn't anticipate. (The prose in the next section will name these.)

- [ ] **Step 7: Draft block 5 — Pass 2: audit + codify again (~150 words)**

Add an H2 heading: `## Pass 2 — what slipped through`. Open with one sentence: v1 reads in voice on most lines, slips on two. Then the tagged list:

```markdown
- `#em-dash-overuse` — em-dash returned in the subject line. The v1 rule covered body prose; subject lines were not specified.
- `#literary` — *"the piece I'm most curious about"* is precious phrasing. New tell, not yet covered by the doc.
```

Then one short transition: *The doc grows.* Followed by `voice-doc.md` v2 in monospace, showing the diff in spirit (tightened em-dash rule, new openers rule):

```markdown
```
# voice-doc.md (pass 2)

forbidden: synergies, leverage, robust, exciting, refreshing
openers:   no compliments, no "hope this finds you well"
           no precious phrasing ("the piece I'm most curious about",
                                  "what I find compelling about")
structure: one paragraph, three sentences max
em-dashes: none, including subject lines and asides
tells:     no "not just X, but Y"; no three-item closers
hedging:   no "just" as softener
```
```

- [ ] **Step 8: Draft block 6 — v2 final output (~100 words, monospace exhibit)**

Add an H2 heading: `## v2 — in voice`. One framing sentence: same task, grown doc attached, same 80-word constraint. Then prompt and output:

```markdown
```
PROMPT
  Same task, applying voice-doc.md (attached, updated). Keep
  it under 80 words. State who introduced us, what I do, and
  one specific reason I want to talk.

OUTPUT
  Subject: Sara connected us about platform tooling

  Hi Marcus,

  Sara connected us because we're both working on developer platform
  UX, you on infra at Acme, me on tooling. My open question is how
  you handle rollout to teams that don't want a new tool. Worth 20
  minutes next week?

  Thanks,
  [Name]
```
```

After the block, one short closer: the v2 output reads flat, specific, no hedges, no em-dashes, no precious phrasing. The transformation from v0 is visible at a glance.

- [ ] **Step 9: Draft block 7 — The artifact, complete (~80 words framing + full doc)**

Add an H2 heading: `## The artifact, ready to lift`. One short paragraph: two passes, an artifact that grew from six rules to nine. Now portable across every chat where this kind of writing matters. The same loop runs again the next time a new tell slips through.

Then the full final `voice-doc.md` in monospace (this is what the reader copies):

```markdown
```
# voice-doc.md

forbidden: synergies, leverage, robust, exciting, refreshing
openers:   no compliments, no "hope this finds you well"
           no precious phrasing ("the piece I'm most curious about",
                                  "what I find compelling about")
structure: one paragraph, three sentences max
em-dashes: none, including subject lines and asides
tells:     no "not just X, but Y"; no three-item closers
hedging:   no "just" as softener
```
```

- [ ] **Step 10: Add footer**

```markdown

*Related: [[building-your-own-skill]] · [[iterating-on-prompts]] · [[reading-the-output]]*
```

- [ ] **Step 11: Run word count check**

Run: `wc -w /workspaces/web-dev-playground/ai-literacy-hub/examples/the-writing-skill-walkthrough.md`
Expected: 1000-1300 total words. The prose target is ~830, but seven monospace exhibits (three emails ~80 words each, two voice-docs ~30-50 words each, two tagged-tell lists embedded in prose blocks) add ~300-400 words to the `wc` total. If total is below 1000, the prose has under-shot; if above 1300, the prose has over-shot. Compress or expand the prose blocks (1, 3, 5, 7) — never the exhibits, which carry the lesson.

This page exceeds the hub's standard 600-900 word target by design. The justification: visual weight comes from exhibits, not prose density, and the iteration shape is the lesson. Treat as a documented exception (precedent: `when-workflows-graduate.md`, which has its own exception in `_meta/review-checklist.md`).

- [ ] **Step 12: Run review checklist scan**

Apply the same scan as Task 1 Step 13 — but the AI tells in the v0/v1 exhibit blocks are *intentional* and must remain. The scan only applies to prose outside monospace blocks. Inside the exhibits, the tells are the lesson.

Specifically check:
- Tag glosses on first use are present (at minimum: `#em-dash-overuse`, `#tell`, `#filler-third`, `#forbidden-word`, `#moral-closer`, `#literary`).
- The page voice itself never falters into the tells the exhibits demonstrate.

- [ ] **Step 13: Verify wikilinks resolve**

The file references three wikilinks: `[[building-your-own-skill]]`, `[[iterating-on-prompts]]`, `[[reading-the-output]]`. All three exist (Page 1 was created in Task 1). Confirm:

```bash
ls /workspaces/web-dev-playground/ai-literacy-hub/building-your-own-skill.md
ls /workspaces/web-dev-playground/ai-literacy-hub/2-how-to-talk-to-them/iterating-on-prompts.md
ls /workspaces/web-dev-playground/ai-literacy-hub/2-how-to-talk-to-them/reading-the-output.md
```

- [ ] **Step 14: Commit**

```bash
git -C /workspaces/web-dev-playground/ai-literacy-hub add examples/the-writing-skill-walkthrough.md
git -C /workspaces/web-dev-playground/ai-literacy-hub commit -m "$(cat <<'EOF'
docs: add the-writing-skill-walkthrough demonstration

Worked example of the meta-loop running on a thanks-for-the-intro
email. Two iterations transform the AI-default output (loaded with
em-dashes, rhetorical reversals, synergies, filler-thirds, and a
moral closer) into the prompter's voice via a voice-doc.md that
grows from six rules to nine. The complete artifact at the end is
the lift-and-adapt block.

Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>
EOF
)"
```

---

## Task 3: Cross-link edits to content pages

**Files:**
- Modify: `ai-literacy-hub/how-not-to-produce-ai-slop.md`
- Modify: `ai-literacy-hub/2-how-to-talk-to-them/iterating-on-prompts.md`
- Modify: `ai-literacy-hub/2-how-to-talk-to-them/reading-the-output.md`
- Modify: `ai-literacy-hub/4-building-workflows/personal-workflows.md`
- Modify: `ai-literacy-hub/4-building-workflows/when-workflows-graduate.md`

- [ ] **Step 1: Edit `how-not-to-produce-ai-slop.md`**

Open the file. In the closing section "What this hub is for" (around line 102), the current paragraph is:

> Every page about prompting, context engineering, or workflow design is downstream of one habit: forming a real connection to the work AI helps you produce. The mechanics come next. The reason to do it sits here.

Add one sentence before "The reason to do it sits here." that connects to the new cluster. Draft:

> When the same corrective recurs across chats, codifying it once is the move; see `[[building-your-own-skill]]`.

The Related footer currently reads: `*Related: [[what-llms-are]] · [[prompt-as-thinking]] · [[which-tool-when]]*`. Leave the footer as-is — the body link is sufficient and the footer is already at the three-link conventional cap.

- [ ] **Step 2: Edit `iterating-on-prompts.md`**

Open the file. After the "Iterating the prompt vs editing the output" section (line 87 onward), the closing paragraphs talk about the diagnostic for re-prompt vs edit. Add one sentence at the end of that section, before the Related footer:

> When the same iteration recurs across chats — the same correction, the same re-prompt — the iteration has moved up a level; see `[[building-your-own-skill]]`.

Update the Related footer to add the new link. Current: `*Related: [[prompt-as-thinking]] · [[the-intern-frame]] · [[reading-the-output]]*`. The footer is already at three links; replace `[[the-intern-frame]]` with `[[building-your-own-skill]]` to keep the cap. Final footer:

```markdown
*Related: [[prompt-as-thinking]] · [[reading-the-output]] · [[building-your-own-skill]]*
```

- [ ] **Step 3: Edit `personal-workflows.md`**

Open the file. The closing paragraph (line 107) currently reads:

> When the same prompt-context-handling template runs every Monday — the manager email, the weekly plan, the standing summary — the worked example has graduated into a workflow. See [[when-workflows-graduate]].

Update to add a parallel sentence about corrections (not templates) graduating:

> When the same prompt-context-handling template runs every Monday — the manager email, the weekly plan, the standing summary — the worked example has graduated into a workflow. See `[[when-workflows-graduate]]`. When the same *correction* recurs across chats — the same edit, made every time — the workflow has graduated in a different direction; see `[[building-your-own-skill]]`.

The Related footer currently reads: `*Related: [[which-tool-when]] · [[iterating-on-prompts]] · [[when-workflows-graduate]]*`. Already at three links; leave as-is. The body link to `[[building-your-own-skill]]` is sufficient.

- [ ] **Step 4: Edit `when-workflows-graduate.md` — body change**

Open the file. The full current body (line 11) is:

> If you keep running the same prompt every week, copying data between tools by hand, or building tasks that branch on each step's result, chat is no longer the right shape for the work. The next step is engineering the surface around the model: custom tools, project setup, a harness the agent runs inside. This hub does not cover that work. Birgitta Böckeler's *Harness engineering for coding agent users*, in Martin Fowler's [*Exploring Gen AI* series](https://martinfowler.com/articles/exploring-gen-ai.html), is the cleanest pointer onward.

This page is the abrupt end of Section 4. The new cluster sits one rung *before* this graduation. Rewrite to include the rung. Draft:

> If you keep running the same prompt every week, copying data between tools by hand, or building tasks that branch on each step's result, chat is no longer the right shape for the work. Two off-ramps exist, in order. If the recurring move is a *correction* — the same edit made on every output — the work is still chat-shaped; codify the correction as a reusable artifact, see `[[building-your-own-skill]]`. If the recurring move is *coordination* — branching tasks, tool chaining, agents running between turns — the next step is engineering the surface around the model: custom tools, project setup, a harness the agent runs inside. This hub does not cover the coordination side. Birgitta Böckeler's *Harness engineering for coding agent users*, in Martin Fowler's [*Exploring Gen AI* series](https://martinfowler.com/articles/exploring-gen-ai.html), is the cleanest pointer onward.

The Related footer currently reads: `*Related: [[chatbot-vs-agent]]*`. Add the new cluster:

```markdown
*Related: [[chatbot-vs-agent]] · [[building-your-own-skill]]*
```

- [ ] **Step 5: Voice-scan `when-workflows-graduate.md` (the only meaningful body change)**

Read the rewritten paragraph against `_meta/review-checklist.md`. Check specifically:
- No `#tell` (rhetorical reversal). The "in order" phrasing is a list signal, not a reversal.
- No `#staccato`. The paragraph reads as one connected argument; sentence lengths vary.
- No `#restate`. Each "if the recurring move is X" sentence makes a different distinction.
- The paragraph stays under the page-level word budget (the existing exception in `_meta/review-checklist.md` for this page is "one paragraph"; the rewrite preserves that).

If any flag fires, fix inline.

- [ ] **Step 6: Edit `reading-the-output.md`**

Open the file. The Related footer currently reads: `*Related: [[iterating-on-prompts]] · [[the-intern-frame]] · [[how-not-to-produce-ai-slop]]*`. Already at three links — replace `[[the-intern-frame]]` with `[[building-your-own-skill]]`. Final footer:

```markdown
*Related: [[iterating-on-prompts]] · [[how-not-to-produce-ai-slop]] · [[building-your-own-skill]]*
```

No body change — `reading-the-output.md` is the smell-test reference; the new page inherits without disrupting.

- [ ] **Step 7: Commit**

```bash
git -C /workspaces/web-dev-playground/ai-literacy-hub add \
  how-not-to-produce-ai-slop.md \
  2-how-to-talk-to-them/iterating-on-prompts.md \
  2-how-to-talk-to-them/reading-the-output.md \
  4-building-workflows/personal-workflows.md \
  4-building-workflows/when-workflows-graduate.md
git -C /workspaces/web-dev-playground/ai-literacy-hub commit -m "$(cat <<'EOF'
docs: thread building-your-own-skill into content pages

Five content-page edits integrating the new cluster into the hub
topology. when-workflows-graduate.md gets a body rewrite to make
the codify-corrections rung explicit before the harness handoff.
The four other pages get one-sentence body or footer additions.

Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>
EOF
)"
```

---

## Task 4: Cross-link edits to navigation files

**Files:**
- Modify: `ai-literacy-hub/start-here.md`
- Modify: `ai-literacy-hub/README.md`

- [ ] **Step 1: Edit `start-here.md`**

Open the file. The current path is 17 numbered entries (lines 25-41). Insert the two new pages as entries 18 and 19, after `[[when-workflows-graduate]]` (currently entry 17).

Add to the numbered list:

```markdown
18. [[building-your-own-skill]] — _the rung between iterating-on-prompts and when-workflows-graduate; the move when the same correction recurs across chats._
19. [[the-writing-skill-walkthrough]] — _the loop demonstrated on one task, end to end; the artifact at the bottom is the lift-and-adapt block._
```

The "If the budget is shorter than the path" table (lines 15-19) does not need updating — the new entries sit at positions 18-19, beyond every budget tier in the table.

- [ ] **Step 2: Edit `README.md`**

Open the file. The "How to read this" section (lines 19-24) currently lists two cross-cutting pages. Add the new cluster:

```markdown
- [[start-here]] — recommended reading order for readers who want a path rather than a graph.
- [[how-not-to-produce-ai-slop]] — the load-bearing example. Every other page calibrates against it. Read it first if nothing else.
- [[building-your-own-skill]] — the meta-loop the hub itself was built on; pair with [[the-writing-skill-walkthrough]] for the demonstration.
```

The Related footer (line 38) currently reads: `*Related: [[start-here]] · [[how-not-to-produce-ai-slop]]*`. Leave as-is — the body link is sufficient.

- [ ] **Step 3: Commit**

```bash
git -C /workspaces/web-dev-playground/ai-literacy-hub add start-here.md README.md
git -C /workspaces/web-dev-playground/ai-literacy-hub commit -m "$(cat <<'EOF'
docs: add building-your-own-skill cluster to navigation

start-here gets two new entries at positions 18 and 19, after
when-workflows-graduate. README's "How to read this" lists the
new cluster alongside the existing flagship.

Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>
EOF
)"
```

---

## Task 5: Update hub spec

**Files:**
- Modify: `ai-literacy-hub/spec-ai-literacy-hub.md`

- [ ] **Step 1: Read the spec sections to update**

Open `ai-literacy-hub/spec-ai-literacy-hub.md`. The two sections that need updating:

- "Cross-cutting pages" table (lines 142-146)
- "Hub repository layout" tree (lines 180-209)
- The summary line "15 main pages + 3 cross-cutting + README" (line 211)

- [ ] **Step 2: Update the Cross-cutting pages table**

The current table (lines 142-146):

```markdown
| Page | Purpose |
|---|---|
| `how-not-to-produce-ai-slop.md` | **Golden example.** The spine of the hub. Linked from most other pages. |
| `start-here.md` | Recommended reading order for readers who want hand-holding. Otherwise the graph is self-directed. |
| `curated-links.md` | High-value external sources, each with a one-sentence "why this is worth your time." |
```

Replace with:

```markdown
| Page | Purpose |
|---|---|
| `how-not-to-produce-ai-slop.md` | **Golden example.** The spine of the hub. Linked from most other pages. |
| `building-your-own-skill.md` | The meta-loop the hub itself was built on (notice → name → codify → apply → audit → iterate). The rung between iterating-on-prompts and when-workflows-graduate. |
| `start-here.md` | Recommended reading order for readers who want hand-holding. Otherwise the graph is self-directed. |
| `curated-links.md` | High-value external sources, each with a one-sentence "why this is worth your time." |
| `examples/the-writing-skill-walkthrough.md` | Worked example of the meta-loop running on a thanks-for-the-intro email; demonstrates the iteration end-to-end. |
```

- [ ] **Step 3: Update the Hub repository layout tree**

The current tree (lines 180-209) does not include the new files or the `examples/` folder. Update to include them. The relevant additions:

After `how-not-to-produce-ai-slop.md` add a line for `building-your-own-skill.md`. Add an `examples/` block after the four section folders. Final tree should match:

```
ai-literacy-hub/
├── README.md                              # What this is, who it's for, slop-aversion thesis
├── start-here.md                          # Recommended reading order
├── how-not-to-produce-ai-slop.md          # Golden example, spine of hub
├── building-your-own-skill.md             # Meta-loop method page (cross-cutting)
├── curated-links.md
├── _drafts/                               # gitignored
├── _meta/
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
├── 4-building-workflows/
│   ├── which-tool-when.md
│   ├── chatbot-vs-agent.md
│   ├── personal-workflows.md
│   └── when-workflows-graduate.md
└── examples/
    └── the-writing-skill-walkthrough.md
```

(Note: `_meta/` was already present in the repo but absent from the original spec tree — including it now corrects that drift in the same edit.)

- [ ] **Step 4: Update the structure summary line**

The current line (line 211) reads:

```markdown
15 main pages + 3 cross-cutting + README.
```

Replace with:

```markdown
15 main pages + 4 cross-cutting + 1 example + README.
```

- [ ] **Step 5: Commit**

```bash
git -C /workspaces/web-dev-playground/ai-literacy-hub add spec-ai-literacy-hub.md
git -C /workspaces/web-dev-playground/ai-literacy-hub commit -m "$(cat <<'EOF'
docs: update hub spec for building-your-own-skill cluster

Cross-cutting page list adds building-your-own-skill and the
walkthrough. Hub layout tree adds the examples/ folder and the
new flagship. Structure summary updated. The _meta/ folder is
included in the tree now to match the actual repo state.

Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>
EOF
)"
```

---

## Self-Review

After implementation, verify against the spec:

**Spec coverage check:**
- [ ] Page 1 has all six blocks (Opening, Loop, Artifact, Noticing, Scope guard, Footer) — verified in Task 1.
- [ ] Page 2 has all eight blocks (Opening, v0, Pass 1, v1, Pass 2, v2, Complete artifact, Footer) — verified in Task 2.
- [ ] All eight cross-link edits applied (5 content + 2 navigation + 1 spec) — verified in Tasks 3, 4, 5.
- [ ] Voice scan re-run on `when-workflows-graduate.md` — verified in Task 3 Step 5.
- [ ] `examples/` folder created — verified in Task 1 Step 4.
- [ ] Final commit count: 5 (Page 1, Page 2, content cross-links, navigation cross-links, spec).

**Open questions from the spec:**
- Page 1's "what the artifact looks like" uses a generic skeleton (Open Q 1: lean confirmed in Task 1 Step 8).
- `start-here.md` placement: positions 18-19 after `when-workflows-graduate` (Open Q 2: lean confirmed in Task 4 Step 1).
- Tag glosses on Page 2: every tag actually used in the walkthrough is glossed inline (Open Q 3: lean confirmed in Task 2 Steps 5-7).

If any of these resolutions need to change during execution, document the deviation in the commit message.

---
node_id: "spec-building-your-own-skill"
type: design
title: "Spec: Building your own skill (cross-cutting page cluster)"
created: 2026-05-02
updated: 2026-05-02
status: draft
category: design
tags: [literacy-hub, content, spec, skills, meta-loop]
author: "tim.wulin@gmail.com"
summary: >
  Two-page cross-cutting cluster teaching the meta-loop the hub itself was
  built on: notice a recurring AI failure, name it, codify the correction,
  apply, audit, iterate. Page 1 is the canonical method; Page 2 is a worked
  example of the loop running on a "thanks for the intro" email, transforming
  AI-default output into the prompter's voice across two iterations.
---

# Spec: Building your own skill

## Problem

The hub teaches readers to recognize AI slop and engage with their outputs (`how-not-to-produce-ai-slop.md`, `reading-the-output.md`, `iterating-on-prompts.md`). It does not yet teach what to do when the *same* failure recurs across chats. A reader who notices their AI emails sound corporate every time, or that AI-drafted summaries always smooth contradictions, currently has nowhere in the hub to learn the next move: codify the correction once, reuse it everywhere.

Section 4 ends abruptly with `when-workflows-graduate.md`, which sends readers off to harness engineering. There is no rung between "iterate on this prompt" and "graduate to a harness." The cluster fills that rung.

## Goals

- **Teach the meta-loop**: notice a recurring failure → name it → codify the correction → apply → audit → iterate.
- **Demonstrate the loop end-to-end** on a worked example specific enough that the reader can lift the artifact and adapt it.
- **Stay inside the hub's non-coder scope**: the codified artifact is a markdown document the model reads, not custom code, harness, or platform-specific construct.
- **Connect the cluster cleanly to existing pages** so the meta-loop reads as the load-bearing pattern beneath every prompting and context page already in the hub.

## Non-goals

- Teaching readers to author Claude Code skills, Custom GPT instructions, or any platform-specific construct. The artifact is platform-agnostic markdown the reader pastes, attaches, or sets as instructions in whatever chat they use.
- Adding a fifth section to the hub. The cluster is cross-cutting, sibling to `how-not-to-produce-ai-slop.md`.
- Replacing or expanding `when-workflows-graduate.md`'s harness handoff. The cluster sits one rung *before* that page; the handoff stays where it is.
- Multiple worked examples (research-skill, summarizing-skill, planning-skill walkthroughs). The cluster ships with one walkthrough — writing — and reserves room for future walkthroughs without committing to them now.

## Audience

The hub's existing audience: designers, PMs, ops, customer success, students, friends, mentees. Non-coders. Has used ChatGPT or Claude. Does not assume programming background or familiarity with platform-specific terminology beyond chat-level usage.

## Approach

**Two-page cross-cutting cluster.** Page 1 at hub root (sibling to slop); Page 2 in a new `examples/` subfolder. Each page hits the hub's voice and density rules independently. Tightly cross-linked.

- `building-your-own-skill.md` — root level. The method: the loop, the artifact shape, the diagnostic move, the scope guard. ~600-800 words.
- `examples/the-writing-skill-walkthrough.md` — subfolder. The demonstration: a thanks-for-the-intro email transformed across two iterations from AI-default to the prompter's voice. ~830 words plus monospace exhibits.

The `examples/` subfolder is new. It signals "demonstrations of patterns taught elsewhere" and reserves a home for future walkthroughs (research, summarizing, planning) without forcing the cluster to ship them now.

## Page 1: `building-your-own-skill.md`

### Frontmatter

```yaml
title: Building your own skill
created: 2026-05-02
updated: 2026-05-02
status: draft
tags: [foundations, skills, iteration]
```

### Structure

Six blocks, total prose ~610 words plus one monospace block.

**1. Opening (~80 words).** Flat claim connecting to slop. Slop is a process failure; when the same process failure recurs across chats, the failure has a name, and what has a name can be written down. A skill is the written-down version of a correction the prompter has made enough times to keep. No preview, no roadmap.

**2. The loop (~150 words).** Six steps as a numbered list, one strong sentence each. Loop is implied through phrasing, not stated as cyclical. Approximate copy:

```
1. Notice — the same correction recurs across multiple chats, not a
   one-off bad output.
2. Name — describe the pattern in words specific enough to write down.
3. Codify — write the correction as a reusable artifact: a markdown doc,
   a do-not list, a short style guide.
4. Apply — paste it into prompts, attach it as a project file, set it as
   custom instructions. Whatever the platform supports.
5. Audit — read new outputs against the codified rules. Find what still
   slips through.
6. Iterate — extend the artifact when new tells slip through. The doc
   grows; old rules retire when they stop earning their keep.
```

**3. What the artifact looks like (~150 words).** Brief monospace sketch of a generic voice-doc skeleton — three or four headed sections (forbidden words, pacing, openers). One sentence on what makes a good rule: specific enough to apply, not so specific it can only fix one sentence. Forward pointer to the walkthrough where the same artifact gets built rule by rule.

**4. The hardest step is noticing (~150 words).** Two points: (a) one bad output is not yet a pattern — the diagnostic threshold is recurrence, the same correction appearing across two or three chats; (b) the smell precedes the name — the prompter feels something is off before they can articulate what; the work is in naming. The smell-test itself is the one in `[[reading-the-output]]`; the new move is running it across chats and looking for repeats.

**5. What this is not (~80 words).** Scope guard. The artifact is a markdown document the model reads — still chat-shaped work. When the prompter wants the artifact to chain into a workflow that branches and self-checks, that is the cliff `[[when-workflows-graduate]]` points over. This page sits one rung before.

**6. Footer.** `*Related: [[the-writing-skill-walkthrough]] · [[how-not-to-produce-ai-slop]] · [[reading-the-output]]*`

### Voice constraints

- Opening is a flat claim, not a roadmap. No "this page covers."
- No moral closer in the scope-guard section.
- No restate sentences.
- Within-section cross-links are aggressive; the cluster is structurally cross-cutting but its dependencies (slop, reading-the-output, when-workflows-graduate) are explicit.

## Page 2: `examples/the-writing-skill-walkthrough.md`

### Frontmatter

```yaml
title: The writing-skill walkthrough
created: 2026-05-02
updated: 2026-05-02
status: draft
tags: [skills, walkthrough, voice, examples]
```

### Structure

Eight blocks. Total prose ~830 words plus seven monospace exhibits (three email outputs, two artifact snapshots, two tagged-tell lists). Diagnosis-and-codification steps are paired in single sections to avoid over-fragmentation.

**1. Opening (~80 words).** The recurring task: thanks-for-the-intro email. The prompter has had the same edit-the-output dance three times this month. The corrective is not a better prompt for this email — it is a correction the prompter writes down once and reuses. This page is the loop running on one specific case.

**2. v0 — naive prompt and AI default (~150 words, monospace exhibit).** Prompt verbatim, output verbatim. The output is loaded with tells: at least two em-dashes, two `not X, but Y` reversals, "synergies," a filler-third tricolon, a staccato moral closer ("It's refreshing."), "Looking forward to it." No commentary inside the block.

**3. Pass 1: notice + name + codify (~180 words).** Tagged list of tells with phrase-level callouts. Tag vocabulary lifted from `_meta/review-checklist.md` (`#em-dash-overuse`, `#tell`, `#filler-third`, `#forbidden-word`, `#moral-closer`). Tags glossed inline on first use so a non-coder reader carries them forward. Then the first version of `voice-doc.md` in monospace — six rules, narrow, born from the tagged list.

**4. v1 — prompt with doc attached + output (~120 words, monospace exhibit).** Same task; prompt now references `voice-doc.md`. Output is shorter, mostly in voice. Two slips planted: an em-dash creeps back into the subject line; "the piece I'm most curious about" is precious phrasing the doc didn't anticipate.

**5. Pass 2: audit + codify again (~150 words).** Tagged list of what slipped through. One rule was too loose (em-dashes — needs to cover subject lines). One new tell needs naming (precious openers). The artifact grows in monospace — two tightened rules, one new rule.

**6. v2 — final output (~100 words, monospace exhibit).** Same task, grown doc attached. Output reads in the prompter's voice — flat, specific, no hedges, no em-dashes, no precious phrasing. The transformation is visible side-by-side with v0.

**7. The artifact, complete (~80 words framing + the full `voice-doc.md` in monospace).** The lift-and-adapt block. One sentence on what just happened: two passes, an artifact that grew from six rules to nine, now portable across chats.

**8. Footer.** `*Related: [[building-your-own-skill]] · [[iterating-on-prompts]] · [[reading-the-output]]*`

### Voice constraints

- AI-tells live inside exhibit blocks; the page voice itself never falters.
- Tag vocabulary glossed inline on first use. The reader sees the tag and learns its meaning in the same sentence.
- No moral closer. The page ends with the artifact and the footer.

### Worked-example details

- **Scenario.** A mutual friend (Sara) introduced the prompter to a contact (Marcus) at another company. The prompter owes a thanks-and-follow-up email. The task is voice-heavy and recognizable across non-coder roles.
- **Prompter's voice (target for v2).** Flat, specific, low-hedge, no marketing language. Matches the hub's voice register so v2 reads like the hub.
- **Tells loaded into v0.** Em-dashes (≥2), `not X, but Y` reversal, `synergies`, filler-third tricolon, `looking forward to it`, `It's refreshing.` (staccato moral closer), `really exciting`, `genuinely impressed`.
- **Tells planted in v1.** One rule-violation (em-dash in subject line); one new tell not covered by the v1 doc (`the piece I'm most curious about` — precious-opener).
- **Final artifact size.** ~9 rules organized under headings: forbidden words, openers, structure, em-dashes, hedging.

## Cross-link updates to existing pages

Eight existing files need edits to integrate the new cluster — five content pages plus `start-here.md`, `README.md`, and the hub spec. Most are one-sentence additions; one content-page edit (`when-workflows-graduate.md`) is a small body change.

| File | Change | Risk |
|---|---|---|
| `how-not-to-produce-ai-slop.md` | Add one sentence to closing "What this hub is for" section: when the same corrective recurs, codifying it is the next move → `[[building-your-own-skill]]`. | Low. Slop is the load-bearing example; the addition extends its reach without changing the page's spine. |
| `2-how-to-talk-to-them/iterating-on-prompts.md` | Footer: add `[[building-your-own-skill]]`. Body: one sentence noting that iterating on the *same* correction across chats means the iteration has moved up a level. | Low. |
| `4-building-workflows/personal-workflows.md` | Closing paragraph already names the graduation moment for templates. Parallel addition: when the *correction* recurs, see `[[building-your-own-skill]]`. | Low. |
| `4-building-workflows/when-workflows-graduate.md` | Currently the abrupt end of Section 4. Update so the rung exists: chat is still the right shape if the work is codifying corrections → `[[building-your-own-skill]]`; chat outgrown → harness link. | Medium. Only existing page with a meaningful body change. Re-run voice scan after edit. |
| `2-how-to-talk-to-them/reading-the-output.md` | Footer: add `[[building-your-own-skill]]`. No body change. | Low. |
| `start-here.md` | Insert new pages in the recommended reading order, after Section 4 / before the harness handoff. | Low. |
| `README.md` | Cross-cutting page list goes from 3 to 5. | Low. |
| `spec-ai-literacy-hub.md` | Cross-cutting page list (lines 142-146) and hub structure summary (line 211, "15 main + 3 cross-cutting") need updating. | Higher trust — spec is source of truth. Treat as a separate, explicit step in the implementation plan. |

## Authoring rules

The cluster inherits all rules from `spec-ai-literacy-hub.md` and `_meta/review-checklist.md`. Specific to this work:

- Each page is reviewed against `_meta/review-checklist.md` before commit.
- AI-tells in Page 2 exhibits are scoped to monospace blocks and clearly framed as bad-voice specimens.
- Tag vocabulary in Page 2 (`#tell`, `#filler-third`, etc.) is glossed inline on first use; the reader learns the term and the meaning together.
- Cross-link edits to existing pages are minimal in scope; voice scan is re-run on `when-workflows-graduate.md` only (the one page with a body change).
- Spec doc update (`spec-ai-literacy-hub.md`) is a separate commit from the content additions.

## Out of scope for this cluster

- Worked examples beyond writing (research, summarizing, planning). Future work; the `examples/` subfolder is sized for them.
- Platform-specific guidance (how to attach a doc in Claude Projects vs. Custom GPT vs. Gemini Gems). The Apply step in the loop names the platforms generically; specifics belong in `4-building-workflows/which-tool-when.md` if anywhere.
- Excalidraw diagrams. Both pages carry their visual weight via tables, monospace blocks, and tagged lists. A diagram is not load-bearing here.
- Linter or mechanical enforcement on the voice-doc artifact. The hub's discipline is editorial, not mechanical (per `spec-ai-literacy-hub.md` non-goals).

## Open questions

- [ ] Page 1's "what the artifact looks like" section uses a generic skeleton (forbidden words, pacing, openers). Should it instead show a stub of the *actual* `voice-doc.md` from the walkthrough, to give the reader a thread to pull on? Lean: keep generic on Page 1, specific on Page 2 — the method page should not depend on the worked example for concreteness.
- [ ] `start-here.md` placement of the new pages. Three reasonable positions: (a) after slop and before Section 1; (b) after Section 4 and before harness handoff; (c) both — slop+building-your-own-skill paired at the front, walkthrough deferred to after Section 4. Lean: (b). The reader gains the most from the cluster after they have run prompts and seen the iterative pattern themselves.
- [ ] Tag glosses on Page 2 — gloss every tag on first use, or pick a representative subset and link to `_meta/review-checklist.md` for the rest? Lean: gloss every tag actually used in the walkthrough (likely 5-6 of them). Anything beyond that is reference, not pedagogy.

## Rollout

1. Land this spec.
2. Create `examples/` subfolder.
3. Draft Page 1 (`building-your-own-skill.md`). Review against `_meta/review-checklist.md`. Commit.
4. Draft Page 2 (`examples/the-writing-skill-walkthrough.md`). Review against `_meta/review-checklist.md`. Commit.
5. Apply cross-link edits to the seven content and navigation files (slop, iterating-on-prompts, personal-workflows, when-workflows-graduate, reading-the-output, start-here, README). Re-run voice scan on `when-workflows-graduate.md` specifically. Commit as one batch or per-file; either works.
6. Update `spec-ai-literacy-hub.md` cross-cutting page list and structure summary. Separate commit.
7. Resolve open questions during drafting; record resolutions in commit messages.

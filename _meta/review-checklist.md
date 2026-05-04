---
title: Review Checklist
created: 2026-04-30
updated: 2026-05-03
status: active
tags: [meta, review]
---

# Universal Review Checklist

Every page must satisfy every applicable item before commit.

## Voice — page level (calibrated against `how-not-to-produce-ai-slop.md`)

- [ ] Standards-definition register, not personal-blog register.
- [ ] Second-person ("you", "the reader") and third-person ("the prompter", "the artifact") dominate. First-person rare and only where personal experience is the substance.
- [ ] Openings are rhetorical questions or direct claims. No "In this section, I'll explain…" or "This page covers…".
- [ ] Uncertainty expressed via scoped claims ("for non-engineers", "in most cases"). No hedges ("I think", "it might be").
- [ ] No filler words: `essentially`, `basically`, `simply`, `just`, `obviously`.
- [ ] No marketing voice: `robust`, `seamless`, `powerful`, `cutting-edge`.
- [ ] No condescension to non-technical readers.
- [ ] No fearmongering.
- [ ] No tool tribalism outside Section 4.

## Voice — sentence level

Patterns that read as machine-written. Each item is a checkbox to clear; flag instances even when they sound clever.

- [ ] **Technical depth calibrated to the reader.** No implementation jargon (`stochastic`, `by construction`, `non-deterministic`, `conditions on`, `logits`, `temperature`) unless the page is explicitly teaching the term. If the reader can use the concept without the term, cut it.
- [ ] **No rhetorical reversals.** Patterns like *"Treat that as X, not a Y,"* *"It's a feature, not a bug,"* *"These look like UI decisions. They are not."* Cut or restructure with an em-dash.
- [ ] **No definitional asides.** *"by construction,"* *"by design,"* *"in essence,"* *"fundamentally"* — almost always filler standing in for a claim the sentence already made.
- [ ] **No hollow imperatives.** *"Treat that as a property to engineer around"* with no concrete next action. Either follow with the action the reader takes, or cut.
- [ ] **No restate sentences.** A sentence that reframes the previous one in different words. If removing it does not change what the page communicates, remove it.
- [ ] **No moral-of-the-story closers.** When the preceding sentences already establish the practical implication, a sentence that names the moral is filler. The test: if the reader can act on the prior sentences without a follow-up, cut the follow-up. Distinct from restate (which reframes a specific prior sentence) and from hollow imperative (which gives an action without specifics) — this catches the case where a closer extracts a moral the paragraph has already earned.
- [ ] **No staccato runs.** Three short sentences in a row reads as machine-written. Break the rhythm with a longer connecting clause.
- [ ] **No twin-fragment hedges.** *"Often X. Sometimes Y."* / *"Sometimes X. Sometimes Y."* — when two consecutive fragments qualify the same claim from opposite sides, they are a single point dressed as two. Combine into the prior sentence, or pick the sharper of the two. Distinct from staccato (which counts at three) and from punch-pair (which names distinct beats — *"Generic voice. Generic claims."*).
- [ ] **No filler-third-beat.** Three-item lists where item three restates items one and two. Drop to two items.
- [ ] **No "two patterns run through the table" scaffolding.** Lead with the pattern itself, not the announcement that one exists.
- [ ] **No frontmatter-date hedges in body prose.** *"Snapshot, early 2026. Check the frontmatter date."* The frontmatter does that job.
- [ ] **Source analogies, don't invent.** When Karpathy / Willison / Mollick / Anthropic / etc. use an analogy in our cited sources, prefer theirs with attribution. Manufactured analogies (*"think of it as a chef who…"*) read as forced.
- [ ] **Examples follow abstract claims.** When the prose makes an abstract claim, the next move is a concrete instance the reader can picture — not another abstract restatement.
- [ ] **Mentor voice over reportage.** A mentor tells the reader why a thing matters and what to do with it. Reportage states facts and stops. Every paragraph that names a property of the model owes the reader the practical consequence.
- [ ] **No ornamental verbs / metaphor-stacks.** Direct verbs over literary ones — *"copy"* not *"ferry"*, *"appear"* not *"surface"*, *"compete"* not *"sit buried"*, *"is most skeptical"* not *"trusts least"*. Flag any sentence that piles two or more figurative phrases (e.g., *"friction signals fire constantly"* + *"data ferried by hand"* + *"chat-shaped interface has run out"*). Sourced analogies (Karpathy's RAM, Willison's calculator-for-words, Mollick's jagged frontier) are exempt.
- [ ] **No personification of artifacts.** Reports, prompts, prose, and outputs do not *want, earn, deserve, or belong to* anyone. Name the actor (the reader, the prompter, the model) and use plain verbs.
- [ ] **No subject–verb interruption with em-dash lists.** The shape *"X — three or more examples — verb"* is a recognizable LLM cadence even at one occurrence, because it interrupts the natural sentence rhythm to insert a list. Prefer: split into two sentences, use parentheses, or relocate the list to a new sentence. Em-dash inserts are reserved for genuine asides where the interrupter changes the meaning, not for examples that could just as well sit in the next sentence.
- [ ] **Em-dash density.** No more than two em-dashes per paragraph. No two consecutive sentences both using em-dash pairs. Em-dash should signal a strong aside or appositive — when a comma, colon, period, or parenthesis would work as well, prefer those.
- [ ] **Sentence stands alone.** A reader picking up any sentence in isolation should extract its main claim without reaching back to import a metaphor, idiom, or coinage from a prior paragraph. The test: read each sentence with no surrounding context. If the meaning depends on tracking a phrase like *"the line," "the chatbot side," "across the boundary,"* or any coined noun phrase introduced earlier, rewrite to state the claim directly. Three sub-patterns this rule catches:

  **A. Unearned metaphor (`#unearned-metaphor`).** A metaphor — usually geometric or motion-based — gets introduced and then reused as a load-bearing referent, as if it were a defined term.

  > *Bad:* "Below that line, the system is a chatbot, whatever its marketing page calls it."
  >
  > *Better:* "Tools that lack those three capabilities are chatbots, even when the vendor markets them as 'agents.'"

  Why: *"the line"* and *"below it"* force the reader to track the geometric metaphor. The literal version states the threshold directly.

  **B. Packed idiom (`#packed-idiom`).** A short phrase compresses a multi-step claim into idiomatic shorthand. Reads as clever; requires the reader to unpack a hidden argument.

  > *Bad:* "Stepping over the line is a noticing problem, not an access problem."
  >
  > *Better:* "The agent-side features listed above are in their tools already, sitting unused until a task calls for them: work that touches multiple apps, branches on intermediate results, or repeats often enough to be worth saving."

  Why: *"noticing problem, not access problem"* compresses the claim *"you already have these features; what's missing is recognizing when they apply."* The unpacked version states it directly. Also clears the X-not-Y reversal and the geometric *"line."*

  **C. Load-bearing coinage (`#load-bearing-coinage`).** A coined noun phrase (*"the chatbot side," "agent-shaped"*) gets used as if it were a defined concept. The reader has to construct its meaning from context.

  > *Bad:* "A reader who has only typed into the chat box has been on the chatbot side by default."
  >
  > *Better:* "Most readers have only typed into the chat box."

  Why: *"chatbot side"* is a coined term the reader has to internalize. The plain version drops the coinage and makes the same observation.

  **Diagnostic underneath all three:** the writer wrote a sentence that depends on the reader carrying earlier phrasing forward. The fix is to write the sentence so it carries its own meaning.

### Tag vocabulary for scans

When auditing prose against this list, use these tags so findings are directly comparable across files:

| Tag | Meaning |
|---|---|
| `#tell` | Generic LLM phrasing (rhetorical reversal, definitional aside) |
| `#restate` | Sentence reframes the previous |
| `#tech-creep` | Implementation detail the audience does not need |
| `#staccato` | Three or more short sentences in a row |
| `#twin-fragment-hedge` | Two consecutive fragments hedging the same claim from opposite sides |
| `#missing-example` | Abstract claim begging for a concrete instance |
| `#fabricated-analogy` | Invented analogy that should be sourced or cut |
| `#hollow-imperative` | *"treat that as..."* with no concrete action |
| `#moral-closer` | Closer sentence names a moral the prior sentences already imply |
| `#filler-third` | Three-beat list where the third item restates the first two |
| `#forbidden-word` | A banned word from the page-level voice list above |
| `#literary` | Ornamental verb where a plain one would work |
| `#metaphor-stack` | Two or more figurative phrases in one sentence |
| `#personification` | Artifact verbs (*the report wants, the prose flows, the output belongs*) |
| `#emdash-list-interrupt` | Subject–verb interrupted by an em-dash-flanked list (*"X — three examples — verb"*) |
| `#em-dash-overuse` | More than two em-dashes per paragraph, or consecutive em-dash sentences |
| `#unearned-metaphor` | Geometric/motion metaphor used as a load-bearing referent without definition |
| `#packed-idiom` | Short phrase compressing a multi-step claim into shorthand |
| `#load-bearing-coinage` | Coined noun phrase used as if it were a defined concept |

## Density

- [ ] Word count between 600 and 900 (exception: `when-workflows-graduate.md`, which is one paragraph).
- [ ] At least two visual elements per ~600 words from this set: table, monospace structural block, bulleted list with concrete items, Excalidraw diagram, blockquote.
- [ ] No stretch of >4 paragraphs of continuous prose without a visual break.

## Structure

- [ ] Frontmatter contains: `title`, `created`, `updated`, `status`, `tags`. Tags lowercase + hyphenated.
- [ ] Opening is a single paragraph stating the question or claim. No preview, no roadmap.
- [ ] Section headers describe the topic ("How prompts produce slop"), not the rhetorical move ("Let's now examine prompts").
- [ ] Page ends after the last substantive point. No summary conclusion.
- [ ] Footer is one italicized line of `[[Related]]` wikilinks, ≤3 entries.

## Hub integrity

- [ ] MIT study citation budget honored (track in `_meta/citation-tracker.md`, hard cap 2).
- [ ] Wikilinks resolve to existing files or are intentionally forward-pointing (later in plan).
- [ ] Within-section cross-links present and aggressive; cross-section links rare.

# AI Literacy Hub v1 Retrospective

Walk completed 2026-04-30. Hub state: 16 main pages + 3 cross-cutting (`start-here.md`, `how-not-to-produce-ai-slop.md`, `curated-links.md`) + README + 5 diagrams. All Phase 7 audits passed; one important issue surfaced (Anthropic / OpenAI source integration in Section 2 body content) and is the load-bearing v1 / v1.1 question.

## Reading the path top-to-bottom

Walking entries 1 through 17 in order, the hub teaches what it sets out to teach. The slop-aversion thesis from `how-not-to-produce-ai-slop.md` is genuinely load-bearing — by entry 5 the reader can already feel the hub's instinct to push every claim back through "did the prompter form a connection to the work." Section 1 builds the substrate (next-token prediction, calculator-for-words, why fabrication is structural, the jagged frontier) and each later section spends those concepts. Section 2 turns the mental model into prompting moves; Section 3 redraws the same machine around "what's in the window"; Section 4 is the off-ramp into tool choice and the chat-vs-agent line. The path does not feel like 17 disjoint essays — it feels like one argument with 17 turns. That cumulative effect is the hub's best move and the main thing v1 should protect.

## What's strong

- `how-not-to-produce-ai-slop.md:38, :97` — the "before LLMs / now" cost table and "would the artifact still have value if it turned out the model wrote every word?" diagnostic. The whole thesis sits in those two artifacts; later pages lean on them without restating.
- `what-llms-are.md:21-41` — inline ASCII diagram of next-token sampling with concrete probabilities. Does the work of a textbook page in twenty lines.
- `why-they-hallucinate.md:25-51` — token-by-token walkthrough of a fabricated citation, the most memorable image in Section 1. "Locally plausible at every position and globally non-existent" survives the reading.
- `what-theyre-good-and-bad-at.md:23-31` — paired-by-domain table where each row contrasts a strength and weakness inside the same domain, often by one word. Sharper than a generic strengths/weaknesses split.
- `prompt-as-thinking.md:34-54` — BEFORE/AFTER chooses the right contrast: not "one line vs. 800" but "five seconds vs. two minutes." Page argues it at line 32 and demonstrates it.
- `the-intern-frame.md:21-26` — three-column "Tell explicitly / Do not assume / Push back on" table is what makes the frame actionable rather than vibey. Pivot to the coworker reframe at line 38 works because the table did the labor first.
- `iterating-on-prompts.md:27-70` — v1/v2/v3 walkthrough is the strongest single example in the hub. "What changed across iterations was not 'longer prompt'" (line 72) lands because the reader just watched the decisions accumulate.
- `reading-the-output.md:29-36` — the smell-table arms the reader directly. "Echoed prompt vocabulary" is a smell I have not seen named this cleanly in a public source.
- `what-is-context.md:21-38, :60-71` — inside/outside-the-window code-fenced diagram + control-source mapping table. Clearest visual artifact in the hub plus the agency closer.
- `memory-and-state.md:19-24, :33` — four-feature-class table with "what it doesn't" and "what to assume" columns; the line "the model cannot distinguish a fact the user typed this turn from a fact a memory system inserted" is load-bearing.
- `which-tool-when.md:30-39` — 8-task tool matrix passes the property-anchored test cell by cell. "Strong — long pasted source" is the right level: one fit word + one property, never a vibe.
- `chatbot-vs-agent.md:46-55` — task matrix concedes "Wrong shape" and "Overkill" as real outcomes. That nuance keeps it from reading like a buying guide.
- `personal-workflows.md` — four worked examples each foreground a different failure mode (citation gating, register naming, decision-relevance, hidden assumptions) rather than running the same template four times.
- `start-here.md:15-19` — budget table (20 minutes / an hour / a weekend). Concrete reader-affordance; the note at line 21 that the short rows still pass through the load-bearing pages is good editorial honesty.

## What's weak

- `what-llms-are.md:74-82` — the "What it is not" closer with three negations duplicates `what-llms-arent.md:15-19`. A reader going page to page sees the same three category errors back to back. Trim the closer to one sentence.
- `personal-workflows.md` — borderline cross-section link density (audit 7.4). Reading in context, four cross-links do work the body offloads. Defensible as a worked-examples page; honest to name.
- `when-workflows-graduate.md` — the page does not stand alone. A reader who lands here without `chatbot-vs-agent.md`'s friction signals does not know what "the friction signals from the prior pages fire constantly" refers to. Defensible for v1; one-paragraph self-contained restatement of the signals would help in v1.1.
- The recurring `## What this is` / `## What the practice is` closer convention across `feeding-the-model.md`, `memory-and-state.md`, `reading-the-output.md`, `chats-vs-projects.md`, `personal-workflows.md`, `iterating-on-prompts.md`. Each is topic-named so the rule passes; the rhythm of the device shows by the third or fourth page. v1.1 should vary three or four of the six.
- `which-tool-when.md:53-64` — the structural template is correct but slightly redundant with `feeding-the-model.md:46-69`. One sentence connecting them ("the same shape Section 3 named, abridged for tool comparison") would land that link.

## Voice shifts

- `the-intern-frame.md:32` — "Holding the frame too tightly turns it into a self-imposed limit" is the most assertively-prescriptive paragraph in the hub. Hub elsewhere prefers naming a property and letting the reader infer; here it tells. Defensible because the page is about a frame and its limits, but it's the moment voice tilts most.
- `chatbot-vs-agent.md:14` — "Mitchell Hashimoto's working definition is the cleanest one available" is the most evaluative attribution in the hub. Other pages name a source and say what it carries; here the hub gestures at competitors it has not engaged with. Voice steps up half a register.
- `personal-workflows.md:22` — "Research with a language model is not a search — language models make poor search engines" doubles a corrective in one sentence. Elsewhere the hub asserts and moves on. Slightly defensive read.
- `when-workflows-graduate.md` — voice is correct in tone but tighter than the rest. A reader walking top to bottom may experience the brevity as abrupt. Density shift, not register shift.

## Density slips

- `feeding-the-model.md:33-38` — the "Three principles" runs three full paragraphs with no visual break between the table at line 21 and the diagram at line 39. Densest stretch in Section 3 on a phone. Bolded leading sentence per principle would match neighboring pages.
- `memory-and-state.md:36-44` — six-bullet failure-modes list is the longest unbroken bullet run in the hub. Each bullet is good; six in a row blur. Group (saved-profile vs. retrieval) or trim to four.
- `reading-the-output.md:50-56` — the "verification list vs. re-prompt list" closer buries a sharp distinction in connectives. A two-row table would land it cleaner.
- `chats-vs-projects.md:19-38` — the three-block code-fence diagram and the `chat-vs-project-state.png` embed sit back to back doing similar work. One subtractive pass would land just one.

## What's distinctive

- The slop-aversion thesis as through-line. A generic "AI for non-engineers" doc opens with capabilities and prompting tips. This hub opens with the claim that the *process* is the artifact. Every later page calibrates against it. Structurally rare.
- Mechanism-first. Most non-engineer guides hand-wave next-token prediction. This hub puts it in entry 2 with a literal token-distribution diagram, then *uses* it in every later section to explain hallucination, context-window degradation, recency bias. The reader earns the foundation and spends it.
- Property-anchored tool talk. `which-tool-when.md` and `chatbot-vs-agent.md` recommend by named property — context window size, integration surface, default output shape — never by adjective. The move that keeps the hub from aging the way a generic blog post ages.
- Reading-vs-verification distinction (`reading-the-output.md:18-21`). Most guides conflate the two. Naming reading as the upstream diagnostic that decides which claims earn the verification step is a refinement I have not seen elsewhere.
- Treating "memory" features as application behavior, not model behavior (`memory-and-state.md:11-13`). Most public material gets this backwards. The insistence on "what's in the window this turn" as the only ground truth is distinctive and durable.
- Citation discipline. Holding the MIT *Your Brain on ChatGPT* citation to two invocations and explicitly noting the discipline in `curated-links.md:34`. The hub treats citations as costs, not credentials.

## The Anthropic / OpenAI source-integration question

The audit found `curated-links.md:15-18` lists Anthropic's prompt-engineering best practices, Anthropic's *Building effective agents*, OpenAI's GPT-5 prompting guide, and OpenAI's agentic-systems governance paper, but none of those four are cited in any Section 2 body. Audit flagged `the-intern-frame.md` (Anthropic) and `iterating-on-prompts.md` / `reading-the-output.md` (OpenAI) as natural landing spots.

Editorial assessment: walking the path top-to-bottom, the Section 2 pages do not feel under-sourced — they feel synthesized. The intern frame is attributed to Mollick; the prompt-as-thinking thesis is the hub's own; the smell-table is the hub's own. If the four sources were dropped into the body now, the synthesis loosens. `the-intern-frame.md` is currently a tight argument that contrasts Mollick's frames; adding "Anthropic recommends X" could make it read like a source compendium rather than a position.

The right v1.1 move is targeted, not broad: cite Anthropic's "examples beat instructions" claim once at `prompt-as-thinking.md:19` (where the page already says "Examples outperform adjectives") to give the heuristic a public source. Cite OpenAI's audit-contradictions instinct once near the smell-table in `reading-the-output.md`. Leave the rest alone. Two surgical adds, not a chapter.

**Not a v1 blocker.** The pages stand without the citations and the synthesis is stronger for the restraint.

## Open spec questions still open

1. **Single linear path vs. three audience-split paths in `start-here.md`?** v1 closed this. `start-here.md:23-41` is a single 17-entry path with annotations, plus a budget table at lines 15-19. The lean toward single-path-for-v1 was correct. **Resolved.**

2. **AI in everyday life vs. AI at work?** Still correctly deferred. The hub as written is work-shaped end to end — every example has a deliverable, a recipient, a deadline. A personal-life angle would dilute focus and undercut the slop-aversion frame, which depends on the work having a downstream reader. Recommend keeping the deferral. **Open, defer.**

3. **Frequency of refresh?** Partially closed. Frontmatter dating + "this list will age" disclaimers (`what-theyre-good-and-bad-at.md:35`, `which-tool-when.md:28`, `chatbot-vs-agent.md:44`) build dating discipline into the hub. But no published refresh cadence anywhere. The spec's lean ("Sections 1-3 stable; Section 4 quarterly") should be made operational — one line in README is enough. **Open for v1.1.**

## v1 ship recommendation

**Yes, ship.** The hub is content-complete, internally coherent, structurally distinctive, and editorially disciplined in ways most public LLM-literacy material is not. The slop-aversion thesis is genuinely load-bearing across all 16 pages. Property-anchored tool talk holds. No page felt under-baked or off-voice on this walk.

What changes between v1 as it stands and v1.1:

- Two surgical Anthropic / OpenAI citations in Section 2 (one in `prompt-as-thinking.md`, one in `reading-the-output.md`).
- Subtractive pass on the recurring `## What this is` closer-section convention — vary three or four of the six.
- Density trim on `feeding-the-model.md:33-38` and `memory-and-state.md:36-44`.
- Published refresh cadence (one line in README).
- Optional: trim the redundant negation-list at `what-llms-are.md:74-82`.

None of those block v1. All are the kind of edit that lands cleanest after a few real readers have walked the path.

## v1.1 landed

Shipped 2026-05-01:

- Three closer-header variations: `feeding-the-model` → "The prefix is the work"; `reading-the-output` → "Reading like an editor"; `chats-vs-projects` → "The interface names the choice". `memory-and-state` and `what-is-context` kept (headers were already topic-named enough).
- `what-llms-are.md:74-82` negation list trimmed to a one-sentence forward to `what-llms-arent`. Header retitled "What follows".
- README "Refresh cadence" mini-section: Sections 1-3 stable; Section 4 quarterly; per-page `updated` is ground truth.

Deferred (logged with reasons in the prompt that landed v1.1): two surgical Anthropic / OpenAI cites in Section 2, density trims on `feeding-the-model:33-38` and `memory-and-state:36-44`, self-contained restatement of friction signals in `when-workflows-graduate`.

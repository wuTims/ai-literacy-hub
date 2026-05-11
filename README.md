---
title: AI Literacy Hub
created: 2026-04-30
updated: 2026-05-10
status: active
tags: [meta, hub-root]
---

# AI Literacy Hub

What separates a useful AI-generated artifact from slop is rarely the model. It is whether the person who prompted it stayed connected to their own work along the way — read it carefully, pushed back on it, made it their own. This hub exists to make that habit a habit for the people who use AI daily without writing code — designers, PMs, ops, customer success, students, and the friends and teammates who keep asking what to do with these tools.

The thesis is slop-aversion. Every page in the hub rests on one claim: an AI-generated artifact is only useful if the person who produced it engaged with it. Mental models, prompting, context, and tool choice all serve that habit. None of them substitute for it.

## Get the hub on your machine

The hub is designed to be read as an Obsidian vault — wikilinks resolve, the graph view works, and pages cross-navigate the way they're meant to.

1. Download the latest `.zip` from [Releases](https://github.com/wuTims/ai-literacy-hub/releases).
2. Unzip the folder anywhere on your machine.
3. Open Obsidian → **Open folder as vault** → select the unzipped folder.
4. Start with `start-here.md`.

Never used Obsidian, or want a fuller walkthrough? See [ONBOARDING.md](ONBOARDING.md).

## Audience

The reader has basic computer literacy and has used ChatGPT, Claude, or a comparable chatbot at least a few times. The reader does not write code, does not want to write code, and is not assumed to know any AI-specific vocabulary beyond the chatbot interface.

## Reading order

The pages below are in a recommended order. You can also jump
straight to any page that interests you.

If you'd like a guided walkthrough with reading-time budgets
(20 minutes, an hour, a weekend), see [[start-here]].

1. [[how-not-to-produce-ai-slop]] — what separates useful AI-generated work from slop, and the four-question test for whether you have engaged with what the model gave you.
2. [[what-llms-are]] — the one mechanism underneath everything a model does: predicting the next bit of text, one piece at a time.
3. [[what-llms-arent]] — the three tools people quietly hope a model is — search engine, database, reasoner — and the failures each expectation produces.
4. [[why-they-hallucinate]] — why fluent, confident, made-up answers come from the same machinery as fluent, confident, correct ones.
5. [[what-theyre-good-and-bad-at]] — the jagged shape of what tasks land and what tasks slide off, and a way of seeing the pattern instead of memorizing a list.
6. [[prompt-as-thinking]] — the shift from *I am asking a question* to *I am writing the first half of the reply*, and what it changes about how you write prompts.
7. [[the-intern-frame]] — onboarding a new intern as a working metaphor for the moves a good prompt has to make.
8. [[iterating-on-prompts]] — editing the prompt as editing your own thinking, with the first response treated as a probe rather than a draft.
9. [[reading-the-output]] — how to read what comes back carefully enough to catch the problems before anyone else does.
10. [[what-is-context]] — the context window as the model's working memory for this turn, and what sits inside it.
11. [[chats-vs-projects]] — how Projects, custom GPTs, and Gems all decide what gets to start each chat.
12. [[feeding-the-model]] — the curation move of choosing what goes into the window before you ask the question.
13. [[memory-and-state]] — what stays around between chats, what doesn't, and what the app quietly puts back without telling you.
14. [[which-tool-when]] — the four mainstream chat tools — Claude, ChatGPT, Gemini, Copilot — matched to non-engineering tasks by shape rather than by personality.
15. [[chatbot-vs-agent]] — one question that tells you which one you're using: does the model act between your turns?
16. [[personal-workflows]] — four worked examples — research, writing, summarizing, planning — that run the prompt-context-output cycle on real tasks.
17. [[when-workflows-graduate]] — the signal that the chat window has run out and the next move is engineering rather than prompting.

## Out of scope

- Coding instruction. The hub teaches how to think with AI, not how to build with it.
- Comprehensive coverage of every model, feature, and technique. The hub curates tightly and dates quickly when it doesn't.
- Public distribution. The hub is private-by-default; pages travel hand-to-hand.

## Refresh cadence

Sections 1–3 are stable. Section 4 (tools and workflows) ages fastest and is reviewed quarterly. The `updated` date in each page's frontmatter is the ground truth.

---

*Related: [[start-here]] · [[how-not-to-produce-ai-slop]]*

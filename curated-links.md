---
title: Curated links
created: 2026-04-30
updated: 2026-05-10
status: active
tags: [meta, references]
---

# Curated links

These are the outside sources the hub borrows from, each listed because the hub points at it for a specific idea rather than re-explaining that idea from scratch.

The blurb under each link tells you, in one sentence, what you'd get from clicking through and what part of the hub it backs up.

## Vendor docs

Official guides from the two companies whose models the hub talks about most — written for developers, but the parts the hub draws on read fine without that background.

- **Anthropic** — [Prompt engineering best practices](https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/claude-prompting-best-practices) — Where the "treat the model like a brilliant new employee" idea comes from, and where the hub's claim that showing an example beats describing one in words gets its backing.
- **Anthropic** — [Building effective agents](https://www.anthropic.com/engineering/building-effective-agents) — The names the hub uses for the five composition patterns (prompt chaining, routing, parallelization, orchestrator-workers, evaluator-optimizer), plus the working definition of workflow versus agent that Section 4 leans on.
- **OpenAI** — [GPT-5 prompting guide](https://developers.openai.com/cookbook/examples/gpt-5/gpt-5_prompting_guide) — A useful counterweight to the Anthropic guide, especially on telling the model to flag contradictions in your instructions and on dialing an agent's eagerness up or down.
- **OpenAI** — [Practices for governing agentic AI systems](https://cdn.openai.com/papers/practices-for-governing-agentic-ai-systems.pdf) — The source for the seven things you owe your users once you ship an agent: suitability, action-space limits, safe defaults, legibility, monitoring, attributability, and interruptibility.

## Industry voices

Individual writers and researchers whose framings the hub borrows — different angles, all worth following beyond what the hub quotes.

- **Andrej Karpathy** — [Intro to Large Language Models (1hr talk)](https://www.youtube.com/watch?v=zjkBMFhNj_g) — A one-hour talk that does the "what is an LLM, really" job better than most reading material, and the source for the hub's picture of an LLM as the seed of a new kind of operating system with the context window as its working memory (shortest version: his [Nov 2023 "LLM OS" tweet](https://x.com/karpathy/status/1723140519554105733)).
- **Simon Willison** — [Calculator for words](https://simonwillison.net/2023/Apr/2/calculator-for-words/) — The single best one-line frame in the hub, in two minutes of reading: an LLM is a tool for working with language, not a tool for looking up facts.
- **Simon Willison** — [Hallucinations in code are the least dangerous form of LLM mistakes](https://simonw.substack.com/p/hallucinations-in-code-are-the-least) — The argument that hallucinations in code are easy to catch because the code either runs or it doesn't — and that the truly dangerous hallucinations are the ones in writing tasks where nothing checks the answer back.
- **Simon Willison** — [Prompt injection writing](https://simonwillison.net/tags/prompt-injection/) — A running collection of posts on why mixing trusted instructions and untrusted content in the same context window is unsafe by construction.
- **Simon Willison** — [The lethal trifecta](https://simonwillison.net/2025/Jun/16/the-lethal-trifecta/) — A short, sharp piece naming the three ingredients that make an agent leaky — private data, untrusted content, and a way to send things outside — and worth reading before you wire any tool up to anything important.
- **Ethan Mollick** — [On-boarding your AI Intern](https://www.oneusefulthing.org/p/on-boarding-your-ai-intern) — The original "treat the model like an intern" piece, plus Mollick's later partial walk-back of it — that "infinitely patient new coworker who forgets everything you tell them" is closer to the truth.
- **Ethan Mollick** — [Getting started with AI: Good enough prompting](https://www.oneusefulthing.org/p/getting-started-with-ai-good-enough) — The most concrete short read on prompting for people who don't write code: name what you want, show good and bad examples, and treat the chat as a back-and-forth rather than a single shot.
- **Ethan Mollick** — *Co-Intelligence: Living and Working with AI* (2024) — A book-length take on working with AI as a partner rather than a tool, and the source of the "jagged frontier" idea — that what a model is good at versus bad at is uneven in ways that only show up when you actually try things.
- **Mitchell Hashimoto** — [My AI Adoption Journey](https://mitchellh.com/writing/my-ai-adoption-journey) — Where the hub gets the "drop the chatbot" move and the working definition of an agent (an LLM that can chat and also act on the outside world in a loop), and the moment Section 4 builds toward — the point where the chat window stops being enough.
- **Martin Fowler / Birgitta Böckeler** — [Exploring Gen AI](https://martinfowler.com/articles/exploring-gen-ai.html) — The next stop after [[when-workflows-graduate]]; the *Harness engineering for coding agent users* entries cover the engineering scaffolding the hub stops short of.

## Empirical anchor

- **MIT Media Lab** — [*Your Brain on ChatGPT* (2025)](https://www.media.mit.edu/publications/your-brain-on-chatgpt/) — The study behind the slop-aversion idea, cited sparingly in the hub because it's one preprint and the case doesn't rest on it — worth reading the source so you can decide for yourself how much weight it carries.

*Related: [[start-here]] · [[how-not-to-produce-ai-slop]]*

---
title: Curated links
created: 2026-04-30
updated: 2026-05-10
status: active
tags: [meta, references]
---

# Curated links

These are the outside sources the hub borrows from. Each one is here because the hub points at it for a specific idea, rather than re-explaining the idea from scratch. The list is opinionated rather than exhaustive — if you want to read deeper on any one section, start with the entries below.

A note on how to read this page: the short line under each link is meant to tell you, in one sentence, what you would get out of clicking through and what part of the hub it backs up. If a sentence sounds interesting, the link is probably worth your time. If it sounds like it is restating something you already feel solid on, skip it.

## Vendor docs

These are the official guides from the two companies whose models the hub talks about most. Both are written for developers, but the parts the hub draws on read fine without that background.

- **Anthropic** — [Prompt engineering best practices](https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/claude-prompting-best-practices) — Where the "treat the model like a brilliant new employee" idea comes from, and where the hub's claim that showing an example beats describing one in words gets its backing.
- **Anthropic** — [Building effective agents](https://www.anthropic.com/engineering/building-effective-agents) — The names the hub uses for the five composition patterns (prompt chaining, routing, parallelization, orchestrator-workers, evaluator-optimizer), plus the working definition of workflow versus agent that Section 4 leans on.
- **OpenAI** — [GPT-5 prompting guide](https://developers.openai.com/cookbook/examples/gpt-5/gpt-5_prompting_guide) — Useful counterweight to the Anthropic guide. Two ideas in particular: telling the model to flag contradictions in your instructions before answering, and the point that how eager an agent is to keep going is something you can dial up or down.
- **OpenAI** — [Practices for governing agentic AI systems](https://cdn.openai.com/papers/practices-for-governing-agentic-ai-systems.pdf) — The source for the seven things you owe your users once you ship an agent: suitability, action-space limits, safe defaults, legibility, monitoring, attributability, and interruptibility. Worth a skim before you put any agent in front of other people.

## Industry voices

These are individual writers and researchers whose framings the hub borrows. Different angles, all worth following beyond what the hub quotes.

- **Andrej Karpathy** — [Intro to Large Language Models (1hr talk)](https://www.youtube.com/watch?v=zjkBMFhNj_g) — A one-hour talk that does the "what is an LLM, really" job better than most reading material. It's also where the hub gets the picture of an LLM as the seed of a new kind of operating system, and the analogy that the context window is its working memory. The shortest version of the memory analogy lives in his [Nov 2023 "LLM OS" tweet](https://x.com/karpathy/status/1723140519554105733).
- **Simon Willison** — [Calculator for words](https://simonwillison.net/2023/Apr/2/calculator-for-words/) — The single best one-line frame in the hub: an LLM is a tool for working with language, not a tool for looking up facts. Two minutes of reading. Reset your expectations for the rest.
- **Simon Willison** — [Hallucinations in code are the least dangerous form of LLM mistakes](https://simonw.substack.com/p/hallucinations-in-code-are-the-least) — The argument that hallucinations in code are easy to catch because the code either runs or it doesn't — and that the truly dangerous hallucinations are the ones in writing tasks where nothing checks the answer back. Sets a useful bar for how carefully you should read non-code output.
- **Simon Willison** — [Prompt injection writing](https://simonwillison.net/tags/prompt-injection/) — A running collection of posts on why mixing trusted instructions and untrusted content in the same context window is unsafe by construction. Skim a few; the pattern repeats for a reason.
- **Simon Willison** — [The lethal trifecta](https://simonwillison.net/2025/Jun/16/the-lethal-trifecta/) — A short, sharp piece naming the three ingredients that make an agent leaky: access to private data, exposure to untrusted content, and a way to send things outside. Any agent with all three can be tricked into giving away what it knows. Read this before you wire any tool up to anything important.
- **Ethan Mollick** — [On-boarding your AI Intern](https://www.oneusefulthing.org/p/on-boarding-your-ai-intern) — The original "treat the model like an intern" piece, and Mollick's later partial walk-back of it — that "infinitely patient new coworker who forgets everything you tell them" is closer to the truth. Useful for seeing the metaphor evolve as the models did.
- **Ethan Mollick** — [Getting started with AI: Good enough prompting](https://www.oneusefulthing.org/p/getting-started-with-ai-good-enough) — The most concrete short read on prompting for people who don't write code. Name what you want, show good and bad examples, and treat the chat as a back-and-forth rather than a single shot.
- **Ethan Mollick** — *Co-Intelligence: Living and Working with AI* (2024) — A book-length take on working with AI as a partner rather than a tool, and the source of the "jagged frontier" idea — that what a model is good at versus bad at is uneven in ways that only show up when you actually try things.
- **Mitchell Hashimoto** — [My AI Adoption Journey](https://mitchellh.com/writing/my-ai-adoption-journey) — Where the hub gets the "drop the chatbot" move and the working definition of an agent — an LLM that can chat and also act on the outside world in a loop. It also names the moment Section 4 builds toward: the point where the chat window stops being enough.
- **Martin Fowler / Birgitta Böckeler** — [Exploring Gen AI](https://martinfowler.com/articles/exploring-gen-ai.html) — If you read [[when-workflows-graduate]] and want to go further, this is the next stop. The *Harness engineering for coding agent users* entries cover the engineering scaffolding the hub stops short of.

## Empirical anchor

One paper, cited sparingly inside the hub on purpose. Listed here so the link is easy to find on its own.

- **MIT Media Lab** — [*Your Brain on ChatGPT* (2025)](https://www.media.mit.edu/publications/your-brain-on-chatgpt/) — The study behind the slop-aversion idea. The hub cites it at most twice on purpose, because it's one preprint and the case doesn't rest on it. But it's worth reading the source so you can decide for yourself how much weight it carries.

*Related: [[start-here]] · [[how-not-to-produce-ai-slop]]*

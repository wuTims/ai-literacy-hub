---
title: Curated links
created: 2026-04-30
updated: 2026-04-30
status: draft
tags: [meta, references]
---

# Curated links

These are the sources the hub leans on. Each one earns its slot by carrying a specific framing the hub does not try to reproduce — paste the source, do not paraphrase it. The set is opinionated, not exhaustive.

## Vendor docs

- **Anthropic** — [Prompt engineering best practices](https://platform.claude.com/docs/en/build-with-claude/prompt-engineering/claude-prompting-best-practices) — Source for the "brilliant new employee" frame and the rule that examples beat instructions for format and tone.
- **Anthropic** — [Building effective agents](https://www.anthropic.com/engineering/building-effective-agents) — The taxonomy of composition patterns (chaining, routing, orchestrator-workers) and the workflow-vs-agent distinction Section 4 reuses.
- **OpenAI** — [GPT-5 prompting guide](https://developers.openai.com/cookbook/examples/gpt-5/gpt-5_prompting_guide) — Complement to Anthropic's prompt guide: the audit-contradictions instinct and the idea that agentic eagerness is a tunable surface, not a fixed trait.
- **OpenAI** — [Practices for governing agentic AI systems](https://cdn.openai.com/papers/practices-for-governing-agentic-ai-systems.pdf) — Source for the seven-practice frame (suitability, action-space, defaults, legibility, monitoring, attributability, interruptibility) that defines what shipping an agent makes the deployer responsible for.

## Industry voices

- **Andrej Karpathy** — [Intro to Large Language Models (Stanford talk)](https://www.youtube.com/watch?v=zjkBMFhNj_g) — Origin of the kernel-of-an-emerging-OS framing and the context-window-as-RAM analogy that anchor Section 3.
- **Simon Willison** — [Calculator for words](https://simonwillison.net/2023/Apr/2/calculator-for-words/) — The deflationary frame Section 1 leans on: an LLM is a tool for manipulating language, not a tool for retrieving facts.
- **Simon Willison** — [Hallucinations in code are the least dangerous form of LLM mistakes](https://simonw.substack.com/p/hallucinations-in-code-are-the-least) — The argument that the riskiest hallucinations are the ones in domains without a fast verification loop, which sets the bar for human review elsewhere.
- **Simon Willison** — [Prompt injection writing](https://simonwillison.net/tags/prompt-injection/) — Running corpus on why mixing trusted instructions with untrusted content is structurally unsafe, including the "lethal trifecta" criterion for agent risk.
- **Ethan Mollick** — [On-boarding your AI Intern](https://www.oneusefulthing.org/p/on-boarding-your-ai-intern) — Source for the original intern frame and the later retraction toward "infinitely patient new coworker who forgets everything you tell them."
- **Ethan Mollick** — [Getting started with AI: Good enough prompting](https://www.oneusefulthing.org/p/getting-started-with-ai-good-enough) — Concrete prompting rules for non-engineers: name the deliverable, show good and bad examples, treat the exchange as dialogue.
- **Ethan Mollick** — *Co-Intelligence: Living and Working with AI* (2024) — Book-length treatment of the centaur model and the "jagged frontier" — the observation that capability is uneven across tasks in ways only real use reveals.
- **Mitchell Hashimoto** — [My AI Adoption Journey](https://mitchellh.com/writing/my-ai-adoption-journey) — Source for the drop-the-chatbot move and the working definition of an agent as "an LLM that can chat and invoke external behavior in a loop." Anchors the chat-stops-paying signal in Section 4.
- **Martin Fowler / Birgitta Böckeler** — [Exploring Gen AI](https://martinfowler.com/articles/exploring-gen-ai.html) — Engineering-grade companion for readers who pass [[when-workflows-graduate]]; the *Harness engineering for coding agent users* entries describe the scaffolding the main path stops short of.

## Empirical anchor

- **MIT Media Lab** — *Your Brain on ChatGPT* (2025) — `[VERIFY URL]` — The empirical reference behind the slop-aversion thesis. Cited at most twice in the hub by design; listed here so readers can reach the primary source without the hub leaning on it again.

*Related: [[start-here]] · [[how-not-to-produce-ai-slop]]*

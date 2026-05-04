---
title: What LLMs are not
created: 2026-04-30
updated: 2026-05-03
status: active
tags: [foundations, mental-models]
---

# What LLMs are not

Most readers reach for an LLM expecting search, storage, or computation. It is none of those. Three different mistakes get made; each produces a recognizable failure.

## Looks like, actually

| Looks like        | Actually                                              | Failure mode                                          |
|-------------------|-------------------------------------------------------|-------------------------------------------------------|
| A search engine   | A probability machine over text it was trained on     | Made-up URLs, invented citations, plausible nonsense  |
| A database        | Lossy patterns in weights, no timestamp, no schema    | Confident answers about facts that have since changed |
| A reasoner        | Sentences that look like reasoning steps but are sampled one token at a time | Steps that look right and conclusions that don't follow |

Every row shows the same mistake: asking the model to do something other than what it does. The mechanism that produces all three is described in [[what-llms-are]]: next-token prediction, sampled from a learned distribution.

## Not a search engine

A search engine returns a pointer to a document that exists. The model returns an answer with no pointer underneath. When asked for a source, it can produce a URL, a paper title, or a court case — none of which need exist.

The symptom the reader will recognize: the model is correct, in the same tone, on topics that were heavily represented in its training data, and confidently wrong on topics that were not. There is no internal signal for whether the topic was well-represented in training or barely covered.

If the task is *find me a thing*, use search. Hand the result to the model for the work the model is good at: summarizing, restructuring, or drafting around it.

## Not a database

A database stores rows you can update. A query returns the current value. There is a schema, a timestamp, an audit trail.

A model stores patterns in weights set at training time. There is no "current"; there is only what was true on average across what the training set happened to contain.

Anything time-sensitive is unsafe by default. Pricing, leadership, scores, regulations, the version number of a library — the model cannot tell you whether what it knows is months or years out of date.

Ask a database-backed system *what was our Q3 revenue?* and you get a row, optionally with a last-edited date. Ask the model and you get a sentence containing a dollar amount — sometimes the right one, sometimes off by an order of magnitude, sometimes a number from a different company's filing in the training set. There is no row being read.

The reader's giveaway: ask the model the same factual question twice across two sessions and the answers drift. A database returns the same row each time.

## Not a classical reasoner

A classical reasoner — a calculator, a SAT solver, a database query planner — runs a procedure with intermediate state and a definite stopping condition. The model emits one token after another at roughly equal compute per token, with no internal check that a step follows from the last.

Prompting the model with *think step by step* produces text that resembles step-by-step reasoning. The resemblance can be faithful: the steps are valid and the conclusion follows. The failure mode is when the two come apart. Ask a model how much a $40 shirt costs after a 25% markdown and a further 10% off the discounted price. A typical walkthrough notes "25% off $40 leaves $30," then "10% off $30 leaves $27," then states the final price as $26 — derived by adding the discount percentages (25% + 10% = 35%) and applying that to $40. The steps and the conclusion are both token predictions; nothing forces them to agree.

Reasoning-tuned models are trained to produce longer step-by-step text before answering. The mechanism is unchanged. The same behavior produces fabrication on factual claims, for the same reason; see [[why-they-hallucinate]].

The reader's giveaway: an arithmetic answer that looks worked-through and is wrong, or a "therefore" whose last step does not follow from the previous one.

## Misuses that follow

Each category error has a recognizable shape in everyday use:

- Asking *what is our refund policy* instead of pasting the policy and asking the model to summarize it. (Database error.)
- Asking for a list of citations on a niche topic and forwarding the list. (Search-engine error.)
- Asking for a multi-step financial or legal calculation in prose and trusting the result without re-deriving it. (Reasoner error.)
- Asking what a court ruled last week, or what a stock closed at yesterday. (Database and search-engine errors stacked.)
- Asking the model to *double-check its own answer* and treating agreement as verification. (Reasoner error: sampling more text is not auditing.)

*Related: [[what-llms-are]] · [[why-they-hallucinate]] · [[how-not-to-produce-ai-slop]]*

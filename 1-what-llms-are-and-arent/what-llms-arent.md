---
title: What LLMs are not
created: 2026-04-30
updated: 2026-05-01
status: draft
tags: [foundations, mental-models]
---

# What LLMs are not

An LLM is not the kind of system most people assume it is the first time they use one. The interface invites three category errors — search engine, database, classical reasoner — and each one produces a specific failure mode that becomes obvious in daily use.

## Looks like, actually

| Looks like        | Actually                                              | Failure mode                                          |
|-------------------|-------------------------------------------------------|-------------------------------------------------------|
| A search engine   | A probability machine over text it was trained on     | Made-up URLs, invented citations, plausible nonsense  |
| A database        | Lossy patterns in weights, no timestamp, no schema    | Confident answers about facts that have since changed |
| A reasoner        | Text shaped like reasoning, generated one token at a time | Steps that look right and conclusions that don't follow |

Each row is a category error, not a model defect. The mechanism that produces all three is the same one covered in [[what-llms-are]] — next-token prediction, sampled from a learned distribution. The negations below are what that mechanism rules out.

## Not a search engine

A search engine returns a pointer to a document that exists. The model returns text shaped like an answer with no pointer underneath. When asked for a source, it can produce a URL, a paper title, or a court case — none of which need exist. The string is generated the same way the rest of the response is: by picking tokens that look like they belong in this position.

The symptom the reader will recognize: the model is correct, in the same tone, on topics that were heavily represented in its training data, and confidently wrong on topics that were not. There is no internal signal that separates *seen many times* from *extrapolating off the edge*.

The corrective is structural. If the task is *find me a thing*, use search. Then pass the thing to the model for the second half.

## Not a database

A database stores rows you can update. A query returns the current value. There is a schema, a timestamp, an audit trail.

A model stores patterns in weights set at training time. There is no "current"; there is only what was true on average across what the training set happened to contain. Two consequences follow:

- Anything time-sensitive is unsafe by default. Pricing, leadership, scores, regulations, the version number of a library — the model cannot tell you whether what it knows is months or years out of date.
- Anything specific the model "remembers" — your customer's account, your document's exact wording, the precise number from a report — is reconstruction. Often plausible. Sometimes wrong in ways that read as correct.

![[model-sees-vs-you-see.png]]

The reader's giveaway: ask the model the same factual question twice across two sessions and watch the answers drift. A database does not drift. A pattern of plausible reconstructions does.

## Not a classical reasoner

A classical reasoner — a calculator, a SAT solver, a database query planner — runs a procedure with intermediate state and a definite stopping condition. The model emits one token after another at roughly equal compute per token. There is no pause, no branch, no internal check that a step is sound before producing the next one.

Prompting the model with *think step by step* produces text that resembles step-by-step reasoning. Sometimes the resemblance is faithful: the steps are valid and the conclusion follows. Sometimes the steps look right and the final answer does not follow from them, because the final answer is also a token prediction, not a result derived from the steps above it.

Reasoning-tuned models stretch the chain — trained to think aloud at length before committing. The substrate does not change. A longer chain of plausible text is still plausible text. The same mechanism produces fabrication on factual claims — see [[why-they-hallucinate]].

The reader's giveaway: an arithmetic answer that looks worked-through and is wrong; a "therefore" whose last step does not follow from the previous one; a confident final claim despite a broken middle.

## Misuses that follow

Each category error has a recognizable shape in everyday use:

- Asking *what is our refund policy* instead of pasting the policy and asking the model to summarize it. (Database error.)
- Asking for a list of citations on a niche topic and forwarding the list. (Search-engine error.)
- Asking for a multi-step financial or legal calculation in prose and trusting the result without re-deriving it. (Reasoner error.)
- Asking what a court ruled last week, or what a stock closed at yesterday. (Database and search-engine errors stacked.)
- Asking the model to *double-check its own answer* and treating agreement as verification. (Reasoner error — sampling more text is not auditing.)

The pattern across all five: the prompter expected lookup, storage, or computation, and got language. The output reads like the thing requested. The substance underneath is something else.

## The single frame

A tool that manipulates language well is not a tool that knows things, looks them up, or thinks them through. Hold the first claim and the other three become predictable shapes of failure.

*Related: [[what-llms-are]] · [[why-they-hallucinate]] · [[how-not-to-produce-ai-slop]]*

---
title: What LLMs are not
created: 2026-04-30
updated: 2026-05-10
status: active
tags: [foundations, mental-models]
---

# What LLMs are not

Most people who open a chat with an LLM are quietly hoping it will act like one of three familiar tools: a search engine that finds them a source, a database that remembers a fact, or a calculator-like reasoner that works through a problem step by step. It is none of those things. Each of those expectations leads to a different kind of failure, and the failures are recognizable once you know what to look for.

This page walks through the three. The previous page, [[what-llms-are]], explained the one mechanism underneath all of this: the model predicts the next bit of text — the next **token** — by sampling from a learned set of probabilities, and then does it again, and again. Every failure on this page comes back to that.

## Looks like, actually

| Looks like        | Actually                                                                       | Failure mode                                          |
|-------------------|--------------------------------------------------------------------------------|-------------------------------------------------------|
| A search engine   | A next-token predictor working from text it was trained on                     | Made-up URLs, invented citations, plausible nonsense  |
| A database        | Fuzzy patterns baked into the model's **weights** at training time, with no timestamp and no schema | Confident answers about facts that have since changed |
| A reasoner        | Sentences that look like reasoning steps but are sampled one token at a time   | Steps that look right and conclusions that don't follow |

A quick word on two terms in that table. **Weights** are the numbers inside the model that got tuned during training — billions of them, adjusted nudge by nudge until the model's next-token guesses got good. **Schema** is the database word for the strict shape of stored data: this column holds a date, that column holds a dollar amount, every row has the same fields. The model has weights but no schema. There is no row to look up.

Every row in the table is the same mistake in a different costume: asking the model to do something other than predict the next token.

## Not a search engine

A search engine returns a pointer to a document that exists somewhere on the internet. You can click through and read the original. The model returns an answer with no pointer underneath it. If you ask for a source, it can produce a URL, a paper title, a court case, an author name — none of which need exist anywhere outside the sentence you just got back.

The thing to watch for: the model is correct, in the same calm tone, on topics that were heavily represented in its training data, and confidently wrong on topics that were not. There is no little light inside that flips on when the topic was well-covered and off when it was barely covered. The voice stays the same either way, which is what makes the wrong answers dangerous.

If the task is *find me a thing that exists*, use a search engine. Then hand the result to the model for the work the model is actually good at: summarizing it, restructuring it, drafting a reply around it. The model is great at moving language around once you have given it the language. It is bad at fetching things from the world.

## Not a database

A database stores rows you can update. A query returns the current value. There is a schema, a timestamp, an audit trail — you can ask not just *what is this* but *when was it last changed* and *who changed it*.

A model has none of that. It stores fuzzy patterns in its weights, fixed at the moment training finished. There is no "current value." There is only a smeared-together impression of what was true on average across whatever text the training set happened to contain, with no way to update a single fact without retraining the whole model.

That makes anything time-sensitive unsafe by default. Pricing, leadership, scores, regulations, the version number of a library, whether a feature has shipped — the model cannot tell you whether what it knows is six months old or three years old, and it will not warn you. It will just answer.

Ask a database-backed system *what was our Q3 revenue?* and you get a row back, optionally with a last-edited date next to it. Ask the model the same question and you get a sentence with a dollar amount in it — sometimes the right one, sometimes off by an order of magnitude, sometimes a number that turns out to belong to a different company whose filing happened to be in the training data. There is no row being read. There is just a plausible-sounding sentence being generated.

How you can tell: ask the model the same factual question twice in two different sessions and watch the answers drift. A database returns the same row every time. The model returns whatever its sampling lands on this round.

## Not a classical reasoner

A classical reasoner — a calculator, a SAT solver, a database query planner — runs an actual procedure. It holds intermediate state, it follows rules, it stops when it has an answer that meets the rules. The model does none of that. It emits one token, then another, with roughly the same amount of compute spent on each one, and there is no internal check that any given token follows logically from the previous tokens.

Prompting the model with *think step by step* produces text that *looks* like step-by-step reasoning. Sometimes the resemblance is faithful: each step is valid and the conclusion follows from the steps. Sometimes the resemblance is only skin-deep, and the steps and the conclusion drift apart without the model noticing.

Here is the kind of example that shows the gap. Ask a model: *how much does a $40 shirt cost after a 25% markdown, and then a further 10% off the discounted price?* A typical walkthrough looks like this:

> 25% off $40 leaves $30.
> 10% off $30 leaves $27.
> So the final price is $26.

Read the first two lines and they are right. The correct final answer is $27 — the $30 after the first discount, then 10% off that. But the model finishes by writing $26, which it got by silently switching strategies: adding the two percentages together (25% + 10% = 35%) and applying that combined 35% discount to the original $40 to get $26. That is a different (and wrong) calculation from the one the first two lines just walked through. The steps and the conclusion are *both* token predictions. Nothing in the machinery forces them to agree with each other.

Reasoning-tuned models — the ones trained to produce a long chain of "thinking" text before they give you the final answer — do the same thing for longer. The mechanism underneath has not changed. More text in front of the answer is not the same as a check that the answer is right. The same behavior shows up on factual claims too, and that is what the next page, [[why-they-hallucinate]], is about.

How you can tell: an arithmetic answer that looks fully worked-through and is wrong, or a "therefore" whose final step does not actually follow from the line above it. When the math matters, redo it yourself.

## Misuses that follow

Each mistake has a recognizable shape in everyday use:

- Asking *what is our refund policy* instead of pasting the policy in and asking the model to summarize it. (Database error.)
- Asking for a list of citations on a niche topic and forwarding the list without checking that the papers exist. (Search-engine error.)
- Asking for a multi-step financial or legal calculation in prose and trusting the result without re-deriving it on paper. (Reasoner error.)
- Asking what a court ruled last week, or what a stock closed at yesterday. (Database and search-engine errors stacked on top of each other.)
- Asking the model to *double-check its own answer* and treating its agreement as verification. (Reasoner error: sampling more text from the same model is not auditing.)

The fix in each case is the same shape: hand the model the material it needs (paste the policy, attach the document, give it the numbers), and reserve the model for the part it is good at — moving language around what you have given it.

---

← Previous: [[what-llms-are]] · Up: [[start-here]] · Next: [[why-they-hallucinate]] →

*Related: [[what-llms-are]] · [[why-they-hallucinate]] · [[how-not-to-produce-ai-slop]]*

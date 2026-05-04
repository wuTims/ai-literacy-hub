---
title: Why they hallucinate
created: 2026-04-30
updated: 2026-05-03
status: active
tags: [foundations, hallucination, mental-models]
---

# Why they hallucinate

When training data on a topic is thin, the model still produces an answer in the same fluent prose it uses on well-covered topics.

The industry settled on the word *hallucination*. The closer description is **persuasive approximation**: the model produces text shaped like an answer, with no separate check that the answer exists.

## Where fabrication comes from

Every output token is sampled from a probability distribution shaped by training. Nothing in the model marks which of those tokens come from well-covered training data and which are guesses. The model emits the most plausible-looking continuation in either case, and fluency is identical on both.

There is no internal *not sure* signal the reader can trust.

## The mechanism, step by step

Ask the model for a citation it has no real source for, and the production looks like this:

```
prompt:    "Cite a 2021 ACL paper on retrieval-augmented
            generation by an author named Chen."
                       │
                       ▼
       ┌───────────────────────────────────────────────────┐
       │ each token sampled from a learned distribution     │
       │ no separate signal for "this paper exists"         │
       └───────────────────────────────────────────────────┘
                       │
                       ▼
   token 1   "Chen"            common surname in the field
   token 2   ","               citation punctuation
   token 3   " J."             common initial
   token 4   " et al."         most ACL papers are co-authored
   token 5   " (2021)."        year was specified in the prompt
   token 6   " 'Retrieval-"    title fragment matching the topic
   token 7   "Augmented"       completes the term
   token 8   " Generation"     completes the phrase
   token 9   " for Open-"      common ACL title pattern
   token 10  "Domain QA.'"     common ACL title pattern
   token 11  " ACL 2021,"      venue matches the prompt
   token 12  " pp. 142–151."   plausible page-range shape

   output:   a citation that is locally plausible at every
             position and globally non-existent
```

Every step was the most reasonable token given everything before it. The model has no list of real papers to consult; it produces a correct citation when the paper was heavily represented in training, and a fabricated one when it was not.

## Why confidence is uncalibrated

Probability distributions inside the model are over *tokens*, not over *correctness*. The phrasing of a sentence can be highly probable in the training data even when the fact it asserts is not.

Asking the model "are you sure?" generates more text from the same machine; whether the model agrees or disagrees tells you nothing about whether the original answer was correct.

A refusal is just another candidate output the model has to rank above the alternatives — and on most prompts, fabrication wins.

## Shapes and verification

Fabrication takes recognizable shapes. Each has its own verification step.

| Shape | What it looks like | How to verify |
|---|---|---|
| Citations and URLs | Author names, paper titles, court cases, hyperlinks assembled from shapes that look right for the venue | Open the link, confirm the paper, confirm the author. A citation that resists a single click is the default to disbelieve. |
| Names of internal things | APIs, library functions, config flags, command-line options that fit the shape of the SDK | If the name is load-bearing, confirm it exists and is spelled the way the model wrote it. |
| Dates and numbers | Quarters, version numbers, prices, statistics pulled toward the most-quoted training value | Check against a primary source before the document leaves your hands. Re-derive totals and percentages from source data. |
| Quoted material | Sentences attributed to real people that the real people did not say | Trace direct quotes to the original. Rewrite paraphrases that *sound* like a quote. |
| Code that has to run | Invented method calls, hallucinated imports, fabricated config keys | Execution is the verification. Run the code; do not eyeball it. |

## Partial mitigations, not fixes

Search-augmented and retrieval-augmented setups paste real documents into the prompt before the model answers. This *reduces* fabrication on the topics the retrieved documents cover, because the model is now manipulating text the prompter supplied — the task it does well. It does not eliminate fabrication. A customer-support assistant fed the company's refund policy is unlikely to invent a refund window of "60 days" when the policy says 30 — the right number is right there. It can still misquote the conditions, blend two clauses into one, or produce a confident answer to an adjacent question the policy never addresses.

*Related: [[what-llms-are]] · [[what-llms-arent]] · [[how-not-to-produce-ai-slop]]*

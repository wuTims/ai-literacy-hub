---
title: Why they hallucinate
created: 2026-04-30
updated: 2026-04-30
status: draft
tags: [foundations, hallucination, mental-models]
---

# Why they hallucinate

Fabrication is not a bug in an LLM. It is what the mechanism does on inputs where the training signal was thin, in the same fluent surface it uses on inputs the training signal covered well.

The industry settled on the word *hallucination* — a borrowed clinical term suggesting perception gone wrong. The closer description is **persuasive approximation**: the model produces text shaped like an answer, with no separate check that the answer exists.

## Where fabrication comes from

Every output token is sampled from a probability distribution shaped by training. No second channel runs underneath to mark which regions of that distribution are well-supported and which are extrapolation. The model emits the most plausible-looking continuation in either case, and fluency is identical on both.

The load-bearing claim for the rest of the page: there is no internal *not sure* signal the reader can trust. Confidence in the output is a property of the prose, not of the underlying knowledge.

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

Every step was the most reasonable token given everything before it. Nothing in the process consulted a list of real papers, because the model has no list to consult. The same procedure produces a correct citation when the paper was heavily represented in training, and a fabricated one when it was not — fluent surface in both cases.

## Why confidence is uncalibrated

Probability distributions inside the model are over *tokens*, not over *correctness*. A token can carry probability 0.95 because the *phrasing* is highly likely in the training data, while the *fact it asserts* is unsupported. The two are unrelated.

Asking the model "are you sure?" generates more text from the same machine. Agreement is not verification; disagreement is not retraction. Both are continuations sampled the same way as every other token. A refusal — *no record of that paper* — is itself a token sequence the model must find more probable than the alternatives, and on most prompts it does not.

## Shapes fabrication takes

The same mechanism shows up in several recognizable surfaces:

- **Citations and URLs.** Author names, paper titles, court cases, hyperlinks — assembled from shapes that look right for the venue.
- **Names of internal things.** APIs, library functions, config flags, command-line options. The model knows the *shape* of an SDK and produces a method that fits.
- **Dates and numbers.** Quarters, version numbers, prices, statistics — pulled toward the most-quoted value in training.
- **Quoted material.** Sentences attributed to real people that the real people did not say.

The surface is shaped correctly. The substance underneath is generated, not retrieved.

## Practical consequences

Treating fabrication as structural turns verification into a mechanical step:

- **Citations** — open the link, confirm the paper, confirm the author. A citation that resists a single click is the default to disbelieve.
- **Dates** — any year, quarter, or version number gets checked against a primary source before it leaves the document.
- **Names** — people, papers, products, internal APIs. If the name is load-bearing, verify it exists and is spelled the way the model wrote it.
- **Quoted material** — direct quotes get traced to the original. Paraphrases that *sound* like a quote get rewritten or removed.
- **Code that has to run** — execution is the verification. An invented method throws on the first call. Run the code; do not eyeball it.
- **Numerical claims** — totals, averages, percentages. Re-derive from the source data rather than trusting the prose.

## Partial mitigations, not fixes

Search-augmented and retrieval-augmented setups paste real documents into the prompt before the model answers. This *reduces* fabrication on the topics the retrieved documents cover, because the model is now manipulating text the prompter supplied — the task it does well. It does not eliminate fabrication. The model can still produce a confident statement absent from the retrieved documents, or stitch fragments together in ways that distort the source. Retrieval is a forcing function for verification, not a replacement for it.

## What this lets the reader do

Once fabrication is understood as the mechanism running on thin signal, verification stops feeling like an indictment and becomes part of the workflow — the way an engineer reads a measurement: noted, then checked.

*Related: [[what-llms-are]] · [[what-llms-arent]] · [[how-not-to-produce-ai-slop]]*
